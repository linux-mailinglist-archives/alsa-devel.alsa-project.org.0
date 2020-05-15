Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5671D4CF2
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 13:47:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BD36166A;
	Fri, 15 May 2020 13:47:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BD36166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589543276;
	bh=vM8WbzkE6e7/bB79BPcxTMcRyKrlOFGWGXujRNTdHeo=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QyRQdvJMM1KpbYip21vBJVo+mgHRCokFlnCTZRNyyPACK9CWMeVb9LaOhbAHD4ll3
	 SsmS8jB78PTkhNPh9gMVwbJj4EtOAq16gShPRezgbRu6tp7YnyfI9V2l8nvEx4dD6n
	 afXcCVNfIyMB7KsfQti+lXep2Ral1gv88u0cN900=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 925E9F80253;
	Fri, 15 May 2020 13:46:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07F18F80247; Fri, 15 May 2020 13:46:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bollie.ca9.eu (bollie.ca9.eu [81.169.254.190])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA72AF800B8
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 13:46:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA72AF800B8
Received: by bollie.ca9.eu (Postfix, from userid 1000)
 id 7F4D2C607D; Fri, 15 May 2020 13:46:05 +0200 (CEST)
Date: Fri, 15 May 2020 13:46:05 +0200
From: Thomas Ebeling <penguins@bollie.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: fixing upper volume limit for RME Babyface Pro routing
 crosspoints.
Message-ID: <20200515114556.vtspnonzvp4xp44m@bollie.ca9.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Cc: tiwai@suse.com
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

In my initial patch, these were set too low.

Signed-off-by: Thomas Ebeling <penguins@bollie.de>
---
 sound/usb/mixer_quirks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index bdff8674942e..aad2683ff793 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2191,7 +2191,7 @@ static int snd_rme_controls_create(struct usb_mixer_interface *mixer)
  * These devices exposes a couple of DSP functions via request to EP0.
  * Switches are available via control registers, while routing is controlled
  * by controlling the volume on each possible crossing point.
- * Volume control is linear, from -inf (dec. 0) to +6dB (dec. 46341) with
+ * Volume control is linear, from -inf (dec. 0) to +6dB (dec. 65536) with
  * 0dB being at dec. 32768.
  */
 enum {
@@ -2220,7 +2220,7 @@ enum {
 #define SND_BBFPRO_MIXER_VAL_MASK 0x3ffff
 #define SND_BBFPRO_MIXER_VAL_SHIFT 9
 #define SND_BBFPRO_MIXER_VAL_MIN 0 // -inf
-#define SND_BBFPRO_MIXER_VAL_MAX 46341 // +6dB
+#define SND_BBFPRO_MIXER_VAL_MAX 65536 // +6dB
 
 #define SND_BBFPRO_USBREQ_CTL_REG1 0x10
 #define SND_BBFPRO_USBREQ_CTL_REG2 0x17
-- 
2.26.2

