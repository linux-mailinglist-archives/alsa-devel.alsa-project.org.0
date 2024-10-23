Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D33359AC8E3
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2024 13:26:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0872950;
	Wed, 23 Oct 2024 13:26:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0872950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729682795;
	bh=g1k/i8Jxs0dggbCshAMhxFG1R9KY55hoRNlBTaDSBKY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=oxuWMUtZbaaxui4/Wb1JBscpCv9XZVax0hfBA+kSVy44VTo5QGQz2vevCYq2UVo90
	 YX03wtORY5Dd7vmLRnDnPvLFi7xXz82glQxNjwGYrPRITsigEp9FTOtvexI/YfvW8G
	 ybDcBmY5S8F/kYrENCUQdqyQwPNAt1FTpKb7voZY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71D8CF80272; Wed, 23 Oct 2024 13:26:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC7C0F805B1;
	Wed, 23 Oct 2024 13:26:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2297F8016C; Wed, 23 Oct 2024 13:25:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 27B9DF8014C
	for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2024 13:25:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27B9DF8014C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1729682754629787922-webhooks-bot@alsa-project.org>
References: <1729682754629787922-webhooks-bot@alsa-project.org>
Subject: ALC4080 onboard audio support on the MSI X870 Tomahawk motherboard
Message-Id: <20241023112556.C2297F8016C@alsa1.perex.cz>
Date: Wed, 23 Oct 2024 13:25:56 +0200 (CEST)
Message-ID-Hash: CCKM3YTQY2AY7R4NPJKEZCQFO7O7HGUK
X-Message-ID-Hash: CCKM3YTQY2AY7R4NPJKEZCQFO7O7HGUK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CCKM3YTQY2AY7R4NPJKEZCQFO7O7HGUK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #455 was opened from nfp0:

@perexg As mentioned [here](https://github.com/alsa-project/alsa-ucm-conf/issues/447#issuecomment-2431686575), it seems the ALC4080 audio on the new MSI X870 Tomahawk motherboard is not supported.

USB ID is `0db0:cd0e`

I have tested adding `cd0e` on the `USB-Audio.conf` file like so:
```
Regex "USB((0414:a0(0e|1[0124]))|(0b05:(19(84|9[69])|1a(16|2[07]|5[23c]|97|f1)))|(0db0:(cd0e|005a|124b|151f|1feb|3130|36e7|4(19c|22d|240|88c)|62a4|6c[0c]9|70d3|7696|82c7|8af7|961e|a(073|228|47c|74b)|b202|d1d7|d6e7))|(26ce:0a0[68]))"
```

With this, the microphone now seems to be correctly mapped and works. But the problem is that it's volume is way too low.
It is set to 100% in both KDE and alsamixer (it's the Line one).

![image](https://github.com/user-attachments/assets/034e8f45-9e17-4338-9c1b-fda0b56dae29)

How can I help solve this problem? Should I open a separate issue?

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/455
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
