Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 085046B8DDC
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 09:54:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AED713C0;
	Tue, 14 Mar 2023 09:53:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AED713C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678784054;
	bh=+Yj0GSMmOs2YYXqr06EInVLu8RfOxE3KaMBdDBlgZbk=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AQifct7+BlpnoyPygasmaVEz3BOyVfjxnxpyBbJNTnBNawkcEH0/FRXcgKd1XZkji
	 1i9miCLmAC6rK8Y8dg9jV3+6dBuZOPEIJJ9KMPxRJAxmPsOpQcgPAZkSnqygk/ceSB
	 2bo0PhDzNWutTA0G4qaMHG1QaldRjM3G3d3S9eVc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D396AF80533;
	Tue, 14 Mar 2023 09:52:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E87CF80534; Tue, 14 Mar 2023 09:52:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6ADBDF8052D
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 09:52:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ADBDF8052D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ME6sMo7e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678783944; x=1710319944;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+Yj0GSMmOs2YYXqr06EInVLu8RfOxE3KaMBdDBlgZbk=;
  b=ME6sMo7eqwWoTFt9pKYH3nv2w5snJi585lxR0C8W5+txWhu0Krjahgqj
   LtajmNux3TPUgFmKi1svlwCkwKHnO6yBXtdx8Zukho/Ml3GaZvFeDfLxa
   auHoSi9kZb86slale4G4v657MzuyCqYlfn0LOK8SqUPN/X0N21R0CyQDo
   wNwS/FwUiifvkNDwqQWDdr9ylNCrMQuYn7RN+t4e+n62EF95vDDQ7llfo
   aRDk8PwdnHA/sm1A/HNsLhQKX6Bfa7HljZ4XIxdl+v0GMgO3NRBSEF2VQ
   zYhEsYsaJQBB2ztvmCV2uwqk4N8clqWZp1OLB6Jxb8ARwVh2uoZYQVMne
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="399956498"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400";
   d="scan'208";a="399956498"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 01:52:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="768011941"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400";
   d="scan'208";a="768011941"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 01:52:08 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: dmi-quirks: add remapping for Intel 'Rooks County'
 NUC M15
Date: Tue, 14 Mar 2023 17:06:18 +0800
Message-Id: <20230314090618.498716-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IMOVHB3YIQC6ATDJTL5Q4S6HON6Q2I5B
X-Message-ID-Hash: IMOVHB3YIQC6ATDJTL5Q4S6HON6Q2I5B
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com,
 broonie@kernel.org, peter.ujfalusi@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IMOVHB3YIQC6ATDJTL5Q4S6HON6Q2I5B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Eugene Huang <eugene.huang99@gmail.com>

Same DSDT problem as the HP Omen 16-k0005TX, except rt1316 amp is on
link2.

Link: https://github.com/thesofproject/linux/issues/4088
Signed-off-by: Eugene Huang <eugene.huang99@gmail.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
To support 'Rooks County', we also need the
"ASOC: Intel: add quirk for Intel 'Rooks County' NUC M15" series.

---
 drivers/soundwire/dmi-quirks.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index 7969881f126d..58ea013fa918 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -73,6 +73,23 @@ static const struct adr_remap hp_omen_16[] = {
 	{}
 };
 
+/*
+ * Intel NUC M15 LAPRC510 and LAPRC710
+ */
+static const struct adr_remap intel_rooks_county[] = {
+	/* rt711-sdca on link0 */
+	{
+		0x000020025d071100ull,
+		0x000030025d071101ull
+	},
+	/* rt1316-sdca on link2 */
+	{
+		0x000120025d071100ull,
+		0x000230025d131601ull
+	},
+	{}
+};
+
 static const struct dmi_system_id adr_remap_quirk_table[] = {
 	/* TGL devices */
 	{
@@ -98,6 +115,14 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
 		},
 		.driver_data = (void *)intel_tgl_bios,
 	},
+	{
+		/* quirk used for NUC15 'Rooks County' LAPRC510 and LAPRC710 skews */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel(R) Client Systems"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LAPRC"),
+		},
+		.driver_data = (void *)intel_rooks_county,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
-- 
2.25.1

