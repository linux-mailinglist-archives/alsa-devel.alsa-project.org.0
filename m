Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF828773A6A
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 15:22:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18B3183A;
	Tue,  8 Aug 2023 15:21:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18B3183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691500959;
	bh=yIkgUtCm8+QiV/1ObPnNmk/NtaCjekTpN5gopdOpqks=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AQ420/aUjQUiVLEyrRWVICd9bKcp3LXGLBa7BAjDA9m9FPbGRnIGOuafdqZSc5eKV
	 A72dTF5+Nz/f2A3lmCNPUl/1k7ayCu1LAnHFAZJphiv0aeGdMOd90X3n9Ts6NHckeu
	 wSAFpJXGyY6zRzjp/feo8l9x66S9VnXz2QsQlH2Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CA97F80544; Tue,  8 Aug 2023 15:20:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F08D3F80588;
	Tue,  8 Aug 2023 15:20:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A4D0F80538; Tue,  8 Aug 2023 15:20:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74124F800FE
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 15:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74124F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=SM7+FW2J
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 378513nE020848;
	Tue, 8 Aug 2023 08:20:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=J0CWJW0dm10QhtwoxJbOPQUgWrmOCg+3gRm+r4Qw2Xc=; b=
	SM7+FW2JQWJwvMGReRXhG3Y021Pu1K873ovBy3xq6MhUI5ECaoCjZ31GcFpUNAcd
	pQ+YK033YeKINNw8TT+sc5On+SUY6dZwPv0E8eDs/2LhVd0yDYnpkeJhaiGRVR16
	HmcMItCzKlFvPfKqWWf02E5t6+weuvguuC3ZC2kqi82cekiDLNm5gZ0wlrC6Jq40
	UJpT5yr1nvlS08i/f+oGEszrFmtBhqlLJoyO840xZqmOBp4cXGeBplT4rDdiogYD
	c1hqKyHoUId2P9mjrFXJX9ZouKPjtisXl8EZGzzLK7bIJpdfD+6gFhqBTYPAye8e
	kzIdVNiXO64k0SF99sJFHg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sb7vt8wd1-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 08:20:17 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 8 Aug
 2023 14:20:14 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Tue, 8 Aug 2023 14:20:14 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E0CE415B4;
	Tue,  8 Aug 2023 13:20:13 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 03/12] ASoC: intel: sof_sdw: Check link mask validity in
 get_dailink_info
Date: Tue, 8 Aug 2023 14:20:04 +0100
Message-ID: <20230808132013.889419-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230808132013.889419-1-ckeepax@opensource.cirrus.com>
References: <20230808132013.889419-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 7C_mdDnvuCwA3knNZQ2Suc64jOwXxzNV
X-Proofpoint-ORIG-GUID: 7C_mdDnvuCwA3knNZQ2Suc64jOwXxzNV
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 2GNFG7ZZHKULGT5WUCFOTVTPVR3WBTVF
X-Message-ID-Hash: 2GNFG7ZZHKULGT5WUCFOTVTPVR3WBTVF
X-MailFrom: prvs=3584cdf4cd=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2GNFG7ZZHKULGT5WUCFOTVTPVR3WBTVF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As get_dailink_info spins through all the links anyway simply check the
link masks there. This saves an extra check and means the code will
fail earlier if the mask is invalid.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/intel/boards/sof_sdw.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 89614d08d0918..268629d5505c3 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1053,6 +1053,10 @@ static int get_dailink_info(struct device *dev,
 		int stream;
 		u64 adr;
 
+		/* make sure the link mask has a single bit set */
+		if (!is_power_of_2(adr_link->mask))
+			return -EINVAL;
+
 		for (i = 0; i < adr_link->num_adr; i++) {
 			adr = adr_link->adr_d[i].adr;
 			codec_index = find_codec_info_part(adr);
@@ -1302,10 +1306,6 @@ static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 	no_aggregation = sof_sdw_quirk & SOF_SDW_NO_AGGREGATION;
 	adr_d = &adr_link->adr_d[adr_index];
 
-	/* make sure the link mask has a single bit set */
-	if (!is_power_of_2(adr_link->mask))
-		return -EINVAL;
-
 	cpu_dai_id[index++] = ffs(adr_link->mask) - 1;
 	if (!adr_d->endpoints->aggregated || no_aggregation) {
 		*cpu_dai_num = 1;
@@ -1334,10 +1334,6 @@ static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 		    endpoint->group_id != *group_id)
 			continue;
 
-		/* make sure the link mask has a single bit set */
-		if (!is_power_of_2(adr_next->mask))
-			return -EINVAL;
-
 		if (index >= SDW_MAX_CPU_DAIS) {
 			dev_err(dev, "cpu_dai_id array overflows\n");
 			return -EINVAL;
-- 
2.30.2

