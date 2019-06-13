Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3353044BD6
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 21:12:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5F031878;
	Thu, 13 Jun 2019 21:11:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5F031878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560453137;
	bh=4EkIXnlaEtMltSknAEACh+66HvZyoBVUZiQjar4iikw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=uffAuoK2RqG4cotwnaum55WILjE0HOUMybpnvtVqb7yVtffJqE18l6S88oH+/sZek
	 gLUsxNNU21zZsvoJOvYI5TiUw3AocQVM+d0e+1XUk9i9IQccrEurE6nlHC2G4SRiBA
	 ToJx6pFKeIEtPV3066bzVFDqm/Z4rXSzv59EA/ag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 335C7F89759;
	Thu, 13 Jun 2019 21:06:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7106CF89759; Thu, 13 Jun 2019 21:06:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50672F89755
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 21:05:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50672F89755
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="v/r2t1ar"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=kO2nYPvI6ZKQ3ZaZlyIIZQ7pBg9vcnyXCwRGCzNOg8Y=; b=v/r2t1argtxJ
 5jsqDPi5xbrWG3yChCtY3v8JT6hn4wQPxm68y4dL1pfOSJFXH65n3qv71Q0WG2Pyb3CWOUz7xo790
 3x/S1fgkme9XO255cWWYDAlrj6zr1Nevg7RAbFApa5gcHkPqJaXsPGZqCJfWrubOg37tuEOEtg1US
 cd3DQ=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hbV2t-0005RO-F5; Thu, 13 Jun 2019 19:05:59 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id D05F4440049; Thu, 13 Jun 2019 20:05:58 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
In-Reply-To: <20190612170148.15327-4-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190613190558.D05F4440049@finisterre.sirena.org.uk>
Date: Thu, 13 Jun 2019 20:05:58 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Add DMIC token for unmute gain
	ramp time" to the asoc tree
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

   ASoC: SOF: Add DMIC token for unmute gain ramp time

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 7df43911e92aa2137ae77ae60efaa9d6656df3fe Mon Sep 17 00:00:00 2001
From: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Date: Wed, 12 Jun 2019 12:01:47 -0500
Subject: [PATCH] ASoC: SOF: Add DMIC token for unmute gain ramp time

The settling time of DMIC DC level is both platform and used
microphone model specific. The unmute gain ramp is used to conceal
most of the large DC level seen in beginning of capture. This patch
adds into the DMIC DAI IPC struct a new field called unmute_ramp_time
and a new token SOF_TKN_INTEL_DMIC_UNMUTE_RAMP_TIME. The value is the
ramp length in milliseconds (ms).

The ABI minor version is incremented for this backwards compatible
change.

Signed-off-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof/dai-intel.h   | 3 ++-
 include/uapi/sound/sof/abi.h    | 2 +-
 include/uapi/sound/sof/tokens.h | 1 +
 sound/soc/sof/topology.c        | 4 ++++
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/sound/sof/dai-intel.h b/include/sound/sof/dai-intel.h
index 4bd83f7adddf..4bb8ee138ba7 100644
--- a/include/sound/sof/dai-intel.h
+++ b/include/sound/sof/dai-intel.h
@@ -167,9 +167,10 @@ struct sof_ipc_dai_dmic_params {
 
 	uint32_t wake_up_time;      /**< Time from clock start to data (us) */
 	uint32_t min_clock_on_time; /**< Min. time that clk is kept on (us) */
+	uint32_t unmute_ramp_time;  /**< Length of logarithmic gain ramp (ms) */
 
 	/* reserved for future use */
-	uint32_t reserved[6];
+	uint32_t reserved[5];
 
 	/**< variable number of pdm controller config */
 	struct sof_ipc_dai_dmic_pdm_ctrl pdm[0];
diff --git a/include/uapi/sound/sof/abi.h b/include/uapi/sound/sof/abi.h
index 92eee681bc62..4a9c24434f42 100644
--- a/include/uapi/sound/sof/abi.h
+++ b/include/uapi/sound/sof/abi.h
@@ -26,7 +26,7 @@
 
 /* SOF ABI version major, minor and patch numbers */
 #define SOF_ABI_MAJOR 3
-#define SOF_ABI_MINOR 7
+#define SOF_ABI_MINOR 8
 #define SOF_ABI_PATCH 0
 
 /* SOF ABI version number. Format within 32bit word is MMmmmppp */
diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index 53ea94bf1c08..dc1b27daaac6 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -85,6 +85,7 @@
 #define SOF_TKN_INTEL_DMIC_NUM_PDM_ACTIVE	605
 #define SOF_TKN_INTEL_DMIC_SAMPLE_RATE		608
 #define SOF_TKN_INTEL_DMIC_FIFO_WORD_LENGTH	609
+#define SOF_TKN_INTEL_DMIC_UNMUTE_RAMP_TIME_MS  610
 
 /* DMIC PDM */
 #define SOF_TKN_INTEL_DMIC_PDM_CTRL_ID		700
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index bbad8053b1bc..8e00f829bfdb 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -779,6 +779,10 @@ static const struct sof_topology_token dmic_tokens[] = {
 	{SOF_TKN_INTEL_DMIC_FIFO_WORD_LENGTH,
 		SND_SOC_TPLG_TUPLE_TYPE_SHORT, get_token_u16,
 		offsetof(struct sof_ipc_dai_dmic_params, fifo_bits), 0},
+	{SOF_TKN_INTEL_DMIC_UNMUTE_RAMP_TIME_MS,
+		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_dai_dmic_params, unmute_ramp_time), 0},
+
 };
 
 /*
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
