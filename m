Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 487EE1C8097
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 05:41:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B89EC17DA;
	Thu,  7 May 2020 05:40:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B89EC17DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588822877;
	bh=Q1NzZp32QuYmJMTpPmDBotvUnuIhPLDqD4WxJ2vYnNE=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kZdyEH1qf4M1WVxs9dHnMtNg7/cWKIHgIxDbe0dIaEgscjWUFHDpTlkXmjVoayeUP
	 6lVRiLenxHFjEMOhF+oJV/+EzTJzEncV2Ca9QW8laIXi6oxQxfdvvoz6Y/uKHVVCYn
	 2+PHUnJMHAYpbjtLWvzenV4TO2yMr3C8J/2ruXfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA71EF80162;
	Thu,  7 May 2020 05:39:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EB79F8015F; Thu,  7 May 2020 05:39:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,UPPERCASE_50_75,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0190.hostedemail.com
 [216.40.44.190])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9A24F8011C;
 Thu,  7 May 2020 05:39:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9A24F8011C
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id D78E01802DF6F;
 Thu,  7 May 2020 03:39:22 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: grip73_6e9eae6cba716
X-Filterd-Recvd-Size: 5159
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf08.hostedemail.com (Postfix) with ESMTPA;
 Thu,  7 May 2020 03:39:20 +0000 (UTC)
Message-ID: <427ca3c1e2d9f9d74ce2f60659da04e267009d2d.camel@perches.com>
Subject: Re: [PATCH -next] ASoC: SOF: Intel: Mark cht_debugfs as __maybe_unused
From: Joe Perches <joe@perches.com>
To: YueHaibing <yuehaibing@huawei.com>,
 pierre-louis.bossart@linux.intel.com,  lgirdwood@gmail.com,
 ranjani.sridharan@linux.intel.com,  kai.vehmanen@linux.intel.com,
 daniel.baluta@nxp.com, broonie@kernel.org,  perex@perex.cz, tiwai@suse.com
Date: Wed, 06 May 2020 20:39:18 -0700
In-Reply-To: <20200507031911.38644-1-yuehaibing@huawei.com>
References: <20200507031911.38644-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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

On Thu, 2020-05-07 at 11:19 +0800, YueHaibing wrote:
> When CONFIG_SND_SOC_SOF_BAYTRAIL is not set, gcc warns:
> 
> sound/soc/sof/intel/byt.c:85:41: warning: ‘cht_debugfs’ defined but not used [-Wunused-const-variable=]
>  static const struct snd_sof_debugfs_map cht_debugfs[] = {
>                                          ^~~~~~~~~~~
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  sound/soc/sof/intel/byt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
> index f872bb1f2682..1c75e4220e9d 100644
> --- a/sound/soc/sof/intel/byt.c
> +++ b/sound/soc/sof/intel/byt.c
> @@ -82,7 +82,7 @@ static const struct snd_sof_debugfs_map byt_debugfs[] = {
>  	 SOF_DEBUGFS_ACCESS_ALWAYS},
>  };
>  
> -static const struct snd_sof_debugfs_map cht_debugfs[] = {
> +static const struct snd_sof_debugfs_map __maybe_unused cht_debugfs[] = {
>  	{"dmac0", BYT_DSP_BAR, DMAC0_OFFSET, DMAC_SIZE,
>  	 SOF_DEBUGFS_ACCESS_ALWAYS},
>  	{"dmac1", BYT_DSP_BAR,  DMAC1_OFFSET, DMAC_SIZE,

Likely better moving the struct instead inside the
#ifdef block
---
 sound/soc/sof/intel/byt.c | 54 +++++++++++++++++++++++------------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index f872bb1f2682..3747f2c2c28b 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -82,33 +82,6 @@ static const struct snd_sof_debugfs_map byt_debugfs[] = {
 	 SOF_DEBUGFS_ACCESS_ALWAYS},
 };
 
-static const struct snd_sof_debugfs_map cht_debugfs[] = {
-	{"dmac0", BYT_DSP_BAR, DMAC0_OFFSET, DMAC_SIZE,
-	 SOF_DEBUGFS_ACCESS_ALWAYS},
-	{"dmac1", BYT_DSP_BAR,  DMAC1_OFFSET, DMAC_SIZE,
-	 SOF_DEBUGFS_ACCESS_ALWAYS},
-	{"dmac2", BYT_DSP_BAR,  DMAC2_OFFSET, DMAC_SIZE,
-	 SOF_DEBUGFS_ACCESS_ALWAYS},
-	{"ssp0",  BYT_DSP_BAR, SSP0_OFFSET, SSP_SIZE,
-	 SOF_DEBUGFS_ACCESS_ALWAYS},
-	{"ssp1", BYT_DSP_BAR, SSP1_OFFSET, SSP_SIZE,
-	 SOF_DEBUGFS_ACCESS_ALWAYS},
-	{"ssp2", BYT_DSP_BAR, SSP2_OFFSET, SSP_SIZE,
-	 SOF_DEBUGFS_ACCESS_ALWAYS},
-	{"ssp3", BYT_DSP_BAR, SSP3_OFFSET, SSP_SIZE,
-	 SOF_DEBUGFS_ACCESS_ALWAYS},
-	{"ssp4", BYT_DSP_BAR, SSP4_OFFSET, SSP_SIZE,
-	 SOF_DEBUGFS_ACCESS_ALWAYS},
-	{"ssp5", BYT_DSP_BAR, SSP5_OFFSET, SSP_SIZE,
-	 SOF_DEBUGFS_ACCESS_ALWAYS},
-	{"iram", BYT_DSP_BAR, IRAM_OFFSET, IRAM_SIZE,
-	 SOF_DEBUGFS_ACCESS_D0_ONLY},
-	{"dram", BYT_DSP_BAR, DRAM_OFFSET, DRAM_SIZE,
-	 SOF_DEBUGFS_ACCESS_D0_ONLY},
-	{"shim", BYT_DSP_BAR, SHIM_OFFSET, SHIM_SIZE_CHT,
-	 SOF_DEBUGFS_ACCESS_ALWAYS},
-};
-
 static void byt_host_done(struct snd_sof_dev *sdev);
 static void byt_dsp_done(struct snd_sof_dev *sdev);
 static void byt_get_reply(struct snd_sof_dev *sdev);
@@ -681,6 +654,33 @@ EXPORT_SYMBOL_NS(tng_chip_info, SND_SOC_SOF_MERRIFIELD);
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
 
+static const struct snd_sof_debugfs_map cht_debugfs[] = {
+	{"dmac0", BYT_DSP_BAR, DMAC0_OFFSET, DMAC_SIZE,
+	 SOF_DEBUGFS_ACCESS_ALWAYS},
+	{"dmac1", BYT_DSP_BAR,  DMAC1_OFFSET, DMAC_SIZE,
+	 SOF_DEBUGFS_ACCESS_ALWAYS},
+	{"dmac2", BYT_DSP_BAR,  DMAC2_OFFSET, DMAC_SIZE,
+	 SOF_DEBUGFS_ACCESS_ALWAYS},
+	{"ssp0",  BYT_DSP_BAR, SSP0_OFFSET, SSP_SIZE,
+	 SOF_DEBUGFS_ACCESS_ALWAYS},
+	{"ssp1", BYT_DSP_BAR, SSP1_OFFSET, SSP_SIZE,
+	 SOF_DEBUGFS_ACCESS_ALWAYS},
+	{"ssp2", BYT_DSP_BAR, SSP2_OFFSET, SSP_SIZE,
+	 SOF_DEBUGFS_ACCESS_ALWAYS},
+	{"ssp3", BYT_DSP_BAR, SSP3_OFFSET, SSP_SIZE,
+	 SOF_DEBUGFS_ACCESS_ALWAYS},
+	{"ssp4", BYT_DSP_BAR, SSP4_OFFSET, SSP_SIZE,
+	 SOF_DEBUGFS_ACCESS_ALWAYS},
+	{"ssp5", BYT_DSP_BAR, SSP5_OFFSET, SSP_SIZE,
+	 SOF_DEBUGFS_ACCESS_ALWAYS},
+	{"iram", BYT_DSP_BAR, IRAM_OFFSET, IRAM_SIZE,
+	 SOF_DEBUGFS_ACCESS_D0_ONLY},
+	{"dram", BYT_DSP_BAR, DRAM_OFFSET, DRAM_SIZE,
+	 SOF_DEBUGFS_ACCESS_D0_ONLY},
+	{"shim", BYT_DSP_BAR, SHIM_OFFSET, SHIM_SIZE_CHT,
+	 SOF_DEBUGFS_ACCESS_ALWAYS},
+};
+
 static int byt_acpi_probe(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *pdata = sdev->pdata;


