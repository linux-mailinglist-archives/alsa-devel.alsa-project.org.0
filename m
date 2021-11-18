Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B80AC455539
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 08:09:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 589131783;
	Thu, 18 Nov 2021 08:09:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 589131783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637219390;
	bh=5QiYGEBbv+XAWRg0PB7PRrxQUR7sXEaZIrIzt7SetGo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z7bRXLqKVTrIiXpvK9PMv8Kfem/iYU4cahej9QpgGNksb4fsMprNJltFUeGRxiFnf
	 JZTBWsfwG3GA/UXWcK0wpNpZTsHTuU5PMs+B8rcqlfjtTK4lO35qmoShdHSyFAwA4X
	 oc0fwivfPIY2YYp3a2qkOw7Z2rcHX4ZCPHVH2iDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B371F804FF;
	Thu, 18 Nov 2021 08:07:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16495F804FD; Thu, 18 Nov 2021 08:07:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4377EF8026D
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 08:07:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4377EF8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="YV6547rc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNfpBq2t2HdNTu0QzPJlBR0Y51RhlvlmwCjta+Z3y4jc8H/s0BlaS/dxdWXeEec1oxwkOgbCQaRkk6yyRUbGeeZd8csaIHbXfTB3VSBYuIwrWJ4WKHGRjl2OGHaVGSxqSWI2ibj/nmkdIO0rL6/2bb4OP41k2Nqs/UHViy1qYqYP4dWiVk1EvSsUKIhwykIUZX2vcPRV6LWsbtZElJGulZRVi3wZkFVL1bdNeEW/0kCWoSnf7CfAI0/5yIFfL0hhyoK1HON5gBz66IrC4j98Jy7ql3CmcLhf8zuR4/B2+w6pkwFmDO7Ax4Yr38kZh2hHQgpSccExruXqaIDzfRRAtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozyVOo3RFAaSkcukvhO9Dx9HeICtugnJq7spXeStDuU=;
 b=KmknvWWCskaSWJ/TpnDMLGFRlgfMyL0FJywxde8gsDHhLD1fmjGkUqE6UdqwZZ1TtTieKHTLGBoEzWQAMUOF7/RyXWuALa5pwFddUYGpmdOSdPfdgPL4420GvHrgpLG8HQ+lmIG/80h9laAJazmUax84HpPQiNiLyzGiJuM3jLNbfQwSyBFhqQnzPrUe/7voIlzWOv97xTr2dQ9Rfm1xcCpC1uFcQliVt7kwJMqn/sObb+FYJsNvq1ArUAk/zPiw4xtgJ7rKRAQKLkOPA0kc4oe9mWnFCAA0KmmXtCLFVPY0JsX9tjayI91wXm1T1tzmY/bjv0k77lHZ7akg6nNeNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozyVOo3RFAaSkcukvhO9Dx9HeICtugnJq7spXeStDuU=;
 b=YV6547rcTI1lS8Uti+Z6cZK/tArY4RruAlNs89RCK3cPUw+X8MqCVk8V2uaJymmyec+WBE0AQNba9y/klolf08OD5XzUThMhd0gj0khOUU2VwvupS8uJZQi3uWjPwN4zKEOCb05WxtMEy4ssMemT5ejAKA4w69OUbrilKwpJsKAC5tLYMP7pgQ8eyplabRa7FKXaFKXwq4v87Me3R2aXIpVsm24N7saH8WXbG/bKCRGT1P1O6ktJzhqhkYZo/tHMZznxd0BWn/4X21rxEbMxUJPyws2sdrv22vVAqPv2W8Dq55b1cCIx7orCfGJxVrLUgMCL20CkgS4p3Esi9EgYag==
Received: from BN9PR03CA0810.namprd03.prod.outlook.com (2603:10b6:408:13f::35)
 by BN6PR12MB1716.namprd12.prod.outlook.com (2603:10b6:404:104::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 18 Nov
 2021 07:07:41 +0000
Received: from BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::9d) by BN9PR03CA0810.outlook.office365.com
 (2603:10b6:408:13f::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT005.mail.protection.outlook.com (10.13.176.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 07:07:40 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 18 Nov
 2021 07:07:36 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:33 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v3 04/16] ASoC: tegra: Fix wrong value type in DSPK
Date: Thu, 18 Nov 2021 12:36:59 +0530
Message-ID: <1637219231-406-5-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637219231-406-1-git-send-email-spujar@nvidia.com>
References: <1637219231-406-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad279f0e-a07d-4a25-1fd6-08d9aa621c01
X-MS-TrafficTypeDiagnostic: BN6PR12MB1716:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1716EDBFFEF452847CD9B639A79B9@BN6PR12MB1716.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x7fHJv1HEFF0DxGrIYUSzkIw3S7+5GK9RYX6B8ku3HANhq9lDeHh3UJkshP5rprN3j12tybiiLjDD3CKCnFIQ8D3ETnD1Yoft1qKh8v8ZqTdYzCPk4+/eKoux5+BH8Xft54njrhvTg6AQMKWwsMOhpkc9HFYJTuaBwKZZSmnUFQgsI78R2oNo1IrLfqMvqNCvu1eGjiuaL/s8M7Vdwdg7H4OXTNr1KCABkkSwLIqt6UDEjF2WIdsDCP72fq8YT2IkcRWl+v4hALGCPzeJeHu1HfLvs3RRfWdzW58wozWmFQ0ozG03Aa3Mg8oK9OcY6csW7tA70e0w1idWAjgZbRASI2ynZUZ/YYGg5AlVO/SX2EyEUla4fKvY8CquLMe8JRQtaR+1Ul7cMwOkLH9uQ+K98uTfgvBUu9SB1Zm1trCgKd33sqFddmhzWHTmWhs3eZXBVGNNMJjcvROmS+IECTwa01bcn+Rx/qgP6HuJtO6F3TxVU4epIA7yaoAI/Tt3IVaReNt1yuoF8MYtp/ace+4h9JLLWI5cZK3yjAEAN5lDRcS3+bSnVW9TzBNve+CxRMBy6ZxbQnzn5dtvxO1g8qhet1ZCXSPO3fk/fulRI8sdRsLDF05pDLJoVCXQgi3LeK3g42jOojtMjMj5YMZzC+/V/qqXCOwB6bzS8iJNQPY6Gd48CQ/LWqOwInbVLXAngdB9LAoRnaROuxPWxT81Mn2dg==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(86362001)(7696005)(356005)(7636003)(2906002)(316002)(47076005)(83380400001)(36906005)(36756003)(54906003)(110136005)(508600001)(4326008)(70206006)(70586007)(107886003)(336012)(426003)(82310400003)(186003)(26005)(36860700001)(8676002)(8936002)(5660300002)(6666004)(2616005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 07:07:40.1309 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad279f0e-a07d-4a25-1fd6-08d9aa621c01
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1716
Cc: alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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

The enum controls are expected to use enumerated value type.
Update relevant references in control get/put callbacks.

Fixes: 327ef6470266 ("ASoC: tegra: Add Tegra186 based DSPK driver")
Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra186_dspk.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/sound/soc/tegra/tegra186_dspk.c b/sound/soc/tegra/tegra186_dspk.c
index 8ee9a77..67269e7 100644
--- a/sound/soc/tegra/tegra186_dspk.c
+++ b/sound/soc/tegra/tegra186_dspk.c
@@ -35,15 +35,15 @@ static int tegra186_dspk_get_control(struct snd_kcontrol *kcontrol,
 	if (strstr(kcontrol->id.name, "FIFO Threshold"))
 		ucontrol->value.integer.value[0] = dspk->rx_fifo_th;
 	else if (strstr(kcontrol->id.name, "OSR Value"))
-		ucontrol->value.integer.value[0] = dspk->osr_val;
+		ucontrol->value.enumerated.item[0] = dspk->osr_val;
 	else if (strstr(kcontrol->id.name, "LR Polarity Select"))
-		ucontrol->value.integer.value[0] = dspk->lrsel;
+		ucontrol->value.enumerated.item[0] = dspk->lrsel;
 	else if (strstr(kcontrol->id.name, "Channel Select"))
-		ucontrol->value.integer.value[0] = dspk->ch_sel;
+		ucontrol->value.enumerated.item[0] = dspk->ch_sel;
 	else if (strstr(kcontrol->id.name, "Mono To Stereo"))
-		ucontrol->value.integer.value[0] = dspk->mono_to_stereo;
+		ucontrol->value.enumerated.item[0] = dspk->mono_to_stereo;
 	else if (strstr(kcontrol->id.name, "Stereo To Mono"))
-		ucontrol->value.integer.value[0] = dspk->stereo_to_mono;
+		ucontrol->value.enumerated.item[0] = dspk->stereo_to_mono;
 
 	return 0;
 }
@@ -53,20 +53,19 @@ static int tegra186_dspk_put_control(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
 	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
-	int val = ucontrol->value.integer.value[0];
 
 	if (strstr(kcontrol->id.name, "FIFO Threshold"))
-		dspk->rx_fifo_th = val;
+		dspk->rx_fifo_th = ucontrol->value.integer.value[0];
 	else if (strstr(kcontrol->id.name, "OSR Value"))
-		dspk->osr_val = val;
+		dspk->osr_val = ucontrol->value.enumerated.item[0];
 	else if (strstr(kcontrol->id.name, "LR Polarity Select"))
-		dspk->lrsel = val;
+		dspk->lrsel = ucontrol->value.enumerated.item[0];
 	else if (strstr(kcontrol->id.name, "Channel Select"))
-		dspk->ch_sel = val;
+		dspk->ch_sel = ucontrol->value.enumerated.item[0];
 	else if (strstr(kcontrol->id.name, "Mono To Stereo"))
-		dspk->mono_to_stereo = val;
+		dspk->mono_to_stereo = ucontrol->value.enumerated.item[0];
 	else if (strstr(kcontrol->id.name, "Stereo To Mono"))
-		dspk->stereo_to_mono = val;
+		dspk->stereo_to_mono = ucontrol->value.enumerated.item[0];
 
 	return 0;
 }
-- 
2.7.4

