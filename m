Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD4C75A4EB
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 05:59:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3CDA4E;
	Thu, 20 Jul 2023 05:58:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3CDA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689825554;
	bh=DPO+1jg+kFrgm88k+Boug2fAcJEpuX3BKvp74i5Os1Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=m8Agv+33vvqFjKwHjjgac3ZDjXooIZydrODwycGA80J1uA+vW2wHti6tiDTCsPj1D
	 KKG9PTQQwUjgoVhtwONjjlg4H/pGjmTQCmQ8SctZG9VOgtLTeLHVetMdkvIXqQktXu
	 9jcXcNVJj0qoPYHSFBRLK6VHcgvpwmWQHuicuXUQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE986F8055B; Thu, 20 Jul 2023 05:57:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 415A6F80548;
	Thu, 20 Jul 2023 05:57:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD113F8047D; Thu, 20 Jul 2023 05:54:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id D00C3F80153
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 05:54:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D00C3F80153
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1689825246457431078-webhooks-bot@alsa-project.org>
References: <1689825246457431078-webhooks-bot@alsa-project.org>
Subject: Broken microphone switch on mtk-rt5650
Message-Id: <20230720035409.DD113F8047D@alsa1.perex.cz>
Date: Thu, 20 Jul 2023 05:54:09 +0200 (CEST)
Message-ID-Hash: 6EW5QREM5WMBNJC5S4SQT3FDIKL33ZJ6
X-Message-ID-Hash: 6EW5QREM5WMBNJC5S4SQT3FDIKL33ZJ6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6EW5QREM5WMBNJC5S4SQT3FDIKL33ZJ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #336 was edited from jenneron:

The problem is that both headphones and mic use `JackControl "Headset Jack"` When there are headphones without mic connected it switches to external mic which is not present.

In kernel there appears to be only one switch https://github.com/torvalds/linux/blob/3c8b5861850c734add65233e538d4a8c2dff95d9/sound/soc/mediatek/mt8173/mt8173-rt5650.c#L130-L135 responsible for handling both headphone and microphone. So, how is userspace supposed to distinguish connection of headset and headphones?

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/336
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
