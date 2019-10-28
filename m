Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 434CCE747B
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 16:09:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC3921FD5;
	Mon, 28 Oct 2019 16:08:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC3921FD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572275351;
	bh=JjPqbqvvzsxvdTA5UGwU/P/rwjJP+XRbBrIR7FqKLq8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=RgTL/KAdSZpK8jddPtvKdUtlJAmNOQUugeKGM7AvIHSvGHHbFc/iz2vbI1rMMkpye
	 4touKKtsExjPJ0C+1AsqW/duqyWCnZekmmo41xnPvjsIROgbGH5eLxnHCBzx5yDP/D
	 HFb9+3BIS/68fuxIlKYlTftMoc8/PZX8s6V2MgNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5195F80756;
	Mon, 28 Oct 2019 15:57:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C767DF806ED; Mon, 28 Oct 2019 15:56:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26E53F8060E
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 15:56:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26E53F8060E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="LtLYaAgv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=1WQwKVTKhgb6TXLZ72rWeNuaegbFvQjNo2SI2wsCpSM=; b=LtLYaAgvsp4A
 hV5IA6gXKPHf0626mV1VHygvuUwSsC8pybfNbeZHEYCWdeQ6q4+erWdC8W67M3IcaaDhPI4jEnMAG
 o0FY8oIbUElRfpaqZlW4Qh7cBE7oCqW9FgBCkzWI6O0HX9TQeredLO/Kc366Qut/wVx7/5oFfg5um
 RZSTI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iP6Rd-0008Ps-MA; Mon, 28 Oct 2019 14:56:33 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id DBFF72741792; Mon, 28 Oct 2019 14:56:31 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20191025224122.7718-9-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191028145631.DBFF72741792@ypsilon.sirena.org.uk>
Date: Mon, 28 Oct 2019 14:56:31 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: token: add tokens for PCM
	compatible with D0i3 substate" to the asoc tree
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

   ASoC: SOF: token: add tokens for PCM compatible with D0i3 substate

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 4a94940988cc44adeb383401dea0beeac4abbe63 Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Fri, 25 Oct 2019 17:41:04 -0500
Subject: [PATCH] ASoC: SOF: token: add tokens for PCM compatible with D0i3
 substate

Add stream token SOF_TKN_STREAM_PLAYBACK_COMPATIBLE_D0I3 and
SOF_TKN_STREAM_CAPTURE_COMPATIBLE_D0I3 to denote if the stream can be
opened at low power d0i3 status or not.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191025224122.7718-9-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/uapi/sound/sof/tokens.h |  4 ++++
 sound/soc/sof/topology.c        | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index d65406f34361..76883e6fb750 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -113,6 +113,10 @@
 /* ESAI */
 #define SOF_TKN_IMX_ESAI_MCLK_ID		1100
 
+/* Stream */
+#define SOF_TKN_STREAM_PLAYBACK_COMPATIBLE_D0I3	1200
+#define SOF_TKN_STREAM_CAPTURE_COMPATIBLE_D0I3	1201
+
 /* Led control for mute switches */
 #define SOF_TKN_MUTE_LED_USE			1300
 #define SOF_TKN_MUTE_LED_DIRECTION		1301
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index b3ab6f23fc93..121e5d6f8477 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -567,6 +567,16 @@ static const struct sof_topology_token pcm_tokens[] = {
 		offsetof(struct sof_ipc_comp_host, dmac_config), 0},
 };
 
+/* PCM */
+static const struct sof_topology_token stream_tokens[] = {
+	{SOF_TKN_STREAM_PLAYBACK_COMPATIBLE_D0I3,
+		SND_SOC_TPLG_TUPLE_TYPE_BOOL, get_token_u16,
+		offsetof(struct snd_sof_pcm, stream[0].d0i3_compatible), 0},
+	{SOF_TKN_STREAM_CAPTURE_COMPATIBLE_D0I3,
+		SND_SOC_TPLG_TUPLE_TYPE_BOOL, get_token_u16,
+		offsetof(struct snd_sof_pcm, stream[1].d0i3_compatible), 0},
+};
+
 /* Generic components */
 static const struct sof_topology_token comp_tokens[] = {
 	{SOF_TKN_COMP_PERIOD_SINK_COUNT,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
