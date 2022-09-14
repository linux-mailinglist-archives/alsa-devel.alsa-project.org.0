Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA785B83DA
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 11:04:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D05E1868;
	Wed, 14 Sep 2022 11:04:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D05E1868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663146291;
	bh=ApP5aHfwt00flHGkbd48EuZBwfzU0RjCtFfNvrtur/U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kJfubmvXNd8ezTvNaPYCK8QFHbYQSjyfcXM/nUbgGZNci6pIlo3BQqeftfDvdaajp
	 wUcrJsh0TsdIGBc7XTDN4q+YgI4CRSneVt/mQCQSK//npHjr72gJfZYFCBVq94GJ/u
	 9IWewRDCyr77EWdRDxcjrOZ5sgnbFOr8ymFfSiq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AE65F8053D;
	Wed, 14 Sep 2022 11:03:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F11BF8014E; Wed, 14 Sep 2022 11:03:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BA8FF8014B
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 11:02:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BA8FF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="L8dvdWpS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 825EB619B0;
 Wed, 14 Sep 2022 09:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 608C9C433D6;
 Wed, 14 Sep 2022 09:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663146169;
 bh=ApP5aHfwt00flHGkbd48EuZBwfzU0RjCtFfNvrtur/U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L8dvdWpST4s/1cBSmf4zRcZq1znaUTHTu0wUdcRkEWTuukydb3PlFJIyb9v8U3htd
 AixTWrAC7zD7lNYiclMHFlYTOdNdNitBw42iqntxDlL+S3st/i/U8a1iBIyYpGyzTT
 x8nCNOv01aeO3i+9ZRMPcCN2rvWzziLYwblCh+olI71MPB4SZrvslK5P8u+XMHE3mV
 NIyfbfo6CHG+UGwsYPJ27KPJrbcRZJ333XN4QPwXCy3JfY0JakjiiVcmq6GsQ0PcqY
 O/81qZuiXgvH3gZUpBRqFeIm4Xbftn8wvk2ZI2lL3cBtavToYMdXWP6uVDrJ6Ofgxw
 XO42VnsKXbJDQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 08/16] ALSA: hda/sigmatel: Keep power up while
 beep is enabled
Date: Wed, 14 Sep 2022 05:02:16 -0400
Message-Id: <20220914090224.470913-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220914090224.470913-1-sashal@kernel.org>
References: <20220914090224.470913-1-sashal@kernel.org>
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
index 61df4d33c48ff..066bfccd25877 100644
--- a/sound/pci/hda/patch_sigmatel.c
+++ b/sound/pci/hda/patch_sigmatel.c
@@ -209,6 +209,7 @@ struct sigmatel_spec {
 
 	/* beep widgets */
 	hda_nid_t anabeep_nid;
+	bool beep_power_on;
 
 	/* SPDIF-out mux */
 	const char * const *spdif_labels;
@@ -4443,6 +4444,26 @@ static int stac_suspend(struct hda_codec *codec)
 
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
@@ -4455,6 +4476,7 @@ static const struct hda_codec_ops stac_patch_ops = {
 	.unsol_event = snd_hda_jack_unsol_event,
 #ifdef CONFIG_PM
 	.suspend = stac_suspend,
+	.check_power_status = stac_check_power_status,
 #endif
 };
 
-- 
2.35.1

