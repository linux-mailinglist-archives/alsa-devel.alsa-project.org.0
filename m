Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C155B8426
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 11:08:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 009F0184C;
	Wed, 14 Sep 2022 11:07:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 009F0184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663146482;
	bh=DGw/IM+oIpUbi+wErrdi6bMwdmKGBVvw7ohakxPUKlE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ft0hop3rdk68SBw5q7sWwxchLg1Mze0oyKFOGD6DDrGcBX/gnQgQgXU0ALbd1qhur
	 M0Mw/Jv6EbXZXGpWgPZ+JDJ/MFfhWRcXgaqyjLe0DhB8PCQnDfHfxkMbgaIBkEv4hA
	 f+UoO+nydv/VKftJUPoRgO1M2sA6R45PVl3Fhrh8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E330F8057E;
	Wed, 14 Sep 2022 11:05:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE195F8057A; Wed, 14 Sep 2022 11:05:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCEDEF80557
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 11:05:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCEDEF80557
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RWLR/Gul"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 05E70CE1395;
 Wed, 14 Sep 2022 09:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 610F9C433D6;
 Wed, 14 Sep 2022 09:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663146297;
 bh=DGw/IM+oIpUbi+wErrdi6bMwdmKGBVvw7ohakxPUKlE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RWLR/GuldquZZfERpEgvcJNqzgA2gL6SeB0zVUb9kgHaCbFqTZHNbfsCPh5VJxYbi
 6mn3viEY6MLurwSt4mlnREho/9z7TTRQDKKfyArd6ux5LXXk4OoD5XOWNy9fxBRf+o
 op2I2OiThEisaa7xkp74F8Ob7zLFtpxNUNRdIPJUjw7SjdnP6EQU+JmlF1lafH2XE7
 f0M5nh2QLxjLVMIoD5tlAISOvGgQ6l3H0oskMWZs36c6bJbOekktK+nYs0o8tmeQZS
 ZZQw7f1MfGumpd8hCoSOsEaGOZmL87s2MCoKWc/cw8Qsz6aakRnYl/GxaD3uovPUG/
 3r8SKE0rXmCNg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 4/9] ALSA: hda/sigmatel: Keep power up while beep
 is enabled
Date: Wed, 14 Sep 2022 05:04:38 -0400
Message-Id: <20220914090445.471489-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220914090445.471489-1-sashal@kernel.org>
References: <20220914090445.471489-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, tiwai@suse.com
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

[ Upstream commit 414d38ba871092aeac4ed097ac4ced89486646f7 ]

It seems that the beep playback doesn't work well on IDT codec devices
when the codec auto-pm is enabled.  Keep the power on while the beep
switch is enabled.

Link: https://bugzilla.suse.com/show_bug.cgi?id=1200544
Link: https://lore.kernel.org/r/20220904072750.26164-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_sigmatel.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/sound/pci/hda/patch_sigmatel.c b/sound/pci/hda/patch_sigmatel.c
index 85c33f528d7b3..2f6e4e3afd8f2 100644
--- a/sound/pci/hda/patch_sigmatel.c
+++ b/sound/pci/hda/patch_sigmatel.c
@@ -222,6 +222,7 @@ struct sigmatel_spec {
 
 	/* beep widgets */
 	hda_nid_t anabeep_nid;
+	bool beep_power_on;
 
 	/* SPDIF-out mux */
 	const char * const *spdif_labels;
@@ -4463,6 +4464,26 @@ static int stac_suspend(struct hda_codec *codec)
 	stac_shutup(codec);
 	return 0;
 }
+
+static int stac_check_power_status(struct hda_codec *codec, hda_nid_t nid)
+{
+	struct sigmatel_spec *spec = codec->spec;
+	int ret = snd_hda_gen_check_power_status(codec, nid);
+
+#ifdef CONFIG_SND_HDA_INPUT_BEEP
+	if (nid == spec->gen.beep_nid && codec->beep) {
+		if (codec->beep->enabled != spec->beep_power_on) {
+			spec->beep_power_on = codec->beep->enabled;
+			if (spec->beep_power_on)
+				snd_hda_power_up_pm(codec);
+			else
+				snd_hda_power_down_pm(codec);
+		}
+		ret |= spec->beep_power_on;
+	}
+#endif
+	return ret;
+}
 #else
 #define stac_suspend		NULL
 #endif /* CONFIG_PM */
@@ -4475,6 +4496,7 @@ static const struct hda_codec_ops stac_patch_ops = {
 	.unsol_event = snd_hda_jack_unsol_event,
 #ifdef CONFIG_PM
 	.suspend = stac_suspend,
+	.check_power_status = stac_check_power_status,
 #endif
 	.reboot_notify = stac_shutup,
 };
-- 
2.35.1

