Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96946A3CD13
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2025 00:10:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95D9260533;
	Thu, 20 Feb 2025 00:10:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95D9260533
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740006619;
	bh=GCXqZY9eW9vVuIjF2XxhxVCB5pm4G2rHyjeL0Kfa9M8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=mRvLp/NcHiHHwdFD6kqg9VhBTkBDDJVOgvOQaID9agp6bSv5it5XDHZHypIA/zlXO
	 A0sIKE/8LvBrkzfqr/Gsf65zGze5x0jma3ZyuU2q1MPdNgPAQaBrtU2o/5AWhDwT3l
	 WeXqDfrrkjd4HStJjqxtfigyp4cckw7dCTs2pApI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FDFBF805B5; Thu, 20 Feb 2025 00:09:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57150F805B5;
	Thu, 20 Feb 2025 00:09:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA6A4F8032D; Thu, 20 Feb 2025 00:09:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C5DCF8001D
	for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2025 00:09:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C5DCF8001D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1740006574637485504-webhooks-bot@alsa-project.org>
References: <1740006574637485504-webhooks-bot@alsa-project.org>
Subject: Problems with async handler
Message-Id: <20250219230936.EA6A4F8032D@alsa1.perex.cz>
Date: Thu, 20 Feb 2025 00:09:36 +0100 (CET)
Message-ID-Hash: CN3AWW22H2ZDA52EBSL7QWAN2RFP476H
X-Message-ID-Hash: CN3AWW22H2ZDA52EBSL7QWAN2RFP476H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CN3AWW22H2ZDA52EBSL7QWAN2RFP476H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #438 was edited from m-paq:

Hi, I'm currently working on a project and I'm trying to use the async handler through `snd_async_add_pcm_handler`.

I don't really understand where the issue comes from and how to debug it but I keep getting an error on this function call in my project.

To try to figure out what's wrong I went in the test files and tried to run the test file `pcm.c` and added a print of the error code (`snd_strerror`)
Compiling with: `gcc pcm.c -o test_pcm -lasound -lm`
Running it with `./test_pcm -m async`

But it keeps giving me the following output:
```
Playback device is default
Stream parameters are 44100Hz, S16_LE, 1 channels
Sine wave rate is 440.0000Hz
Using transfer method: async
Unable to register async handler Function not implemented
```
from line 434.

I am able to run it in write mode with the correct behaviour, so my question is:
**Is this an issue with the device or is it an issue somewhere else?**

If ever this is not the correct place to ask this question please refer me to a more adequate place.

Thanks to anyone that can help me!

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/438
Repository URL: https://github.com/alsa-project/alsa-lib
