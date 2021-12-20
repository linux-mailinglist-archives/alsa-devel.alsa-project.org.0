Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6844247B231
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Dec 2021 18:32:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 013621774;
	Mon, 20 Dec 2021 18:31:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 013621774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640021551;
	bh=TYG3ze8GkH1XaScrh73KueZP7mjncc+fkTq5YoKWsAs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EMSZtu0BlgQu1B0rf88qgmroeixApbYJLi8B5/AlIWuM8EaIw5TG6OXWwwIRw7Q9/
	 XnMXv6dp/eYdZwELpC6fcRuzM3I3CUZXwvCnq8FDbvOkbA3roL8dtYEDd+niLHw5QM
	 41C/uRxs76bhOx9Zgie4CSK/h8bMiV4Ig4bu2Q4w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65D90F8011F;
	Mon, 20 Dec 2021 18:31:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 320D2F804E4; Mon, 20 Dec 2021 18:31:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2056.outbound.protection.outlook.com [40.107.95.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B61E3F8011F
 for <alsa-devel@alsa-project.org>; Mon, 20 Dec 2021 18:31:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B61E3F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="uifaMf/n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+C2C1DKSyQTFSONq5eeyb5fJaU/+nbbAnFEGYWEMYuB4AWodL+qVRx8RRB7RjcjgSIQ2lESXStIDwuoempWyxvk1N4ATGfp+lVwpKJm1a8ck0DLSaqE+VmlQwhfvN5mI+dPhqF1b9MgAFYXQfOYn0QUARDWkmaUYYlsF5E78tBwMuJ/0oCcx1A9hCoGhLhjismhUFoi9EgBwIYnYkOTAoZtLaiojYCDR72XQeK0kMAwe2zdJ02WVna2zJ6TX0ZjBRlmDSjXoasrE9psISHojjpjixV1ZSoDboYrH4wd8n0ER+SsKi5dhK56KCnE3sgwXe+pW6LBWIddatKuaZwZ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tA1yM5hF2qHHoZcGrGqKT9d7LdX6enQT2g68t9Ey+cU=;
 b=OGXF+nVsiSNWLPQr4DJAVOChq6Kf6IlPCpnaZSEO7vyT9qufzq+XRRKg3XfTe7nUgsvdVMc3GUWBharoie7nksKmp0ivyCUa1pjAJ14uiLACz6sPOivVMWFQTm1yHADjTn7Q1k1+oL+HPWy5KUBDSKn06ldN1MeB+i6OPK5GV2YmfTKBETjeLiLXY3Pbu8ymlYeqtmtwb0GrCsOnY4pNmVaLWEjmGagTcte1uOSGbdte08mWxadgbpCI9+lLXZxhex9hmci4bFe8yjHUBvg8RiLmDgKC7y4mZIyHp6NoXwL93zzfvLgk4SAZpET6o1HIC1h/n+dpeEhsk4a+R0Jhxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tA1yM5hF2qHHoZcGrGqKT9d7LdX6enQT2g68t9Ey+cU=;
 b=uifaMf/nTqzzo0K7reWhnR56/cR3zS9hTvsue6c0jJC69AgJUp8oqJVpaW9RamxJoZcv9XX02MShtmCPv6a6FjG+unhCLNOeJqUM7RB1rNR6ZshXB9HIRwM4vNuWDsP/WN/Ihw38SCF3WGSQ/hJT6BG7SczOfsTX8WHL8L5RPURiCV5aGXTVyxOeDKBzBVkjNdjUIrm0YD5no5BtRKYuWKrEEXmDABL9KgYAtcMbsU15++GDWIBDFCGft3aG3Med4yiyOJ4Hl6KefPy/cC9TC2L4lLd4WxuQgeqZR6YM4VWV09YzuAtoz2UMC1LiJoovqP8QPrnyHHlu8IFuxtflrQ==
Received: from BN9PR03CA0620.namprd03.prod.outlook.com (2603:10b6:408:106::25)
 by BN7PR12MB2772.namprd12.prod.outlook.com (2603:10b6:408:26::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 17:31:14 +0000
Received: from BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:106:cafe::1f) by BN9PR03CA0620.outlook.office365.com
 (2603:10b6:408:106::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Mon, 20 Dec 2021 17:31:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT050.mail.protection.outlook.com (10.13.177.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4801.14 via Frontend Transport; Mon, 20 Dec 2021 17:31:14 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Mon, 20 Dec 2021 17:30:32 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 20 Dec
 2021 17:30:32 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 20 Dec 2021 17:30:28 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <tiwai@suse.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
 <robh+dt@kernel.org>, <thierry.reding@gmail.com>, <perex@perex.cz>
Subject: [PATCH v2 0/3] Fix Tegra194 HDA regression
Date: Mon, 20 Dec 2021 23:00:05 +0530
Message-ID: <1640021408-12824-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c3aee22-94c1-4c69-065e-08d9c3de85b4
X-MS-TrafficTypeDiagnostic: BN7PR12MB2772:EE_
X-Microsoft-Antispam-PRVS: <BN7PR12MB2772486E6AA5AFBC67CF9A36A77B9@BN7PR12MB2772.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pjZQaZgQJ+j/0bQdsO87htJcgZCoZyaJgPh4Vo2Llms5CRNy0zdxIUj+KLYYftq7mQFtUZUgBwhEKkKLpXRIC//uw1u9e47iHD5XfkY3p568VdfcHKOG7KVhz2RFRCk8w93h67gCAe9dfrGcm1peVnzfxYPVrK8VVQqtXx40hwtgwCYun+zYxiSJY34MdFKkO6tnWE3oOgm1cHmsrtofe33xSFcD/Lmg+Kp4zvGGaMvSQzwRjijVZRNhcbFyOt5uMNs1bmBHLC6QTgw4WuLCOZDz2rg6V2M5Vjx9J1FRdcqEn/YFBXPtPI5oPQXbcWbgRXFiKU5K3UPpvWcarG7NSEt2ZOsjNPFrn9hb8EJGlBrJdhChRrai3YcWQpWyyqRruKCyQN3Sx6A7qz9oobyyR2DVdRE1uI0ufOrXxmAQI666+h1hlD3wVTogJI9g1/BAs7IAjdRWngLdeG51PzWIHMx+krVR/7f9B18699SD1B4VcHfVJnqU7Q50z5vm+04+Tw9YTErrxnbFOunFLocSX2EzEDCfnDs0aVMol3qo7urn7fnS5Of6fbgtxUTipBcsHix5YXAW1zCh4UZPhGobSb8A+Id9Rj18EnQdrIXWYpJlBGsJ+nOmVsu9mdjQjI1fRrffZ49cLj6oYerFnTEf9MGGhNY8kgWKDMVTsXDo/+cgZdrLbKRNUbBrIlPNmqivxkHfvpuF3DZcuybJkP6RkpaElz9/pvV/dx12qhXGFlYK1ErJCZcVQETYwdAgyhcXK8vpwFx7nLIoxlVEiXR/G04rxobLLJpOsyEkLLLQOWr6NzWK8/5EfYq396nGeaxMOMUUc1w6OXvLlHOm+046Tg==
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(4326008)(70586007)(34020700004)(36756003)(356005)(40460700001)(26005)(186003)(508600001)(47076005)(70206006)(81166007)(82310400004)(7696005)(336012)(316002)(6666004)(2616005)(36860700001)(2906002)(8676002)(83380400001)(426003)(5660300002)(8936002)(7416002)(107886003)(110136005)(54906003)(86362001)(4744005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 17:31:14.1241 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3aee22-94c1-4c69-065e-08d9c3de85b4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2772
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org, digetx@gmail.com,
 mkumard@nvidia.com
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

HDA probe failure is observed on Tegra194 based platforms and this
happens due to reset failure. This series fixes the problem by
skipping the failing reset and DT bindings are updated accordingly.


Changelog
=========
 v1 -> v2:
 ---------
   * Updated HDA driver patch to skip the failing reset instead of
     skipping resets in general for BPMP devices as per comment from
     Dmitry.
   * Used a better strucure name for SoC data as per comment from
     Thierry.
   * Dropped 'Fixes' tag in binding doc patch as per comment from
     Dmitry.

Sameer Pujar (3):
  ALSA: hda/tegra: Fix Tegra194 HDA reset failure
  dt-bindings: sound: tegra: Update HDA resets
  arm64: tegra: Remove non existent Tegra194 reset

 .../bindings/sound/nvidia,tegra30-hda.yaml         | 13 ++-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  5 +-
 sound/pci/hda/hda_tegra.c                          | 96 +++++++++++++++++++---
 3 files changed, 97 insertions(+), 17 deletions(-)

-- 
2.7.4

