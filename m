Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EFA712EC9
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 23:13:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 533F61FE;
	Fri, 26 May 2023 23:12:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 533F61FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685135583;
	bh=yLAN0fb7/SLx7o9BrUk2uUB9UelVB2ogt07/y0GY7dY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=d65Zn9GHVDSGMJVFgoSLylweqLdI7g1mi5FFf7pyaLxUKjtHbTAXJb+UDtY1+kUJ6
	 HzAj838l9B0PmBDUpthAuqne8Jvb0Sf/d0JKrl+MOOAc2JqsJkn75CUg2Vlwho6dix
	 q5cy72kcY9zIDmxCWxbWXdzOCyzNVC01ymtAfx8o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC76EF8026A; Fri, 26 May 2023 23:12:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59E95F8016A;
	Fri, 26 May 2023 23:12:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD622F80249; Fri, 26 May 2023 23:12:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URI_HEX
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 96A3BF80053
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 23:12:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96A3BF80053
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1685135523595964670-webhooks-bot@alsa-project.org>
References: <1685135523595964670-webhooks-bot@alsa-project.org>
Subject: alsa-lib fails test with clang-16
Message-Id: <20230526211207.CD622F80249@alsa1.perex.cz>
Date: Fri, 26 May 2023 23:12:07 +0200 (CEST)
Message-ID-Hash: 23TADLK65HCF6ITW5LEZCGQUIKXJS55A
X-Message-ID-Hash: 23TADLK65HCF6ITW5LEZCGQUIKXJS55A
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/23TADLK65HCF6ITW5LEZCGQUIKXJS55A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #323 was opened from fsvm88:

Hello,

While building is fine, testing alsa-lib on Gentoo fails since clang-16, due to clang-16 defaulting to c99.

The problem is at `alsa-lib-1.2.8/test/oldapi.c`, in the typedef declaration, which leads to the following error:
```
alsa-lib-1.2.8/test/oldapi.c:40:6: error: incompatible function pointer types assigning to 'myfcn *' (aka 'void (*)(void *)') from 'int (*)(const snd_pcm_hw_params_t *)' (aka 'int (*)(const struct _snd_pcm_hw_params *)') [-Werror,-Wincompatible-func
        fcn = &snd_pcm_hw_params_get_access;
            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
```

[This is the Gentoo bug with all the information](https://bugs.gentoo.org/885551)

[I have created a patch based on the compiler's suggestion](https://885551.bugs.gentoo.org/attachment.cgi?id=861055), but I'm not sure if it's the right way to solve this.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/323
Repository URL: https://github.com/alsa-project/alsa-lib
