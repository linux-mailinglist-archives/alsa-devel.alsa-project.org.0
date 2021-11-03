Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9474442C7
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Nov 2021 14:54:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0270E167D;
	Wed,  3 Nov 2021 14:53:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0270E167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635947659;
	bh=umONfc/r6XpHEMcCjMQcL8U28h/94HRiQuJE0Snf0Vw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hjeWZMv6bCYWEz2qNT+QsmUmffgd3244fnt/OxWG5D02HIG8olEsa16xB2ex5/xwE
	 RoDXb25JJXJZcsD4npaTdZV7pDloCFbn+33+s0i3MR2alqxOHrnPC+8ivMkjd1YXaQ
	 c+WatzfxvTU/p/bTF75+7YVVwe/ZfQtwErSOMn2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F11DDF80279;
	Wed,  3 Nov 2021 14:53:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFF88F80279; Wed,  3 Nov 2021 14:52:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89CE0F800D2
 for <alsa-devel@alsa-project.org>; Wed,  3 Nov 2021 14:52:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89CE0F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="V/yVWA5D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOAgc5iki5Uic2xYYdBpJuBztMJQSzpApw1Qsd04+OxBmAwW1tCNTXP/CTnJqvuDzEJ3HZ0SgVGhHPnTYg4RVMe9SZVR5zpuOcFnA4p25F1sCvYupQGAF/57NthMeBROH6sndmxXwlRM4EuF5iJzm+u6h/pxYff9+G1K9u3QeeON2Z9Giq/fkk40U/m5WW99wlP1WnWZJHMSE8iZ/HkoKuSEz9UIJc9mvhoxRdMVkgTgblqCWTXV8imjFY4EqrN8ICoux1Mfa4C70hSke4Cfj7m4I63fwvYhA4sD83kUKDWtRDt7wFPm8mxDcVxZefH2M8AHzcj1HVM/of3MSDnkCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxGpevw6OQacUXyZpIHtMKVu626NIMq+qRRpKEjImp4=;
 b=VDQCqIidhEVTujUXYPS4TADP9da493PDtTH4P3R1MXnu75hOIVL2pvFHxfecfrHL78InhkCIwyLzqu9ShUitMT/MrLo/aNlipCLfiemPjiZnMaMOPF5lRRsB3YPM7nRyMgDwvexfBV5s4D8fquPvn1l1oZ/3iSKLHRp5CQKZchbEJhCMyMRU1b46KJX96NScPivls1oN4NAvMHJq0PEwJbmppLy9WxMVL+XfwomqFD4NbXGooHYnwMhdbjbRZLx5Lyb7+gbQKoRqhgezYOD+KOzOqlSY8/9GyK3OPSI8foN9m0AZx2cvpWULAUtvZhMOxyY36njAP+Y1rVy/KdfOdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxGpevw6OQacUXyZpIHtMKVu626NIMq+qRRpKEjImp4=;
 b=V/yVWA5DXnVo9tb4DERccGnx4JajRa5QiuLTl6WOX2SuOgxxxfQvfcxiHO+EpU6nzM4euJaPOS4RfrP8zaFWHR1p7+DH8KpkvcSQzLGvCY8E+DGdTNYY/pukFox1V8wFW2902sxcGCj+VClBOTDKh9TyIIb3L9LkndjBrjIvLkStXI9Ni4kmEP6q/wl7wAiHYRrFmOq9Fqr2X2gzPnI4so6YjWoEmIXrfq1EEeDBXYzequNUSnKz+RJZp+AUqAqYdkCVt5W4L3UyNnDYNhERihBmF+YeIKRQ5WRm1Cm92m0MwFVMTR6iydE1pOmkN0J91c5tMYobJwKsLHn14ylRbw==
Received: from BN9PR03CA0986.namprd03.prod.outlook.com (2603:10b6:408:109::31)
 by MWHPR12MB1728.namprd12.prod.outlook.com (2603:10b6:300:112::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Wed, 3 Nov
 2021 13:52:42 +0000
Received: from BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::96) by BN9PR03CA0986.outlook.office365.com
 (2603:10b6:408:109::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 3 Nov 2021 13:52:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT009.mail.protection.outlook.com (10.13.176.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 13:52:40 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 13:52:40 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 3 Nov 2021 06:52:37 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v2 00/10] Fix kcontrol put callback in Tegra drivers
Date: Wed, 3 Nov 2021 19:22:16 +0530
Message-ID: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cb194c2-e96f-4b86-d1b4-08d99ed13429
X-MS-TrafficTypeDiagnostic: MWHPR12MB1728:
X-Microsoft-Antispam-PRVS: <MWHPR12MB17280A588B155348FE34DCA2A78C9@MWHPR12MB1728.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3TPVgStiv/oCSzfWc4rGZQjlcQQzYkbsYXGaiYMMPVMWOCTP/HKWbau86LX8E4hdQehlICwjjyxodxxUBZO0mOjJJRXNkTXrIUKF8RwUo0k9PZYx96hXNDaxgm27GsuQbY30Q6l7F/uFVLTxHubW2wbYPtcANVk4ZYcLf+xCq3S+irsbE7g/fJ3Vzik/at1+zqQwYyw90F+m8sPcMvcY1g6smPbxX+mnv6Z6Vy6y1yvNDbudMq69AMko0ibR6HCtJT1tsRIdgIRS0Qga/CfOU5IP7tfCx6cXRlOEj0Ul0qylu6Gqi8whDqPySUdnwRIXEcMmYKZSE6L/YeAO5iEYhPlYrdleNPPbGAp9tCOjTRGQNIVa4uH0lWkgsCfdrzCHyWXpGDcU5gEeRfIWrJszVk9TraqKzqw0YtMdwNilHvgeTRyUnpbX9BFhGvj1bHxDOljFFxFVk/QP1elKqjDUrQd4ok+SiZH5+S7CkBZRaps8fAq0VQ9MkVxq+/WwhWEsubbHg0QfJ7gM/aowgWMvs3nMPlmC6kCZhU9MCtL7X5EnkP3fE29d2bJw/oQ9T2eVzrCYQ6WrteRfqtkBGpl/e+1LqrXsgwpdfylIQdJIVi8XLueYKCVJjUkI1q24wrjUSTLanhHaywR4AHdm2cfW8gi5gkhh8UbDFvniqvOjyzfcuOoSQPTQK/jacULncch+mliJUmDKMJUme9k8K3wMqCRG9viCxOfANoFcqWcL3IPHXVMhwNk+am5pHcxcT6xmSUFwS02D2a9Z5d42uBOQTQ==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(82310400003)(316002)(83380400001)(2906002)(54906003)(7636003)(36906005)(6666004)(5660300002)(107886003)(110136005)(356005)(966005)(2616005)(26005)(47076005)(8676002)(36756003)(36860700001)(508600001)(4326008)(336012)(86362001)(426003)(70206006)(70586007)(8936002)(7696005)(186003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 13:52:40.8476 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cb194c2-e96f-4b86-d1b4-08d99ed13429
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1728
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

This idea is suggested by Jaroslav. Similar suggestion came from
Mark during review of series [0] and drivers under this were updated
to return 1, but missed to take care of duplicate updates. This series
updates all concerned drivers to return proper values and duplicate
updates are filtered out. I have added 'Suggested-by" tags accordingly.

[0] https://lore.kernel.org/linux-arm-kernel/20210913142307.GF4283@sirena.org.uk/



Changelog
=========
 v1->v2:
 -------
   * ADMAIF, I2S, DMIC and DSPK drivers updated to take care of
     duplicate updates.
   * Similarly new patches are added for AHUB, MVC, SFC, AMX, ADX
     and Mixer drivers.

Sameer Pujar (10):
  ASoC: tegra: Fix kcontrol put callback in ADMAIF
  ASoC: tegra: Fix kcontrol put callback in I2S
  ASoC: tegra: Fix kcontrol put callback in DMIC
  ASoC: tegra: Fix kcontrol put callback in DSPK
  ASoC: tegra: Fix kcontrol put callback in AHUB
  ASoC: tegra: Fix kcontrol put callback in MVC
  ASoC: tegra: Fix kcontrol put callback in SFC
  ASoC: tegra: Fix kcontrol put callback in AMX
  ASoC: tegra: Fix kcontrol put callback in ADX
  ASoC: tegra: Fix kcontrol put callback in Mixer

 sound/soc/tegra/tegra186_dspk.c   | 33 ++++++++++++++++++++++++++-------
 sound/soc/tegra/tegra210_admaif.c | 23 ++++++++++++++++++-----
 sound/soc/tegra/tegra210_adx.c    |  3 +++
 sound/soc/tegra/tegra210_ahub.c   | 11 +++++++----
 sound/soc/tegra/tegra210_amx.c    |  3 +++
 sound/soc/tegra/tegra210_dmic.c   | 35 +++++++++++++++++++++++++++--------
 sound/soc/tegra/tegra210_i2s.c    | 26 +++++++++++++++++++++++++-
 sound/soc/tegra/tegra210_mixer.c  |  3 +++
 sound/soc/tegra/tegra210_mvc.c    | 18 ++++++++++++++++--
 sound/soc/tegra/tegra210_sfc.c    | 23 +++++++++++++++++------
 10 files changed, 145 insertions(+), 33 deletions(-)

-- 
2.7.4

