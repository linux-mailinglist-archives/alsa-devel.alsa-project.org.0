Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CA374E920
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 10:30:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86AF47F4;
	Tue, 11 Jul 2023 10:29:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86AF47F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689064213;
	bh=uq0a9Vh9u3zF2f5/ehiMfmZ5WTq1bmtxMsAcOxajxOU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ZWZj0rGwvknSem96vTJ/B/PrFY3r+RVdmsZ/4R2DR/1NdbIDMwNR2lkL4o21V/HeS
	 JfQxhHTsB5A0u3pJ4sCMedUKWsQXWLyNeraEIjpBgqISy/o5SG8q/LA72gttklJg6d
	 kX0um/oqV5kWTc4E8ug0epoQE/DldnBUfQVFsImA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAC05F80249; Tue, 11 Jul 2023 10:29:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A5F2F80153;
	Tue, 11 Jul 2023 10:29:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DE07F80249; Tue, 11 Jul 2023 10:26:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 083A0F80153
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 10:26:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 083A0F80153
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1689064005771539688-webhooks-bot@alsa-project.org>
References: <1689064005771539688-webhooks-bot@alsa-project.org>
Subject: ALC4082 - ASRock Z790 PG-ITX/TB4
Message-Id: <20230711082650.9DE07F80249@alsa1.perex.cz>
Date: Tue, 11 Jul 2023 10:26:50 +0200 (CEST)
Message-ID-Hash: RWYSRWX7E3IKYO2Z7XM5PVYXL53L7TZA
X-Message-ID-Hash: RWYSRWX7E3IKYO2Z7XM5PVYXL53L7TZA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RWYSRWX7E3IKYO2Z7XM5PVYXL53L7TZA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #334 was opened from Shmob1:

I have an [ASRock Z790 PG-ITX/TB4](https://pg.asrock.com/MB/Intel/Z790%20PG-ITXTB4/index.asp) which has the `ALC4082` Realtek chipset connected over USB, that has been mentioned in a number of issues, most recently #229.

It seems the configuration changes in that issue (notably, https://github.com/hwchong/alsa-ucm-conf/commit/3ec7e6e2a61240764b77c30892f0bc56803799cc) work on my board as well, with a small modification. Unlike the Taichi boards, my Realtek audio driver is at `USB26ce:0a08`, not `USB26ce:0a06`. Making the necessary regex changes in `ALC4080-HiFi.conf` and `USB-Audio.conf` enables functionality on my board.

I am happy to make a PR to merge these changes if required.

Thanks for the great work!

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/334
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
