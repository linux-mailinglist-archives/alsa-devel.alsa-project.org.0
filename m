Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76840787710
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 19:27:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AD8E83E;
	Thu, 24 Aug 2023 19:26:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AD8E83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692898019;
	bh=OB0dLZiCVs1F2iF75bsCw77FNSnStN3LgEA4GNTdOBs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=YxasumLwDpavO7FaRBYoVt29tDPKkKJrf2uLQ89TpXfVdNKZVzY3w5CdDwH0iStl1
	 R+QDb50tN1qRmlKHZPkBQq6P4umpj/QwvkbI2o5nb9gVecNR/aj+WhBjJaJ9QvihOt
	 P9lKh8a6Atfl6Bi4UHMl1A5CPhpTO6W//xOmEc5g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91509F804DA; Thu, 24 Aug 2023 19:26:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0364F800F5;
	Thu, 24 Aug 2023 19:26:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73AFFF80158; Thu, 24 Aug 2023 19:26:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C6C5F800AE
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 19:25:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C6C5F800AE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1692897957308318377-webhooks-bot@alsa-project.org>
References: <1692897957308318377-webhooks-bot@alsa-project.org>
Subject: TOSLINK output on Asus Strix B650E-I GAMING WIFI
Message-Id: <20230824172603.73AFFF80158@alsa1.perex.cz>
Date: Thu, 24 Aug 2023 19:26:03 +0200 (CEST)
Message-ID-Hash: YBDSQBMUPZL6JUSBW2A2C2PBCJ7YKCK2
X-Message-ID-Hash: YBDSQBMUPZL6JUSBW2A2C2PBCJ7YKCK2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YBDSQBMUPZL6JUSBW2A2C2PBCJ7YKCK2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #342 was opened from nakedape69:

UCM seems to set the wrong device for digital output to TOSLINK (optical S/PDIF) on this card. It sets SpdifPCM "hw:${CardId},3" which renders no sound at all.
Changing it to SpdifPCM "hw:${CardId},2" makes it work.

alsa-info output attached:

[alsa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/12431959/alsa-info.txt)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/342
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
