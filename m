Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B75A6443C78
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Nov 2021 06:07:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47021168E;
	Wed,  3 Nov 2021 06:06:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47021168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635916054;
	bh=fJ02qBE4G5oIaYqxdwUs9VoQeSxxoCkJv/dCuA26dEY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L0kjTGzW6uAIt1q7BWoGYKWiA0j7ZlndZTgBU9H/W6Jh9dkyagaFk747bu18BL/PD
	 HGWLyU/j0LlvqXPc9LPCxPUhQJFrDZY+J2vM0zC/VtrPyTHkJ+BxGzMx9UUSwpGLWs
	 IIH9E0zxz/cOLKJfef2a0XFZ+wijK2cOiywcR0qA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34C76F804C3;
	Wed,  3 Nov 2021 06:06:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87DC8F8026A; Wed,  3 Nov 2021 06:06:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BD2EF800FA
 for <alsa-devel@alsa-project.org>; Wed,  3 Nov 2021 06:06:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BD2EF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="LjjmWDSx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvD+cSFYHtWwpyted1GS5QKJ1ICRyhSeV2rzfX8mJ5UvLfOgUk1rKeOX6s4PMpaL7j4vgkR0miqDJu8CpMo+NqpVrDOebkVv50gqo3cYgvQZ0aKCcu6AOB7QsTbA8bAhVcoMpij9qNWCs5ufuCMv5PJL1oSUxCEyTmCA5AsGrbV/1q/WVTJQyQlERYvLQQQQ4TKh8aao5ICYzCFlvxvRRjYhDeRlknitsVDhIcZiyifq2bLyRKVP2nJ4IjUiExeF7k2/mu0MYGXzTJaP+Dyna4aI1L6K2yVP4NDqrD3wEifX6jV8wE+dqmPIt/zSPxeeH5LQ9LrmhpK+G5YDS5n3kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSH+f2jXwLRJL+G8REX4k/Ik1WpYE4arn7wBT4a1mcw=;
 b=kprkLpVL1RC1ehNQ7lpN9tXRZ8m3eG0mBLpvF9UYDzFjqIk7mmdFFXV+SB6jImWv+DWPCr4GSLDAEc8R5wJz8gEB4W92q3aUO8bqTWfqZYiDwrKwLgz+J3QqWuHLB8hTaT3ZNGokq3gcyIUrJFxhfjX0Vaj9sR3S8grRJ6kABEIG2BA4iEzFu1dqJb3+A/XhDzvrbab4nIREQIPLqGS+KsLTSXqtGldIWch9aurag7G4X/ctn+3okA9iOmHUhsAIFHnEh1RGx75OJpbVmAInXSy7DRAkCLDiUn285EPmmxQ3RgKdVKmSUUIxZLSujhPXUGgKkOnm88rMjF4977lkfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSH+f2jXwLRJL+G8REX4k/Ik1WpYE4arn7wBT4a1mcw=;
 b=LjjmWDSxrLsn9ARZASnyQarlAedY+FkklGTkUt9S2qcSoB0M2/U2NytA/HY9bsany0JrPK324WzV3HMnzeLWUi+5cDmqFcAbiGn/IScNfBWPu3ddZuQPjnSuzvAS1y59k2YYamkQMP180v4ga/h+a64xglfYAaUGbu3sm04rj/YkrO/IVHk2h3vwuS6zUYXxFWv/4pg9tis/m1i6tZgVk0HXviNDcZEJFcq4cQ5jugYOFzPNrNuELwAPdK2sX7Fphy9gp0aL5zpVqdyVLTUv8Rb9ukrriQyT48tynyYRRdjGbwkMaqp88ZIMOdJXuJ7Z+2HvmjDxpumJqO+6NF85tA==
Received: from DS7PR06CA0033.namprd06.prod.outlook.com (2603:10b6:8:54::15) by
 DM5PR12MB2390.namprd12.prod.outlook.com (2603:10b6:4:b5::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.13; Wed, 3 Nov 2021 05:06:03 +0000
Received: from DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::f) by DS7PR06CA0033.outlook.office365.com
 (2603:10b6:8:54::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 3 Nov 2021 05:06:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT055.mail.protection.outlook.com (10.13.173.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 05:06:01 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 05:05:51 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 3 Nov 2021 05:05:49 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH 0/4] Fix kcontrol put callback in Tegra drivers
Date: Wed, 3 Nov 2021 10:34:53 +0530
Message-ID: <1635915897-32313-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0c1ab4c-b338-408c-4e21-08d99e87a1df
X-MS-TrafficTypeDiagnostic: DM5PR12MB2390:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2390C9B4D1D097122845E0FFA78C9@DM5PR12MB2390.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UihpArvC51HJJDHN5w3VrTMsNx2aasdEgGUeUhPrGP6123y1xZg7of2NAgkClRvO1MPkczloJAsfZjcPwVgOdaw17s4eKVPy5ns36mKr+WyODwr5CmYnO6MGeqc5AvUXETqAzYeYZnWZZoq6XyKzHflEQ3BWZylQQj9CsYGeKHXW7laqvHZLWiLdPBrp6gfA4EI8ipPZIV8dNcfG++kMCWK6hdOnvNZPuK0d+dnIN1D8N9a7llCHtEO+cIg7VY2TbhmU0n0yewEWjmMVLDn0O9qG6MQqsD70oBsH7cQiotu8jM4GR/f25q4Ko2f8V8xsdgleBht+Zpfe85tiTBF0aEnmMMmKCvuYCb55AIQrTMCNjh+Wx5hFxAEAKXzA4Swepc1M6wtEULxMSKepjuiXPSebdEcJ2uy6+yE5uMKsqTRAftC464ZedXXYroH3w6QxAH6YI9HIkmmJ4a9ayj31gyTLOpLu8pbfJ6qdfEhVt8ldRGT2aB/z3HEmhFikkbGnpLnfugT9KBP60w1z9RJgrrzqtLfv/cne/nP1zsX/jjjjR3knnrTJ0kihVTU2WEBhsvZOP7R0cJlPFz7MqWWXgjTJ8uFYwxUgR/zojULGkkgOTD0q4B0Z00a0jOBjL1Ao+nmZ/uPJP4DmtYhl/tgndnaQuVrsiafkg/TuwIxBDEOYe26nsMp8BFXzr4viaVp9r6DhK5Go3/zU1Ebu5hrsOFOG3ZkUvP9cZ3cjhSMTe8nLcQK9p/oD2RrNxl30ui0LGsc1JhUflp5n3f/O14VJaL6Xc/r/Z2TaWn8ANrjdbXo=
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid04.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(26005)(2616005)(5660300002)(83380400001)(966005)(6666004)(2906002)(356005)(7696005)(7636003)(82310400003)(36756003)(110136005)(107886003)(4326008)(426003)(36860700001)(336012)(508600001)(8936002)(186003)(86362001)(47076005)(70206006)(36906005)(316002)(54906003)(70586007)(8676002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 05:06:01.8978 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c1ab4c-b338-408c-4e21-08d99e87a1df
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2390
Cc: alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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

This series fixes kcontrol put callback in some of the Tegra drivers
which are used on platforms based on Tegra210 and later. The callback
is expected to return 1 whenever the HW update is done.

ADMAIF, I2S, DMIC and DSPK drivers are updated as part of it.


This idea is suggested by Jaroslav. Similar suggestion came from
Mark during review of series [0] and drivers under those series
were taken care. This series takes care of remaining drivers.
I have added 'Suggested-by" tags accordingly.


[0] https://lore.kernel.org/linux-arm-kernel/20210913142307.GF4283@sirena.org.uk/

Sameer Pujar (4):
  ASoC: tegra: Fix kcontrol put callback in ADMAIF
  ASoC: tegra: Fix kcontrol put callback in I2S
  ASoC: tegra: Fix kcontrol put callback in DMIC
  ASoC: tegra: Fix kcontrol put callback in DSPK

 sound/soc/tegra/tegra186_dspk.c   | 4 +++-
 sound/soc/tegra/tegra210_admaif.c | 4 +++-
 sound/soc/tegra/tegra210_dmic.c   | 4 +++-
 sound/soc/tegra/tegra210_i2s.c    | 4 +++-
 4 files changed, 12 insertions(+), 4 deletions(-)

-- 
2.7.4

