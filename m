Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C28391A010
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 09:11:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF4F21939;
	Thu, 27 Jun 2024 09:10:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF4F21939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719472262;
	bh=1emV9436zRDVZtPPzCpLIWQQTET9ObnwNwdtGRvp+LA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=fMDoQP9UpAEz9YvR4UQ5+25JDH/J+EItaNdXEFN0EfprW0IwUA/103Ir6zgSwIUL2
	 83Bb8lP8Xc3uxOd8gDurYnplzwNM+krCOtL5sSfPUtiyRgxFfY4vsTJixsQKcZhUJQ
	 IYG6fvAJT5pSGbJZzslihruh2G+1cCKSHkez9Axw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1E78F805A0; Thu, 27 Jun 2024 09:10:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37E04F805B0;
	Thu, 27 Jun 2024 09:10:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 098D7F80423; Thu, 27 Jun 2024 09:08:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 12CA0F800E4
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 09:06:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12CA0F800E4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1719471999078866482-webhooks-bot@alsa-project.org>
References: <1719471999078866482-webhooks-bot@alsa-project.org>
Subject: 0db0:543d Micro Star International USB Audio
Message-Id: <20240627070826.098D7F80423@alsa1.perex.cz>
Date: Thu, 27 Jun 2024 09:08:25 +0200 (CEST)
Message-ID-Hash: 6WFCP22Z4F4X25SVV5ZNO5UDHIJYSIWS
X-Message-ID-Hash: 6WFCP22Z4F4X25SVV5ZNO5UDHIJYSIWS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6WFCP22Z4F4X25SVV5ZNO5UDHIJYSIWS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #427 was opened from vividnightmare:

I have MSI TRX40 Pro 10G on Arch Linux.

alsa-ucm-conf 1.2.12-1
linux-zen 6.9.6.zen1-1

The sound device is reported with lsusb as `0db0:543d Micro Star International USB Audio`

With default configuration, all seems well until hearing 5.1/7.1 channel audio.
At this point it is realized that my 2.1 configuration is playing audio in surround mode and I'm missing virtually all of the most important sound.

After researching for a while, I've found the following to hacky-workaround? the issue:
```
90c90
<               Regex "USB((0414:a0(0e|1[0124]))|(0b05:(19(84|9[69])|1a(16|2[07]|5[23c]|97|f1)))|(0db0:(005a|124b|151f|1feb|3130|36e7|4(19c|22d|240|88c)|62a4|6c[0c]9|70d3|7696|82c7|8af7|961e|a(073|228|47c|74b)|b202|d1d7|d6e7))|(26ce:0a0[68]))"
---
>               Regex "USB((0414:a0(0e|1[0124]))|(0b05:(19(84|9[69])|1a(16|2[07]|5[23c]|97|f1)))|(0db0:(005a|124b|151f|1feb|3130|36e7|4(19c|22d|240|88c)|543d|62a4|6c[0c]9|70d3|7696|82c7|8af7|961e|a(073|228|47c|74b)|b202|d1d7|d6e7))|(26ce:0a0[68]))"
```

This adds matching under ALC4080 for my 0db0:543d.

After this I have 2.1 as well as the ability to select 5.1 or 7.1.

I have patched the alsa-ucm-conf package locally with epoch to finalize the configuration.

However, I do not know that this is the appropriate solution.  Whether my sound device is mis-identified by ALSA/UCM, misrepresented by MSI? Something else?

Please advise and perhaps this can be resolved in a way that benefits more than just myself.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/427
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
