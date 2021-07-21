Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 041E13D167C
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jul 2021 20:38:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CC2C1702;
	Wed, 21 Jul 2021 20:37:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CC2C1702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626892710;
	bh=FZk0eegIS2sKhW9f7vZzkwo8cX4phr9kEay6KSi9/j4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jE0KgiH9kB/14Q6/KUgu7vGYU2IjzE9RsKgo1WMec/6IeyXRwWByTqgVhnBhCCd5Z
	 vlBLLzfNvyT3Brro8nYLooYmCef5XZ0aRJC3bJQsWPnWpwUIXIoyktM0sLiKkb2IZq
	 W4mIypI38REJvS8iX8RHLyOPM8aKqz0LR006XF7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 827DEF804CB;
	Wed, 21 Jul 2021 20:36:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CB35F804AB; Wed, 21 Jul 2021 20:36:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39D52F80143
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 20:36:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39D52F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="dhGaYbyH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QKkz+Ivzs+rM0+IH/qdjpf769NJz+jv9f5aTiN9Q5vwPWQvQHJd4dx1StPfwj07PL7D7hLtzaadGpr4g3QMVz1hipGPu724LeXxJpvRjpTl+3fCQlnU3BHOJoX5ZJAyrpYMRFT9OZox2Q6pGvuB30KIObl7xnOija0XjVUN10VbbeIPkFW9KMevZvyreg3oZqBUHjfke/+zobUOsB6MH3hsq94W/1lLzivzRhGrNB60NRWPINHWvrm8SvJfFJ1rN0IRXWoIQ4vx+osBsmDEdxUxTCo5pBcKM44xNh3g20MzFW/f8A25tIqxVZcYbfNctmbKxu5iOMh4W5PrUyFlW1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQVHqgWKS0dwTuvcAdRcpg3t1fDULgP3HfThyDp+Yxc=;
 b=h2oRM5S2VFUMANIMLhNUySFFcVyV53G+nIC4RF0JsJSkiJiIcA4OEIk96ocurtRdDHr/9VgAy/RHpVcxfbDe8d5miPc5ZbDaLYoEgnYvmk8Uj4xhGjy/4OJhyC/LvJIoY8XPYRapcX3v2d1Y1kp85yPnAc3LkrTb4HRWtUGr70BWwI6v+LjDMjjcRT2fAHLZeITEhccfxD/j+Eo2OG+rC3dyVeOT0Lf0tBKxYf6yStCsXKEGNSfeYhfF/kAzr2a+V1tJ3gHcskTEHU3IwnV5bRNC0LCpBVUCvfkpAB2eiXfjvdDxiYdYtWxqnZI5ECNbxRUV4de0SI8W43zgfm1V4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQVHqgWKS0dwTuvcAdRcpg3t1fDULgP3HfThyDp+Yxc=;
 b=dhGaYbyH19+dYtHpAVpbwHeyt1t9ezpJN/FMfA7W4EgRjLearKJxvyehWrYkJolPmEROYLvfRQSxV08B7d2uoREzR4yY0OpiESX7bEpWvcpcvtrvSbKjjCtXjyEmoi6AtVATRsiNrfhL/cI/kRp5lOGAIS2+uTBMwaUgMokH5lA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SA0PR12MB4559.namprd12.prod.outlook.com (2603:10b6:806:9e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Wed, 21 Jul
 2021 18:36:29 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::c05f:7a93:601b:9861]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::c05f:7a93:601b:9861%7]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 18:36:29 +0000
From: Mario Limonciello <mario.limonciello@amd.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org (moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM...)
Subject: [PATCH] ASoC: amd: renoir: Run hibernation callbacks
Date: Wed, 21 Jul 2021 13:36:03 -0500
Message-Id: <20210721183603.747-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721183603.747-1-mario.limonciello@amd.com>
References: <20210721183603.747-1-mario.limonciello@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0136.namprd03.prod.outlook.com
 (2603:10b6:303:8c::21) To SA0PR12MB4510.namprd12.prod.outlook.com
 (2603:10b6:806:94::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from AUS-LX-MLIMONCI.amd.com (165.204.77.1) by
 MW4PR03CA0136.namprd03.prod.outlook.com (2603:10b6:303:8c::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Wed, 21 Jul 2021 18:36:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5cfe986-e93f-4623-8a0e-08d94c76746e
X-MS-TrafficTypeDiagnostic: SA0PR12MB4559:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4559BD79336E7050F6D33C27E2E39@SA0PR12MB4559.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:541;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ebmEQ3zTuJccNLGl04naVIYwGM5F7jdxvjm72fafTv50bo7Y6tRW1Huxp1wa3xJQWfbuqKNePBrc6CBs49Wi8+U9TRtQ6Gryt/0gN87Aj/E2dAQfYxUQYLearkYDjMbV9ld7W3k9sBn6ueEkaf1qkh4B+TVgtz+ODKvGONJBOsJdDNDLHqnVO90803Xtcb8izQ+0unOElCIEmLnVgR5Z4ySGTLZLapJHaaxDUo+yEJKgnrES0OwVt79sT7IvLtQma/5XRFxY6rK7dT4NPX9jhHTNO1inhHKyAmHyvZR4dwPiduC0yyyMOU1jCK3zvHTT5HnIXXBeSf2vvKMqj9mwAznprD9BIdPkemt0erMNOWqri7Cw1ECLwiLWUNOL9TvfX0eflLamfw4vpnWJSD/qg/xon2fhlAtu6R2Kusw0Y5UWpxW6vC5B0jKqprXm70nekpLkfxvZ4e1wEHM6CsNcWv6Tt+CeaKFxzfg+ZqdHb+xF+KDKy2aB2EK+UO4e+kBI/vEiuQVcH8IE0H6tO5nBb1mKLh4cALuhetWmezcobWu1PvBermm38LXeeKwU/a22+tgzohAKGpo1de0XySJ218vdfhi7ZrauurEGohCxtAamkB6JIK+Ufdfhzl2SW6V2XTNstab4XZlmzQqmotM9ZN3J0bDquVDzHVBsUPVQf8BOc28R/7TuzTBbF+LuZ/wIeEoWUyqFOTZiPS/OLEQl4dobDYMQw9v9rLhOO5syj95yRK0I7I3u0uLU3yq0IAeVzbCOleDMYfyIfvaLZtkLFFjFGy+0UkJIRFAi1+5mD3I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4510.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(54906003)(110136005)(6666004)(38350700002)(38100700002)(316002)(36756003)(52116002)(66946007)(2906002)(2616005)(86362001)(44832011)(8936002)(956004)(6486002)(66476007)(8676002)(66556008)(7696005)(186003)(1076003)(966005)(26005)(83380400001)(5660300002)(508600001)(4744005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d8NQB2/LCpvwQ8pHiif0lRBHnTpatrcuZPc5TTh3sv5q4EcHy4dQf++Y4E7m?=
 =?us-ascii?Q?YSmIiWSQtEvBRtkSsXUk8KRLxrAKOvYXLNiK0ldw5ZJIMlgSJmU4gmyGRfUn?=
 =?us-ascii?Q?/x49thwFOOElIKKDcVUYUTwOWJEGj18uPGMvkjiY4lrWJj8Gtq8JnIC5xyUe?=
 =?us-ascii?Q?Uxum1DHfg1u7UODN7ksH35lPF0m669aQrCBTRSXBb2Ts6qP1XUZ4X1WkM1g+?=
 =?us-ascii?Q?tY6vJaAKzmqODzkG8N2y6xAXp2+g7ObqxC7RBn+TbaQ7lcKgnaLQNiAdVlq8?=
 =?us-ascii?Q?aL2oQHIcqDFtnng5KWQG8UqQ4q+KlAcyPTYvIpzAHiCv/JBMbq6qCKrzFeQP?=
 =?us-ascii?Q?FOpY3wO0Rnm9ezhEIskorIWbDiRe/Pn55M/redx6c5jytntPBEFcAbBmhrlw?=
 =?us-ascii?Q?irocRv0dYdlyosiah4e69JZXC53XVNZz2gUO34mWsk5UeZChxXq6bKiopHKd?=
 =?us-ascii?Q?Q4AK2ZdVWrCNZvoBazVHI9vIY7ZlMk79bAMr2ogWyxnxtpSt7UZmPALnm0DF?=
 =?us-ascii?Q?SL/UOVcFB9/63Qd7AyIHbBZPpPfBmN8/b/rW6gzl2wAud3T0OAqPCWVKDlvV?=
 =?us-ascii?Q?+WBbFOkyJQtIq/lLhY6Eym0y8ysDGE87Nd1MxiUNxUsUP4DI0b/AxJt2b9cR?=
 =?us-ascii?Q?cdBMNibKiCVaC/8NnSNw9syDLmNZeQu5BWklklkFsK5274NgVDOwUzF/kHax?=
 =?us-ascii?Q?BxhBrdWB9aYuufPUbCawuWzW9UGE5RXpvfRd6kcpG6ujNNcclyO/B6otJ+P8?=
 =?us-ascii?Q?jdl80698rBvJFaAPuYIvb8YQdVN1EinCgAoL2rIdp0vjNEwVOjyZq4SVBYWG?=
 =?us-ascii?Q?x1xELfb+OZ355RlRzUutX9iEXU2F0GZ90DWBkB8E5Zl8H7v0MMrAbM1Q3DRj?=
 =?us-ascii?Q?v5Q4KnFJ4bkeYfH5yijyFzShDBGk6KSEpN1vfHbug8x0pjxcydS8EYZhKoJ/?=
 =?us-ascii?Q?xPTu6zZp0RODOwASTFv6RJU9wg+DveqbrQY20iGc1ptihT7Gag8/VRHqyWtj?=
 =?us-ascii?Q?rLhONuz7mHfsOu4r5/y7O6LW87Hi6BkK2XuXChnKKXXSYq+vUf1RNpUMWqAM?=
 =?us-ascii?Q?xAS9/oTTaCRrixKVcLfT/5uxmGn0UesMVlcvU5ctJLdTTzrfFaneqaK+ygec?=
 =?us-ascii?Q?2LFiq5q/d2CQaKOafi7c/mlAZO4BdVLE3NHKpqGQbb78Z5UbapnrW4wc/FPH?=
 =?us-ascii?Q?TbOUJ6fml6VwjtK81GZqfsaGA+DeFhtGyiB9B+B5xjFDkf/u9/JpDH+lKANI?=
 =?us-ascii?Q?rK4SX4g6oezZ8th61nsSHD2AdZ/Y8g4ibhnb2P+sHUoWMTQ7RJwsybRTzPpx?=
 =?us-ascii?Q?p9JUtyBHtcDRMpF0JVQWBSt2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5cfe986-e93f-4623-8a0e-08d94c76746e
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 18:36:29.4651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llPONp0l1hjCxlc/xLpBcd+JDWq0RhwGwa/3b+j0SPX07xFGWuJYSQdezPXZ/sOIAs7OD59opX3268980PmVhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4559
Cc: Mario Limonciello <mario.limonciello@amd.com>,
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

The registers need to be re-initialized after hibernation or
microphone may be non-functional.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=213793
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 sound/soc/amd/renoir/rn-pci-acp3x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
index 19438da5dfa5..7b8040e812a1 100644
--- a/sound/soc/amd/renoir/rn-pci-acp3x.c
+++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
@@ -382,6 +382,8 @@ static const struct dev_pm_ops rn_acp_pm = {
 	.runtime_resume =  snd_rn_acp_resume,
 	.suspend = snd_rn_acp_suspend,
 	.resume =	snd_rn_acp_resume,
+	.restore =	snd_rn_acp_resume,
+	.poweroff =	snd_rn_acp_suspend,
 };
 
 static void snd_rn_acp_remove(struct pci_dev *pci)
-- 
2.25.1

