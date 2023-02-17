Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE0A69B06E
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 17:16:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0842DF5A;
	Fri, 17 Feb 2023 17:16:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0842DF5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676650616;
	bh=KYtAFgisuJupjYryUEmwgBoIQR8pQ+Sv6ujHGeVroXM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B4jnuOb2NU5ZFC6OeURWB0XEQOsJZKjc/HHy8t+tS+KTdQpn2XAfD174/9wMRl8kD
	 OfgAhe3hmpEqmgniTqSdy/aYXKiqQBKzEYG3wETwfa/KZq70c9l+PyBH3wyaJ3kX9K
	 V4f/C3DTiqwgd274alhrqlkhcEKok10+vt924IFY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAC93F80534;
	Fri, 17 Feb 2023 17:14:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D840DF8052D; Fri, 17 Feb 2023 17:14:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81F42F804B0
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 17:14:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81F42F804B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=NPj6FyHP
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31HFh1JM028722;
	Fri, 17 Feb 2023 10:14:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=AhHzewF/a8Pi4XOIK3HkeTNQoW8FqMDSxy5e171h1ek=;
 b=NPj6FyHPSCifKzQfOR/dV0JQtFGnvx2fiPxpQrPm4dw48WHZcZNg4GSFwIZMOrMw/aAg
 KSjFx79hWIBAZy+h0t8IZihNOICf9k82AMX5qQiLjNTX8aEwEjokx+K5vjvuuwQRDflk
 p3XPN9nan+nbr+mkeWuukvN2MtkM67IyOqhUUTDeSPOdzn0yDFtPmrdDSN9tVE+ZLoXu
 lTU5FSPSENgIgkvT1PEgMB1l+DupSXn6jM5wgCby4bUqi1pwhnnpEIcQmFxBo9RnKw2w
 1KJdYUdVZ8q+vz/LKtKsT/uKU0aRfuI+itda5I+OWES/7IdD8tc/Zzc/+0VPPIjLY7Mv 1w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3nt1btgsph-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Feb 2023 10:14:13 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Fri, 17 Feb
 2023 10:14:10 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via Frontend
 Transport; Fri, 17 Feb 2023 10:14:10 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4DC2C11AA;
	Fri, 17 Feb 2023 16:14:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <cezary.rojewski@intel.com>, <peter.ujfalusi@linux.intel.com>,
        <yung-chuan.liao@linux.intel.com>, <kai.vehmanen@linux.intel.com>
Subject: [PATCH 02/10] ASoC: wm_adsp: Use no_core_startstop to prevent
 creating preload control
Date: Fri, 17 Feb 2023 16:14:02 +0000
Message-ID: <20230217161410.915202-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230217161410.915202-1-rf@opensource.cirrus.com>
References: <20230217161410.915202-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ncYn_JU6C2Qj1p3k_6Xfk-L9VNJ41XVg
X-Proofpoint-GUID: ncYn_JU6C2Qj1p3k_6Xfk-L9VNJ41XVg
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: Q6MOR44SUFRFOWGNDX5XFVH3AK5JEVGW
X-Message-ID-Hash: Q6MOR44SUFRFOWGNDX5XFVH3AK5JEVGW
X-MailFrom: prvs=74127981b7=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q6MOR44SUFRFOWGNDX5XFVH3AK5JEVGW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

The no_core_startstop flag indicates a self-booting DSP - they are
considered to be always running and therefore cannot be pre-loaded.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index ea0dbc634ecf..854d9366a745 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -1102,8 +1102,10 @@ int wm_adsp2_component_probe(struct wm_adsp *dsp, struct snd_soc_component *comp
 {
 	char preload[32];
 
-	snprintf(preload, ARRAY_SIZE(preload), "%s Preload", dsp->cs_dsp.name);
-	snd_soc_component_disable_pin(component, preload);
+	if (!dsp->cs_dsp.no_core_startstop) {
+		snprintf(preload, ARRAY_SIZE(preload), "%s Preload", dsp->cs_dsp.name);
+		snd_soc_component_disable_pin(component, preload);
+	}
 
 	cs_dsp_init_debugfs(&dsp->cs_dsp, component->debugfs_root);
 
-- 
2.30.2

