Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FBD1AF02F
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 16:49:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 187E41670;
	Sat, 18 Apr 2020 16:48:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 187E41670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587221359;
	bh=SC/vqzeMx1k3k9AAbtjSE5BmU6VVJ9MANDBe3abuSXk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m02cflwYa+oWVTQoWwtcy4iYRwWRGoXSZeO2bgmmT518seWXmSKukrKLwjoMDtqlu
	 Tbbzh/52BuxuxeUlZ9oPZOsXPcvhMj56zB/MJ4SNgR8OEDt+JShLhsdhaZ0/Xumiwz
	 4EC22DiAdgENHu7GQ9McJ5KcjzIeQHuefOkXBaIA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38743F8028B;
	Sat, 18 Apr 2020 16:42:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFA82F80316; Sat, 18 Apr 2020 16:42:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C652F80303
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 16:42:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C652F80303
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HJ3ujVtX"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 676292224F;
 Sat, 18 Apr 2020 14:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587220920;
 bh=SC/vqzeMx1k3k9AAbtjSE5BmU6VVJ9MANDBe3abuSXk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HJ3ujVtXKNApUgyMIYJ5qtwCHZ3xirDfQyarkQxK95iX5NO3tOiartrji0/IL0/I1
 UJWRM/QzuZgxKL8zt/kYGYdQoEw49Z0mYxd6zhmgUSCiv9yYeaXn85tXsWGXKQBeXU
 nwFgkvqky+qqr89+NaH4ApIhfLgga5GNnMVW/Tqc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 58/78] ALSA: usb-audio: Add Pioneer DJ DJM-250MK2
 quirk
Date: Sat, 18 Apr 2020 10:40:27 -0400
Message-Id: <20200418144047.9013-58-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418144047.9013-1-sashal@kernel.org>
References: <20200418144047.9013-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org,
 =?UTF-8?q?Franti=C5=A1ek=20Ku=C4=8Dera?= <franta-linux@frantovo.cz>
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

From: František Kučera <franta-linux@frantovo.cz>

[ Upstream commit 73d8c94084341e2895169a0462dbc18167f01683 ]

Pioneer DJ DJM-250MK2 is a mixer that acts like a USB sound card.
The MIDI controller part is standard but the PCM part is "vendor specific".
Output is enabled by this quirk: 8 channels, 48 000 Hz, S24_3LE.
Input is not working.

Signed-off-by: František Kučera <franta-linux@frantovo.cz>
Link: https://lore.kernel.org/r/20200401095907.3387-1-konference@frantovo.cz
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/quirks-table.h | 42 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index d187aa6d50db0..dcaf9eed9a415 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3592,5 +3592,47 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 		}
 	}
 },
+{
+	/*
+	 * Pioneer DJ DJM-250MK2
+	 * PCM is 8 channels out @ 48 fixed (endpoints 0x01).
+	 * The output from computer to the mixer is usable.
+	 *
+	 * The input (phono or line to computer) is not working.
+	 * It should be at endpoint 0x82 and probably also 8 channels,
+	 * but it seems that it works only with Pioneer proprietary software.
+	 * Even on officially supported OS, the Audacity was unable to record
+	 * and Mixxx to recognize the control vinyls.
+	 */
+	USB_DEVICE_VENDOR_SPEC(0x2b73, 0x0017),
+	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
+		.ifnum = QUIRK_ANY_INTERFACE,
+		.type = QUIRK_COMPOSITE,
+		.data = (const struct snd_usb_audio_quirk[]) {
+			{
+				.ifnum = 0,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 8, // outputs
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x01,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+						USB_ENDPOINT_SYNC_ASYNC,
+					.rates = SNDRV_PCM_RATE_48000,
+					.rate_min = 48000,
+					.rate_max = 48000,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) { 48000 }
+				}
+			},
+			{
+				.ifnum = -1
+			}
+		}
+	}
+},
 
 #undef USB_DEVICE_VENDOR_SPEC
-- 
2.20.1

