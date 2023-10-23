Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BB27D3AF2
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 17:37:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6B2384A;
	Mon, 23 Oct 2023 17:36:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6B2384A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698075440;
	bh=z9prdJ6O3j5SCSpV9dLEcDMv1SC2XhsPNMpF4y8rhLg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YXaLZdngOimFbZ5hqogW2LJo7IxGQ1N/PBhICiQy0pDgjKvbKt5wq7q7nh+y5bhyG
	 rph6miX8+Lr5RMuVI+2PF3nrEYplW91PtJK5F1QIsKkxSRNqad/r7hOPyVlozUrSmF
	 8yKmKNDkuMfo9usOVLWLF4+u/xRuI21uB4LCr3Yw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBF74F80558; Mon, 23 Oct 2023 17:36:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81337F8032D;
	Mon, 23 Oct 2023 17:36:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54101F804F3; Mon, 23 Oct 2023 17:36:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0EA54F80134
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 17:36:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EA54F80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Tj/zm70V;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=qP0Dm+0p
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 15A2A1FE28;
	Mon, 23 Oct 2023 15:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1698075371;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=c1dZYzzzm6AELny/MZ4ePBVaSJz/JtgCnJKpIxzPtdM=;
	b=Tj/zm70V3To4TpGWCf75cVGDORBnyHwlUl9cieSsnabruIY4klWYOuhfZrWpDoT0foRsgM
	/cbxdUaJPioeSouBWqGoZYIQ49PbZF86tEaxOSFz0Oi22UMAx74dsanw6Y4oGJ521CY/4W
	vyxvFa7MhO94+Civ0Y85WlC2RBn0XNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1698075371;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=c1dZYzzzm6AELny/MZ4ePBVaSJz/JtgCnJKpIxzPtdM=;
	b=qP0Dm+0pCKXC+e9s0r/qdbMmedehkb2zTW6E/DUtc27dm6+jaZWgcwuwbyo5Il3S8vv16v
	z0qdvVP0PtLuV/Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D6EDA132FD;
	Mon, 23 Oct 2023 15:36:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SpWOM+qSNmXzFQAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 23 Oct 2023 15:36:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: [PATCH for-next] ASoC: SOF: Make return of remove_late void, too
Date: Mon, 23 Oct 2023 17:36:05 +0200
Message-Id: <20231023153605.863-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-2.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
Message-ID-Hash: 5P44NBDEHQJRHSIVZNXPHY53XF6PSS2B
X-Message-ID-Hash: 5P44NBDEHQJRHSIVZNXPHY53XF6PSS2B
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5P44NBDEHQJRHSIVZNXPHY53XF6PSS2B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Like the change we've done for remove callback, the newly introduced
remove_late callback should be changed to void return, too.

Fixes: 17baaa1f950b ("ASoC: SOF: core: Add probe_early and remove_late callbacks")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

@Mark, as this is based on a merge result, I'm going to apply it to
for-next branch of my sound git tree.  Please pull onto yours later.

 sound/soc/sof/intel/hda.c | 4 +---
 sound/soc/sof/intel/hda.h | 2 +-
 sound/soc/sof/ops.h       | 6 ++----
 sound/soc/sof/sof-priv.h  | 2 +-
 4 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 8342fcf52f52..744c0dd5766d 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1382,13 +1382,11 @@ void hda_dsp_remove(struct snd_sof_dev *sdev)
 		iounmap(sdev->bar[HDA_DSP_BAR]);
 }
 
-int hda_dsp_remove_late(struct snd_sof_dev *sdev)
+void hda_dsp_remove_late(struct snd_sof_dev *sdev)
 {
 	iounmap(sof_to_bus(sdev)->remap_addr);
 	sof_hda_bus_exit(sdev);
 	hda_codec_i915_exit(sdev);
-
-	return 0;
 }
 
 int hda_power_down_dsp(struct snd_sof_dev *sdev)
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index f57a9a4b0b75..d628d6a3a7e5 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -579,7 +579,7 @@ struct sof_intel_hda_stream {
 int hda_dsp_probe_early(struct snd_sof_dev *sdev);
 int hda_dsp_probe(struct snd_sof_dev *sdev);
 void hda_dsp_remove(struct snd_sof_dev *sdev);
-int hda_dsp_remove_late(struct snd_sof_dev *sdev);
+void hda_dsp_remove_late(struct snd_sof_dev *sdev);
 int hda_dsp_core_power_up(struct snd_sof_dev *sdev, unsigned int core_mask);
 int hda_dsp_core_run(struct snd_sof_dev *sdev, unsigned int core_mask);
 int hda_dsp_enable_core(struct snd_sof_dev *sdev, unsigned int core_mask);
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 09d1452e3705..6538d9f4fe96 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -57,12 +57,10 @@ static inline void snd_sof_remove(struct snd_sof_dev *sdev)
 		sof_ops(sdev)->remove(sdev);
 }
 
-static inline int snd_sof_remove_late(struct snd_sof_dev *sdev)
+static inline void snd_sof_remove_late(struct snd_sof_dev *sdev)
 {
 	if (sof_ops(sdev)->remove_late)
-		return sof_ops(sdev)->remove_late(sdev);
-
-	return 0;
+		sof_ops(sdev)->remove_late(sdev);
 }
 
 static inline int snd_sof_shutdown(struct snd_sof_dev *sdev)
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index f712bd39d13d..f4185012eb69 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -168,7 +168,7 @@ struct snd_sof_dsp_ops {
 	int (*probe_early)(struct snd_sof_dev *sof_dev); /* optional */
 	int (*probe)(struct snd_sof_dev *sof_dev); /* mandatory */
 	void (*remove)(struct snd_sof_dev *sof_dev); /* optional */
-	int (*remove_late)(struct snd_sof_dev *sof_dev); /* optional */
+	void (*remove_late)(struct snd_sof_dev *sof_dev); /* optional */
 	int (*shutdown)(struct snd_sof_dev *sof_dev); /* optional */
 
 	/* DSP core boot / reset */

base-commit: 41a3056e4e73172d09dad6921e70d0f04b57cdf0
-- 
2.35.3

