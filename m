Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FF68F1F4
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:19:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 285421664;
	Thu, 15 Aug 2019 19:18:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 285421664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565889580;
	bh=bMAX9ePXrUNiQ4OOWVEZJDNPP38Xk0NZ9fgdkFwPwKs=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Nyfvk5yX7iNNOI3XScTnnV9NkAHqAxQf3gu88RgHM89A4k8zlKL2jXJ6tz/kV5HdC
	 uudd7KJ8+s8BNtZVFt4XotBfuogFT3s7r5PSJZuy/FwLFnQFIyTiIMNHhyFAopm4sZ
	 WREhxBFvi9L1yULXAah6oHE0CfemLnwL6K4anD4E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 276A1F805AA;
	Thu, 15 Aug 2019 19:15:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D764DF8065B; Thu, 15 Aug 2019 19:14:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f97.google.com (mail-ed1-f97.google.com
 [209.85.208.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 465D0F8049A
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:14:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 465D0F8049A
Received: by mail-ed1-f97.google.com with SMTP id z51so2672850edz.13
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=wv1gekDXzf8YQ5JU15ivBG47mD9SV5ybDUtiI0byxdg=;
 b=tx1qz4mW8p6xDKrFff20sO8lR6IcIIRMgPb7XNWzrga8YIfMxNv8gD4QmuGyGFruf7
 neH/k30DWVgeg867y5D8P4pLzfeuKufj5vbNPXlrWSCBGmv6ktTy28PkHQzCxaz0m92e
 t15qsIfA1AzCmFdH/ZD05UG2aTAeYsDv38M8Caa/i9J5xUct9wrBAoKWkfCb6LgQXYMS
 m1og3qdkTmCsIX57CzEhqDJAwrcbUS0rnawUUPednCezDZ01bTW9Z5qqxkgnxk+i2Thd
 vaYO0iREhIufneOVd6jBWt4MvbGZsLRU2m+Rld6tvOuxvVXfrGBK6+N3DJelU9Dd3nZT
 LyTQ==
X-Gm-Message-State: APjAAAUzVZaHsaju1YgaFcli75GYM3oxcOp1XhQsOUs22dejtlJs5buH
 vtvAaZBV4KaybETowj8mTK5jX/JgCO6jdqIO966Ja+ojsFEY+HdmW7PP1o3aEGVfJA==
X-Google-Smtp-Source: APXvYqxdqNHc0t8r5i+eZqiRPHJWxvCzRnlSZIp6o32ol1EzKDO5RVxgowSIPUuiBr7KT/T7jbli8gAW3QvK
X-Received: by 2002:a50:884b:: with SMTP id c11mr6618674edc.138.1565889262603; 
 Thu, 15 Aug 2019 10:14:22 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id f12sm11671ejf.39.2019.08.15.10.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:14:22 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJKQ-00050w-4Z; Thu, 15 Aug 2019 17:14:22 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 9C3B12742BE9; Thu, 15 Aug 2019 18:14:21 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20190815155032.29181-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190815171421.9C3B12742BE9@ypsilon.sirena.org.uk>
Date: Thu, 15 Aug 2019 18:14:21 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: ipc: add ALH parameters" to the
	asoc tree
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

   ASoC: SOF: ipc: add ALH parameters

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

From 3a9477a06c6acb4234407b59999835a6f12f889d Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Thu, 15 Aug 2019 10:50:30 -0500
Subject: [PATCH] ASoC: SOF: ipc: add ALH parameters

The only configuration parameter is the ALH stream ID. No range
checking is done by the driver, the firmware should check that the
stream is valid for a specific hardware.

Bump the ABI Minor number to keep the alignment with SOF firmware

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190815155032.29181-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof/dai-intel.h | 9 +++++++++
 include/sound/sof/dai.h       | 1 +
 include/uapi/sound/sof/abi.h  | 2 +-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/sound/sof/dai-intel.h b/include/sound/sof/dai-intel.h
index a81afd3fbd41..b03e2ec08694 100644
--- a/include/sound/sof/dai-intel.h
+++ b/include/sound/sof/dai-intel.h
@@ -179,4 +179,13 @@ struct sof_ipc_dai_dmic_params {
 	struct sof_ipc_dai_dmic_pdm_ctrl pdm[0];
 } __packed;
 
+/* ALH Configuration Request - SOF_IPC_DAI_ALH_CONFIG */
+struct sof_ipc_dai_alh_params {
+	struct sof_ipc_hdr hdr;
+	uint32_t stream_id;
+
+	/* reserved for future use */
+	uint32_t reserved[15];
+} __packed;
+
 #endif
diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
index 3d174e20aa53..da9825ad41d4 100644
--- a/include/sound/sof/dai.h
+++ b/include/sound/sof/dai.h
@@ -70,6 +70,7 @@ struct sof_ipc_dai_config {
 		struct sof_ipc_dai_ssp_params ssp;
 		struct sof_ipc_dai_dmic_params dmic;
 		struct sof_ipc_dai_hda_params hda;
+		struct sof_ipc_dai_alh_params alh;
 	};
 } __packed;
 
diff --git a/include/uapi/sound/sof/abi.h b/include/uapi/sound/sof/abi.h
index dff70a42445a..a0fe0d4c4b66 100644
--- a/include/uapi/sound/sof/abi.h
+++ b/include/uapi/sound/sof/abi.h
@@ -26,7 +26,7 @@
 
 /* SOF ABI version major, minor and patch numbers */
 #define SOF_ABI_MAJOR 3
-#define SOF_ABI_MINOR 9
+#define SOF_ABI_MINOR 10
 #define SOF_ABI_PATCH 0
 
 /* SOF ABI version number. Format within 32bit word is MMmmmppp */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
