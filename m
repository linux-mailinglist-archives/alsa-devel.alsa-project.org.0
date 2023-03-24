Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 234E96C8677
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 21:00:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 635B4E8B;
	Fri, 24 Mar 2023 20:59:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 635B4E8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679688000;
	bh=ZP5SgelNhp9dwlfmLib2ZZrHODTm7Gzam95wN/CasKU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=nY15+4hOTbfU5nt7O07+gnTsme/tkv/rSSbVdBtR1TdYC2D8hUg/RSgoM+N/e9xz7
	 RYpN2TFWisVhu1KLd4Zeh98ONL9MmBAf0kP8gl/UYBGnLURX0VZmzg2YqIkZnpzp8v
	 tuuidH/VrYSaL+xk/2K9aTmYN3d9DnOQhEMxO+l4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E270F8027B;
	Fri, 24 Mar 2023 20:59:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD600F802E8; Fri, 24 Mar 2023 20:59:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id A5A51F8024E
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 20:58:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5A51F8024E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1679687936852561712-webhooks-bot@alsa-project.org>
References: <1679687936852561712-webhooks-bot@alsa-project.org>
Subject: alsactl: add fallback for loading driver state
Message-Id: <20230324195905.DD600F802E8@alsa1.perex.cz>
Date: Fri, 24 Mar 2023 20:59:05 +0100 (CET)
Message-ID-Hash: N22KJK57FTGP4GH6KOV3ELQHTXFBVDYY
X-Message-ID-Hash: N22KJK57FTGP4GH6KOV3ELQHTXFBVDYY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N22KJK57FTGP4GH6KOV3ELQHTXFBVDYY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #197 was opened from MrCry0:

Support loading driver state from the vendor-specific pre-installed sound configuration file /usr/lib/alsa/asound.state.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/197
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/197.patch
Repository URL: https://github.com/alsa-project/alsa-utils
