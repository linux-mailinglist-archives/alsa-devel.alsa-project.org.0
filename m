Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8662AF76C
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 18:35:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 908461770;
	Wed, 11 Nov 2020 18:34:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 908461770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605116107;
	bh=/Q+JJPx37IRhtX0iusQCxFli1MltImCq3HeWgWi6qN8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I39A0ZErs4lHPhYe+ZYVlRNhCxXtQDKG4Sz26VQ9QsJ7OGe76Gpqg4YNL0Z5WqJPj
	 21G45vYmZ4qJl0d7SOIR/iGVoTPo54sZdBWboHtSdMKLB7yYtHkrbw6S/UYFHhchrt
	 9LNFM84tLExH9W2XRRfMoMTIG5C/AZIE1gAMqDEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 124C4F80059;
	Wed, 11 Nov 2020 18:33:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F093F8020C; Wed, 11 Nov 2020 18:33:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AE2EF80059
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 18:33:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AE2EF80059
IronPort-SDR: ckB+LshYKvEt8zH3/KnaSj1GCCLkKzCu1mIsYmvpmGHxHB/70KqdIfDNjUvL/A/v69okzadD5v
 tbO3vwjKj91Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="166673634"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; d="scan'208";a="166673634"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2020 09:33:20 -0800
IronPort-SDR: kkTpp056DJQQp5XuYiSkXZB4urM/TLMqInTb8Nf9XgNv4cm2k0/hQ1kfVu2XaVSbuDPoG4G+DX
 et4+M9rOX7+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; d="scan'208";a="360625626"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2020 09:33:18 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: control: override volume info callback
Date: Wed, 11 Nov 2020 19:31:05 +0200
Message-Id: <20201111173105.1927466-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com, Jaska Uimonen <jaska.uimonen@linux.intel.com>
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

From: Jaska Uimonen <jaska.uimonen@linux.intel.com>

ASoC dapm controls currently don't support more than 2 channels. This is
a problem for SOF-based devices where individual volume control cannot
be provided on the 4 DMIC input path.

If we want to provide controls for more than 2 channels, this patch
suggests a simple solution based on an override of the info callback.
For example, in the case with 4 channel DMIC PGAs, a sof_info callback
would be used. Mono and stereo cases will keep using the existing dapm
info callback.

A longer-term solution would be to remove the limits to 2 channels in
ASoC/DAPM/topology. This is a topic Intel is currently looking into,
e.g. by removing the use of 'reg' and 'rreg' fields and use arrays
instead. Such changes will be rather intrusive and touch multiple codec
and platform drivers. Removing restrictions is the right thing to do,
but this will need to be done in steps with lots of validation.

Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/control.c   | 22 ++++++++++++++++++++++
 sound/soc/sof/sof-audio.h |  2 ++
 sound/soc/sof/topology.c  |  9 +++++++++
 3 files changed, 33 insertions(+)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 056c86ad5a47..a5dd728c580a 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -114,6 +114,28 @@ int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
 	return change;
 }
 
+int snd_sof_volume_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
+{
+	struct soc_mixer_control *sm = (struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_sof_control *scontrol = sm->dobj.private;
+	unsigned int channels = scontrol->num_channels;
+	int platform_max;
+
+	if (!sm->platform_max)
+		sm->platform_max = sm->max;
+	platform_max = sm->platform_max;
+
+	if (platform_max == 1 && !strstr(kcontrol->id.name, " Volume"))
+		uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
+	else
+		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+
+	uinfo->count = channels;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = platform_max - sm->min;
+	return 0;
+}
+
 int snd_sof_switch_get(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_value *ucontrol)
 {
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 9f645a2e5a6c..ddcfd46617f8 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -124,6 +124,8 @@ int snd_sof_volume_get(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_value *ucontrol);
 int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_value *ucontrol);
+int snd_sof_volume_info(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_info *ucontrol);
 int snd_sof_switch_get(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_value *ucontrol);
 int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 44fddeda6043..b0132fa56fe2 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1041,6 +1041,15 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 		goto out;
 	}
 
+	/*
+	 * If control has more than 2 channels we need to override the info. This is because even if
+	 * ASoC layer has defined topology's max channel count to SND_SOC_TPLG_MAX_CHAN = 8, the
+	 * pre-defined dapm control types (and related functions) creating the actual control
+	 * restrict the channels only to mono or stereo.
+	 */
+	if (le32_to_cpu(mc->num_channels) > 2)
+		kc->info = snd_sof_volume_info;
+
 	/* init the volume get/put data */
 	scontrol->size = struct_size(scontrol->control_data, chanv,
 				     le32_to_cpu(mc->num_channels));
-- 
2.28.0

