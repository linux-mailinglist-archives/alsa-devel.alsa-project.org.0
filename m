Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C57331910B
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Feb 2021 18:30:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C275171E;
	Thu, 11 Feb 2021 18:29:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C275171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613064610;
	bh=arw48UtC8AowI1ngsquZs6+RjuU07Gj43UaB4iWwg+A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mVSgngkvd9BkhpfFk6LAnREhXo3ydnm5swGqKXfrtLErgzxrcR7O95s1YbV2MgGnh
	 4b1rqHD7DET5sJQt6Jg3i4/vUWMxKpTkxjifmfqIfPJctkQcl0gfmOD4FMR65In1mx
	 9NoCkJ76zKAVWGc1Ud/BDf8kmOU9LKsK5JOWbv/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52F32F801EB;
	Thu, 11 Feb 2021 18:28:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C402F801D5; Thu, 11 Feb 2021 18:28:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14A0EF8014D
 for <alsa-devel@alsa-project.org>; Thu, 11 Feb 2021 18:28:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14A0EF8014D
IronPort-SDR: aLupBsB+rzi0jSejyJyuNimmf47rOspCm8aXTgheDlCU77r3m5A8itl4dgscfz3fQKHo0rOEYS
 +6IpiDYCZmWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9892"; a="182353269"
X-IronPort-AV: E=Sophos;i="5.81,170,1610438400"; d="scan'208";a="182353269"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2021 09:28:12 -0800
IronPort-SDR: QPvSvrz3dpCd7U2dPKTlZdu/qeilh43D2NkukETdWhJOXqMcehbm+AAoaQaCfhMxL81jwX3wsM
 u4DImxRbpi5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,170,1610438400"; d="scan'208";a="437250871"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga001.jf.intel.com with ESMTP; 11 Feb 2021 09:28:07 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: relax ABI checks and avoid unnecessary warnings
Date: Thu, 11 Feb 2021 19:24:40 +0200
Message-Id: <20210211172440.2371447-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

With recent SOF 1.7 pre-releases, kernel has been emitting following
warnings at probe:

[10006.645216] sof-audio-pci 0000:00:1f.3: warn: FW ABI is more recent than kernel
[10006.652137] sof-audio-pci 0000:00:1f.3: warn: topology ABI is more recent than kernel

The warnings are emitted due to increase of the patch-level in firmware
mainline (to 3.17.1). But the patch level should not be considered even
in the strict ABI check, so modify the kernel side logic that makes the
check and only consider the major.minor components.

BugLink: https://github.com/thesofproject/linux/issues/2647
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc.c      | 2 +-
 sound/soc/sof/topology.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 1bc3d6282f16..c2d07b783f60 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -798,7 +798,7 @@ int snd_sof_ipc_valid(struct snd_sof_dev *sdev)
 		return -EINVAL;
 	}
 
-	if (v->abi_version > SOF_ABI_VERSION) {
+	if (SOF_ABI_VERSION_MINOR(v->abi_version) > SOF_ABI_MINOR) {
 		if (!IS_ENABLED(CONFIG_SND_SOC_SOF_STRICT_ABI_CHECKS)) {
 			dev_warn(sdev->dev, "warn: FW ABI is more recent than kernel\n");
 		} else {
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index d6e1f33eb1e9..10f99620eb31 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -3658,7 +3658,7 @@ static int sof_manifest(struct snd_soc_component *scomp, int index,
 		return -EINVAL;
 	}
 
-	if (abi_version > SOF_ABI_VERSION) {
+	if (SOF_ABI_VERSION_MINOR(abi_version) > SOF_ABI_MINOR) {
 		if (!IS_ENABLED(CONFIG_SND_SOC_SOF_STRICT_ABI_CHECKS)) {
 			dev_warn(scomp->dev, "warn: topology ABI is more recent than kernel\n");
 		} else {

base-commit: ec9d68508ff65df1dc24cf8100eb40ddd196c2fd
-- 
2.29.2

