Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 308523C3016
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jul 2021 04:46:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB7661751;
	Sat, 10 Jul 2021 04:46:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB7661751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625885214;
	bh=wfJv1sH/6jFQAaCv8Vm33MLu5aGxmBgSRuBRpExJmbQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JKTc9w1wCYqG1n6bxUHOjzCOXpeEoQpqJhLm25bTh9BvVMSnptd7vZ8oAiLHt2cUV
	 ninsc/ztgb2K/iHJhUzUYcuAW0ueZcWj0gfEpPj8W7EZjxhFFMhg0R88POmb4T3xES
	 +SB3iF4QLfzz0sDrREUoHyvQFN27l2Mw26H7qJ7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12342F80535;
	Sat, 10 Jul 2021 04:32:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47EA9F8052E; Sat, 10 Jul 2021 04:31:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56252F80516
 for <alsa-devel@alsa-project.org>; Sat, 10 Jul 2021 04:31:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56252F80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H1fuGJD2"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50BCF613EC;
 Sat, 10 Jul 2021 02:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625884307;
 bh=wfJv1sH/6jFQAaCv8Vm33MLu5aGxmBgSRuBRpExJmbQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H1fuGJD2vtSAnTN5bcZazPYRSHkCIOTqYIEe2p4PGEqgHS9XSIbqgaNJPIzogBeV/
 4dlGDv692JgB5Uz3IIvetltlj2by81mI6s0mqUup+S+AL2OpesZayBR4U/PB7ZolWy
 hWVZ+IZmIJpH3HOCpe2ywLhSkB9wx1jkV+soXnBddmC/7cFNGGSbaf0ZTG5sMZ3kWA
 5c4S39uaLi4yzMAIyjlwJiGw2DDqIHzckgisxjTaFLFt8ZpSnpvUl49OtIpFGGbAB1
 tfc22bAfHJeEmGXf+oVp3uFcyBowWLJCwn9ANUi/rnEEboCohez+OMfjgO5jNM0Q9i
 +cvj9Zukkk4VQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 51/63] ALSA: usb-audio: scarlett2: Fix
 scarlett2_*_ctl_put() return values
Date: Fri,  9 Jul 2021 22:26:57 -0400
Message-Id: <20210710022709.3170675-51-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710022709.3170675-1-sashal@kernel.org>
References: <20210710022709.3170675-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, "Geoffrey D. Bennett" <g@b4.vu>
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

From: "Geoffrey D. Bennett" <g@b4.vu>

[ Upstream commit c5d8e008032f3cd5f266d552732973a960b0bd4b ]

Mixer control put callbacks should return 1 if the value is changed.
Fix the sw_hw, level, pad, and button controls accordingly.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
Link: https://lore.kernel.org/r/20210620164645.GA9221@m.b4.vu
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/mixer_scarlett_gen2.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 60545eeef28f..8fd1f948a892 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -1179,6 +1179,8 @@ static int scarlett2_sw_hw_enum_ctl_put(struct snd_kcontrol *kctl,
 	/* Send SW/HW switch change to the device */
 	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_SW_HW_SWITCH,
 				       index, val);
+	if (err == 0)
+		err = 1;
 
 unlock:
 	mutex_unlock(&private->data_mutex);
@@ -1239,6 +1241,8 @@ static int scarlett2_level_enum_ctl_put(struct snd_kcontrol *kctl,
 	/* Send switch change to the device */
 	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_LEVEL_SWITCH,
 				       index, val);
+	if (err == 0)
+		err = 1;
 
 unlock:
 	mutex_unlock(&private->data_mutex);
@@ -1289,6 +1293,8 @@ static int scarlett2_pad_ctl_put(struct snd_kcontrol *kctl,
 	/* Send switch change to the device */
 	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_PAD_SWITCH,
 				       index, val);
+	if (err == 0)
+		err = 1;
 
 unlock:
 	mutex_unlock(&private->data_mutex);
@@ -1344,6 +1350,8 @@ static int scarlett2_button_ctl_put(struct snd_kcontrol *kctl,
 	/* Send switch change to the device */
 	err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_BUTTONS,
 				       index, val);
+	if (err == 0)
+		err = 1;
 
 unlock:
 	mutex_unlock(&private->data_mutex);
-- 
2.30.2

