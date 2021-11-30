Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA7A462F61
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 10:15:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E13141E91;
	Tue, 30 Nov 2021 10:15:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E13141E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638263756;
	bh=GddG5RVTRdaVoFBS7niFvFZko9lHWgUbOB0FoLZo2jk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NuMc0B9yIxG8l0Nm/faiTwtNGbj6u18xNLRPp6mAfV56vwFBE4pM7cetQZFaAsy0K
	 mGuy4SCu4gsSwuPDvIsszVuhn0ODeW9zknOrQNbQuvKON1aOvdEDZVrB7T1OKOBjqg
	 9fWiOgu9JBFFInQ5LsZPLckEP7PfnR3L5/BxZCBI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC87CF80290;
	Tue, 30 Nov 2021 10:14:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28673F8020D; Tue, 30 Nov 2021 10:14:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57D3AF80113
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 10:13:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57D3AF80113
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="216870709"
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; d="scan'208";a="216870709"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 01:13:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; d="scan'208";a="595321787"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by FMSMGA003.fm.intel.com with ESMTP; 30 Nov 2021 01:13:45 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: Intel: Retry codec probing if it fails
Date: Tue, 30 Nov 2021 11:06:06 +0200
Message-Id: <20211130090606.529348-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 Hui Wang <hui.wang@canonical.com>, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com, Bard Liao <bard.liao@intel.com>
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

From: Hui Wang <hui.wang@canonical.com>

On the latest Lenovo Thinkstation laptops, we often experience the
speaker failure after rebooting, check the dmesg, we could see:
 sof-audio-pci-intel-tgl 0000:00:1f.3: codec #0 probe error, ret: -5

The analogue codec on the machine is ALC287, then we designed a
testcase to reboot and check the codec probing result repeatedly, we
found the analogue codec probing always failed at least once within
several minutes to several hours (roughly 1 reboot per min). This
issue happens on all laptops of this Thinkstation model, but with
legacy HDA driver, we couldn't reproduce this issue on those laptops.
And so far, this issue is not reproduced on machines which don't
belong to this model.

We tried to make the hda_dsp_ctrl_init_chip() same as
hda_intel_init_chip() which is the controller init routine in the
legacy HDA driver, but it didn't help.

We found when issue happens, the resp is -1, and if we let driver
re-run send_cmd() and get_response(), it will get the correct response
10ec0287, then driver continues the rest work, finally boot to the
desktop and all audio function work well.

Here adding codec probing retries to 3 times, it could fix the issue
on this Thinkstation model, and it doesn't bring impact to other
machines.

Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Hui Wang <hui.wang@canonical.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

Notes:
 - patch for-5.16 on top of for-5.16 8a724d5f60

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 6744318de612..13cd96e6724a 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -22,6 +22,7 @@
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 #define IDISP_VID_INTEL	0x80860000
+#define CODEC_PROBE_RETRIES 3
 
 /* load the legacy HDA codec driver */
 static int request_codec_module(struct hda_codec *codec)
@@ -121,12 +122,15 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 	u32 hda_cmd = (address << 28) | (AC_NODE_ROOT << 20) |
 		(AC_VERB_PARAMETERS << 8) | AC_PAR_VENDOR_ID;
 	u32 resp = -1;
-	int ret;
+	int ret, retry = 0;
+
+	do {
+		mutex_lock(&hbus->core.cmd_mutex);
+		snd_hdac_bus_send_cmd(&hbus->core, hda_cmd);
+		snd_hdac_bus_get_response(&hbus->core, address, &resp);
+		mutex_unlock(&hbus->core.cmd_mutex);
+	} while (resp == -1 && retry++ < CODEC_PROBE_RETRIES);
 
-	mutex_lock(&hbus->core.cmd_mutex);
-	snd_hdac_bus_send_cmd(&hbus->core, hda_cmd);
-	snd_hdac_bus_get_response(&hbus->core, address, &resp);
-	mutex_unlock(&hbus->core.cmd_mutex);
 	if (resp == -1)
 		return -EIO;
 	dev_dbg(sdev->dev, "HDA codec #%d probed OK: response: %x\n",

base-commit: 8a724d5f60904084e09de2685ff9e77bc8a40815
-- 
2.34.1

