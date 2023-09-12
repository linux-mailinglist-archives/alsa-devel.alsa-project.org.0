Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0663979D664
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 18:35:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20DDFAEA;
	Tue, 12 Sep 2023 18:34:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20DDFAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694536504;
	bh=eUXM8KpOfd4egXeqPaJlBcluB/cKAhLAf21Qes2MLic=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y6yuTrX+lplZK92TG+H2Fb6bQi0/q5b0Pvaf7712KLSDANybxF8ca7oeQjuf6niFN
	 pKEVOZSgOvdSYG2B401Gs8Uz/fzVK2vfpDQpi1jyVlvX3F/d99FtCqlRaJC/r17BDf
	 jlsQ96OJfv85kHfz4jTR1FZfOgVIkv29qHosTpZw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA9EFF80246; Tue, 12 Sep 2023 18:34:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D298F80246;
	Tue, 12 Sep 2023 18:34:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7109DF80549; Tue, 12 Sep 2023 18:34:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05FEBF8007C
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 18:32:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05FEBF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=PXCpdORv
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38CFSmv9002448;
	Tue, 12 Sep 2023 11:32:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=sVc4KTYLdosqBY5c8XnIDGNWqNXt6ODbd7xx+vDE0Ss=; b=
	PXCpdORvKHqpb2pGHkM7k3GueQ9JgwlKBIQVTHx/f8olNtq0WMYoPvicVvPgmRIL
	9H9mdGlonuB0xsrBd2fVCffSiEj+GkbwxhAijxbWn03fZgpu2HwnluZZnkx3Mwxi
	cWsOGqz3P1564ZmxZGTL0zOaCMWm+e/jS6fAU/MAZTR9RH55Vs4bDI5AQaEJPtIU
	gO8PN4zTQ4iCZDv4YHrVepMQ1niQ31Lz1M9LhzVembfBl3Z4brSPV4zS7udF1/f+
	7H2tn+Sunx97eDMq3k22vGfsjNB8HNFIel2UWkF9hquy4IxFdNp5s5aqp35a0oO0
	Lwr5JSMitRmknXLPN72nkw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3t0p3xkxdb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 11:32:11 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 12 Sep
 2023 17:32:08 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Tue, 12 Sep 2023 17:32:08 +0100
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.125])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0CD863575;
	Tue, 12 Sep 2023 16:32:08 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <yung-chuan.liao@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
        <peter.ujfalusi@linux.intel.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 3/4] ASoC: Intel: sof_sdw: Copy PCI SSID to struct
 snd_soc_card
Date: Tue, 12 Sep 2023 17:32:06 +0100
Message-ID: <20230912163207.3498161-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230912163207.3498161-1-rf@opensource.cirrus.com>
References: <20230912163207.3498161-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: TCeSaKBKJ_FcRr18fOXrIMkho0cju1vq
X-Proofpoint-GUID: TCeSaKBKJ_FcRr18fOXrIMkho0cju1vq
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 355PUQJCUOCA2RHMWF2PZAO3KZ3WBCTD
X-Message-ID-Hash: 355PUQJCUOCA2RHMWF2PZAO3KZ3WBCTD
X-MailFrom: prvs=4619193f72=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/355PUQJCUOCA2RHMWF2PZAO3KZ3WBCTD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If the PCI SSID has been set in the struct snd_soc_acpi_mach_params,
copy this to struct snd_soc_card so that it can be used by other
ASoC components.

This is important for components that must apply system-specific
configuration.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/intel/boards/sof_sdw.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 5a1c750e6ae6..961241100012 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1924,6 +1924,12 @@ static int mc_probe(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
 		codec_info_list[i].amp_num = 0;
 
+	if (mach->mach_params.subsystem_id_set) {
+		snd_soc_card_set_pci_ssid(card,
+					  mach->mach_params.subsystem_vendor,
+					  mach->mach_params.subsystem_device);
+	}
+
 	ret = sof_card_dai_links_create(card);
 	if (ret < 0)
 		return ret;
-- 
2.30.2

