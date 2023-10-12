Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 753837C624D
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 03:34:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E15FE7C;
	Thu, 12 Oct 2023 03:33:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E15FE7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697074475;
	bh=+VkIsrzfIKv8RAI6Nberv5A/3rCQp/FtnZok0AtJJ1I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vM8rZF+vbPSD2w8xYz0sPn6pUY63M6O2jTuUPZH8L0fi4Hs+T7fLADOP0rj/+PAaz
	 996wVQ65cTvcZGc4IaN004jPuKBADZsTu56VGAII+RrLLnkYO/xqzUyTLMQ3UeoSar
	 Eyulc8D+BFZOOleMeHWZaNYxpy26mir1iLGT1IuQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36823F805A1; Thu, 12 Oct 2023 03:32:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95E98F805A1;
	Thu, 12 Oct 2023 03:32:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EE3FF8057E; Thu, 12 Oct 2023 03:32:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20731.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::731])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6ACBCF80578
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 03:32:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ACBCF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ljczvZTj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUZfHMvxLlAOSCVXRorgYoGrUdsvXaNDxb6eSdw0qzhGCTXOXh1ci+37K+4LJ66WtoFBx8B6SHBjIWfdyrGTUReBHmbHUbR8cBId2ueHtK0H7O/kOf9nCtVhUzxdQ+NkiFKVCpbEwTmaYeTbtD4/m6gwood9xOqHu4/DVJLcbtPPZXytzv+igG4KVhvEoVvJgn/fONjDRP8ekOnb/0qkWEkK7Wn2v1ppJRa4svWXFfg6SIpJMstcln9mlQyWKTEu+yRsjbjcfduilSjFOWXAYkS3Q/MroIqWiV8rTO64CrnuGkCMQHAbErORY1kGw19jqPNhrKQItqo1ghVJL3+D2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csMaeuoFo+kq5LvrmzUAkOD0gnIOsr+PViKXv3V9bgw=;
 b=BWG2UMBP7nZ49joOiEGfVLfiHOu019bpdlsWd8GbNP52QdtSG1UwbQUV3Kp/7rDyN1Scmm/Wa7id1slMa7logt96LHIMOGzOwDg5zwuvwocO47mj2qi1FnKLsk//Jp6VshEsFe6unBgI28VV7o1Ii682xG3WSTYABBAj8Hzypou83Nau0L1+iWOZ3UYaD3qiafwmOFFIHj06aNy5mCLR0piKWsGR52kCe1kPS1ZGs24QV6nP4umhMBpCtRFIliHoXFj76diyzRBeOD7AdPIZf9sP5zvcuEtL3qvXmUoo4Gkw4xgdIs6XbJzgDTxQd45Pf3cVJEvOGAFkGweRNIGg9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csMaeuoFo+kq5LvrmzUAkOD0gnIOsr+PViKXv3V9bgw=;
 b=ljczvZTjEyskrvmFyB0dCpNmSVGTqHdr2Ozx9csGIaC7DmF5Ygr4hvhVA0KwV72qGsizzCRWXNh7gYv8XZ/6fpgYPMJ3Hxyl+8as9R63KbG/g59YVBZdlFRxtMbLRYyaLYN5jJPcn8x1GiSCwGc3/NH20jWoUHbdS9FEc5T+WWo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8411.jpnprd01.prod.outlook.com (2603:1096:400:176::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 12 Oct
 2023 01:32:14 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 01:32:14 +0000
Message-ID: <871qe0y6aq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 4/4] dt-bindings: audio-graph-port: add ch-maps property
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
In-Reply-To: <877cnsy6bl.wl-kuninori.morimoto.gx@renesas.com>
References: <877cnsy6bl.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Oct 2023 01:32:13 +0000
X-ClientProxiedBy: TYCP286CA0135.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8411:EE_
X-MS-Office365-Filtering-Correlation-Id: 743f41ad-7c50-491c-25a1-08dbcac31004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	U5d6tM6sCFYCS7NQZBVmN3g5oP21vN8HqMRgmjyNWM49bxH7hz2H0AMlcvuIhk2UO0WVZQtnj61Nj17eiDIqfLtsGHkzoqtQzK17eCW/rhA6VHkMs+ybbyi+/giQ2QxAH1BPaHEpAWcBUQ1SLOZ0ipVfyD0NzQerGRykSYaTtr1jGZd/F0e+K/fEHDndto59+eREbr70C1Ffnaz9J1/h2i4ZWqKHHVDX80qPgs3p3Tb1CJd31FAb5MVkzWxQg1tNOkWlO1lfbAGO0kJHcitiyGTPtgFQUuGRMsHvCVB8lySGbEHXUG807OMQQbPJKce7mWJHhuIOnFUYlHpTcUKrtFtsuW5vsgQEkprH6lE+MqUFnJtn4W9iziWcLiv0pC+aECP1Wsq34wDqRU6Bc2iKTecUzyUkfQ3kvHVGJ7YMDl7NL1eY0ikZy4n7iAtWfpQ5q0zywym85NxeBSN7IN0KNoOPScHNQoLBUnkFk+M3fYmvZVZlYn78cLdnVkWeYHfjReHQjXDyOQfcXkwutrUcGuZZkCSAu9rW5jEtD4Ucd3pJ91YcrvbycVssKF8FxOwxfT6Pigw+HGrVH3x2EGKw+axOU3YCifhtyjjTGhgCiAdwvUyuQN7wepwqYGFTQisV5e1ToTYbiDW91xOQmzZn8w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(366004)(376002)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(52116002)(8676002)(4326008)(6486002)(6506007)(6512007)(38100700002)(26005)(8936002)(110136005)(478600001)(66476007)(66946007)(66556008)(316002)(41300700001)(2616005)(5660300002)(2906002)(38350700002)(2013699003)(4744005)(86362001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?X79mJk+lnE/NqnRB5x78abIZqHmXZgPjdOrjFh61wZWb/ErdOMoiaw9oBvTE?=
 =?us-ascii?Q?v/KyYSV3uBz1sSOxHqs7mhUIUFswZssUMbH+lKCd8e0Iau5Q2TOjmPiUyOuP?=
 =?us-ascii?Q?8qM91sYjDL5p79RlvV4gyO19MKeDDpSgKQVFUEwddMC5hRotOdSjO15JpqvB?=
 =?us-ascii?Q?tNlYHp9p35UK9/ljUf7fY+Ze4ezaScp3fRJVAfTenuV44DZJVDdvyoB4ezor?=
 =?us-ascii?Q?zs7XR2x4DFTdkDbZrQWPLbQO/5TFNMt6pQciO2CMt+kOvjEIxwbBRslFf009?=
 =?us-ascii?Q?4H9CCdrf7j7RC9G0gFNzJEhifO5jTSkdDNM1z+LD5hs6MDZbNab041ypmH4Y?=
 =?us-ascii?Q?X3z6mlo2S9BRquKrvJFA6l6pGs2dwfdQModvtAwf0wdjVB06hXW4PQ5N1YSy?=
 =?us-ascii?Q?NaBcLm+3iR5fF2XnZn9VxoNbRuOk57DtlEzX3lSPZzwMy07VZw8l+ISPKEq+?=
 =?us-ascii?Q?EYPNViW0fMrKcJjDQlHSnWcqw4bDRVkJSTDtOQRw7BE10X6h1XGFu5oibQOC?=
 =?us-ascii?Q?2VqFodRqajtuDnf/3RFQsQeRhWnC7Wey2msLRQ9HSmoTOPu4pfHRwtobs97s?=
 =?us-ascii?Q?mZ60qfjXEPJHwog/anASX91Re0J00VmOKcMOanWecyXvqObhINL/D/VquuyJ?=
 =?us-ascii?Q?aOH1x6Xc+4pGS8qiXPBzOZjhb8T/ta9FbP0hUDX9Upmmo8cOUTrWMu1F5LWA?=
 =?us-ascii?Q?YYDigS+pGNjiRU5Ty21uqDOiQ53eqXvkJ03uBfOmpBYAiAC4jIQJUNdZL9zY?=
 =?us-ascii?Q?fhAHg3o5tNgTPuNXmhQWnAchWlkKssLUDSbBtn+k5CDdTp0Kukajczx8nxV7?=
 =?us-ascii?Q?r7QT2i09vJfXX7IG4OmxrGBUftJf0Zq6r6lqaGJJ7qVRDKKj6bxPAQwZdk4z?=
 =?us-ascii?Q?BSpWBX5k9PkAleasb9HPeL93h8cQukc9aJ1K1lbOyEVbNyVgJQfqJGFZF4Tp?=
 =?us-ascii?Q?mFHnUYmTb1eBXJocMk/HoaztN80fOd4V/Xgo90aEiQG316QdLDGRisTMU8RI?=
 =?us-ascii?Q?zUT+jK7DZ+M1W5Z4/EYKXfEQoCgqos74dZxPnBSZec5p2LHVACg4QLXBEq1l?=
 =?us-ascii?Q?rXg0ji1HflBnhxD9A2oIqupIg3ohxAbf1H+s8zfH/0XkzeRNz7j8fyTUbRCV?=
 =?us-ascii?Q?HbTqGnvT88Lo7ecqacoyvqTVaPhqd+0DMw+6NuQedoLrGCCCxldjqLP1P+xz?=
 =?us-ascii?Q?73SOLSvTRV7tu1tPQ+b2YG6XcFYixzRJVUIFP1nPJc8Fa+D8FqDftA2BD7cP?=
 =?us-ascii?Q?ypcUiLEM5yIkq90OU0QIaXSLrlRVlyxUHYsoFKm3gQdo0dh6237mXy19Miul?=
 =?us-ascii?Q?Xwtf7/DDJOY0di5l1ISAKDZY+yik4WgMNnuJx9+Zy9yLUEAsadbf8sbqGNPP?=
 =?us-ascii?Q?bHU2IsC8S7KW2P/7b7/v9tEzjZ64AZHCSnWwE8mpBbqAgRGGzvCcprlyTEue?=
 =?us-ascii?Q?NQ3/cEIE4V02kZDj/xB8Mp6bLXZSIUhN/KXCLX1Fwc1+jQ/cLA3ahMpFoGcr?=
 =?us-ascii?Q?ZfFwFw2jdEFCho6+GYEibKce3rpwWDKXDyYvCTTL07EfWxDkIRsyvIFLxig4?=
 =?us-ascii?Q?7YVBMGHRkzDA7KF1L0dier4vI8BPXTw7W+1xjG4Ki+9Fzpev6LEmegMQVE85?=
 =?us-ascii?Q?Xiej05qeSDjKob0Ra0/qfik=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 743f41ad-7c50-491c-25a1-08dbcac31004
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 01:32:14.5064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VtrKp4r5yuDfcgTbQsUKm3EFO8AVeUd7YfVwryuFLjzxpil0+8JZhMfIecs/v4s8z19hY9I50WSca8VufsfMsLPpdu/b3f2MUyhDxyBz+HB2X194tczTA+J0WYovmSb3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8411
Message-ID-Hash: MAW6J23FNH6UBTB6UZBUDUT7G3YG7UOJ
X-Message-ID-Hash: MAW6J23FNH6UBTB6UZBUDUT7G3YG7UOJ
X-MailFrom: kuninori.morimoto.gx@renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MAW6J23FNH6UBTB6UZBUDUT7G3YG7UOJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch adds ch-maps property to enable handling CPU:Codec = N:M
connection.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/sound/audio-graph-port.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 60b5e3fd1115..3c4b331e8498 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -19,6 +19,8 @@ definitions:
     properties:
       mclk-fs:
         $ref: simple-card.yaml#/definitions/mclk-fs
+      ch-maps:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
 
   endpoint-base:
     allOf:
-- 
2.25.1

