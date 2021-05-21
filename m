Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C8138C1BD
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 10:25:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B598C16BA;
	Fri, 21 May 2021 10:24:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B598C16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621585538;
	bh=Xa2p/UqQVMKJIHzJEpqa9+rvg3dYCCB05j6EKOqUktQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lsw7PAN4fuvnD3OBEgVNubZ2yx/njqOG5RBjPE17rHS5dCHwhVrAILekE44P2c3KH
	 VPJpset9VOBG/fxXcDsmt4UJZ3nJLrL/75ywnaQx61QRnvWN4/nMyIC4HBSmRF8Nfi
	 jnggwtu0wDrSk85aqzFIDUK0PoT18eoeLxdu0w/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B552F8025D;
	Fri, 21 May 2021 10:23:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89505F8025D; Fri, 21 May 2021 10:23:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60C5AF8016E
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 10:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60C5AF8016E
Received: by m.b4.vu (Postfix, from userid 1000)
 id 02AB8612FB21; Fri, 21 May 2021 17:53:42 +0930 (ACST)
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 1/2] ALSA: usb-audio: scarlett2: Fix device hang with ehci-pci
Date: Fri, 21 May 2021 17:50:12 +0930
Message-Id: <66a3d05dac325d5b53e4930578e143cef1f50dbe.1621584566.git.g@b4.vu>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1621584566.git.g@b4.vu>
References: <cover.1621584566.git.g@b4.vu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Geoffrey D. Bennett" <g@b4.vu>
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

Use usb_rcvctrlpipe() not usb_sndctrlpipe() for USB control input in
the Scarlett Gen 2 mixer driver. This fixes the device hang during
initialisation when used with the ehci-pci host driver.

Fixes: 9e4d5c1be21f ("ALSA: usb-audio: Scarlett Gen 2 mixer interface")
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 560c2ade829d..dcff3e3a49f3 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -635,7 +635,7 @@ static int scarlett2_usb(
 	/* send a second message to get the response */
 
 	err = snd_usb_ctl_msg(mixer->chip->dev,
-			usb_sndctrlpipe(mixer->chip->dev, 0),
+			usb_rcvctrlpipe(mixer->chip->dev, 0),
 			SCARLETT2_USB_VENDOR_SPECIFIC_CMD_RESP,
 			USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
 			0,
-- 
2.31.1

