Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F9A2537AB
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 20:57:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4D7717A7;
	Wed, 26 Aug 2020 20:56:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4D7717A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598468264;
	bh=xYhbU7Rmc2ML61Wto1d/7hW7j4uCszr/Mhg+KSVX2y8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DPTZOwUN40eYAj+dLRvw0WN4P7+imhgKuMG3rveAfIqI9rQy+VjbYoAZ5PcqpULcP
	 lyynME4bhtH5rr1NXm0Ik+EiSWH5ZW5mEHVtY1dq+gYxPUC5O5gpuzo/kYGDee+hs2
	 bLeK3wAcx9CTYY4W3y7+yXheGiuHe2nP2EAc56X4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47CB5F801EC;
	Wed, 26 Aug 2020 20:56:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36377F80143; Wed, 26 Aug 2020 20:56:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,RCVD_ILLEGAL_IP,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49047F80143
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 20:55:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49047F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="xEC+B9N9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QFDstxKU3gmQkvTC6x/5jm0R7NTXre2DvycczkH1/r1LfiBxsVZXbZPuvW1HN82LhP2ZbOGSrjnm2pw1ACAl5ZnWWRJu62xCIZKf+Uw2ktLXCsAI76TYCD3/tij1G9vEoQD4gQg0G52gn4F0CtHMtFHJi+B77KhO5EqWgV4N1EcHrE0ZHIgeRdokbn02KQGM0tN7N8HB1X5rPomwzwE7TwH+wHAsmrZbUyiP3GR+dX8qVAkSxFlIrJa5YoaWADb+nkMQd5T867NYcb3+CVOc11OJoQ0JEi2UluoyP2IsBY2AqnAwiNJi+komOfY248vKJMHWOhV1NS2JjgwHj2TAkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+P4qKLtIbuJJ6rroXIW7pCSk1KYwY84mX2QWnuTPhAk=;
 b=fgd1T5r8zbsJG8CbRSS/juPVIdaiuQkzVGld9qhK8dmOSBz/4iDbmeeYsLEVVNGIT8ekr+loIKveDIpkYfay9yFWBdrAbUhR5dfaLYZvL2FnQqK/Mq0/7UYXQcM1FLy2IFV7qocUJGUuGPdO32NCb5mFZXo5trjUNS5tdo1A2Sdcv6ZXvkF3A+VhFWV8r5mQiugY6I+/2mzDMjZUHyu94y5eNuay92Nheqk4XQkRsXO/wFnE1wVzedXCbSe4D5XWxadGiQmh9XVGjak3/0ne649KBGVEEDtxq5WgsSGBZaK1BxkcngMZ3Lvn+JlmZ8JJcJwd3G+uGmA+4pazdYeVMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+P4qKLtIbuJJ6rroXIW7pCSk1KYwY84mX2QWnuTPhAk=;
 b=xEC+B9N9nSZlltgvUMcLBFYjeDjPkX0WnhUQO6ycGlEtg1AcEYp9uHtdrXRgMzXrpNQYJEwyP/a82SrgcIueiAA61d5EwYJKRFgVrem3q9RN4VHZ/O6PVEwRIKhb8gg1mttFvYOyOxffTVnUBIDIx4lcQXVSEBgwGDx4sP23Vtk=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR1201MB0188.namprd12.prod.outlook.com (2603:10b6:4:56::12)
 by DM6PR12MB3435.namprd12.prod.outlook.com (2603:10b6:5:39::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Wed, 26 Aug
 2020 18:55:49 +0000
Received: from DM5PR1201MB0188.namprd12.prod.outlook.com
 ([fe80::4df1:4ad8:38cd:128c]) by DM5PR1201MB0188.namprd12.prod.outlook.com
 ([fe80::4df1:4ad8:38cd:128c%7]) with mapi id 15.20.3305.026; Wed, 26 Aug 2020
 18:55:49 +0000
From: Akshu Agrawal <akshu.agrawal@amd.com>
To: 
Subject: [v2] ASoC: AMD: Clean kernel log from deferred probe error messages
Date: Thu, 27 Aug 2020 00:24:20 +0530
Message-Id: <20200826185454.5545-1-akshu.agrawal@amd.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:49::33) To DM5PR1201MB0188.namprd12.prod.outlook.com
 (2603:10b6:4:56::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 MAXPR01CA0091.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:49::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Wed, 26 Aug 2020 18:55:45 +0000
X-Mailer: git-send-email 2.20.1
X-Originating-IP: [171.61.65.59]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eb1de7dc-3a8e-4f05-aff6-08d849f1a59a
X-MS-TrafficTypeDiagnostic: DM6PR12MB3435:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3435ECD1FBF9D864EC408077F8540@DM6PR12MB3435.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: np1CGERMzHqKQqpXsHK6079T3Kl5cfGmK6G+8VaSJVDFzrcuDaOl3yI1UDMsOP9yy24Z4C7GNkZa/XlXIRuhGsNV3f82e/wkNIEv6iwbw3VeCQ+doj02N2sm8hA1uO6QwQY+np4d4zIQsBgtsDgeUfZbHQn2rtdwVpy21w145F2tW/8tthQD4jxS0FGbnC6Df5FifS3zi1kHgm79Msph4d8YzdswOZw1ZEbD4e3BSa9tPPb/pSR3SJQcuebG+ZHP1lT5RSOwn+9qv2S/G/UVILMG+PjYkk9UiDIuleg/GMqmOiyqmTtp0pOFpRAzqkRWKkw7P3DjZBrWpUd5ydscVk+Zv7gR63oz2V46RBTDyVULYpUIj2arEJjD+ZF37M59
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB0188.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(83380400001)(15650500001)(6666004)(5660300002)(1076003)(2906002)(36756003)(6486002)(44832011)(478600001)(109986005)(4326008)(66556008)(2616005)(956004)(66476007)(86362001)(66946007)(54906003)(52116002)(8936002)(26005)(16576012)(8676002)(186003)(316002)(266003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 76aAp9BanvWU3wtp8sPtVMBHltDJxOnAOhR1NjpF3niX+XwMWny3sPZoK3NkkE8AtaKHy1fU5pLm7mRnjr5tsbN84aYKDilNk9UiD0ecYQhCbW/PwZpGKUB+suvByZZSc+ReXqh6zcVlKvaSCBziBtH8CPWprAwPoiInscuFeLHv5PAJDxLZejfZjw8a0HiQhQlpXu4gQqsd6o9PRRCx/u7e50TBsC5UUbSQ+k43nMdOzKo9kPTvtS4HryE/8pQ7PMBSa1zC67ZRQ8lRnUeQr9UFcfrDywFyGhLIGd7EbEso7Mq8Wt/cs0UHM5ST9qIkz6g7pxsrCj+Q0s+/X3+7HESdqY500OoHMaBKzxRat/kEufv8CK7zUsjtw9EG6ztsBE2OWAPiFWLIoFU0ZaXz9RC/e3V32joQ+jLYH5H926c5sF1uM8keCg95TBJd6BFSgOaAUtIaiaqc9Mr3TUox86IK1fFfWJmLCCByJl1mxtb8TmrERduv3yZZ/rXl06TwuNr1qcC/RkobENlwSHITo8vnSbIyrjdOpCYyec9mI7t/8cQFmvVb7qv/HkSpujpVOmr7504xp2CrxDe1bHkH+W20koTRudLVylSp3+zQSy6qHloryNk1auUR6p0m05AqXb4ATuta1Z4Qg0DfYZdFmQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1de7dc-3a8e-4f05-aff6-08d849f1a59a
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0188.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2020 18:55:49.1677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4A1lH6ZT+splmlpxI5upgVNmz2U0jqpYKYhZAxJhoH7SypY8KUEF6VAriLVJzJydMWrzASZgaC00Ce0FE/XVqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3435
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 akshu.agrawal@amd.com
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
have the error messages at debug level instead of error.

Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
---
v2: Add a debug level message for -EPROBE_DEFER

 sound/soc/amd/acp3x-rt5682-max9836.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 406526e79af3..1a4e8ca0f99c 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -472,12 +472,17 @@ static int acp3x_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
-		dev_err(&pdev->dev,
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
 				"devm_snd_soc_register_card(%s) failed: %d\n",
 				card->name, ret);
-		return ret;
+		else
+			dev_dbg(&pdev->dev,
+				"devm_snd_soc_register_card(%s) probe deferred: %d\n",
+				card->name, ret);
 	}
-	return 0;
+
+	return ret;
 }
 
 static const struct acpi_device_id acp3x_audio_acpi_match[] = {
-- 
2.20.1

