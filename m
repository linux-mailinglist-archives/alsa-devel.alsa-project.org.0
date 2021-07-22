Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE9B3D249B
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 15:29:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48CE116E7;
	Thu, 22 Jul 2021 15:28:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48CE116E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626960552;
	bh=zwatyPXrA8FjJ6CGvNeeywkXhlJW2MWYSKIkkiXWLLo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bza8U050sglHUInvg0u581Qgz7QIbTJkNHxTb3xmTE5DuaEkUf50XKwXphkhL36A7
	 icrUeN+1VrZDMfU7JsSRQ17z4V2k5p0TgoF8rLAYNgsPpa5zLUASW7HwUP5hDR6+NY
	 EszBjohDNuUSoh/VdQVlkT9rZn7Mx54y4HtkzVtU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDB24F80227;
	Thu, 22 Jul 2021 15:28:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0578EF8032B; Thu, 22 Jul 2021 15:27:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 331A1F80227
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 15:27:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 331A1F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="1ujemUad"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CcqTpIUhkl5MyEKa77dfO88vc1fHUdjECaXbFgwh9TY+FE/M3xmZkw9JQIHvcCexeHOQ/V2fqeVFRGjDo5VrzjeJCs0bMv7Qqz65hQnI2dQ/Pp16i1iuHpna08du5CGpZxd+Av2vXlAlfQdQ5Ti3AsOir1Qf4bx7pfdt7BRI4a3o+TkQ0udp56hxyqAk1lmGBOUrj0NdtBiLpEtyOy/Ocjb6nN6fOd78ZiRGoBy55C7er0W7+ShBtEcDqAN8IjroI40c2uGftkRpM5XiKLWwVzHzsRVu0nqV/bxBgPPsQTeb4YFbedOTtOmmQoV4KH0vOGLaxAi/rlBEfa2B0X8gBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhpUEzAVOL2iLjkiZmRmnsFejAxQsWKqlb7XWGKFJBA=;
 b=YMB4C9LNfgLw4upEE0forxlYvcruepwk4DndTO/oS2jtyAHSR4MYz1HponMh8+fHNnO9+rATXSQslo4gBDIH7IqUcnoKUMP9UtqAI+/ahbx1MYq+dW0u+UbG4BJDrwwBKEMs3LvexUTEoaFojjxMFLkIm4kDyEQ8Q/08jNCS/96YQzdh9J5YqkjZsygo0qpv3zlbUK7jkKZZFbN7ALZRbisvf0FEtpOLgPGWToG+GvdsVdhXOaybJXptQ64Ypxoy0ZbS25JOfDC3V/NXgJdbZiIhSpOJNJjQ58EOq+2YIiaVzrx7cwd4R61hpyFsUmXxIrWv4tL33wFtIy8HryOwrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhpUEzAVOL2iLjkiZmRmnsFejAxQsWKqlb7XWGKFJBA=;
 b=1ujemUadB1YkcV9mzwxTOYjhgCgAV5qHrNTUUpXKx52GBJ+MIszhHvR4k4TuyPuwZJ6rNdDYAUL4f69FyZScXsPPNxhlYrZrCYt2plbI8mG06locsBLJngcpa8LV/ZGwS6wRQsptPf2CUTvP/HYRbDZd1x66tvPhicznZmssNnY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SA0PR12MB4592.namprd12.prod.outlook.com (2603:10b6:806:9b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Thu, 22 Jul
 2021 13:27:45 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::c05f:7a93:601b:9861]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::c05f:7a93:601b:9861%7]) with mapi id 15.20.4331.034; Thu, 22 Jul 2021
 13:27:45 +0000
From: Mario Limonciello <mario.limonciello@amd.com>
To: broonie@kernel.org, alsa-devel@alsa-project.org, Vijendar.Mukunda@amd.com
Subject: [PATCH v3 1/2] ASoC: amd: Don't show messages about deferred probing
 by default
Date: Thu, 22 Jul 2021 08:27:27 -0500
Message-Id: <20210722132731.13264-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0048.namprd04.prod.outlook.com
 (2603:10b6:806:120::23) To SA0PR12MB4510.namprd12.prod.outlook.com
 (2603:10b6:806:94::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from AUS-LX-MLIMONCI.amd.com (76.251.167.31) by
 SN7PR04CA0048.namprd04.prod.outlook.com (2603:10b6:806:120::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend
 Transport; Thu, 22 Jul 2021 13:27:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7af41f97-11b2-48de-c676-08d94d147d8f
X-MS-TrafficTypeDiagnostic: SA0PR12MB4592:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4592120D8419C0DB39D98429E2E49@SA0PR12MB4592.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7uQaT1aN1tfUyflUxMmuxom0RkdXn6Kv4uwawtSwzaM2Azk3iFR8BRvX9pUJUhY3e4Xh4zWYuwCo8t70hAbFgsWev7jtC2DE03RTZAqoW2LwUnbsRPk9JYFSBwUyKye45Vyj/25ErgO/9wChdO0Mve3no9e5PLDQZjFRzNDEsN1wA67LVOmkteqcHGgfHG8vtrnZpQoLYRqWp07+or222ndf25VMEa51ZHX+D0pXFtKns2e5Oa47uBkjoCaOJhtkb4papA2/QBhPWISSiFQRdlkqKR3TW2sfpmv9NxJ8z60bAx+LHskrQUi3JJibJcxee5ebPptgqhb72LttAwU2OQO49yze3hNlVO9EaY+W6vwpD9VVdLQ8Y/MGkEQYnNrpwXS0DExNZIC+OROjJw5IMES6ljUU3c6zMDhmO6YmvyFIErSX6XCvIZwvdIv20a2v6ojeZfrT49R9+n1vombrneSnjWIEIr58597N40O7UF21z939niPGSyqUVLK9tYlNN0vqNa/YMGAwG9dHQnInjFKrCAajBrU+8MooTXKdcz4w5JfHhgO6ElKxrXJc5fVqrMcx01JPSJbeapO1u7IKkSz9ebof4NBe/Wu/Hrsr3norZd2UwlfYmzLCYLZFFtFbXqX9SIRcb1mwcHJOviIo5h2y3jcghXBB2R/eIW7ybwzCz99D6e++keRZwR6cr6ofqcCUM+WhKR4uWp3mU7dmwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4510.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(6666004)(186003)(83380400001)(26005)(54906003)(38100700002)(38350700002)(7696005)(52116002)(86362001)(2906002)(15650500001)(8676002)(4326008)(1076003)(8936002)(6636002)(44832011)(316002)(5660300002)(2616005)(956004)(478600001)(66946007)(66556008)(6486002)(66476007)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xd7QJBRpM4vr6a7p0AqWffYC8Iy+SpP9NFNpR/y7v4TE0xo5xdXDvdVt+MFs?=
 =?us-ascii?Q?3hbTgiSaB77aqZXl0fTFWJRkxS80bksBA6pyT4AHRwHirN4a1Ijm1H07Rq8k?=
 =?us-ascii?Q?zRV6+vmUHx2wwI0gAu5ZbTeb3dTl6h5+fiqO2BS7yCiRMweoHimaJQ5naXXC?=
 =?us-ascii?Q?sT2BbfYXlBMEdpXAKJVrNyYsuqvaTdSirlpD2dyf+xun/0MqDHnZ+KO5DgjD?=
 =?us-ascii?Q?ooCSWy36nQWE/tUeciCuyeEdNqz4a0UAyAi71NBfLJBwxdXZL2kL2jP+UpIy?=
 =?us-ascii?Q?OVU/Y8Mbf6OrV55GUvL3S4MgwTIFtALNRG1c9KLIXJ4ejK12Z3MY5Y2XZydZ?=
 =?us-ascii?Q?9ZzFRDc6L6opw4oIGbi/R6Rd3g2hnA4M8cfy9kaD6evjiVOrSppwkSnUBGjS?=
 =?us-ascii?Q?hg28f3wwjClq5NhuBnr3gGSOO4R55X8/DiJVQV7vvRsxh38nFv/LwitnfUtk?=
 =?us-ascii?Q?EE1KFaK8KlMuEB6C8xKrR62H0nfGR4WLiitPw252sI+vqRKWC2YlFqT7T//O?=
 =?us-ascii?Q?SOUbUeiW6I81YaDZaiXaMtDLQ5a598IiZrD25i/tRRLwHJeuUZTS0mW6B5R9?=
 =?us-ascii?Q?cJIarDubypuJZb8DOlPUBlFC0wG5XBig3PCLMeSd+ZW7G1RpUtx41tLAKZ1q?=
 =?us-ascii?Q?xCsIH/ooikisj8CUK24fvohipdOnAi/aaquYDvNGycy4XTrnYTJpubxJofAf?=
 =?us-ascii?Q?koL94npod0wVLLwbqn17g75YUob8TSAd/9SDse0eqlilxbJz/pWFUvQ19o7C?=
 =?us-ascii?Q?ukYOHD80f9kF5jIqTu7xXYpBAJ1RAsdqexoAje92x1hADAMVkTlqePjsNJhU?=
 =?us-ascii?Q?dOQCzsefg9t9HoaghXKQ53jjOB2+5T1wx9oeLYaPngMDPCAAKu8CVT9eX8bn?=
 =?us-ascii?Q?z/pslTj8ZFL4lDsLICK7TiOXCLk+Yb8b2WRVf+/UW7VYVjeIYAGyDhRrRPRe?=
 =?us-ascii?Q?98Vk0ECQILunKnpt8danp/VAAa0npBVh6EfXr5XKx2FFtbrQNqQ/Wr3F94YW?=
 =?us-ascii?Q?M+LxlNNbHEx8Fnu9+PQnqfRQns/tnzUSnEMy+xclM7aZh0mD0mLD0PN65Nf8?=
 =?us-ascii?Q?9TYK6Qntp6B+hCIzCOa/WHm/bavdJYGeRWChdLtyiX+klIAOOcCz8hCz3LsW?=
 =?us-ascii?Q?6iL9adEoTm16bRZ3ece4iLmuzOE2zF+cTxeswouGG/HpZTLeyG8uefmtAbG5?=
 =?us-ascii?Q?LRedcp+Nnrkph7PjfFMqFJtWuuKoWLICxFpREgNuehZhP/F1zPaVn49lqajs?=
 =?us-ascii?Q?dmyC0umWg3Rznfi7mlMUCSJseu88dHaxowpTX6bdgLF3vt9tXyhNOt9UBztl?=
 =?us-ascii?Q?tEMYu+IHsYATWxohy/w6vLxX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af41f97-11b2-48de-c676-08d94d147d8f
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 13:27:45.2249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VIoEDKy6BzlEHXWclKfDgV2Cs41KLiyK5eTePs+MTE1/rCdnni08knXOOEIb927sIfmocyBi9U4Z0Yl2twLPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4592
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Mario Limonciello <mario.limonciello@amd.com>, markpearson@lenovo.com
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
Use the dev_err_probe helper to hide the deferrerd probing messages.

CC: markpearson@lenovo.com
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 sound/soc/amd/renoir/acp3x-rn.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
v1->v2:
 * Adjust return codes
v2->v3:
 * Use deferred probing helper
 * Rebase on asoc-next/for-5.15

diff --git a/sound/soc/amd/renoir/acp3x-rn.c b/sound/soc/amd/renoir/acp3x-rn.c
index 306134b89a82..5d979a7b77fb 100644
--- a/sound/soc/amd/renoir/acp3x-rn.c
+++ b/sound/soc/amd/renoir/acp3x-rn.c
@@ -54,10 +54,9 @@ static int acp_probe(struct platform_device *pdev)
 	snd_soc_card_set_drvdata(card, machine);
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
-		dev_err(&pdev->dev,
-			"snd_soc_register_card(%s) failed: %d\n",
-			acp_card.name, ret);
-		return ret;
+		return dev_err_probe(&pdev->dev, ret,
+				"snd_soc_register_card(%s) failed\n",
+				card->name);
 	}
 	return 0;
 }
-- 
2.25.1

