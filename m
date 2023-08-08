Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ACC773A70
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 15:22:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 552BC82C;
	Tue,  8 Aug 2023 15:22:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 552BC82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691500973;
	bh=jzH/vEwtfDpJdRMafdGn26viUVe8YlD98aj9MLkwuxQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Rsqycjr7BI6i826ybH3/iUQmof1beFnB57vP6K99Y4dRTcxWSwWS932sd0TkYteFG
	 0xUmAIIlREoJ69S8st+yXG5qUiOX+991V8Egtv9TpehwPafiA5DkQKB/l9+uqCsbA+
	 6dBILjLyhStGiIQBK5IYdwVSq8TafehVZnRrQxq4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39186F805AB; Tue,  8 Aug 2023 15:20:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43047F805AA;
	Tue,  8 Aug 2023 15:20:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59DF4F80568; Tue,  8 Aug 2023 15:20:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3F35F800B8
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 15:20:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3F35F800B8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=lW2XIa/D
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 378513nC020848;
	Tue, 8 Aug 2023 08:20:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=F
	J7TprhjDbWRuHqoD0c4zyjG459CCSCD99IkBkYoaHc=; b=lW2XIa/DEC49Qzi/w
	aqOjUSkkThS3y7zMg8wZU4R0kiwisa1cC8KXaXtjxQfLBWSP/SeQsZ10qrCPXDUQ
	Dszs4v6gCD3f49Skdx3ajCxPlEUmxlLwkxBRXEkzRntCEydwF+CHrzsbwa8/YjwU
	wPjUVZWI6jpoUMTmb01ge5A3/e1oEh5d+SklRSaJlTDD20rB635qIdkrY54sUYcT
	O2I2zlx22Gs4OQURn/2orBXha0+zVrp+oI5xYRP0erxfansI7OVVY3kNMO2FjD18
	fkfyZJNr4vAnUp8zx1uUpa6GQDjaJZOLWRgeprtiGZ6P7OA9tDqV2yYUobIfLVDX
	Wtoxg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sb7vt8wd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 08:20:15 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 8 Aug
 2023 14:20:13 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Tue, 8 Aug 2023 14:20:13 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C88B615B7;
	Tue,  8 Aug 2023 13:20:13 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 01/12] ASoC: intel: sof_sdw: Printk's should end with a
 newline
Date: Tue, 8 Aug 2023 14:20:02 +0100
Message-ID: <20230808132013.889419-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: utedcslMRxW9BQC1I0lRDFvl3xNA7kw5
X-Proofpoint-ORIG-GUID: utedcslMRxW9BQC1I0lRDFvl3xNA7kw5
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 7TQ372TYYJCN35RSSAGB564ED6AWZ6Z6
X-Message-ID-Hash: 7TQ372TYYJCN35RSSAGB564ED6AWZ6Z6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7TQ372TYYJCN35RSSAGB564ED6AWZ6Z6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the missing new lines.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/intel/boards/sof_sdw.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index fd27e211211bd..8f3329dcf7062 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -524,7 +524,7 @@ int sdw_prepare(struct snd_pcm_substream *substream)
 
 	sdw_stream = snd_soc_dai_get_stream(dai, substream->stream);
 	if (IS_ERR(sdw_stream)) {
-		dev_err(rtd->dev, "no stream found for DAI %s", dai->name);
+		dev_err(rtd->dev, "no stream found for DAI %s\n", dai->name);
 		return PTR_ERR(sdw_stream);
 	}
 
@@ -543,7 +543,7 @@ int sdw_trigger(struct snd_pcm_substream *substream, int cmd)
 
 	sdw_stream = snd_soc_dai_get_stream(dai, substream->stream);
 	if (IS_ERR(sdw_stream)) {
-		dev_err(rtd->dev, "no stream found for DAI %s", dai->name);
+		dev_err(rtd->dev, "no stream found for DAI %s\n", dai->name);
 		return PTR_ERR(sdw_stream);
 	}
 
@@ -565,7 +565,7 @@ int sdw_trigger(struct snd_pcm_substream *substream, int cmd)
 	}
 
 	if (ret)
-		dev_err(rtd->dev, "%s trigger %d failed: %d", __func__, cmd, ret);
+		dev_err(rtd->dev, "%s trigger %d failed: %d\n", __func__, cmd, ret);
 
 	return ret;
 }
@@ -630,7 +630,7 @@ int sdw_hw_free(struct snd_pcm_substream *substream)
 
 	sdw_stream = snd_soc_dai_get_stream(dai, substream->stream);
 	if (IS_ERR(sdw_stream)) {
-		dev_err(rtd->dev, "no stream found for DAI %s", dai->name);
+		dev_err(rtd->dev, "no stream found for DAI %s\n", dai->name);
 		return PTR_ERR(sdw_stream);
 	}
 
@@ -1339,7 +1339,7 @@ static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 			return -EINVAL;
 
 		if (index >= SDW_MAX_CPU_DAIS) {
-			dev_err(dev, " cpu_dai_id array overflows");
+			dev_err(dev, "cpu_dai_id array overflows\n");
 			return -EINVAL;
 		}
 
@@ -1490,7 +1490,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 				return -ENOMEM;
 
 			if (cpu_dai_index >= sdw_cpu_dai_num) {
-				dev_err(dev, "invalid cpu dai index %d",
+				dev_err(dev, "invalid cpu dai index %d\n",
 					cpu_dai_index);
 				return -EINVAL;
 			}
@@ -1503,12 +1503,12 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		 * not be larger than sdw_be_num
 		 */
 		if (*link_index >= sdw_be_num) {
-			dev_err(dev, "invalid dai link index %d", *link_index);
+			dev_err(dev, "invalid dai link index %d\n", *link_index);
 			return -EINVAL;
 		}
 
 		if (*cpu_id >= sdw_cpu_dai_num) {
-			dev_err(dev, " invalid cpu dai index %d", *cpu_id);
+			dev_err(dev, "invalid cpu dai index %d\n", *cpu_id);
 			return -EINVAL;
 		}
 
@@ -1531,7 +1531,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		ret = set_codec_init_func(card, adr_link, dai_links + (*link_index)++,
 					  playback, group_id, adr_index, dai_index);
 		if (ret < 0) {
-			dev_err(dev, "failed to init codec %d", codec_index);
+			dev_err(dev, "failed to init codec %d\n", codec_index);
 			return ret;
 		}
 
@@ -1675,7 +1675,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 
 			endpoint = adr_link->adr_d[i].endpoints;
 			if (endpoint->aggregated && !endpoint->group_id) {
-				dev_err(dev, "invalid group id on link %x",
+				dev_err(dev, "invalid group id on link %x\n",
 					adr_link->mask);
 				continue;
 			}
@@ -1698,7 +1698,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 							 &be_id, &codec_conf_index,
 							 &ignore_pch_dmic, append_dai_type, i, j);
 				if (ret < 0) {
-					dev_err(dev, "failed to create dai link %d", link_index);
+					dev_err(dev, "failed to create dai link %d\n", link_index);
 					return ret;
 				}
 			}
-- 
2.30.2

