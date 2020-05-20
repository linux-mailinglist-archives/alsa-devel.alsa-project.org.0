Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 545FC1DABEC
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 09:24:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 029C817A2;
	Wed, 20 May 2020 09:23:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 029C817A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589959447;
	bh=iKnQ6WniAQDfiZkwQJr7n0j37WFzYZWpatpymbNfGWA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WwfOLEb9YK5Nw+fREtrEbvKHnYJMwcVzhr25pOFTfMV5x3JPND5PefWJgMxTiclCt
	 aR+O8LkPnywcBo39o2dmxACDx/Elm7gSFvgvTHkmt08dBfwFEVUrXmj3boa4Lgfkx3
	 wxJLGXy1qQQkGH1qEOD/huv4vXq+jr2Brptasi6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58641F80216;
	Wed, 20 May 2020 09:21:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E90CF80291; Wed, 20 May 2020 09:21:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27CE6F801F9
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 09:21:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27CE6F801F9
IronPort-SDR: OiX85362V+TEYz7ZNladsQpjjtV6cG1C2L+Q9mj3Au0WW2EIa+RgOKSPwHd0avkbs/EsMsAqeD
 xzE4DaiV9RlaFpfQLDe6PbVGMmmnUra92VMZCQ2TH+gVX97rl16Gw/xQnDpGW3LISJWKF4DMEA
 ZjJkelHuwUVeARsgnY5riqU8U4Vn5i4g2nZ3E6mjd/O3By2h+scJf23k9m0UqbSzMn+OLBWuy3
 AuTFSh55QojFnzixF2PyQXSB/1Dw6R+cuqHk0OWxddwUVitYLaf6sI1lkAosG9nNfk6+ZX1POG
 NcI=
X-IronPort-AV: E=Sophos;i="5.73,413,1583190000"; 
   d="scan'208";a="8662018"
From: Pavel Dobias <dobias@2n.cz>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH 3/6] ASoC: max9867: add filter controls
Date: Wed, 20 May 2020 09:19:01 +0200
Message-ID: <20200520071904.15801-3-dobias@2n.cz>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200520071904.15801-1-dobias@2n.cz>
References: <20200520071904.15801-1-dobias@2n.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX04.axis.com (10.0.5.18) To XBOX04.axis.com (10.0.5.18)
Cc: broonie@kernel.org, ladis@linux-mips.org, Pavel Dobias <dobias@2n.cz>
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

Adding missing codec controls - ADC/DAC IIR filter selection.

Signed-off-by: Pavel Dobias <dobias@2n.cz>
---
 sound/soc/codecs/max9867.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index 93431646f2c7..535cfea6bcde 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -23,8 +23,21 @@ static const char *const max9867_spmode[] = {
 };
 static const char *const max9867_filter_text[] = {"IIR", "FIR"};
 
+static const char *const max9867_adc_dac_filter_text[] = {
+	"Disabled",
+	"Elliptical/16/256",
+	"Butterworth/16/500",
+	"Elliptical/8/256",
+	"Butterworth/8/500",
+	"Butterworth/8-24"
+};
+
 static SOC_ENUM_SINGLE_DECL(max9867_filter, MAX9867_CODECFLTR, 7,
 	max9867_filter_text);
+static SOC_ENUM_SINGLE_DECL(max9867_dac_filter, MAX9867_CODECFLTR, 0,
+	max9867_adc_dac_filter_text);
+static SOC_ENUM_SINGLE_DECL(max9867_adc_filter, MAX9867_CODECFLTR, 4,
+	max9867_adc_dac_filter_text);
 static SOC_ENUM_SINGLE_DECL(max9867_spkmode, MAX9867_MODECONFIG, 0,
 	max9867_spmode);
 static const SNDRV_CTL_TLVD_DECLARE_DB_RANGE(max9867_master_tlv,
@@ -64,6 +77,8 @@ static const struct snd_kcontrol_new max9867_snd_controls[] = {
 	SOC_SINGLE("Volume Smoothing Switch", MAX9867_MODECONFIG, 6, 1, 0),
 	SOC_SINGLE("Line ZC Switch", MAX9867_MODECONFIG, 5, 1, 0),
 	SOC_ENUM("DSP Filter", max9867_filter),
+	SOC_ENUM("ADC Filter", max9867_adc_filter),
+	SOC_ENUM("DAC Filter", max9867_dac_filter),
 };
 
 /* Input mixer */
-- 
2.20.1

