Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B37223C61E
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 08:40:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D2921616;
	Wed,  5 Aug 2020 08:40:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D2921616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596609654;
	bh=9G+Z/fyKZZG3eBs6qRbuECOoI4F6Kqt6Aub9ccy+OqA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QEWEXGTchgkSuowYaBaAFE2gXKhhxthqYiXS5v0/w9IhsZfDsdCnKGOqSaTcd9z6f
	 jalz2+S8hqyzEUaI//A0DFYU87QgIE1ss5Fki0VhmN1q0F7TdzlzBcP8n/sx6NzOti
	 4DEsPXCfZnjVTngvK27aLIO5atq/BziJCMLHii5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BE71F802C2;
	Wed,  5 Aug 2020 08:38:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 525EDF802C2; Wed,  5 Aug 2020 08:38:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MSGID_FROM_MTA_HEADER, RCVD_IN_MSPIKE_H2, SPF_HELO_PASS,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70081.outbound.protection.outlook.com [40.107.7.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C575F801F7
 for <alsa-devel@alsa-project.org>; Wed,  5 Aug 2020 08:38:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C575F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="VHzX4vIN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ReBOrj0kVNmCO0ImIrZiKtfm0p2MUUfa61bNsZ3RM3BbBFZU7ByHTSd7YSZO3yeKMdkA/hzZE/EIcHJVFUD/Vp9HCTrizc2ufLEIcakM3ao+Rh9Vq7EQ2VlyQm60mX72Wuzcd7HAD3Yr3sMPWxOnZ9oLAWLrH4/SB7m9YFN5JlesPdzaODW0LTzdzjvmZYDqBHJBT3GEr18aehSLgbjcba/hNf3nc2y76sW4XI8H4S66HQl+Ozvnckajktq1vRAFqzpjgvisuuZi4RvmkNgKV/eMEVvFmHU36NtsxwsmCtA5aLnj75y/OMm9pvQr2TF75eUtA71dcxpAehkkqkftYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41a3LhpzwaysSVfuj7i+bfsGWsb/UqmfvP5vI5gncLs=;
 b=COfbG7FF6o2mGUd5lgULXR0Hcg2rfYK5ES5B+E6SpT0cwf26W8eK0fCejPajJ73EkEBnIO9VZQPniyscJ0QnGETVocDH1G4WSrVGlyujQU8B0Zhyg+/OpTeT99Zwhml98MUqI3eBb2/uMeC5TlTibXamUXAWFxxHkacKMaExe28OfFZh7ldNQAr3R3DyPfq2JePKkcCPwIqkZmFPyr4ESLRelRa+QEb1YYmcbVIUBP0M1OUgMy+qzURey7sp4YEO+LQpOXG98oTgC8aPZIZ1woHjxvnNyTAdCX0FheYvfqV6+Cj7S7zOfIlSe5IfF3k/LXyCXSkB1LyLvKvr5LRbvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41a3LhpzwaysSVfuj7i+bfsGWsb/UqmfvP5vI5gncLs=;
 b=VHzX4vIN7k3dynjiKpdrUSerB951wKsojRpBDRVxo6oZ/0N3HP9dWgb+oSGLk7EmzU9SgkI/0eJAc7lStxhEdPqmwUwZKYpqfBdPwUWpb+ip6IbgrUkGiA64WspkDHxJURlpbBjytNmC/UcIBVQU7RU8mcZJ9dDNLNqByW/n+eg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0402MB3342.eurprd04.prod.outlook.com
 (2603:10a6:803:11::14) by VI1PR04MB3055.eurprd04.prod.outlook.com
 (2603:10a6:802:9::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Wed, 5 Aug
 2020 06:37:59 +0000
Received: from VI1PR0402MB3342.eurprd04.prod.outlook.com
 ([fe80::c1a:39dd:a2d5:3d2f]) by VI1PR0402MB3342.eurprd04.prod.outlook.com
 ([fe80::c1a:39dd:a2d5:3d2f%7]) with mapi id 15.20.3261.016; Wed, 5 Aug 2020
 06:37:59 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] ASoC: fsl_sai: Drop TMR/RMR settings for synchronous
 mode
Date: Wed,  5 Aug 2020 14:34:12 +0800
Message-Id: <20200805063413.4610-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200805063413.4610-1-shengjiu.wang@nxp.com>
References: <20200805063413.4610-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0109.apcprd03.prod.outlook.com
 (2603:1096:4:91::13) To VI1PR0402MB3342.eurprd04.prod.outlook.com
 (2603:10a6:803:11::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from audiosh1.ap.freescale.net (119.31.174.67) by
 SG2PR03CA0109.apcprd03.prod.outlook.com (2603:1096:4:91::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3261.12 via Frontend Transport; Wed, 5 Aug 2020 06:37:55 +0000
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d0de288d-a301-42eb-4308-08d8390a1844
X-MS-TrafficTypeDiagnostic: VI1PR04MB3055:
X-Microsoft-Antispam-PRVS: <VI1PR04MB305523FC3CFA5D1CEA82602DE34B0@VI1PR04MB3055.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v9QfRfeOtyzzTk6aavARIyz0NHBSXtR/WVrsRmusDvJfH9KY3JaVz8mEYvVNznMjaAL+yNXtH5O0ArsPwSHdW7NFMmqgM61q+HDR4h6gUXRO2j2k/wVg2mwtaDwTn4lqvhz5PjTTZhEqzQhYKCBdot0hESvAfHF4e2CP1gwDD/2Tl02bhQovMoOSuEfJr0tOJk4HDv7/REW0rovIAKnzpiy7C+kAIzDR1dIOOj7D5UKw48GrbSebepwrTiNQBdTSvoiG3lD+qEGeSrBWJqJkVtpga4023YT57nPFd/5K4U4vIoEm3b/XZXnw/Yd7jtZkrZekBHrR7CpeFIHBiwDqZ79pTBtC+f1CohFhmrWYI1FFETvC85zfDXVpDmD4HUQn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3342.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(36756003)(2906002)(44832011)(26005)(86362001)(6506007)(16526019)(186003)(956004)(2616005)(1076003)(5660300002)(6666004)(7416002)(6486002)(6512007)(316002)(8936002)(8676002)(52116002)(478600001)(66946007)(83380400001)(66556008)(66476007)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: gyRFBKEND3ryjZDJOysjAzEopbastUAKLvJFi28bvcTYIADrflDulhvG7PO0yu2IrzxYxlj6JBj87G9jjnHjC1WpB/ETt3dxnfP05h6ny5hNDiAqC26bJTV6NZv49Q5wdabWbE7hLFrAV2du9KBJ0l1DqO0kpMWO8p6wHgovaFrFluqV7Gu1vANpVfyR0lGShc3pe8cZgTKTe0yDpnA9K9gh4Lt4NMv+pmA+evEJyOSu/+ACbM3tPbc0VJUVB9FM8o1kTvZ20XZYP3rlZKPsqPpqCz7l7g9VK8fv66kDWnmJWXCVxLFaYg/vM5+K5fA/nNeHe6UXOLJTHvcmOAzajg/2h3a11P/rnatyMMihuLTTfxvzVhKLaoV0ZrCgVwvoc45TV+D0/hNdCdDnmY3/3wvH6h5J+iMXp54SysRFw5SvrxjkpkaKKRFlYhZItQ4XsX6oNO1b2iu0PSsGuj2Ead07i7E+7Egju6otv7dz3G+CLfkm75xSC61jYNW77me7/R1XjaNGNfBdO7rqg7JZcf83w0OUPVeK0QDb747VZwzWIM9PbbxoFqp0a5287+jBXvx1NOq8yr4EBhfZIhDUece5i/K6U5msD6gbqLsYv02bodZn87tybFlTg0ClNoorZo6jHwQuCBUNoxAMttlE9g==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0de288d-a301-42eb-4308-08d8390a1844
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3342.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2020 06:37:59.5036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3IYOc8M273DMHOvpqFq3aEx4iUtJTRSvH6LwtFrQzi2cph7TB0VQdBo7KxQIQSzZkWyzGKGhi1dEhUehvtAUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3055
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

Tx synchronous with Rx: The RMR is the word mask register, it is used
to mask any word in the frame, it is not relating to clock generation,
So it is no need to be changed when Tx is going to be enabled.

Rx synchronous with Tx: The TMR is the word mask register, it is used
to mask any word in the frame, it is not relating to clock generation,
So it is no need to be changed when Rx is going to be enabled.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 566c4747362a..334090d581ae 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -488,8 +488,7 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 	/*
 	 * For SAI master mode, when Tx(Rx) sync with Rx(Tx) clock, Rx(Tx) will
 	 * generate bclk and frame clock for Tx(Rx), we should set RCR4(TCR4),
-	 * RCR5(TCR5) and RMR(TMR) for playback(capture), or there will be sync
-	 * error.
+	 * RCR5(TCR5) for playback(capture), or there will be sync error.
 	 */
 
 	if (!sai->is_slave_mode) {
@@ -500,8 +499,6 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 			regmap_update_bits(sai->regmap, FSL_SAI_TCR5(ofs),
 				FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
 				FSL_SAI_CR5_FBT_MASK, val_cr5);
-			regmap_write(sai->regmap, FSL_SAI_TMR,
-				~0UL - ((1 << channels) - 1));
 		} else if (!sai->synchronous[RX] && sai->synchronous[TX] && tx) {
 			regmap_update_bits(sai->regmap, FSL_SAI_RCR4(ofs),
 				FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK,
@@ -509,8 +506,6 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 			regmap_update_bits(sai->regmap, FSL_SAI_RCR5(ofs),
 				FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
 				FSL_SAI_CR5_FBT_MASK, val_cr5);
-			regmap_write(sai->regmap, FSL_SAI_RMR,
-				~0UL - ((1 << channels) - 1));
 		}
 	}
 
-- 
2.27.0

