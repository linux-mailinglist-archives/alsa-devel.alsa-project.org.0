Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2029582895
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jul 2022 16:27:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F233415E5;
	Wed, 27 Jul 2022 16:27:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F233415E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658932073;
	bh=kOgUzyXtObsMfOQR9UcCLw1FglOx3lSYtUIlYkN+XJE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B++dXLfNNkFfZFR2lswAwbyIdKmffBn635r0A82e2ZXhLENH2o7MjzOBrHTxlarFJ
	 RLjxuapdXCwdQkFLDQG4Dw+viCKXhSNogVwZjCfkVb2kh5qmT/lYMa/hPbBXo3yawq
	 9HT9AYS24/qFi3JBkY7849aFouPwAXTQnyRzpdl4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BE15F8014E;
	Wed, 27 Jul 2022 16:26:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E800F80171; Wed, 27 Jul 2022 16:26:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86054F800FA
 for <alsa-devel@alsa-project.org>; Wed, 27 Jul 2022 16:26:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86054F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="aXL/QeEe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVkIV5s+3S9Ea0Urhym49a+Z7vFVdBfxa2G5Vy6IapW+tXcgxOmvVJdKX07r3J21Uxe88NaLjaVlzDYJCMh1fmFQounXm2gIfJUoIdlcLj4Nf5b/r9u8WMhYpFjoTJwy6jGzHuWRk/zEc/OY3ylpeC1pHuVWFJIpYmwW5B9uOWsboA+bVC43P+V0zVQy1FdxV5mfGFq51VFBiZMD3uDjlzbpLfnh80DmLHgSfOz1qdxWzCVymuSF/1aMjhQ4Fa2fsJ9g9jq3lIxQ5m8EbNSKnlDkXKBCvaSjCuMopKGAofQxWxs1nyqJtDZRP2kJkx+yiV0PmevAkoCWlJJGOek5cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4F/LlD/JxutDEty4/El9J284e61PGpdKkuG2b6dWt0=;
 b=ZEMv0ZUASmsi5Z0G+o9UGc+O+a5J/f84oGdFI6nOKzUZ6KTtghBXZZqdMMTTrE9x7C6EJ5s5H+L9F8OpWFQLfy52stzjHprv12+XRxOkCA38Jc8vddelk6WjuCPa9HbkZuSjxo1MLiYMGT523KcMDr6WwrBrIMgvgACWPdPxLm2KN45rIn3OdArRBO/tRwNsVv+FHRakPCNIlIYli1rWmAhA8zf+lPuGL3nLRmA8bNZ3//pkVlRjh7Hm5lNZovnx3sxLgDL4ZpZVM4KKFcFOGwCY276khk9uTL1mJv9XslRhzE5ttU7uZEG4km6+cgNEwSAC06WiMVdO24xPqtxa0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=renesas.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4F/LlD/JxutDEty4/El9J284e61PGpdKkuG2b6dWt0=;
 b=aXL/QeEelmga9o0sxFNT/RbFcstBgUhVyonJY7eHYN1O4ZTKYlxxvAQlShd17+YqHSkE13x40sdU2mtQips9tWPeHVnqqtbhWYI9Q5RJCPOTZepCaOq1jcC5Tqr1S7+BGDW59g0QQuUnG4QsSla5mZHTrxqiRnHu/U+oVLQB8tPfWHwx4n3o6Vg0gT3lVlnnL+/iTaWc7HaUeua3Q7SIgMz3RheD4M43tGmfRQo8z7LWjkqLidAMUThbRZv69zWt3dPB18XIjmfl2AMtdtRgQfN4d9cspe905h8S0Vx7XJY5oNygs9ghTZYoxyexnDYPCQIsT1FnlYnDwRR72BIRoA==
Received: from MW4PR03CA0042.namprd03.prod.outlook.com (2603:10b6:303:8e::17)
 by MN2PR12MB3661.namprd12.prod.outlook.com (2603:10b6:208:169::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 14:26:39 +0000
Received: from CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::4c) by MW4PR03CA0042.outlook.office365.com
 (2603:10b6:303:8e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Wed, 27 Jul 2022 14:26:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT046.mail.protection.outlook.com (10.13.174.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5482.10 via Frontend Transport; Wed, 27 Jul 2022 14:26:39 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL105.nvidia.com (10.27.9.14) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Wed, 27 Jul 2022 14:26:38 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Wed, 27 Jul 2022 07:26:38 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Wed, 27 Jul 2022 07:26:35 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] DT binding for sample format conversion
Date: Wed, 27 Jul 2022 19:56:21 +0530
Message-ID: <1658931983-31647-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7f0f674-bfac-4c88-948d-08da6fdc04d8
X-MS-TrafficTypeDiagnostic: MN2PR12MB3661:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eI3K/awxtusKo46hV0/n3lEH1HhH4YdGEYEa6PqelFTXpp44V7ZUM2rmUev2w3k5tKSnjCn1jFjbmg+gZWFYupVAlQChVKG1YG4Gp45O3OTBxOM/i3hHjOk1EZ2irIqq9KsGjmy0rdU/lXM8YPvMYsApFpl74u3pLQUd1jAdlzHHI0hlCE3b4sKN8GOkhrr4aNqLnTSpaBVk8TVGv4SjzeS9Nr72cuWvv6jz4MT5Yp00vtTvhQwNVZCwnTsVSOu1LWcfRxNAQLXfVyfZKr82bef+2kR3Ijt9jgPrOlwheaXQfgs9nE7yNui5xnjibjo9Gj7l7+an+DK3OBpc3KgO6Er6kI1S6fJ4hPS7Ktyo2bIYk5+16qTFHUrAQFZYdBqDduFWqfsQEicrmiLm6RYunEm6hZmge7f3mvaFq7KYgsIaqOhkm29NVxjbhKH/JOVVmnWzmFPHm+JjVxh9Vbo7xSBwRQrnRPK9Zq9pQeEN6kLb8icUmgNB/o7MrHy0YMndqc099BPxNBBfWpyzzIonE9I3oxG0YA63q/fTLNBDuR450QY+nJIfLYdRHp479DGSs76dF9fQqdGjW0kQXoUwX5cHH1f72C/iOYI1r//DpuMpcJzv+Wr/yV5RnMnHTafgZ0lmrzunE1eFiTrKSyEksNVXror3WORqh0d8PnQA/BdFUMQqOVCIX7bcwSAtaHLQ6Kc7qqDSCFohPi7AesfFyPxw4NH8KKFO/RgloxfabNpCKEVGpXITB1k1UeMNigssRVEHNTpRkFJwrMmbz54tX4AE26l9pLROewTfRDyVDunvmOTrFNWTP5Do3Q8/BUz9xkfSn/BTRHomtdlZMPaCaA==
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(39860400002)(396003)(346002)(46966006)(40470700004)(36840700001)(5660300002)(47076005)(478600001)(86362001)(186003)(2616005)(4744005)(40460700003)(426003)(40480700001)(8936002)(36860700001)(54906003)(7416002)(36756003)(110136005)(107886003)(336012)(81166007)(82740400003)(70206006)(26005)(356005)(70586007)(316002)(2906002)(41300700001)(7696005)(4326008)(6666004)(82310400005)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 14:26:39.0043 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f0f674-bfac-4c88-948d-08da6fdc04d8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3661
Cc: Sameer Pujar <spujar@nvidia.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

DT binding properties are available to fixup rate and channel
parameters of a DAI. This series extends this to sample format
conversion as well. With this now DAI PCM parameters (channels,
sample rate and sample format) can be fixed up as necessary
in an audio path.

Sameer Pujar (2):
  ASoC: dt-bindings: Add sample format conversion
  ASoC: simple-card-utils: Fixup DAI sample format

 .../devicetree/bindings/sound/audio-graph-port.yaml | 21 +++++++++++++++++++++
 .../devicetree/bindings/sound/audio-graph.yaml      | 11 +++++++++++
 .../devicetree/bindings/sound/simple-card.yaml      | 15 +++++++++++++++
 include/sound/simple_card_utils.h                   |  1 +
 sound/soc/generic/simple-card-utils.c               | 12 ++++++++++++
 5 files changed, 60 insertions(+)

-- 
2.7.4

