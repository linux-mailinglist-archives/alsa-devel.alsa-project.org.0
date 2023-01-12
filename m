Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1115A666834
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 02:03:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFFD27B11;
	Thu, 12 Jan 2023 02:02:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFFD27B11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673485381;
	bh=//RkE4hoXvUNeQK/LCsGftlRBofWt3O7au6ZbkaIA0s=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TTpqo3PLXyf6CMj+eZ/4ZWB8iVfYPlYzgXOrxC8yGJ0v0T6JhzE7WBHOuRZdZdpyQ
	 rRW1C2WeCr64BnLRcVixnwXowk4BLeDQmd+3xTC5y1010YMcbo4digSS3U9Y+QMlWu
	 MhHGGgsk+IbJP9lshkfJmvWovNMo9MToAInM6HI0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCD01F80424;
	Thu, 12 Jan 2023 02:02:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CADB6F803DC; Thu, 12 Jan 2023 02:01:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2104.outbound.protection.outlook.com [40.107.113.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24556F8026A
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 02:01:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24556F8026A
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mexmUFy3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZNKnP8ExDk/YG7JSa9y8JItsMyITcDBf9rva6jH/1Bjr8IMO/rGaJ/N+BG8AXlPzBfMzSMz/xJ+xjCZ0+/Z+N0eMIcj/1UZY/2ov+KsCam0rH7G+dAK0wILRCAD0uK2eO+vvoe1oQchQaoDFN0aTQb+RL5i8YnZsfOtxEqYWTcp5EekRfMkM2MZsi7h9+niDJXw3wr57XZRW+T9ZLzdbr6N6zTlgkg4TYwXRevXx84UnRqMMAl3TFarPNG05e/ZwyMRvDGg+Be32U0nJDfcgOWufjqTTv8T84DSUqXivZstOCrMlsxgt8GIaFoYlfoGnsSmr6XwHp6D0+hewA3hWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7/mqe24MIIRk8kVMiwD7xuXMsAeFdZQcnivYaaZB7M=;
 b=gq1iSY4HOSH7UrhRLevnmJ7RNIatnUhhbPpnObvMMvtZWVOdkIhJqMNOJhQ9O+8U83IBRiKR4bYPc8MxFYg1q59+VwTpdWYiM7w8mu2Hv6I1SyltsAGbgEyp8ddpuU6Od4g7j8JDA/7mKM5fOdL247cuvLW5Lu3WE490lRsCzHRPVrbBlnQfGy/uYwm0kPBu80vLqhCA3CZ5IOcFwuDBlsvhHJLFx+5A51VniauEQkQYEsZubZRQ4qhKggba48kNBGK397nvAacT+nBueQAiAgqfS0zVwGmaKmQqBFYD7MxH3DLF/kaQYasLPswJQ70/XQGjzFu1mzCfh+7XzduR3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7/mqe24MIIRk8kVMiwD7xuXMsAeFdZQcnivYaaZB7M=;
 b=mexmUFy30pl2T4RJHk5JMhsrmLkxmhlC0ibnHUttywDbu7FMKb64eXnJt0sLjwlswYbwPY5YNRhXFj8v58sb6rPxU6UPAonMsQkoQnYkSt2Ky1XncC6NLRA9eUZC7UtjCxYluuV83TQVFK0+pHz+st6fL8MUhgmK+LbEHGc1Kc4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB10592.jpnprd01.prod.outlook.com (2603:1096:400:30e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Thu, 12 Jan
 2023 01:01:46 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 01:01:46 +0000
Message-ID: <878ri84lc6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
References: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 11/10] ASoC: dt-bindings: renesas,rsnd: tidyup rcar_sound,src
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Jan 2023 01:01:45 +0000
X-ClientProxiedBy: TYWP286CA0005.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::23) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB10592:EE_
X-MS-Office365-Filtering-Correlation-Id: 391a6692-ba62-4167-25ea-08daf43893ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iJox+6Yw5ckC2856Pd7mcafhgp8p4Y8d0SAQdffpAFKsFAfXc6zw4OcFVf3YrW1PV4i7cVW6+WLf7vZimivqeLG8mIGZrFCtwLjLmQ6UfQOVkdughniEPa1CjcD27X1k8DSexxiHXA38q+4kypC+MUorCNac9HpfEjaQWjAUEMY8paq121+sheP5chRS8GwW+75pGUQ7iHg2tAJnXKh9fpJx2HeA8rlua7530GlW9Y2OYQZqCGJ7vSfCykzWfJFXqe26KCHo2MT3gYaUZ2ize+cyuTqX4CWiK6s6bpR+8f4byF1qIGmlBeMSF8fddVHQRo/KDV9FWRD9jY0Ku/Zy2lDt6hsJm7Ec9r7MylHhKoewQYES+tqcpAk0iZWGXNwhGqT+NPmrViofgoCMdaQGmPXX7oySjsYVUkcxPqKF7Me3ABwnQTbL2rboNozVuzYNSnDInF3uvlFkETWLpjd6vHavEghcXo13NjlNk9aJop9dqwhqd6Vp/1ZMwZV1+z7AIp0Ck2ERx1ReRgXaji1203QdZk8I0GwKVemfuvuWCZTUqJW/1+iIjGKCy7IPZcEIjdA2QYVDjt2f9k3VTdi5gVHhSoFRqidojzRt7tqVlgCEwOBW4XDMBIRSGRFlYeE1romJnUrPDIoOAaqgG4TSgl9zznrBdIsQD6w6qTtyuiECmwF+ImY+hDqj8AKpWn3SHcE4NlD4cK0K90tfdCR/gbB2yzGYMqw4Jajhl1Tccdk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(451199015)(41300700001)(478600001)(966005)(6486002)(6506007)(8936002)(54906003)(110136005)(36756003)(52116002)(316002)(38100700002)(38350700002)(5660300002)(83380400001)(2616005)(86362001)(4326008)(26005)(186003)(6512007)(2906002)(66476007)(8676002)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RAkdaOeGb+3rcdIg0fantZMZaTOiaeR5gislhCKbxdYcgrbnoqww8MnQZnvK?=
 =?us-ascii?Q?FxSaoQpu7kN9ML6CKVAizR1IzNUbqd0l0D0umycq1Aszr/eJJaKpd5r2P0YF?=
 =?us-ascii?Q?H17rdfqBWq7btxfKY/YDtgLaHA3HY4Ui6R340I0Kh74qDHiVQSQfp554vyH1?=
 =?us-ascii?Q?RsyJ3dNoSKn5xRHlr5c4OG5pBLC7VVMEbEy0C57rlQBtoibPgGa/9T7GiisA?=
 =?us-ascii?Q?k/+sHQcBcAoBPQ3aZp4AS7OLXCnQBqmtNSaZOFEwuEnUogQK+ffmfBvTzIFQ?=
 =?us-ascii?Q?0m/xnr8+IGqHhmWf4a83HqgigP115pWcgYzGGUXqxcDreanJQ6pJD6GYshOY?=
 =?us-ascii?Q?OeYukA2pa2IITYQ1G2yK0tQDinABYHUJEetBkHtQFmzsKmXoCDfHQ1FSLEXa?=
 =?us-ascii?Q?v5dod8ItdsRbFX8v2a9Ry2vTIoUUWbuZ5EOXV4i4Rx6Z/+A9yf1OJJTswTz3?=
 =?us-ascii?Q?KwXBuxB++lyXbyqoCtTBu7yHGr1G6ieazNyBvPvHBNgzsasgNI/2WeFAC0JE?=
 =?us-ascii?Q?L8IzCrGU4X4am0pp/7F5gdWq6wWXlNz1iXZGsKH/3bdOgYotYPh1Mo+2uCdn?=
 =?us-ascii?Q?0AMiF3CeEjCF2u5Sg3tz7Qsey4dVqBSN0sNBn85a5kCjS/cayEH+JIoABWAg?=
 =?us-ascii?Q?W66tlWSkMwiJpefUsnR2HwHnmQk2JDhdRuLqCelsyX9r+fCUMyRKFK+T+1sl?=
 =?us-ascii?Q?AWyVIf7zB19eklUCNOpxK/Ptp96dcnV5IBt2juLrvU1/Bo+ZWmoG4LVi5lTh?=
 =?us-ascii?Q?qtbaJ0Wjihiz1HyTjs5HDW+2NB/9+Did4xicguoshRZs7ZpNDhIGKwbnbSrR?=
 =?us-ascii?Q?W8U+Bizjk/vAzAFRBLb2flg1nhuQW31x1fUNuGUY4tuvGMOupYTRQoSqlCkK?=
 =?us-ascii?Q?LVF2wdtijTMUb5gWeihrDp75r83HvcjsVGe9Nu2piWjN/X2e3wjHCkPFum+v?=
 =?us-ascii?Q?yfAf3XUeO8jwDVYXkRXC9FOhUa91lPyJKU+8vJD9ag1qvBpeK7cUxOiRjGYZ?=
 =?us-ascii?Q?O5vks1MthvJcad16KWRfB6Auk06Ae1mYiRq9BDGvczdYmdKIt4qpZORZLMsZ?=
 =?us-ascii?Q?xTJbt3W0bFz3piSpyq8i1HWj0iIiWGNdl55QH2prfXRt1AJhbMnS5cupA2zi?=
 =?us-ascii?Q?F/sOOIwvDANMvr/G+OmdUIrzPW5VIxisd3dewGxwZDy2RqNZoWksFQxr6II4?=
 =?us-ascii?Q?nCODSv+XNqM0p+R3ypbQMekEnQXpkw1tt1x2sYejCj7qEGpAJWKWBtiBEait?=
 =?us-ascii?Q?gcU7VHCX7+NXSdGbXT9mm9BM+kbM28d7ei0duDlek6om9AFbqJlHu17vYvgh?=
 =?us-ascii?Q?kMN7lH818m/v7HVja1265e/+lL6dZ8RIHR+fUJcP9ruGjNpXb6MEgouUDT77?=
 =?us-ascii?Q?sib+6nRHXBOK47gYa+ncawyF3+FFwmevospkCQhNEqxxaGhCa3ZswRRhXVjB?=
 =?us-ascii?Q?k0twwgrwuyrHrtE6oSwO2VrF72CjBCVuXU2yg5YTWqydjZv0s1i29iPrTBgz?=
 =?us-ascii?Q?m376kvN3uJFZ9QFF6fFS8apELWeFrokWwJSLG5PYi3/JlF0M1KvTXGpyAoyC?=
 =?us-ascii?Q?L0Qw6QcKLMIyW9hL0iRgw0paOZ6Qypf32AMsxv2zCzB/SozEhgFDsmSIGH/5?=
 =?us-ascii?Q?4tLXrwCwKMphZXatOx3qPCw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 391a6692-ba62-4167-25ea-08daf43893ba
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 01:01:46.1548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m/F/+fmbrMcGybJjCGUycULM6U8/jwTPedsrAnhtNeq1PBUlnSn1ekzz5zaDBQkP54sEtERm/L7YLSpM0aPkpBCAqRed78vk5wvIaGlWzzvZPD5W6iGxyT0qVhd5vEIk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB10592
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Some SRC is not implemented on some SoC, thus
interrupts/dmas/dma-names are not mandatory.
This patch solve it. Without this patch we will get below error
when 'make DT_CHECKER_FLAGS=-m dt_binding_check'.

dtschema/dtc warnings/errors:
${LINUX}/Documentation/devicetree/bindings/sound/renesas,rsnd.example.dtb: \
 sound@ec500000: Unevaluated properties are not allowed ('rcar_sound,src' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml

Link: https://lore.kernel.org/r/167344317928.394453.14105689826645262807.robh@kernel.org
Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index bd3a98efab5a5..e01ec01792908 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -198,10 +198,6 @@ properties:
                   enum:
                     - tx
                     - rx
-        required:
-          - interrupts
-          - dmas
-          - dma-names
     additionalProperties: false
 
   rcar_sound,ssiu:
-- 
2.25.1

