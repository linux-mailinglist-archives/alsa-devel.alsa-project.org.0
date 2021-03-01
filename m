Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB5C329559
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 00:59:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B7E816AD;
	Tue,  2 Mar 2021 00:58:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B7E816AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614643157;
	bh=17N/Jz5OzneohTyFuoBA2XUE7+/6DQCDhNeUgMO6W84=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fE+LkNNICJRGCU8sn5a4HLhoOI/erkVNNgYk5Wke/hcAkVokXkDib3QOYcz2dRuZu
	 DkJLThvu7Mod+CxXBD3s0kSgMcpCXPtp+FlUf3qhQeWaanWweUo51VA1yZdB4FaiCL
	 cZ7PHVbCBF+0JsymUtauIbJ4wIaKbDxIic5qRzaI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57174F800E0;
	Tue,  2 Mar 2021 00:56:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52CA1F802E0; Tue,  2 Mar 2021 00:56:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C5D6F8026A
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 00:56:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C5D6F8026A
IronPort-SDR: 9kTGIE3VClZJOchIq5qt5hGh6afxATeF9Nj+1k6RKXrl5tx7MdoazjvSH1dk3TAzW84I5LcaG/
 UKRDhMFEXafQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="184195008"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="184195008"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 15:56:47 -0800
IronPort-SDR: PCubHnHkdixS7vaesBTJ3Jf6oyPsZH8DsNLKmD8I4iQ3qiT4V1gb2anVV4Du45OopJoernohOh
 n+pqrtG0ljGQ==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="406449846"
Received: from josemrod-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.215.233])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 15:56:46 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: Intel: soc-acpi: remove TGL RVP mixed SoundWire/TDM
 config
Date: Mon,  1 Mar 2021 17:56:37 -0600
Message-Id: <20210301235637.1177525-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210301235637.1177525-1-pierre-louis.bossart@linux.intel.com>
References: <20210301235637.1177525-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Bard Liao <bard.liao@intel.com>
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

The TGL RVP can be configured in many ways. We initially supported a
mixed configuration with RT711 in SoundWire mode and RT1308 in
TDM mode.

However Intel teams no longer have any hardware with this
configuration and there are no commercially-available devices using it
either, so let's remove this entry. The corresponding topology will
also be removed from the SOF tree.

This patch partially reverts Commit d985d208bf8f ("ASoC: Intel: common: add match tables for TGL w/ SoundWire")

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 .../soc/intel/common/soc-acpi-intel-tgl-match.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index e8640ee10012..b5f05b81a584 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -182,15 +182,6 @@ static const struct snd_soc_acpi_adr_device rt714_3_adr[] = {
 	}
 };
 
-static const struct snd_soc_acpi_link_adr tgl_i2s_rt1308[] = {
-	{
-		.mask = BIT(0),
-		.num_adr = ARRAY_SIZE(rt711_0_adr),
-		.adr_d = rt711_0_adr,
-	},
-	{}
-};
-
 static const struct snd_soc_acpi_link_adr tgl_rvp[] = {
 	{
 		.mask = BIT(0),
@@ -330,14 +321,6 @@ static const struct snd_soc_acpi_codecs tgl_rt1011_amp = {
 };
 
 struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
-	{
-		.id = "10EC1308",
-		.drv_name = "sof_sdw",
-		.link_mask = 0x1, /* RT711 on SoundWire link0 */
-		.links = tgl_i2s_rt1308,
-		.sof_fw_filename = "sof-tgl.ri",
-		.sof_tplg_filename = "sof-tgl-rt711-i2s-rt1308.tplg",
-	},
 	{
 		.id = "10EC5682",
 		.drv_name = "tgl_max98357a_rt5682",
-- 
2.25.1

