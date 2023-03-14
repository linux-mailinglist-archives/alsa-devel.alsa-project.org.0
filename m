Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF8C6B8DD8
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 09:53:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 320A913D9;
	Tue, 14 Mar 2023 09:53:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 320A913D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678784035;
	bh=ML4BML1OKhjlnRUQoQ6OI+3YQafSKj486n51EghHXxU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VwhnhkItW0cTxu4ZNz6QVlHqzVF7FW3q1SZXYyWf9Km79uT3Sg8yXUAdZhIczT8WZ
	 qwlBGG3g8/RTadVjjzJe17Uw1tBNGSnQ+bKGe3JV6qu1H9wwixw41xZ8HsTf8sQKxQ
	 08tca8lQG2uauzAvdWrtwbmHMqWw5bjXeQ/4npYI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73968F80527;
	Tue, 14 Mar 2023 09:52:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1A20F804FE; Tue, 14 Mar 2023 09:52:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AAA40F8032D
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 09:52:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAA40F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BIlo8jsw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678783929; x=1710319929;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ML4BML1OKhjlnRUQoQ6OI+3YQafSKj486n51EghHXxU=;
  b=BIlo8jswRHLmaHO0twtTBwB29JLksxLOvAxXyvx/cbpa9L8zA/7z21oP
   sjZSTJmsNUZDf5wKtCTThN+Lxc5MqGJYa3siibvUcKeePP1x5igbB7qR2
   ep7RaEjaA0AEHbVKMzo+FeHweXZVAewpKPfgeN9xcV546NmozvfaYIFXK
   Lhsz2HQqeWzkAYlUnA3N7q6ITCI7ftJI5XnTLB0za3kHZDwoPHJroSzHB
   JUxMrWPJC8FRLQR3rNITb1A4x/LC31QGhvm5Hj3MBmtP4qAau0gBfjt6r
   xMa6ibOkAOh+R7QyH089oUwWgakYSKT0A87tsesbIIe9gnoRcl6mCORay
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="336060859"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400";
   d="scan'208";a="336060859"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 01:51:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="711438082"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400";
   d="scan'208";a="711438082"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 01:51:52 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 2/2] ASoC: Intel: soc-acpi: add table for Intel 'Rooks County'
 NUC M15
Date: Tue, 14 Mar 2023 17:05:53 +0800
Message-Id: <20230314090553.498664-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314090553.498664-1-yung-chuan.liao@linux.intel.com>
References: <20230314090553.498664-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IVALZQBBR62BG3MBRSDTP6RX6RIIIIR7
X-Message-ID-Hash: IVALZQBBR62BG3MBRSDTP6RX6RIIIIR7
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 vkoul@kernel.org, bard.liao@intel.com, peter.ujfalusi@linux.intel.com,
 vinod.koul@linaro.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IVALZQBBR62BG3MBRSDTP6RX6RIIIIR7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Eugene Huang <eugene.huang99@gmail.com>

Same topology as the HP Omen 16-k0005TX, except with the rt1316 amp
on link2.

Link: https://github.com/thesofproject/linux/issues/4088
Signed-off-by: Eugene Huang <eugene.huang99@gmail.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-adl-match.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 28dd2046e4ac..d8c80041388a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -354,6 +354,20 @@ static const struct snd_soc_acpi_link_adr adl_sdw_rt711_link0_rt1316_link3[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr adl_sdw_rt711_link0_rt1316_link2[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_sdca_0_adr),
+		.adr_d = rt711_sdca_0_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1316_2_single_adr),
+		.adr_d = rt1316_2_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_adr_device mx8373_2_adr[] = {
 	{
 		.adr = 0x000223019F837300ull,
@@ -624,6 +638,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-adl-rt711-l0-rt1316-l3.tplg",
 	},
+	{
+		.link_mask = 0x5, /* 2 active links required */
+		.links = adl_sdw_rt711_link0_rt1316_link2,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-adl-rt711-l0-rt1316-l2.tplg",
+	},
 	{
 		.link_mask = 0x1, /* link0 required */
 		.links = adl_rvp,
-- 
2.25.1

