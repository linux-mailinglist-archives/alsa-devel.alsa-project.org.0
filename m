Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D93281E84F5
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 19:35:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 811A7178C;
	Fri, 29 May 2020 19:34:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 811A7178C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590773703;
	bh=Nyj1wEZ4VBa6F7GDK+qz0CPVXigRNQdEEEFcXe0PuzA=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KBGI1QyVKuUeNfVLNUKJSl44nzPpFDLZFBL3YA7rtHLlsczTfjD7wEDoe2HsRFaSv
	 r7rdd8lvLuNCHlDy6xbHC/KBvSb3T1QE6EL9ofEL0Z5t9GUDEKzdMYk4UgJsqbkd41
	 24TpgCvHpO8zZhisfmtnkNExjqLXbDps62chrgPk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9548CF8016F;
	Fri, 29 May 2020 19:33:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FF5CF8014E; Fri, 29 May 2020 19:33:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bollie.ca9.eu (bollie.ca9.eu
 [IPv6:2a01:238:439b:aa00:6132:efc3:700a:5a2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96E7FF80107
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 19:33:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96E7FF80107
Received: by bollie.ca9.eu (Postfix, from userid 1000)
 id E0A04C616F; Fri, 29 May 2020 19:32:56 +0200 (CEST)
Date: Fri, 29 May 2020 19:32:56 +0200
From: Thomas Ebeling <penguins@bollie.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: Fixing usage of plain int instead of NULL
Message-ID: <20200529173248.zzawijfvw73kzjxt@bollie.ca9.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Cc: Takashi Iwai <tiwai@suse.com>
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

As reported by kbuild test robot, mixer quirks for RME Babyface
Pro used plain integer instead of NULL.

Signed-off-by: Thomas Ebeling <penguins@bollie.de>
Reported-by: kbuild test robot <lkp@intel.com>
---
 sound/usb/mixer_quirks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index aad2683ff793..b6bcf2f92383 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2255,7 +2255,7 @@ static int snd_bbfpro_ctl_update(struct usb_mixer_interface *mixer, u8 reg,
 	err = snd_usb_ctl_msg(chip->dev,
 			      usb_sndctrlpipe(chip->dev, 0), usb_req,
 			      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
-			      usb_val, usb_idx, 0, 0);
+			      usb_val, usb_idx, NULL, 0);
 
 	snd_usb_unlock_shutdown(chip);
 	return err;
@@ -2394,7 +2394,7 @@ static int snd_bbfpro_vol_update(struct usb_mixer_interface *mixer, u16 index,
 			      SND_BBFPRO_USBREQ_MIXER,
 			      USB_DIR_OUT | USB_TYPE_VENDOR |
 			      USB_RECIP_DEVICE,
-			      usb_val, usb_idx, 0, 0);
+			      usb_val, usb_idx, NULL, 0);
 
 	snd_usb_unlock_shutdown(chip);
 	return err;
-- 
2.26.2

