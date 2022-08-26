Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 840375A3247
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Aug 2022 00:57:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD138162F;
	Sat, 27 Aug 2022 00:56:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD138162F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661554669;
	bh=ENZYTD7Czthu+WPsBupdCQXLyXodAcu8lXuPSArddzQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TIXM2jCULCEOT6GxEXddI+mTqDZ9/j7X85Z1STrkEZAHyhs0Rq/KpZ2ITz8abQ8Q6
	 h155HEV94bz+WkxN7IAV6CsSna5KMa8/ST202FAnHh7u5jLNVzQpVyRllDRuhFQq9l
	 mYK2pnAqdSQZNnhfzbr0f3W0lc5yUVnoJy+I/9as=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20651F8032D;
	Sat, 27 Aug 2022 00:56:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AA42F80238; Sat, 27 Aug 2022 00:56:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B5563F80105
 for <alsa-devel@alsa-project.org>; Sat, 27 Aug 2022 00:56:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5563F80105
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1661554606155276060-webhooks-bot@alsa-project.org>
References: <1661554606155276060-webhooks-bot@alsa-project.org>
Subject: Update USB-Audio.conf
Message-Id: <20220826225649.3AA42F80238@alsa1.perex.cz>
Date: Sat, 27 Aug 2022 00:56:49 +0200 (CEST)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #206 was opened from RomanAverin:

Fix for ALC4080 (ASUS ROG Strix B660-F Gaming WiFi)

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/206
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/206.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
