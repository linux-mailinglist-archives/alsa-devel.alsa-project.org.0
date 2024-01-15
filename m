Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B9C82DB40
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jan 2024 15:26:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 908F27F1;
	Mon, 15 Jan 2024 15:26:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 908F27F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705328801;
	bh=zlXmaE4u1Vtm1Qr1vn2b44Ctjj0dxY7n9gy7lTbKKko=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=O6P9R4dqftfCtWBTKVJvgSggPVqysLaVvLSs1nzPYskcZq3+Snac9KcAta0cTT+Ty
	 pUkHEMAravRCh7BdkOw4tPiritn2n7Fo5owiwOAorEek0vLW8z5wndtqQHy9BMIJGg
	 puSi4VZ3rromNsQTTNLt9EPBY+p6d5BWQzrrORVE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60ED3F8057C; Mon, 15 Jan 2024 15:26:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E10EF804E7;
	Mon, 15 Jan 2024 15:26:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4EB7F801F5; Mon, 15 Jan 2024 15:26:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id EA252F800C1
	for <alsa-devel@alsa-project.org>; Mon, 15 Jan 2024 15:26:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA252F800C1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1705328758102237940-webhooks-bot@alsa-project.org>
References: <1705328758102237940-webhooks-bot@alsa-project.org>
Subject: Qcom volume fixes
Message-Id: <20240115142604.D4EB7F801F5@alsa1.perex.cz>
Date: Mon, 15 Jan 2024 15:26:04 +0100 (CET)
Message-ID-Hash: ZOGQCKKFTIMPDWJ3E5HUN7EUFWWRU2SJ
X-Message-ID-Hash: ZOGQCKKFTIMPDWJ3E5HUN7EUFWWRU2SJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZOGQCKKFTIMPDWJ3E5HUN7EUFWWRU2SJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #382 was opened from jhovold:

Fix the Qualcomm sc8280xp and x1e80100 configurations which accidentally left the Speaker and Headphones mixer controls undefined so that the sounds server falls back to software mixing. Also set the default volume levels in machine specific BootSequences so that the user can override the defaults.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/382
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/382.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
