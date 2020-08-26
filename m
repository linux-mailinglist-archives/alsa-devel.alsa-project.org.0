Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B56252C59
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 13:20:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB18C1741;
	Wed, 26 Aug 2020 13:20:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB18C1741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598440852;
	bh=IijxGu0D4CVXCzPBCf46LbtnePKJSrmGMtFP9pYKEmU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KHf5WnG2XUasvHGlbbNfh374WxPz6ft1lmtp1aI9++hT6BrLkH58o6Ihdgexy5oW4
	 p95UBgolo/yH7vL9R5laZC2ek2dmXqnMLxFo3ZkB/p0h0Vn1Ef+xdPkfqmec+NYyWS
	 G7jcFn7eFF0Ysu9/CNO2CpjKLUj7Yvvs6ZEDjr9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9E7EF801EC;
	Wed, 26 Aug 2020 13:19:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80429F801D9; Wed, 26 Aug 2020 13:19:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,RCVD_ILLEGAL_IP,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAC97F80105
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 13:18:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAC97F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="ZimkLCAA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8OWV2gzkifS2zNRNuxs+ML7KVhPNHhDcPgOaBYatR28OSuunDc6TFS7UvpQH459tKGQUW66H/ivUEdHiR4fIB/SwbjPQT2JoNM3AkrhGvWvFFfP5d/FsAYkJzcQvr4foejp6CP0NVH2TzHRTYHa3KQIOdU7bI+jEcdwlsSRN2xJfpDgFEb3+tARJQxixqOkBlmcvGjbpeGwi8ViCYOu0WEQudT8zoFRmP+9KDzDNOXEd4rPaeic2cvTOrY3kN/phEOFFY1DIU3P3TimV/kMB2hkSPvFWYOwn40Sfni54l/Vt4RGYnwP2KIZwjBjUQOeCSTJhYWnPuE9gKaW2z/sgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BR69KVJXjNlZx1sBgp0e9oyc4MhVgZI1iMJljI5NLc=;
 b=TRZUe4v+QGFd5XqSHoxcvrP2Z0Mu9xkhRy0FhHFNCdhcirs7zDMNWgiIop9pGPBi0H5T7CHzLFxCyZebyGUfVJl/VxW8xdrYcYeEVDQ5BCORgXQQfjUGyvsFMAGN2PyidrwBaW5dOVwQDibUorG8MnRkV1FykEKik/FMQ9FJe9+gk5F7e3cJQu4TdnP94MWodOJbtu3g3vG5OWYv4PK61hOI44zNG5lsqKTt2S6T6h3obkGh7K0p92d1GUYCDMfa0XrfmsQ+aGoigbkHigQkjDIKBzpD8Dde02TaFXsmC3L8id478TX5sdkzv4zp1e8XJNyBHZP/RCjcu72Q8EPdCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BR69KVJXjNlZx1sBgp0e9oyc4MhVgZI1iMJljI5NLc=;
 b=ZimkLCAALz3l0O5LhS0loaJqcC3B8lNa0ri1spXEYzXihLL4duWzTRFUF47UXnkyEnKkLFh/yeGzCFcxMHZPKpOvS37SGl6b8AeesR75T5rpBHp1gD4jgyPGkB1NDheD1OCyD17ki/YmRaGFvFbxIroTpxoybPruDPhPJ/lN4uw=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR1201MB0188.namprd12.prod.outlook.com (2603:10b6:4:56::12)
 by DM6PR12MB4450.namprd12.prod.outlook.com (2603:10b6:5:28e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Wed, 26 Aug
 2020 11:18:54 +0000
Received: from DM5PR1201MB0188.namprd12.prod.outlook.com
 ([fe80::4df1:4ad8:38cd:128c]) by DM5PR1201MB0188.namprd12.prod.outlook.com
 ([fe80::4df1:4ad8:38cd:128c%7]) with mapi id 15.20.3305.026; Wed, 26 Aug 2020
 11:18:54 +0000
From: Akshu Agrawal <akshu.agrawal@amd.com>
To: akshu.agrawal@amd.com
Subject: [PATCH] ASoC: AMD: Clean kernel log from deferred probe error messages
Date: Wed, 26 Aug 2020 16:48:05 +0530
Message-Id: <20200826111826.3168-1-akshu.agrawal@amd.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::27) To DM5PR1201MB0188.namprd12.prod.outlook.com
 (2603:10b6:4:56::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 MAXPR01CA0109.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Wed, 26 Aug 2020 11:18:50 +0000
X-Mailer: git-send-email 2.20.1
X-Originating-IP: [171.61.65.59]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c7579fc1-cbd1-4d31-5e42-08d849b1d117
X-MS-TrafficTypeDiagnostic: DM6PR12MB4450:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4450A93DEA4E43863E0D6725F8540@DM6PR12MB4450.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WIZPhHhJccB8vD7WenXWkk/qaWzsu6MpQequ7krEuTd+Hk7e7vtI61FoWKmRFzvkhS0daGiSrTjNuH/2ekxJ9uVhFqlda85pOvGsXIBoAhbeq2riJy69EQQriUSfRky+4bX37BRu67JXKgzDiaKqvETEMACGD3BSwqDBFULtI/B81FwLm/22XWeJTGg+vTeG+tGKmE8L/9PEPmY/1F5MbPTSd9IJ+YD+tVJXIGXCub3y+93Ha8XAACX/1cqD4NvXEQlZ1AW/3SpDRjH7i34SaVL3Ie5xT0JXyvwI1ddJFcT7meLU85VbE3rJbv25PJibglVCfH18kqC7Qa6qaHCERw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB0188.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(16576012)(83380400001)(5660300002)(6486002)(4744005)(66946007)(1076003)(2906002)(316002)(86362001)(37006003)(8936002)(8676002)(36756003)(54906003)(15650500001)(44832011)(52116002)(26005)(186003)(4326008)(478600001)(956004)(2616005)(66556008)(6666004)(66476007)(34206002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: RsSshFk5pg95vOV7Da1DbWiTWcGnUxO6hy148AYKeZtZK6Z0tWMqoGJ6cps9+OqKks6EI5unZFB7eoa/fVuYDCkfwDjGO/vzhy3fDX9doNDXYs/H/XG5qG/EuTWLTV9XJUxhgbHCvUBqChuA3RT5ebYJ2SWxmxzBtZzJVhseMjiqKEmvVuXyGR/ist5BzIMYXiVw5U/BkodfmV9R8klumSxdqIDc9TS3wuvc3hkLtIwUbGdW1m+5O74CIhace80BpoMBlxp8c8NRWi/RAYx+nPCFvCABGpGTNqH5nMpFA7W0mOX5MJKsSkrupv0i6pSuvhi5HJrqnyL0//+EBIxZ1y/7YOaqbHvWFCMT8SE+F3NxeGjwMlrBO9rP/foXZ8tEDGWxY/dLQBaxawvlHzsPg1H0XLGBqPyzQd6gp7K9Jc8NuNJ5vtiWpMaRZbWcu8BHqhMLb/wVSuLkj+8s9ClZ9+Aky4gtPVhtna9ttfLoTHCrvSYQBOI2n+qAtKpVYLXU4cNEK8SXmgxwi4CqUPc0/g4HlNPkYjuHGHjJf21J+Ngj7v24JnbrhZ2m8vQPDltp1Tq09YF/RQW1rFlHJiToFgHqaRvWewWAtoclXZPXdThA+upGCZiGSRY8co47aaOQ+q+5HAk+7FEPmn4EVl+LPQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7579fc1-cbd1-4d31-5e42-08d849b1d117
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0188.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2020 11:18:54.3291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GEMx22fbMj5MhIginhgGW/1jFL0T5LYcxHuAdp6DTgDYhBHIkUc/WAl5J2ZwXS1dBuJ+px0SJ3PXgPsHHkNHog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4450
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
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

While the driver waits for DAIs to be probed and retries probing,
avoid printing error messages.

Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
---
 sound/soc/amd/acp3x-rt5682-max9836.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 406526e79af3..67f80ba51de0 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -471,13 +471,11 @@ static int acp3x_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret) {
+	if (ret && ret != -EPROBE_DEFER)
 		dev_err(&pdev->dev,
 				"devm_snd_soc_register_card(%s) failed: %d\n",
 				card->name, ret);
-		return ret;
-	}
-	return 0;
+	return ret;
 }
 
 static const struct acpi_device_id acp3x_audio_acpi_match[] = {
-- 
2.20.1

