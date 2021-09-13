Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B3D4099C2
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 18:44:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E8A017AC;
	Mon, 13 Sep 2021 18:43:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E8A017AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631551455;
	bh=dFsmG/qyvjRwRJF0fMT674H7hdeN4HZzMrmHLW50VwY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PdXJyJq1/JQ+BvHTmfFn/SNKrlAjBjvRQz/4BRNeo/u07Q4lowsKYo3kAaURkQcXZ
	 xJ3nIN7+qPf2bhzGoF5VGapp8tgX0JEAs2sRckNszBLZKQspDyehdEl4sN/AysD6d2
	 eXioABMzIhhucmSyKWL2ksvCFbH1PlfKEdYaCEWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7B84F802E8;
	Mon, 13 Sep 2021 18:42:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52C00F8027C; Mon, 13 Sep 2021 18:42:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4FD2F80169
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 18:42:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4FD2F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="nb3xkboU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QwwKtUHAfiZS+pu55/j6zepd2dC18A8dnZBha5iB/eAmBzSQOdU8jtaD5MWvBg8FcdC7HGQKyTvnf6QuFYSa5A22tD/yoozXgwuSeFFb74um3R+VIAoYvxwJbl5aUHDG7pKmzh6qsj6oCej+a9jAbThfSmbgU8u2p2e1Q+nWSQLVQw3+zdHJHFxvAEaGBXPINzPU0FhCdSlcj1P7NGKjtXmeSmVvEByUSn+zkNbarW6F+3DkiMuWC4+vMEBO70VJPvl/yKx1YsH/yjPbgk3fxE4BlhTz6Wr/LODqytg9vpCmM1hzY3Oy+jD7liYdBICsx34uNzrD8PuNUuruZyyBcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Y24GIzHycxe8CiX91vmuqVr/0cXOQ3faa/wvaD8XkpQ=;
 b=gxz8qH0dxA0OxM5iwfVb2+yqyAQ2pJLjYnrMqniia9oQLVFcwhkzsrK9bZ9iDtfex72RI3zATzTdQ+IqEoJ7QxK+Oz3sQqzVeqRR439Ufnw3BHXKHjxyVGKgDvIj1cIPyp3ird2OK6ZndQ4pOb2WCm90r5WGvKYaqbdsE69af74XXe1J8zgSM9/Q43JHJWj8wYN35s++EgE6Uctxs4L60AxN2UVay04ImQbk7Yx6HBx3Kofgh9B3S0Oha0GY3478X15xN5WrAdyUYOm8uaDwAWH+4xRwoqaisSXpSw57yXMHNW6b6ZQB6s+d8kSZ+xihy9i82pSlEDRRvNYcs6zqKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y24GIzHycxe8CiX91vmuqVr/0cXOQ3faa/wvaD8XkpQ=;
 b=nb3xkboUBC7WxeITQSVyldq+RoWAJ2npkGeL2MQ8MUPx64qHAjn3FkJczcEsnBj3Gl8HLye93NfWgPaptNvInC9iwgDpNZrpRx21YDYtZu6JM7w53BosYRQrODU1U+eVzG+YJqiHgjuVHGoY2q0WaQq0YktM/oHfaLr9UBJuaaUpnf6hkbe+iXtwJAwHRFbxGErkXqERXnzZZncjO1JiqkA87aEuGdvPRydvqbctqBYjtS8o2pZiAgdVDKYVLxeyTTGfQdT1AM/28XBQe8k5P3naOThdZ/T6lt5LOuE3E4zkrKwvs8I/uMvOT5ig/x3f6c9aKewxladXtzyhloYd+w==
Received: from DM5PR21CA0022.namprd21.prod.outlook.com (2603:10b6:3:ac::32) by
 BYAPR12MB2663.namprd12.prod.outlook.com (2603:10b6:a03:72::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.20; Mon, 13 Sep 2021 16:42:43 +0000
Received: from DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ac:cafe::ef) by DM5PR21CA0022.outlook.office365.com
 (2603:10b6:3:ac::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.1 via Frontend
 Transport; Mon, 13 Sep 2021 16:42:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT032.mail.protection.outlook.com (10.13.173.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 16:42:43 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 13 Sep
 2021 09:42:42 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 13 Sep
 2021 16:42:42 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 13 Sep 2021 16:42:38 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 00/13] Extend AHUB audio support for Tegra210 and later
Date: Mon, 13 Sep 2021 22:12:08 +0530
Message-ID: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ec0df9e-0139-43b5-61dc-08d976d58244
X-MS-TrafficTypeDiagnostic: BYAPR12MB2663:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2663D989D838F68D5264A847A7D99@BYAPR12MB2663.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JRWORCnXtULT4Uiv+jSnxbLnvKMoMa3YDNHVpjqYfEvF6W1hCSP37r9gXDtzbM6VMRtfHPRyYFJFX3xX94ZvuWEFzu0QEHfSYRSXGPnmmNVWA+dW0nUgm517fdJbMNfdIxRbynoKVoZhibZXKRlRY84Mb0fFk/7l+ut13KtPu5iXuHNURnrZJAVQFScTNsj1xvLG2p2yY11jOiZVDPHTWb+7PEPMkXwbDPRrzE4CbgX36mlaYWDKHq60w8ITErfrDF9R4aEFDK8EPawze1Lz6pVzTnw++flZJ1GMbfSEy3J87zCKJ2hRGs04vNCm29UTVm4iu24Yzzkjpku8qTkl57yPVwqtqxrgEGt1w+hB1EMYvyCDsDD7irlw+Y/YxUpRhDGyhQ9t3bV9zEdrmLooYHMCMTruTKvyWgKG3DEs9MyI23bWuQ2KlKRFxf4cjpk72AQ3Qn/Nvj3Iy7C/keVEU/G6y+nzDy74o/VUhZy32splO5dUfpwhi8mxojtHQHWORZ+SrxYv80gbY+RCocUrp8EzDbCMrhA1mLCZgHpNtCYYA5Se2gx5S7Npapf3M/FbPDxIBKF1npuva53S4v9LU1NIpCpqVkV5mpxsxkFRS+0QdVL0mEH3MWYf+gllWtyI0NKwTyrInOfBWVksJu7hKUBCC4pylwJsJRJ+df0R8YCEmjSh6/vXR3qsrxiIaVBaA+A/KqTIDgRfvoqNr9y4kAmetvhL5q3TMRgJx9piDEdkwSKjMgrivxx7KM3jE5f8CfvLXQ4KGsCqVZA5YlhwLKU7IZDAQHf7JBKSSkexeCXoBVNbGJPMu7XtmMsBwQ1eseezy0zgFwdPUp9fpQopNQ==
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(356005)(82310400003)(8676002)(70586007)(508600001)(107886003)(6666004)(86362001)(5660300002)(47076005)(316002)(110136005)(26005)(7696005)(2906002)(336012)(36860700001)(966005)(426003)(54906003)(36756003)(2616005)(921005)(186003)(83380400001)(7636003)(7416002)(70206006)(4326008)(8936002)(21314003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 16:42:43.4027 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec0df9e-0139-43b5-61dc-08d976d58244
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2663
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


Changelog
=========

v1 -> v2
--------
 * Put comments for soft reset application in the drivers.
 * Split out mute/volume control logic in put() calls of MVC driver and
   use separate callbacks for the respective kcontrols.
 * Update kcontrol put() callback in MVC driver to return 1 whenever
   there is change. Similar change is done in other drivers too.
 * Use name-prefix.yaml reference for the driver documentation now.
 * Add sound-name-prefix pattern for MIXER driver and use prefix
   accordingly in DT.

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

 .../bindings/sound/nvidia,tegra210-adx.yaml        |   76 +
 .../bindings/sound/nvidia,tegra210-ahub.yaml       |   20 +
 .../bindings/sound/nvidia,tegra210-amx.yaml        |   76 +
 .../bindings/sound/nvidia,tegra210-mixer.yaml      |   74 +
 .../bindings/sound/nvidia,tegra210-mvc.yaml        |   76 +
 .../bindings/sound/nvidia,tegra210-sfc.yaml        |   73 +
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 1554 ++++++++-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  120 +
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 1493 +++++++-
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
 sound/soc/tegra/tegra210_adx.c                     |  531 +++
 sound/soc/tegra/tegra210_adx.h                     |   72 +
 sound/soc/tegra/tegra210_ahub.c                    |  511 ++-
 sound/soc/tegra/tegra210_amx.c                     |  600 ++++
 sound/soc/tegra/tegra210_amx.h                     |   93 +
 sound/soc/tegra/tegra210_mixer.c                   |  674 ++++
 sound/soc/tegra/tegra210_mixer.h                   |  100 +
 sound/soc/tegra/tegra210_mvc.c                     |  645 ++++
 sound/soc/tegra/tegra210_mvc.h                     |  117 +
 sound/soc/tegra/tegra210_sfc.c                     | 3549 ++++++++++++++++++++
 sound/soc/tegra/tegra210_sfc.h                     |   78 +
 31 files changed, 13647 insertions(+), 423 deletions(-)
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

