Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD4B8A2C91
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Apr 2024 12:39:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B1E72BC7;
	Fri, 12 Apr 2024 12:38:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B1E72BC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712918341;
	bh=6S416KwxLfCtEeZ6OyMeopnp0v2WlooLPqk1tgImJgE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZXY9EmcL+41B+N+tzj2jvKjS0G7Ak1BqJZIJL5zDV6Sbhi4VRBxBFqe0RCbv8aK5r
	 Of5LFGqfVn4IN/ltxJb7Z3u3LMgxAEK/pUmXCPdpMyiZgscq/n/p69kqQwgryWQscC
	 xaPxV/nUdQQq0q3lvMKts14Y3Qe90VxSgNGaXWI0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60744F805E7; Fri, 12 Apr 2024 12:37:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E19A4F805E2;
	Fri, 12 Apr 2024 12:37:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52B96F80238; Fri, 12 Apr 2024 12:36:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5831EF8026D
	for <alsa-devel@alsa-project.org>; Fri, 12 Apr 2024 12:36:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5831EF8026D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=f/y3/o+O
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RKImd7XeZh/fBOwxLz5MHI6E1T97lGnWmPvl+OZl6xbBoNKK3qqq2fzr+de7zoKbwR1zWI/cFsSd0OIQjsoN8yXBbWlS6IimD7bQo7bt7cOeWG5rmJVrPBgp1wP14rctqYGEiIVPbQOQ2twoAKzf80SpwyCd8LLCuwkvtTyEgxi0J9Iy9V/KUxSM/t0smu1oOO15olkT5Th2WixnwwY4oSppGkTw0+L9chrwWE7zJ+yKOWHnTNB1Lxzc3MmGiKjvJjdN//zt2OsXHVRNTB+g0OmV4WkO0p9Y6u46MnvGGcDtJtmPvjHSm0gfEfeWeGDF2KvqySpPfzkzJMcGbHL01g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUvrX9jrmtMjpHmz6D8VLu5LDN7o/EHtoES/dsqqc4o=;
 b=d+CkUYipw1S/5dmrLsw868rGaWs8yjSMLwR1A6GF/XY9qv5uHM6+ujoHeHtLCExuQDRM/37YJM2woGte3bUNbq5tE0ehnTUuC7N5g20zoHaavNAMaW2UrcdhHJn/8GmJVZVUINkqh4AVprWpHwmEX9Aiw43U83RTEpgjcYePGmIHOTCuw2bUatNDzBBO6UuGOgns2o5IDwxd4mB2XfS5TgxIR4dChrrqeo624pCPoBS2sd0si3J1VONgeLzXQNHkCJrpU9SzDR1pSUUi2zpo2+ziAeTIvs3dkS/sC5hnYfswNh3+AhwOQoiHvGiYFEti2g90S4mNdsBOag8nuqZ9bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUvrX9jrmtMjpHmz6D8VLu5LDN7o/EHtoES/dsqqc4o=;
 b=f/y3/o+O6NZqBha72xpiztySIv0B/HIl5kTTMi6Mu7IZUyZc8I9HlQXTf61IPJ1GMCV+ER4OdRWBjeM0h5MMABdfjdXHpajIWF1tLxCR/TiVnSI5yUazVZgwPQt44jY+lZkaqX/eeAoqhOzWDZJxGfCKopF1qnT2EMCfdK3TwmM=
Received: from SG2PR02CA0035.apcprd02.prod.outlook.com (2603:1096:3:18::23) by
 TY0PR03MB6536.apcprd03.prod.outlook.com (2603:1096:400:21c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Fri, 12 Apr
 2024 10:36:00 +0000
Received: from SG2PEPF000B66CA.apcprd03.prod.outlook.com
 (2603:1096:3:18:cafe::57) by SG2PR02CA0035.outlook.office365.com
 (2603:1096:3:18::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26 via Frontend
 Transport; Fri, 12 Apr 2024 10:36:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 SG2PEPF000B66CA.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Fri, 12 Apr 2024 10:36:00 +0000
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 12 Apr
 2024 18:35:55 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Fri, 12 Apr
 2024 18:35:55 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 12 Apr 2024 18:35:55 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
	<robh+dt@kernel.org>, <conor+dt@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <YHCHuang@nuvoton.com>, <KCHSU0@nuvoton.com>,
	<CTLIN0@nuvoton.com>, <SJLIN0@nuvoton.com>, <wtli@nuvoton.com>,
	<scott6986@gmail.com>, <supercraig0719@gmail.com>, <dardar923@gmail.com>,
	<edson.drosdeck@gmail.com>, <u.kleine-koenig@pengutronix.de>
Subject: [PATCH 1/3] ASoC: dt-bindings: nau8821: Add delay control for ADC
Date: Fri, 12 Apr 2024 18:35:52 +0800
Message-ID: <20240412103554.3487290-1-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CA:EE_|TY0PR03MB6536:EE_
X-MS-Office365-Filtering-Correlation-Id: a69cfc3b-137e-494e-0841-08dc5adc586a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	p6jPcI/C54wRH3dO005Ca9wMFQ91G1IjHTLgq1B1oIKZtUqaPrMLnhJAC/dJuWKYCXCbS25yARR0M6tvbQKzTMrFVzAxXIFLE3mTHgmp2wdAbAQlDtMIYSUf155hRGXpucvTZaVkfJZnwTon5DpuWQjaV5GnrjDdEUtuCKzvm1NQs7RrVoulMKfzCZ7ODcq4Y8Qd7MH0fNEzt574J9ihJ7S+Fd/w2pgRSvayHDaag9TX05NFTm9m2Je1O424YCvZmtr9YwXxU871AKepabRxFw9sbx2dFQ90hN887a2bse0EA3gYYwvOjSTz9HjE5qvnk0Up6tjp8WmbumCfKB8uTXli2j+D/QW5LwSS/0nP7ts44der6lH7HPkpxhr4DW0lpMoTsNjFxGtXsfiYEEBUGPiDhzinZS+vbhRWnNLXvUjpxHDfJWksspXy7kTcFIiv0cAjoOn/T5Mt4qORQDzFTQSjiNEiEcTJLlYc/1DhAHorV5PtCMv8+a90hUprERgwHWFJcJFIHlg47HIMeZMR7VH/GTa6cDzm5chfGsL5jYs3S/1MLFdc3TGn++9wt0Gki5sK4460bpne22AEhK+GMwYrBP83JWFxpJ14NZJ0Bueck67otWBUVJrlqY+A8EwG6nEHOFT/kzghrPneq3QGJzEAqXnp4frTL1G2bBiFQBuG7yVIJf1rC8vmj0q3VdifCYRqb0cIhW/tXSS+Zs4k1ZA/VPGTuYcFUEMFgvaThHjRFtk8A7h5sLr/AvAb5krI
X-Forefront-Antispam-Report: 
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(36860700004)(7416005)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 10:36:00.1322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a69cfc3b-137e-494e-0841-08dc5adc586a
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SG2PEPF000B66CA.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6536
Message-ID-Hash: WHEDCPTSJ4FNZLLMUGPEV2G6CLM7U4A4
X-Message-ID-Hash: WHEDCPTSJ4FNZLLMUGPEV2G6CLM7U4A4
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WHEDCPTSJ4FNZLLMUGPEV2G6CLM7U4A4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Change the original fixed delay to the assignment from the property. It
will make it more flexible to different platforms to avoid pop noise at
the beginning of recording.

Signed-off-by: Seven Lee <wtli@nuvoton.com>
---
 .../devicetree/bindings/sound/nuvoton,nau8821.yaml        | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
index 054b53954ac3..a726c5a9b067 100644
--- a/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
@@ -103,6 +103,13 @@ properties:
         just limited to the left adc for design demand.
     type: boolean
 
+  nuvoton,adc-delay-ms:
+    description: Delay (in ms) to make input path stable and avoid pop noise.
+        The default value is 125 and range between 125 to 500 ms.
+    minimum: 125
+    maximum: 500
+    default: 125
+
   '#sound-dai-cells':
     const: 0
 
@@ -136,6 +143,7 @@ examples:
             nuvoton,jack-eject-debounce = <0>;
             nuvoton,dmic-clk-threshold = <3072000>;
             nuvoton,dmic-slew-rate = <0>;
+            nuvoton,nuvoton,adc-delay-ms = <125>;
             #sound-dai-cells = <0>;
         };
     };
-- 
2.25.1

