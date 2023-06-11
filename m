Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3C372B149
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Jun 2023 12:03:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9611820;
	Sun, 11 Jun 2023 12:02:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9611820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686477794;
	bh=aGo37grfMOT6KU8pBDl111bh586bBdwCk24i9QdiDHw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=gc6AwjeURzGtXF31jNvWtG3zIdEtEX/ArZbU3TzUV2SetxJa1kMbTn/rZZpGEwSEA
	 4PjdJk0/RW3oAninFkNchVrrc87HD0DzD14XX9vQeCrY9hYOLIPI0TeKvbB6EC+UyD
	 5jp7c1P+dRU3H3OpQZlL+JlN2dsLrYUkkgT5aPjM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BD5EF80149; Sun, 11 Jun 2023 12:02:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BAE1CF80132;
	Sun, 11 Jun 2023 12:01:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42C3CF80149; Sun, 11 Jun 2023 12:01:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id B5C83F80130
	for <alsa-devel@alsa-project.org>; Sun, 11 Jun 2023 12:00:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5C83F80130
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1686477650840693474-webhooks-bot@alsa-project.org>
References: <1686477650840693474-webhooks-bot@alsa-project.org>
Subject: ACL897 not detecting headphone jack and not showing in pipewire sink
Message-Id: <20230611100100.42C3CF80149@alsa1.perex.cz>
Date: Sun, 11 Jun 2023 12:01:00 +0200 (CEST)
Message-ID-Hash: XNTQLIRGIEFJDFTXP23HOGJN73R7MKK6
X-Message-ID-Hash: XNTQLIRGIEFJDFTXP23HOGJN73R7MKK6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XNTQLIRGIEFJDFTXP23HOGJN73R7MKK6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #323 was opened from axet:

Hello!

I have Gigabyte Mother board with Realtek ACL897 chip. alsamixer shows "Headphone" output I can manually unmute it and fix volume.

Even if motherboard does not have jack detection for front panel (back panel jack detection works) I would like to be able to select Headphones as output in Gnome Sound.

I've told this is alsa-ucm-conf profile issue. But I have not found any related profiles in /usr/share/alsa for my device.

00:1f.3 Audio device [0403]: Intel Corporation Alder Lake-S HD Audio Controller [8086:7ad0] (rev 11

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/323
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
