Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F63AC1681
	for <lists+alsa-devel@lfdr.de>; Fri, 23 May 2025 00:16:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 921EA601DF;
	Fri, 23 May 2025 00:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 921EA601DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747952181;
	bh=1NmJ7T/2Z7Te2axRQ8WIXpeS5nTqDxQWfH+gQyf6xXg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=nuGSh+rofeMorXsgATuHtnikmw9n/zHvdsSpU3mblAjdKxLoTzwpP9/yuGEqkHlSN
	 wS4mQt0qqbT8ie/8OoGNycpkvOSz1V1uA1zHcVNz2UlmpljDWyFbbjQ7Lkzmijusc+
	 Nlm56a5gjutbIBkQps115M3723Ek/s8OGrA1/3zU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBDC3F805E5; Fri, 23 May 2025 00:15:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2FBFF805FA;
	Fri, 23 May 2025 00:15:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF8B7F805EC; Fri, 23 May 2025 00:15:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id A5527F805E5
	for <alsa-devel@alsa-project.org>; Fri, 23 May 2025 00:15:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5527F805E5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1841f93459ea4d00-webhooks-bot@alsa-project.org>
In-Reply-To: <1841f93459e8a500-webhooks-bot@alsa-project.org>
References: <1841f93459e8a500-webhooks-bot@alsa-project.org>
Subject: snd_config_imul always produces a zero result.
Date: Fri, 23 May 2025 00:15:34 +0200 (CEST)
Message-ID-Hash: 3RX5C3VT73RQFJCZZ2JX5NKA6ECATPRE
X-Message-ID-Hash: 3RX5C3VT73RQFJCZZ2JX5NKA6ECATPRE
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3RX5C3VT73RQFJCZZ2JX5NKA6ECATPRE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #456 was edited from shanekirk:

The config function snd_config_imul always produces a zero result. This is because it delegates to snd_func_iops() to perform the iterative multiplication, which always initializes its result value to zero. Then it iteratively multiplies-assigns result against each integer in the params array, which _always_ produces zero.

This breaks any configuration that leans on "@func imul".

This can be demonstrated using this snippet of configuration...

```
test_fn
{
    @func imul
    integers [2 4 6]
}

```
...or this source code...
```
int main(int argc, char **argv)
{
    snd_config_t *pConfig = NULL;
    snd_config_top(&pConfig);

    /**
     * Setting up...
     * test_fn
     * {
     *     @func imul
     *     integers [2 4 6]
     * }
     */
    snd_config_t *pFnCS = NULL;
    snd_config_make_compound(&pFnCS, "test_fn", 0);
    snd_config_add(pConfig, pFnCS);

    snd_config_t *pFn = NULL;
    snd_config_imake_string(&pFn, "@func", "imul");
    snd_config_add(pFnCS, pFn);

    snd_config_t *pFnParams = NULL;
    snd_config_make_compound(&pFnParams, "integers", 0);
    snd_config_add(pFnCS, pFnParams);

    snd_config_t *pFnInt = NULL;
    snd_config_imake_integer(&pFnInt, "0", 2);
    snd_config_add(pFnParams, pFnInt);
    snd_config_imake_integer(&pFnInt, "1", 4);
    snd_config_add(pFnParams, pFnInt);
    snd_config_imake_integer(&pFnInt, "2", 6);
    snd_config_add(pFnParams, pFnInt);

    /**
     * Evaluating...
     */
    snd_config_evaluate(pFnCS, pConfig, NULL, NULL);
    assert(snd_config_get_type(pFnCS) == SND_CONFIG_TYPE_INTEGER);
    long result = 0;
    snd_config_get_integer(pFnCS, &result);
    assert(result == 48); // ** FAILS because result is always zero! **

    snd_config_delete(pConfig);
    return 0;
}
```

Note: If you replace "imul" above with "iadd" in either example, you'll get the result from iadd that you'd expect.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/456
Repository URL: https://github.com/alsa-project/alsa-lib
