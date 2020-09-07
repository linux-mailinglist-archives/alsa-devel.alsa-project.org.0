Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7348925FC54
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 16:54:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F28BE1771;
	Mon,  7 Sep 2020 16:53:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F28BE1771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599490470;
	bh=MDm/x39065SOo01K6qZuV7PZJI+UXbxgaHzoKWMO8tc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nQEezPu9tl++AJsfQ63vFzc8Rgd3zeUDVeQU82mgE5Yo7twZnqRdx2gwfngtdGePu
	 /G0XAH6h/w1PxfMBdem3631fF+fcxX0G7offI1+b/jHjqgaGDMs6ImCqdhvrdHrX8G
	 MGdn733KfoDcicqyEMyU/eSfBhlM1zkLPFZRRsNQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F6F9F802DD;
	Mon,  7 Sep 2020 16:51:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA43EF802A7; Mon,  7 Sep 2020 16:51:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5950F800FD
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 16:51:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5950F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tNZrtEWO"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8AEA12177B;
 Mon,  7 Sep 2020 14:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599490269;
 bh=MDm/x39065SOo01K6qZuV7PZJI+UXbxgaHzoKWMO8tc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tNZrtEWO45CRF+E/OrbMnOHpLv6PCX/TNkRXj1BARuZF1Ju9YXW3C/eh95H133hvx
 TZEBI66qkmXv8rHm5cCT1r2WvSZ70JTVlrj+0rsnHajlpnOJ5/cd2KH0SbUel4og6U
 cfnz8gsno2H98HW+mHktnzmjDSF9q4uQwOFl+ISo=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: himadrispandya@gmail.com,
	dvyukov@google.com,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 11/11] ALSA: remove calls to usb_pipe_type_check for
 control endpoints
Date: Mon,  7 Sep 2020 16:51:08 +0200
Message-Id: <20200907145108.3766613-12-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907145108.3766613-1-gregkh@linuxfoundation.org>
References: <20200907145108.3766613-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, johan.hedberg@gmail.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, marcel@holtmann.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, stern@rowland.harvard.ed,
 linux-bluetooth@vger.kernel.org, Alexander Tsoy <alexander@tsoy.me>,
 Alan Stern <stern@rowland.harvard.edu>
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

A USB device will always haev a bi-directional endpoint 0, that's just
how the devices work, so no need to check for that in a few quirk tests
as it will always pass.

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Alexander Tsoy <alexander@tsoy.me>
Cc: alsa-devel@alsa-project.org
Reported-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2:
 - new patch, was not in v1 series, suggested by Alan.

 sound/usb/quirks.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index fc3aab04a0bc..35da4aa918c7 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -875,8 +875,6 @@ static int snd_usb_nativeinstruments_boot_quirk(struct usb_device *dev)
 {
 	int ret;
 
-	if (usb_pipe_type_check(dev, usb_sndctrlpipe(dev, 0)))
-		return -EINVAL;
 	ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
 				  0xaf, USB_TYPE_VENDOR | USB_RECIP_DEVICE,
 				  1, 0, NULL, 0, 1000);
@@ -984,8 +982,6 @@ static int snd_usb_axefx3_boot_quirk(struct usb_device *dev)
 
 	dev_dbg(&dev->dev, "Waiting for Axe-Fx III to boot up...\n");
 
-	if (usb_pipe_type_check(dev, usb_sndctrlpipe(dev, 0)))
-		return -EINVAL;
 	/* If the Axe-Fx III has not fully booted, it will timeout when trying
 	 * to enable the audio streaming interface. A more generous timeout is
 	 * used here to detect when the Axe-Fx III has finished booting as the
@@ -1117,8 +1113,6 @@ static int snd_usb_motu_m_series_boot_quirk(struct usb_device *dev)
 {
 	int ret;
 
-	if (usb_pipe_type_check(dev, usb_sndctrlpipe(dev, 0)))
-		return -EINVAL;
 	ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
 			      1, USB_TYPE_VENDOR | USB_RECIP_DEVICE,
 			      0x0, 0, NULL, 0, 1000);
-- 
2.28.0

