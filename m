Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F71663E821
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 04:02:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5F5D16C5;
	Thu,  1 Dec 2022 04:01:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5F5D16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669863738;
	bh=dhWtqFEyDC7zWbv136PzGQetITyGMuj8umn6Mv/zggM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SqEBsTKgh7AxIxloybOthWqvcFQjILjSzrF2IPkl0BmmDoZAiOcFec3DUv2qKSHyo
	 iIWcqG8Zge7ptbizQ57DK+gKOZrmfIJaOx7kU5kSyrKkotoVJ66lP/BBJA/m5+53is
	 NNjQh54AWXgn7UgFeHOfe7N3OHMSDngoqurHEsZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84DEEF804B1;
	Thu,  1 Dec 2022 04:01:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C03DCF8028D; Thu,  1 Dec 2022 04:01:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 447C3F80116
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 04:01:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 447C3F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Egyx7uTU"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="T528DOCV"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 856C45C018D;
 Wed, 30 Nov 2022 22:01:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 30 Nov 2022 22:01:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1669863665; x=1669950065; bh=XWBVwkoYld
 NlK/GqR1ak1DHTMeWXhw64yhrIsg/buos=; b=Egyx7uTU6p2Cu1OWJBs+FySuxj
 i3WAiH36+rQKW01j+EAlFaCtZ9/hDQLgzbgcAtUKjZBLjR4no4NlebdbKhoClhyo
 Py48iljF3VGUm4jXFB2bdGQGqoX4KcKjgZC9BdN+D/8TZVcurD8oGyOalh9+21PJ
 UBmVPqrlJlvxm/sWXhC5NELLqpwC7z4ZWmy1bgcyh8pPcII1Uxz//okSC3lahyn3
 YtK6gphti4uAjUml+l+biiBSl0D5cYYcR+0AMG0O0zjxG7xnwwDPng5QgHjHmjky
 FwOMsW6wsDF00uRHGINXDihGMXZxmjmXU7XmM29fKNT2Zzt+ew6J9N2/JQ5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1669863665; x=1669950065; bh=XWBVwkoYldNlK/GqR1ak1DHTMeWXhw64yhr
 Isg/buos=; b=T528DOCVXeYRAr+sOvYS5+RvwP5xSqoTkelXkrJerOGf7B9Rd20
 3SSfGKjvH2B2z7xPYX5exPJKK9EisMJCCXaI7nzIle5lLaJMtHM1BSn3vPpiznKY
 pQ/GRVdFeJoYyewDX6VSDqdvWthfhuSl7rvRG7D+6NEMhVHOgXBRMANB/ZYEUvxb
 OxOVPnCeh0rt21DKsGOIKlywL5FFrIC/ZFgbG4O+56ANZ0hKzUlFOoPA0g37xIOY
 GJReqKASwCMWpq13VQGB7725JFZ77ZdwGBT5WN3LTy3Bi/hBHEaA+FSJfskHHFm1
 Cv1c+NXyMkBD5RKTkL1uGMx6JyIBsbuznjQ==
X-ME-Sender: <xms:8BiIY4v8YfwPM81I94As3mJoMM1akdsbjoW0vXXDliOOVif5WpMeBw>
 <xme:8BiIY1eFtyA9UhyAzEHGhsT7AjzlA9lJ84Np9-90uo4rBDn56IJGVa7dolt2i80PU
 gNPSrnxCbZ_bKcHeX8>
X-ME-Received: <xmr:8BiIYzxIhCV3-ikP29LUIVkc9sIA-DNm33wHWdmx35E1CvJfuVjT4OjXmZJ2iTu0CKqsTbZ55cb7p425c353tYAphYuN2Yo-Alp6Ke-uGZeTK019HcZlNZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdeggdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepffdvueelffevke
 duhfetjeduffeghfettdfguedtgfdvgfeufeduheevheevkeeknecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
 grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:8RiIY7MVbLZ5i4dmmYU5B6aaU_45HjC_uiuCJJOkqObeshVFrolK0w>
 <xmx:8RiIY4_Tyz6xHbemUqQ716dWccjiAoCXtxOgg-LDytX1LIEWaIva0Q>
 <xmx:8RiIYzUqlmcCTgQaFPLPzSee9U2k2H3XjtO1juxA4HAaOe80SNer-Q>
 <xmx:8RiIY2kEnxA-y2I-SqHRqANpYYBlWp6W-Ki3sHmRCGR5N0Xj8MeiTg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Nov 2022 22:01:03 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: dice: Remove left-over license text
Date: Thu,  1 Dec 2022 12:01:00 +0900
Message-Id: <20221201030100.31495-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

Following a commit 1dd0dd0b1fef ("ALSA: firewire: Remove some left-over
license text in sound/firewire"), this patch removes it added carelessly.

Fixes: 2133dc91d665 ("ALSA: dice: add support for Focusrite Saffire Pro 40 with TCD3070 ASIC")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/dice/dice-focusrite.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/firewire/dice/dice-focusrite.c b/sound/firewire/dice/dice-focusrite.c
index caf9f620c5d0..ea27cfb01cc0 100644
--- a/sound/firewire/dice/dice-focusrite.c
+++ b/sound/firewire/dice/dice-focusrite.c
@@ -2,8 +2,6 @@
 // dice-focusrite.c - a part of driver for DICE based devices
 //
 // Copyright (c) 2022 Takashi Sakamoto
-//
-// Licensed under the terms of the GNU General Public License, version 2.
 
 #include "dice.h"
 
-- 
2.37.2

