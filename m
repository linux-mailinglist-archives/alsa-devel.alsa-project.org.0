Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD9E57431E
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 06:30:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18CFA18A6;
	Thu, 14 Jul 2022 06:29:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18CFA18A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657773042;
	bh=4I+WRiPzBjwV0G9wDCU33RqIzOOfegthaq5dsSyHFGI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U7E6109tpSwg+uwrUBlzNscIgQt7PFF2IKYc9HY0VEj3Q08WpN0cnwwGMgnue8shE
	 /34IeyCBJQ7lnKUaCm+mxa+C9AAkclaqOUtEkvS4vtamsEbVMguVgWXA/k3ll2PmH1
	 FWKbqMdtRV1Q9XHZPJtX5dyOi8fTLU5mPBBsnCYE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA2ACF80604;
	Thu, 14 Jul 2022 06:24:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49D17F80608; Thu, 14 Jul 2022 06:24:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15E64F80551
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 06:23:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15E64F80551
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DfkJAD3Q"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 725D2B82377;
 Thu, 14 Jul 2022 04:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C00EC34114;
 Thu, 14 Jul 2022 04:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772631;
 bh=4I+WRiPzBjwV0G9wDCU33RqIzOOfegthaq5dsSyHFGI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DfkJAD3QMdDmxGS3H89RoGWXIsjdV4SRrLjmV64ZUbmlWG8dBG0YRmJ4xWrTAW2ff
 dJ/nybz6XUpGWCLOa85olScvLOqDMWjR9LSr9tt2EpWHBJ8NHPwWhE8KfJUEhg6E9x
 Zxo80H6oEHsJXm0FVzFoQUJTM9g0QfW3Pbjbmhkx5vEU1eOJoQUVELCezgSU8cq3a8
 +s8kF23iYvjF8mse6Io9w7LrTe7Zs2KannVBIYHdU/uZ/aOsNQ/W94eFFajwPAd3NS
 oEkJ+cF6OJuvRYdNasZRgURxuJnzQdyj+Hz0R5j6KHcbhF5b1ETd8sugIbVOdrBYsD
 RiMXWWQKjyYOA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 34/41] ALSA: usb-audio: Add quirk for Fiero SC-01
Date: Thu, 14 Jul 2022 00:22:14 -0400
Message-Id: <20220714042221.281187-34-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042221.281187-1-sashal@kernel.org>
References: <20220714042221.281187-1-sashal@kernel.org>
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

[ Upstream commit 4fb7c24f69c48fdc02ea7858dbd5a60ff08bf7e5 ]

Fiero SC-01 is a USB sound card with two mono inputs and a single
stereo output. The inputs are composed into a single stereo stream.

The device uses a vendor-provided driver on Windows and does not work
at all without it. The driver mostly provides ASIO functionality, but
also alters the way the sound card is queried for sample rates and
clocks.

ALSA queries those failing with an EPIPE (same as Windows 10 does).
Presumably, the vendor-provided driver does not query it at all, simply
matching by VID:PID. Thus, I consider this a buggy firmware and adhere
to a set of fixed endpoint quirks instead.

The soundcard has an internal clock. Implicit feedback mode is required
for the playback.

I have updated my device to v1.1.0 from a Windows 10 VM using a vendor-
provided binary prior to the development, hoping for it to just begin
working. The device provides no obvious way to downgrade the firmware,
and regardless, there's no binary available for v1.0.0 anyway.

Thus, I will be getting another unit to extend the patch with support
for that. Expected to be a simple copy-paste of the existing one,
though.

There were no previous reports of that device in context of Linux
anywhere. Other issues have been reported though, but that's out of the
scope.

Signed-off-by: Egor Vorontsov <sdoregor@sdore.me>
Link: https://lore.kernel.org/r/20220627100041.2861494-1-sdoregor@sdore.me
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/quirks-table.h | 68 ++++++++++++++++++++++++++++++++++++++++
 sound/usb/quirks.c       |  2 ++
 2 files changed, 70 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 853da162fd18..7067d314fecd 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -4167,6 +4167,74 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		}
 	}
 },
+{
+	/*
+	 * Fiero SC-01 (firmware v1.1.0)
+	 */
+	USB_DEVICE(0x2b53, 0x0031),
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
+					.rates = SNDRV_PCM_RATE_48000 |
+						 SNDRV_PCM_RATE_96000,
+					.rate_min = 48000,
+					.rate_max = 96000,
+					.nr_rates = 2,
+					.rate_table = (unsigned int[]) { 48000, 96000 },
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
+					.rates = SNDRV_PCM_RATE_48000 |
+						 SNDRV_PCM_RATE_96000,
+					.rate_min = 48000,
+					.rate_max = 96000,
+					.nr_rates = 2,
+					.rate_table = (unsigned int[]) { 48000, 96000 },
+					.clock = 0x29
+				}
+			},
+			{
+				.ifnum = -1
+			}
+		}
+	}
+},
 
 #undef USB_DEVICE_VENDOR_SPEC
 #undef USB_AUDIO_DEVICE
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index a72874bc0936..d42a59609886 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1911,6 +1911,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x1224, 0x2a25, /* Jieli Technology USB PHY 2.0 */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x2b53, 0x0031, /* Fiero SC-01 (firmware v1.1.0) */
+		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 
 	/* Vendor matches */
 	VENDOR_FLG(0x045e, /* MS Lifecam */
-- 
2.35.1

