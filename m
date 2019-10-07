Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FA6CEA41
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 19:11:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9497986E;
	Mon,  7 Oct 2019 19:10:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9497986E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570468270;
	bh=FNMXCj21+xGgdi1bFrtIG8JRLJY6cVjLgDFa2fj2v04=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n0IgRLHSF6mW0VcBuReqVAG/gzBPmAaDm/t9UIQG2WqskHwMy505Q8GRNaC3aVxCS
	 Pk656ooUA8pUHuxFtFE/eygyvxMMkbiEftbInpqPph360G9x/M2g+A7BqzI+zXh3OU
	 j4zgb5/k04WKbGKJNgmN+e6MyWbyyGMfcz//UsW8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 307D9F802BE;
	Mon,  7 Oct 2019 19:09:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 755DFF802FB; Mon,  7 Oct 2019 19:09:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F0EDF80273
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 19:09:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F0EDF80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TtaIHK/S"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97H9HFp077194;
 Mon, 7 Oct 2019 12:09:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1570468157;
 bh=oVMcBS9B51Vlj09LuDSqLmxgOK3U5xBBbOwYpJ+/9WQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=TtaIHK/S8FEUT4UAj+g5dz/o5t5xQhmZEwiYlCHINILdBtQ2yg1T7WyjgwHQv8vXE
 CRmWx+br6Kwxh3hAK/50nN29sE2hajNdaK4If9DRwBxWgAGRQs0tFemFUdv/kcj6BJ
 kgyewPBVsncxsJXjAqhmWRu6IbUcQaXBf8Fo7TrU=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97H9HNg055073
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 7 Oct 2019 12:09:17 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 12:09:14 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 12:09:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97H9GEF026321;
 Mon, 7 Oct 2019 12:09:16 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <shifu0704@thundersoft.com>, <broonie@kernel.org>
Date: Mon, 7 Oct 2019 12:11:56 -0500
Message-ID: <20191007171157.17813-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191007171157.17813-1-dmurphy@ti.com>
References: <20191007171157.17813-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, navada@ti.com,
 Dan Murphy <dmurphy@ti.com>
Subject: [alsa-devel] [PATCH v2 2/3] ASoC: tas2770: Remove unneeded read of
	the TDM_CFG3 register
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Remove the unneeded and incorrect read of the TDM_CFG3 register.
The read is done but the value is never used.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v2 - New patch no v1

 sound/soc/codecs/tas2770.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 361d0bba72b3..c1e28dd0b73e 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -386,7 +386,6 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	u8 tdm_rx_start_slot = 0, asi_cfg_1 = 0;
 	int ret;
-	int value = 0;
 	struct snd_soc_component *component = dai->component;
 	struct tas2770_priv *tas2770 =
 			snd_soc_component_get_drvdata(component);
@@ -442,8 +441,6 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	if (ret < 0)
 		return ret;
 
-	value = snd_soc_component_read32(component, TAS2770_TDM_CFG_REG3);
-
 	tas2770->asi_format = fmt;
 
 	return 0;
-- 
2.22.0.214.g8dca754b1e

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
