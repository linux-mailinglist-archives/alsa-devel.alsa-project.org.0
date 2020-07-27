Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4CC22E519
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 07:03:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E3891689;
	Mon, 27 Jul 2020 07:02:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E3891689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595826188;
	bh=1OcZmcXNYQZD1EKk8WQIXIwRUSo0zXg6OAq/rYQvPnM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qACAl4/1Ii2xYKCZjbeIBTe1wz8NQFk0k+NowR9ORq7faK5MH5LOOpkyPb52dZy4w
	 HDrKh+wW3nynty9YFpSnaeuDjTpLxL2jEJpq+vfYjH2HPTnslwFV1quxzJ1zPfjc9z
	 eAC2qnDgCCZK5hrrfIe6D/5ynEZdm1l5zkXgtWNQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44BE9F801D9;
	Mon, 27 Jul 2020 07:02:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D281F8027B; Mon, 27 Jul 2020 07:01:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2130.outbound.protection.outlook.com [40.107.223.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD5EAF80246
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 07:01:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD5EAF80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="gagzqb06"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CszzyRFi43RBNR6ug+I8eEnokfR+G5aAoCeqGUXjtmKzo44dpsk8BEBf8c+p++5JGDXp4/Nl13HsLtgfaOjsCBnOOFZWMrWyWUI218+CdYAzC7BL/INWiCwxHQwyqqMu0Bwks6ejPOXu2bBQdZt5/kre0EkvO6aRiBOBlcestrdpwUTzRdeTji+mENkkNrT4EsULeMs8gWVaIgT9pg005/DUrCenFb+0VMOID5e322nLppGtwdVqRgMp69RX15scABPOO90sNuULR6k/1wFEGcwk4ULQ02iTPDmbdvgeCqlPmDigRbEaR/+1ITKjrR0yGbO/klFdkMcWzkLl9eJ3GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKG3yzcoft3LwZCwxMMfU41Lqv6EcNO1eqJ8SY5JAhM=;
 b=kbFba2bN9XN/YwvjecO6+6HwqVlmTvBTDDZpBxPSMKz3YgYx9vCtiVu8JJ4pttdR8JiGCLRqr8QNP3KQHTk55IUoYUZKxgovIEOeSiuQ/qnvSAqDuSs6B7HVO6IGU/jUjxyl01TodbyzztkRLYldgltdd0hZiVH2xB7zXUNdkHSm7teJF3fIN8MFcNSL+ifcnqf5dQizEj/OwaYHUV73UV+e48wrofrzE+14EP1WLbhBkUa2Gm0H8ssziQxwiCge+BSqkoacduS6u0Qgz/dbW3mPqfbP55GtzYCyAr64hbRB4s+eP+qtAnL9k6EfuDYx1xU03R9uwgdJTr5dcomWaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKG3yzcoft3LwZCwxMMfU41Lqv6EcNO1eqJ8SY5JAhM=;
 b=gagzqb06OYwcTPf7MF+BDlCJj/Gxq9Lcrwvv9qU/02VvTf8Ouq10Cf9SyLR3JR7IwEqQqW+Ik/QBe2caNS3yLmLIucLvqcr9lyKn1qSgt67hitLPOmudEr2cOaFB8lIbJGtbSBnK28VTclL2+l2NdAYzGtA3bPnQvmt4s0QbDwY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=maximintegrated.com;
Received: from MWHPR11MB2047.namprd11.prod.outlook.com (2603:10b6:300:2a::12)
 by MWHPR11MB1600.namprd11.prod.outlook.com (2603:10b6:301:b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Mon, 27 Jul
 2020 05:01:45 +0000
Received: from MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::d9e8:a3eb:4f08:e795]) by MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::d9e8:a3eb:4f08:e795%5]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 05:01:45 +0000
From: Steve Lee <steves.lee@maximintegrated.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, geert@linux-m68k.org,
 rf@opensource.wolfsonmicro.com, shumingf@realtek.com,
 srinivas.kandagatla@linaro.org, krzk@kernel.org, dmurphy@ti.com,
 jack.yu@realtek.com, nuno.sa@analog.com, steves.lee@maximintegrated.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [RESEND 3/3] ASoC: max98390: update dsm param bin max size
Date: Mon, 27 Jul 2020 14:01:19 +0900
Message-Id: <20200727050119.21009-1-steves.lee@maximintegrated.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0031.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:1a::17) To MWHPR11MB2047.namprd11.prod.outlook.com
 (2603:10b6:300:2a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2001:2d8:ed2b:74dd:b4b1:36e4:d148:7e35)
 by SL2P216CA0031.KORP216.PROD.OUTLOOK.COM (2603:1096:100:1a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend
 Transport; Mon, 27 Jul 2020 05:01:40 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2001:2d8:ed2b:74dd:b4b1:36e4:d148:7e35]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eea1ca6b-6418-4a6b-ea5a-08d831ea28d8
X-MS-TrafficTypeDiagnostic: MWHPR11MB1600:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR11MB1600FD93B878DF8450B7BF3892720@MWHPR11MB1600.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Ib5mYmw4S9L8qxKOpDN1yZS62qzQ86Chzg+FBst2bYAWNwTGJ9KoMD0lHS2FDyRBwBJZh5pxwh3oIFhVNoKe5gx4aypEyZetzUkrnrhx9aZplSTvdAbmg3Vai53DcPJRvPkhvIO6t6ivsBmOzUWiIKmKc7mM4ZjlJEmFpilJ98Rkx8c1euxk9Tq1guzrnI84Q4fWwQKDJHya++KXZMhhIcqFhJFZH3XEcA9l+ruPtrA5gVVRKf9Xdp2lwDu7ju4sz9WX2BaVNM6/07tNnINc+XDEiuTD939MGAjBTy2VY7pdY0Wib8oYT4cXNWYZRJ8OYyPavbsl8agrYANzuUdBiQHDXar07Z6FFYfFAwPS2f0CWbsVV0WtKLOZJEtmAwNjTuD4q/m5hI0sx17aTrjmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB2047.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(66946007)(2906002)(6512007)(8676002)(66556008)(83380400001)(66476007)(7416002)(478600001)(6486002)(86362001)(186003)(16526019)(1076003)(15650500001)(69590400007)(6666004)(4326008)(4744005)(8936002)(36756003)(316002)(52116002)(2616005)(6506007)(5660300002)(921003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: GAX90Ryl3M73VNnSH21gImf1swK6XbruR5qg3j3foi0hty/Y+9hqJeC2aYUpUgI4muUFP1Nq1ziG3kQulIpE9RB91oPADdqoiJH1rhJJbdcj9hBe2ljx15GZDkytsqsv2vVInoauWeIxOqdQnvFQJMaxf3uq8BV35WS1zx7g+A74ls3rMGZVk5ZxEQd0xp1EyF/FuKknYjZz/kwNTrast+eseo5wXV4tfr8GsYUqt4tzY5f5DJxuahS1b6Qsms4/xu4PLYbepVYT5cA1BfPJVM+z8vZcHbl8JOJykKnkspGFI44fDV/SvPQA1tosNMwGUAmuzIOURsWZU+9N0xRIu2ZcaNpixmNsfZc6f7LoaXHW42zghPjVpOIFRmj/c5HhLhKl1LcbBu9+LCI8AA/khIQK2gJipQV0RXua3q8gatiDOl38S4GMpf6FrN4MtvWLvuPVYGe1wrGNCaTYWmZ8nknUL28nZzXl0IWiNjd6z4MtBW12UQZU9j60nBa7cn1fOEjJtOp7//ApOs7CKcKWo9MajdP4HXEjKKkeN2HTnzc=
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eea1ca6b-6418-4a6b-ea5a-08d831ea28d8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB2047.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2020 05:01:45.4476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSO++bpWR47hg+Y8VaIcZo7G0wjNmdezFAYwgRDROgnzkN88Uo8f3iXT4fKxn76l27jQ0pNVj3N7BG41bDGu57j+Hkv5dVuSRx+nF7TjvTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1600
Cc: ryan.lee.maxim@gmail.com, ryans.lee@maximintegrated.com,
 steves.lee.maxim@gmail.com
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

 MAX98390_DSM_PARAM_MAX_SIZE is changed to support extended
 register update.

Signed-off-by: Steve Lee <steves.lee@maximintegrated.com>
---
 sound/soc/codecs/max98390.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98390.h b/sound/soc/codecs/max98390.h
index 5f444e7779b0..dff884f68e3e 100644
--- a/sound/soc/codecs/max98390.h
+++ b/sound/soc/codecs/max98390.h
@@ -650,7 +650,7 @@
 
 /* DSM register offset */
 #define MAX98390_DSM_PAYLOAD_OFFSET 16
-#define MAX98390_DSM_PARAM_MAX_SIZE 770
+#define MAX98390_DSM_PARAM_MAX_SIZE 1024
 #define MAX98390_DSM_PARAM_MIN_SIZE 670
 
 struct max98390_priv {
-- 
2.17.1

