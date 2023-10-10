Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 548DD7BF032
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 03:23:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C67801089;
	Tue, 10 Oct 2023 03:23:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C67801089
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696901033;
	bh=04nvzkETKtRG76FNsxedKkTwcZuf6RoImNpzxpPQI3g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kKi+MJ7KC++4a5OR5P3YpSSy3h+sbdoFuQuiqART1PwPS9Vce216GouqIg+KxyLi3
	 prsp/pptv8YarIKWu/ihl5YkV1TphHyQ1hC5GRe9YZX+BKy4Fm5qAlKN+pti97YtHB
	 Ts62rfqTI9XPKbOiorhd8QO4TwFjnayOTXCNmg6Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AB0AF8057E; Tue, 10 Oct 2023 03:21:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E815F805B3;
	Tue, 10 Oct 2023 03:21:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8858F805AB; Tue, 10 Oct 2023 03:21:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20730.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::730])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2B68F805A1
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 03:21:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2B68F805A1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=B8UV6qS8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oaxXamW0suX3OMasA35MmQok5abdCRLqTgXEqjsH5TF6vtPm6PI5UDlV6wGQGsbLzo3qrqIrJWWqbyIJUQKVtxAi5g2WDeb89LJh8WToIFWJdhE+TumVo4BSpnP3AhozyvvLbO2WWZCeDNOcs+RsKKv5HLz5jwKswQJA2gv1U3LkErFSAEb7LkK6lI2c4sUPppyKSUJrw6qgxhYVKHBRdaJeX1LH2CPJGxnaDgzaX+tsc8ptt95V1LuWf5qsqdO95xpWRtJg07zjL1uHJVpD7GJwuNy9P40kq7vOteRpvRQmVu04RCxWrpjrXEtD8UTgvjlM56zyP/0KR6s8vv9W2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlMnq4AzdZ9m6Mu/4ZKap2h8Ja1M2JvvKUIxJeEwCIU=;
 b=izLfWl85fWyKV/8FDrYUrLx1DYzbmFoiagJo8qtbEPCuQ2Iq49rNfR3a0+T9tbvukYmQsKGIlJWwtrYtdAINhP7a7hEC4Nt8hilppWvXa1yEm9NTq6ikL3L27iJlLByPwT5EbTGwhe/n4PSiCgYtMOYID31EuG1MMPUuXnNwLPy0FKY+nCTa9+cXqKH/tEMqCnCj1jPk6qUsGSRN5ZGzOBDh9ikMssArClRnMnlEnhx7jfy3sn4rGWAChWeqIMN4b82wKroVx/WqWUS9Fap1lGo/lDyK3YLdq7GOrvOccgnYTHd8osjgtV8JVUB/rNaENL7SuiiVWnK4cr9MgVuwxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xlMnq4AzdZ9m6Mu/4ZKap2h8Ja1M2JvvKUIxJeEwCIU=;
 b=B8UV6qS8VU0U8bxdj4O7QGS/0ZxG190Hm6iWuV/6cwIpP84EomxrsQge6dCJepcASKHwRDB0PHCQJYXwRpSzRkOG+S/S+81VMXaZR2Z0ZUXiNtfI1Bob/b6S6L2HeZuowbdcBD02ceMjgBprzpvQoWE3SbWkdqfKm3yH9+Llun0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9930.jpnprd01.prod.outlook.com (2603:1096:604:1ee::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 01:21:34 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 01:21:34 +0000
Message-ID: <875y3f8e76.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/4] dt-bindings: audio-graph-port: ch_maps property
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bard.liao@intel.com
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87bkd78e88.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkd78e88.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Oct 2023 01:21:33 +0000
X-ClientProxiedBy: TYCP286CA0052.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9930:EE_
X-MS-Office365-Filtering-Correlation-Id: 130bc8f2-4690-4260-21d4-08dbc92f3dce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1mNRriBTB4vHhox0AylBgaQxlXb1O6IcliSm+3ZDtCKMjOrcZGS+hEdmsKuYxvzJ+YRRKo8WePs6Tnxny8NpDwSa5mXybSnLscalKTP4rIW55vtIUE1DuGu23BiyzbBk8SCJfuqL2vSUbJAawEWdgIwIc+U4R9gaaEp6yPqWDmaV0f9NV2Q7Og3Z/so1q0ZAXn1moz1HZ6PgamuGT0BKyuR1hFcZxpDAza8/5N/V8oQfuuU/QE3v7GoF7CYtvm49gK202RYutQLomk7c9BL6O6zKtW93jFizr0/RwZKY/+aI8TARjTFxocgEPp6Jl/2Nc1hGH2xwiIWZ7O+98Jf+kkABrFzZdqioH4tEz9Vt/YVpieOzb0adHgpUZHZ6vRiN2H1VwnyL88wmC4hpu3/EgPBlcEhzLkL9ZBsgUOK+G+CPhzsrP5IveFemFI5RAlW/0xBdoS63+Visyoj1NMZML/u09jTazdgQandgNZtxbtprG9hSTkLiF3rg+NcNPrNZuFbimdezvIXz/Bh1Ia/XuX9vnmlguYy8fIMy6ep3g5RYv9aTc2RF7zlFwBPsovTDXyhJsAiV/gThPj25kagbl42SR6tz3wMtaJJuIDx3z0anDKj0SpRvIFHFr3/ulB8PmEJK2fV+VBRvh0JahPqjMQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(376002)(346002)(39860400002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(8676002)(8936002)(4326008)(66556008)(66476007)(66946007)(41300700001)(316002)(52116002)(5660300002)(2013699003)(478600001)(4744005)(2906002)(6486002)(110136005)(86362001)(6506007)(36756003)(2616005)(38100700002)(26005)(6512007)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?A3skH40e8pwNs7rXdM3AtHP95Fr8325MTAfGxnupLDUiRQp+RFLtyI5UiHHL?=
 =?us-ascii?Q?BVqDvfznuEE3Ay6hq46PI+wuf6J1QIvziaP+h0yT6aes0WNhlWw7PjgaMRDb?=
 =?us-ascii?Q?7ztnsUcrsYZUANF+Rk2GVsoeyCXLbbIkkfUkZo3VpdCBo8HE/LEEIeTbDdvM?=
 =?us-ascii?Q?4ZF895UM1sd0Vo+vXa6GQREsvkTuCTXluZBHS+MR1JvSStI0nPjReCS239az?=
 =?us-ascii?Q?0L7XyOhzxURY0OpLQTXOELLIgC8+ROEIlcTEVcuJGmH6ayhbSSsMHFet07XG?=
 =?us-ascii?Q?QUo4s3tTZ+JJy5w95IUN7zB8hT/k7rZ/Nk0kUPAcccVDpNMhllM4hoiyLedY?=
 =?us-ascii?Q?hiPBci3gua05GpGw9ccrZsSQPUeO9AfVRABSLKoX5/z9IxgSuLLdSX0hmgC2?=
 =?us-ascii?Q?0bdprVA5c3W3AyiQXzCFhAhDkF3rurpEjoXSrmGDEvpqlJxVbk6whMsxlfpx?=
 =?us-ascii?Q?+UH50W1jtgakxCO/b0hjQ/C/xcbT1Ar2zc4L0HCeUDpPRgHoBIK+NNfVYtB+?=
 =?us-ascii?Q?Kdbj05K6xDC1AGbfKRa4QmBsprPWscfXYgFWxkG8sV8hxuDSYZsginrzK6AW?=
 =?us-ascii?Q?IIANGSOaQDBrVS7N6P7vV6tjxtPDv+IdG7p6C/7KH5YnlaEwJ2+5B4EzvDC9?=
 =?us-ascii?Q?CUFWFvzmkvCfNSDseXmf9SImcv3r/+BLs+a7Z3pBVvcIfqa4U3Zgif85oROi?=
 =?us-ascii?Q?sx35kU+67TvUeuN4CUUgOL6Ggoc6eArLB/AEagYiDUWSQdWeAHbSj/84IBeJ?=
 =?us-ascii?Q?KcWfLTRMWMY14dJaRd7TjO65S7pnskYjviomoUawNlFmzhFGqshoUrGt7Zvl?=
 =?us-ascii?Q?70zle2W3jKw/nTgk2BMLQxxK7ixjK+U3ro3lHshMPPNde3NPWmPkoPoqGMvq?=
 =?us-ascii?Q?Vi1GclPpuIPJeSzE6lmXxiXFbrAzXeeZxtE/l2a+EBFyI/pyWYRDUXeXFOTh?=
 =?us-ascii?Q?El+yuNE2XoWesxYVIaUHawCsqQpn5+U3dVDUH7OvFelgETkNTga9oUpxeLkS?=
 =?us-ascii?Q?h2HVFKvmed9AE6PsPyV6RLSBrx0IXTrtPOTo5pvPmZM0yZP4i2qvUV9CYJps?=
 =?us-ascii?Q?jOuh78OWUMdmG+/a3mjPXSbf+aBwk1ATqIIYh4/Cqj1IYqCJ4kukPghJvLUH?=
 =?us-ascii?Q?5C52UzVDV34sMpI80qH446+QAU77CoQkVOFKCHsnTAel//yVefdgZO5NQOp0?=
 =?us-ascii?Q?vmo3SBuqcgMtQwBht5YJOCvNN+W7k7ZeBVD6lQyWxgQuagJEZ3u49r/9V1XY?=
 =?us-ascii?Q?1YOyB8lpO2y+QGe1Ux48ZX8v31PVZVFrNVcxD7EZ56yvQDLFG6cTXB67BLY6?=
 =?us-ascii?Q?ZeN7WWZZWLNv2jn/KRXH+Y4LXEI92oEzxttGU5vx7Us2iYV5Clf30g63zMXe?=
 =?us-ascii?Q?UhtqDLGcsupPIkxy7QddW8fxc7cUMqkkLNcQORSjhwp9oWuk7IcfL10/WlmS?=
 =?us-ascii?Q?tTBKaIFWQazLm2e3B6tUeoPbYdmPekggfQADBjbT0R380L2Pb8hu7uB5yNhz?=
 =?us-ascii?Q?ro9m4K9NoqLtF47p8TPDl5EMPxFdWU8SVgaoWcoXcLU0s45wT79Ux2ZKLWlz?=
 =?us-ascii?Q?pF9aalcspLe/kO5ftDCKZe/nHHKT793od04Ist2lvBlno1h9PID0ex2eNsvf?=
 =?us-ascii?Q?jqa4OyuEvEUlIH2wFHHKxrA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 130bc8f2-4690-4260-21d4-08dbc92f3dce
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 01:21:34.1350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7WxhWNF2nAaxfJfZd4BCSboQgZ8dbzwzFfCgm4SHZUSM61/YNA5pRccXOlK4lTjOFStqf7bKR3vDCgixoc2e7IK8C3YvSO2uNjo3FbKRX8YG2qRzyUIXaL2EXp6MBuVP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9930
Message-ID-Hash: 5I7LGTFWVCH4RNNTIF355SJ262Z2JQYR
X-Message-ID-Hash: 5I7LGTFWVCH4RNNTIF355SJ262Z2JQYR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5I7LGTFWVCH4RNNTIF355SJ262Z2JQYR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch adds ch_maps property to enable handling CPU:Codec = N:M
connection.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/sound/audio-graph-port.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 60b5e3fd1115f..dc663af784fd1 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -19,6 +19,8 @@ definitions:
     properties:
       mclk-fs:
         $ref: simple-card.yaml#/definitions/mclk-fs
+      ch_maps:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
 
   endpoint-base:
     allOf:
-- 
2.25.1

