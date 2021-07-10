Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2843C320D
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jul 2021 04:54:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E25951781;
	Sat, 10 Jul 2021 04:53:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E25951781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625885679;
	bh=XxcEI5uFGjodWwk7zAGAJ86nk15KZJ1gxcftGSNISLo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UWZTMWkWR0v3PtvuCHBEduXnhTo5+9KaYMxXww4yy/03OIz7xmUceP0QAQJhfF1sr
	 564HGiK/yL90dEfWq1s94sGLytXVe0Ub7uw8etCDI8RH/SJFsZVAEGZowr8Zeb6Q/z
	 X6FYntavx4dPSUhMDBNGa7JguFn+j2ezXIPQe7oc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BD8EF80557;
	Sat, 10 Jul 2021 04:39:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB5F9F80557; Sat, 10 Jul 2021 04:39:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 848B9F8028D
 for <alsa-devel@alsa-project.org>; Sat, 10 Jul 2021 04:39:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 848B9F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="c35UQF2t"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D31A6124C;
 Sat, 10 Jul 2021 02:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625884740;
 bh=XxcEI5uFGjodWwk7zAGAJ86nk15KZJ1gxcftGSNISLo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c35UQF2tHyY23/TFqxBa2Lqvoq38yU7/YwPlFZeSRWElu1+LQimQoboEgfOCSoM7F
 CoZbxGE2XbWn8LJYNwVB7RwSEbnZQTJRcDqqWF910fMLw3jTvfuMEcMUzYR9F78c9U
 eGLakRKUT3s0nwJgUWbpy7eWUp4aAcIlmzYKgVbu1mY8owbA4UtmyaNRuSKqfTo8Ql
 EsA48uq8bmeSdPF5Ro1d/c7iyJ1Tponoxye9ksEnR0sl6lzhloHZTry0Fhw139g4BE
 W8FfqfSWsiG6CxK0EpXYFNlIVReJD1pFZkeGOZ2c7dzCUNGXwWVWyffF9k/riGeeQU
 mbx4B2RuCV01Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 18/26] ALSA: bebob: add support for ToneWeal FW66
Date: Fri,  9 Jul 2021 22:35:56 -0400
Message-Id: <20210710023604.3172486-18-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710023604.3172486-1-sashal@kernel.org>
References: <20210710023604.3172486-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Daniel Jozsef <daniel.jozsef@gmail.com>
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

From: Takashi Sakamoto <o-takashi@sakamocchi.jp>

[ Upstream commit 50ebe56222bfa0911a932930f9229ee5995508d9 ]

A user of FFADO project reported the issue of ToneWeal FW66. As a result,
the device is identified as one of applications of BeBoB solution.

I note that in the report the device returns contradictory result in plug
discovery process for audio subunit. Fortunately ALSA BeBoB driver doesn't
perform it thus it's likely to handle the device without issues.

I receive no reaction to test request for this patch yet, however it would
be worth to add support for it.

daniel@gibbonmoon:/sys/bus/firewire/devices/fw1$ grep -r . *
Binary file config_rom matches
dev:244:1
guid:0x0023270002000000
hardware_version:0x000002
is_local:0
model:0x020002
model_name:FW66
power/runtime_active_time:0
power/runtime_active_kids:0
power/runtime_usage:0
power/runtime_status:unsupported
power/async:disabled
power/runtime_suspended_time:0
power/runtime_enabled:disabled
power/control:auto
subsystem/drivers_autoprobe:1
uevent:MAJOR=244
uevent:MINOR=1
uevent:DEVNAME=fw1
units:0x00a02d:0x010001
vendor:0x002327
vendor_name:ToneWeal
fw1.0/uevent:MODALIAS=ieee1394:ven00002327mo00020002sp0000A02Dver00010001
fw1.0/power/runtime_active_time:0
fw1.0/power/runtime_active_kids:0
fw1.0/power/runtime_usage:0
fw1.0/power/runtime_status:unsupported
fw1.0/power/async:disabled
fw1.0/power/runtime_suspended_time:0
fw1.0/power/runtime_enabled:disabled
fw1.0/power/control:auto
fw1.0/model:0x020002
fw1.0/rom_index:15
fw1.0/specifier_id:0x00a02d
fw1.0/model_name:FW66
fw1.0/version:0x010001
fw1.0/modalias:ieee1394:ven00002327mo00020002sp0000A02Dver00010001

Cc: Daniel Jozsef <daniel.jozsef@gmail.com>
Reference: https://lore.kernel.org/alsa-devel/20200119164335.GA11974@workstation/
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Link: https://lore.kernel.org/r/20210619083922.16060-1-o-takashi@sakamocchi.jp
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/firewire/Kconfig       | 1 +
 sound/firewire/bebob/bebob.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/sound/firewire/Kconfig b/sound/firewire/Kconfig
index da9874d54676..82894330cae1 100644
--- a/sound/firewire/Kconfig
+++ b/sound/firewire/Kconfig
@@ -108,6 +108,7 @@ config SND_BEBOB
 	  * M-Audio Ozonic/NRV10/ProfireLightBridge
 	  * M-Audio FireWire 1814/ProjectMix IO
 	  * Digidesign Mbox 2 Pro
+	  * ToneWeal FW66
 
           To compile this driver as a module, choose M here: the module
           will be called snd-bebob.
diff --git a/sound/firewire/bebob/bebob.c b/sound/firewire/bebob/bebob.c
index c51564213365..4bb2cbe73f20 100644
--- a/sound/firewire/bebob/bebob.c
+++ b/sound/firewire/bebob/bebob.c
@@ -60,6 +60,7 @@ static DECLARE_BITMAP(devices_used, SNDRV_CARDS);
 #define VEN_MAUDIO1	0x00000d6c
 #define VEN_MAUDIO2	0x000007f5
 #define VEN_DIGIDESIGN	0x00a07e
+#define OUI_SHOUYO	0x002327
 
 #define MODEL_FOCUSRITE_SAFFIRE_BOTH	0x00000000
 #define MODEL_MAUDIO_AUDIOPHILE_BOTH	0x00010060
@@ -513,6 +514,8 @@ static const struct ieee1394_device_id bebob_id_table[] = {
 			    &maudio_special_spec),
 	/* Digidesign Mbox 2 Pro */
 	SND_BEBOB_DEV_ENTRY(VEN_DIGIDESIGN, 0x0000a9, &spec_normal),
+	// Toneweal FW66.
+	SND_BEBOB_DEV_ENTRY(OUI_SHOUYO, 0x020002, &spec_normal),
 	/* IDs are unknown but able to be supported */
 	/*  Apogee, Mini-ME Firewire */
 	/*  Apogee, Mini-DAC Firewire */
-- 
2.30.2

