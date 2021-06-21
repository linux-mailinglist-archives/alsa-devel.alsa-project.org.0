Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 401E13AF48C
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 20:12:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C25E5168C;
	Mon, 21 Jun 2021 20:11:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C25E5168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624299129;
	bh=bJRpZyFmQkLO5CmqXWckuLYfPZKyktg3VI/MnaB1LYo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fCXbH7IYLoAeqfRE34gtGktzUY3TQa9hPHYipuNGH0kdB4uyP8aOHNP2/BbiOQMFE
	 wZS5fSrpsfWmtlc/S/VoZSov3ZITQ4mbgYx3yxRdZlPmvu/IRuMufWQIuNOxUb0DGZ
	 kr6eq3FnxRMqRuYTSge+LV+WrJDlIw/6XmBLGcBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E6E3F804ED;
	Mon, 21 Jun 2021 20:09:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E00CAF804E4; Mon, 21 Jun 2021 20:09:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8794EF80111
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 20:09:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8794EF80111
Received: by m.b4.vu (Postfix, from userid 1000)
 id 111A361E2871; Tue, 22 Jun 2021 03:39:18 +0930 (ACST)
Date: Tue, 22 Jun 2021 03:39:18 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 03/31] ALSA: usb-audio: scarlett2: Fix 6i6 Gen 2 line out
 descriptions
Message-ID: <205e5e5348f08ded0cc4da5446f604d4b91db5bf.1624294591.git.g@b4.vu>
References: <cover.1624294591.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1624294591.git.g@b4.vu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hin-Tak Leung <htl10@users.sourceforge.net>,
 Vladimir Sadovnikov <sadko4u@gmail.com>
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

There are two headphone outputs, and they map to the four analogue
outputs.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index ed89e28548c8..0b1967d93486 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -263,10 +263,10 @@ static const struct scarlett2_device_info s6i6_gen2_info = {
 	.pad_input_count = 2,
 
 	.line_out_descrs = {
-		"Monitor L",
-		"Monitor R",
-		"Headphones L",
-		"Headphones R",
+		"Headphones 1 L",
+		"Headphones 1 R",
+		"Headphones 2 L",
+		"Headphones 2 R",
 	},
 
 	.ports = {
-- 
2.31.1

