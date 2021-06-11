Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5248C3A7B36
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 11:53:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAA7B1674;
	Tue, 15 Jun 2021 11:52:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAA7B1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623750804;
	bh=9/vjKhdGOiRepGfM8oREcvrZQGeFmLuhQtLro+fNEQ8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Sk27dugqavn/0GK08lA3NVJsFpv04vHvjD5u8SxFyijhaT+SMqZ8C4Xe8NFtL9YcO
	 T4trGPv+eGdDTtdtwe8gzcXXKxq3wU3V5+OieFRPdv7KaIqb51GAEFHyoXHj6d1m8b
	 OgNyEC8jxFdt3hdzkbT+x7c18Nxy+++cpPzL0mUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D52BF8016C;
	Tue, 15 Jun 2021 11:51:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93253F8026C; Fri, 11 Jun 2021 20:52:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D9D6F800FB
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 20:52:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D9D6F800FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="2jHxHDhH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YvU0qK8hx9coodSW+5kAv9G++zy7tGT0GeujZhR+GWqiSh9Uv/sv14ZkXXvjF0Wp+lmotcDPHVrVrZJBPpVq9mafAFdiRmp4+Zwvil0dE8VY7wWA1k5Dlh33BurCMddfDaY/PkpRgFEfMPubtEnls2XQLeEdRzrZcAg8J/1Cxm8EhWe70fF9VpZ/MdTyBWEkR/1/RyLPWN8pGncdAqEaBOeEItWoWhajYNP7GkqSWXjWl61ZdDQHpqpAFshSzXtd7Gw71mmLNh2jEBDttWNmlkspk0O/xMaqXHXMedkXxjaGe9ZwdeuRNSDyr4Ce7aJHwPg1a8/Quk9WXd5Zgo8ybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hzjvg6pC+UCOS4gpQL8f/SMUvHkrUZuKDqJcu/39wGY=;
 b=BaoCFMoKgoazNN/WjFunyOJ8MI6EF6mRFmopItglf1mU2ROUj36XT0S4zYF8j0aILJQnZ5WKALKiaCXpISCvs76KnBNEABlXGGHJCDgLVDYMCMK0r05wcjbdjCRVh0WPZhUIqjOdIzcbz3WY76Ncb497MNtIQ1lRecooYFres9tH8RZghPWYl5w+IKFSyIM5Y6nauBP89ddr+YPnqNpbs7FS5GsZakzQb+Gv/hp89TniRIRwhykT3MAsZMNn2wBzyhHeNUrNE3eMMlNPXblL6iFwwr0kvFDGQPMdSnOfEBjepHK9NxhuV2+VhNXuQmthbkxhfWqgbGr3Tfaad5r36Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hzjvg6pC+UCOS4gpQL8f/SMUvHkrUZuKDqJcu/39wGY=;
 b=2jHxHDhH8vB9p30wtg7VdT43CCyihA0NJWjbdjyMzM0i1LVSKsZqJf6l5V65zflYG340j4pZf3XXYVmnQqWVP7PGuj3Rx8NZfeTk9/dpjwuJfOdTPFs5HBjDRoEEW6ocNzReQ4WPSWFRhx89o0tXHuKJej91GITouByrfidl8fU=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SA0PR12MB4574.namprd12.prod.outlook.com (2603:10b6:806:94::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Fri, 11 Jun
 2021 18:52:21 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::9c16:2794:cd04:2be0]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::9c16:2794:cd04:2be0%5]) with mapi id 15.20.4219.024; Fri, 11 Jun 2021
 18:52:20 +0000
From: Mario Limonciello <mario.limonciello@amd.com>
To: Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org (moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM...)
Subject: [PATCH] ASoC: amd: Don't show messages about deferred probing by
 default
Date: Fri, 11 Jun 2021 13:51:55 -0500
Message-Id: <20210611185155.12504-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN6PR1101CA0018.namprd11.prod.outlook.com
 (2603:10b6:405:4a::28) To SA0PR12MB4510.namprd12.prod.outlook.com
 (2603:10b6:806:94::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from AUS-LX-MLIMONCI.amd.com (165.204.84.11) by
 BN6PR1101CA0018.namprd11.prod.outlook.com (2603:10b6:405:4a::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Fri, 11 Jun 2021 18:52:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2e98e49-7e25-421a-22d1-08d92d0a0af1
X-MS-TrafficTypeDiagnostic: SA0PR12MB4574:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4574550994931540F56418D0E2349@SA0PR12MB4574.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VzJhqmQMUUvCaAP0fSFzbLZs/scaKpiyLq494lEhI1VuyRodR3e4lixmAXi+azBj2QDj9/EVt5UaCGek5sMmplWQvbx+z7TBNQ4jsUXx9pOPtsmadk1bDvw7pe7jSZUE5H3UqEtKyCh5fInyrlv4YltWPq8RFGY/hKYx8oaLi82jFN1PBZdAmyuRi0GvIMOa30vsdZ7N0KLgN+umkxtsuWffJoSVI5agofLf/40HPtyFGsAljmAELkuuquVmXvk+raCHquDL677VGayDSucZu4PcCEAcEAcbiFwAKeKRrTn8MhQBjr3NeTIiVGJdDd/Hgxe5tp7SjjFp9pPimqyIoseYhrbPQ9w0ubxdUFj3K4+sgqTrrdgH3rEux8wEdjrVYa6F+q6TjeHW1c+vRQKrEGvhJhffFGLAd/FO1TpNE9MaguRnHqmO3npsDyEFWSWzvSUzaTM3+HVu/8W45h2Dyi0SjAReCWOmEpxascDIoIlJ02XHYwsSq3WRScsTHrRqJZFjh4z2Ywz5DQucrzPkunx8jYazkFoNgmWr6dHheierLYm0TGoIp/WOupNwxMDrllWNXqbt3CN9ReBdIBsZONebn4gxmtT04ID5Um10jJxVZcqafKNd6ukIO49SRsB5SQ4b1IhBqJWLRnPnWEyB1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4510.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(52116002)(7696005)(36756003)(186003)(38100700002)(38350700002)(316002)(8676002)(16526019)(44832011)(54906003)(1076003)(4326008)(478600001)(66556008)(66476007)(66946007)(26005)(956004)(2616005)(6666004)(8936002)(15650500001)(83380400001)(5660300002)(86362001)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X+C04rZqpz+JSmOt0F3fm3Sz9crxK1C1MHe5DNXt2AwruyDrgbLTwODcxgjy?=
 =?us-ascii?Q?LiCQejAWeqwRzrdEjpG718gipgIYwWpQgFPsc7iAHUmAx/V8xARyAI1Yj7R8?=
 =?us-ascii?Q?TAP1YYbg1QmN3v0VXyHW3NAKa0t/knoKEvaklm8zIpjR/t+lgvNPr5c42oD/?=
 =?us-ascii?Q?o6iTk3VmyB+/86/X1bYDcmYiYzuzVB8EhQ/yBtCDHhnkXC9mh5ORy2eQOuiD?=
 =?us-ascii?Q?P1Glv4uOtdJi4rZpAF+TzI3dkL3OmWs9A3P2rHi6+67HbdpQgviNgN6Ag8xz?=
 =?us-ascii?Q?uyTHOiRtgkQXR7gwqY+Y53Jne7HHxxW3G0FG3+GkuEWzpRB278N0ngW+Bb7w?=
 =?us-ascii?Q?+DZZ1VIUfvY3+2eedOejaNF3MTYgE2N29MUtp3rg/aI9yFwm6Op+Q9g0wsEr?=
 =?us-ascii?Q?3DNPgnAX7NJCdqOkc8MYZu4ITe7JIxQunNgWQL4A6m8W9OZv9cYGd8RXxp/f?=
 =?us-ascii?Q?K8AxJBhRZvcDTU6dfugLMbUc7uU2gI8pXGPLQ+WwXnDhhfwK7N5/SyrWzIH8?=
 =?us-ascii?Q?s868BUKV3YDuV+kHkSY3fi6w6XKdSveL6MsJfgCkdFXA95w2Gm7UglgFDBeN?=
 =?us-ascii?Q?8XfHvhVc/ld4xOa6xVIAh3V783ozF6OKEbDmNWIge6A7Ghi47ZneKQhWzReF?=
 =?us-ascii?Q?pDzbyXDaT3BOUCiTWj8A4H8oK7uziGTKap5DK42z2IOTTLgciAsOmxX8407/?=
 =?us-ascii?Q?2++0xbI7VJvDBZb31HD7s/nhUd1OvZ8yODZ7eFkzKCdbIw+EGZ8J6BABQnnM?=
 =?us-ascii?Q?Y5J8wHc4wocnKonvvkCf1JwAG+fvvqYNcQj+JLw8xWHHPikYHi1bu77E6FDL?=
 =?us-ascii?Q?06xcmfXvP5R0tuImG4Zft/cxosKbsput4FZNkJI/8BQq7p4DPT+d9SVabnZ1?=
 =?us-ascii?Q?q0RnfgS5OXfRj3hNxhub42merNGxaVdvYh1CYpul/sFMptYW7Hg49TSGxHkq?=
 =?us-ascii?Q?MZ9z+ZMBITPycA+Y+aj63TjNrSR6ool7k9G2iKnnbNF51EiXLvFN2MyrnXRL?=
 =?us-ascii?Q?PIjr9Nm8iwBFSwafxko3/E0pHMkZMQ6aPjBYfIqY/6CLYSWbvmJ8/Zgl6O+d?=
 =?us-ascii?Q?O2QjbhgJOAKSRb5NCK7LwZqnkT0lCtx7asWU7UYYbP8AEfvUrIEfpbu+HEu/?=
 =?us-ascii?Q?69sdG4N5Aopz5r1rjboFJeLOI8QCfbTV+z0OF6GlWdWxdkNzQArkeH4d3Js8?=
 =?us-ascii?Q?GQcBkCj5TANyhDR7p5pGmXJXmCo1jj1II//7Nq3LjcPqK9X3O08v5i0u+ZSs?=
 =?us-ascii?Q?xMkGEQqxwuv+2Z0EbCNc1GyTKGfvefLI9ti/lr0PdPQplQo4xp5eLT1xx2NA?=
 =?us-ascii?Q?dM9Mg0C04BTzGf2LCUbshtif?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2e98e49-7e25-421a-22d1-08d92d0a0af1
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 18:52:20.8294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bobu+h1nPUZLNDUnzOLvFankgLpW9jzgfS+4VNJCk6/dxk6ZFvufzWGirR0UkZsBffz3u4j/Uma1q2+u/HVdMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4574
X-Mailman-Approved-At: Tue, 15 Jun 2021 11:51:53 +0200
Cc: markpearson@lenovo.com, Mario Limonciello <mario.limonciello@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

Nearly every boot with a Lenovo P14s is showing
acp_pdm_mach acp_pdm_mach.0: snd_soc_register_card(acp) failed: -517

This isn't useful to a user, especially as probing will run again.
Downgrade the message to debug, and only show errors.

CC: markpearson@lenovo.com
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 sound/soc/amd/renoir/acp3x-rn.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/renoir/acp3x-rn.c b/sound/soc/amd/renoir/acp3x-rn.c
index 306134b89a82..e785994de614 100644
--- a/sound/soc/amd/renoir/acp3x-rn.c
+++ b/sound/soc/amd/renoir/acp3x-rn.c
@@ -54,9 +54,14 @@ static int acp_probe(struct platform_device *pdev)
 	snd_soc_card_set_drvdata(card, machine);
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
-		dev_err(&pdev->dev,
-			"snd_soc_register_card(%s) failed: %d\n",
-			acp_card.name, ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
+				"snd_soc_register_card(%s) failed: %d\n",
+				card->name, ret);
+		else
+			dev_dbg(&pdev->dev,
+				"snd_soc_register_card(%s) probe deferred: %d\n",
+				card->name, ret);
 		return ret;
 	}
 	return 0;
-- 
2.25.1

