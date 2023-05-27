Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7158071343D
	for <lists+alsa-devel@lfdr.de>; Sat, 27 May 2023 13:17:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 565951F7;
	Sat, 27 May 2023 13:16:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 565951F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685186245;
	bh=VgAoxnaqTleIrePlNR0LNmvnP46qcpFWTlO+7IjBSd4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=XfMYZeSyhE7k1obx7n3xQJ67GNRXAeARW6Gq82w5C+eiAQydX8iLNBkL5/xKs/adF
	 M0S0OakbSvSAugq2BINaUapa5JPcu0ZhcYSjps7Qmd+hdXH23ErqoTfR9woyk6GKW9
	 WJwoy5b1g3fP3O8H2xr+/O+9UuiaL/VHrRlRw77g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38C4AF80557; Sat, 27 May 2023 13:15:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C920FF80542;
	Sat, 27 May 2023 13:15:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD589F80549; Sat, 27 May 2023 13:15:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C899F8024E
	for <alsa-devel@alsa-project.org>; Sat, 27 May 2023 13:15:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C899F8024E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1685186152217317343-webhooks-bot@alsa-project.org>
References: <1685186152217317343-webhooks-bot@alsa-project.org>
Subject: Matebook 11 Intel 2021; always need to manually set config in amixer
Message-Id: <20230527111553.AD589F80549@alsa1.perex.cz>
Date: Sat, 27 May 2023 13:15:53 +0200 (CEST)
Message-ID-Hash: MZJPOOIKXIJMSBTLMSQX5WI3OVLF2DOF
X-Message-ID-Hash: MZJPOOIKXIJMSBTLMSQX5WI3OVLF2DOF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MZJPOOIKXIJMSBTLMSQX5WI3OVLF2DOF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #319 was edited from TigerbyteDev:

Hey, the drivers in sof got fixed but I still need to manually set the alsa config. My microphone also isn't working, not sure why. This got investigated a bit in the other issue too.

Config:

 ```bash
amixer -c 0 cset name='Headphone Switch' on
amixer -c 0 cset name='Headphone Playback Volume' 3,3
amixer -c 0 cset name='Right Headphone Mixer Right DAC Switch' on
amixer -c 0 cset name='Left Headphone Mixer Left DAC Switch' on
amixer -c 0 cset name='DAC Playback Volume' 999,999
amixer -c 0 cset name='Headphone Mixer Volume' 999,999
amixer -c 0 cset name='Differential Mux' lin1-rin1
amixer -c 0 cset name='Differential Mux' lin2-rin2
amixer -c 0 cset name='DAC Soft Ramp Switch' off
```

Issue in SOF:
https://github.com/thesofproject/sof-bin/issues/121

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/319
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
