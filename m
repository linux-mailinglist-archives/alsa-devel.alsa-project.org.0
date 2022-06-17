Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1A254FD36
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 21:08:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C8831B53;
	Fri, 17 Jun 2022 21:08:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C8831B53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655492939;
	bh=a7cnvOGRw759ICnlVgr4eaBgBysLepT+VN27r47s7E4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uvdVsdWChgktfVApzWkVla8vsZUAEBNxcTC3HHn/Nc2dvlUUawmV1ZRyXxYwLMUgb
	 Z+DaXA37dfC66mp/+nMYZtRAKQapr5+OKWhYnP8YnHCfE0iLbrvKzGTwQWjyDAuL79
	 BmbagooMOXzouFUvjkmB4zZV6D3VryBYv743GjKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A91DF800B0;
	Fri, 17 Jun 2022 21:08:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B9A3F80527; Fri, 17 Jun 2022 21:07:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::605])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76843F800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 21:07:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76843F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="qoiP46nZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtUo5yIGrNAL/pyx9F3jVal4TQg2pJYo3IiLqHiXvQrKl+jmTWAa08dMvAHJi/fotfbl+hv/3QF2ZpuHbvOPc0mp9j8V+Z/axCzDANOj8/I+uZchPSwlVliL/KS9dU0Hif7zzn7q1mKaTNz6xs3HtAXuq6vobLKrdAKL7kmN/dkD+oh9eFDJFRKQJEmSX3ZvX4H/X1cTtJ0daIUEmPZN2ILoSEg7BGfGjJP/v3heUYW9bjIPdyVB2FhOO3WcFdwfUUNNknZ7yMtkFdG+Yfkkw0sg6vaEoUCLvSLQt/LB9HDHU530Q4QAKOcc1jFEZV9CAOd3FRa30oBlpFcKwjPkLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZklmRXtqBGkAzQ8Npn/04iLc7LQMVRDpZbJTmXDye0=;
 b=KNtDK5n7tFn5e/BKea4pzU6c8ObW/Gw6U5C2NwaCqaFdlxbUFb53RUn80kbgiGO7ui4zxUgBeajJYPEf3PRDkvIaWvS5KGNf3ZJILUbiFBxXrXzkCOn3Z86zRH56710mZFXBq8tBJmQBoBfqAW6Z43KntjBp70R6xo8V3svn+7Ypto9MyJY8lMoCH5LbBrF4tKNfXFWsKVieHyPMhl/7RW3pu0K9p3NU48tAGaHAJlUqegccyT/88DiXJ+vcY/kRUS/xvNGVesS52bPHv8FQNC6jaoKNYcHBmTtWEBucD+9Ta2Oe/tOBVK/py0QMI4Uv5b0cUqGTgNLgYLCYtUcJDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZklmRXtqBGkAzQ8Npn/04iLc7LQMVRDpZbJTmXDye0=;
 b=qoiP46nZkSa8DVRaVjdp4DpVtpiQCFLvEFygvS5Wga18bkXQT8Gu2Voxzu7KXlauZlmL+reqEp94iZcSO2YCWRFcUIY9ByOADw+BGrIi871YqGJazgjU9veGyh4PLMnz0JY+9gqcza/pEOv8sMzjuTn6FhT0t+qB+9l/vWRcftzQAQk/UzNcIyjm/VnthDzAlRDkylDbF7b1uc2jjkVohaArhupPc83i8e17tFOCE+TLppz9J2GHUxODMrU0WfXMUxVhzwsPpJ5r4mII0UTdEM/NWxHFeUNCf5g9evq4E3lC8W1387LieDzT0QJsWcS3/8eXV0J5Sj5f+f5mRCvXkA==
Received: from BN8PR15CA0022.namprd15.prod.outlook.com (2603:10b6:408:c0::35)
 by DM5PR12MB1915.namprd12.prod.outlook.com (2603:10b6:3:10c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Fri, 17 Jun
 2022 19:07:49 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:c0:cafe::41) by BN8PR15CA0022.outlook.office365.com
 (2603:10b6:408:c0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.21 via Frontend
 Transport; Fri, 17 Jun 2022 19:07:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5353.14 via Frontend Transport; Fri, 17 Jun 2022 19:07:47 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 DRHQMAIL109.nvidia.com (10.27.9.19) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Fri, 17 Jun 2022 19:07:47 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 17 Jun 2022 12:07:46 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Fri, 17 Jun 2022 12:07:44 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH] ASoC: ops: Fix multiple value control type
Date: Sat, 18 Jun 2022 00:37:08 +0530
Message-ID: <1655492828-5471-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fffad9c2-d078-43f2-7741-08da5094aafb
X-MS-TrafficTypeDiagnostic: DM5PR12MB1915:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1915E3B780AC270773146FA6A7AF9@DM5PR12MB1915.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tShjVb9mIZjevzEsau1aybiBkVEhfsLII/QKbyW1TPiFL4P4CbE1yQKt7Gvv0OY/76uQPHYWauqOuWOktFNmolx3hxi3DEvzN9jIT5y2htoudYzIdKh7ccZ3DRDndvD/Lgiv3tpGnisVsQK2NPoEpnxGr+77kKNTkWuaU3hwd7sO5qGoC2/uEUzO2W6CchhhMcZF5TyJh51UbQCHv93QfLuAHTsCK6qmWqpkYHp8INJ07YOc2mYb4l74w6lWbcEeaE5Zb7h+2uu1Jh+rNZYA1Tx+dONt6ma6qWJqkji4+Al+ZGEvLgEpLM8Bt8NnxFtsTDR+yvvInbIKWv6uEGzI7Z+LUrxHVb/R93VgOngNR2vMSBzafuatFtjv6cPi2WvSHP5B5mXlkBd5ydgmHdE0rSn+SnVNeAG78gbFWlFiwHzrxF6o10hR33KxPPb4I3qZsvkK4U9IlIvbuqybGEdwxpdZIG4rN29GJruX68axihIAapcyPXbXpRqSX7yRH9kY5LmZP+Qj92xsSfZF+6FSlBecaAsGEMFyYpTMao8I/J7MNQmF16NpXKIRqdb2eK6apfO2LhqCq8nP941Na4kl/aoi/gm4uFurqd9OmywuAx1Jdd3PpJt1N0W4pnyAxf3QcGPFCAhdgkZOHMgxSivShE1Ad9dE8oi+LSJzEqrjvnkQ2WIBAYtGGHUlf6O9Oiu2cstBA5noDOaY/xvNzMSH1Q==
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(40470700004)(36840700001)(46966006)(4744005)(7696005)(8936002)(5660300002)(70586007)(8676002)(4326008)(110136005)(498600001)(86362001)(54906003)(70206006)(81166007)(356005)(316002)(6666004)(186003)(2616005)(36860700001)(107886003)(82310400005)(36756003)(40460700003)(83380400001)(47076005)(426003)(336012)(2906002)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 19:07:47.8460 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fffad9c2-d078-43f2-7741-08da5094aafb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1915
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 jonathanh@nvidia.com
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

The commit aa2a4b897132("ASoC: ops: Fix boolean/integer detection for
simple controls") fixes false positives with controls not ending in
" Volume" string. But it now forces boolean type for the multi value
controls. Fix this by adding a max check before assigning types.

Fixes: aa2a4b897132("ASoC: ops: Fix boolean/integer detection for simple controls")
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/soc-ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 0267e39..21be8e8 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -190,7 +190,7 @@ int snd_soc_info_volsw(struct snd_kcontrol *kcontrol,
 			vol_string = NULL;
 	}
 
-	if (!vol_string)
+	if (!vol_string && max == 1)
 		uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
 	else
 		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
-- 
2.7.4

