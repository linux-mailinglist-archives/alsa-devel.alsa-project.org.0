Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA826EB816
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Apr 2023 10:49:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2789DE86;
	Sat, 22 Apr 2023 10:49:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2789DE86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682153398;
	bh=PDL3fWsQl66WCHfKZxI055UGZQxqBeSBHpfe73QuKck=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=ESWiS/9s6K4B4Vh/eEy4L8kNTRADqtBYKRoNtXO6/GCZugoy4MVXz3bpu0BKpcmHH
	 fANX1qdZaFsVcnhL0mCFspkblEA1D4BxtF2vu0qrBibyCWV7OZdclrQvBgodJJU2LC
	 2HYn68nbXghV2acqH4Mtzyi2CPV/N7hktRc6mpn4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3C90F80149;
	Sat, 22 Apr 2023 10:49:07 +0200 (CEST)
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <Syed.SabaKareem@amd.com>, <Vijendar.Mukunda@amd.com>
Subject: [PATCH] ASoC: amd: ps: Update copyright notice
Date: Thu, 20 Apr 2023 18:02:12 +0000
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Sat, 22 Apr 2023 08:49:03 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SZMBBYC5QAZ4WTP3LB7JJ2MMMXM7T7X2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168215334661.26.11249048207406460670@mailman-core.alsa-project.org>
From: Carlos Bilbao via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Carlos Bilbao <carlos.bilbao@amd.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Carlos Bilbao <carlos.bilbao@amd.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25847F80155; Thu, 20 Apr 2023 20:02:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::61d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01CB4F80053
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 20:02:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01CB4F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=LbDNJ401
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGbbR2CLl9acNcZDWqkg/eUVapXZfG4o9mXTI7XuwwPsei1d21YiztM0BCqM/vJsoeYPgxfw/qjJSzXFo6Z7biRqUNrsf8xd5/skuVNGXgVVxCGXCJXYwDGl8lC03l2EFbkCxyCyoTvU5T8rudty4xfy4Wh/L9vxylPAzZZ3BR/ZDm3oOaFV2dbsxrz6f/Qg85Inzlots4iJWH4TbFXBwxAEey+ep8Zy3Wac41Hue6dNeBboXQGbP1FXjZp0I6DOOZfl6q7RaicBXAf/mN2Y/qbW5o2yhlXni2U82YOy6dKI+zYfV6v8VGbp2fDaomBX7dbNUmY0ECPaa/rT3JB7ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxqJ5IBbhy+fCWT9fb77Vyhxl3ZnqBz+QVmgIItm90w=;
 b=nYr5EqjTReRn75E8ivuIEePhnX1eiTKzP0rNm5zV74dh9EYn8D+lNKDhsYdYxnj3/DzzmckbeSyTp3PGdWjduUzzKp8X6KK8k4q6MAPEKgGETP2CD4Nw2Dpn2zEAcpSf7s9EyIGK+l9Z/y8ogRICNDppp9juc4XfMvlBoiJ7MxrgpoXIHF6hFqSgaMFLxj+w1uLwNMWCi6T34mWL6DKBA6G+ssJlCOo8P64HdcaZ27PAfkGNm6YFA+VQ7WelDGg76CW0COH7TXGQSQoTcJcVtTyNQfsG3bEHGoR3FXSsF1aWadrwHG0bvOkRmRFMYDF69HTywtDZ9hHRfJi0uhLzcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxqJ5IBbhy+fCWT9fb77Vyhxl3ZnqBz+QVmgIItm90w=;
 b=LbDNJ401UcGFg0oFrHvWXcG6dIAaZpdWtdJnMxtzhgWoc09YEDXLxediS47oeco1T1ykr6/+dRjORpKy8JT9i5AhYIhrnK92IL1p2Z2eSo2lyQHQ42iXfME4hTmhxx3aoaCvtWsYNZC9cheScB6Ee1ICYf+1wx7CMhpCLZdv1Cs=
Received: from MW4PR04CA0341.namprd04.prod.outlook.com (2603:10b6:303:8a::16)
 by PH7PR12MB5998.namprd12.prod.outlook.com (2603:10b6:510:1da::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Thu, 20 Apr
 2023 18:02:14 +0000
Received: from CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8a:cafe::1e) by MW4PR04CA0341.outlook.office365.com
 (2603:10b6:303:8a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.25 via Frontend
 Transport; Thu, 20 Apr 2023 18:02:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT031.mail.protection.outlook.com (10.13.174.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.26 via Frontend Transport; Thu, 20 Apr 2023 18:02:13 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 20 Apr
 2023 13:02:13 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 20 Apr
 2023 13:02:12 -0500
Received: from ethanolx1adehost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 20 Apr 2023 13:02:12 -0500
From: Carlos Bilbao <carlos.bilbao@amd.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <Syed.SabaKareem@amd.com>, <Vijendar.Mukunda@amd.com>
Subject: [PATCH] ASoC: amd: ps: Update copyright notice
Date: Thu, 20 Apr 2023 18:02:12 +0000
Message-ID: <20230420180212.3101178-1-carlos.bilbao@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT031:EE_|PH7PR12MB5998:EE_
X-MS-Office365-Filtering-Correlation-Id: eaccda1f-f918-493c-3180-08db41c95eeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s/Lk84ELL7Vi8XapnPZzdxN1bG9J1/cE1BC5lmohkW8yy+qEnTVj5o+B/UuzHGyf87CW2McSQAuHPY237rMQsbm6o/+S+JBQR4HS6WhN6QYQL+A5djr+/axDjyp4rU06+X/aFBvLgWv1Yd53VlTVnLFNc069fmrXg2uBhNLHTb3kEXM/HU16TSqJeb/E01uF/HUVC0uqa85M7FPBN0WbDz99KBKU/CWxzvNCdZcgOXqSEmO0OIrJHVHX2lNVY6/QPHr+5K6TCb2B9e3X5Na88B3q0yLedfmdom0X4PZWdOUjxPTqD89RHBoRhL9uMATMLH5CU+FjKpM6vr0bMTnW2EUlWupUB3UrW7+SiYu0aWDgPN3m/PuJ7/F0KgX6zT7ZtQnSELfxeHfMxZLRmQ/w1pxipjsNW0fvXvNQPZ5Ga0hHH8hJ4DGvF5SCJAsZx5rcYH50e/qYE8wn29A4VDcEcSM1f18WfL2pPVHwCuxTNrFck7HnIKXYBPZThtO3Ty2IPvUSUEKJ18ltchey+iAwmlF2Aq7xgNx2NeS/vRaIfRwRbDWMrpvZScYA5lg+1pAHmm5NOqQEjoiqxeQNPxf2W3zDZeprKg/7cGngqJB7oPjbKwD4Uf70NyyOAmvx+nasKrFGtTk7NWV06HyWC5bs93i/N8D+2P45Cb12NZliS1yei4qha9sZ6NKnlCgflB/26KmoV1QsHK5N4JuoTMZwwPgBEAN/4JSJtvcg9AbTw1I=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199021)(46966006)(36840700001)(40470700004)(5660300002)(8676002)(8936002)(40480700001)(47076005)(336012)(426003)(40460700003)(15650500001)(86362001)(83380400001)(2616005)(44832011)(2906002)(4744005)(36756003)(36860700001)(82310400005)(186003)(54906003)(6636002)(1076003)(26005)(110136005)(316002)(70206006)(70586007)(478600001)(4326008)(7696005)(41300700001)(356005)(82740400003)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 18:02:13.8198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 eaccda1f-f918-493c-3180-08db41c95eeb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5998
X-MailFrom: Carlos.Bilbao@amd.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SZMBBYC5QAZ4WTP3LB7JJ2MMMXM7T7X2
X-Message-ID-Hash: SZMBBYC5QAZ4WTP3LB7JJ2MMMXM7T7X2
X-Mailman-Approved-At: Sat, 22 Apr 2023 08:49:03 +0000
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Carlos Bilbao <carlos.bilbao@amd.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SZMBBYC5QAZ4WTP3LB7JJ2MMMXM7T7X2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The most recent changes to ASoC, such as new module parameters, date to the
year 2023. Update copyright statement accordingly.

Signed-off-by: Carlos Bilbao <carlos.bilbao@amd.com>
---
 sound/soc/amd/ps/acp63.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index 5e7f9c1c1b0e..587c206114a6 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -2,7 +2,7 @@
 /*
  * AMD ALSA SoC PDM Driver
  *
- * Copyright (C) 2022 Advanced Micro Devices, Inc. All rights reserved.
+ * Copyright (C) 2022, 2023 Advanced Micro Devices, Inc. All rights reserved.
  */
 
 #include <sound/acp63_chip_offset_byte.h>
-- 
2.34.1

