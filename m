Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB5C73E134
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 15:56:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94F7B86E;
	Mon, 26 Jun 2023 15:55:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94F7B86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687787784;
	bh=P0bmN+dohT4DPk43U1/JZN4bv0ctbdw/YPucNN0bUnM=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hFAYJsbQeI90V1Zqtz7MUFR5WY5RaXd0xSVPOiY30QdHkO9t75K6U5URJHl4jI8w6
	 ULIFJmtnlpQ7B8Q3qaRNxU4V8tpCZXFHTELXjjmdNUQ9Qxe5/ElGd7E2xkSCV40/is
	 pd50m4x2N487vLm3GAVzDXMOCPock2pZAZgvmef8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63FF1F80093; Mon, 26 Jun 2023 15:55:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BEBBF80246;
	Mon, 26 Jun 2023 15:55:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3ED3AF8027B; Mon, 26 Jun 2023 15:55:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E85F8F80246
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 15:55:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E85F8F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=yYJ4wBh1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZ9u7Rj7q6A/LbL5eYmmeQ+/6MW5nJ20Qk1fWRl4gAZlFM3qX06KE8IiNB1H8pUbzK5sCjvooBHZSm786xQG9bFKUBS6K67QbHRfyICX1r+DxUHw9CmiNSlFKmSu+Pl2r36JOB0H4LdjayUWTOlNMoTO28Dlr+47e4Wz5R6BXiEN2j8zlNPSH5FUuR0Hea3h0tOz84TRAHocFyt+tvf5gBN2jH7cF8bFTKVHasRudmFqPYKZhKVpw/Mx+e6JW0oBM99c9pXFt4ZwP0fER5g5cTry6c+btQQ4ZpoUzKPIjefJ9YriCq8nnn+IsnGDGxYFXRLFx8Mmo5Md4BJVzYGA6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xmHdt6WKkokG5lkpNyHRdPOKNSpXguLssLnZ1v2M4s=;
 b=cVDX8mFQ2G7dztBNWi5UhdDq6zRqvWs9Co3zhgZWscUmrHbgVw8l4J3+oEaUqHe4EK49J7MPieA1/4M6EWm8hWBIDQxjeAS59quUxnaFVmj9LEqoN6i2n0dphcu+7q0RdNssSZy70sAVO2FnNMU36eofpJmlygaAxMVIRxVz8lfz9KaOXFOq2BmheFPuXaT0QCA+jgntabll0nuaqy2ZlauvoHtYII49cGMYa++kxlzqM43wK3OhZLbPZ7yr/Y/XhkmvLjJNq92JTLwSiIjezBasJ37qwYepX2lLSFm3/FqSNEd8MsQYW6i/29vaXalTs9y1p1yYJC/j3ap43USMQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xmHdt6WKkokG5lkpNyHRdPOKNSpXguLssLnZ1v2M4s=;
 b=yYJ4wBh1M8DXE2UAE+Lxpi/xeUG5uL4b9jV5ipI/ww/LhR6JT4pZrGm+U/iM8f17EPusLfWMIy2hFRGMFY1OoB9uw4Pg7FIa0QlTbXStUVsnPUs0/vY52Sb8vjyLHYE/d+mOz2RLVfUhk5f5nlWzq3FfWjSyVD6fFhufiNe4nyg=
Received: from BN1PR12CA0015.namprd12.prod.outlook.com (2603:10b6:408:e1::20)
 by CH0PR12MB5154.namprd12.prod.outlook.com (2603:10b6:610:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Mon, 26 Jun
 2023 13:55:18 +0000
Received: from BN8NAM11FT114.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e1:cafe::f2) by BN1PR12CA0015.outlook.office365.com
 (2603:10b6:408:e1::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.33 via Frontend
 Transport; Mon, 26 Jun 2023 13:55:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT114.mail.protection.outlook.com (10.13.177.46) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.47 via Frontend Transport; Mon, 26 Jun 2023 13:55:18 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 26 Jun
 2023 08:55:18 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 26 Jun
 2023 08:55:18 -0500
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Mon, 26 Jun 2023 08:55:15 -0500
From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>
Subject: [PATCH v2 00/10] Refactor acp legacy driver and add
Date: Mon, 26 Jun 2023 19:25:04 +0530
Message-ID: <20230626135515.1252063-1-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT114:EE_|CH0PR12MB5154:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c0aa98c-aec5-4bc5-cd6b-08db764cfa01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ooBMA1T21Jni61K7RXTvwYzA5BEblpp4bHyHlp+7vWbJxQD0Vs6zvu5iReGLhi9nl7Xbk1QKKpDJ7J69fq05jRZycY1ENZjM9tlUJrWXD6YeviSDtpTa1l4aYcxH8iMkvITz3LrDerYbgatjx4R+J3EG92+vITyHn44aufCNe43AmQH6HlPwpisp6hTfRgs6zq4usB20shKo64Kl+3Iv21PhPZadAit9lHyG8sO9CixMWiIzfv9bF5ZyA9IqaZwbTjBwe1ZjJtza/qx6knjRtaXYw+KWJY8yuxGWn+kfvguGLi6/rjI4QWH5vBxvw8bwfWRrukKMttCDMosgxL67bNl+J6zfq/7xeR0W4aUHPFCnCVOIYLdfmBc3dGcetKBV/NCSvfbeBXFhf7Uuvp022/iaNmfqHyULafTV3PHs9e5HmviTWNX9QNCGGmtSVE62vLoahdZO7Zg/x0W8VHhUEeLqvDInsdEa2Krv0xyUtsmFudHgHaWZX3d3g8q+OZ99WZmuNonlfB6JglaeHNBs4B3gPy20EQJs5ykmbNxQweF+InLWGzTt2TGVMkLd9amvlXIvV+FQWybyRnPeZjk4sS3TxsS36Hx6pqInxsYhsCbmBma6XvgqkIEW8MfLD37cfngUP6/mD6qvMK/hPS70TJKNcjlBBtdnIlBq0rbfeY0AMe0+3YOXswyesO3hyK0wNpCy0k6uti+FrsjBVlcHq9o06zo2Y3CD3N9qObe2Gv2PzPfXwzXzt/Z8KWVTLYy3xt5vX81KmMVyWUSJTHqeZQ==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199021)(36840700001)(46966006)(40470700004)(110136005)(7696005)(6666004)(478600001)(54906003)(2906002)(26005)(186003)(1076003)(82310400005)(316002)(70206006)(8676002)(41300700001)(5660300002)(70586007)(8936002)(81166007)(356005)(36756003)(4326008)(40460700003)(82740400003)(86362001)(36860700001)(47076005)(83380400001)(40480700001)(336012)(426003)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 13:55:18.6602
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5c0aa98c-aec5-4bc5-cd6b-08db764cfa01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT114.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5154
Message-ID-Hash: HR5XK6P3Y4LIYVHJSLRMU55BEAIQMMQC
X-Message-ID-Hash: HR5XK6P3Y4LIYVHJSLRMU55BEAIQMMQC
X-MailFrom: Syed.SabaKareem@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HR5XK6P3Y4LIYVHJSLRMU55BEAIQMMQC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series to refactor acp leagacy driver and add pm ops
support for rembrandt platforms.

Changes since V1
   - Fix below kernel test robot errors and warnings

	- ld.lld: error: undefined symbol: acp_enable_interrupts
	- referenced by acp-renoir.c:191 (sound/soc/amd/acp/acp-renoir.c:191)
	- ld.lld: error: undefined symbol: acp_disable_interrupts
	- sound/soc/amd/acp/acp-renoir.o:(renoir_audio_remove) in archive vmlinux.a
 
	- All warnings (new ones prefixed by >>):
	- sound/soc/amd/acp/acp-rembrandt.c:169:5: warning: no previous
	- prototype for 'acp6x_master_clock_generate' [-Wmissing-prototypes]
	- 169 | int acp6x_master_clock_generate(struct device *dev)

Syed Saba Kareem (10):
  ASoC: amd: acp: refactor the acp init and de-init sequence
  ASoC: amd: acp: add acp i2s master clock generation for rembrandt
    platform
  ASoC: amd: acp: remove the redundant acp enable/disable interrupts
    functions
  ASoC: amd: acp: store platform device reference created in pci probe
    call
  ASoC: amd: acp: add pm ops support for acp pci driver
  ASoC: amd: acp: store xfer_resolution of the stream
  ASoC: amd: acp: export config_acp_dma() and config_pte_for_stream()
    symbols
  ASoC: amd: acp: store the pdm stream channel mask
  ASoC: amd: acp: move pdm macros to common header file
  ASoC: amd: acp: add pm ops support for rembrandt platform

 sound/soc/amd/acp/Kconfig             |   5 +
 sound/soc/amd/acp/Makefile            |   2 +
 sound/soc/amd/acp/acp-i2s.c           |   2 +
 sound/soc/amd/acp/acp-legacy-common.c | 347 ++++++++++++++++++++++++++
 sound/soc/amd/acp/acp-pci.c           |  57 ++++-
 sound/soc/amd/acp/acp-pdm.c           |  13 +-
 sound/soc/amd/acp/acp-platform.c      |   6 +-
 sound/soc/amd/acp/acp-rembrandt.c     | 186 +++++---------
 sound/soc/amd/acp/acp-renoir.c        | 115 +--------
 sound/soc/amd/acp/amd.h               |  51 ++++
 10 files changed, 531 insertions(+), 253 deletions(-)
 create mode 100644 sound/soc/amd/acp/acp-legacy-common.c

-- 
2.25.1

