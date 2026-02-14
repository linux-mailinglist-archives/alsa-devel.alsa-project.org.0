Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKoCFEtdqGmZtgAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 17:26:51 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE2D2043A4
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 17:26:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 442D9602E1;
	Wed,  4 Mar 2026 17:26:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 442D9602E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772641610;
	bh=a0m4d/7E0GIkRTEulw3VanhiSAJL6BZRU0LyoE8g72E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eQqw2LGoLnvs5KgRPWn/2yvqvqz2fsT0sif0lccDuaJFQVASsqzMViulhS3j5DN20
	 5b+rO6C1VvDjTN4bNpC5QssRtG97vOUbdmKiIC2ma1MEsgY7zi9Q8mfxDCuwcfHfng
	 QRFSf2W6Men2gRsm4ZS8z5LxRPq6Gta9OHBDeJvg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FA93F806B3; Wed,  4 Mar 2026 17:25:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9140F806AE;
	Wed,  4 Mar 2026 17:25:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44E07F80535; Sat, 14 Feb 2026 09:50:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.unwrap.rs (mail.unwrap.rs [172.232.15.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA512)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B38F1F80495;
	Sat, 14 Feb 2026 09:50:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B38F1F80495
From: Cole Leavitt <cole@unwrap.rs>
To: perex@perex.cz
Cc: tiwai@suse.de,
	broonie@kernel.org,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Cole Leavitt <cole@unwrap.rs>
Subject: [PATCH 2/2] ASoC: SOF: Add platform ops callback for DAI link
 hardware readiness
Date: Sat, 14 Feb 2026 01:48:50 -0700
Message-ID: <20260214084850.7594-2-cole@unwrap.rs>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260214084850.7594-1-cole@unwrap.rs>
References: <20260214084850.7594-1-cole@unwrap.rs>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: cole@unwrap.rs
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AH7LDO34PJUP6FTW23FVZGQ6YPC5DCK2
X-Message-ID-Hash: AH7LDO34PJUP6FTW23FVZGQ6YPC5DCK2
X-Mailman-Approved-At: Wed, 04 Mar 2026 16:24:48 +0000
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AH7LDO34PJUP6FTW23FVZGQ6YPC5DCK2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: EDE2D2043A4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.79 / 15.00];
	DMARC_POLICY_REJECT(2.00)[unwrap.rs : SPF not aligned (strict), DKIM not aligned (strict),reject];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[439];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cole@unwrap.rs,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[alsa-devel];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:rdns,alsa0.perex.cz:helo,alsa-project.org:dkim,unwrap.rs:mid,unwrap.rs:email]
X-Rspamd-Action: no action

After suspend/resume (D3->D0), the SOF firmware is reloaded fresh and
pipelines are recreated lazily when userspace opens a PCM. However,
SoundWire slave re-enumeration runs asynchronously via a 100ms delayed
work item (SDW_INTEL_DELAYED_ENUMERATION_MS). If userspace attempts to
play audio before SoundWire slaves finish re-enumerating, the firmware
returns error 9 (resource not found) when creating ALH copier modules,
leaving the DSP in an unrecoverable wedged state requiring reboot.

Add a new optional dai_link_hw_ready callback to struct snd_sof_dsp_ops
that allows platform-specific code to wait for DAI link hardware to
become ready before pipeline setup. The generic ipc4-topology.c calls
this callback (when set) in sof_ipc4_prepare_copier_module() before
configuring DAI copiers, maintaining SOF's platform abstraction.

The Intel HDA implementation (hda_sdw_dai_hw_ready) waits for all
attached SoundWire slaves to complete initialization using
wait_for_completion_interruptible_timeout() with a 2-second timeout.
This is safe for multiple waiters since the SoundWire subsystem uses
complete_all() for initialization_complete. Unattached slaves (declared
in ACPI but not physically present) are skipped to avoid false timeouts.

The function returns -ETIMEDOUT on timeout (instead of warn-and-continue)
to prevent the DSP from entering a wedged state. On non-resume paths the
completions are already done, so the wait returns immediately.

Link: https://github.com/thesofproject/sof/issues/8662
Link: https://github.com/thesofproject/sof/issues/9308
Signed-off-by: Cole Leavitt <cole@unwrap.rs>
---
 sound/soc/sof/intel/hda-common-ops.c |  1 +
 sound/soc/sof/intel/hda.c            | 44 ++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h            |  6 ++++
 sound/soc/sof/ipc4-topology.c        |  8 +++++
 sound/soc/sof/sof-priv.h             |  3 ++
 5 files changed, 62 insertions(+)

diff --git a/sound/soc/sof/intel/hda-common-ops.c b/sound/soc/sof/intel/hda-common-ops.c
index 746b426b1329..315cb61426da 100644
--- a/sound/soc/sof/intel/hda-common-ops.c
+++ b/sound/soc/sof/intel/hda-common-ops.c
@@ -84,6 +84,7 @@ const struct snd_sof_dsp_ops sof_hda_common_ops = {
 	.unregister_ipc_clients = hda_unregister_clients,
 
 	/* DAI drivers */
+	.dai_link_hw_ready = hda_sdw_dai_hw_ready,
 	.drv		= skl_dai,
 	.num_drv	= SOF_SKL_NUM_DAIS,
 	.is_chain_dma_supported	= hda_is_chain_dma_supported,
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 686ecc040867..956106dc0e02 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -378,6 +378,50 @@ static void hda_dsp_sdw_process_mic_privacy(struct snd_sof_dev *sdev)
 		chip->process_mic_privacy(sdev, true, AZX_REG_ML_LEPTR_ID_SDW);
 }
 
+int hda_sdw_dai_hw_ready(struct snd_sof_dev *sdev, int dai_type)
+{
+	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
+	struct sdw_peripherals *sdw_p;
+	long ret;
+	int idx;
+
+	if (dai_type != SOF_DAI_INTEL_ALH)
+		return 0;
+
+	if (!hdev || !hdev->sdw || !hdev->sdw->peripherals)
+		return 0;
+
+	sdw_p = hdev->sdw->peripherals;
+
+	for (idx = 0; idx < sdw_p->num_peripherals; idx++) {
+		struct sdw_slave *slave = sdw_p->array[idx];
+
+		if (!slave)
+			continue;
+
+		if (slave->status != SDW_SLAVE_ATTACHED)
+			continue;
+
+		ret = wait_for_completion_interruptible_timeout(
+				&slave->initialization_complete,
+				msecs_to_jiffies(2000));
+		if (ret == 0) {
+			dev_err(sdev->dev,
+				"timeout waiting for SoundWire slave %s initialization\n",
+				dev_name(&slave->dev));
+			return -ETIMEDOUT;
+		}
+		if (ret < 0) {
+			dev_dbg(sdev->dev,
+				"interrupted waiting for SoundWire slave %s initialization: %ld\n",
+				dev_name(&slave->dev), ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 #else /* IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE) */
 static inline int hda_sdw_acpi_scan(struct snd_sof_dev *sdev)
 {
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index ac9f76a5ef97..9bd8fe82ae9e 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -830,6 +830,7 @@ bool hda_sdw_check_wakeen_irq_common(struct snd_sof_dev *sdev);
 void hda_sdw_process_wakeen_common(struct snd_sof_dev *sdev);
 void hda_sdw_process_wakeen(struct snd_sof_dev *sdev);
 bool hda_common_check_sdw_irq(struct snd_sof_dev *sdev);
+int hda_sdw_dai_hw_ready(struct snd_sof_dev *sdev, int dai_type);
 
 #else
 
@@ -879,6 +880,11 @@ static inline bool hda_common_check_sdw_irq(struct snd_sof_dev *sdev)
 	return false;
 }
 
+static inline int hda_sdw_dai_hw_ready(struct snd_sof_dev *sdev, int dai_type)
+{
+	return 0;
+}
+
 #endif
 
 int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index d621e7914a73..a8b107d7e786 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2256,6 +2256,14 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	case snd_soc_dapm_dai_in:
 	case snd_soc_dapm_dai_out:
 	{
+		/* Wait for DAI link hardware (e.g. SoundWire slaves) to be ready */
+		if (sdev->pdata->desc->ops->dai_link_hw_ready) {
+			ret = sdev->pdata->desc->ops->dai_link_hw_ready(
+					sdev, ipc4_copier->dai_type);
+			if (ret)
+				return ret;
+		}
+
 		/*
 		 * Only SOF_DAI_INTEL_ALH needs copier_data to set blob.
 		 * That's why only ALH dai's blob is set after sof_ipc4_init_input_audio_fmt
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 0f624d8cde20..346b5c34c6c8 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -346,6 +346,9 @@ struct snd_sof_dsp_ops {
 	int (*register_ipc_clients)(struct snd_sof_dev *sdev); /* optional */
 	void (*unregister_ipc_clients)(struct snd_sof_dev *sdev); /* optional */
 
+	/* optional: wait for DAI link hardware readiness (e.g. SoundWire slave init) */
+	int (*dai_link_hw_ready)(struct snd_sof_dev *sdev, int dai_type); /* optional */
+
 	/* DAI ops */
 	struct snd_soc_dai_driver *drv;
 	int num_drv;
-- 
2.52.0
