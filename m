Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47809373FFD
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 18:33:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 892D1169F;
	Wed,  5 May 2021 18:32:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 892D1169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620232388;
	bh=ao/O+HGnhxyGgjd2MiUDJb/o4Y21qQRTpFo5rO609IY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u0INY0jxvh671UQWg1QdXy9SCoswQd1oxhnea8OT/2e6zhVuKt76xRhV9Zqt0BthF
	 vNRiKLsoeTtcuCx8OnsBKOedMi0o2IxFUnZkkplvc0wJ8lMmwLJgtOgBwwgInjz//7
	 7xr5P/AeCOzvLS3OUd5Fa/97BvWiEdDzv87jNC/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 155D4F80268;
	Wed,  5 May 2021 18:31:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B54CAF8025F; Wed,  5 May 2021 18:31:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC095F80163
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 18:31:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC095F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KYz8CIVj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id EFC39613B3;
 Wed,  5 May 2021 16:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232288;
 bh=ao/O+HGnhxyGgjd2MiUDJb/o4Y21qQRTpFo5rO609IY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KYz8CIVjVeybOBYYzIWD584dh6uteQwD7Tm7Uslt3F1vOOfqAwip4JxGCxAPkE8Vz
 WqZ4zE1YwJ++EFhdDyJaZ6txwxDb+LcJGA28btWxmIe6w8fkYBEXUqiTTek9PmAC/+
 riwHa724t3QbOA5Bp0d5RHbFaCxHReTrSzN7m/GDlcsPDxFs0zTzPQunfVgtsI/F0v
 HyHMH2VhkP3I7Lh2SvxOcoQtsHI5AYtEwbrJe9zdNN7JjHRfzhvBHAnoM2ku5BSY8P
 Q28zbmaqursJTYNMpQSWs0OLniR4CJLuJh1T6fwqiZenZkgCrib+yexWqZJbpc5+WW
 TCTJQ63NS/wnw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 002/116] ALSA: usb-audio: Add Pioneer DJM-850 to
 quirks-table
Date: Wed,  5 May 2021 12:29:30 -0400
Message-Id: <20210505163125.3460440-2-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163125.3460440-1-sashal@kernel.org>
References: <20210505163125.3460440-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Nicolas MURE <nicolas.mure2019@gmail.com>
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

From: Nicolas MURE <nicolas.mure2019@gmail.com>

[ Upstream commit a3c30b0cb6d05f5bf66d1a5d42e876f31753a447 ]

Declare the Pioneer DJM-850 interfaces for capture and playback.

See https://github.com/nm2107/Pioneer-DJM-850-driver-reverse-engineering/blob/172fb9a61055960c88c67b7c416fe5bf3609807b/doc/usb-device-specifications.md
for the complete device spec.

Signed-off-by: Nicolas MURE <nicolas.mure2019@gmail.com>
Link: https://lore.kernel.org/r/20210301152729.18094-2-nicolas.mure2019@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/quirks-table.h | 63 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 1165a5ac60f2..9716a9f7c095 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3817,6 +3817,69 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 		}
 	}
 },
+{
+	/*
+	 * Pioneer DJ DJM-850
+	 * 8 channels playback and 8 channels capture @ 44.1/48/96kHz S24LE
+	 * Playback on EP 0x05
+	 * Capture on EP 0x86
+	 */
+	USB_DEVICE_VENDOR_SPEC(0x08e4, 0x0163),
+	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
+		.ifnum = QUIRK_ANY_INTERFACE,
+		.type = QUIRK_COMPOSITE,
+		.data = (const struct snd_usb_audio_quirk[]) {
+			{
+				.ifnum = 0,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 8,
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x05,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+					    USB_ENDPOINT_SYNC_ASYNC|
+						USB_ENDPOINT_USAGE_DATA,
+					.rates = SNDRV_PCM_RATE_44100|
+						SNDRV_PCM_RATE_48000|
+						SNDRV_PCM_RATE_96000,
+					.rate_min = 44100,
+					.rate_max = 96000,
+					.nr_rates = 3,
+					.rate_table = (unsigned int[]) { 44100, 48000, 96000 }
+				}
+			},
+			{
+				.ifnum = 0,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 8,
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x86,
+					.ep_idx = 1,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+						USB_ENDPOINT_SYNC_ASYNC|
+						USB_ENDPOINT_USAGE_DATA,
+					.rates = SNDRV_PCM_RATE_44100|
+						SNDRV_PCM_RATE_48000|
+						SNDRV_PCM_RATE_96000,
+					.rate_min = 44100,
+					.rate_max = 96000,
+					.nr_rates = 3,
+					.rate_table = (unsigned int[]) { 44100, 48000, 96000 }
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
 	 * Pioneer DJ DJM-450
-- 
2.30.2

