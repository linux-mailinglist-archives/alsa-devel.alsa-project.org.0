Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 364FB3B49E0
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Jun 2021 22:53:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6E00166E;
	Fri, 25 Jun 2021 22:53:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6E00166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624654434;
	bh=+wnyo0bZ5KXuDr+BZj5RnGudnpKxjSNRGNK01KDJOvE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SAW6/TfLu0RqRu8eC0Na4kvgrd07JGFa7euN8XMGDQ7e/zAHZv38aOdz93fGU9kTQ
	 VkNhKb0fTLwx2SP7HwSdRZ+vBKvgp7RFygh3kgTj3HUMfTHYmMrtFcpxQLlIael0vj
	 mpF0FNq7gpAQGa2qhJKPzgrCaZsrzLKmBYPUHg/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 547F8F804E0;
	Fri, 25 Jun 2021 22:51:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EFF4F804E0; Fri, 25 Jun 2021 22:51:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6124F80290
 for <alsa-devel@alsa-project.org>; Fri, 25 Jun 2021 22:51:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6124F80290
IronPort-SDR: qkntY+iahy1gC03D5EfJzzJ4H4w7CPX59kMLZqVtTIsh7QFunjetMXaM5XHidTzfRJ1UJyjuAR
 ta8kNOLYPEOw==
X-IronPort-AV: E=McAfee;i="6200,9189,10026"; a="188122680"
X-IronPort-AV: E=Sophos;i="5.83,299,1616482800"; d="scan'208";a="188122680"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 13:51:11 -0700
IronPort-SDR: rlMdf2Pd51RizCL3EPGIzr65oNGsyYNOlKr5FLLEgo/8cSeh1WbwHAJuKKkRPF18kKNb+Z2T7s
 FS/aSxFuC7ug==
X-IronPort-AV: E=Sophos;i="5.83,299,1616482800"; d="scan'208";a="640223032"
Received: from rlcervan-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.127.151])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 13:50:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ASoC: Intel: soc-acpi: add support for SoundWire of
 TGL-H-RVP
Date: Fri, 25 Jun 2021 15:50:40 -0500
Message-Id: <20210625205042.65181-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625205042.65181-1-pierre-louis.bossart@linux.intel.com>
References: <20210625205042.65181-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Gongjun Song <gongjun.song@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

From: Gongjun Song <gongjun.song@intel.com>

snd_soc_acpi_intel_tgl_sdw_machines structure array does not contain
the configuration information of TGL-H-RVP, which results in the
inability to enable soundwire on the TGL-H-RVP platform.

Add the corresponding configuration information to enable soundwire
on the TGL-H-RVP platform.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Gongjun Song <gongjun.song@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 66595e3ab13f..d9b8902658c7 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -196,6 +196,15 @@ static const struct snd_soc_acpi_link_adr tgl_rvp[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr tgl_rvp_headset_only[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_0_adr),
+		.adr_d = rt711_0_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr tgl_hp[] = {
 	{
 		.mask = BIT(0),
@@ -398,6 +407,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-tgl-sdw-max98373-rt5682.tplg",
 	},
+	{
+		.link_mask = 0x1, /* rt711 on link 0 */
+		.links = tgl_rvp_headset_only,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-tgl-rt711.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_tgl_sdw_machines);
-- 
2.25.1

