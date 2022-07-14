Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8582574392
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 06:36:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 486CB1933;
	Thu, 14 Jul 2022 06:35:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 486CB1933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657773392;
	bh=R3lZ3NCRdBNAZR5E9UfEpe/W3lAmCfKjijCWELZQ0aY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IJtCHOq2Gw4fEefMWuWvPG44LEGwroadtK9Dlsy7yTVVcNdoINtQEEURZhNtGpLrx
	 1cg5IK5+pEp3qfMrtHHGhrM3ymgQxkb3pW0NK3ikUYmlcVNDkRzH8LU4G2ZnWUalI8
	 RRc2HyLCD7X39r1o0vIKyJv19MV/mUuge2++sItA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EC0FF80659;
	Thu, 14 Jul 2022 06:25:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 492F4F805B3; Thu, 14 Jul 2022 06:25:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE023F80659
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 06:25:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE023F80659
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jR+ObY+1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5F103B8237D;
 Thu, 14 Jul 2022 04:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE25C34114;
 Thu, 14 Jul 2022 04:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772736;
 bh=R3lZ3NCRdBNAZR5E9UfEpe/W3lAmCfKjijCWELZQ0aY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jR+ObY+1pGD/3eZKyJiapC6D47ualbpWxluTO6B5sXVsRubqa8Qp7NXO1hsvDN7cP
 iBnmtplRQcv602lMWLAH0kJVPOT+GQbpnQsSjnwuZUEbpgy23KxBufgAVUFVQQRrDq
 ma9KgdW/Ifwi9bp0RnB9E5AoPBh38uczfhiXGXpr0abV4+/LDVJdMyUdBzzuyzxams
 6eBJL01HlW+KmonzG0XECRp63o6bSuFxoq9qCt9BRFUYVo5oGICG3zRsyW4r5SkgSA
 lRk8EuOeERnElKTvO6cay6mOSJbvnx6qPWrxKgEGQnf+LjdlVZ2DqzKYCujU51RmGk
 1qgB79cguDgZQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 26/28] ALSA: usb-audio: Add quirk for Fiero SC-01
 (fw v1.0.0)
Date: Thu, 14 Jul 2022 00:24:27 -0400
Message-Id: <20220714042429.281816-26-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042429.281816-1-sashal@kernel.org>
References: <20220714042429.281816-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 john-linux@pelago.org.uk, Takashi Iwai <tiwai@suse.de>, brendan@grieve.com.au,
 Egor Vorontsov <sdoregor@sdore.me>, tiwai@suse.com, willovertonuk@gmail.com,
 alexander@tsoy.me, hahnjo@hahnjo.de
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

From: Egor Vorontsov <sdoregor@sdore.me>

[ Upstream commit 2307a0e1ca0b5c1337b37ac6302f96e017ebac3c ]

The patch applies the same quirks used for SC-01 at firmware v1.1.0 to
the ones running v1.0.0, with respect to hard-coded sample rates.

I got two more units and successfully tested the patch series with both
firmwares.

The support is now complete (not accounting ASIO).

Signed-off-by: Egor Vorontsov <sdoregor@sdore.me>
Link: https://lore.kernel.org/r/20220627100041.2861494-2-sdoregor@sdore.me
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/quirks-table.h | 132 +++++++++++++++++++++++++++++++++++++++
 sound/usb/quirks.c       |   4 ++
 2 files changed, 136 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 7067d314fecd..f93201a830b5 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -4167,6 +4167,138 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		}
 	}
 },
+{
+	/*
+	 * Fiero SC-01 (firmware v1.0.0 @ 48 kHz)
+	 */
+	USB_DEVICE(0x2b53, 0x0023),
+	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
+		.vendor_name = "Fiero",
+		.product_name = "SC-01",
+		.ifnum = QUIRK_ANY_INTERFACE,
+		.type = QUIRK_COMPOSITE,
+		.data = &(const struct snd_usb_audio_quirk[]) {
+			{
+				.ifnum = 0,
+				.type = QUIRK_AUDIO_STANDARD_INTERFACE
+			},
+			/* Playback */
+			{
+				.ifnum = 1,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S32_LE,
+					.channels = 2,
+					.fmt_bits = 24,
+					.iface = 1,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x01,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC |
+						   USB_ENDPOINT_SYNC_ASYNC,
+					.rates = SNDRV_PCM_RATE_48000,
+					.rate_min = 48000,
+					.rate_max = 48000,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) { 48000 },
+					.clock = 0x29
+				}
+			},
+			/* Capture */
+			{
+				.ifnum = 2,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S32_LE,
+					.channels = 2,
+					.fmt_bits = 24,
+					.iface = 2,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x82,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC |
+						   USB_ENDPOINT_SYNC_ASYNC |
+						   USB_ENDPOINT_USAGE_IMPLICIT_FB,
+					.rates = SNDRV_PCM_RATE_48000,
+					.rate_min = 48000,
+					.rate_max = 48000,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) { 48000 },
+					.clock = 0x29
+				}
+			},
+			{
+				.ifnum = -1
+			}
+		}
+	}
+},
+{
+	/*
+	 * Fiero SC-01 (firmware v1.0.0 @ 96 kHz)
+	 */
+	USB_DEVICE(0x2b53, 0x0024),
+	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
+		.vendor_name = "Fiero",
+		.product_name = "SC-01",
+		.ifnum = QUIRK_ANY_INTERFACE,
+		.type = QUIRK_COMPOSITE,
+		.data = &(const struct snd_usb_audio_quirk[]) {
+			{
+				.ifnum = 0,
+				.type = QUIRK_AUDIO_STANDARD_INTERFACE
+			},
+			/* Playback */
+			{
+				.ifnum = 1,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S32_LE,
+					.channels = 2,
+					.fmt_bits = 24,
+					.iface = 1,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x01,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC |
+						   USB_ENDPOINT_SYNC_ASYNC,
+					.rates = SNDRV_PCM_RATE_96000,
+					.rate_min = 96000,
+					.rate_max = 96000,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) { 96000 },
+					.clock = 0x29
+				}
+			},
+			/* Capture */
+			{
+				.ifnum = 2,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S32_LE,
+					.channels = 2,
+					.fmt_bits = 24,
+					.iface = 2,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x82,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC |
+						   USB_ENDPOINT_SYNC_ASYNC |
+						   USB_ENDPOINT_USAGE_IMPLICIT_FB,
+					.rates = SNDRV_PCM_RATE_96000,
+					.rate_min = 96000,
+					.rate_max = 96000,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) { 96000 },
+					.clock = 0x29
+				}
+			},
+			{
+				.ifnum = -1
+			}
+		}
+	}
+},
 {
 	/*
 	 * Fiero SC-01 (firmware v1.1.0)
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index d42a59609886..c4c0847a68bf 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1911,6 +1911,10 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x1224, 0x2a25, /* Jieli Technology USB PHY 2.0 */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x2b53, 0x0023, /* Fiero SC-01 (firmware v1.0.0 @ 48 kHz) */
+		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
+	DEVICE_FLG(0x2b53, 0x0024, /* Fiero SC-01 (firmware v1.0.0 @ 96 kHz) */
+		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x2b53, 0x0031, /* Fiero SC-01 (firmware v1.1.0) */
 		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 
-- 
2.35.1

