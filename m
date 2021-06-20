Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9463ADF70
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Jun 2021 18:48:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AB7916D0;
	Sun, 20 Jun 2021 18:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AB7916D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624207694;
	bh=m3Y5Http2zkTNDzXxbS46nNkf+hdngs0wdeEWu/JWIw=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fVaLffBnoYEETaP3Bu9conWZVuAHtFBoKlQGmpm58pRDqBOviSaT+TOIj0sp5IdXq
	 LBxi3oTC+Kc8tNNfqJAjxlaxsT14lyweDJWvp35C/wJFyPaEeGW4gpavx+fhpP8sWH
	 QEaRhE3Ls71UUGTYPROwA77q5MUYrLwFvwjYU5lI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 124F4F804D6;
	Sun, 20 Jun 2021 18:46:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1D9CF804D1; Sun, 20 Jun 2021 18:46:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCBA1F8016D
 for <alsa-devel@alsa-project.org>; Sun, 20 Jun 2021 18:46:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCBA1F8016D
Received: by m.b4.vu (Postfix, from userid 1000)
 id 76C7661E2877; Mon, 21 Jun 2021 02:16:22 +0930 (ACST)
Date: Mon, 21 Jun 2021 02:16:22 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 01/14] ALSA: usb-audio: scarlett2: Remove incorrect S/PDIF
 comment
Message-ID: <20210620164622.GA9155@m.b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

The 18i8 Gen 2 S/PDIF outputs are available at 192kHz, unlike
the 18i20 Gen 2. Remove the comment that says otherwise.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index a461317dc8c6..962050436a9f 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -338,10 +338,6 @@ static const struct scarlett2_device_info s18i8_gen2_info = {
 		},
 		[SCARLETT2_PORT_TYPE_SPDIF] = {
 			.id = 0x180,
-			/* S/PDIF outputs aren't available at 192kHz
-			 * but are included in the USB mux I/O
-			 * assignment message anyway
-			 */
 			.num = { 2, 2, 2, 2, 2 },
 			.src_descr = "S/PDIF %d",
 			.src_num_offset = 1,
-- 
2.31.1

