Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5394C6A8528
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Mar 2023 16:31:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F09661F7;
	Thu,  2 Mar 2023 16:31:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F09661F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677771112;
	bh=+riG0KCTAcHbv0ub8bZfqdnguGAyvmajP8pgod34K9o=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Pqa7aikZh5H5U+YDIhwZVWrBtqu/a9nre6ueYP9VsPPetGH/gxzIIHVg/13PMCNwm
	 iL3k7DWS+RiQYm2oCPo9n8bj3NQmDMipLHh6K78Ja0FUrj8f2tz9955X/MSqeXsV2S
	 X3ruR9b8zeQmJPWXnPF6dmJvH97OePD9x9At9Eug=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A91AF8025A;
	Thu,  2 Mar 2023 16:31:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04061F80266; Thu,  2 Mar 2023 16:30:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 49064F800DF
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 16:30:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49064F800DF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1677771052531403542-webhooks-bot@alsa-project.org>
References: <1677771052531403542-webhooks-bot@alsa-project.org>
Subject: ALC4080 on MSI PRO X670-P WIFI
Message-Id: <20230302153056.04061F80266@alsa1.perex.cz>
Date: Thu,  2 Mar 2023 16:30:56 +0100 (CET)
Message-ID-Hash: 3U4RINESV2DGGMDMIJG3CQP653IGCBWK
X-Message-ID-Hash: 3U4RINESV2DGGMDMIJG3CQP653IGCBWK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3U4RINESV2DGGMDMIJG3CQP653IGCBWK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #285 was opened from Onyx47:

Hello!

I have the board from the title. Out of the box, the audio does not work at all, however the following change to 
`alsa/ucm2/USB-Audio/USB-Audio.conf` gets the rear panel working:

```
Regex "USB((0414:a00e)|(0b05:(1996|1a(16|2[07])))|(0db0(005a|151f|1feb|419c|82c7|a073|a47c|b202|d6e7|3130)))"
```

(USB id of the card is `0db0:3130`, just added `3130` to the regex).

No luck on the front panel however, tried following some discussions and figuring it out to make a complete patch on my own but it's way over my head :)

Here is my `alsa-info` output: http://alsa-project.org/db/?f=22aed0d76705b354a59364e6e8e41a4fde20e4da

Let me know if there is any other info I need to provide.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/285
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
