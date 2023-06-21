Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CAF737914
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 04:23:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64E2383B;
	Wed, 21 Jun 2023 04:22:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64E2383B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687314213;
	bh=YzG/uj/R5kKrrc69kFQIJUHb5ImlIgAcxbmPlmw/r2w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wi6b0GuG7WVNPSIb1ptZOzUUH4pruNU8UAcLVX15KL0sRCOlzWbxSOFZYIX2Hy+pa
	 zir2UdNjApOTWoEnj4moOleS35CWeYr6AceiHOrjzmIERY9APcyPhvKy7fhebDG66p
	 XgoFC9ZVQuXsvwasKh+FXfzxFHaYKluOA251Ubyg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1B75F80612; Wed, 21 Jun 2023 04:20:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3186DF80548;
	Wed, 21 Jun 2023 04:20:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE1AEF80608; Wed, 21 Jun 2023 04:19:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20720.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::720])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D252F805E4
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 04:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D252F805E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=RwgN+lsx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9/xEQKCImMdkMvgfiUcw0S+KJ3QDi0ZcBwRIgWWlInWfKsn9zbF3S+uvASJ3bqo1ytIEK7GENij8d37D/wGx8YZwfVNQn8I/VHobJtB+1DfRnm40ZnhmIF9x9qHlEmKrYYjAc93Ze5JEFu726rV3AlJLPoZ70E5hRyQSaISJ0Ws6A4b4CC3gLiYJglrjq2eyiJyRdr0TkQqX/OoBZeyE2tCM1VW92a8TnoKTsXBmg/da8t6wiFfw4knK4pxhXZzLoM7ipw7MJ3KeL3/iDChbqPbel22Janug0hbGrvpHY5VIhQl4894tMjGElLzGQgJf9L8I3ts4DkWQDg7+Bc4Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIX0MxRtmvnMBXmS+gIcOCZAHHIxK90sAl7uauE02b0=;
 b=SHIZd4ik9kgj+r3LG30YTGkjYApKbPnfqj8qa1I6pPqRmh5Fw4E+YGnTA1nrNsgkd5f6mBGrNaMErW0BkGjgQLRquG0xCG64D4zgnXQfn701n5FJMaI/H2dqXQJAabn6FbQAY6Lm2myxNfUx2JMi9DDg9s1sVHzRHu9ee085eqsl4fl3hHUYL9DQ/QcRR+BJJwGBGIskrxZimOzjwKFA0enuelBMxnQnlpQCzsxnzg2OotKDZdSdOPDwjbz/VMAl2DRKr/laKID9+TfY/hid7raB0GrLCEyxcLCiiE3Y2swWP9wqWA5tBdG1jW8tHDoYmwDiBaEy7c5leTmcfx9s6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIX0MxRtmvnMBXmS+gIcOCZAHHIxK90sAl7uauE02b0=;
 b=RwgN+lsxvI0iXkWYrvFVmUZxo01qyqMPOPPd2qPjR6UerJhRWbZNAGdgal80VXc7Dp8ovvuzIs+ruj59HyqQGOpnSIaZghmeCToPqIIINW5ye8YqSi5EfeNcFkLxEAXRhabiu0jfinRQYcT9/OAt8mWY3ZFRSLkaJ4BfUSfkGAw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9694.jpnprd01.prod.outlook.com (2603:1096:400:230::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 02:19:47 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 02:19:47 +0000
Message-ID: <877crxblq4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 14/14] ASoC: dt-bindings: renesas,rsnd.yaml: enable multi
 ports for multi Component support
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Jun 2023 02:19:47 +0000
X-ClientProxiedBy: TYCP286CA0150.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9694:EE_
X-MS-Office365-Filtering-Correlation-Id: 2564537b-9691-4763-1abc-08db71fdfc40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OTa2JbGYQFQicab6/jlyTQBKKgUlVmmLkN/UAWetfIt6ZxIII3vcSVciOPRvxRycZ1SDW2zGuh7YNy3E3cl2OBcSFNqhg4D5gJ9oXwOV92jyOo/j9naUrnXFyPQHb/FiRepmGTQK88fnHEVJ0OmeI6tUsEPSB8HA5WmwTM2H6ISRLcBb0ivFBeuw8qEMEzpwegXmsSqj0flCwQdPOGSUX5A56sXhVCZQPrBzt+XWzN1XPAITSHxVidPF6YPBdhcxExmPBKbOBtO0BsAWh8Z+BX0a4OKNaQBX27NZqa16aqw7hyYMtFr8wJsA7I/qTMUGkutrLdQlcjQLZZih5Y4H2ebUuWFr9RRHK6bpREOrMMcSb3QO3Stlh4SQO694i8ly+h85fOu0JWdCpnOdo8C/PpUZtxJrEhOYrmDGX/3nIsptJSKnRhQvQLsHJTVpY3wwgxcDmzoO4HritOqbkKVax1IQjyxmSZU6QVsE3UkYucyNqmFxQcNxpmDMyRwnXx05YG65xsQlDtzTu9PcqG5ijH1+LAAxqmBR1Na4dfbj3Acol7A8t1b9DqKPrlZg7dtmlx0iPrQ9UVI1UXifdBwEgaVOS/4sHO+rplHv8tWc8pDCTZ/JXPSZi4TEV8EwZ9Lw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199021)(36756003)(66946007)(66476007)(478600001)(83380400001)(52116002)(6486002)(5660300002)(86362001)(66556008)(2906002)(41300700001)(8936002)(316002)(4326008)(6916009)(8676002)(186003)(6512007)(38100700002)(38350700002)(6506007)(2616005)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rqHKUZP26svawlgDxdLVX6pJkMLXR4GzWDpKulPeC8OVugMq20N+O72jO132?=
 =?us-ascii?Q?J6S+/lmR0PrECNhggT7JhfAFhfEzktoTB/MPjz66eHVGo88Kl+l2jeLmf8BJ?=
 =?us-ascii?Q?bp9XuehCDEcncVTmHh3VeTEHc8Vlw05QNvXJ2mpo1w9vG2oPhEIwc20p+d03?=
 =?us-ascii?Q?IKsemcfQD7GQeYmu6xcEtpQqTqok0pLRB47PheHxRN//ZSji+GDexUu4Pdf1?=
 =?us-ascii?Q?m5O+6XDubm24QqXkB9tuPrfB1efiMRb+zXkgOjuoBhEFDbz9BXmLCx2F0L97?=
 =?us-ascii?Q?vsrkg3OTzRhMZt26uuxVLaYLvk4ZHczsXTuaijbW2CiOjZv+xzJYDGWw6FvA?=
 =?us-ascii?Q?20SeTRDKQnkb96XTOTV6S1bXm60gXu1GpN4LM5ph2/x4Vd8m6lo2rAkZ0gh5?=
 =?us-ascii?Q?BwpGr/Dbk15Gfdu92/v01uArA3nSnM1qHMH8DiqNfJvO3otvyI416i2xf4L+?=
 =?us-ascii?Q?jfnMaXjhZkH+GqsiVJW4fcUJSOKlZL3f4ynf/YTrm7wVk2DOMj/2S0S/OYUd?=
 =?us-ascii?Q?aQmYd7jsk5w8aiPfcYJk3srgG0jnNk5Snp3toUSpaXsSeEUyue0aky7CtiMh?=
 =?us-ascii?Q?bpA2/Af8K1ygd3dp4eFcorpeHxWG8fTBQqDZ11bpa67Eih+S164LHvGVeTaR?=
 =?us-ascii?Q?t99kri52163H2+zcV68vDAaSsHCpNKz8y0mSIXKIWic0tK2JKXihjYtMNfze?=
 =?us-ascii?Q?+w1It4j9D9LcvMlj3MtFb3N6KgcnK5tzF1LE4ZlZNtJ20YcCrDs4MbE9v/Id?=
 =?us-ascii?Q?aLtxfYGEznjvm3ApJGujwDVBiruYZvKuZLX4sgfAGydNTd67wkcQiR3wu9gT?=
 =?us-ascii?Q?zT2PaG5cwQDC2otM3/75tpW64HUS2QjKlgt6w12vwEKX5tlYRLMwllBE/Vkp?=
 =?us-ascii?Q?vvzOvA4SXKDZb8Y07qKbyry6tjOSzfdqHy0vGn5NzrT591c+1Rtr36zljYpz?=
 =?us-ascii?Q?2VfcLxC45kIh0FeTKK7zx8A/qF2JeYJI8FKVSq+jvT1dYPIi7nEMuXtWAhC+?=
 =?us-ascii?Q?Rd1SmQx9CMlh764bQm3AJGVySd07/jrIoHI3U5ibH5C7s0becNLZ2+GkFTvV?=
 =?us-ascii?Q?6dMPJXF5md0xouivK4ctQpmVqoJ5cm1aV06x6uis6aLIW3regD1RXNzxH8Jf?=
 =?us-ascii?Q?1AEJ4OfyTFKQuklSZd55tgeSLZDYeuGyJWOoODFg+pHRShNmkoAb7L9nUHb0?=
 =?us-ascii?Q?gIptnIeJuJMCA4hay6KUzOMFEjCWRmQsk8b7VjKzZazLMM6lAWQP6PCpq40t?=
 =?us-ascii?Q?gYrTOOGkdZalq44yzFjII+YAuLAdkn9qaAbioNKZ5h45NhA9iE1TwxoETRBV?=
 =?us-ascii?Q?UdkzuP22ebehX1zRz9f9JUnxAAfkKPgy12jOa+OZVetU9FoZDvmczrH5GATo?=
 =?us-ascii?Q?ZJ8SuSqgLsCuOXrKPlnsJQfcHenMVtep3ljEf47FUiG8dJOiqLfcq+hGHhL3?=
 =?us-ascii?Q?x05i+6dzWFzD9VgiEdnDhyEghLgk56PVOt+ZQiav8L6DdFegli8BkaFhKbkK?=
 =?us-ascii?Q?c5wzw5UpSCmme+zeCEfE8p4tRy+grqOcowNDSnRfH1crJ7TN0WOslV2YlMHs?=
 =?us-ascii?Q?G3zhhoR15V2ZQQmqGubNCBegQJqOdSi3y12rjhAX4aXKtm1jBelOyQeZRq6F?=
 =?us-ascii?Q?x6OwYpmCbxKKt45dl1sbgUE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2564537b-9691-4763-1abc-08db71fdfc40
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 02:19:47.6977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 C7LwkkNV/TVJwDbhd3XEJkc9cAAteCLjzZ701qfDUDKk9SyrVxht0agflVwekZhtWeiUzWQ3I6dzd+nnKSLlunmTsAuelDAzFvADhEL7pb24kKUb9Z5HX47iUUL6ovpk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9694
Message-ID-Hash: BZQMGRFEHNXKDBG62SLBANJVWI5FFB5D
X-Message-ID-Hash: BZQMGRFEHNXKDBG62SLBANJVWI5FFB5D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BZQMGRFEHNXKDBG62SLBANJVWI5FFB5D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To enable multi Component support, "multi ports" is needed for Audio Graph
Card/Card2, and "multi rcar_sound,dai" is needed for Simple Audio Card.
This patch enable these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../bindings/sound/renesas,rsnd.yaml          | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index d9808b130e8d..13a5a0a10fe6 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -91,6 +91,12 @@ properties:
       it must be 1 if your system has audio_clkout0/1/2/3
     enum: [0, 1]
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
   clock-frequency:
     description: for audio_clkout0/1/2/3
 
@@ -117,13 +123,7 @@ properties:
     description: List of necessary clock names.
     # details are defined below
 
-  ports:
-    $ref: audio-graph-port.yaml#/definitions/port-base
-    unevaluatedProperties: false
-    patternProperties:
-      '^port(@[0-9a-f]+)?$':
-        $ref: "#/definitions/port-def"
-
+  # ports is below
   port:
     $ref: "#/definitions/port-def"
 
@@ -242,8 +242,9 @@ properties:
           - interrupts
     additionalProperties: false
 
+patternProperties:
   # For DAI base
-  rcar_sound,dai:
+  'rcar_sound,dai(@[0-9a-f]+)?$':
     description: DAI subnode.
     type: object
     patternProperties:
@@ -263,6 +264,13 @@ properties:
               - capture
     additionalProperties: false
 
+  'ports(@[0-9a-f]+)?$':
+    $ref: audio-graph-port.yaml#/definitions/port-base
+    unevaluatedProperties: false
+    patternProperties:
+      '^port(@[0-9a-f]+)?$':
+        $ref: "#/definitions/port-def"
+
 required:
   - compatible
   - reg
-- 
2.25.1

