Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF26D6E6763
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 16:45:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F943E7F;
	Tue, 18 Apr 2023 16:45:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F943E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681829152;
	bh=KihWgtzY+qiP373Adewm4Z1JZM75jfEHQ0flvzeQpv8=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=VbR24gprwq4uyKpBzmm5fLudDyy/xxiasTG4sVxcg6S91yHi2tK3bN1U9YNdimbB7
	 Oh/BEWc4JBm1atuFU/ObUScwYNEP1dSmcKejl6W+Dtmok0mhX+lc/FEsbsm9F4hml4
	 GcZWLYDtruapVvPQKoI+ObxYM2jwmZPmf3sJwd5U=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB8EBF80557;
	Tue, 18 Apr 2023 16:43:35 +0200 (CEST)
To: <broonie@kernel.org>
Subject: [PATCH 4/4] ASoC: cs35l56: Rename mixer source defines for SoundWire
 DP1
Date: Tue, 18 Apr 2023 15:43:09 +0100
In-Reply-To: <20230418144309.1100721-1-rf@opensource.cirrus.com>
References: <20230418144309.1100721-1-rf@opensource.cirrus.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7Q5IB5AMYTNNBQS2ZBLWKMCUJAQCJDOW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168182901457.26.11455447990481306206@mailman-core.alsa-project.org>
From: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55046F80542; Tue, 18 Apr 2023 16:43:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 970D2F80155
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 16:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 970D2F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=mLbiS1h6
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33IDaWqf031292;
	Tue, 18 Apr 2023 09:43:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=t8WyjzhCrkfZ5fX9RDFeeNevFK4MJDp5bpQRc8WUyFY=;
 b=mLbiS1h6zlGO9kenH7o2ObjLMqqCeo7f1hUpeFZLnrbkUpR1UAwUfbk0kuA9YYwE3qa+
 95tUuRUiaqtY1477jqLuRnVirvaIt2fQopgM3KVnngVx9gqxdM54/46iv84efIAFun6V
 q1G8fAMi2OH/vFW/ZI/SlMZMthesb8W2VSqq164p+Mackd2KOP+I9fQ/4kM9FENRIc2r
 dKbD1RWI0/IudEZSjtOvV1oFuC0HS7Q59KvUa1wBoETDhpH5fb5iPCTou6A+fM3ACMnr
 ijysVnV3BAKz09c1+QBoCIiAMQFrjJ63eIsLOuMNYK0InLm8qKy8EzKYzVXoUmjRIlmT QA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3pysb4wm9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Apr 2023 09:43:12 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Tue, 18 Apr
 2023 09:43:10 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 18 Apr 2023 09:43:10 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2A1E3B06;
	Tue, 18 Apr 2023 14:43:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 4/4] ASoC: cs35l56: Rename mixer source defines for SoundWire
 DP1
Date: Tue, 18 Apr 2023 15:43:09 +0100
Message-ID: <20230418144309.1100721-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230418144309.1100721-1-rf@opensource.cirrus.com>
References: <20230418144309.1100721-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: o-3gFuMmFc1LxGRYlj1ZVPAUFpOhN8sh
X-Proofpoint-GUID: o-3gFuMmFc1LxGRYlj1ZVPAUFpOhN8sh
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 7Q5IB5AMYTNNBQS2ZBLWKMCUJAQCJDOW
X-Message-ID-Hash: 7Q5IB5AMYTNNBQS2ZBLWKMCUJAQCJDOW
X-MailFrom: prvs=9472792d81=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7Q5IB5AMYTNNBQS2ZBLWKMCUJAQCJDOW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rename the mixer source defines from CS35L56_INPUT_SRC_SWIRE_RXn
to CS35L56_INPUT_SRC_SWIRE_DP1_CHANNELn to match the latest
datasheet.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/cs35l56.h           | 4 ++--
 sound/soc/codecs/cs35l56-shared.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 0b2f7cfc6a4a..002042b1c73c 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -179,8 +179,8 @@
 #define CS35L56_INPUT_SRC_DSP1TX8			0x39
 #define CS35L56_INPUT_SRC_TEMPMON			0x3A
 #define CS35L56_INPUT_SRC_INTERPOLATOR			0x40
-#define CS35L56_INPUT_SRC_SWIRE_RX1			0x44
-#define CS35L56_INPUT_SRC_SWIRE_RX2			0x45
+#define CS35L56_INPUT_SRC_SWIRE_DP1_CHANNEL1		0x44
+#define CS35L56_INPUT_SRC_SWIRE_DP1_CHANNEL2		0x45
 #define CS35L56_INPUT_MASK				0x7F
 
 #define CS35L56_NUM_INPUT_SRC				21
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 93a1b056660b..60da8c75b7b9 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -302,8 +302,8 @@ const unsigned int cs35l56_tx_input_values[] = {
 	CS35L56_INPUT_SRC_DSP1TX8,
 	CS35L56_INPUT_SRC_TEMPMON,
 	CS35L56_INPUT_SRC_INTERPOLATOR,
-	CS35L56_INPUT_SRC_SWIRE_RX1,
-	CS35L56_INPUT_SRC_SWIRE_RX2,
+	CS35L56_INPUT_SRC_SWIRE_DP1_CHANNEL1,
+	CS35L56_INPUT_SRC_SWIRE_DP1_CHANNEL2,
 };
 EXPORT_SYMBOL_NS_GPL(cs35l56_tx_input_values, SND_SOC_CS35L56_SHARED);
 
-- 
2.30.2

