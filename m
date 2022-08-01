Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D95586E4C
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 18:09:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FDA885D;
	Mon,  1 Aug 2022 18:08:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FDA885D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659370156;
	bh=i1UETo8NHsUKHWVAZL1XRC4GfRCy1c2tr0QG4/k02ag=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Tp7AtTF1hRqc6cIIuFradUqBt7mXoGocf4VH/cG6TbfvfbQOBPi63RW0s5WKb6ZP0
	 bg8eK5yQz+yW6G+pgRPqaDNKuIhasQrLhHiyBYMLR/Cm1verBprDirV4R81oU7Z8BJ
	 4IoTBcmgxHXhDA3E3RHEqSfqXVJtgtH3N02QpnkE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D94AEF8014B;
	Mon,  1 Aug 2022 18:08:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51C78F8023B; Mon,  1 Aug 2022 18:08:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF2FAF80139
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 18:08:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF2FAF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="kGbHbHV5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxRyMKWIhxgNYaoIFOHxbOkKKiB31nsrF394MhdeW4+dfyUe1uE2uxs/1CV5cy4ve+8VPsat55iOh0e/9SNI9obidNKloPoonSHLhuytRoa5Za3xDni4r8fu/APmC6reHPXnEivexaYxlo6v3k7YH+5UBtKsqJXqFtdohNpcX6uWmivY+NTaNoQJQZc385zqT0PALSNxraCNgyHJUs25uNfx9FFWPN5ATO318RfmBnkNLpGr9R0XSKwayed2tImGnX8d5rWAwI25FISreTZ/28SkkPDHuSE96UvZ5w8Zfxh5dMaW9t1kM7tO9u66X+TiSnH6M5eEV1KlskEcpDk0dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihmimuOvhmFJpa30MFHQQoKzRcLaE88/5uXq1XikdTo=;
 b=CVVU9mchN4i/hugE2Ln8CGIyZTDLZDT1M354yK6XJyqTvLVl9jBitFM6tkWXG2RlqZCYusHb5ze2Qwqek08JRNSH0nUtDXATYf74QgJUPwA8x8JZaBUKWO7iy8NsO7wTIXF/05SAdctrzPun5mwPC/WHZqG0E/ip4D1IrfADmyMZ7OrMyA0Y+d9fdAofDkScGiyBVQ0/9Hb6vgSw9/3Wm7RYfowP/NSNpiMuqJ7FENmUiO/jzKWpaw3zmJ8rroTwRhCQ6SuKBHodElAu+TQ7uzA4htLuEKooFbJIXUfRArzpcLNP3OhxCAVfApEgD6j+kDEsX6pLteInvMaJp8+svA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=renesas.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihmimuOvhmFJpa30MFHQQoKzRcLaE88/5uXq1XikdTo=;
 b=kGbHbHV5DlW0MhJ3WPZfngAmdMH+mQ7WcpoFM0MrLdPoTlEopvWEkz+eGkbcvbU2+wDRH747HwOl/oxb+yHJE9mmSr9sx1rEquIZBqBfpjFSKxtF3+FVf2tcpCM/iJetOOocOsKXV4EVpMLTWzFcgcxYHm08XwB6q6ruL51TWD3clXDMRORlKGSxmx3QIX30l9fpLDhYw6L63NI05qdy7VV3/VggTxKk3zqLA5aj8Q8YpjtVu72tVoW63lqQJJdpd9s8vAuNMC6drNKvysaziOol5M+fHAGwEENTKuAGPxNt582FjuoWcJNBTNp646Mn190hHzO4H5c//B2eokdLvw==
Received: from BN9PR03CA0101.namprd03.prod.outlook.com (2603:10b6:408:fd::16)
 by BN8PR12MB3409.namprd12.prod.outlook.com (2603:10b6:408:46::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Mon, 1 Aug
 2022 16:08:08 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fd:cafe::72) by BN9PR03CA0101.outlook.office365.com
 (2603:10b6:408:fd::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14 via Frontend
 Transport; Mon, 1 Aug 2022 16:08:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5482.10 via Frontend Transport; Mon, 1 Aug 2022 16:08:08 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL109.nvidia.com (10.27.9.19) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Mon, 1 Aug 2022 16:08:07 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Mon, 1 Aug 2022 09:08:06 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Mon, 1 Aug 2022 09:08:04 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 0/3] DT binding for sample format conversion
Date: Mon, 1 Aug 2022 21:37:29 +0530
Message-ID: <1659370052-18966-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90ef133c-58fd-4476-b6fc-08da73d8065d
X-MS-TrafficTypeDiagnostic: BN8PR12MB3409:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fw8qK1yYj39IEwaTlKnHXyZmrt6Ek/5JVr0cVrTfKDziooYmmDjaSLWW35EUrztRyfPAmiKcEF7itEbpqKEW9it9/Ax7MJXFp9XMYQsKtmEsyneLM4cqDcXZOTmrckrALwMbG9r9x8x28BSlNg6bYuU0aUhiOtro/fn+hdLGCAsktGhcKsXp1fBOfjwg4G3Ga2E9cAvDH2U0hjB9ecpxIOzZ5U20dVphLe8NvBeSfXOoCgnIfAt1lqlpm6BBUUvLJUBiiVdIUGa73rx5JNx2vUGfHpJapw2gnEx0jJwxeEzCaz6lIEOPWhq9jI7YPRGB2TJqft36XerhuljW9vv6UiXsgjwMQYfdKyoF2OHjyvWvwa/0PBLUT5ncwe3d+q/5IH09GwNTpglpf2gkoABEDE/NBFrjPiEJDG/CA3ipWoSYa0kBVdYfmXrgz2R+LOaKw6lJaztg3Ro3kQ1O2wT7oz/umw7Q24t0e/4ZNNWLQvncP7xtb4KeW6BPVXMuyOGWVEkSoX0LFGFU9L0BIic5OoC19ZseA8h1fCJLzT3yxURHM8Ll6jOQfHfZauQ6cY+jCgJBsHXtsaSSpBz3VokiLVtajC4pYOcb5uU38pqW/tvatLujAKzO8lJDQsWAOKjHSz05IO+ziKKJRrwdN2EfSNXEdd45D+q9JhXVDrPuy+Ubz2tMSXrc+CZ8sqRogopW3mNlTxY3ShNVbbZZpbCc53kpwWEp9dDOFfxp7wqNIspvLFwTfP/l8JanFaPQPNWeLqzHX+FkrMk1hGi2thdMgYSNgNimgKkgN/m1a3sYGZMxssNwb0KHpSYofDZgRmp/Nsd96mJ8g2co1KdqFuhAXw==
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(39860400002)(136003)(376002)(46966006)(40470700004)(36840700001)(107886003)(186003)(336012)(2616005)(426003)(47076005)(7696005)(86362001)(6666004)(40460700003)(41300700001)(2906002)(26005)(82310400005)(36860700001)(83380400001)(356005)(82740400003)(110136005)(81166007)(5660300002)(36756003)(316002)(7416002)(70586007)(70206006)(40480700001)(4326008)(8936002)(8676002)(54906003)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 16:08:08.1406 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ef133c-58fd-4476-b6fc-08da73d8065d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3409
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

Changelog:
==========
  v1->v2:
  -------
    * Move DAI params properties to a new schema and re-use this
      for simple-card and audio-graph-card.
    * Use string type for DAI format binding as suggested by
      Krzysztof.

Sameer Pujar (3):
  ASoC: dt-bindings: Add schema for common DAI params
  ASoC: dt-bindings: Add sample format conversion
  ASoC: simple-card-utils: Fixup DAI sample format

 .../bindings/sound/audio-graph-port.yaml           | 17 +++++-----
 .../devicetree/bindings/sound/audio-graph.yaml     |  9 ++---
 .../devicetree/bindings/sound/dai-params.yaml      | 38 ++++++++++++++++++++++
 .../devicetree/bindings/sound/simple-card.yaml     | 20 +++++-------
 include/sound/simple_card_utils.h                  |  1 +
 sound/soc/generic/simple-card-utils.c              | 34 +++++++++++++++++++
 6 files changed, 95 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/dai-params.yaml

-- 
2.7.4

