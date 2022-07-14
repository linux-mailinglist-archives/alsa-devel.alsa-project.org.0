Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC30D574387
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 06:36:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89763192A;
	Thu, 14 Jul 2022 06:35:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89763192A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657773360;
	bh=Yq4+OAykBYjQ9xMianAzkJZwCiKUJxPTc6gaUkZ7J+E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PlwaP6YtAsqoz7UXx7yYuEfEybVJbr/eOzdks5bNMC8qX9Pl5xwc8RuzN++gq5GjR
	 fA6MQbCi0vUTSmhiW8OB+oYT5K66PiovN2GVJg14o8I8yVzRfasIM1VbsFyaJtWWs5
	 1+bPrmayu7mWN03ksYaTn9PGC01KpZi56vXYjonU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F76FF8057A;
	Thu, 14 Jul 2022 06:25:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98E3BF8057D; Thu, 14 Jul 2022 06:25:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 703CAF8057D
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 06:25:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 703CAF8057D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m5ErzDG4"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0D03C61E5C;
 Thu, 14 Jul 2022 04:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D5BC34114;
 Thu, 14 Jul 2022 04:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772726;
 bh=Yq4+OAykBYjQ9xMianAzkJZwCiKUJxPTc6gaUkZ7J+E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m5ErzDG4Sw/0VlhEmu4vMf9pS8dIlgq9vaRTLHpVYNj3FsGlrNxwtR5HSkqKJoAI7
 kVY/u/r+6duYq+fSljtKxg8ImuB8IQfjWOPDf9fjCs1Pda+UsjWor8NCG0FVlKN4Fn
 0SDwQTZtSSVWvuR0lLHlc7/2CoPb1CeaaMG/+rz4y06P3IqQi88mGfuTY7U5XvOenC
 IwdfT56E3L2zYTarZyyeIatjUyYdnDcokvRsnlrFsoIMmkE4werwk2hmsJ8yWpJT70
 kQHN2KdYeaY1A17SmDi2Pc20fBz9JP3KdbiEUiIIult2DsUx0WyGiUBe9mTdm+ajte
 5UouWLBL/P7+Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 24/28] ALSA: usb-audio: Add quirks for
 MacroSilicon MS2100/MS2106 devices
Date: Thu, 14 Jul 2022 00:24:25 -0400
Message-Id: <20220714042429.281816-24-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042429.281816-1-sashal@kernel.org>
References: <20220714042429.281816-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 John Veness <john-linux@pelago.org.uk>, Takashi Iwai <tiwai@suse.de>,
 brendan@grieve.com.au, sdoregor@sdore.me, tiwai@suse.com,
 willovertonuk@gmail.com, alexander@tsoy.me, hahnjo@hahnjo.de
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

From: John Veness <john-linux@pelago.org.uk>

[ Upstream commit 6e2c9105e0b743c92a157389d40f00b81bdd09fe ]

Treat the claimed 96kHz 1ch in the descriptors as 48kHz 2ch, so that
the audio stream doesn't sound mono. Also fix initial stream
alignment, so that left and right channels are in the correct order.

Signed-off-by: John Veness <john-linux@pelago.org.uk>
Link: https://lore.kernel.org/r/20220624140757.28758-1-john-linux@pelago.org.uk
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/quirks-table.h | 48 ++++++++++++++++++++++++++++++++++++++++
 sound/usb/quirks.c       |  3 +++
 2 files changed, 51 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 4f56e1784932..853da162fd18 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3802,6 +3802,54 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 	}
 },
 
+/*
+ * MacroSilicon MS2100/MS2106 based AV capture cards
+ *
+ * These claim 96kHz 1ch in the descriptors, but are actually 48kHz 2ch.
+ * They also need QUIRK_FLAG_ALIGN_TRANSFER, which makes one wonder if
+ * they pretend to be 96kHz mono as a workaround for stereo being broken
+ * by that...
+ *
+ * They also have an issue with initial stream alignment that causes the
+ * channels to be swapped and out of phase, which is dealt with in quirks.c.
+ */
+{
+	USB_AUDIO_DEVICE(0x534d, 0x0021),
+	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
+		.vendor_name = "MacroSilicon",
+		.product_name = "MS210x",
+		.ifnum = QUIRK_ANY_INTERFACE,
+		.type = QUIRK_COMPOSITE,
+		.data = &(const struct snd_usb_audio_quirk[]) {
+			{
+				.ifnum = 2,
+				.type = QUIRK_AUDIO_STANDARD_MIXER,
+			},
+			{
+				.ifnum = 3,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S16_LE,
+					.channels = 2,
+					.iface = 3,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.attributes = 0,
+					.endpoint = 0x82,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC |
+						USB_ENDPOINT_SYNC_ASYNC,
+					.rates = SNDRV_PCM_RATE_CONTINUOUS,
+					.rate_min = 48000,
+					.rate_max = 48000,
+				}
+			},
+			{
+				.ifnum = -1
+			}
+		}
+	}
+},
+
 /*
  * MacroSilicon MS2109 based HDMI capture cards
  *
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index e8468f9b007d..a72874bc0936 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1478,6 +1478,7 @@ void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
 	case USB_ID(0x041e, 0x3f19): /* E-Mu 0204 USB */
 		set_format_emu_quirk(subs, fmt);
 		break;
+	case USB_ID(0x534d, 0x0021): /* MacroSilicon MS2100/MS2106 */
 	case USB_ID(0x534d, 0x2109): /* MacroSilicon MS2109 */
 		subs->stream_offset_adj = 2;
 		break;
@@ -1904,6 +1905,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x413c, 0xa506, /* Dell AE515 sound bar */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x534d, 0x0021, /* MacroSilicon MS2100/MS2106 */
+		   QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x534d, 0x2109, /* MacroSilicon MS2109 */
 		   QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x1224, 0x2a25, /* Jieli Technology USB PHY 2.0 */
-- 
2.35.1

