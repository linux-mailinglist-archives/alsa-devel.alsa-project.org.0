Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD8715E048
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 17:13:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C451616AE;
	Fri, 14 Feb 2020 17:12:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C451616AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581696816;
	bh=YyYlLQkUZqXgIYRELPlbafV4V7OfzK9qxiM4QkFKhYA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h8EpjjhHaZjI/wSeXbcq/SWTSvEt/befInDg/65b3W+jcq49ooEXtZmcgAIob4hNt
	 0oUr3GyRuG0nmMJDcxIw/Zc6h0bnorEeEx3Td0DpXXUMU1ClPWL7bzE8UdL9I43Sfi
	 7sSu1SLNFw63FMbPduWSWGvlp/Qon9tjKK6jgqsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB873F802E0;
	Fri, 14 Feb 2020 17:08:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBE58F802E0; Fri, 14 Feb 2020 17:08:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C13FDF8019B
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 17:08:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C13FDF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="p2jRsS3K"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 601922187F;
 Fri, 14 Feb 2020 16:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696485;
 bh=jL6j0v0f9MVjx5AE0XIrGAimUcz+A06QyJSz/62WD3w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p2jRsS3KqDSa/a5UplhgDjmL01sUOrwBuqbhM8sAwTftHBjh4mRA9ESi4F3z8V/rd
 CZctFaCk+Z6gpYi3Xp5c9OzAcP4yZ6bKifocYTC2wQgciACx6vHjoZKTyR9UYboZex
 QfgeJZgCOT454JnijMwXOq3cXtWqfMy6EIwYCWWo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 14 Feb 2020 10:59:01 -0500
Message-Id: <20200214160149.11681-291-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 Alexander Tsoy <alexander@tsoy.me>, alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH AUTOSEL 5.4 291/459] ALSA: usb-audio: Add boot
	quirk for MOTU M Series
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Alexander Tsoy <alexander@tsoy.me>

[ Upstream commit 73ac9f5e5b43a5dbadb61f27dae7a971f7ec0d22 ]

Add delay to make sure that audio urbs are not sent too early.
Otherwise the device hangs. Windows driver makes ~2s delay, so use
about the same time delay value.

snd_usb_apply_boot_quirk() is called 3 times for my MOTU M4, which
is an overkill. Thus a quirk that is called only once is implemented.

Also send two vendor-specific control messages before and after
the delay. This behaviour is blindly copied from the Windows driver.

Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
Link: https://lore.kernel.org/r/20200112102358.18085-1-alexander@tsoy.me
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/card.c   |  4 ++++
 sound/usb/quirks.c | 38 ++++++++++++++++++++++++++++++++++++++
 sound/usb/quirks.h |  5 +++++
 3 files changed, 47 insertions(+)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index db91dc76cc915..e6a618a239948 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -597,6 +597,10 @@ static int usb_audio_probe(struct usb_interface *intf,
 		}
 	}
 	if (! chip) {
+		err = snd_usb_apply_boot_quirk_once(dev, intf, quirk, id);
+		if (err < 0)
+			return err;
+
 		/* it's a fresh one.
 		 * now look for an empty slot and create a new card instance
 		 */
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 82184036437b5..0464df785f2ee 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1113,6 +1113,31 @@ static int snd_usb_motu_microbookii_boot_quirk(struct usb_device *dev)
 	return err;
 }
 
+static int snd_usb_motu_m_series_boot_quirk(struct usb_device *dev)
+{
+	int ret;
+
+	if (snd_usb_pipe_sanity_check(dev, usb_sndctrlpipe(dev, 0)))
+		return -EINVAL;
+	ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
+			      1, USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+			      0x0, 0, NULL, 0, 1000);
+
+	if (ret < 0)
+		return ret;
+
+	msleep(2000);
+
+	ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
+			      1, USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+			      0x20, 0, NULL, 0, 1000);
+
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 /*
  * Setup quirks
  */
@@ -1297,6 +1322,19 @@ int snd_usb_apply_boot_quirk(struct usb_device *dev,
 	return 0;
 }
 
+int snd_usb_apply_boot_quirk_once(struct usb_device *dev,
+				  struct usb_interface *intf,
+				  const struct snd_usb_audio_quirk *quirk,
+				  unsigned int id)
+{
+	switch (id) {
+	case USB_ID(0x07fd, 0x0008): /* MOTU M Series */
+		return snd_usb_motu_m_series_boot_quirk(dev);
+	}
+
+	return 0;
+}
+
 /*
  * check if the device uses big-endian samples
  */
diff --git a/sound/usb/quirks.h b/sound/usb/quirks.h
index a80e0ddd07364..df0355843a4c1 100644
--- a/sound/usb/quirks.h
+++ b/sound/usb/quirks.h
@@ -20,6 +20,11 @@ int snd_usb_apply_boot_quirk(struct usb_device *dev,
 			     const struct snd_usb_audio_quirk *quirk,
 			     unsigned int usb_id);
 
+int snd_usb_apply_boot_quirk_once(struct usb_device *dev,
+				  struct usb_interface *intf,
+				  const struct snd_usb_audio_quirk *quirk,
+				  unsigned int usb_id);
+
 void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
 			      struct audioformat *fmt);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
