Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D30818C1B
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 17:24:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 105D3E87;
	Tue, 19 Dec 2023 17:23:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 105D3E87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703003045;
	bh=pU09p2rFamtHFZhGJRUNPXk2JnuIazbGtZhELzfiS/E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EgdoE1xtnbTitZmv6H2XYYx63NM09sqC3ktBGQwQXBQI/QzV3KL3z+4WLn7mlK95G
	 fkTV0sGonhK/cScltftemllilViF5ml1mz9klWqhX0EMT/vngOH56WY0oQmNQSxtMA
	 2+VYG9Y+JjcbFjSDizGEgzpr65hvbparQ8u5SHak=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 357A7F805E7; Tue, 19 Dec 2023 17:23:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10776F805E4;
	Tue, 19 Dec 2023 17:23:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E71AF80212; Tue, 19 Dec 2023 17:22:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8FF0F80425
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 17:22:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8FF0F80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=WMCIphRa
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BJ6vo3B022423;
	Tue, 19 Dec 2023 10:22:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=BoVaGh/eH7nGZeEelaU0i1uh/HBS9k3X4xBMik9sYek=; b=
	WMCIphRaeyGQRQFZZyGmYxGArGpBbrgP27CTR5/VHMj25AcWvM4YvtTF3Wsvf935
	ZfZeJPYbKIZIH+enzPcKCsmWQO2MEUFvFj5pqGooSpJqDxlKLq4CiLMXbaXINekM
	Ebu0qAaMA6CQ8J8q/Tf/E/WOxoy/dM9P1LpYbvKhdVhl5WI5bSpjwT9YVlz1dEqm
	oHD2vqrDT5loHhvUyYbDFtVz1QpoC/nN3MOrajSLp0fG+6la04+/J+/S+Jc72hJ1
	iBwrY+t/UR0FHDooruvX6vV+FFMn2jQiLEkCK0/NyZ9sQk8ezv0sR3UOWFAtZRF+
	OpVY4TgSgRuEpPTm/CeWFw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3v1a6249gs-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Dec 2023 10:22:48 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 19 Dec
 2023 16:22:43 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Tue, 19 Dec 2023 16:22:43 +0000
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.77])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 451DE11D1;
	Tue, 19 Dec 2023 16:22:43 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v1 2/2] ALSA: hda: cs35l41: Only add SPI CS GPIO if SPI is
 enabled in kernel
Date: Tue, 19 Dec 2023 16:22:32 +0000
Message-ID: <20231219162232.790358-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231219162232.790358-1-sbinding@opensource.cirrus.com>
References: <20231219162232.790358-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: yc_jk4S_5prVHkTVfhZhHYzieyQxFs6b
X-Proofpoint-ORIG-GUID: yc_jk4S_5prVHkTVfhZhHYzieyQxFs6b
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: EVWONUWN3M2RLCAU323UJDIMN74WMYGP
X-Message-ID-Hash: EVWONUWN3M2RLCAU323UJDIMN74WMYGP
X-MailFrom: prvs=7717b54677=sbinding@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EVWONUWN3M2RLCAU323UJDIMN74WMYGP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If CONFIG_SPI is not set in the kernel, there is no point in trying
to set the chip selects. We can selectively compile it.

Fixes: 8c4c216db8fb ("ALSA: hda: cs35l41: Add config table to support many laptops without _DSD")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312192256.lJelQEoZ-lkp@intel.com/

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda_property.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index 73b304e6c83c..194e1179a253 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -210,6 +210,8 @@ static int generic_dsd_config(struct cs35l41_hda *cs35l41, struct device *physde
 
 	if (cfg->bus == SPI) {
 		cs35l41->index = id;
+
+#if IS_ENABLED(CONFIG_SPI)
 		/*
 		 * Manually set the Chip Select for the second amp <cs_gpio_index> in the node.
 		 * This is only supported for systems with 2 amps, since we cannot expand the
@@ -249,6 +251,7 @@ static int generic_dsd_config(struct cs35l41_hda *cs35l41, struct device *physde
 				spi_setup(spi);
 			}
 		}
+#endif
 	} else {
 		if (cfg->num_amps > 2)
 			/*
-- 
2.34.1

