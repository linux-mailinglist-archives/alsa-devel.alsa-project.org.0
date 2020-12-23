Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C12412E1263
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 03:23:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ED8D17C8;
	Wed, 23 Dec 2020 03:22:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ED8D17C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608690215;
	bh=r6ATr39LdH2Wgn+rfcjhGAkUmoykTGGDmnds48iQwYI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WVq9KTxTu7V5bZtcKjY6rNBC6A5RidXX1z9bt39+rhEH9dHurEpI23GdCJuhke5Il
	 oOguoPBVXo+DlbyGF9DEMvl8aJMW0BM6Im0gmm93vAxCco6ZmFE76ybJ7AP+L51tEu
	 HoBRggU+KdKgI4ucDjVINPGDMbP/jJ38Z4WfNbcI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 543ACF8013F;
	Wed, 23 Dec 2020 03:22:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6258DF804C2; Wed, 23 Dec 2020 03:21:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BB72F801EB
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 03:21:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BB72F801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OVynjc+O"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C0F522573;
 Wed, 23 Dec 2020 02:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608690108;
 bh=r6ATr39LdH2Wgn+rfcjhGAkUmoykTGGDmnds48iQwYI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OVynjc+Omiou4avRIXun5Elr4dAom1Is/6bOLTK1ItvqXlNK4/b/CPYtjTLPmJH2V
 +/mI5Jt9who0NTXaq42rx1tSL24uwy4S8m82qD37mAt1mtW/Bl0ua6HvVFhyNycU8u
 tUAYqkn3qq6D2dQUiqIdQOWAJD6cAUe40DWPG06BwBBevFqzT0XhUbI1LxIANfm+GH
 AYm0x1rdlfKZNLdpOsvmoDJJtX/Gc/nvN3BakH7W6blSA0tWX4XrW9ctWP3uKCBjoK
 1bvXdNtA3uEOWz0VQC7P0teNY7ni9F6UlkYamVtkLUz2wKp3nS7AA8uC1O/95jxPFh
 btKlO2YmdCemQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 37/87] ALSA: usb-audio: Don't call
 usb_set_interface() at trigger callback
Date: Tue, 22 Dec 2020 21:20:13 -0500
Message-Id: <20201223022103.2792705-37-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223022103.2792705-1-sashal@kernel.org>
References: <20201223022103.2792705-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Dylan Robinson <dylan_robinson@motu.com>,
 Keith Milner <kamilner@superlative.org>
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

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit 4974b7950929e4a28d4eaee48e4ad07f168ac132 ]

The PCM trigger callback is atomic, hence we must not call a function
like usb_set_interface() there.  Calling it from there would lead to a
kernel Oops.

Fix it by moving the usb_set_interface() call to set_sync_endpoint().

Also, apply the snd_usb_set_interface_quirk() for consistency, too.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Link: https://lore.kernel.org/r/20201123085347.19667-3-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/pcm.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index e4d2fcc89c306..5ff51c2983a19 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -243,21 +243,6 @@ static int start_endpoints(struct snd_usb_substream *subs)
 	    !test_and_set_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags)) {
 		struct snd_usb_endpoint *ep = subs->sync_endpoint;
 
-		if (subs->data_endpoint->iface != subs->sync_endpoint->iface ||
-		    subs->data_endpoint->altsetting != subs->sync_endpoint->altsetting) {
-			err = usb_set_interface(subs->dev,
-						subs->sync_endpoint->iface,
-						subs->sync_endpoint->altsetting);
-			if (err < 0) {
-				clear_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags);
-				dev_err(&subs->dev->dev,
-					   "%d:%d: cannot set interface (%d)\n",
-					   subs->sync_endpoint->iface,
-					   subs->sync_endpoint->altsetting, err);
-				return -EIO;
-			}
-		}
-
 		dev_dbg(&subs->dev->dev, "Starting sync EP @%p\n", ep);
 
 		ep->sync_slave = subs->data_endpoint;
@@ -501,6 +486,19 @@ static int set_sync_endpoint(struct snd_usb_substream *subs,
 
 	subs->data_endpoint->sync_master = subs->sync_endpoint;
 
+	if (subs->data_endpoint->iface != subs->sync_endpoint->iface ||
+	    subs->data_endpoint->altsetting != subs->sync_endpoint->altsetting) {
+		err = usb_set_interface(subs->dev,
+					subs->sync_endpoint->iface,
+					subs->sync_endpoint->altsetting);
+		if (err < 0)
+			return err;
+		dev_dbg(&dev->dev, "setting usb interface %d:%d\n",
+			subs->sync_endpoint->iface,
+			subs->sync_endpoint->altsetting);
+		snd_usb_set_interface_quirk(dev);
+	}
+
 	return 0;
 }
 
-- 
2.27.0

