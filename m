Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A34F77D2870
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 04:17:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C482D83A;
	Mon, 23 Oct 2023 04:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C482D83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698027421;
	bh=Z0uyhO5psE0XcKiDyV9xzRWhC+/eliSFDaaO/qFL/+0=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mXNCERewx6gCUO9rDKZKLgRbThYgG01rdWj78XVC5bJ9ta7TqJjePm8YfFuqb4/vc
	 McfKm8Ro981Kwxxm6CDcbbiXPVXe/pAHQJRAwIJu3zMz1rljvq8C32HGsjbLz2mFA8
	 YQCDUbf2LbtJ+Fyh6uS62W64FVz015LnWzzJcKDA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D33CF80553; Mon, 23 Oct 2023 04:16:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7028F8032D;
	Mon, 23 Oct 2023 04:16:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA36BF80527; Mon, 23 Oct 2023 04:16:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10ED6F80053
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 04:15:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10ED6F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=NxUivNus
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXuZz74++AdIhkc5X1N3RelCitxwBFF2Nj8yyqMLkA3oPrYrh0KNv6QK2dwL2QsWfFP8czizpeR9ytJllG4s5fxhyDbXD4UPdv2GVg3V/N3JPiOosIAxJG1Ek+xIGsNVG/blGThnyl1FGAbem0fcyYfDruhkkOu+FhkNCQcbhz66mw5lcrl96n9KjRImxMF1bezYLCLdFuWZuWlRIZm5RjoPdmZd8wr7c5uF48lB1+6rylAqx0iEuQGWdyOWSEkO96c7uhiHQ9x5Xy6ciC3hYpmzkptGTWuvHP5XJ7XH/zAiBzw2JoU0OFDaQcCALTUECltq/vvT1K1QSlvGgeADMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0B6YPQjXsiydo8BAkiftkLvXJ1z6BjLQPPkrd+sWvA=;
 b=L8zpM+JW+OsXzR8blywPP3P3WTk4ziqCACidPAV9SzonoxNf/XkBPL1CQgGdRxDCwnxf9oL9VXM/ypgpXybFWn9FtxQHEzb0L3lhGVmCqo0xYSe+K86ClvZTgneXVjrFsBVi+cGAtrqIvyqX+3zI4d0eIUY7kYm2roMaSx2E9S3g4D5wtGbu+kajfoWoUBZoiB+Fue+L9Na6asWTozXdbJ9c4po6oBiNnPrhGi422Dt3zO4w0R9DAqX+Jl8dI4UQxbXyBJ9mOtxZfMj1HA7Oo241BNAPVOR1f9jkjT1luV9H4FSuHNFToOCYMrq05Y6OKZTfQCY2M29g62H99Eluhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0B6YPQjXsiydo8BAkiftkLvXJ1z6BjLQPPkrd+sWvA=;
 b=NxUivNusgWwuRfMJ6a0423QjO6Py5THyCmP8Vp3GJn8BvkL1mnyMlAopKK86HVSQnJv1eyhxNMqg8Pchflib9uTSezWVxHBjDLiUTvNysgkrE727LhBh0NC+DJsPpbylYnC4dtHF0dMM23/S7f9yK1/CHSFuUXt5gEulGCc3iks=
Received: from SG2PR02CA0033.apcprd02.prod.outlook.com (2603:1096:3:18::21) by
 SEZPR03MB8265.apcprd03.prod.outlook.com (2603:1096:101:19c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Mon, 23 Oct
 2023 02:15:44 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:3:18:cafe::6f) by SG2PR02CA0033.outlook.office365.com
 (2603:1096:3:18::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33 via Frontend
 Transport; Mon, 23 Oct 2023 02:15:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Mon, 23 Oct 2023 02:15:44 +0000
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 23 Oct
 2023 10:15:41 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 23 Oct
 2023 10:15:41 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 23 Oct 2023 10:15:41 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<robh+dt@kernel.org>, <conor+dt@kernel.org>, <YHCHuang@nuvoton.com>,
	<KCHSU0@nuvoton.com>, <CTLIN0@nuvoton.com>, <SJLIN0@nuvoton.com>,
	<WTLI@nuvoton.com>, <scott6986@gmail.com>, <supercraig0719@gmail.com>,
	<dardar923@gmail.com>, Seven Lee <wtli@nuvoton.com>
Subject: [PATCH 1/2] ASoC: dt-bindings: nau8821: Add DMIC slew rate selection
Date: Mon, 23 Oct 2023 10:15:36 +0800
Message-ID: <20231023021537.617980-1-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|SEZPR03MB8265:EE_
X-MS-Office365-Filtering-Correlation-Id: c73590e9-cde0-45d2-6fd0-08dbd36df6ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8tGyU1szvFinj9vSEmQjA+OsdbvGWoobJhZJLkDB/3M14QXu9qAjtGb0Wt2FVhrCtGKp35zavwPdXUJGvbyp9tY4jJH36/qYfV+cxToq+4HV66QfjsQtFg1yyKELf/tBUhRjq8wL8v8eX8xQFt7kIBZwXUq+VVYSQ7d40BiiQWY8TJ9aWI73eKgT+CokulFD7Cmb9bGVJYf3TWTSfNwYjuaUf/fNVYErysPX9CPcO6sR9WFWS3yZY6VcJSnVlnhpfAQ4+njq5BgjUoFKMCHFG3nrG6bDQwuTur8mha4JEv8i3avjDkQosMOwLYd3YgKBbrlt64H9qWfjSq8nPxwITvpy6/c8S/Wo9p7+5FLkERish8R7gTNjI09GCvNDrtcCT2FK3WmFP4MqzCvns2/B/W9rYr0jqiJMraOF6cRpjZ7Sws6rFRYDA30sL91rdDT1/722VAv8iKuvE7m8uax4lq5mK49mBIb+qzmsyMs4neQzl1wcYo3f9MRqjgm5ImiU8V8EK0ih1CsF1nbZLKkAlPVFBE+g9JTyP0Mw9H0eTAL00gcvJT5D8GqzeYUQeN5aamIoWvQbko2gAIhO+qMrWQiZnelQQpnlJ90MfYF7y/v7nQF7yY1CYtfy8IGmhRFabu8cio6KuBnMOrtIkBB7Eq9WjMmWvFax7qSyzpLJMQWpWOI04Addlp4jBgGeevf5W/sXSLaecINW/PMuw3IiS56SQ/QB1TOlhAAV9b8h7WOhf9PjCwhk9ib08JRP6+NMtNEONAeaj6b7IdtBQX6u/uOafMAY1vFa6ENcmy5LLB4=
X-Forefront-Antispam-Report: 
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(186009)(82310400011)(1800799009)(451199024)(64100799003)(46966006)(40470700004)(36840700001)(2906002)(41300700001)(40460700003)(86362001)(5660300002)(7416002)(36756003)(36860700001)(4326008)(8676002)(8936002)(107886003)(478600001)(6666004)(26005)(1076003)(356005)(82740400003)(81166007)(2616005)(6916009)(316002)(54906003)(70206006)(70586007)(40480700001)(426003)(336012)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 02:15:44.5289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c73590e9-cde0-45d2-6fd0-08dbd36df6ab
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8265
Message-ID-Hash: EH2XTS2LLEUINQMHGGHWRCYIX72H4ZBY
X-Message-ID-Hash: EH2XTS2LLEUINQMHGGHWRCYIX72H4ZBY
X-MailFrom: WTLI@nuvoton.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EH2XTS2LLEUINQMHGGHWRCYIX72H4ZBY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add input with DMIC slew rate selection

Signed-off-by: Seven Lee <wtli@nuvoton.com>
---
 .../devicetree/bindings/sound/nuvoton,nau8821.yaml         | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
index 3e54abd4ca74..5f7f2eed4834 100644
--- a/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
@@ -89,6 +89,12 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     default: 3072000
 
+  nuvoton,dmic-slew-rate-selection:
+    description: number from 0 to 7 that sets DMIC slew rate.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 7
+    default: 0
+
   nuvoton,left-input-single-end:
     description: Enable left input with single-ended settings if set.
         For the headset mic application, the single-ended control is
@@ -127,6 +133,7 @@ examples:
             nuvoton,jack-insert-debounce = <7>;
             nuvoton,jack-eject-debounce = <0>;
             nuvoton,dmic-clk-threshold = <3072000>;
+            nuvoton,dmic-slew-rate-selection= <0>;
             #sound-dai-cells = <0>;
         };
     };
-- 
2.25.1

