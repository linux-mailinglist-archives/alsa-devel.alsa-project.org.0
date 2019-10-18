Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE4DDCDC4
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 20:18:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 645641673;
	Fri, 18 Oct 2019 20:17:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 645641673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571422680;
	bh=Bob7avUwn47X/DPSfXCBk51fRKEbIleiG3QSE0m/hfs=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bK1KuomTXkI4xfVcuMZXKL/exikJL3lnwRcWeBT/R9rBwmVeCJX45ddD05R3M8xMd
	 vwS0turr8ceea+BzHnWpWABPgLzS1196m2IJeTiKMnq/QbLC3OwIbrzGeXFaNhFVRU
	 P6lbSxCLxUVrRs+p0pgOV20gF3mta5WtbNI1yMbc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B9FDF8070E;
	Fri, 18 Oct 2019 20:07:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46A73F80534; Fri, 18 Oct 2019 20:07:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27BBDF805FC
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 20:07:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27BBDF805FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="dkkcAhwf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=5MBDvLGyyFnqSYZu0bSGNB/KEFy3UbuGL6RCdAC3rJs=; b=dkkcAhwfqq+w
 11dFG4fsuOW+YYFA7blGcS0zR7/gw1wnRFtbB0r7IsRS9/x6DRvRjEG0Fz28HwNHwEeLIP21Wl0G3
 vX2mEPimkKirlBxQq+f7hzSIfCD611dyhK4PpnlpxKE82r4pbHEwma3f3MSze12f4RzvWEBnGA2yL
 7azKQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iLWeS-0004FV-FG; Fri, 18 Oct 2019 18:07:00 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id E2B032741DEA; Fri, 18 Oct 2019 19:06:59 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Dragos Tarcatu <dragos_tarcatu@mentor.com>
In-Reply-To: <20191018123806.18063-1-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191018180659.E2B032741DEA@ypsilon.sirena.org.uk>
Date: Fri, 18 Oct 2019 19:06:59 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: control: return true when kcontrol
	values change" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: control: return true when kcontrol values change

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 95a32c98055f664f9b3f34c41e153d4dcedd0eff Mon Sep 17 00:00:00 2001
From: Dragos Tarcatu <dragos_tarcatu@mentor.com>
Date: Fri, 18 Oct 2019 07:38:06 -0500
Subject: [PATCH] ASoC: SOF: control: return true when kcontrol values change

All the kcontrol put() functions are currently returning 0 when
successful. This does not go well with alsamixer as it does
not seem to get notified on SND_CTL_EVENT_MASK_VALUE callbacks
when values change for (some of) the sof kcontrols.
This patch fixes that by returning true for volume, switch
and enum type kcontrols when values do change in put().

Signed-off-by: Dragos Tarcatu <dragos_tarcatu@mentor.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191018123806.18063-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/control.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index a4983f90ff5b..2b8711eda362 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -60,13 +60,16 @@ int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
 	struct snd_sof_dev *sdev = scontrol->sdev;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	unsigned int i, channels = scontrol->num_channels;
+	bool change = false;
+	u32 value;
 
 	/* update each channel */
 	for (i = 0; i < channels; i++) {
-		cdata->chanv[i].value =
-			mixer_to_ipc(ucontrol->value.integer.value[i],
+		value = mixer_to_ipc(ucontrol->value.integer.value[i],
 				     scontrol->volume_table, sm->max + 1);
+		change = change || (value != cdata->chanv[i].value);
 		cdata->chanv[i].channel = i;
+		cdata->chanv[i].value = value;
 	}
 
 	/* notify DSP of mixer updates */
@@ -76,8 +79,7 @@ int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
 					      SOF_CTRL_TYPE_VALUE_CHAN_GET,
 					      SOF_CTRL_CMD_VOLUME,
 					      true);
-
-	return 0;
+	return change;
 }
 
 int snd_sof_switch_get(struct snd_kcontrol *kcontrol,
@@ -105,11 +107,15 @@ int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
 	struct snd_sof_dev *sdev = scontrol->sdev;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	unsigned int i, channels = scontrol->num_channels;
+	bool change = false;
+	u32 value;
 
 	/* update each channel */
 	for (i = 0; i < channels; i++) {
-		cdata->chanv[i].value = ucontrol->value.integer.value[i];
+		value = ucontrol->value.integer.value[i];
+		change = change || (value != cdata->chanv[i].value);
 		cdata->chanv[i].channel = i;
+		cdata->chanv[i].value = value;
 	}
 
 	/* notify DSP of mixer updates */
@@ -120,7 +126,7 @@ int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
 					      SOF_CTRL_CMD_SWITCH,
 					      true);
 
-	return 0;
+	return change;
 }
 
 int snd_sof_enum_get(struct snd_kcontrol *kcontrol,
@@ -148,11 +154,15 @@ int snd_sof_enum_put(struct snd_kcontrol *kcontrol,
 	struct snd_sof_dev *sdev = scontrol->sdev;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	unsigned int i, channels = scontrol->num_channels;
+	bool change = false;
+	u32 value;
 
 	/* update each channel */
 	for (i = 0; i < channels; i++) {
-		cdata->chanv[i].value = ucontrol->value.enumerated.item[i];
+		value = ucontrol->value.enumerated.item[i];
+		change = change || (value != cdata->chanv[i].value);
 		cdata->chanv[i].channel = i;
+		cdata->chanv[i].value = value;
 	}
 
 	/* notify DSP of enum updates */
@@ -163,7 +173,7 @@ int snd_sof_enum_put(struct snd_kcontrol *kcontrol,
 					      SOF_CTRL_CMD_ENUM,
 					      true);
 
-	return 0;
+	return change;
 }
 
 int snd_sof_bytes_get(struct snd_kcontrol *kcontrol,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
