Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA8E3F9726
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Aug 2021 11:39:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9F6016D0;
	Fri, 27 Aug 2021 11:38:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9F6016D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630057180;
	bh=iBpPzbqc4JtuCGLn3kDyuMCjPxanvFIKMO8fGnSYLQs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qWlanAkYtp7GSwRysLU6OvXmUVDcdnXm+ByC8wpvR2Ap9FuFVHj1h+WqZg8jWHNyQ
	 PIcQLVOMbR1JCRjOgNx82cZjZ496mpuhrKdVj/CYv+fJh6/umIBpCxE67MvJhL0DsH
	 PP0VXq1cHWiVrciGVmK9pGXIDhDILA7otxWHi1sY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2F88F800FD;
	Fri, 27 Aug 2021 11:38:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 971F2F801D5; Fri, 27 Aug 2021 11:38:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2051.outbound.protection.outlook.com [40.107.95.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4230F800EE
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 11:38:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4230F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="gFcYzlKl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SiUzxqGT6p6UC0xY0vwlGQfh9+GbEw0XiCLk7QfRhLqKNauasBkrFslhoPp7hFpHinEUtlX/YLBYZc1QVdHP44feR4doaTxTTWnCtVqjSNyFd1S3Ysrpr++ttNQ085IfLpRVWyAJE8C30gqnwLcppV/JyrmU7lpji80VN8hOyzLbEPNc6NRW+eNuqd+6iUGUAddHsIbtz0Ge32lHzaaB3leITDP5CQyM1d//uLF/vmeH1SoJo+jf3ZRPIYbz0Dvtu6ZxNAORHTRfDCeTmcX3KkojfDMOJuQd23+Lv9o4G+2i/47y7tO8+Y/EU8qrqzE7tAvn/sjqSJ1MJlvom6S5RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjhy7U70NKjTDqJznE+Jnz0hAzb4F9IvniTmN1Zt5CQ=;
 b=ItAH45A/bo0ru6AJ/f+l8kDttg0JNCdIEnc51tSw/EE9gmjenPFU6Wusmo73F4ulB9wDni5V0FARnJYGNS4AAfknZSMcyhqLOxvl9QGNUPNunsDeFFUvFMEVhhZYtcRMu9tC/9u8aHxbNrEq8gbRGyPT6mhRz8MxDhwYW2fU8JIfhC7VLB9xR0p12R4tqV115ADwiNGhnrgovUyAK2T14yn8CmoRcVU06w1Y8rTf+KZ50ZwrjO+pmHeHLEvge9NB/TNhhk7IVsUcDeoLxyYUp0jOm/5uFFiYD7+HDEH5kAUJVZNfykEghtqCo9/VUcUHVslr3Af92Cmn8IHSeFwmGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjhy7U70NKjTDqJznE+Jnz0hAzb4F9IvniTmN1Zt5CQ=;
 b=gFcYzlKlD6btZ7J2ikBD9tRKU7EHAbtXQ0bNqGyoGadHZ/1CBZKaXxJQPKSvBpaDIusY5Qn9aptNjB0/4Vzj1GAKygNekeuJVjvajOdu3awUNWD4b1GHNPU063be6XiwuAODn7zasXfxQwLVOFT4pu9CAtIsRQ+nrT/C/UJUE/KcXLno7GoDbBhMFXNb43Wl/RjZBmEb4aWQhG9bbcZdwkR3aOiu58Xbp7AB23ZgImYgapmYi/zpyJddaGaYcFIYi+2SMq3N6Dh7iKdbvQZLNT3+Ks8Sz/9+MSS1gu8Ebdle1uoIMAseg/ku7twpND+I7fxWCgyErLAKHia2LNVWFw==
Received: from DM6PR02CA0160.namprd02.prod.outlook.com (2603:10b6:5:332::27)
 by DM5PR1201MB0156.namprd12.prod.outlook.com (2603:10b6:4:59::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Fri, 27 Aug
 2021 09:38:05 +0000
Received: from DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:332:cafe::96) by DM6PR02CA0160.outlook.office365.com
 (2603:10b6:5:332::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Fri, 27 Aug 2021 09:38:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT027.mail.protection.outlook.com (10.13.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 09:38:04 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 27 Aug
 2021 02:38:03 -0700
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 27 Aug 2021 09:37:59 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/13] Extend AHUB audio support for Tegra210 and later
Date: Fri, 27 Aug 2021 15:03:46 +0530
Message-ID: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c21b12bd-903c-4f53-d2e7-08d9693e5e80
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0156:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0156B87FC26A504308E92A4FA7C89@DM5PR1201MB0156.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FPW+pUo/pd+ylTpYtp9uji67OXgPscy28fqAMMdhGojLkHWI5HKi09UdE+hGt41vg+T5RPB+exmb3KyzfL5caJSnbk9+VMz1h2MFmMPdiP4Cmhlo+DG7pYdKr/BjjBXsktUANqfVC0p0riB7estLeGxazvvzXoG0aXtrTok34qU+GsXIBB4uGx/YwyGcdKN4eEbjf6bmwU8hZUteOOWwng2Lbgl+kY36+N3Rk18qZ1erZicm22igYTF7b65XZaqs7DqMZqBS6CuHnFvhrVR1YNqa5vwBx5ibUunC+p3gIhmLRan2LsAOtXsB3LF62/K87SE5sA7VGuxAo7AawBANAg5Wa39dYbG6UqUW4XlfS/AtW+xUFMYz6efjirifaJs+pF/kPNTwzEWSqjAufjNgBh84mNhXKm96ivBrnQyfyxPjSXnIBuGfWUvKd+vv3P9IUgLEE7F7IDgB0PSzuAgbkdX++s6xnNodGv7UpifRQYHJFVJyUvioKD2mSCI6j3VBpPOYRCsEMuY3eoUJhXYscphJ+suGsUjDvE5c5pAvY4wynOX3IOkZdfF6yr3MqtONVPSywpmGJaThmdvm/4Nqk+4pVqpDXpWlPys4MxZj6/lwTsgXFeVpiJIhEew5wcEZqoYJB0Qwt2jGH254b4YsdlI7pLMfjixHeN9ryMJQ1PGsxPvU7hFI5N/VsE6zdDQNfah+V+E/1eyFtBMqPLW3b+tQtUAOV2xOXN02XjiWYW12VYnhp/LbiUF/iZfUJC8wDVfrQRF/UttdQVPRMENHamMInarYYmpKLqA8bQcOVkugNCQuF+YT+F64+B67zNRGCkKQwGngckts9CefM3Bdeg==
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(39860400002)(376002)(36840700001)(46966006)(2616005)(7696005)(7636003)(36860700001)(186003)(70586007)(82740400003)(6666004)(426003)(7416002)(5660300002)(26005)(336012)(107886003)(110136005)(47076005)(54906003)(316002)(4326008)(478600001)(966005)(8936002)(36756003)(356005)(82310400003)(921005)(2906002)(86362001)(8676002)(70206006)(83380400001)(21314003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 09:38:04.2026 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c21b12bd-903c-4f53-d2e7-08d9693e5e80
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0156
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, sharadg@nvidia.com,
 linux-arm-kernel@lists.infradead.org
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

Earlier as part of series [0], support for ADMAIF and I/O modules (such
as I2S, DMIC and DSPK) was added. This series aims at exposing some of
the AHUB internal modules (listed below), which can be used for audio
pre or post processing.

  * SFC (Sampling Frequency Converter)
  * MVC (Master Volume Control)
  * AMX (Audio Multiplexer)
  * ADX (Audio Demultiplexer)
  * Mixer

These modules can be plugged into audio paths and relevant processing
can be done. The MUX routes are extended to allow add or remove above
modules in the path via mixer controls. This is similar to how specific
ADMAIF channels are connected to relevant I/O module instances at the
moment.

Some of these modules can alter PCM parameters. Consider example of
resampler (44.1 -> 48 kHz) in the path.

  aplay(44.1 kHz) -> ADMAIF -> SFC -> (48 kHz) I2S -> (48kHz) Codec

The modules following SFC should be using converted sample rate and DAIs
need to be configured accordingly. The audio-graph driver provides a
mechanism to fixup the new parameters which can be specified in DT for a
given DAI. Then core uses these new values via fixup callback and then
pass it to respective DAIs hw_param() callback. The "convert-rate",
described in [1], property can be used when there is rate conversion in
the audio path. Similarly "convert-channels" can be used when there is
channel conversion in the path. There is no "convert-xxx" property for
sample size conversions. It can be added if necessary.

[0] https://www.lkml.org/lkml/2020/7/21/1357
[1] Documentation/devicetree/bindings/sound/audio-graph-port.yaml 

Sameer Pujar (13):
  ASoC: soc-pcm: Don't reconnect an already active BE
  ASoC: simple-card-utils: Increase maximum DAI links limit to 512
  ASoC: audio-graph: Fixup CPU endpoint hw_params in a BE<->BE link
  ASoC: dt-bindings: tegra: Few more Tegra210 AHUB modules
  ASoC: tegra: Add routes for few AHUB modules
  ASoC: tegra: Add Tegra210 based MVC driver
  ASoC: tegra: Add Tegra210 based SFC driver
  ASoC: tegra: Add Tegra210 based AMX driver
  ASoC: tegra: Add Tegra210 based ADX driver
  ASoC: tegra: Add Tegra210 based Mixer driver
  arm64: defconfig: Enable few Tegra210 based AHUB drivers
  arm64: tegra: Add few AHUB devices for Tegra210 and later
  arm64: tegra: Extend APE audio support on Jetson platforms

 .../bindings/sound/nvidia,tegra210-adx.yaml        |   74 +
 .../bindings/sound/nvidia,tegra210-ahub.yaml       |   20 +
 .../bindings/sound/nvidia,tegra210-amx.yaml        |   72 +
 .../bindings/sound/nvidia,tegra210-mixer.yaml      |   67 +
 .../bindings/sound/nvidia,tegra210-mvc.yaml        |   79 +
 .../bindings/sound/nvidia,tegra210-sfc.yaml        |   76 +
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 1554 ++++++++-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  120 +
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 1493 ++++++++-
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi | 1520 ++++++++-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  116 +
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |  876 +++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  876 +++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   77 +
 arch/arm64/configs/defconfig                       |    5 +
 include/sound/simple_card_utils.h                  |    2 +-
 sound/soc/generic/audio-graph-card.c               |    4 +-
 sound/soc/soc-pcm.c                                |    4 +
 sound/soc/tegra/Kconfig                            |   48 +
 sound/soc/tegra/Makefile                           |   10 +
 sound/soc/tegra/tegra210_adx.c                     |  527 +++
 sound/soc/tegra/tegra210_adx.h                     |   72 +
 sound/soc/tegra/tegra210_ahub.c                    |  511 ++-
 sound/soc/tegra/tegra210_amx.c                     |  595 ++++
 sound/soc/tegra/tegra210_amx.h                     |   93 +
 sound/soc/tegra/tegra210_mixer.c                   |  667 ++++
 sound/soc/tegra/tegra210_mixer.h                   |  100 +
 sound/soc/tegra/tegra210_mvc.c                     |  629 ++++
 sound/soc/tegra/tegra210_mvc.h                     |  117 +
 sound/soc/tegra/tegra210_sfc.c                     | 3542 ++++++++++++++++++++
 sound/soc/tegra/tegra210_sfc.h                     |   78 +
 31 files changed, 13601 insertions(+), 423 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-mixer.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-mvc.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-sfc.yaml
 create mode 100644 sound/soc/tegra/tegra210_adx.c
 create mode 100644 sound/soc/tegra/tegra210_adx.h
 create mode 100644 sound/soc/tegra/tegra210_amx.c
 create mode 100644 sound/soc/tegra/tegra210_amx.h
 create mode 100644 sound/soc/tegra/tegra210_mixer.c
 create mode 100644 sound/soc/tegra/tegra210_mixer.h
 create mode 100644 sound/soc/tegra/tegra210_mvc.c
 create mode 100644 sound/soc/tegra/tegra210_mvc.h
 create mode 100644 sound/soc/tegra/tegra210_sfc.c
 create mode 100644 sound/soc/tegra/tegra210_sfc.h

-- 
2.7.4

