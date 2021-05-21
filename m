Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7259238C86F
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 15:39:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E125416A3;
	Fri, 21 May 2021 15:38:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E125416A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621604370;
	bh=Iyc54z2GL+y1O/CEr+PlPVkGPRLHa2YqH4M20ibrNpo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NU4eLPDPx8THWjwU1/dvdk6iD17pVaVszzAFu8CYbGcmSF03G8HcCWBdbHz+gqn8R
	 Bv6euvG1TBVWSlJ0mkQaLHWY45QD33Xt+1NsmO1W3RhXUD1Z16BBH9Gpi8Ja2rkQkc
	 C/GW+YvYt9TncOpnnfA/Y7Jtz4zB94zsq5C5GYlA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43011F8016E;
	Fri, 21 May 2021 15:38:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A18C9F801DB; Fri, 21 May 2021 15:37:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5C81F80153
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 15:37:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5C81F80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="s6SEzprv"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 218C3610CB;
 Fri, 21 May 2021 13:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621604272;
 bh=Iyc54z2GL+y1O/CEr+PlPVkGPRLHa2YqH4M20ibrNpo=;
 h=From:To:Cc:Subject:Date:From;
 b=s6SEzprvCGMKKMNV6Q8mk1MmEvbc0U5Dy4KNagStbTUmpirTUiuXaYeWlXOL2hIe/
 +1gJImR5q0D7msX4YN+/IXgkMCe8ke3dHBraCC1omlrE9UwcVsc/TKojXUtM9YChNg
 8QekZeLdXWNuEaPit5s9efY89T6TLbL2QXVCZ4hDFnvSXxvadVT0gtkAOOtRxSenkP
 xrNzKMxszjeoZxGRrSrOCzRUeepn5S4Fbg5Mc2F3yB4Sa7ORv7jxFMFT97T03DVgpC
 0UFX0yragJgGvh5ZxDr3rG4l8RxSim7uvdvpI5k3DREYAZavJC1ObN4bWQPXw5qqI9
 /D9eJStattLgw==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1lk5Ld-0004ig-5f; Fri, 21 May 2021 15:37:53 +0200
From: Johan Hovold <johan@kernel.org>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: usb-audio: fix control-request direction
Date: Fri, 21 May 2021 15:37:42 +0200
Message-Id: <20210521133742.18098-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Johan Hovold <johan@kernel.org>, "Geoffrey D. Bennett" <g@b4.vu>
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

The direction of the pipe argument must match the request-type direction
bit or control requests may fail depending on the host-controller-driver
implementation.

Fix the UAC2_CS_CUR request which erroneously used usb_sndctrlpipe().

Fixes: 93db51d06b32 ("ALSA: usb-audio: Check valid altsetting at parsing rates for UAC2/3")
Cc: stable@vger.kernel.org      # 5.10
Signed-off-by: Johan Hovold <johan@kernel.org>
---

There's a related bug in sound/usb/mixer_scarlett_gen2.c, which
Geoffrey reported and said he was preparing a patch for here:

	https://lore.kernel.org/r/20210520180819.GA95348@m.b4.vu

Johan


 sound/usb/format.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index e6ff317a6785..2287f8c65315 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -436,7 +436,7 @@ static bool check_valid_altsetting_v2v3(struct snd_usb_audio *chip, int iface,
 	if (snd_BUG_ON(altsetting >= 64 - 8))
 		return false;
 
-	err = snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0), UAC2_CS_CUR,
+	err = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0), UAC2_CS_CUR,
 			      USB_TYPE_CLASS | USB_RECIP_INTERFACE | USB_DIR_IN,
 			      UAC2_AS_VAL_ALT_SETTINGS << 8,
 			      iface, &raw_data, sizeof(raw_data));
-- 
2.26.3

