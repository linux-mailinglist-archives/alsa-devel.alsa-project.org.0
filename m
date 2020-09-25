Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 624052783C5
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 11:16:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEAC11851;
	Fri, 25 Sep 2020 11:16:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEAC11851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601025419;
	bh=95uV7FJGeOKvRY9+0/phrFaqidPq0uEL7cbv1ywLflI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H6DtCMPTV47odp6No45ul5cNOy3YEkmWm0+igNdmdTUgCairwnBOUVDnTgyGne0Px
	 KGg559kpFqjMDjU+1hI+sYT1tf8yhHszMrO8/KJQQ6Cw65AkiQh0LXcq8TWzEfB9v2
	 wD5h00VH2gv16Tmq1FjIZGu4Ao7t3nGzSRQMI9nU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE3DEF80171;
	Fri, 25 Sep 2020 11:15:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CFC5F800DA; Fri, 25 Sep 2020 11:15:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49E60F800DA
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 11:14:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49E60F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="avVFDVXJ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 08P9D42T015649; Fri, 25 Sep 2020 04:14:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=eCnChi1cVXWzf3wlMxkaC33L66JpE8WLf+wlhXFFSRE=;
 b=avVFDVXJa9ccZYrreZav5MFwdldcJjPSi2EIKAWE+ZyttVDyhhKf64zijymBrhe66LPr
 WDRPhQ7WpJWNUDwoKKwWhlkcHANjQoTm3BeAyMXSZUfz0s2IEHAP+k/7YjRfmzWQzuQO
 +WyXNNLYda9JQZEWsXXOQzKxd0gU6efjc909dOW0qAbYEpuXuiBvrD7FGV2+zzgHKCEt
 QN8vuC+PsF3wiPGIuJZoqNDII/NrLl4e7866C64UTh/JUVmKWjka428oDsrJQWeXOBS0
 +Uyft68CVq4lEMFI1P5BK1b1MzIpmM+0bPEDhtGRjqaF0N/o5gJRHU01EGo5Y+nzW17q nw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 33nfd285fe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 25 Sep 2020 04:14:54 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 25 Sep
 2020 10:14:52 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 25 Sep 2020 10:14:52 +0100
Received: from AUSNPC0LSNW1-debian.ad.cirrus.com (ausnpc0lsnw1.ad.cirrus.com
 [198.61.64.158])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5C6262A1;
 Fri, 25 Sep 2020 09:14:52 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <lee.jones@linaro.org>
Subject: [PATCH] mfd: madera: Delete register field xxx_WIDTH defines
Date: Fri, 25 Sep 2020 10:14:46 +0100
Message-ID: <20200925091446.7530-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=1
 mlxlogscore=999 adultscore=0 clxscore=1011 malwarescore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009250064
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

The register field xxx_WIDTH defined are not used in current code.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/linux/mfd/madera/registers.h | 635 ---------------------------
 1 file changed, 635 deletions(-)

diff --git a/include/linux/mfd/madera/registers.h b/include/linux/mfd/madera/registers.h
index fe909d177762..b44aeb461d0c 100644
--- a/include/linux/mfd/madera/registers.h
+++ b/include/linux/mfd/madera/registers.h
@@ -1286,566 +1286,438 @@
 /* (0x0000)  Software_Reset */
 #define MADERA_SW_RST_DEV_ID1_MASK			0xFFFF
 #define MADERA_SW_RST_DEV_ID1_SHIFT			     0
-#define MADERA_SW_RST_DEV_ID1_WIDTH			    16
 
 /* (0x0001)  Hardware_Revision */
 #define MADERA_HW_REVISION_MASK				0x00FF
 #define MADERA_HW_REVISION_SHIFT			     0
-#define MADERA_HW_REVISION_WIDTH			     8
 
 /* (0x0020)  Tone_Generator_1 */
 #define MADERA_TONE2_ENA				0x0002
 #define MADERA_TONE2_ENA_MASK				0x0002
 #define MADERA_TONE2_ENA_SHIFT				     1
-#define MADERA_TONE2_ENA_WIDTH				     1
 #define MADERA_TONE1_ENA				0x0001
 #define MADERA_TONE1_ENA_MASK				0x0001
 #define MADERA_TONE1_ENA_SHIFT				     0
-#define MADERA_TONE1_ENA_WIDTH				     1
 
 /* (0x0021)  Tone_Generator_2 */
 #define MADERA_TONE1_LVL_0_MASK				0xFFFF
 #define MADERA_TONE1_LVL_0_SHIFT			     0
-#define MADERA_TONE1_LVL_0_WIDTH			    16
 
 /* (0x0022)  Tone_Generator_3 */
 #define MADERA_TONE1_LVL_MASK				0x00FF
 #define MADERA_TONE1_LVL_SHIFT				     0
-#define MADERA_TONE1_LVL_WIDTH				     8
 
 /* (0x0023)  Tone_Generator_4 */
 #define MADERA_TONE2_LVL_0_MASK				0xFFFF
 #define MADERA_TONE2_LVL_0_SHIFT			     0
-#define MADERA_TONE2_LVL_0_WIDTH			    16
 
 /* (0x0024)  Tone_Generator_5 */
 #define MADERA_TONE2_LVL_MASK				0x00FF
 #define MADERA_TONE2_LVL_SHIFT				     0
-#define MADERA_TONE2_LVL_WIDTH				     8
 
 /* (0x0030)  PWM_Drive_1 */
 #define MADERA_PWM2_ENA					0x0002
 #define MADERA_PWM2_ENA_MASK				0x0002
 #define MADERA_PWM2_ENA_SHIFT				     1
-#define MADERA_PWM2_ENA_WIDTH				     1
 #define MADERA_PWM1_ENA					0x0001
 #define MADERA_PWM1_ENA_MASK				0x0001
 #define MADERA_PWM1_ENA_SHIFT				     0
-#define MADERA_PWM1_ENA_WIDTH				     1
 
 /* (0x00A0)  Comfort_Noise_Generator */
 #define MADERA_NOISE_GEN_ENA				0x0020
 #define MADERA_NOISE_GEN_ENA_MASK			0x0020
 #define MADERA_NOISE_GEN_ENA_SHIFT			     5
-#define MADERA_NOISE_GEN_ENA_WIDTH			     1
 #define MADERA_NOISE_GEN_GAIN_MASK			0x001F
 #define MADERA_NOISE_GEN_GAIN_SHIFT			     0
-#define MADERA_NOISE_GEN_GAIN_WIDTH			     5
 
 /* (0x0100)  Clock_32k_1 */
 #define MADERA_CLK_32K_ENA				0x0040
 #define MADERA_CLK_32K_ENA_MASK				0x0040
 #define MADERA_CLK_32K_ENA_SHIFT			     6
-#define MADERA_CLK_32K_ENA_WIDTH			     1
 #define MADERA_CLK_32K_SRC_MASK				0x0003
 #define MADERA_CLK_32K_SRC_SHIFT			     0
-#define MADERA_CLK_32K_SRC_WIDTH			     2
 
 /* (0x0101)  System_Clock_1 */
 #define MADERA_SYSCLK_FRAC				0x8000
 #define MADERA_SYSCLK_FRAC_MASK				0x8000
 #define MADERA_SYSCLK_FRAC_SHIFT			    15
-#define MADERA_SYSCLK_FRAC_WIDTH			     1
 #define MADERA_SYSCLK_FREQ_MASK				0x0700
 #define MADERA_SYSCLK_FREQ_SHIFT			     8
-#define MADERA_SYSCLK_FREQ_WIDTH			     3
 #define MADERA_SYSCLK_ENA				0x0040
 #define MADERA_SYSCLK_ENA_MASK				0x0040
 #define MADERA_SYSCLK_ENA_SHIFT				     6
-#define MADERA_SYSCLK_ENA_WIDTH				     1
 #define MADERA_SYSCLK_SRC_MASK				0x000F
 #define MADERA_SYSCLK_SRC_SHIFT				     0
-#define MADERA_SYSCLK_SRC_WIDTH				     4
 
 /* (0x0102)  Sample_rate_1 */
 #define MADERA_SAMPLE_RATE_1_MASK			0x001F
 #define MADERA_SAMPLE_RATE_1_SHIFT			     0
-#define MADERA_SAMPLE_RATE_1_WIDTH			     5
 
 /* (0x0103)  Sample_rate_2 */
 #define MADERA_SAMPLE_RATE_2_MASK			0x001F
 #define MADERA_SAMPLE_RATE_2_SHIFT			     0
-#define MADERA_SAMPLE_RATE_2_WIDTH			     5
 
 /* (0x0104)  Sample_rate_3 */
 #define MADERA_SAMPLE_RATE_3_MASK			0x001F
 #define MADERA_SAMPLE_RATE_3_SHIFT			     0
-#define MADERA_SAMPLE_RATE_3_WIDTH			     5
 
 /* (0x0112)  Async_clock_1 */
 #define MADERA_ASYNC_CLK_FREQ_MASK			0x0700
 #define MADERA_ASYNC_CLK_FREQ_SHIFT			     8
-#define MADERA_ASYNC_CLK_FREQ_WIDTH			     3
 #define MADERA_ASYNC_CLK_ENA				0x0040
 #define MADERA_ASYNC_CLK_ENA_MASK			0x0040
 #define MADERA_ASYNC_CLK_ENA_SHIFT			     6
-#define MADERA_ASYNC_CLK_ENA_WIDTH			     1
 #define MADERA_ASYNC_CLK_SRC_MASK			0x000F
 #define MADERA_ASYNC_CLK_SRC_SHIFT			     0
-#define MADERA_ASYNC_CLK_SRC_WIDTH			     4
 
 /* (0x0113)  Async_sample_rate_1 */
 #define MADERA_ASYNC_SAMPLE_RATE_1_MASK			0x001F
 #define MADERA_ASYNC_SAMPLE_RATE_1_SHIFT		     0
-#define MADERA_ASYNC_SAMPLE_RATE_1_WIDTH		     5
 
 /* (0x0114)  Async_sample_rate_2 */
 #define MADERA_ASYNC_SAMPLE_RATE_2_MASK			0x001F
 #define MADERA_ASYNC_SAMPLE_RATE_2_SHIFT		     0
-#define MADERA_ASYNC_SAMPLE_RATE_2_WIDTH		     5
 
 /* (0x0120)  DSP_Clock_1 */
 #define MADERA_DSP_CLK_FREQ_LEGACY			0x0700
 #define MADERA_DSP_CLK_FREQ_LEGACY_MASK			0x0700
 #define MADERA_DSP_CLK_FREQ_LEGACY_SHIFT		     8
-#define MADERA_DSP_CLK_FREQ_LEGACY_WIDTH		     3
 #define MADERA_DSP_CLK_ENA				0x0040
 #define MADERA_DSP_CLK_ENA_MASK				0x0040
 #define MADERA_DSP_CLK_ENA_SHIFT			     6
-#define MADERA_DSP_CLK_ENA_WIDTH			     1
 #define MADERA_DSP_CLK_SRC				0x000F
 #define MADERA_DSP_CLK_SRC_MASK				0x000F
 #define MADERA_DSP_CLK_SRC_SHIFT			     0
-#define MADERA_DSP_CLK_SRC_WIDTH			     4
 
 /* (0x0122)  DSP_Clock_2 */
 #define MADERA_DSP_CLK_FREQ_MASK			0x03FF
 #define MADERA_DSP_CLK_FREQ_SHIFT			     0
-#define MADERA_DSP_CLK_FREQ_WIDTH			    10
 
 /* (0x0149)  Output_system_clock */
 #define MADERA_OPCLK_ENA				0x8000
 #define MADERA_OPCLK_ENA_MASK				0x8000
 #define MADERA_OPCLK_ENA_SHIFT				    15
-#define MADERA_OPCLK_ENA_WIDTH				     1
 #define MADERA_OPCLK_DIV_MASK				0x00F8
 #define MADERA_OPCLK_DIV_SHIFT				     3
-#define MADERA_OPCLK_DIV_WIDTH				     5
 #define MADERA_OPCLK_SEL_MASK				0x0007
 #define MADERA_OPCLK_SEL_SHIFT				     0
-#define MADERA_OPCLK_SEL_WIDTH				     3
 
 /* (0x014A)  Output_async_clock */
 #define MADERA_OPCLK_ASYNC_ENA				0x8000
 #define MADERA_OPCLK_ASYNC_ENA_MASK			0x8000
 #define MADERA_OPCLK_ASYNC_ENA_SHIFT			    15
-#define MADERA_OPCLK_ASYNC_ENA_WIDTH			     1
 #define MADERA_OPCLK_ASYNC_DIV_MASK			0x00F8
 #define MADERA_OPCLK_ASYNC_DIV_SHIFT			     3
-#define MADERA_OPCLK_ASYNC_DIV_WIDTH			     5
 #define MADERA_OPCLK_ASYNC_SEL_MASK			0x0007
 #define MADERA_OPCLK_ASYNC_SEL_SHIFT			     0
-#define MADERA_OPCLK_ASYNC_SEL_WIDTH			     3
 
 /* (0x0171)  FLL1_Control_1 */
 #define CS47L92_FLL1_REFCLK_SRC_MASK			0xF000
 #define CS47L92_FLL1_REFCLK_SRC_SHIFT			    12
-#define CS47L92_FLL1_REFCLK_SRC_WIDTH			     4
 #define MADERA_FLL1_HOLD_MASK				0x0004
 #define MADERA_FLL1_HOLD_SHIFT				     2
-#define MADERA_FLL1_HOLD_WIDTH				     1
 #define MADERA_FLL1_FREERUN				0x0002
 #define MADERA_FLL1_FREERUN_MASK			0x0002
 #define MADERA_FLL1_FREERUN_SHIFT			     1
-#define MADERA_FLL1_FREERUN_WIDTH			     1
 #define MADERA_FLL1_ENA					0x0001
 #define MADERA_FLL1_ENA_MASK				0x0001
 #define MADERA_FLL1_ENA_SHIFT				     0
-#define MADERA_FLL1_ENA_WIDTH				     1
 
 /* (0x0172)  FLL1_Control_2 */
 #define MADERA_FLL1_CTRL_UPD				0x8000
 #define MADERA_FLL1_CTRL_UPD_MASK			0x8000
 #define MADERA_FLL1_CTRL_UPD_SHIFT			    15
-#define MADERA_FLL1_CTRL_UPD_WIDTH			     1
 #define MADERA_FLL1_N_MASK				0x03FF
 #define MADERA_FLL1_N_SHIFT				     0
-#define MADERA_FLL1_N_WIDTH				    10
 
 /* (0x0173)  FLL1_Control_3 */
 #define MADERA_FLL1_THETA_MASK				0xFFFF
 #define MADERA_FLL1_THETA_SHIFT				     0
-#define MADERA_FLL1_THETA_WIDTH				    16
 
 /* (0x0174)  FLL1_Control_4 */
 #define MADERA_FLL1_LAMBDA_MASK				0xFFFF
 #define MADERA_FLL1_LAMBDA_SHIFT			     0
-#define MADERA_FLL1_LAMBDA_WIDTH			    16
 
 /* (0x0175)  FLL1_Control_5 */
 #define MADERA_FLL1_FRATIO_MASK				0x0F00
 #define MADERA_FLL1_FRATIO_SHIFT			     8
-#define MADERA_FLL1_FRATIO_WIDTH			     4
 #define MADERA_FLL1_FB_DIV_MASK				0x03FF
 #define MADERA_FLL1_FB_DIV_SHIFT			     0
-#define MADERA_FLL1_FB_DIV_WIDTH			    10
 
 /* (0x0176)  FLL1_Control_6 */
 #define MADERA_FLL1_REFCLK_DIV_MASK			0x00C0
 #define MADERA_FLL1_REFCLK_DIV_SHIFT			     6
-#define MADERA_FLL1_REFCLK_DIV_WIDTH			     2
 #define MADERA_FLL1_REFCLK_SRC_MASK			0x000F
 #define MADERA_FLL1_REFCLK_SRC_SHIFT			     0
-#define MADERA_FLL1_REFCLK_SRC_WIDTH			     4
 
 /* (0x0179)  FLL1_Control_7 */
 #define MADERA_FLL1_GAIN_MASK				0x003c
 #define MADERA_FLL1_GAIN_SHIFT				     2
-#define MADERA_FLL1_GAIN_WIDTH				     4
 
 /* (0x017A)  FLL1_EFS_2 */
 #define MADERA_FLL1_PHASE_GAIN_MASK			0xF000
 #define MADERA_FLL1_PHASE_GAIN_SHIFT			    12
-#define MADERA_FLL1_PHASE_GAIN_WIDTH			     4
 #define MADERA_FLL1_PHASE_ENA_MASK			0x0800
 #define MADERA_FLL1_PHASE_ENA_SHIFT			    11
-#define MADERA_FLL1_PHASE_ENA_WIDTH			     1
 
 /* (0x017A)  FLL1_Control_10 */
 #define MADERA_FLL1_HP_MASK				0xC000
 #define MADERA_FLL1_HP_SHIFT				    14
-#define MADERA_FLL1_HP_WIDTH				     2
 #define MADERA_FLL1_PHASEDET_ENA_MASK			0x1000
 #define MADERA_FLL1_PHASEDET_ENA_SHIFT			    12
-#define MADERA_FLL1_PHASEDET_ENA_WIDTH			     1
 
 /* (0x017B)  FLL1_Control_11 */
 #define MADERA_FLL1_LOCKDET_THR_MASK			0x001E
 #define MADERA_FLL1_LOCKDET_THR_SHIFT			     1
-#define MADERA_FLL1_LOCKDET_THR_WIDTH			     4
 #define MADERA_FLL1_LOCKDET_MASK			0x0001
 #define MADERA_FLL1_LOCKDET_SHIFT			     0
-#define MADERA_FLL1_LOCKDET_WIDTH			     1
 
 /* (0x017D)  FLL1_Digital_Test_1 */
 #define MADERA_FLL1_SYNC_EFS_ENA_MASK			0x0100
 #define MADERA_FLL1_SYNC_EFS_ENA_SHIFT			     8
-#define MADERA_FLL1_SYNC_EFS_ENA_WIDTH			     1
 #define MADERA_FLL1_CLK_VCO_FAST_SRC_MASK		0x0003
 #define MADERA_FLL1_CLK_VCO_FAST_SRC_SHIFT		     0
-#define MADERA_FLL1_CLK_VCO_FAST_SRC_WIDTH		     2
 
 /* (0x0181)  FLL1_Synchroniser_1 */
 #define MADERA_FLL1_SYNC_ENA				0x0001
 #define MADERA_FLL1_SYNC_ENA_MASK			0x0001
 #define MADERA_FLL1_SYNC_ENA_SHIFT			     0
-#define MADERA_FLL1_SYNC_ENA_WIDTH			     1
 
 /* (0x0182)  FLL1_Synchroniser_2 */
 #define MADERA_FLL1_SYNC_N_MASK				0x03FF
 #define MADERA_FLL1_SYNC_N_SHIFT			     0
-#define MADERA_FLL1_SYNC_N_WIDTH			    10
 
 /* (0x0183)  FLL1_Synchroniser_3 */
 #define MADERA_FLL1_SYNC_THETA_MASK			0xFFFF
 #define MADERA_FLL1_SYNC_THETA_SHIFT			     0
-#define MADERA_FLL1_SYNC_THETA_WIDTH			    16
 
 /* (0x0184)  FLL1_Synchroniser_4 */
 #define MADERA_FLL1_SYNC_LAMBDA_MASK			0xFFFF
 #define MADERA_FLL1_SYNC_LAMBDA_SHIFT			     0
-#define MADERA_FLL1_SYNC_LAMBDA_WIDTH			    16
 
 /* (0x0185)  FLL1_Synchroniser_5 */
 #define MADERA_FLL1_SYNC_FRATIO_MASK			0x0700
 #define MADERA_FLL1_SYNC_FRATIO_SHIFT			     8
-#define MADERA_FLL1_SYNC_FRATIO_WIDTH			     3
 
 /* (0x0186)  FLL1_Synchroniser_6 */
 #define MADERA_FLL1_SYNCCLK_DIV_MASK			0x00C0
 #define MADERA_FLL1_SYNCCLK_DIV_SHIFT			     6
-#define MADERA_FLL1_SYNCCLK_DIV_WIDTH			     2
 #define MADERA_FLL1_SYNCCLK_SRC_MASK			0x000F
 #define MADERA_FLL1_SYNCCLK_SRC_SHIFT			     0
-#define MADERA_FLL1_SYNCCLK_SRC_WIDTH			     4
 
 /* (0x0187)  FLL1_Synchroniser_7 */
 #define MADERA_FLL1_SYNC_GAIN_MASK			0x003c
 #define MADERA_FLL1_SYNC_GAIN_SHIFT			     2
-#define MADERA_FLL1_SYNC_GAIN_WIDTH			     4
 #define MADERA_FLL1_SYNC_DFSAT				0x0001
 #define MADERA_FLL1_SYNC_DFSAT_MASK			0x0001
 #define MADERA_FLL1_SYNC_DFSAT_SHIFT			     0
-#define MADERA_FLL1_SYNC_DFSAT_WIDTH			     1
 
 /* (0x01D1)  FLL_AO_Control_1 */
 #define MADERA_FLL_AO_HOLD				0x0004
 #define MADERA_FLL_AO_HOLD_MASK				0x0004
 #define MADERA_FLL_AO_HOLD_SHIFT			     2
-#define MADERA_FLL_AO_HOLD_WIDTH			     1
 #define MADERA_FLL_AO_FREERUN				0x0002
 #define MADERA_FLL_AO_FREERUN_MASK			0x0002
 #define MADERA_FLL_AO_FREERUN_SHIFT			     1
-#define MADERA_FLL_AO_FREERUN_WIDTH			     1
 #define MADERA_FLL_AO_ENA				0x0001
 #define MADERA_FLL_AO_ENA_MASK				0x0001
 #define MADERA_FLL_AO_ENA_SHIFT				     0
-#define MADERA_FLL_AO_ENA_WIDTH				     1
 
 /* (0x01D2)  FLL_AO_Control_2 */
 #define MADERA_FLL_AO_CTRL_UPD				0x8000
 #define MADERA_FLL_AO_CTRL_UPD_MASK			0x8000
 #define MADERA_FLL_AO_CTRL_UPD_SHIFT			    15
-#define MADERA_FLL_AO_CTRL_UPD_WIDTH			     1
 
 /* (0x01D6)  FLL_AO_Control_6 */
 #define MADERA_FLL_AO_REFCLK_SRC_MASK			0x000F
 #define MADERA_FLL_AO_REFCLK_SRC_SHIFT			     0
-#define MADERA_FLL_AO_REFCLK_SRC_WIDTH			     4
 
 /* (0x0200)  Mic_Charge_Pump_1 */
 #define MADERA_CPMIC_BYPASS				0x0002
 #define MADERA_CPMIC_BYPASS_MASK			0x0002
 #define MADERA_CPMIC_BYPASS_SHIFT			     1
-#define MADERA_CPMIC_BYPASS_WIDTH			     1
 #define MADERA_CPMIC_ENA				0x0001
 #define MADERA_CPMIC_ENA_MASK				0x0001
 #define MADERA_CPMIC_ENA_SHIFT				     0
-#define MADERA_CPMIC_ENA_WIDTH				     1
 
 /* (0x0210)  LDO1_Control_1 */
 #define MADERA_LDO1_VSEL_MASK				0x07E0
 #define MADERA_LDO1_VSEL_SHIFT				     5
-#define MADERA_LDO1_VSEL_WIDTH				     6
 #define MADERA_LDO1_FAST				0x0010
 #define MADERA_LDO1_FAST_MASK				0x0010
 #define MADERA_LDO1_FAST_SHIFT				     4
-#define MADERA_LDO1_FAST_WIDTH				     1
 #define MADERA_LDO1_DISCH				0x0004
 #define MADERA_LDO1_DISCH_MASK				0x0004
 #define MADERA_LDO1_DISCH_SHIFT				     2
-#define MADERA_LDO1_DISCH_WIDTH				     1
 #define MADERA_LDO1_BYPASS				0x0002
 #define MADERA_LDO1_BYPASS_MASK				0x0002
 #define MADERA_LDO1_BYPASS_SHIFT			     1
-#define MADERA_LDO1_BYPASS_WIDTH			     1
 #define MADERA_LDO1_ENA					0x0001
 #define MADERA_LDO1_ENA_MASK				0x0001
 #define MADERA_LDO1_ENA_SHIFT				     0
-#define MADERA_LDO1_ENA_WIDTH				     1
 
 /* (0x0213)  LDO2_Control_1 */
 #define MADERA_LDO2_VSEL_MASK				0x07E0
 #define MADERA_LDO2_VSEL_SHIFT				     5
-#define MADERA_LDO2_VSEL_WIDTH				     6
 #define MADERA_LDO2_FAST				0x0010
 #define MADERA_LDO2_FAST_MASK				0x0010
 #define MADERA_LDO2_FAST_SHIFT				     4
-#define MADERA_LDO2_FAST_WIDTH				     1
 #define MADERA_LDO2_DISCH				0x0004
 #define MADERA_LDO2_DISCH_MASK				0x0004
 #define MADERA_LDO2_DISCH_SHIFT				     2
-#define MADERA_LDO2_DISCH_WIDTH				     1
 #define MADERA_LDO2_BYPASS				0x0002
 #define MADERA_LDO2_BYPASS_MASK				0x0002
 #define MADERA_LDO2_BYPASS_SHIFT			     1
-#define MADERA_LDO2_BYPASS_WIDTH			     1
 #define MADERA_LDO2_ENA					0x0001
 #define MADERA_LDO2_ENA_MASK				0x0001
 #define MADERA_LDO2_ENA_SHIFT				     0
-#define MADERA_LDO2_ENA_WIDTH				     1
 
 /* (0x0218)  Mic_Bias_Ctrl_1 */
 #define MADERA_MICB1_EXT_CAP				0x8000
 #define MADERA_MICB1_EXT_CAP_MASK			0x8000
 #define MADERA_MICB1_EXT_CAP_SHIFT			    15
-#define MADERA_MICB1_EXT_CAP_WIDTH			     1
 #define MADERA_MICB1_LVL_MASK				0x01E0
 #define MADERA_MICB1_LVL_SHIFT				     5
-#define MADERA_MICB1_LVL_WIDTH				     4
 #define MADERA_MICB1_ENA				0x0001
 #define MADERA_MICB1_ENA_MASK				0x0001
 #define MADERA_MICB1_ENA_SHIFT				     0
-#define MADERA_MICB1_ENA_WIDTH				     1
 
 /* (0x021C)  Mic_Bias_Ctrl_5 */
 #define MADERA_MICB1D_ENA				0x1000
 #define MADERA_MICB1D_ENA_MASK				0x1000
 #define MADERA_MICB1D_ENA_SHIFT				    12
-#define MADERA_MICB1D_ENA_WIDTH				     1
 #define MADERA_MICB1C_ENA				0x0100
 #define MADERA_MICB1C_ENA_MASK				0x0100
 #define MADERA_MICB1C_ENA_SHIFT				     8
-#define MADERA_MICB1C_ENA_WIDTH				     1
 #define MADERA_MICB1B_ENA				0x0010
 #define MADERA_MICB1B_ENA_MASK				0x0010
 #define MADERA_MICB1B_ENA_SHIFT				     4
-#define MADERA_MICB1B_ENA_WIDTH				     1
 #define MADERA_MICB1A_ENA				0x0001
 #define MADERA_MICB1A_ENA_MASK				0x0001
 #define MADERA_MICB1A_ENA_SHIFT				     0
-#define MADERA_MICB1A_ENA_WIDTH				     1
 
 /* (0x021E)  Mic_Bias_Ctrl_6 */
 #define MADERA_MICB2D_ENA				0x1000
 #define MADERA_MICB2D_ENA_MASK				0x1000
 #define MADERA_MICB2D_ENA_SHIFT				    12
-#define MADERA_MICB2D_ENA_WIDTH				     1
 #define MADERA_MICB2C_ENA				0x0100
 #define MADERA_MICB2C_ENA_MASK				0x0100
 #define MADERA_MICB2C_ENA_SHIFT				     8
-#define MADERA_MICB2C_ENA_WIDTH				     1
 #define MADERA_MICB2B_ENA				0x0010
 #define MADERA_MICB2B_ENA_MASK				0x0010
 #define MADERA_MICB2B_ENA_SHIFT				     4
-#define MADERA_MICB2B_ENA_WIDTH				     1
 #define MADERA_MICB2A_ENA				0x0001
 #define MADERA_MICB2A_ENA_MASK				0x0001
 #define MADERA_MICB2A_ENA_SHIFT				     0
-#define MADERA_MICB2A_ENA_WIDTH				     1
 
 /* (0x0225) - HP Ctrl 1L */
 #define MADERA_RMV_SHRT_HP1L				0x4000
 #define MADERA_RMV_SHRT_HP1L_MASK			0x4000
 #define MADERA_RMV_SHRT_HP1L_SHIFT			    14
-#define MADERA_RMV_SHRT_HP1L_WIDTH			     1
 #define MADERA_HP1L_FLWR				0x0004
 #define MADERA_HP1L_FLWR_MASK				0x0004
 #define MADERA_HP1L_FLWR_SHIFT				     2
-#define MADERA_HP1L_FLWR_WIDTH				     1
 #define MADERA_HP1L_SHRTI				0x0002
 #define MADERA_HP1L_SHRTI_MASK				0x0002
 #define MADERA_HP1L_SHRTI_SHIFT				     1
-#define MADERA_HP1L_SHRTI_WIDTH				     1
 #define MADERA_HP1L_SHRTO				0x0001
 #define MADERA_HP1L_SHRTO_MASK				0x0001
 #define MADERA_HP1L_SHRTO_SHIFT				     0
-#define MADERA_HP1L_SHRTO_WIDTH				     1
 
 /* (0x0226) - HP Ctrl 1R */
 #define MADERA_RMV_SHRT_HP1R				0x4000
 #define MADERA_RMV_SHRT_HP1R_MASK			0x4000
 #define MADERA_RMV_SHRT_HP1R_SHIFT			    14
-#define MADERA_RMV_SHRT_HP1R_WIDTH			     1
 #define MADERA_HP1R_FLWR				0x0004
 #define MADERA_HP1R_FLWR_MASK				0x0004
 #define MADERA_HP1R_FLWR_SHIFT				     2
-#define MADERA_HP1R_FLWR_WIDTH				     1
 #define MADERA_HP1R_SHRTI				0x0002
 #define MADERA_HP1R_SHRTI_MASK				0x0002
 #define MADERA_HP1R_SHRTI_SHIFT				     1
-#define MADERA_HP1R_SHRTI_WIDTH				     1
 #define MADERA_HP1R_SHRTO				0x0001
 #define MADERA_HP1R_SHRTO_MASK				0x0001
 #define MADERA_HP1R_SHRTO_SHIFT				     0
-#define MADERA_HP1R_SHRTO_WIDTH				     1
 
 /* (0x0293)  Accessory_Detect_Mode_1 */
 #define MADERA_ACCDET_SRC				0x2000
 #define MADERA_ACCDET_SRC_MASK				0x2000
 #define MADERA_ACCDET_SRC_SHIFT				    13
-#define MADERA_ACCDET_SRC_WIDTH				     1
 #define MADERA_ACCDET_POLARITY_INV_ENA			0x0080
 #define MADERA_ACCDET_POLARITY_INV_ENA_MASK		0x0080
 #define MADERA_ACCDET_POLARITY_INV_ENA_SHIFT		     7
-#define MADERA_ACCDET_POLARITY_INV_ENA_WIDTH		     1
 #define MADERA_ACCDET_MODE_MASK				0x0007
 #define MADERA_ACCDET_MODE_SHIFT			     0
-#define MADERA_ACCDET_MODE_WIDTH			     3
 
 /* (0x0299)  Headphone_Detect_0 */
 #define MADERA_HPD_GND_SEL				0x0007
 #define MADERA_HPD_GND_SEL_MASK				0x0007
 #define MADERA_HPD_GND_SEL_SHIFT			     0
-#define MADERA_HPD_GND_SEL_WIDTH			     3
 #define MADERA_HPD_SENSE_SEL				0x00F0
 #define MADERA_HPD_SENSE_SEL_MASK			0x00F0
 #define MADERA_HPD_SENSE_SEL_SHIFT			     4
-#define MADERA_HPD_SENSE_SEL_WIDTH			     4
 #define MADERA_HPD_FRC_SEL				0x0F00
 #define MADERA_HPD_FRC_SEL_MASK				0x0F00
 #define MADERA_HPD_FRC_SEL_SHIFT			     8
-#define MADERA_HPD_FRC_SEL_WIDTH			     4
 #define MADERA_HPD_OUT_SEL				0x7000
 #define MADERA_HPD_OUT_SEL_MASK				0x7000
 #define MADERA_HPD_OUT_SEL_SHIFT			    12
-#define MADERA_HPD_OUT_SEL_WIDTH			     3
 #define MADERA_HPD_OVD_ENA_SEL				0x8000
 #define MADERA_HPD_OVD_ENA_SEL_MASK			0x8000
 #define MADERA_HPD_OVD_ENA_SEL_SHIFT			    15
-#define MADERA_HPD_OVD_ENA_SEL_WIDTH			     1
 
 /* (0x029B)  Headphone_Detect_1 */
 #define MADERA_HP_IMPEDANCE_RANGE_MASK			0x0600
 #define MADERA_HP_IMPEDANCE_RANGE_SHIFT			     9
-#define MADERA_HP_IMPEDANCE_RANGE_WIDTH			     2
 #define MADERA_HP_STEP_SIZE				0x0100
 #define MADERA_HP_STEP_SIZE_MASK			0x0100
 #define MADERA_HP_STEP_SIZE_SHIFT			     8
-#define MADERA_HP_STEP_SIZE_WIDTH			     1
 #define MADERA_HP_CLK_DIV_MASK				0x0018
 #define MADERA_HP_CLK_DIV_SHIFT				     3
-#define MADERA_HP_CLK_DIV_WIDTH				     2
 #define MADERA_HP_RATE_MASK				0x0006
 #define MADERA_HP_RATE_SHIFT				     1
-#define MADERA_HP_RATE_WIDTH				     2
 #define MADERA_HP_POLL					0x0001
 #define MADERA_HP_POLL_MASK				0x0001
 #define MADERA_HP_POLL_SHIFT				     0
-#define MADERA_HP_POLL_WIDTH				     1
 
 /* (0x029C)  Headphone_Detect_2 */
 #define MADERA_HP_DONE_MASK				0x8000
 #define MADERA_HP_DONE_SHIFT				    15
-#define MADERA_HP_DONE_WIDTH				     1
 #define MADERA_HP_LVL_MASK				0x7FFF
 #define MADERA_HP_LVL_SHIFT				     0
-#define MADERA_HP_LVL_WIDTH				    15
 
 /* (0x029D)  Headphone_Detect_3 */
 #define MADERA_HP_DACVAL_MASK				0x03FF
 #define MADERA_HP_DACVAL_SHIFT				     0
-#define MADERA_HP_DACVAL_WIDTH				    10
 
 /* (0x029F) - Headphone Detect 5 */
 #define MADERA_HP_DACVAL_DOWN_MASK			0x03FF
 #define MADERA_HP_DACVAL_DOWN_SHIFT			     0
-#define MADERA_HP_DACVAL_DOWN_WIDTH			    10
 
 /* (0x02A2)  Mic_Detect_1_Control_0 */
 #define MADERA_MICD1_GND_MASK				0x0007
 #define MADERA_MICD1_GND_SHIFT				     0
-#define MADERA_MICD1_GND_WIDTH				     3
 #define MADERA_MICD1_SENSE_MASK				0x00F0
 #define MADERA_MICD1_SENSE_SHIFT			     4
-#define MADERA_MICD1_SENSE_WIDTH			     4
 #define MADERA_MICD1_ADC_MODE_MASK			0x8000
 #define MADERA_MICD1_ADC_MODE_SHIFT			    15
-#define MADERA_MICD1_ADC_MODE_WIDTH			     1
 
 /* (0x02A3)  Mic_Detect_1_Control_1 */
 #define MADERA_MICD_BIAS_STARTTIME_MASK			0xF000
 #define MADERA_MICD_BIAS_STARTTIME_SHIFT		    12
-#define MADERA_MICD_BIAS_STARTTIME_WIDTH		     4
 #define MADERA_MICD_RATE_MASK				0x0F00
 #define MADERA_MICD_RATE_SHIFT				     8
-#define MADERA_MICD_RATE_WIDTH				     4
 #define MADERA_MICD_BIAS_SRC_MASK			0x00F0
 #define MADERA_MICD_BIAS_SRC_SHIFT			     4
-#define MADERA_MICD_BIAS_SRC_WIDTH			     4
 #define MADERA_MICD_DBTIME				0x0002
 #define MADERA_MICD_DBTIME_MASK				0x0002
 #define MADERA_MICD_DBTIME_SHIFT			     1
-#define MADERA_MICD_DBTIME_WIDTH			     1
 #define MADERA_MICD_ENA					0x0001
 #define MADERA_MICD_ENA_MASK				0x0001
 #define MADERA_MICD_ENA_SHIFT				     0
-#define MADERA_MICD_ENA_WIDTH				     1
 
 /* (0x02A4)  Mic_Detect_1_Control_2 */
 #define MADERA_MICD_LVL_SEL_MASK			0x00FF
 #define MADERA_MICD_LVL_SEL_SHIFT			     0
-#define MADERA_MICD_LVL_SEL_WIDTH			     8
 
 /* (0x02A5)  Mic_Detect_1_Control_3 */
 #define MADERA_MICD_LVL_0				0x0004
@@ -1859,1746 +1731,1341 @@
 #define MADERA_MICD_LVL_8				0x0400
 #define MADERA_MICD_LVL_MASK				0x07FC
 #define MADERA_MICD_LVL_SHIFT				     2
-#define MADERA_MICD_LVL_WIDTH				     9
 #define MADERA_MICD_VALID				0x0002
 #define MADERA_MICD_VALID_MASK				0x0002
 #define MADERA_MICD_VALID_SHIFT				     1
-#define MADERA_MICD_VALID_WIDTH				     1
 #define MADERA_MICD_STS					0x0001
 #define MADERA_MICD_STS_MASK				0x0001
 #define MADERA_MICD_STS_SHIFT				     0
-#define MADERA_MICD_STS_WIDTH				     1
 
 /* (0x02AB)  Mic_Detect_1_Control_4 */
 #define MADERA_MICDET_ADCVAL_DIFF_MASK			0xFF00
 #define MADERA_MICDET_ADCVAL_DIFF_SHIFT			     8
-#define MADERA_MICDET_ADCVAL_DIFF_WIDTH			     8
 #define MADERA_MICDET_ADCVAL_MASK			0x007F
 #define MADERA_MICDET_ADCVAL_SHIFT			     0
-#define MADERA_MICDET_ADCVAL_WIDTH			     7
 
 /* (0x02C6)  Micd_Clamp_control */
 #define MADERA_MICD_CLAMP_OVD				0x0010
 #define MADERA_MICD_CLAMP_OVD_MASK			0x0010
 #define MADERA_MICD_CLAMP_OVD_SHIFT			     4
-#define MADERA_MICD_CLAMP_OVD_WIDTH			     1
 #define MADERA_MICD_CLAMP_MODE_MASK			0x000F
 #define MADERA_MICD_CLAMP_MODE_SHIFT			     0
-#define MADERA_MICD_CLAMP_MODE_WIDTH			     4
 
 /* (0x02C8)  GP_Switch_1 */
 #define MADERA_SW2_MODE_MASK				0x000C
 #define MADERA_SW2_MODE_SHIFT				     2
-#define MADERA_SW2_MODE_WIDTH				     2
 #define MADERA_SW1_MODE_MASK				0x0003
 #define MADERA_SW1_MODE_SHIFT				     0
-#define MADERA_SW1_MODE_WIDTH				     2
 
 /* (0x02D3)  Jack_detect_analogue */
 #define MADERA_JD2_ENA					0x0002
 #define MADERA_JD2_ENA_MASK				0x0002
 #define MADERA_JD2_ENA_SHIFT				     1
-#define MADERA_JD2_ENA_WIDTH				     1
 #define MADERA_JD1_ENA					0x0001
 #define MADERA_JD1_ENA_MASK				0x0001
 #define MADERA_JD1_ENA_SHIFT				     0
-#define MADERA_JD1_ENA_WIDTH				     1
 
 /* (0x0300)  Input_Enables */
 #define MADERA_IN6L_ENA					0x0800
 #define MADERA_IN6L_ENA_MASK				0x0800
 #define MADERA_IN6L_ENA_SHIFT				    11
-#define MADERA_IN6L_ENA_WIDTH				     1
 #define MADERA_IN6R_ENA					0x0400
 #define MADERA_IN6R_ENA_MASK				0x0400
 #define MADERA_IN6R_ENA_SHIFT				    10
-#define MADERA_IN6R_ENA_WIDTH				     1
 #define MADERA_IN5L_ENA					0x0200
 #define MADERA_IN5L_ENA_MASK				0x0200
 #define MADERA_IN5L_ENA_SHIFT				     9
-#define MADERA_IN5L_ENA_WIDTH				     1
 #define MADERA_IN5R_ENA					0x0100
 #define MADERA_IN5R_ENA_MASK				0x0100
 #define MADERA_IN5R_ENA_SHIFT				     8
-#define MADERA_IN5R_ENA_WIDTH				     1
 #define MADERA_IN4L_ENA					0x0080
 #define MADERA_IN4L_ENA_MASK				0x0080
 #define MADERA_IN4L_ENA_SHIFT				     7
-#define MADERA_IN4L_ENA_WIDTH				     1
 #define MADERA_IN4R_ENA					0x0040
 #define MADERA_IN4R_ENA_MASK				0x0040
 #define MADERA_IN4R_ENA_SHIFT				     6
-#define MADERA_IN4R_ENA_WIDTH				     1
 #define MADERA_IN3L_ENA					0x0020
 #define MADERA_IN3L_ENA_MASK				0x0020
 #define MADERA_IN3L_ENA_SHIFT				     5
-#define MADERA_IN3L_ENA_WIDTH				     1
 #define MADERA_IN3R_ENA					0x0010
 #define MADERA_IN3R_ENA_MASK				0x0010
 #define MADERA_IN3R_ENA_SHIFT				     4
-#define MADERA_IN3R_ENA_WIDTH				     1
 #define MADERA_IN2L_ENA					0x0008
 #define MADERA_IN2L_ENA_MASK				0x0008
 #define MADERA_IN2L_ENA_SHIFT				     3
-#define MADERA_IN2L_ENA_WIDTH				     1
 #define MADERA_IN2R_ENA					0x0004
 #define MADERA_IN2R_ENA_MASK				0x0004
 #define MADERA_IN2R_ENA_SHIFT				     2
-#define MADERA_IN2R_ENA_WIDTH				     1
 #define MADERA_IN1L_ENA					0x0002
 #define MADERA_IN1L_ENA_MASK				0x0002
 #define MADERA_IN1L_ENA_SHIFT				     1
-#define MADERA_IN1L_ENA_WIDTH				     1
 #define MADERA_IN1R_ENA					0x0001
 #define MADERA_IN1R_ENA_MASK				0x0001
 #define MADERA_IN1R_ENA_SHIFT				     0
-#define MADERA_IN1R_ENA_WIDTH				     1
 
 /* (0x0308)  Input_Rate */
 #define MADERA_IN_RATE_MASK				0xF800
 #define MADERA_IN_RATE_SHIFT				    11
-#define MADERA_IN_RATE_WIDTH				     5
 #define MADERA_IN_MODE_MASK				0x0400
 #define MADERA_IN_MODE_SHIFT				    10
-#define MADERA_IN_MODE_WIDTH				     1
 
 /* (0x0309)  Input_Volume_Ramp */
 #define MADERA_IN_VD_RAMP_MASK				0x0070
 #define MADERA_IN_VD_RAMP_SHIFT				     4
-#define MADERA_IN_VD_RAMP_WIDTH				     3
 #define MADERA_IN_VI_RAMP_MASK				0x0007
 #define MADERA_IN_VI_RAMP_SHIFT				     0
-#define MADERA_IN_VI_RAMP_WIDTH				     3
 
 /* (0x030C)  HPF_Control */
 #define MADERA_IN_HPF_CUT_MASK				0x0007
 #define MADERA_IN_HPF_CUT_SHIFT				     0
-#define MADERA_IN_HPF_CUT_WIDTH				     3
 
 /* (0x0310)  IN1L_Control */
 #define MADERA_IN1L_HPF_MASK				0x8000
 #define MADERA_IN1L_HPF_SHIFT				    15
-#define MADERA_IN1L_HPF_WIDTH				     1
 #define MADERA_IN1_DMIC_SUP_MASK			0x1800
 #define MADERA_IN1_DMIC_SUP_SHIFT			    11
-#define MADERA_IN1_DMIC_SUP_WIDTH			     2
 #define MADERA_IN1_MODE_MASK				0x0400
 #define MADERA_IN1_MODE_SHIFT				    10
-#define MADERA_IN1_MODE_WIDTH				     1
 #define MADERA_IN1L_PGA_VOL_MASK			0x00FE
 #define MADERA_IN1L_PGA_VOL_SHIFT			     1
-#define MADERA_IN1L_PGA_VOL_WIDTH			     7
 
 /* (0x0311)  ADC_Digital_Volume_1L */
 #define MADERA_IN1L_SRC_MASK				0x4000
 #define MADERA_IN1L_SRC_SHIFT				    14
-#define MADERA_IN1L_SRC_WIDTH				     1
 #define MADERA_IN1L_SRC_SE_MASK				0x2000
 #define MADERA_IN1L_SRC_SE_SHIFT			    13
-#define MADERA_IN1L_SRC_SE_WIDTH			     1
 #define MADERA_IN1L_LP_MODE				0x0800
 #define MADERA_IN1L_LP_MODE_MASK			0x0800
 #define MADERA_IN1L_LP_MODE_SHIFT			    11
-#define MADERA_IN1L_LP_MODE_WIDTH			     1
 #define MADERA_IN_VU					0x0200
 #define MADERA_IN_VU_MASK				0x0200
 #define MADERA_IN_VU_SHIFT				     9
-#define MADERA_IN_VU_WIDTH				     1
 #define MADERA_IN1L_MUTE				0x0100
 #define MADERA_IN1L_MUTE_MASK				0x0100
 #define MADERA_IN1L_MUTE_SHIFT				     8
-#define MADERA_IN1L_MUTE_WIDTH				     1
 #define MADERA_IN1L_DIG_VOL_MASK			0x00FF
 #define MADERA_IN1L_DIG_VOL_SHIFT			     0
-#define MADERA_IN1L_DIG_VOL_WIDTH			     8
 
 /* (0x0312)  DMIC1L_Control */
 #define MADERA_IN1_OSR_MASK				0x0700
 #define MADERA_IN1_OSR_SHIFT				     8
-#define MADERA_IN1_OSR_WIDTH				     3
 
 /* (0x0313)  IN1L_Rate_Control */
 #define MADERA_IN1L_RATE_MASK				0xF800
 #define MADERA_IN1L_RATE_SHIFT				    11
-#define MADERA_IN1L_RATE_WIDTH				     5
 
 /* (0x0314)  IN1R_Control */
 #define MADERA_IN1R_HPF_MASK				0x8000
 #define MADERA_IN1R_HPF_SHIFT				    15
-#define MADERA_IN1R_HPF_WIDTH				     1
 #define MADERA_IN1R_PGA_VOL_MASK			0x00FE
 #define MADERA_IN1R_PGA_VOL_SHIFT			     1
-#define MADERA_IN1R_PGA_VOL_WIDTH			     7
 #define MADERA_IN1_DMICCLK_SRC_MASK			0x1800
 #define MADERA_IN1_DMICCLK_SRC_SHIFT			    11
-#define MADERA_IN1_DMICCLK_SRC_WIDTH			     2
 
 /* (0x0315)  ADC_Digital_Volume_1R */
 #define MADERA_IN1R_SRC_MASK				0x4000
 #define MADERA_IN1R_SRC_SHIFT				    14
-#define MADERA_IN1R_SRC_WIDTH				     1
 #define MADERA_IN1R_SRC_SE_MASK				0x2000
 #define MADERA_IN1R_SRC_SE_SHIFT			    13
-#define MADERA_IN1R_SRC_SE_WIDTH			     1
 #define MADERA_IN1R_LP_MODE				0x0800
 #define MADERA_IN1R_LP_MODE_MASK			0x0800
 #define MADERA_IN1R_LP_MODE_SHIFT			    11
-#define MADERA_IN1R_LP_MODE_WIDTH			     1
 #define MADERA_IN1R_MUTE				0x0100
 #define MADERA_IN1R_MUTE_MASK				0x0100
 #define MADERA_IN1R_MUTE_SHIFT				     8
-#define MADERA_IN1R_MUTE_WIDTH				     1
 #define MADERA_IN1R_DIG_VOL_MASK			0x00FF
 #define MADERA_IN1R_DIG_VOL_SHIFT			     0
-#define MADERA_IN1R_DIG_VOL_WIDTH			     8
 
 /* (0x0317)  IN1R_Rate_Control */
 #define MADERA_IN1R_RATE_MASK				0xF800
 #define MADERA_IN1R_RATE_SHIFT				    11
-#define MADERA_IN1R_RATE_WIDTH				     5
 
 /* (0x0318)  IN2L_Control */
 #define MADERA_IN2L_HPF_MASK				0x8000
 #define MADERA_IN2L_HPF_SHIFT				    15
-#define MADERA_IN2L_HPF_WIDTH				     1
 #define MADERA_IN2_DMIC_SUP_MASK			0x1800
 #define MADERA_IN2_DMIC_SUP_SHIFT			    11
-#define MADERA_IN2_DMIC_SUP_WIDTH			     2
 #define MADERA_IN2_MODE_MASK				0x0400
 #define MADERA_IN2_MODE_SHIFT				    10
-#define MADERA_IN2_MODE_WIDTH				     1
 #define MADERA_IN2L_PGA_VOL_MASK			0x00FE
 #define MADERA_IN2L_PGA_VOL_SHIFT			     1
-#define MADERA_IN2L_PGA_VOL_WIDTH			     7
 
 /* (0x0319)  ADC_Digital_Volume_2L */
 #define MADERA_IN2L_SRC_MASK				0x4000
 #define MADERA_IN2L_SRC_SHIFT				    14
-#define MADERA_IN2L_SRC_WIDTH				     1
 #define MADERA_IN2L_SRC_SE_MASK				0x2000
 #define MADERA_IN2L_SRC_SE_SHIFT			    13
-#define MADERA_IN2L_SRC_SE_WIDTH			     1
 #define MADERA_IN2L_LP_MODE				0x0800
 #define MADERA_IN2L_LP_MODE_MASK			0x0800
 #define MADERA_IN2L_LP_MODE_SHIFT			    11
-#define MADERA_IN2L_LP_MODE_WIDTH			     1
 #define MADERA_IN2L_MUTE				0x0100
 #define MADERA_IN2L_MUTE_MASK				0x0100
 #define MADERA_IN2L_MUTE_SHIFT				     8
-#define MADERA_IN2L_MUTE_WIDTH				     1
 #define MADERA_IN2L_DIG_VOL_MASK			0x00FF
 #define MADERA_IN2L_DIG_VOL_SHIFT			     0
-#define MADERA_IN2L_DIG_VOL_WIDTH			     8
 
 /* (0x031A)  DMIC2L_Control */
 #define MADERA_IN2_OSR_MASK				0x0700
 #define MADERA_IN2_OSR_SHIFT				     8
-#define MADERA_IN2_OSR_WIDTH				     3
 
 /* (0x031C)  IN2R_Control */
 #define MADERA_IN2R_HPF_MASK				0x8000
 #define MADERA_IN2R_HPF_SHIFT				    15
-#define MADERA_IN2R_HPF_WIDTH				     1
 #define MADERA_IN2R_PGA_VOL_MASK			0x00FE
 #define MADERA_IN2R_PGA_VOL_SHIFT			     1
-#define MADERA_IN2R_PGA_VOL_WIDTH			     7
 #define MADERA_IN2_DMICCLK_SRC_MASK			0x1800
 #define MADERA_IN2_DMICCLK_SRC_SHIFT			    11
-#define MADERA_IN2_DMICCLK_SRC_WIDTH			     2
 
 /* (0x031D)  ADC_Digital_Volume_2R */
 #define MADERA_IN2R_SRC_MASK				0x4000
 #define MADERA_IN2R_SRC_SHIFT				    14
-#define MADERA_IN2R_SRC_WIDTH				     1
 #define MADERA_IN2R_SRC_SE_MASK				0x2000
 #define MADERA_IN2R_SRC_SE_SHIFT			    13
-#define MADERA_IN2R_SRC_SE_WIDTH			     1
 #define MADERA_IN2R_LP_MODE				0x0800
 #define MADERA_IN2R_LP_MODE_MASK			0x0800
 #define MADERA_IN2R_LP_MODE_SHIFT			    11
-#define MADERA_IN2R_LP_MODE_WIDTH			     1
 #define MADERA_IN2R_MUTE				0x0100
 #define MADERA_IN2R_MUTE_MASK				0x0100
 #define MADERA_IN2R_MUTE_SHIFT				     8
-#define MADERA_IN2R_MUTE_WIDTH				     1
 #define MADERA_IN2R_DIG_VOL_MASK			0x00FF
 #define MADERA_IN2R_DIG_VOL_SHIFT			     0
-#define MADERA_IN2R_DIG_VOL_WIDTH			     8
 
 /* (0x0320)  IN3L_Control */
 #define MADERA_IN3L_HPF_MASK				0x8000
 #define MADERA_IN3L_HPF_SHIFT				    15
-#define MADERA_IN3L_HPF_WIDTH				     1
 #define MADERA_IN3_DMIC_SUP_MASK			0x1800
 #define MADERA_IN3_DMIC_SUP_SHIFT			    11
-#define MADERA_IN3_DMIC_SUP_WIDTH			     2
 #define MADERA_IN3_MODE_MASK				0x0400
 #define MADERA_IN3_MODE_SHIFT				    10
-#define MADERA_IN3_MODE_WIDTH				     1
 #define MADERA_IN3L_PGA_VOL_MASK			0x00FE
 #define MADERA_IN3L_PGA_VOL_SHIFT			     1
-#define MADERA_IN3L_PGA_VOL_WIDTH			     7
 
 /* (0x0321)  ADC_Digital_Volume_3L */
 #define MADERA_IN3L_MUTE				0x0100
 #define MADERA_IN3L_MUTE_MASK				0x0100
 #define MADERA_IN3L_MUTE_SHIFT				     8
-#define MADERA_IN3L_MUTE_WIDTH				     1
 #define MADERA_IN3L_DIG_VOL_MASK			0x00FF
 #define MADERA_IN3L_DIG_VOL_SHIFT			     0
-#define MADERA_IN3L_DIG_VOL_WIDTH			     8
 
 /* (0x0322)  DMIC3L_Control */
 #define MADERA_IN3_OSR_MASK				0x0700
 #define MADERA_IN3_OSR_SHIFT				     8
-#define MADERA_IN3_OSR_WIDTH				     3
 
 /* (0x0324)  IN3R_Control */
 #define MADERA_IN3R_HPF_MASK				0x8000
 #define MADERA_IN3R_HPF_SHIFT				    15
-#define MADERA_IN3R_HPF_WIDTH				     1
 #define MADERA_IN3R_PGA_VOL_MASK			0x00FE
 #define MADERA_IN3R_PGA_VOL_SHIFT			     1
-#define MADERA_IN3R_PGA_VOL_WIDTH			     7
 #define MADERA_IN3_DMICCLK_SRC_MASK			0x1800
 #define MADERA_IN3_DMICCLK_SRC_SHIFT			    11
-#define MADERA_IN3_DMICCLK_SRC_WIDTH			     2
 
 /* (0x0325)  ADC_Digital_Volume_3R */
 #define MADERA_IN3R_MUTE				0x0100
 #define MADERA_IN3R_MUTE_MASK				0x0100
 #define MADERA_IN3R_MUTE_SHIFT				     8
-#define MADERA_IN3R_MUTE_WIDTH				     1
 #define MADERA_IN3R_DIG_VOL_MASK			0x00FF
 #define MADERA_IN3R_DIG_VOL_SHIFT			     0
-#define MADERA_IN3R_DIG_VOL_WIDTH			     8
 
 /* (0x0328)  IN4L_Control */
 #define MADERA_IN4L_HPF_MASK				0x8000
 #define MADERA_IN4L_HPF_SHIFT				    15
-#define MADERA_IN4L_HPF_WIDTH				     1
 #define MADERA_IN4_DMIC_SUP_MASK			0x1800
 #define MADERA_IN4_DMIC_SUP_SHIFT			    11
-#define MADERA_IN4_DMIC_SUP_WIDTH			     2
 
 /* (0x0329)  ADC_Digital_Volume_4L */
 #define MADERA_IN4L_MUTE				0x0100
 #define MADERA_IN4L_MUTE_MASK				0x0100
 #define MADERA_IN4L_MUTE_SHIFT				     8
-#define MADERA_IN4L_MUTE_WIDTH				     1
 #define MADERA_IN4L_DIG_VOL_MASK			0x00FF
 #define MADERA_IN4L_DIG_VOL_SHIFT			     0
-#define MADERA_IN4L_DIG_VOL_WIDTH			     8
 
 /* (0x032A)  DMIC4L_Control */
 #define MADERA_IN4_OSR_MASK				0x0700
 #define MADERA_IN4_OSR_SHIFT				     8
-#define MADERA_IN4_OSR_WIDTH				     3
 
 /* (0x032C)  IN4R_Control */
 #define MADERA_IN4R_HPF_MASK				0x8000
 #define MADERA_IN4R_HPF_SHIFT				    15
-#define MADERA_IN4R_HPF_WIDTH				     1
 #define MADERA_IN4_DMICCLK_SRC_MASK			0x1800
 #define MADERA_IN4_DMICCLK_SRC_SHIFT			    11
-#define MADERA_IN4_DMICCLK_SRC_WIDTH			     2
 
 /* (0x032D)  ADC_Digital_Volume_4R */
 #define MADERA_IN4R_MUTE				0x0100
 #define MADERA_IN4R_MUTE_MASK				0x0100
 #define MADERA_IN4R_MUTE_SHIFT				     8
-#define MADERA_IN4R_MUTE_WIDTH				     1
 #define MADERA_IN4R_DIG_VOL_MASK			0x00FF
 #define MADERA_IN4R_DIG_VOL_SHIFT			     0
-#define MADERA_IN4R_DIG_VOL_WIDTH			     8
 
 /* (0x0330)  IN5L_Control */
 #define MADERA_IN5L_HPF_MASK				0x8000
 #define MADERA_IN5L_HPF_SHIFT				    15
-#define MADERA_IN5L_HPF_WIDTH				     1
 #define MADERA_IN5_DMIC_SUP_MASK			0x1800
 #define MADERA_IN5_DMIC_SUP_SHIFT			    11
-#define MADERA_IN5_DMIC_SUP_WIDTH			     2
 
 /* (0x0331)  ADC_Digital_Volume_5L */
 #define MADERA_IN5L_MUTE				0x0100
 #define MADERA_IN5L_MUTE_MASK				0x0100
 #define MADERA_IN5L_MUTE_SHIFT				     8
-#define MADERA_IN5L_MUTE_WIDTH				     1
 #define MADERA_IN5L_DIG_VOL_MASK			0x00FF
 #define MADERA_IN5L_DIG_VOL_SHIFT			     0
-#define MADERA_IN5L_DIG_VOL_WIDTH			     8
 
 /* (0x0332)  DMIC5L_Control */
 #define MADERA_IN5_OSR_MASK				0x0700
 #define MADERA_IN5_OSR_SHIFT				     8
-#define MADERA_IN5_OSR_WIDTH				     3
 
 /* (0x0334)  IN5R_Control */
 #define MADERA_IN5R_HPF_MASK				0x8000
 #define MADERA_IN5R_HPF_SHIFT				    15
-#define MADERA_IN5R_HPF_WIDTH				     1
 #define MADERA_IN5_DMICCLK_SRC_MASK			0x1800
 #define MADERA_IN5_DMICCLK_SRC_SHIFT			    11
-#define MADERA_IN5_DMICCLK_SRC_WIDTH			     2
 
 /* (0x0335)  ADC_Digital_Volume_5R */
 #define MADERA_IN5R_MUTE				0x0100
 #define MADERA_IN5R_MUTE_MASK				0x0100
 #define MADERA_IN5R_MUTE_SHIFT				     8
-#define MADERA_IN5R_MUTE_WIDTH				     1
 #define MADERA_IN5R_DIG_VOL_MASK			0x00FF
 #define MADERA_IN5R_DIG_VOL_SHIFT			     0
-#define MADERA_IN5R_DIG_VOL_WIDTH			     8
 
 /* (0x0338)  IN6L_Control */
 #define MADERA_IN6L_HPF_MASK				0x8000
 #define MADERA_IN6L_HPF_SHIFT				    15
-#define MADERA_IN6L_HPF_WIDTH				     1
 #define MADERA_IN6_DMIC_SUP_MASK			0x1800
 #define MADERA_IN6_DMIC_SUP_SHIFT			    11
-#define MADERA_IN6_DMIC_SUP_WIDTH			     2
 
 /* (0x0339)  ADC_Digital_Volume_6L */
 #define MADERA_IN6L_MUTE				0x0100
 #define MADERA_IN6L_MUTE_MASK				0x0100
 #define MADERA_IN6L_MUTE_SHIFT				     8
-#define MADERA_IN6L_MUTE_WIDTH				     1
 #define MADERA_IN6L_DIG_VOL_MASK			0x00FF
 #define MADERA_IN6L_DIG_VOL_SHIFT			     0
-#define MADERA_IN6L_DIG_VOL_WIDTH			     8
 
 /* (0x033A)  DMIC6L_Control */
 #define MADERA_IN6_OSR_MASK				0x0700
 #define MADERA_IN6_OSR_SHIFT				     8
-#define MADERA_IN6_OSR_WIDTH				     3
 
 /* (0x033C)  IN6R_Control */
 #define MADERA_IN6R_HPF_MASK				0x8000
 #define MADERA_IN6R_HPF_SHIFT				    15
-#define MADERA_IN6R_HPF_WIDTH				     1
 
 /* (0x033D)  ADC_Digital_Volume_6R */
 #define MADERA_IN6R_MUTE				0x0100
 #define MADERA_IN6R_MUTE_MASK				0x0100
 #define MADERA_IN6R_MUTE_SHIFT				     8
-#define MADERA_IN6R_MUTE_WIDTH				     1
 #define MADERA_IN6R_DIG_VOL_MASK			0x00FF
 #define MADERA_IN6R_DIG_VOL_SHIFT			     0
-#define MADERA_IN6R_DIG_VOL_WIDTH			     8
 
 /* (0x033E)  DMIC6R_Control */
 #define MADERA_IN6_DMICCLK_SRC_MASK			0x1800
 #define MADERA_IN6_DMICCLK_SRC_SHIFT			    11
-#define MADERA_IN6_DMICCLK_SRC_WIDTH			     2
 
 /* (0x0400)  Output_Enables_1 */
 #define MADERA_EP_SEL					0x8000
 #define MADERA_EP_SEL_MASK				0x8000
 #define MADERA_EP_SEL_SHIFT				    15
-#define MADERA_EP_SEL_WIDTH				     1
 #define MADERA_OUT6L_ENA				0x0800
 #define MADERA_OUT6L_ENA_MASK				0x0800
 #define MADERA_OUT6L_ENA_SHIFT				    11
-#define MADERA_OUT6L_ENA_WIDTH				     1
 #define MADERA_OUT6R_ENA				0x0400
 #define MADERA_OUT6R_ENA_MASK				0x0400
 #define MADERA_OUT6R_ENA_SHIFT				    10
-#define MADERA_OUT6R_ENA_WIDTH				     1
 #define MADERA_OUT5L_ENA				0x0200
 #define MADERA_OUT5L_ENA_MASK				0x0200
 #define MADERA_OUT5L_ENA_SHIFT				     9
-#define MADERA_OUT5L_ENA_WIDTH				     1
 #define MADERA_OUT5R_ENA				0x0100
 #define MADERA_OUT5R_ENA_MASK				0x0100
 #define MADERA_OUT5R_ENA_SHIFT				     8
-#define MADERA_OUT5R_ENA_WIDTH				     1
 #define MADERA_OUT4L_ENA				0x0080
 #define MADERA_OUT4L_ENA_MASK				0x0080
 #define MADERA_OUT4L_ENA_SHIFT				     7
-#define MADERA_OUT4L_ENA_WIDTH				     1
 #define MADERA_OUT4R_ENA				0x0040
 #define MADERA_OUT4R_ENA_MASK				0x0040
 #define MADERA_OUT4R_ENA_SHIFT				     6
-#define MADERA_OUT4R_ENA_WIDTH				     1
 #define MADERA_OUT3L_ENA				0x0020
 #define MADERA_OUT3L_ENA_MASK				0x0020
 #define MADERA_OUT3L_ENA_SHIFT				     5
-#define MADERA_OUT3L_ENA_WIDTH				     1
 #define MADERA_OUT3R_ENA				0x0010
 #define MADERA_OUT3R_ENA_MASK				0x0010
 #define MADERA_OUT3R_ENA_SHIFT				     4
-#define MADERA_OUT3R_ENA_WIDTH				     1
 #define MADERA_OUT2L_ENA				0x0008
 #define MADERA_OUT2L_ENA_MASK				0x0008
 #define MADERA_OUT2L_ENA_SHIFT				     3
-#define MADERA_OUT2L_ENA_WIDTH				     1
 #define MADERA_OUT2R_ENA				0x0004
 #define MADERA_OUT2R_ENA_MASK				0x0004
 #define MADERA_OUT2R_ENA_SHIFT				     2
-#define MADERA_OUT2R_ENA_WIDTH				     1
 #define MADERA_OUT1L_ENA				0x0002
 #define MADERA_OUT1L_ENA_MASK				0x0002
 #define MADERA_OUT1L_ENA_SHIFT				     1
-#define MADERA_OUT1L_ENA_WIDTH				     1
 #define MADERA_OUT1R_ENA				0x0001
 #define MADERA_OUT1R_ENA_MASK				0x0001
 #define MADERA_OUT1R_ENA_SHIFT				     0
-#define MADERA_OUT1R_ENA_WIDTH				     1
 
 /* (0x0408)  Output_Rate_1 */
 #define MADERA_CP_DAC_MODE_MASK				0x0040
 #define MADERA_CP_DAC_MODE_SHIFT			     6
-#define MADERA_CP_DAC_MODE_WIDTH			     1
 #define MADERA_OUT_EXT_CLK_DIV_MASK			0x0030
 #define MADERA_OUT_EXT_CLK_DIV_SHIFT			     4
-#define MADERA_OUT_EXT_CLK_DIV_WIDTH			     2
 #define MADERA_OUT_CLK_SRC_MASK				0x0007
 #define MADERA_OUT_CLK_SRC_SHIFT			     0
-#define MADERA_OUT_CLK_SRC_WIDTH			     3
 
 /* (0x0409)  Output_Volume_Ramp */
 #define MADERA_OUT_VD_RAMP_MASK				0x0070
 #define MADERA_OUT_VD_RAMP_SHIFT			     4
-#define MADERA_OUT_VD_RAMP_WIDTH			     3
 #define MADERA_OUT_VI_RAMP_MASK				0x0007
 #define MADERA_OUT_VI_RAMP_SHIFT			     0
-#define MADERA_OUT_VI_RAMP_WIDTH			     3
 
 /* (0x0410)  Output_Path_Config_1L */
 #define MADERA_OUT1_MONO				0x1000
 #define MADERA_OUT1_MONO_MASK				0x1000
 #define MADERA_OUT1_MONO_SHIFT				    12
-#define MADERA_OUT1_MONO_WIDTH				     1
 #define MADERA_OUT1L_ANC_SRC_MASK			0x0C00
 #define MADERA_OUT1L_ANC_SRC_SHIFT			    10
-#define MADERA_OUT1L_ANC_SRC_WIDTH			     2
 
 /* (0x0411)  DAC_Digital_Volume_1L */
 #define MADERA_OUT1L_VU					0x0200
 #define MADERA_OUT1L_VU_MASK				0x0200
 #define MADERA_OUT1L_VU_SHIFT				     9
-#define MADERA_OUT1L_VU_WIDTH				     1
 #define MADERA_OUT1L_MUTE				0x0100
 #define MADERA_OUT1L_MUTE_MASK				0x0100
 #define MADERA_OUT1L_MUTE_SHIFT				     8
-#define MADERA_OUT1L_MUTE_WIDTH				     1
 #define MADERA_OUT1L_VOL_MASK				0x00FF
 #define MADERA_OUT1L_VOL_SHIFT				     0
-#define MADERA_OUT1L_VOL_WIDTH				     8
 
 /* (0x0412)  Output_Path_Config_1 */
 #define MADERA_HP1_GND_SEL_MASK				0x0007
 #define MADERA_HP1_GND_SEL_SHIFT			     0
-#define MADERA_HP1_GND_SEL_WIDTH			     3
 
 /* (0x0414)  Output_Path_Config_1R */
 #define MADERA_OUT1R_ANC_SRC_MASK			0x0C00
 #define MADERA_OUT1R_ANC_SRC_SHIFT			    10
-#define MADERA_OUT1R_ANC_SRC_WIDTH			     2
 
 /* (0x0415)  DAC_Digital_Volume_1R */
 #define MADERA_OUT1R_MUTE				0x0100
 #define MADERA_OUT1R_MUTE_MASK				0x0100
 #define MADERA_OUT1R_MUTE_SHIFT				     8
-#define MADERA_OUT1R_MUTE_WIDTH				     1
 #define MADERA_OUT1R_VOL_MASK				0x00FF
 #define MADERA_OUT1R_VOL_SHIFT				     0
-#define MADERA_OUT1R_VOL_WIDTH				     8
 
 /* (0x0418)  Output_Path_Config_2L */
 #define MADERA_OUT2L_ANC_SRC_MASK			0x0C00
 #define MADERA_OUT2L_ANC_SRC_SHIFT			    10
-#define MADERA_OUT2L_ANC_SRC_WIDTH			     2
 
 /* (0x0419)  DAC_Digital_Volume_2L */
 #define MADERA_OUT2L_MUTE				0x0100
 #define MADERA_OUT2L_MUTE_MASK				0x0100
 #define MADERA_OUT2L_MUTE_SHIFT				     8
-#define MADERA_OUT2L_MUTE_WIDTH				     1
 #define MADERA_OUT2L_VOL_MASK				0x00FF
 #define MADERA_OUT2L_VOL_SHIFT				     0
-#define MADERA_OUT2L_VOL_WIDTH				     8
 
 /* (0x041A)  Output_Path_Config_2 */
 #define MADERA_HP2_GND_SEL_MASK				0x0007
 #define MADERA_HP2_GND_SEL_SHIFT			     0
-#define MADERA_HP2_GND_SEL_WIDTH			     3
 
 /* (0x041C)  Output_Path_Config_2R */
 #define MADERA_OUT2R_ANC_SRC_MASK			0x0C00
 #define MADERA_OUT2R_ANC_SRC_SHIFT			    10
-#define MADERA_OUT2R_ANC_SRC_WIDTH			     2
 
 /* (0x041D)  DAC_Digital_Volume_2R */
 #define MADERA_OUT2R_MUTE				0x0100
 #define MADERA_OUT2R_MUTE_MASK				0x0100
 #define MADERA_OUT2R_MUTE_SHIFT				     8
-#define MADERA_OUT2R_MUTE_WIDTH				     1
 #define MADERA_OUT2R_VOL_MASK				0x00FF
 #define MADERA_OUT2R_VOL_SHIFT				     0
-#define MADERA_OUT2R_VOL_WIDTH				     8
 
 /* (0x0420)  Output_Path_Config_3L */
 #define MADERA_OUT3L_ANC_SRC_MASK			0x0C00
 #define MADERA_OUT3L_ANC_SRC_SHIFT			    10
-#define MADERA_OUT3L_ANC_SRC_WIDTH			     2
 
 /* (0x0421)  DAC_Digital_Volume_3L */
 #define MADERA_OUT3L_MUTE				0x0100
 #define MADERA_OUT3L_MUTE_MASK				0x0100
 #define MADERA_OUT3L_MUTE_SHIFT				     8
-#define MADERA_OUT3L_MUTE_WIDTH				     1
 #define MADERA_OUT3L_VOL_MASK				0x00FF
 #define MADERA_OUT3L_VOL_SHIFT				     0
-#define MADERA_OUT3L_VOL_WIDTH				     8
 
 /* (0x0424)  Output_Path_Config_3R */
 #define MADERA_OUT3R_ANC_SRC_MASK			0x0C00
 #define MADERA_OUT3R_ANC_SRC_SHIFT			    10
-#define MADERA_OUT3R_ANC_SRC_WIDTH			     2
 
 /* (0x0425)  DAC_Digital_Volume_3R */
 #define MADERA_OUT3R_MUTE				0x0100
 #define MADERA_OUT3R_MUTE_MASK				0x0100
 #define MADERA_OUT3R_MUTE_SHIFT				     8
-#define MADERA_OUT3R_MUTE_WIDTH				     1
 #define MADERA_OUT3R_VOL_MASK				0x00FF
 #define MADERA_OUT3R_VOL_SHIFT				     0
-#define MADERA_OUT3R_VOL_WIDTH				     8
 
 /* (0x0428)  Output_Path_Config_4L */
 #define MADERA_OUT4L_ANC_SRC_MASK			0x0C00
 #define MADERA_OUT4L_ANC_SRC_SHIFT			    10
-#define MADERA_OUT4L_ANC_SRC_WIDTH			     2
 
 /* (0x0429)  DAC_Digital_Volume_4L */
 #define MADERA_OUT4L_MUTE				0x0100
 #define MADERA_OUT4L_MUTE_MASK				0x0100
 #define MADERA_OUT4L_MUTE_SHIFT				     8
-#define MADERA_OUT4L_MUTE_WIDTH				     1
 #define MADERA_OUT4L_VOL_MASK				0x00FF
 #define MADERA_OUT4L_VOL_SHIFT				     0
-#define MADERA_OUT4L_VOL_WIDTH				     8
 
 /* (0x042C)  Output_Path_Config_4R */
 #define MADERA_OUT4R_ANC_SRC_MASK			0x0C00
 #define MADERA_OUT4R_ANC_SRC_SHIFT			    10
-#define MADERA_OUT4R_ANC_SRC_WIDTH			     2
 
 /* (0x042D)  DAC_Digital_Volume_4R */
 #define MADERA_OUT4R_MUTE				0x0100
 #define MADERA_OUT4R_MUTE_MASK				0x0100
 #define MADERA_OUT4R_MUTE_SHIFT				     8
-#define MADERA_OUT4R_MUTE_WIDTH				     1
 #define MADERA_OUT4R_VOL_MASK				0x00FF
 #define MADERA_OUT4R_VOL_SHIFT				     0
-#define MADERA_OUT4R_VOL_WIDTH				     8
 
 /* (0x0430)  Output_Path_Config_5L */
 #define MADERA_OUT5_OSR					0x2000
 #define MADERA_OUT5_OSR_MASK				0x2000
 #define MADERA_OUT5_OSR_SHIFT				    13
-#define MADERA_OUT5_OSR_WIDTH				     1
 #define MADERA_OUT5L_ANC_SRC_MASK			0x0C00
 #define MADERA_OUT5L_ANC_SRC_SHIFT			    10
-#define MADERA_OUT5L_ANC_SRC_WIDTH			     2
 
 /* (0x0431)  DAC_Digital_Volume_5L */
 #define MADERA_OUT5L_MUTE				0x0100
 #define MADERA_OUT5L_MUTE_MASK				0x0100
 #define MADERA_OUT5L_MUTE_SHIFT				     8
-#define MADERA_OUT5L_MUTE_WIDTH				     1
 #define MADERA_OUT5L_VOL_MASK				0x00FF
 #define MADERA_OUT5L_VOL_SHIFT				     0
-#define MADERA_OUT5L_VOL_WIDTH				     8
 
 /* (0x0434)  Output_Path_Config_5R */
 #define MADERA_OUT5R_ANC_SRC_MASK			0x0C00
 #define MADERA_OUT5R_ANC_SRC_SHIFT			    10
-#define MADERA_OUT5R_ANC_SRC_WIDTH			     2
 
 /* (0x0435)  DAC_Digital_Volume_5R */
 #define MADERA_OUT5R_MUTE				0x0100
 #define MADERA_OUT5R_MUTE_MASK				0x0100
 #define MADERA_OUT5R_MUTE_SHIFT				     8
-#define MADERA_OUT5R_MUTE_WIDTH				     1
 #define MADERA_OUT5R_VOL_MASK				0x00FF
 #define MADERA_OUT5R_VOL_SHIFT				     0
-#define MADERA_OUT5R_VOL_WIDTH				     8
 
 /* (0x0438)  Output_Path_Config_6L */
 #define MADERA_OUT6_OSR					0x2000
 #define MADERA_OUT6_OSR_MASK				0x2000
 #define MADERA_OUT6_OSR_SHIFT				    13
-#define MADERA_OUT6_OSR_WIDTH				     1
 #define MADERA_OUT6L_ANC_SRC_MASK			0x0C00
 #define MADERA_OUT6L_ANC_SRC_SHIFT			    10
-#define MADERA_OUT6L_ANC_SRC_WIDTH			     2
 
 /* (0x0439)  DAC_Digital_Volume_6L */
 #define MADERA_OUT6L_MUTE				0x0100
 #define MADERA_OUT6L_MUTE_MASK				0x0100
 #define MADERA_OUT6L_MUTE_SHIFT				     8
-#define MADERA_OUT6L_MUTE_WIDTH				     1
 #define MADERA_OUT6L_VOL_MASK				0x00FF
 #define MADERA_OUT6L_VOL_SHIFT				     0
-#define MADERA_OUT6L_VOL_WIDTH				     8
 
 /* (0x043C)  Output_Path_Config_6R */
 #define MADERA_OUT6R_ANC_SRC_MASK			0x0C00
 #define MADERA_OUT6R_ANC_SRC_SHIFT			    10
-#define MADERA_OUT6R_ANC_SRC_WIDTH			     2
 
 /* (0x043D)  DAC_Digital_Volume_6R */
 #define MADERA_OUT6R_MUTE				0x0100
 #define MADERA_OUT6R_MUTE_MASK				0x0100
 #define MADERA_OUT6R_MUTE_SHIFT				     8
-#define MADERA_OUT6R_MUTE_WIDTH				     1
 #define MADERA_OUT6R_VOL_MASK				0x00FF
 #define MADERA_OUT6R_VOL_SHIFT				     0
-#define MADERA_OUT6R_VOL_WIDTH				     8
 
 /* (0x0450) - DAC AEC Control 1 */
 #define MADERA_AEC1_LOOPBACK_SRC_MASK			0x003C
 #define MADERA_AEC1_LOOPBACK_SRC_SHIFT			     2
-#define MADERA_AEC1_LOOPBACK_SRC_WIDTH			     4
 #define MADERA_AEC1_ENA_STS				0x0002
 #define MADERA_AEC1_ENA_STS_MASK			0x0002
 #define MADERA_AEC1_ENA_STS_SHIFT			     1
-#define MADERA_AEC1_ENA_STS_WIDTH			     1
 #define MADERA_AEC1_LOOPBACK_ENA			0x0001
 #define MADERA_AEC1_LOOPBACK_ENA_MASK			0x0001
 #define MADERA_AEC1_LOOPBACK_ENA_SHIFT			     0
-#define MADERA_AEC1_LOOPBACK_ENA_WIDTH			     1
 
 /* (0x0451)  DAC_AEC_Control_2 */
 #define MADERA_AEC2_LOOPBACK_SRC_MASK			0x003C
 #define MADERA_AEC2_LOOPBACK_SRC_SHIFT			     2
-#define MADERA_AEC2_LOOPBACK_SRC_WIDTH			     4
 #define MADERA_AEC2_ENA_STS				0x0002
 #define MADERA_AEC2_ENA_STS_MASK			0x0002
 #define MADERA_AEC2_ENA_STS_SHIFT			     1
-#define MADERA_AEC2_ENA_STS_WIDTH			     1
 #define MADERA_AEC2_LOOPBACK_ENA			0x0001
 #define MADERA_AEC2_LOOPBACK_ENA_MASK			0x0001
 #define MADERA_AEC2_LOOPBACK_ENA_SHIFT			     0
-#define MADERA_AEC2_LOOPBACK_ENA_WIDTH			     1
 
 /* (0x0458)  Noise_Gate_Control */
 #define MADERA_NGATE_HOLD_MASK				0x0030
 #define MADERA_NGATE_HOLD_SHIFT				     4
-#define MADERA_NGATE_HOLD_WIDTH				     2
 #define MADERA_NGATE_THR_MASK				0x000E
 #define MADERA_NGATE_THR_SHIFT				     1
-#define MADERA_NGATE_THR_WIDTH				     3
 #define MADERA_NGATE_ENA				0x0001
 #define MADERA_NGATE_ENA_MASK				0x0001
 #define MADERA_NGATE_ENA_SHIFT				     0
-#define MADERA_NGATE_ENA_WIDTH				     1
 
 /* (0x0490)  PDM_SPK1_CTRL_1 */
 #define MADERA_SPK1R_MUTE				0x2000
 #define MADERA_SPK1R_MUTE_MASK				0x2000
 #define MADERA_SPK1R_MUTE_SHIFT				    13
-#define MADERA_SPK1R_MUTE_WIDTH				     1
 #define MADERA_SPK1L_MUTE				0x1000
 #define MADERA_SPK1L_MUTE_MASK				0x1000
 #define MADERA_SPK1L_MUTE_SHIFT				    12
-#define MADERA_SPK1L_MUTE_WIDTH				     1
 #define MADERA_SPK1_MUTE_ENDIAN				0x0100
 #define MADERA_SPK1_MUTE_ENDIAN_MASK			0x0100
 #define MADERA_SPK1_MUTE_ENDIAN_SHIFT			     8
-#define MADERA_SPK1_MUTE_ENDIAN_WIDTH			     1
 #define MADERA_SPK1_MUTE_SEQ1_MASK			0x00FF
 #define MADERA_SPK1_MUTE_SEQ1_SHIFT			     0
-#define MADERA_SPK1_MUTE_SEQ1_WIDTH			     8
 
 /* (0x0491)  PDM_SPK1_CTRL_2 */
 #define MADERA_SPK1_FMT					0x0001
 #define MADERA_SPK1_FMT_MASK				0x0001
 #define MADERA_SPK1_FMT_SHIFT				     0
-#define MADERA_SPK1_FMT_WIDTH				     1
 
 /* (0x0492)  PDM_SPK2_CTRL_1 */
 #define MADERA_SPK2R_MUTE				0x2000
 #define MADERA_SPK2R_MUTE_MASK				0x2000
 #define MADERA_SPK2R_MUTE_SHIFT				    13
-#define MADERA_SPK2R_MUTE_WIDTH				     1
 #define MADERA_SPK2L_MUTE				0x1000
 #define MADERA_SPK2L_MUTE_MASK				0x1000
 #define MADERA_SPK2L_MUTE_SHIFT				    12
-#define MADERA_SPK2L_MUTE_WIDTH				     1
 
 /* (0x04A0) - HP1 Short Circuit Ctrl */
 #define MADERA_HP1_SC_ENA				0x1000
 #define MADERA_HP1_SC_ENA_MASK				0x1000
 #define MADERA_HP1_SC_ENA_SHIFT				    12
-#define MADERA_HP1_SC_ENA_WIDTH				     1
 
 /* (0x04A1) - HP2 Short Circuit Ctrl */
 #define MADERA_HP2_SC_ENA				0x1000
 #define MADERA_HP2_SC_ENA_MASK				0x1000
 #define MADERA_HP2_SC_ENA_SHIFT				    12
-#define MADERA_HP2_SC_ENA_WIDTH				     1
 
 /* (0x04A2) - HP3 Short Circuit Ctrl */
 #define MADERA_HP3_SC_ENA				0x1000
 #define MADERA_HP3_SC_ENA_MASK				0x1000
 #define MADERA_HP3_SC_ENA_SHIFT				    12
-#define MADERA_HP3_SC_ENA_WIDTH				     1
 
 /* (0x04A8) - HP_Test_Ctrl_5 */
 #define MADERA_HP1L_ONEFLT				0x0100
 #define MADERA_HP1L_ONEFLT_MASK				0x0100
 #define MADERA_HP1L_ONEFLT_SHIFT			     8
-#define MADERA_HP1L_ONEFLT_WIDTH			     1
 
 /* (0x04A9) - HP_Test_Ctrl_6 */
 #define MADERA_HP1R_ONEFLT				0x0100
 #define MADERA_HP1R_ONEFLT_MASK				0x0100
 #define MADERA_HP1R_ONEFLT_SHIFT			     8
-#define MADERA_HP1R_ONEFLT_WIDTH			     1
 
 /* (0x0500)  AIF1_BCLK_Ctrl */
 #define MADERA_AIF1_BCLK_INV				0x0080
 #define MADERA_AIF1_BCLK_INV_MASK			0x0080
 #define MADERA_AIF1_BCLK_INV_SHIFT			     7
-#define MADERA_AIF1_BCLK_INV_WIDTH			     1
 #define MADERA_AIF1_BCLK_MSTR				0x0020
 #define MADERA_AIF1_BCLK_MSTR_MASK			0x0020
 #define MADERA_AIF1_BCLK_MSTR_SHIFT			     5
-#define MADERA_AIF1_BCLK_MSTR_WIDTH			     1
 #define MADERA_AIF1_BCLK_FREQ_MASK			0x001F
 #define MADERA_AIF1_BCLK_FREQ_SHIFT			     0
-#define MADERA_AIF1_BCLK_FREQ_WIDTH			     5
 
 /* (0x0501)  AIF1_Tx_Pin_Ctrl */
 #define MADERA_AIF1TX_LRCLK_SRC				0x0008
 #define MADERA_AIF1TX_LRCLK_SRC_MASK			0x0008
 #define MADERA_AIF1TX_LRCLK_SRC_SHIFT			     3
-#define MADERA_AIF1TX_LRCLK_SRC_WIDTH			     1
 #define MADERA_AIF1TX_LRCLK_INV				0x0004
 #define MADERA_AIF1TX_LRCLK_INV_MASK			0x0004
 #define MADERA_AIF1TX_LRCLK_INV_SHIFT			     2
-#define MADERA_AIF1TX_LRCLK_INV_WIDTH			     1
 #define MADERA_AIF1TX_LRCLK_MSTR			0x0001
 #define MADERA_AIF1TX_LRCLK_MSTR_MASK			0x0001
 #define MADERA_AIF1TX_LRCLK_MSTR_SHIFT			     0
-#define MADERA_AIF1TX_LRCLK_MSTR_WIDTH			     1
 
 /* (0x0502)  AIF1_Rx_Pin_Ctrl */
 #define MADERA_AIF1RX_LRCLK_INV				0x0004
 #define MADERA_AIF1RX_LRCLK_INV_MASK			0x0004
 #define MADERA_AIF1RX_LRCLK_INV_SHIFT			     2
-#define MADERA_AIF1RX_LRCLK_INV_WIDTH			     1
 #define MADERA_AIF1RX_LRCLK_FRC				0x0002
 #define MADERA_AIF1RX_LRCLK_FRC_MASK			0x0002
 #define MADERA_AIF1RX_LRCLK_FRC_SHIFT			     1
-#define MADERA_AIF1RX_LRCLK_FRC_WIDTH			     1
 #define MADERA_AIF1RX_LRCLK_MSTR			0x0001
 #define MADERA_AIF1RX_LRCLK_MSTR_MASK			0x0001
 #define MADERA_AIF1RX_LRCLK_MSTR_SHIFT			     0
-#define MADERA_AIF1RX_LRCLK_MSTR_WIDTH			     1
 
 /* (0x0503)  AIF1_Rate_Ctrl */
 #define MADERA_AIF1_RATE_MASK				0xF800
 #define MADERA_AIF1_RATE_SHIFT				    11
-#define MADERA_AIF1_RATE_WIDTH				     5
 #define MADERA_AIF1_TRI					0x0040
 #define MADERA_AIF1_TRI_MASK				0x0040
 #define MADERA_AIF1_TRI_SHIFT				     6
-#define MADERA_AIF1_TRI_WIDTH				     1
 
 /* (0x0504)  AIF1_Format */
 #define MADERA_AIF1_FMT_MASK				0x0007
 #define MADERA_AIF1_FMT_SHIFT				     0
-#define MADERA_AIF1_FMT_WIDTH				     3
 
 /* (0x0506)  AIF1_Rx_BCLK_Rate */
 #define MADERA_AIF1RX_BCPF_MASK				0x1FFF
 #define MADERA_AIF1RX_BCPF_SHIFT			     0
-#define MADERA_AIF1RX_BCPF_WIDTH			    13
 
 /* (0x0507)  AIF1_Frame_Ctrl_1 */
 #define MADERA_AIF1TX_WL_MASK				0x3F00
 #define MADERA_AIF1TX_WL_SHIFT				     8
-#define MADERA_AIF1TX_WL_WIDTH				     6
 #define MADERA_AIF1TX_SLOT_LEN_MASK			0x00FF
 #define MADERA_AIF1TX_SLOT_LEN_SHIFT			     0
-#define MADERA_AIF1TX_SLOT_LEN_WIDTH			     8
 
 /* (0x0508)  AIF1_Frame_Ctrl_2 */
 #define MADERA_AIF1RX_WL_MASK				0x3F00
 #define MADERA_AIF1RX_WL_SHIFT				     8
-#define MADERA_AIF1RX_WL_WIDTH				     6
 #define MADERA_AIF1RX_SLOT_LEN_MASK			0x00FF
 #define MADERA_AIF1RX_SLOT_LEN_SHIFT			     0
-#define MADERA_AIF1RX_SLOT_LEN_WIDTH			     8
 
 /* (0x0509)  AIF1_Frame_Ctrl_3 */
 #define MADERA_AIF1TX1_SLOT_MASK			0x003F
 #define MADERA_AIF1TX1_SLOT_SHIFT			     0
-#define MADERA_AIF1TX1_SLOT_WIDTH			     6
 
 /* (0x0519)  AIF1_Tx_Enables */
 #define MADERA_AIF1TX8_ENA				0x0080
 #define MADERA_AIF1TX8_ENA_MASK				0x0080
 #define MADERA_AIF1TX8_ENA_SHIFT			     7
-#define MADERA_AIF1TX8_ENA_WIDTH			     1
 #define MADERA_AIF1TX7_ENA				0x0040
 #define MADERA_AIF1TX7_ENA_MASK				0x0040
 #define MADERA_AIF1TX7_ENA_SHIFT			     6
-#define MADERA_AIF1TX7_ENA_WIDTH			     1
 #define MADERA_AIF1TX6_ENA				0x0020
 #define MADERA_AIF1TX6_ENA_MASK				0x0020
 #define MADERA_AIF1TX6_ENA_SHIFT			     5
-#define MADERA_AIF1TX6_ENA_WIDTH			     1
 #define MADERA_AIF1TX5_ENA				0x0010
 #define MADERA_AIF1TX5_ENA_MASK				0x0010
 #define MADERA_AIF1TX5_ENA_SHIFT			     4
-#define MADERA_AIF1TX5_ENA_WIDTH			     1
 #define MADERA_AIF1TX4_ENA				0x0008
 #define MADERA_AIF1TX4_ENA_MASK				0x0008
 #define MADERA_AIF1TX4_ENA_SHIFT			     3
-#define MADERA_AIF1TX4_ENA_WIDTH			     1
 #define MADERA_AIF1TX3_ENA				0x0004
 #define MADERA_AIF1TX3_ENA_MASK				0x0004
 #define MADERA_AIF1TX3_ENA_SHIFT			     2
-#define MADERA_AIF1TX3_ENA_WIDTH			     1
 #define MADERA_AIF1TX2_ENA				0x0002
 #define MADERA_AIF1TX2_ENA_MASK				0x0002
 #define MADERA_AIF1TX2_ENA_SHIFT			     1
-#define MADERA_AIF1TX2_ENA_WIDTH			     1
 #define MADERA_AIF1TX1_ENA				0x0001
 #define MADERA_AIF1TX1_ENA_MASK				0x0001
 #define MADERA_AIF1TX1_ENA_SHIFT			     0
-#define MADERA_AIF1TX1_ENA_WIDTH			     1
 
 /* (0x051A)  AIF1_Rx_Enables */
 #define MADERA_AIF1RX8_ENA				0x0080
 #define MADERA_AIF1RX8_ENA_MASK				0x0080
 #define MADERA_AIF1RX8_ENA_SHIFT			     7
-#define MADERA_AIF1RX8_ENA_WIDTH			     1
 #define MADERA_AIF1RX7_ENA				0x0040
 #define MADERA_AIF1RX7_ENA_MASK				0x0040
 #define MADERA_AIF1RX7_ENA_SHIFT			     6
-#define MADERA_AIF1RX7_ENA_WIDTH			     1
 #define MADERA_AIF1RX6_ENA				0x0020
 #define MADERA_AIF1RX6_ENA_MASK				0x0020
 #define MADERA_AIF1RX6_ENA_SHIFT			     5
-#define MADERA_AIF1RX6_ENA_WIDTH			     1
 #define MADERA_AIF1RX5_ENA				0x0010
 #define MADERA_AIF1RX5_ENA_MASK				0x0010
 #define MADERA_AIF1RX5_ENA_SHIFT			     4
-#define MADERA_AIF1RX5_ENA_WIDTH			     1
 #define MADERA_AIF1RX4_ENA				0x0008
 #define MADERA_AIF1RX4_ENA_MASK				0x0008
 #define MADERA_AIF1RX4_ENA_SHIFT			     3
-#define MADERA_AIF1RX4_ENA_WIDTH			     1
 #define MADERA_AIF1RX3_ENA				0x0004
 #define MADERA_AIF1RX3_ENA_MASK				0x0004
 #define MADERA_AIF1RX3_ENA_SHIFT			     2
-#define MADERA_AIF1RX3_ENA_WIDTH			     1
 #define MADERA_AIF1RX2_ENA				0x0002
 #define MADERA_AIF1RX2_ENA_MASK				0x0002
 #define MADERA_AIF1RX2_ENA_SHIFT			     1
-#define MADERA_AIF1RX2_ENA_WIDTH			     1
 #define MADERA_AIF1RX1_ENA				0x0001
 #define MADERA_AIF1RX1_ENA_MASK				0x0001
 #define MADERA_AIF1RX1_ENA_SHIFT			     0
-#define MADERA_AIF1RX1_ENA_WIDTH			     1
 
 /* (0x0559)  AIF2_Tx_Enables */
 #define MADERA_AIF2TX8_ENA				0x0080
 #define MADERA_AIF2TX8_ENA_MASK				0x0080
 #define MADERA_AIF2TX8_ENA_SHIFT			     7
-#define MADERA_AIF2TX8_ENA_WIDTH			     1
 #define MADERA_AIF2TX7_ENA				0x0040
 #define MADERA_AIF2TX7_ENA_MASK				0x0040
 #define MADERA_AIF2TX7_ENA_SHIFT			     6
-#define MADERA_AIF2TX7_ENA_WIDTH			     1
 #define MADERA_AIF2TX6_ENA				0x0020
 #define MADERA_AIF2TX6_ENA_MASK				0x0020
 #define MADERA_AIF2TX6_ENA_SHIFT			     5
-#define MADERA_AIF2TX6_ENA_WIDTH			     1
 #define MADERA_AIF2TX5_ENA				0x0010
 #define MADERA_AIF2TX5_ENA_MASK				0x0010
 #define MADERA_AIF2TX5_ENA_SHIFT			     4
-#define MADERA_AIF2TX5_ENA_WIDTH			     1
 #define MADERA_AIF2TX4_ENA				0x0008
 #define MADERA_AIF2TX4_ENA_MASK				0x0008
 #define MADERA_AIF2TX4_ENA_SHIFT			     3
-#define MADERA_AIF2TX4_ENA_WIDTH			     1
 #define MADERA_AIF2TX3_ENA				0x0004
 #define MADERA_AIF2TX3_ENA_MASK				0x0004
 #define MADERA_AIF2TX3_ENA_SHIFT			     2
-#define MADERA_AIF2TX3_ENA_WIDTH			     1
 #define MADERA_AIF2TX2_ENA				0x0002
 #define MADERA_AIF2TX2_ENA_MASK				0x0002
 #define MADERA_AIF2TX2_ENA_SHIFT			     1
-#define MADERA_AIF2TX2_ENA_WIDTH			     1
 #define MADERA_AIF2TX1_ENA				0x0001
 #define MADERA_AIF2TX1_ENA_MASK				0x0001
 #define MADERA_AIF2TX1_ENA_SHIFT			     0
-#define MADERA_AIF2TX1_ENA_WIDTH			     1
 
 /* (0x055A)  AIF2_Rx_Enables */
 #define MADERA_AIF2RX8_ENA				0x0080
 #define MADERA_AIF2RX8_ENA_MASK				0x0080
 #define MADERA_AIF2RX8_ENA_SHIFT			     7
-#define MADERA_AIF2RX8_ENA_WIDTH			     1
 #define MADERA_AIF2RX7_ENA				0x0040
 #define MADERA_AIF2RX7_ENA_MASK				0x0040
 #define MADERA_AIF2RX7_ENA_SHIFT			     6
-#define MADERA_AIF2RX7_ENA_WIDTH			     1
 #define MADERA_AIF2RX6_ENA				0x0020
 #define MADERA_AIF2RX6_ENA_MASK				0x0020
 #define MADERA_AIF2RX6_ENA_SHIFT			     5
-#define MADERA_AIF2RX6_ENA_WIDTH			     1
 #define MADERA_AIF2RX5_ENA				0x0010
 #define MADERA_AIF2RX5_ENA_MASK				0x0010
 #define MADERA_AIF2RX5_ENA_SHIFT			     4
-#define MADERA_AIF2RX5_ENA_WIDTH			     1
 #define MADERA_AIF2RX4_ENA				0x0008
 #define MADERA_AIF2RX4_ENA_MASK				0x0008
 #define MADERA_AIF2RX4_ENA_SHIFT			     3
-#define MADERA_AIF2RX4_ENA_WIDTH			     1
 #define MADERA_AIF2RX3_ENA				0x0004
 #define MADERA_AIF2RX3_ENA_MASK				0x0004
 #define MADERA_AIF2RX3_ENA_SHIFT			     2
-#define MADERA_AIF2RX3_ENA_WIDTH			     1
 #define MADERA_AIF2RX2_ENA				0x0002
 #define MADERA_AIF2RX2_ENA_MASK				0x0002
 #define MADERA_AIF2RX2_ENA_SHIFT			     1
-#define MADERA_AIF2RX2_ENA_WIDTH			     1
 #define MADERA_AIF2RX1_ENA				0x0001
 #define MADERA_AIF2RX1_ENA_MASK				0x0001
 #define MADERA_AIF2RX1_ENA_SHIFT			     0
-#define MADERA_AIF2RX1_ENA_WIDTH			     1
 
 /* (0x0599)  AIF3_Tx_Enables */
 #define MADERA_AIF3TX8_ENA				0x0080
 #define MADERA_AIF3TX8_ENA_MASK				0x0080
 #define MADERA_AIF3TX8_ENA_SHIFT			     7
-#define MADERA_AIF3TX8_ENA_WIDTH			     1
 #define MADERA_AIF3TX7_ENA				0x0040
 #define MADERA_AIF3TX7_ENA_MASK				0x0040
 #define MADERA_AIF3TX7_ENA_SHIFT			     6
-#define MADERA_AIF3TX7_ENA_WIDTH			     1
 #define MADERA_AIF3TX6_ENA				0x0020
 #define MADERA_AIF3TX6_ENA_MASK				0x0020
 #define MADERA_AIF3TX6_ENA_SHIFT			     5
-#define MADERA_AIF3TX6_ENA_WIDTH			     1
 #define MADERA_AIF3TX5_ENA				0x0010
 #define MADERA_AIF3TX5_ENA_MASK				0x0010
 #define MADERA_AIF3TX5_ENA_SHIFT			     4
-#define MADERA_AIF3TX5_ENA_WIDTH			     1
 #define MADERA_AIF3TX4_ENA				0x0008
 #define MADERA_AIF3TX4_ENA_MASK				0x0008
 #define MADERA_AIF3TX4_ENA_SHIFT			     3
-#define MADERA_AIF3TX4_ENA_WIDTH			     1
 #define MADERA_AIF3TX3_ENA				0x0004
 #define MADERA_AIF3TX3_ENA_MASK				0x0004
 #define MADERA_AIF3TX3_ENA_SHIFT			     2
-#define MADERA_AIF3TX3_ENA_WIDTH			     1
 #define MADERA_AIF3TX2_ENA				0x0002
 #define MADERA_AIF3TX2_ENA_MASK				0x0002
 #define MADERA_AIF3TX2_ENA_SHIFT			     1
-#define MADERA_AIF3TX2_ENA_WIDTH			     1
 #define MADERA_AIF3TX1_ENA				0x0001
 #define MADERA_AIF3TX1_ENA_MASK				0x0001
 #define MADERA_AIF3TX1_ENA_SHIFT			     0
-#define MADERA_AIF3TX1_ENA_WIDTH			     1
 
 /* (0x059A)  AIF3_Rx_Enables */
 #define MADERA_AIF3RX8_ENA				0x0080
 #define MADERA_AIF3RX8_ENA_MASK				0x0080
 #define MADERA_AIF3RX8_ENA_SHIFT			     7
-#define MADERA_AIF3RX8_ENA_WIDTH			     1
 #define MADERA_AIF3RX7_ENA				0x0040
 #define MADERA_AIF3RX7_ENA_MASK				0x0040
 #define MADERA_AIF3RX7_ENA_SHIFT			     6
-#define MADERA_AIF3RX7_ENA_WIDTH			     1
 #define MADERA_AIF3RX6_ENA				0x0020
 #define MADERA_AIF3RX6_ENA_MASK				0x0020
 #define MADERA_AIF3RX6_ENA_SHIFT			     5
-#define MADERA_AIF3RX6_ENA_WIDTH			     1
 #define MADERA_AIF3RX5_ENA				0x0010
 #define MADERA_AIF3RX5_ENA_MASK				0x0010
 #define MADERA_AIF3RX5_ENA_SHIFT			     4
-#define MADERA_AIF3RX5_ENA_WIDTH			     1
 #define MADERA_AIF3RX4_ENA				0x0008
 #define MADERA_AIF3RX4_ENA_MASK				0x0008
 #define MADERA_AIF3RX4_ENA_SHIFT			     3
-#define MADERA_AIF3RX4_ENA_WIDTH			     1
 #define MADERA_AIF3RX3_ENA				0x0004
 #define MADERA_AIF3RX3_ENA_MASK				0x0004
 #define MADERA_AIF3RX3_ENA_SHIFT			     2
-#define MADERA_AIF3RX3_ENA_WIDTH			     1
 #define MADERA_AIF3RX2_ENA				0x0002
 #define MADERA_AIF3RX2_ENA_MASK				0x0002
 #define MADERA_AIF3RX2_ENA_SHIFT			     1
-#define MADERA_AIF3RX2_ENA_WIDTH			     1
 #define MADERA_AIF3RX1_ENA				0x0001
 #define MADERA_AIF3RX1_ENA_MASK				0x0001
 #define MADERA_AIF3RX1_ENA_SHIFT			     0
-#define MADERA_AIF3RX1_ENA_WIDTH			     1
 
 /* (0x05B9)  AIF4_Tx_Enables */
 #define MADERA_AIF4TX2_ENA				0x0002
 #define MADERA_AIF4TX2_ENA_MASK				0x0002
 #define MADERA_AIF4TX2_ENA_SHIFT			     1
-#define MADERA_AIF4TX2_ENA_WIDTH			     1
 #define MADERA_AIF4TX1_ENA				0x0001
 #define MADERA_AIF4TX1_ENA_MASK				0x0001
 #define MADERA_AIF4TX1_ENA_SHIFT			     0
-#define MADERA_AIF4TX1_ENA_WIDTH			     1
 
 /* (0x05BA)  AIF4_Rx_Enables */
 #define MADERA_AIF4RX2_ENA				0x0002
 #define MADERA_AIF4RX2_ENA_MASK				0x0002
 #define MADERA_AIF4RX2_ENA_SHIFT			     1
-#define MADERA_AIF4RX2_ENA_WIDTH			     1
 #define MADERA_AIF4RX1_ENA				0x0001
 #define MADERA_AIF4RX1_ENA_MASK				0x0001
 #define MADERA_AIF4RX1_ENA_SHIFT			     0
-#define MADERA_AIF4RX1_ENA_WIDTH			     1
 
 /* (0x05C2)  SPD1_TX_Control */
 #define MADERA_SPD1_VAL2				0x2000
 #define MADERA_SPD1_VAL2_MASK				0x2000
 #define MADERA_SPD1_VAL2_SHIFT				    13
-#define MADERA_SPD1_VAL2_WIDTH				     1
 #define MADERA_SPD1_VAL1				0x1000
 #define MADERA_SPD1_VAL1_MASK				0x1000
 #define MADERA_SPD1_VAL1_SHIFT				    12
-#define MADERA_SPD1_VAL1_WIDTH				     1
 #define MADERA_SPD1_RATE_MASK				0x00F0
 #define MADERA_SPD1_RATE_SHIFT				     4
-#define MADERA_SPD1_RATE_WIDTH				     4
 #define MADERA_SPD1_ENA					0x0001
 #define MADERA_SPD1_ENA_MASK				0x0001
 #define MADERA_SPD1_ENA_SHIFT				     0
-#define MADERA_SPD1_ENA_WIDTH				     1
 
 /* (0x05F5)  SLIMbus_RX_Channel_Enable */
 #define MADERA_SLIMRX8_ENA				0x0080
 #define MADERA_SLIMRX8_ENA_MASK				0x0080
 #define MADERA_SLIMRX8_ENA_SHIFT			     7
-#define MADERA_SLIMRX8_ENA_WIDTH			     1
 #define MADERA_SLIMRX7_ENA				0x0040
 #define MADERA_SLIMRX7_ENA_MASK				0x0040
 #define MADERA_SLIMRX7_ENA_SHIFT			     6
-#define MADERA_SLIMRX7_ENA_WIDTH			     1
 #define MADERA_SLIMRX6_ENA				0x0020
 #define MADERA_SLIMRX6_ENA_MASK				0x0020
 #define MADERA_SLIMRX6_ENA_SHIFT			     5
-#define MADERA_SLIMRX6_ENA_WIDTH			     1
 #define MADERA_SLIMRX5_ENA				0x0010
 #define MADERA_SLIMRX5_ENA_MASK				0x0010
 #define MADERA_SLIMRX5_ENA_SHIFT			     4
-#define MADERA_SLIMRX5_ENA_WIDTH			     1
 #define MADERA_SLIMRX4_ENA				0x0008
 #define MADERA_SLIMRX4_ENA_MASK				0x0008
 #define MADERA_SLIMRX4_ENA_SHIFT			     3
-#define MADERA_SLIMRX4_ENA_WIDTH			     1
 #define MADERA_SLIMRX3_ENA				0x0004
 #define MADERA_SLIMRX3_ENA_MASK				0x0004
 #define MADERA_SLIMRX3_ENA_SHIFT			     2
-#define MADERA_SLIMRX3_ENA_WIDTH			     1
 #define MADERA_SLIMRX2_ENA				0x0002
 #define MADERA_SLIMRX2_ENA_MASK				0x0002
 #define MADERA_SLIMRX2_ENA_SHIFT			     1
-#define MADERA_SLIMRX2_ENA_WIDTH			     1
 #define MADERA_SLIMRX1_ENA				0x0001
 #define MADERA_SLIMRX1_ENA_MASK				0x0001
 #define MADERA_SLIMRX1_ENA_SHIFT			     0
-#define MADERA_SLIMRX1_ENA_WIDTH			     1
 
 /* (0x05F6)  SLIMbus_TX_Channel_Enable */
 #define MADERA_SLIMTX8_ENA				0x0080
 #define MADERA_SLIMTX8_ENA_MASK				0x0080
 #define MADERA_SLIMTX8_ENA_SHIFT			     7
-#define MADERA_SLIMTX8_ENA_WIDTH			     1
 #define MADERA_SLIMTX7_ENA				0x0040
 #define MADERA_SLIMTX7_ENA_MASK				0x0040
 #define MADERA_SLIMTX7_ENA_SHIFT			     6
-#define MADERA_SLIMTX7_ENA_WIDTH			     1
 #define MADERA_SLIMTX6_ENA				0x0020
 #define MADERA_SLIMTX6_ENA_MASK				0x0020
 #define MADERA_SLIMTX6_ENA_SHIFT			     5
-#define MADERA_SLIMTX6_ENA_WIDTH			     1
 #define MADERA_SLIMTX5_ENA				0x0010
 #define MADERA_SLIMTX5_ENA_MASK				0x0010
 #define MADERA_SLIMTX5_ENA_SHIFT			     4
-#define MADERA_SLIMTX5_ENA_WIDTH			     1
 #define MADERA_SLIMTX4_ENA				0x0008
 #define MADERA_SLIMTX4_ENA_MASK				0x0008
 #define MADERA_SLIMTX4_ENA_SHIFT			     3
-#define MADERA_SLIMTX4_ENA_WIDTH			     1
 #define MADERA_SLIMTX3_ENA				0x0004
 #define MADERA_SLIMTX3_ENA_MASK				0x0004
 #define MADERA_SLIMTX3_ENA_SHIFT			     2
-#define MADERA_SLIMTX3_ENA_WIDTH			     1
 #define MADERA_SLIMTX2_ENA				0x0002
 #define MADERA_SLIMTX2_ENA_MASK				0x0002
 #define MADERA_SLIMTX2_ENA_SHIFT			     1
-#define MADERA_SLIMTX2_ENA_WIDTH			     1
 #define MADERA_SLIMTX1_ENA				0x0001
 #define MADERA_SLIMTX1_ENA_MASK				0x0001
 #define MADERA_SLIMTX1_ENA_SHIFT			     0
-#define MADERA_SLIMTX1_ENA_WIDTH			     1
 
 /* (0x0E10)  EQ1_1 */
 #define MADERA_EQ1_B1_GAIN_MASK				0xF800
 #define MADERA_EQ1_B1_GAIN_SHIFT			    11
-#define MADERA_EQ1_B1_GAIN_WIDTH			     5
 #define MADERA_EQ1_B2_GAIN_MASK				0x07C0
 #define MADERA_EQ1_B2_GAIN_SHIFT			     6
-#define MADERA_EQ1_B2_GAIN_WIDTH			     5
 #define MADERA_EQ1_B3_GAIN_MASK				0x003E
 #define MADERA_EQ1_B3_GAIN_SHIFT			     1
-#define MADERA_EQ1_B3_GAIN_WIDTH			     5
 #define MADERA_EQ1_ENA					0x0001
 #define MADERA_EQ1_ENA_MASK				0x0001
 #define MADERA_EQ1_ENA_SHIFT				     0
-#define MADERA_EQ1_ENA_WIDTH				     1
 
 /* (0x0E11)  EQ1_2 */
 #define MADERA_EQ1_B4_GAIN_MASK				0xF800
 #define MADERA_EQ1_B4_GAIN_SHIFT			    11
-#define MADERA_EQ1_B4_GAIN_WIDTH			     5
 #define MADERA_EQ1_B5_GAIN_MASK				0x07C0
 #define MADERA_EQ1_B5_GAIN_SHIFT			     6
-#define MADERA_EQ1_B5_GAIN_WIDTH			     5
 #define MADERA_EQ1_B1_MODE				0x0001
 #define MADERA_EQ1_B1_MODE_MASK				0x0001
 #define MADERA_EQ1_B1_MODE_SHIFT			     0
-#define MADERA_EQ1_B1_MODE_WIDTH			     1
 
 /* (0x0E26)  EQ2_1 */
 #define MADERA_EQ2_B1_GAIN_MASK				0xF800
 #define MADERA_EQ2_B1_GAIN_SHIFT			    11
-#define MADERA_EQ2_B1_GAIN_WIDTH			     5
 #define MADERA_EQ2_B2_GAIN_MASK				0x07C0
 #define MADERA_EQ2_B2_GAIN_SHIFT			     6
-#define MADERA_EQ2_B2_GAIN_WIDTH			     5
 #define MADERA_EQ2_B3_GAIN_MASK				0x003E
 #define MADERA_EQ2_B3_GAIN_SHIFT			     1
-#define MADERA_EQ2_B3_GAIN_WIDTH			     5
 #define MADERA_EQ2_ENA					0x0001
 #define MADERA_EQ2_ENA_MASK				0x0001
 #define MADERA_EQ2_ENA_SHIFT				     0
-#define MADERA_EQ2_ENA_WIDTH				     1
 
 /* (0x0E27)  EQ2_2 */
 #define MADERA_EQ2_B4_GAIN_MASK				0xF800
 #define MADERA_EQ2_B4_GAIN_SHIFT			    11
-#define MADERA_EQ2_B4_GAIN_WIDTH			     5
 #define MADERA_EQ2_B5_GAIN_MASK				0x07C0
 #define MADERA_EQ2_B5_GAIN_SHIFT			     6
-#define MADERA_EQ2_B5_GAIN_WIDTH			     5
 #define MADERA_EQ2_B1_MODE				0x0001
 #define MADERA_EQ2_B1_MODE_MASK				0x0001
 #define MADERA_EQ2_B1_MODE_SHIFT			     0
-#define MADERA_EQ2_B1_MODE_WIDTH			     1
 
 /* (0x0E3C)  EQ3_1 */
 #define MADERA_EQ3_B1_GAIN_MASK				0xF800
 #define MADERA_EQ3_B1_GAIN_SHIFT			    11
-#define MADERA_EQ3_B1_GAIN_WIDTH			     5
 #define MADERA_EQ3_B2_GAIN_MASK				0x07C0
 #define MADERA_EQ3_B2_GAIN_SHIFT			     6
-#define MADERA_EQ3_B2_GAIN_WIDTH			     5
 #define MADERA_EQ3_B3_GAIN_MASK				0x003E
 #define MADERA_EQ3_B3_GAIN_SHIFT			     1
-#define MADERA_EQ3_B3_GAIN_WIDTH			     5
 #define MADERA_EQ3_ENA					0x0001
 #define MADERA_EQ3_ENA_MASK				0x0001
 #define MADERA_EQ3_ENA_SHIFT				     0
-#define MADERA_EQ3_ENA_WIDTH				     1
 
 /* (0x0E3D)  EQ3_2 */
 #define MADERA_EQ3_B4_GAIN_MASK				0xF800
 #define MADERA_EQ3_B4_GAIN_SHIFT			    11
-#define MADERA_EQ3_B4_GAIN_WIDTH			     5
 #define MADERA_EQ3_B5_GAIN_MASK				0x07C0
 #define MADERA_EQ3_B5_GAIN_SHIFT			     6
-#define MADERA_EQ3_B5_GAIN_WIDTH			     5
 #define MADERA_EQ3_B1_MODE				0x0001
 #define MADERA_EQ3_B1_MODE_MASK				0x0001
 #define MADERA_EQ3_B1_MODE_SHIFT			     0
-#define MADERA_EQ3_B1_MODE_WIDTH			     1
 
 /* (0x0E52)  EQ4_1 */
 #define MADERA_EQ4_B1_GAIN_MASK				0xF800
 #define MADERA_EQ4_B1_GAIN_SHIFT			    11
-#define MADERA_EQ4_B1_GAIN_WIDTH			     5
 #define MADERA_EQ4_B2_GAIN_MASK				0x07C0
 #define MADERA_EQ4_B2_GAIN_SHIFT			     6
-#define MADERA_EQ4_B2_GAIN_WIDTH			     5
 #define MADERA_EQ4_B3_GAIN_MASK				0x003E
 #define MADERA_EQ4_B3_GAIN_SHIFT			     1
-#define MADERA_EQ4_B3_GAIN_WIDTH			     5
 #define MADERA_EQ4_ENA					0x0001
 #define MADERA_EQ4_ENA_MASK				0x0001
 #define MADERA_EQ4_ENA_SHIFT				     0
-#define MADERA_EQ4_ENA_WIDTH				     1
 
 /* (0x0E53)  EQ4_2 */
 #define MADERA_EQ4_B4_GAIN_MASK				0xF800
 #define MADERA_EQ4_B4_GAIN_SHIFT			    11
-#define MADERA_EQ4_B4_GAIN_WIDTH			     5
 #define MADERA_EQ4_B5_GAIN_MASK				0x07C0
 #define MADERA_EQ4_B5_GAIN_SHIFT			     6
-#define MADERA_EQ4_B5_GAIN_WIDTH			     5
 #define MADERA_EQ4_B1_MODE				0x0001
 #define MADERA_EQ4_B1_MODE_MASK				0x0001
 #define MADERA_EQ4_B1_MODE_SHIFT			     0
-#define MADERA_EQ4_B1_MODE_WIDTH			     1
 
 /* (0x0E80)  DRC1_ctrl1 */
 #define MADERA_DRC1L_ENA				0x0002
 #define MADERA_DRC1L_ENA_MASK				0x0002
 #define MADERA_DRC1L_ENA_SHIFT				     1
-#define MADERA_DRC1L_ENA_WIDTH				     1
 #define MADERA_DRC1R_ENA				0x0001
 #define MADERA_DRC1R_ENA_MASK				0x0001
 #define MADERA_DRC1R_ENA_SHIFT				     0
-#define MADERA_DRC1R_ENA_WIDTH				     1
 
 /* (0x0E88)  DRC2_ctrl1 */
 #define MADERA_DRC2L_ENA				0x0002
 #define MADERA_DRC2L_ENA_MASK				0x0002
 #define MADERA_DRC2L_ENA_SHIFT				     1
-#define MADERA_DRC2L_ENA_WIDTH				     1
 #define MADERA_DRC2R_ENA				0x0001
 #define MADERA_DRC2R_ENA_MASK				0x0001
 #define MADERA_DRC2R_ENA_SHIFT				     0
-#define MADERA_DRC2R_ENA_WIDTH				     1
 
 /* (0x0EC0)  HPLPF1_1 */
 #define MADERA_LHPF1_MODE				0x0002
 #define MADERA_LHPF1_MODE_MASK				0x0002
 #define MADERA_LHPF1_MODE_SHIFT				     1
-#define MADERA_LHPF1_MODE_WIDTH				     1
 #define MADERA_LHPF1_ENA				0x0001
 #define MADERA_LHPF1_ENA_MASK				0x0001
 #define MADERA_LHPF1_ENA_SHIFT				     0
-#define MADERA_LHPF1_ENA_WIDTH				     1
 
 /* (0x0EC1)  HPLPF1_2 */
 #define MADERA_LHPF1_COEFF_MASK				0xFFFF
 #define MADERA_LHPF1_COEFF_SHIFT			     0
-#define MADERA_LHPF1_COEFF_WIDTH			    16
 
 /* (0x0EC4)  HPLPF2_1 */
 #define MADERA_LHPF2_MODE				0x0002
 #define MADERA_LHPF2_MODE_MASK				0x0002
 #define MADERA_LHPF2_MODE_SHIFT				     1
-#define MADERA_LHPF2_MODE_WIDTH				     1
 #define MADERA_LHPF2_ENA				0x0001
 #define MADERA_LHPF2_ENA_MASK				0x0001
 #define MADERA_LHPF2_ENA_SHIFT				     0
-#define MADERA_LHPF2_ENA_WIDTH				     1
 
 /* (0x0EC5)  HPLPF2_2 */
 #define MADERA_LHPF2_COEFF_MASK				0xFFFF
 #define MADERA_LHPF2_COEFF_SHIFT			     0
-#define MADERA_LHPF2_COEFF_WIDTH			    16
 
 /* (0x0EC8)  HPLPF3_1 */
 #define MADERA_LHPF3_MODE				0x0002
 #define MADERA_LHPF3_MODE_MASK				0x0002
 #define MADERA_LHPF3_MODE_SHIFT				     1
-#define MADERA_LHPF3_MODE_WIDTH				     1
 #define MADERA_LHPF3_ENA				0x0001
 #define MADERA_LHPF3_ENA_MASK				0x0001
 #define MADERA_LHPF3_ENA_SHIFT				     0
-#define MADERA_LHPF3_ENA_WIDTH				     1
 
 /* (0x0EC9)  HPLPF3_2 */
 #define MADERA_LHPF3_COEFF_MASK				0xFFFF
 #define MADERA_LHPF3_COEFF_SHIFT			     0
-#define MADERA_LHPF3_COEFF_WIDTH			    16
 
 /* (0x0ECC)  HPLPF4_1 */
 #define MADERA_LHPF4_MODE				0x0002
 #define MADERA_LHPF4_MODE_MASK				0x0002
 #define MADERA_LHPF4_MODE_SHIFT				     1
-#define MADERA_LHPF4_MODE_WIDTH				     1
 #define MADERA_LHPF4_ENA				0x0001
 #define MADERA_LHPF4_ENA_MASK				0x0001
 #define MADERA_LHPF4_ENA_SHIFT				     0
-#define MADERA_LHPF4_ENA_WIDTH				     1
 
 /* (0x0ECD)  HPLPF4_2 */
 #define MADERA_LHPF4_COEFF_MASK				0xFFFF
 #define MADERA_LHPF4_COEFF_SHIFT			     0
-#define MADERA_LHPF4_COEFF_WIDTH			    16
 
 /* (0x0ED0)  ASRC2_ENABLE */
 #define MADERA_ASRC2_IN2L_ENA				0x0008
 #define MADERA_ASRC2_IN2L_ENA_MASK			0x0008
 #define MADERA_ASRC2_IN2L_ENA_SHIFT			     3
-#define MADERA_ASRC2_IN2L_ENA_WIDTH			     1
 #define MADERA_ASRC2_IN2R_ENA				0x0004
 #define MADERA_ASRC2_IN2R_ENA_MASK			0x0004
 #define MADERA_ASRC2_IN2R_ENA_SHIFT			     2
-#define MADERA_ASRC2_IN2R_ENA_WIDTH			     1
 #define MADERA_ASRC2_IN1L_ENA				0x0002
 #define MADERA_ASRC2_IN1L_ENA_MASK			0x0002
 #define MADERA_ASRC2_IN1L_ENA_SHIFT			     1
-#define MADERA_ASRC2_IN1L_ENA_WIDTH			     1
 #define MADERA_ASRC2_IN1R_ENA				0x0001
 #define MADERA_ASRC2_IN1R_ENA_MASK			0x0001
 #define MADERA_ASRC2_IN1R_ENA_SHIFT			     0
-#define MADERA_ASRC2_IN1R_ENA_WIDTH			     1
 
 /* (0x0ED2)  ASRC2_RATE1 */
 #define MADERA_ASRC2_RATE1_MASK				0xF800
 #define MADERA_ASRC2_RATE1_SHIFT			    11
-#define MADERA_ASRC2_RATE1_WIDTH			     5
 
 /* (0x0ED3)  ASRC2_RATE2 */
 #define MADERA_ASRC2_RATE2_MASK				0xF800
 #define MADERA_ASRC2_RATE2_SHIFT			    11
-#define MADERA_ASRC2_RATE2_WIDTH			     5
 
 /* (0x0EE0)  ASRC1_ENABLE */
 #define MADERA_ASRC1_IN2L_ENA				0x0008
 #define MADERA_ASRC1_IN2L_ENA_MASK			0x0008
 #define MADERA_ASRC1_IN2L_ENA_SHIFT			     3
-#define MADERA_ASRC1_IN2L_ENA_WIDTH			     1
 #define MADERA_ASRC1_IN2R_ENA				0x0004
 #define MADERA_ASRC1_IN2R_ENA_MASK			0x0004
 #define MADERA_ASRC1_IN2R_ENA_SHIFT			     2
-#define MADERA_ASRC1_IN2R_ENA_WIDTH			     1
 #define MADERA_ASRC1_IN1L_ENA				0x0002
 #define MADERA_ASRC1_IN1L_ENA_MASK			0x0002
 #define MADERA_ASRC1_IN1L_ENA_SHIFT			     1
-#define MADERA_ASRC1_IN1L_ENA_WIDTH			     1
 #define MADERA_ASRC1_IN1R_ENA				0x0001
 #define MADERA_ASRC1_IN1R_ENA_MASK			0x0001
 #define MADERA_ASRC1_IN1R_ENA_SHIFT			     0
-#define MADERA_ASRC1_IN1R_ENA_WIDTH			     1
 
 /* (0x0EE2)  ASRC1_RATE1 */
 #define MADERA_ASRC1_RATE1_MASK				0xF800
 #define MADERA_ASRC1_RATE1_SHIFT			    11
-#define MADERA_ASRC1_RATE1_WIDTH			     5
 
 /* (0x0EE3)  ASRC1_RATE2 */
 #define MADERA_ASRC1_RATE2_MASK				0xF800
 #define MADERA_ASRC1_RATE2_SHIFT			    11
-#define MADERA_ASRC1_RATE2_WIDTH			     5
 
 /* (0x0EF0) - ISRC1 CTRL 1 */
 #define MADERA_ISRC1_FSH_MASK				0xF800
 #define MADERA_ISRC1_FSH_SHIFT				    11
-#define MADERA_ISRC1_FSH_WIDTH				     5
 #define MADERA_ISRC1_CLK_SEL_MASK			0x0700
 #define MADERA_ISRC1_CLK_SEL_SHIFT			     8
-#define MADERA_ISRC1_CLK_SEL_WIDTH			     3
 
 /* (0x0EF1)  ISRC1_CTRL_2 */
 #define MADERA_ISRC1_FSL_MASK				0xF800
 #define MADERA_ISRC1_FSL_SHIFT				    11
-#define MADERA_ISRC1_FSL_WIDTH				     5
 
 /* (0x0EF2)  ISRC1_CTRL_3 */
 #define MADERA_ISRC1_INT1_ENA				0x8000
 #define MADERA_ISRC1_INT1_ENA_MASK			0x8000
 #define MADERA_ISRC1_INT1_ENA_SHIFT			    15
-#define MADERA_ISRC1_INT1_ENA_WIDTH			     1
 #define MADERA_ISRC1_INT2_ENA				0x4000
 #define MADERA_ISRC1_INT2_ENA_MASK			0x4000
 #define MADERA_ISRC1_INT2_ENA_SHIFT			    14
-#define MADERA_ISRC1_INT2_ENA_WIDTH			     1
 #define MADERA_ISRC1_INT3_ENA				0x2000
 #define MADERA_ISRC1_INT3_ENA_MASK			0x2000
 #define MADERA_ISRC1_INT3_ENA_SHIFT			    13
-#define MADERA_ISRC1_INT3_ENA_WIDTH			     1
 #define MADERA_ISRC1_INT4_ENA				0x1000
 #define MADERA_ISRC1_INT4_ENA_MASK			0x1000
 #define MADERA_ISRC1_INT4_ENA_SHIFT			    12
-#define MADERA_ISRC1_INT4_ENA_WIDTH			     1
 #define MADERA_ISRC1_DEC1_ENA				0x0200
 #define MADERA_ISRC1_DEC1_ENA_MASK			0x0200
 #define MADERA_ISRC1_DEC1_ENA_SHIFT			     9
-#define MADERA_ISRC1_DEC1_ENA_WIDTH			     1
 #define MADERA_ISRC1_DEC2_ENA				0x0100
 #define MADERA_ISRC1_DEC2_ENA_MASK			0x0100
 #define MADERA_ISRC1_DEC2_ENA_SHIFT			     8
-#define MADERA_ISRC1_DEC2_ENA_WIDTH			     1
 #define MADERA_ISRC1_DEC3_ENA				0x0080
 #define MADERA_ISRC1_DEC3_ENA_MASK			0x0080
 #define MADERA_ISRC1_DEC3_ENA_SHIFT			     7
-#define MADERA_ISRC1_DEC3_ENA_WIDTH			     1
 #define MADERA_ISRC1_DEC4_ENA				0x0040
 #define MADERA_ISRC1_DEC4_ENA_MASK			0x0040
 #define MADERA_ISRC1_DEC4_ENA_SHIFT			     6
-#define MADERA_ISRC1_DEC4_ENA_WIDTH			     1
 #define MADERA_ISRC1_NOTCH_ENA				0x0001
 #define MADERA_ISRC1_NOTCH_ENA_MASK			0x0001
 #define MADERA_ISRC1_NOTCH_ENA_SHIFT			     0
-#define MADERA_ISRC1_NOTCH_ENA_WIDTH			     1
 
 /* (0x0EF3)  ISRC2_CTRL_1 */
 #define MADERA_ISRC2_FSH_MASK				0xF800
 #define MADERA_ISRC2_FSH_SHIFT				    11
-#define MADERA_ISRC2_FSH_WIDTH				     5
 #define MADERA_ISRC2_CLK_SEL_MASK			0x0700
 #define MADERA_ISRC2_CLK_SEL_SHIFT			     8
-#define MADERA_ISRC2_CLK_SEL_WIDTH			     3
 
 /* (0x0EF4)  ISRC2_CTRL_2 */
 #define MADERA_ISRC2_FSL_MASK				0xF800
 #define MADERA_ISRC2_FSL_SHIFT				    11
-#define MADERA_ISRC2_FSL_WIDTH				     5
 
 /* (0x0EF5)  ISRC2_CTRL_3 */
 #define MADERA_ISRC2_INT1_ENA				0x8000
 #define MADERA_ISRC2_INT1_ENA_MASK			0x8000
 #define MADERA_ISRC2_INT1_ENA_SHIFT			    15
-#define MADERA_ISRC2_INT1_ENA_WIDTH			     1
 #define MADERA_ISRC2_INT2_ENA				0x4000
 #define MADERA_ISRC2_INT2_ENA_MASK			0x4000
 #define MADERA_ISRC2_INT2_ENA_SHIFT			    14
-#define MADERA_ISRC2_INT2_ENA_WIDTH			     1
 #define MADERA_ISRC2_INT3_ENA				0x2000
 #define MADERA_ISRC2_INT3_ENA_MASK			0x2000
 #define MADERA_ISRC2_INT3_ENA_SHIFT			    13
-#define MADERA_ISRC2_INT3_ENA_WIDTH			     1
 #define MADERA_ISRC2_INT4_ENA				0x1000
 #define MADERA_ISRC2_INT4_ENA_MASK			0x1000
 #define MADERA_ISRC2_INT4_ENA_SHIFT			    12
-#define MADERA_ISRC2_INT4_ENA_WIDTH			     1
 #define MADERA_ISRC2_DEC1_ENA				0x0200
 #define MADERA_ISRC2_DEC1_ENA_MASK			0x0200
 #define MADERA_ISRC2_DEC1_ENA_SHIFT			     9
-#define MADERA_ISRC2_DEC1_ENA_WIDTH			     1
 #define MADERA_ISRC2_DEC2_ENA				0x0100
 #define MADERA_ISRC2_DEC2_ENA_MASK			0x0100
 #define MADERA_ISRC2_DEC2_ENA_SHIFT			     8
-#define MADERA_ISRC2_DEC2_ENA_WIDTH			     1
 #define MADERA_ISRC2_DEC3_ENA				0x0080
 #define MADERA_ISRC2_DEC3_ENA_MASK			0x0080
 #define MADERA_ISRC2_DEC3_ENA_SHIFT			     7
-#define MADERA_ISRC2_DEC3_ENA_WIDTH			     1
 #define MADERA_ISRC2_DEC4_ENA				0x0040
 #define MADERA_ISRC2_DEC4_ENA_MASK			0x0040
 #define MADERA_ISRC2_DEC4_ENA_SHIFT			     6
-#define MADERA_ISRC2_DEC4_ENA_WIDTH			     1
 #define MADERA_ISRC2_NOTCH_ENA				0x0001
 #define MADERA_ISRC2_NOTCH_ENA_MASK			0x0001
 #define MADERA_ISRC2_NOTCH_ENA_SHIFT			     0
-#define MADERA_ISRC2_NOTCH_ENA_WIDTH			     1
 
 /* (0x0EF6)  ISRC3_CTRL_1 */
 #define MADERA_ISRC3_FSH_MASK				0xF800
 #define MADERA_ISRC3_FSH_SHIFT				    11
-#define MADERA_ISRC3_FSH_WIDTH				     5
 #define MADERA_ISRC3_CLK_SEL_MASK			0x0700
 #define MADERA_ISRC3_CLK_SEL_SHIFT			     8
-#define MADERA_ISRC3_CLK_SEL_WIDTH			     3
 
 /* (0x0EF7)  ISRC3_CTRL_2 */
 #define MADERA_ISRC3_FSL_MASK				0xF800
 #define MADERA_ISRC3_FSL_SHIFT				    11
-#define MADERA_ISRC3_FSL_WIDTH				     5
 
 /* (0x0EF8)  ISRC3_CTRL_3 */
 #define MADERA_ISRC3_INT1_ENA				0x8000
 #define MADERA_ISRC3_INT1_ENA_MASK			0x8000
 #define MADERA_ISRC3_INT1_ENA_SHIFT			    15
-#define MADERA_ISRC3_INT1_ENA_WIDTH			     1
 #define MADERA_ISRC3_INT2_ENA				0x4000
 #define MADERA_ISRC3_INT2_ENA_MASK			0x4000
 #define MADERA_ISRC3_INT2_ENA_SHIFT			    14
-#define MADERA_ISRC3_INT2_ENA_WIDTH			     1
 #define MADERA_ISRC3_INT3_ENA				0x2000
 #define MADERA_ISRC3_INT3_ENA_MASK			0x2000
 #define MADERA_ISRC3_INT3_ENA_SHIFT			    13
-#define MADERA_ISRC3_INT3_ENA_WIDTH			     1
 #define MADERA_ISRC3_INT4_ENA				0x1000
 #define MADERA_ISRC3_INT4_ENA_MASK			0x1000
 #define MADERA_ISRC3_INT4_ENA_SHIFT			    12
-#define MADERA_ISRC3_INT4_ENA_WIDTH			     1
 #define MADERA_ISRC3_DEC1_ENA				0x0200
 #define MADERA_ISRC3_DEC1_ENA_MASK			0x0200
 #define MADERA_ISRC3_DEC1_ENA_SHIFT			     9
-#define MADERA_ISRC3_DEC1_ENA_WIDTH			     1
 #define MADERA_ISRC3_DEC2_ENA				0x0100
 #define MADERA_ISRC3_DEC2_ENA_MASK			0x0100
 #define MADERA_ISRC3_DEC2_ENA_SHIFT			     8
-#define MADERA_ISRC3_DEC2_ENA_WIDTH			     1
 #define MADERA_ISRC3_DEC3_ENA				0x0080
 #define MADERA_ISRC3_DEC3_ENA_MASK			0x0080
 #define MADERA_ISRC3_DEC3_ENA_SHIFT			     7
-#define MADERA_ISRC3_DEC3_ENA_WIDTH			     1
 #define MADERA_ISRC3_DEC4_ENA				0x0040
 #define MADERA_ISRC3_DEC4_ENA_MASK			0x0040
 #define MADERA_ISRC3_DEC4_ENA_SHIFT			     6
-#define MADERA_ISRC3_DEC4_ENA_WIDTH			     1
 #define MADERA_ISRC3_NOTCH_ENA				0x0001
 #define MADERA_ISRC3_NOTCH_ENA_MASK			0x0001
 #define MADERA_ISRC3_NOTCH_ENA_SHIFT			     0
-#define MADERA_ISRC3_NOTCH_ENA_WIDTH			     1
 
 /* (0x0EF9)  ISRC4_CTRL_1 */
 #define MADERA_ISRC4_FSH_MASK				0xF800
 #define MADERA_ISRC4_FSH_SHIFT				    11
-#define MADERA_ISRC4_FSH_WIDTH				     5
 #define MADERA_ISRC4_CLK_SEL_MASK			0x0700
 #define MADERA_ISRC4_CLK_SEL_SHIFT			     8
-#define MADERA_ISRC4_CLK_SEL_WIDTH			     3
 
 /* (0x0EFA)  ISRC4_CTRL_2 */
 #define MADERA_ISRC4_FSL_MASK				0xF800
 #define MADERA_ISRC4_FSL_SHIFT				    11
-#define MADERA_ISRC4_FSL_WIDTH				     5
 
 /* (0x0EFB)  ISRC4_CTRL_3 */
 #define MADERA_ISRC4_INT1_ENA				0x8000
 #define MADERA_ISRC4_INT1_ENA_MASK			0x8000
 #define MADERA_ISRC4_INT1_ENA_SHIFT			    15
-#define MADERA_ISRC4_INT1_ENA_WIDTH			     1
 #define MADERA_ISRC4_INT2_ENA				0x4000
 #define MADERA_ISRC4_INT2_ENA_MASK			0x4000
 #define MADERA_ISRC4_INT2_ENA_SHIFT			    14
-#define MADERA_ISRC4_INT2_ENA_WIDTH			     1
 #define MADERA_ISRC4_INT3_ENA				0x2000
 #define MADERA_ISRC4_INT3_ENA_MASK			0x2000
 #define MADERA_ISRC4_INT3_ENA_SHIFT			    13
-#define MADERA_ISRC4_INT3_ENA_WIDTH			     1
 #define MADERA_ISRC4_INT4_ENA				0x1000
 #define MADERA_ISRC4_INT4_ENA_MASK			0x1000
 #define MADERA_ISRC4_INT4_ENA_SHIFT			    12
-#define MADERA_ISRC4_INT4_ENA_WIDTH			     1
 #define MADERA_ISRC4_DEC1_ENA				0x0200
 #define MADERA_ISRC4_DEC1_ENA_MASK			0x0200
 #define MADERA_ISRC4_DEC1_ENA_SHIFT			     9
-#define MADERA_ISRC4_DEC1_ENA_WIDTH			     1
 #define MADERA_ISRC4_DEC2_ENA				0x0100
 #define MADERA_ISRC4_DEC2_ENA_MASK			0x0100
 #define MADERA_ISRC4_DEC2_ENA_SHIFT			     8
-#define MADERA_ISRC4_DEC2_ENA_WIDTH			     1
 #define MADERA_ISRC4_DEC3_ENA				0x0080
 #define MADERA_ISRC4_DEC3_ENA_MASK			0x0080
 #define MADERA_ISRC4_DEC3_ENA_SHIFT			     7
-#define MADERA_ISRC4_DEC3_ENA_WIDTH			     1
 #define MADERA_ISRC4_DEC4_ENA				0x0040
 #define MADERA_ISRC4_DEC4_ENA_MASK			0x0040
 #define MADERA_ISRC4_DEC4_ENA_SHIFT			     6
-#define MADERA_ISRC4_DEC4_ENA_WIDTH			     1
 #define MADERA_ISRC4_NOTCH_ENA				0x0001
 #define MADERA_ISRC4_NOTCH_ENA_MASK			0x0001
 #define MADERA_ISRC4_NOTCH_ENA_SHIFT			     0
-#define MADERA_ISRC4_NOTCH_ENA_WIDTH			     1
 
 /* (0x0F00)  Clock_Control */
 #define MADERA_EXT_NG_SEL_CLR				0x0080
 #define MADERA_EXT_NG_SEL_CLR_MASK			0x0080
 #define MADERA_EXT_NG_SEL_CLR_SHIFT			     7
-#define MADERA_EXT_NG_SEL_CLR_WIDTH			     1
 #define MADERA_EXT_NG_SEL_SET				0x0040
 #define MADERA_EXT_NG_SEL_SET_MASK			0x0040
 #define MADERA_EXT_NG_SEL_SET_SHIFT			     6
-#define MADERA_EXT_NG_SEL_SET_WIDTH			     1
 #define MADERA_CLK_R_ENA_CLR				0x0020
 #define MADERA_CLK_R_ENA_CLR_MASK			0x0020
 #define MADERA_CLK_R_ENA_CLR_SHIFT			     5
-#define MADERA_CLK_R_ENA_CLR_WIDTH			     1
 #define MADERA_CLK_R_ENA_SET				0x0010
 #define MADERA_CLK_R_ENA_SET_MASK			0x0010
 #define MADERA_CLK_R_ENA_SET_SHIFT			     4
-#define MADERA_CLK_R_ENA_SET_WIDTH			     1
 #define MADERA_CLK_NG_ENA_CLR				0x0008
 #define MADERA_CLK_NG_ENA_CLR_MASK			0x0008
 #define MADERA_CLK_NG_ENA_CLR_SHIFT			     3
-#define MADERA_CLK_NG_ENA_CLR_WIDTH			     1
 #define MADERA_CLK_NG_ENA_SET				0x0004
 #define MADERA_CLK_NG_ENA_SET_MASK			0x0004
 #define MADERA_CLK_NG_ENA_SET_SHIFT			     2
-#define MADERA_CLK_NG_ENA_SET_WIDTH			     1
 #define MADERA_CLK_L_ENA_CLR				0x0002
 #define MADERA_CLK_L_ENA_CLR_MASK			0x0002
 #define MADERA_CLK_L_ENA_CLR_SHIFT			     1
-#define MADERA_CLK_L_ENA_CLR_WIDTH			     1
 #define MADERA_CLK_L_ENA_SET				0x0001
 #define MADERA_CLK_L_ENA_SET_MASK			0x0001
 #define MADERA_CLK_L_ENA_SET_SHIFT			     0
-#define MADERA_CLK_L_ENA_SET_WIDTH			     1
 
 /* (0x0F01)  ANC_SRC */
 #define MADERA_IN_RXANCR_SEL_MASK			0x0070
 #define MADERA_IN_RXANCR_SEL_SHIFT			     4
-#define MADERA_IN_RXANCR_SEL_WIDTH			     3
 #define MADERA_IN_RXANCL_SEL_MASK			0x0007
 #define MADERA_IN_RXANCL_SEL_SHIFT			     0
-#define MADERA_IN_RXANCL_SEL_WIDTH			     3
 
 /* (0x0F17)  FCL_ADC_reformatter_control */
 #define MADERA_FCL_MIC_MODE_SEL				0x000C
 #define MADERA_FCL_MIC_MODE_SEL_SHIFT			     2
-#define MADERA_FCL_MIC_MODE_SEL_WIDTH			     2
 
 /* (0x0F73)  FCR_ADC_reformatter_control */
 #define MADERA_FCR_MIC_MODE_SEL				0x000C
 #define MADERA_FCR_MIC_MODE_SEL_SHIFT			     2
-#define MADERA_FCR_MIC_MODE_SEL_WIDTH			     2
 
 /* (0x10C0)  AUXPDM1_CTRL_0 */
 #define MADERA_AUXPDM1_SRC_MASK				0x0F00
 #define MADERA_AUXPDM1_SRC_SHIFT			     8
-#define MADERA_AUXPDM1_SRC_WIDTH			     4
 #define MADERA_AUXPDM1_TXEDGE_MASK			0x0010
 #define MADERA_AUXPDM1_TXEDGE_SHIFT			     4
-#define MADERA_AUXPDM1_TXEDGE_WIDTH			     1
 #define MADERA_AUXPDM1_MSTR_MASK			0x0008
 #define MADERA_AUXPDM1_MSTR_SHIFT			     3
-#define MADERA_AUXPDM1_MSTR_WIDTH			     1
 #define MADERA_AUXPDM1_ENABLE_MASK			0x0001
 #define MADERA_AUXPDM1_ENABLE_SHIFT			     0
-#define MADERA_AUXPDM1_ENABLE_WIDTH			     1
 
 /* (0x10C1)  AUXPDM1_CTRL_1 */
 #define MADERA_AUXPDM1_CLK_FREQ_MASK			0xC000
 #define MADERA_AUXPDM1_CLK_FREQ_SHIFT			    14
-#define MADERA_AUXPDM1_CLK_FREQ_WIDTH			     2
 
 /* (0x1480)  DFC1_CTRL_W0 */
 #define MADERA_DFC1_RATE_MASK				0x007C
 #define MADERA_DFC1_RATE_SHIFT				     2
-#define MADERA_DFC1_RATE_WIDTH				     5
 #define MADERA_DFC1_DITH_ENA				0x0002
 #define MADERA_DFC1_DITH_ENA_MASK			0x0002
 #define MADERA_DFC1_DITH_ENA_SHIFT			     1
-#define MADERA_DFC1_DITH_ENA_WIDTH			     1
 #define MADERA_DFC1_ENA					0x0001
 #define MADERA_DFC1_ENA_MASK				0x0001
 #define MADERA_DFC1_ENA_SHIFT				     0
-#define MADERA_DFC1_ENA_WIDTH				     1
 
 /* (0x1482)  DFC1_RX_W0 */
 #define MADERA_DFC1_RX_DATA_WIDTH_MASK			0x1F00
 #define MADERA_DFC1_RX_DATA_WIDTH_SHIFT			     8
-#define MADERA_DFC1_RX_DATA_WIDTH_WIDTH			     5
 
 #define MADERA_DFC1_RX_DATA_TYPE_MASK			0x0007
 #define MADERA_DFC1_RX_DATA_TYPE_SHIFT			     0
-#define MADERA_DFC1_RX_DATA_TYPE_WIDTH			     3
 
 /* (0x1484)  DFC1_TX_W0 */
 #define MADERA_DFC1_TX_DATA_WIDTH_MASK			0x1F00
 #define MADERA_DFC1_TX_DATA_WIDTH_SHIFT			     8
-#define MADERA_DFC1_TX_DATA_WIDTH_WIDTH			     5
 
 #define MADERA_DFC1_TX_DATA_TYPE_MASK			0x0007
 #define MADERA_DFC1_TX_DATA_TYPE_SHIFT			     0
-#define MADERA_DFC1_TX_DATA_TYPE_WIDTH			     3
 
 /* (0x1600)  ADSP2_IRQ0 */
 #define MADERA_DSP_IRQ2					0x0002
@@ -3636,449 +3103,347 @@
 #define MADERA_GP1_LVL					0x8000
 #define MADERA_GP1_LVL_MASK				0x8000
 #define MADERA_GP1_LVL_SHIFT				    15
-#define MADERA_GP1_LVL_WIDTH				     1
 #define MADERA_GP1_OP_CFG				0x4000
 #define MADERA_GP1_OP_CFG_MASK				0x4000
 #define MADERA_GP1_OP_CFG_SHIFT				    14
-#define MADERA_GP1_OP_CFG_WIDTH				     1
 #define MADERA_GP1_DB					0x2000
 #define MADERA_GP1_DB_MASK				0x2000
 #define MADERA_GP1_DB_SHIFT				    13
-#define MADERA_GP1_DB_WIDTH				     1
 #define MADERA_GP1_POL					0x1000
 #define MADERA_GP1_POL_MASK				0x1000
 #define MADERA_GP1_POL_SHIFT				    12
-#define MADERA_GP1_POL_WIDTH				     1
 #define MADERA_GP1_IP_CFG				0x0800
 #define MADERA_GP1_IP_CFG_MASK				0x0800
 #define MADERA_GP1_IP_CFG_SHIFT				    11
-#define MADERA_GP1_IP_CFG_WIDTH				     1
 #define MADERA_GP1_FN_MASK				0x03FF
 #define MADERA_GP1_FN_SHIFT				     0
-#define MADERA_GP1_FN_WIDTH				    10
 
 /* (0x1701)  GPIO1_CTRL_2 */
 #define MADERA_GP1_DIR					0x8000
 #define MADERA_GP1_DIR_MASK				0x8000
 #define MADERA_GP1_DIR_SHIFT				    15
-#define MADERA_GP1_DIR_WIDTH				     1
 #define MADERA_GP1_PU					0x4000
 #define MADERA_GP1_PU_MASK				0x4000
 #define MADERA_GP1_PU_SHIFT				    14
-#define MADERA_GP1_PU_WIDTH				     1
 #define MADERA_GP1_PD					0x2000
 #define MADERA_GP1_PD_MASK				0x2000
 #define MADERA_GP1_PD_SHIFT				    13
-#define MADERA_GP1_PD_WIDTH				     1
 #define MADERA_GP1_DRV_STR_MASK				0x1800
 #define MADERA_GP1_DRV_STR_SHIFT			    11
-#define MADERA_GP1_DRV_STR_WIDTH			     2
 
 /* (0x1800)  IRQ1_Status_1 */
 #define MADERA_CTRLIF_ERR_EINT1				0x1000
 #define MADERA_CTRLIF_ERR_EINT1_MASK			0x1000
 #define MADERA_CTRLIF_ERR_EINT1_SHIFT			    12
-#define MADERA_CTRLIF_ERR_EINT1_WIDTH			     1
 #define MADERA_SYSCLK_FAIL_EINT1			0x0200
 #define MADERA_SYSCLK_FAIL_EINT1_MASK			0x0200
 #define MADERA_SYSCLK_FAIL_EINT1_SHIFT			     9
-#define MADERA_SYSCLK_FAIL_EINT1_WIDTH			     1
 #define MADERA_CLOCK_DETECT_EINT1			0x0100
 #define MADERA_CLOCK_DETECT_EINT1_MASK			0x0100
 #define MADERA_CLOCK_DETECT_EINT1_SHIFT			     8
-#define MADERA_CLOCK_DETECT_EINT1_WIDTH			     1
 #define MADERA_BOOT_DONE_EINT1				0x0080
 #define MADERA_BOOT_DONE_EINT1_MASK			0x0080
 #define MADERA_BOOT_DONE_EINT1_SHIFT			     7
-#define MADERA_BOOT_DONE_EINT1_WIDTH			     1
 
 /* (0x1801)  IRQ1_Status_2 */
 #define MADERA_FLLAO_LOCK_EINT1				0x0800
 #define MADERA_FLLAO_LOCK_EINT1_MASK			0x0800
 #define MADERA_FLLAO_LOCK_EINT1_SHIFT			    11
-#define MADERA_FLLAO_LOCK_EINT1_WIDTH			     1
 #define MADERA_FLL3_LOCK_EINT1				0x0400
 #define MADERA_FLL3_LOCK_EINT1_MASK			0x0400
 #define MADERA_FLL3_LOCK_EINT1_SHIFT			    10
-#define MADERA_FLL3_LOCK_EINT1_WIDTH			     1
 #define MADERA_FLL2_LOCK_EINT1				0x0200
 #define MADERA_FLL2_LOCK_EINT1_MASK			0x0200
 #define MADERA_FLL2_LOCK_EINT1_SHIFT			     9
-#define MADERA_FLL2_LOCK_EINT1_WIDTH			     1
 #define MADERA_FLL1_LOCK_EINT1				0x0100
 #define MADERA_FLL1_LOCK_EINT1_MASK			0x0100
 #define MADERA_FLL1_LOCK_EINT1_SHIFT			     8
-#define MADERA_FLL1_LOCK_EINT1_WIDTH			     1
 
 /* (0x1805)  IRQ1_Status_6 */
 #define MADERA_MICDET2_EINT1				0x0200
 #define MADERA_MICDET2_EINT1_MASK			0x0200
 #define MADERA_MICDET2_EINT1_SHIFT			     9
-#define MADERA_MICDET2_EINT1_WIDTH			     1
 #define MADERA_MICDET1_EINT1				0x0100
 #define MADERA_MICDET1_EINT1_MASK			0x0100
 #define MADERA_MICDET1_EINT1_SHIFT			     8
-#define MADERA_MICDET1_EINT1_WIDTH			     1
 #define MADERA_HPDET_EINT1				0x0001
 #define MADERA_HPDET_EINT1_MASK				0x0001
 #define MADERA_HPDET_EINT1_SHIFT			     0
-#define MADERA_HPDET_EINT1_WIDTH			     1
 
 /* (0x1806)  IRQ1_Status_7 */
 #define MADERA_MICD_CLAMP_FALL_EINT1			0x0020
 #define MADERA_MICD_CLAMP_FALL_EINT1_MASK		0x0020
 #define MADERA_MICD_CLAMP_FALL_EINT1_SHIFT		     5
-#define MADERA_MICD_CLAMP_FALL_EINT1_WIDTH		     1
 #define MADERA_MICD_CLAMP_RISE_EINT1			0x0010
 #define MADERA_MICD_CLAMP_RISE_EINT1_MASK		0x0010
 #define MADERA_MICD_CLAMP_RISE_EINT1_SHIFT		     4
-#define MADERA_MICD_CLAMP_RISE_EINT1_WIDTH		     1
 #define MADERA_JD2_FALL_EINT1				0x0008
 #define MADERA_JD2_FALL_EINT1_MASK			0x0008
 #define MADERA_JD2_FALL_EINT1_SHIFT			     3
-#define MADERA_JD2_FALL_EINT1_WIDTH			     1
 #define MADERA_JD2_RISE_EINT1				0x0004
 #define MADERA_JD2_RISE_EINT1_MASK			0x0004
 #define MADERA_JD2_RISE_EINT1_SHIFT			     2
-#define MADERA_JD2_RISE_EINT1_WIDTH			     1
 #define MADERA_JD1_FALL_EINT1				0x0002
 #define MADERA_JD1_FALL_EINT1_MASK			0x0002
 #define MADERA_JD1_FALL_EINT1_SHIFT			     1
-#define MADERA_JD1_FALL_EINT1_WIDTH			     1
 #define MADERA_JD1_RISE_EINT1				0x0001
 #define MADERA_JD1_RISE_EINT1_MASK			0x0001
 #define MADERA_JD1_RISE_EINT1_SHIFT			     0
-#define MADERA_JD1_RISE_EINT1_WIDTH			     1
 
 /* (0x1808)  IRQ1_Status_9 */
 #define MADERA_ASRC2_IN2_LOCK_EINT1			0x0800
 #define MADERA_ASRC2_IN2_LOCK_EINT1_MASK		0x0800
 #define MADERA_ASRC2_IN2_LOCK_EINT1_SHIFT		    11
-#define MADERA_ASRC2_IN2_LOCK_EINT1_WIDTH		     1
 #define MADERA_ASRC2_IN1_LOCK_EINT1			0x0400
 #define MADERA_ASRC2_IN1_LOCK_EINT1_MASK		0x0400
 #define MADERA_ASRC2_IN1_LOCK_EINT1_SHIFT		    10
-#define MADERA_ASRC2_IN1_LOCK_EINT1_WIDTH		     1
 #define MADERA_ASRC1_IN2_LOCK_EINT1			0x0200
 #define MADERA_ASRC1_IN2_LOCK_EINT1_MASK		0x0200
 #define MADERA_ASRC1_IN2_LOCK_EINT1_SHIFT		     9
-#define MADERA_ASRC1_IN2_LOCK_EINT1_WIDTH		     1
 #define MADERA_ASRC1_IN1_LOCK_EINT1			0x0100
 #define MADERA_ASRC1_IN1_LOCK_EINT1_MASK		0x0100
 #define MADERA_ASRC1_IN1_LOCK_EINT1_SHIFT		     8
-#define MADERA_ASRC1_IN1_LOCK_EINT1_WIDTH		     1
 #define MADERA_DRC2_SIG_DET_EINT1			0x0002
 #define MADERA_DRC2_SIG_DET_EINT1_MASK			0x0002
 #define MADERA_DRC2_SIG_DET_EINT1_SHIFT			     1
-#define MADERA_DRC2_SIG_DET_EINT1_WIDTH			     1
 #define MADERA_DRC1_SIG_DET_EINT1			0x0001
 #define MADERA_DRC1_SIG_DET_EINT1_MASK			0x0001
 #define MADERA_DRC1_SIG_DET_EINT1_SHIFT			     0
-#define MADERA_DRC1_SIG_DET_EINT1_WIDTH			     1
 
 /* (0x180A)  IRQ1_Status_11 */
 #define MADERA_DSP_IRQ16_EINT1				0x8000
 #define MADERA_DSP_IRQ16_EINT1_MASK			0x8000
 #define MADERA_DSP_IRQ16_EINT1_SHIFT			    15
-#define MADERA_DSP_IRQ16_EINT1_WIDTH			     1
 #define MADERA_DSP_IRQ15_EINT1				0x4000
 #define MADERA_DSP_IRQ15_EINT1_MASK			0x4000
 #define MADERA_DSP_IRQ15_EINT1_SHIFT			    14
-#define MADERA_DSP_IRQ15_EINT1_WIDTH			     1
 #define MADERA_DSP_IRQ14_EINT1				0x2000
 #define MADERA_DSP_IRQ14_EINT1_MASK			0x2000
 #define MADERA_DSP_IRQ14_EINT1_SHIFT			    13
-#define MADERA_DSP_IRQ14_EINT1_WIDTH			     1
 #define MADERA_DSP_IRQ13_EINT1				0x1000
 #define MADERA_DSP_IRQ13_EINT1_MASK			0x1000
 #define MADERA_DSP_IRQ13_EINT1_SHIFT			    12
-#define MADERA_DSP_IRQ13_EINT1_WIDTH			     1
 #define MADERA_DSP_IRQ12_EINT1				0x0800
 #define MADERA_DSP_IRQ12_EINT1_MASK			0x0800
 #define MADERA_DSP_IRQ12_EINT1_SHIFT			    11
-#define MADERA_DSP_IRQ12_EINT1_WIDTH			     1
 #define MADERA_DSP_IRQ11_EINT1				0x0400
 #define MADERA_DSP_IRQ11_EINT1_MASK			0x0400
 #define MADERA_DSP_IRQ11_EINT1_SHIFT			    10
-#define MADERA_DSP_IRQ11_EINT1_WIDTH			     1
 #define MADERA_DSP_IRQ10_EINT1				0x0200
 #define MADERA_DSP_IRQ10_EINT1_MASK			0x0200
 #define MADERA_DSP_IRQ10_EINT1_SHIFT			     9
-#define MADERA_DSP_IRQ10_EINT1_WIDTH			     1
 #define MADERA_DSP_IRQ9_EINT1				0x0100
 #define MADERA_DSP_IRQ9_EINT1_MASK			0x0100
 #define MADERA_DSP_IRQ9_EINT1_SHIFT			     8
-#define MADERA_DSP_IRQ9_EINT1_WIDTH			     1
 #define MADERA_DSP_IRQ8_EINT1				0x0080
 #define MADERA_DSP_IRQ8_EINT1_MASK			0x0080
 #define MADERA_DSP_IRQ8_EINT1_SHIFT			     7
-#define MADERA_DSP_IRQ8_EINT1_WIDTH			     1
 #define MADERA_DSP_IRQ7_EINT1				0x0040
 #define MADERA_DSP_IRQ7_EINT1_MASK			0x0040
 #define MADERA_DSP_IRQ7_EINT1_SHIFT			     6
-#define MADERA_DSP_IRQ7_EINT1_WIDTH			     1
 #define MADERA_DSP_IRQ6_EINT1				0x0020
 #define MADERA_DSP_IRQ6_EINT1_MASK			0x0020
 #define MADERA_DSP_IRQ6_EINT1_SHIFT			     5
-#define MADERA_DSP_IRQ6_EINT1_WIDTH			     1
 #define MADERA_DSP_IRQ5_EINT1				0x0010
 #define MADERA_DSP_IRQ5_EINT1_MASK			0x0010
 #define MADERA_DSP_IRQ5_EINT1_SHIFT			     4
-#define MADERA_DSP_IRQ5_EINT1_WIDTH			     1
 #define MADERA_DSP_IRQ4_EINT1				0x0008
 #define MADERA_DSP_IRQ4_EINT1_MASK			0x0008
 #define MADERA_DSP_IRQ4_EINT1_SHIFT			     3
-#define MADERA_DSP_IRQ4_EINT1_WIDTH			     1
 #define MADERA_DSP_IRQ3_EINT1				0x0004
 #define MADERA_DSP_IRQ3_EINT1_MASK			0x0004
 #define MADERA_DSP_IRQ3_EINT1_SHIFT			     2
-#define MADERA_DSP_IRQ3_EINT1_WIDTH			     1
 #define MADERA_DSP_IRQ2_EINT1				0x0002
 #define MADERA_DSP_IRQ2_EINT1_MASK			0x0002
 #define MADERA_DSP_IRQ2_EINT1_SHIFT			     1
-#define MADERA_DSP_IRQ2_EINT1_WIDTH			     1
 #define MADERA_DSP_IRQ1_EINT1				0x0001
 #define MADERA_DSP_IRQ1_EINT1_MASK			0x0001
 #define MADERA_DSP_IRQ1_EINT1_SHIFT			     0
-#define MADERA_DSP_IRQ1_EINT1_WIDTH			     1
 
 /* (0x180B)  IRQ1_Status_12 */
 #define MADERA_SPKOUTR_SC_EINT1				0x0080
 #define MADERA_SPKOUTR_SC_EINT1_MASK			0x0080
 #define MADERA_SPKOUTR_SC_EINT1_SHIFT			     7
-#define MADERA_SPKOUTR_SC_EINT1_WIDTH			     1
 #define MADERA_SPKOUTL_SC_EINT1				0x0040
 #define MADERA_SPKOUTL_SC_EINT1_MASK			0x0040
 #define MADERA_SPKOUTL_SC_EINT1_SHIFT			     6
-#define MADERA_SPKOUTL_SC_EINT1_WIDTH			     1
 #define MADERA_HP3R_SC_EINT1				0x0020
 #define MADERA_HP3R_SC_EINT1_MASK			0x0020
 #define MADERA_HP3R_SC_EINT1_SHIFT			     5
-#define MADERA_HP3R_SC_EINT1_WIDTH			     1
 #define MADERA_HP3L_SC_EINT1				0x0010
 #define MADERA_HP3L_SC_EINT1_MASK			0x0010
 #define MADERA_HP3L_SC_EINT1_SHIFT			     4
-#define MADERA_HP3L_SC_EINT1_WIDTH			     1
 #define MADERA_HP2R_SC_EINT1				0x0008
 #define MADERA_HP2R_SC_EINT1_MASK			0x0008
 #define MADERA_HP2R_SC_EINT1_SHIFT			     3
-#define MADERA_HP2R_SC_EINT1_WIDTH			     1
 #define MADERA_HP2L_SC_EINT1				0x0004
 #define MADERA_HP2L_SC_EINT1_MASK			0x0004
 #define MADERA_HP2L_SC_EINT1_SHIFT			     2
-#define MADERA_HP2L_SC_EINT1_WIDTH			     1
 #define MADERA_HP1R_SC_EINT1				0x0002
 #define MADERA_HP1R_SC_EINT1_MASK			0x0002
 #define MADERA_HP1R_SC_EINT1_SHIFT			     1
-#define MADERA_HP1R_SC_EINT1_WIDTH			     1
 #define MADERA_HP1L_SC_EINT1				0x0001
 #define MADERA_HP1L_SC_EINT1_MASK			0x0001
 #define MADERA_HP1L_SC_EINT1_SHIFT			     0
-#define MADERA_HP1L_SC_EINT1_WIDTH			     1
 
 /* (0x180E)  IRQ1_Status_15 */
 #define MADERA_SPK_OVERHEAT_WARN_EINT1			0x0004
 #define MADERA_SPK_OVERHEAT_WARN_EINT1_MASK		0x0004
 #define MADERA_SPK_OVERHEAT_WARN_EINT1_SHIFT		     2
-#define MADERA_SPK_OVERHEAT_WARN_EINT1_WIDTH		     1
 #define MADERA_SPK_OVERHEAT_EINT1			0x0002
 #define MADERA_SPK_OVERHEAT_EINT1_MASK			0x0002
 #define MADERA_SPK_OVERHEAT_EINT1_SHIFT			     1
-#define MADERA_SPK_OVERHEAT_EINT1_WIDTH			     1
 #define MADERA_SPK_SHUTDOWN_EINT1			0x0001
 #define MADERA_SPK_SHUTDOWN_EINT1_MASK			0x0001
 #define MADERA_SPK_SHUTDOWN_EINT1_SHIFT			     0
-#define MADERA_SPK_SHUTDOWN_EINT1_WIDTH			     1
 
 /* (0x1820) - IRQ1 Status 33 */
 #define MADERA_DSP7_BUS_ERR_EINT1			0x0040
 #define MADERA_DSP7_BUS_ERR_EINT1_MASK			0x0040
 #define MADERA_DSP7_BUS_ERR_EINT1_SHIFT			     6
-#define MADERA_DSP7_BUS_ERR_EINT1_WIDTH			     1
 #define MADERA_DSP6_BUS_ERR_EINT1			0x0020
 #define MADERA_DSP6_BUS_ERR_EINT1_MASK			0x0020
 #define MADERA_DSP6_BUS_ERR_EINT1_SHIFT			     5
-#define MADERA_DSP6_BUS_ERR_EINT1_WIDTH			     1
 #define MADERA_DSP5_BUS_ERR_EINT1			0x0010
 #define MADERA_DSP5_BUS_ERR_EINT1_MASK			0x0010
 #define MADERA_DSP5_BUS_ERR_EINT1_SHIFT			     4
-#define MADERA_DSP5_BUS_ERR_EINT1_WIDTH			     1
 #define MADERA_DSP4_BUS_ERR_EINT1			0x0008
 #define MADERA_DSP4_BUS_ERR_EINT1_MASK			0x0008
 #define MADERA_DSP4_BUS_ERR_EINT1_SHIFT			     3
-#define MADERA_DSP4_BUS_ERR_EINT1_WIDTH			     1
 #define MADERA_DSP3_BUS_ERR_EINT1			0x0004
 #define MADERA_DSP3_BUS_ERR_EINT1_MASK			0x0004
 #define MADERA_DSP3_BUS_ERR_EINT1_SHIFT			     2
-#define MADERA_DSP3_BUS_ERR_EINT1_WIDTH			     1
 #define MADERA_DSP2_BUS_ERR_EINT1			0x0002
 #define MADERA_DSP2_BUS_ERR_EINT1_MASK			0x0002
 #define MADERA_DSP2_BUS_ERR_EINT1_SHIFT			     1
-#define MADERA_DSP2_BUS_ERR_EINT1_WIDTH			     1
 #define MADERA_DSP1_BUS_ERR_EINT1			0x0001
 #define MADERA_DSP1_BUS_ERR_EINT1_MASK			0x0001
 #define MADERA_DSP1_BUS_ERR_EINT1_SHIFT			     0
-#define MADERA_DSP1_BUS_ERR_EINT1_WIDTH			     1
 
 /* (0x1845)  IRQ1_Mask_6 */
 #define MADERA_IM_MICDET2_EINT1				0x0200
 #define MADERA_IM_MICDET2_EINT1_MASK			0x0200
 #define MADERA_IM_MICDET2_EINT1_SHIFT			     9
-#define MADERA_IM_MICDET2_EINT1_WIDTH			     1
 #define MADERA_IM_MICDET1_EINT1				0x0100
 #define MADERA_IM_MICDET1_EINT1_MASK			0x0100
 #define MADERA_IM_MICDET1_EINT1_SHIFT			     8
-#define MADERA_IM_MICDET1_EINT1_WIDTH			     1
 #define MADERA_IM_HPDET_EINT1				0x0001
 #define MADERA_IM_HPDET_EINT1_MASK			0x0001
 #define MADERA_IM_HPDET_EINT1_SHIFT			     0
-#define MADERA_IM_HPDET_EINT1_WIDTH			     1
 /* (0x184E)  IRQ1_Mask_15 */
 #define MADERA_IM_SPK_OVERHEAT_WARN_EINT1		0x0004
 #define MADERA_IM_SPK_OVERHEAT_WARN_EINT1_MASK		0x0004
 #define MADERA_IM_SPK_OVERHEAT_WARN_EINT1_SHIFT		     2
-#define MADERA_IM_SPK_OVERHEAT_WARN_EINT1_WIDTH		     1
 #define MADERA_IM_SPK_OVERHEAT_EINT1			0x0002
 #define MADERA_IM_SPK_OVERHEAT_EINT1_MASK		0x0002
 #define MADERA_IM_SPK_OVERHEAT_EINT1_SHIFT		     1
-#define MADERA_IM_SPK_OVERHEAT_EINT1_WIDTH		     1
 #define MADERA_IM_SPK_SHUTDOWN_EINT1			0x0001
 #define MADERA_IM_SPK_SHUTDOWN_EINT1_MASK		0x0001
 #define MADERA_IM_SPK_SHUTDOWN_EINT1_SHIFT		     0
-#define MADERA_IM_SPK_SHUTDOWN_EINT1_WIDTH		     1
 
 /* (0x1880) - IRQ1 Raw Status 1 */
 #define MADERA_CTRLIF_ERR_STS1				0x1000
 #define MADERA_CTRLIF_ERR_STS1_MASK			0x1000
 #define MADERA_CTRLIF_ERR_STS1_SHIFT			    12
-#define MADERA_CTRLIF_ERR_STS1_WIDTH			     1
 #define MADERA_SYSCLK_FAIL_STS1				0x0200
 #define MADERA_SYSCLK_FAIL_STS1_MASK			0x0200
 #define MADERA_SYSCLK_FAIL_STS1_SHIFT			     9
-#define MADERA_SYSCLK_FAIL_STS1_WIDTH			     1
 #define MADERA_CLOCK_DETECT_STS1			0x0100
 #define MADERA_CLOCK_DETECT_STS1_MASK			0x0100
 #define MADERA_CLOCK_DETECT_STS1_SHIFT			     8
-#define MADERA_CLOCK_DETECT_STS1_WIDTH			     1
 #define MADERA_BOOT_DONE_STS1				0x0080
 #define MADERA_BOOT_DONE_STS1_MASK			0x0080
 #define MADERA_BOOT_DONE_STS1_SHIFT			     7
-#define MADERA_BOOT_DONE_STS1_WIDTH			     1
 
 /* (0x1881) - IRQ1 Raw Status 2 */
 #define MADERA_FLL3_LOCK_STS1				0x0400
 #define MADERA_FLL3_LOCK_STS1_MASK			0x0400
 #define MADERA_FLL3_LOCK_STS1_SHIFT			    10
-#define MADERA_FLL3_LOCK_STS1_WIDTH			     1
 #define MADERA_FLL2_LOCK_STS1				0x0200
 #define MADERA_FLL2_LOCK_STS1_MASK			0x0200
 #define MADERA_FLL2_LOCK_STS1_SHIFT			     9
-#define MADERA_FLL2_LOCK_STS1_WIDTH			     1
 #define MADERA_FLL1_LOCK_STS1				0x0100
 #define MADERA_FLL1_LOCK_STS1_MASK			0x0100
 #define MADERA_FLL1_LOCK_STS1_SHIFT			     8
-#define MADERA_FLL1_LOCK_STS1_WIDTH			     1
 
 /* (0x1886) - IRQ1 Raw Status 7 */
 #define MADERA_MICD_CLAMP_FALL_STS1			0x0020
 #define MADERA_MICD_CLAMP_FALL_STS1_MASK		0x0020
 #define MADERA_MICD_CLAMP_FALL_STS1_SHIFT		     5
-#define MADERA_MICD_CLAMP_FALL_STS1_WIDTH		     1
 #define MADERA_MICD_CLAMP_RISE_STS1			0x0010
 #define MADERA_MICD_CLAMP_RISE_STS1_MASK		0x0010
 #define MADERA_MICD_CLAMP_RISE_STS1_SHIFT		     4
-#define MADERA_MICD_CLAMP_RISE_STS1_WIDTH		     1
 #define MADERA_JD2_FALL_STS1				0x0008
 #define MADERA_JD2_FALL_STS1_MASK			0x0008
 #define MADERA_JD2_FALL_STS1_SHIFT			     3
-#define MADERA_JD2_FALL_STS1_WIDTH			     1
 #define MADERA_JD2_RISE_STS1				0x0004
 #define MADERA_JD2_RISE_STS1_MASK			0x0004
 #define MADERA_JD2_RISE_STS1_SHIFT			     2
-#define MADERA_JD2_RISE_STS1_WIDTH			     1
 #define MADERA_JD1_FALL_STS1				0x0002
 #define MADERA_JD1_FALL_STS1_MASK			0x0002
 #define MADERA_JD1_FALL_STS1_SHIFT			     1
-#define MADERA_JD1_FALL_STS1_WIDTH			     1
 #define MADERA_JD1_RISE_STS1				0x0001
 #define MADERA_JD1_RISE_STS1_MASK			0x0001
 #define MADERA_JD1_RISE_STS1_SHIFT			     0
-#define MADERA_JD1_RISE_STS1_WIDTH			     1
 
 /* (0x188E) - IRQ1 Raw Status 15 */
 #define MADERA_SPK_OVERHEAT_WARN_STS1			0x0004
 #define MADERA_SPK_OVERHEAT_WARN_STS1_MASK		0x0004
 #define MADERA_SPK_OVERHEAT_WARN_STS1_SHIFT		     2
-#define MADERA_SPK_OVERHEAT_WARN_STS1_WIDTH		     1
 #define MADERA_SPK_OVERHEAT_STS1			0x0002
 #define MADERA_SPK_OVERHEAT_STS1_MASK			0x0002
 #define MADERA_SPK_OVERHEAT_STS1_SHIFT			     1
-#define MADERA_SPK_OVERHEAT_STS1_WIDTH			     1
 #define MADERA_SPK_SHUTDOWN_STS1			0x0001
 #define MADERA_SPK_SHUTDOWN_STS1_MASK			0x0001
 #define MADERA_SPK_SHUTDOWN_STS1_SHIFT			     0
-#define MADERA_SPK_SHUTDOWN_STS1_WIDTH			     1
 
 /* (0x1A06)  Interrupt_Debounce_7 */
 #define MADERA_MICD_CLAMP_DB				0x0010
 #define MADERA_MICD_CLAMP_DB_MASK			0x0010
 #define MADERA_MICD_CLAMP_DB_SHIFT			     4
-#define MADERA_MICD_CLAMP_DB_WIDTH			     1
 #define MADERA_JD2_DB					0x0004
 #define MADERA_JD2_DB_MASK				0x0004
 #define MADERA_JD2_DB_SHIFT				     2
-#define MADERA_JD2_DB_WIDTH				     1
 #define MADERA_JD1_DB					0x0001
 #define MADERA_JD1_DB_MASK				0x0001
 #define MADERA_JD1_DB_SHIFT				     0
-#define MADERA_JD1_DB_WIDTH				     1
 
 /* (0x1A0E)  Interrupt_Debounce_15 */
 #define MADERA_SPK_OVERHEAT_WARN_DB			0x0004
 #define MADERA_SPK_OVERHEAT_WARN_DB_MASK		0x0004
 #define MADERA_SPK_OVERHEAT_WARN_DB_SHIFT		     2
-#define MADERA_SPK_OVERHEAT_WARN_DB_WIDTH		     1
 #define MADERA_SPK_OVERHEAT_DB				0x0002
 #define MADERA_SPK_OVERHEAT_DB_MASK			0x0002
 #define MADERA_SPK_OVERHEAT_DB_SHIFT			     1
-#define MADERA_SPK_OVERHEAT_DB_WIDTH			     1
 
 /* (0x1A80)  IRQ1_CTRL */
 #define MADERA_IM_IRQ1					0x0800
 #define MADERA_IM_IRQ1_MASK				0x0800
 #define MADERA_IM_IRQ1_SHIFT				    11
-#define MADERA_IM_IRQ1_WIDTH				     1
 #define MADERA_IRQ_POL					0x0400
 #define MADERA_IRQ_POL_MASK				0x0400
 #define MADERA_IRQ_POL_SHIFT				    10
-#define MADERA_IRQ_POL_WIDTH				     1
 
 /* (0x20004)  OTP_HPDET_Cal_1 */
 #define MADERA_OTP_HPDET_CALIB_OFFSET_11	    0xFF000000
 #define MADERA_OTP_HPDET_CALIB_OFFSET_11_MASK	    0xFF000000
 #define MADERA_OTP_HPDET_CALIB_OFFSET_11_SHIFT		    24
-#define MADERA_OTP_HPDET_CALIB_OFFSET_11_WIDTH		     8
 #define MADERA_OTP_HPDET_CALIB_OFFSET_10	    0x00FF0000
 #define MADERA_OTP_HPDET_CALIB_OFFSET_10_MASK	    0x00FF0000
 #define MADERA_OTP_HPDET_CALIB_OFFSET_10_SHIFT		    16
-#define MADERA_OTP_HPDET_CALIB_OFFSET_10_WIDTH		     8
 #define MADERA_OTP_HPDET_CALIB_OFFSET_01	    0x0000FF00
 #define MADERA_OTP_HPDET_CALIB_OFFSET_01_MASK	    0x0000FF00
 #define MADERA_OTP_HPDET_CALIB_OFFSET_01_SHIFT		     8
-#define MADERA_OTP_HPDET_CALIB_OFFSET_01_WIDTH		     8
 #define MADERA_OTP_HPDET_CALIB_OFFSET_00	    0x000000FF
 #define MADERA_OTP_HPDET_CALIB_OFFSET_00_MASK	    0x000000FF
 #define MADERA_OTP_HPDET_CALIB_OFFSET_00_SHIFT		     0
-#define MADERA_OTP_HPDET_CALIB_OFFSET_00_WIDTH		     8
 
 /* (0x20006)  OTP_HPDET_Cal_2 */
 #define MADERA_OTP_HPDET_GRADIENT_1X		    0x0000FF00
 #define MADERA_OTP_HPDET_GRADIENT_1X_MASK	    0x0000FF00
 #define MADERA_OTP_HPDET_GRADIENT_1X_SHIFT		     8
-#define MADERA_OTP_HPDET_GRADIENT_1X_WIDTH		     8
 #define MADERA_OTP_HPDET_GRADIENT_0X		    0x000000FF
 #define MADERA_OTP_HPDET_GRADIENT_0X_MASK	    0x000000FF
 #define MADERA_OTP_HPDET_GRADIENT_0X_SHIFT		     0
-#define MADERA_OTP_HPDET_GRADIENT_0X_WIDTH		     8
 
 #endif
-- 
2.20.1

