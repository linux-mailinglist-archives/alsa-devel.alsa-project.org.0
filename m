Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62499891549
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Mar 2024 09:57:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCBAD2C86;
	Fri, 29 Mar 2024 09:57:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCBAD2C86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711702675;
	bh=elK9dPQh82rKrjqcskRYGcWphIglW3mh3olZxurtHTM=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=A3V4EF1G0Uu2dtKn65GHSFa6jFpreTtGVA74+9HkpDwCumC30Rr+R8hpo/Mlm9Dfu
	 LZNg/74p03Yts1tOlXdJ43JFqbb6/gEvrQEkfEQcztN1kGuVqmYJPjvyC2k1KL6yCY
	 2jo3jjqCkCcmnRrhz941m2CFDUJZJnMHesD0URKA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 119C3F802DB; Fri, 29 Mar 2024 09:57:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9578F805A0;
	Fri, 29 Mar 2024 09:57:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D313F80563; Fri, 29 Mar 2024 09:54:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07CD4F80093
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 09:54:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07CD4F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=FpBGnWAC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hpmraq3d+2Cr/6KqBkcbZO4iIKHkOtMze4gq/czpA47mbnnt5KoFzvcrGBNMpE414x/9HKZvQZBBiUzsyGk6L4e/j7jVR2vbzApGT1iAR0iwIUTCmZA+541vGI58GxCEVp0vHoVz0zUPH0dpI1Uv/11NnmS+26PL+GDyzUbdBGONbNy0MpfqJyFcrRD099vW1L/sKUZL0u1jgAahQgXMZTku/hwnWwAt7au0RYwKJwxPhpfKsf7oC0bnhci7LSN4wmhavbL6Sw5tx6zw7goIqLbCjva+dG864YOo4QHJ9d3Y9J3sWbLSJ0iyGtjmXGUhT6cCvR9BEKTLr1Ro/xlVhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/cr16lwQLz3Sgrz63Rg8aRYwNOwAWjC8jzIZXsvJ2M=;
 b=YUGLVR0ZtY0EwWQ4z00F/TByVY45rEVNSVV1wnfyhIsFK76YqoJoulm7gUvDrbqPW3fqtRyXdtq0NcEEzOl/xjH5jUNBC8/Ovx6OMsyW+syRdoMa7tjL/bb7sQGrjUOudRy8wGqF3mm98t2/jgHTw5eTWZSBnCBx60vEASnU1gPNJ4DsCM4TA6XzkGBLMt6FrGASOoY4heLLV+e/BF9XJdW59l7fUqbMahPF3sgc3qvSUnqWPMP7ETk43TWos5bh39OnQ6/wEQ5k5/CfhmDlNxynCeAVRaugqRN4akzAuuvAxNVAWfxfowPgB6NVvvp7euzJidGXR+d5fMITMfz2tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/cr16lwQLz3Sgrz63Rg8aRYwNOwAWjC8jzIZXsvJ2M=;
 b=FpBGnWAC6X+SWDxcsjHGs5huo7oCe/UVO/Z4dxaHnPJbeK0P9nmD434akCCtLrv4w3QEl3S6IiVbi6weNFjGaqKZF4/MI9htx8rCajlAjrjap8QpTfpxVEz1xhIZSHOM+aSYBrd6Xbsj6Uv9id2iCHbrOdWOdafSr2Kb/jYDx9M=
Received: from PS1PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:300:75::20) by TYSPR03MB8630.apcprd03.prod.outlook.com
 (2603:1096:405:8b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Fri, 29 Mar
 2024 08:54:10 +0000
Received: from HK2PEPF00006FB3.apcprd02.prod.outlook.com
 (2603:1096:300:75:cafe::84) by PS1PR01CA0008.outlook.office365.com
 (2603:1096:300:75::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.40 via Frontend
 Transport; Fri, 29 Mar 2024 08:54:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS02.nuvoton.com; pr=C
Received: from NTHCCAS02.nuvoton.com (175.98.123.7) by
 HK2PEPF00006FB3.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Fri, 29 Mar 2024 08:54:09 +0000
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Fri, 29 Mar
 2024 16:54:08 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 29 Mar 2024 16:54:08 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
	<robh+dt@kernel.org>, <conor+dt@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <YHCHuang@nuvoton.com>, <KCHSU0@nuvoton.com>,
	<CTLIN0@nuvoton.com>, <SJLIN0@nuvoton.com>, <wtli@nuvoton.com>,
	<scott6986@gmail.com>, <supercraig0719@gmail.com>, <dardar923@gmail.com>
Subject: [PATCH v6 0/2] ASoC: nau8325: Modify driver code and dtschema.
Date: Fri, 29 Mar 2024 16:54:00 +0800
Message-ID: <20240329085402.3424749-1-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB3:EE_|TYSPR03MB8630:EE_
X-MS-Office365-Filtering-Correlation-Id: e94dcb8d-2ea4-4b18-1db9-08dc4fcdcc77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8ogltWQ7XP8WYJed0vuNY7Fay71WiaNbnqcfy5MGoQNyGbhcLy+A9URvEXJvFQ6Xp22pqE6clpLD0OqECesaouuNE+LgwjLE7cM4NSldImOdLP8mCPry0IlXczKriVEvUr1E8dUfgBBeStl+a3gme+R1v1NH59bIUpfSwAvlO4BO54cclttwh7z7viG9EyrnSb6I8yZl9SsPXsLacSnk2TeeMFt+G+6gOmk7tkIOTxv/iXQlmDe/f2W8C2uzgKV59JFH4dGgsNSdT7ykxzHwhm45HwAkIWjPad3KJJvb8Nsc47u5z5SuuvJ823UGvRw1IFHKEdQeWRZZTITIfWMczeZ2qZOUA5lr+Aj/dEKqR5oRAJp2FuwPGupdDMh90dCrIiwNlJCl8Nr2QX2TXwEXdr13nwFY3rSeJQLqSgz+BHbPck5vcUpn7bP+HmrJrNuBYZggnqQhPHVW+izyKRh68fO19fGHdQ49DT5vjj8ZjxGLg8biN4G6yIOKMMkYItiBdOgCcnh4yAtViaeHQuANT+ZHndWD1t30DR+uSCuVsbhZzBpCq/tYKN5GBDnuHdfWAqg28JGctaNOHOw5J0XjBpkFnY2hM0CjFClDVoopMY91dAc6S6DKgw7uEv2AlWLXr9uPr7SYuAsGJLQ36KvUUNDoyONA5R7fO5OtZQNlkyvsb/jdBq4qBzndg6BG/Sr/PIR+ZVU9HItmPJROk8eyS/JaD5TvM4Pa+8oXHPMIM4ZcIHVoA3iXn+w426cJRS1y
X-Forefront-Antispam-Report: 
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS02.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230031)(7416005)(376005)(36860700004)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 08:54:09.6703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e94dcb8d-2ea4-4b18-1db9-08dc4fcdcc77
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS02.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HK2PEPF00006FB3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8630
Message-ID-Hash: FZDDO325INJ2S2DEEAANRS3LQMVABBFS
X-Message-ID-Hash: FZDDO325INJ2S2DEEAANRS3LQMVABBFS
X-MailFrom: WTLI@nuvoton.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Revise properties description and use standard units in dtschema.
The unit conversion driver based on the attribute must also be
changed accordingly.

Change:
V1 -> V2:
- Revise the driver description part for the C++ comment.
- In the nau8325_clkdet_put function, modify the max variable to hard code.
- Removed "Clock Detection" switch control.
- modify the "ALC Enable" switch name.
- Revise the dtschema for "nuvoton,dac-vref".

V2 -> V3:
- Properties use standard unit suffixes.
- Modify the enum definition.
- Driver code should be used dev_dbg().

V3 -> V4:
- Properties use standard unit suffixes.
- Modify the enum definition.

V4 -> V5:
- Properties use standard unit suffixes for vref-impedance and dac-vref.
- Revise the enum definition.
- Modify the code related to properties usage in the NAU8325 codec driver.
- Re-arrange header files in alphabetical order.

V5 -> V6:
- Revise the nau8325_dac_oversampl_enum structure definition.

Seven Lee (2):
  ASoC: dt-bindings: Added schema for "nuvoton,nau8325"
  ASoC: nau8325: new driver

 .../bindings/sound/nuvoton,nau8325.yaml       |  80 ++
 sound/soc/codecs/nau8325.c                    | 900 ++++++++++++++++++
 sound/soc/codecs/nau8325.h                    | 391 ++++++++
 3 files changed, 1371 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml
 create mode 100644 sound/soc/codecs/nau8325.c
 create mode 100644 sound/soc/codecs/nau8325.h

-- 
2.25.1

