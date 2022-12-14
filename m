Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B54E964C1D3
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 02:25:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5728C18B9;
	Wed, 14 Dec 2022 02:24:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5728C18B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670981112;
	bh=XE32pqmOvHzHx+EAxzdBOFAGdK0KSV4VaC+xrgPysj0=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TuCbJwKsnmeBRuMxqxM1KRl9VJs9NsbLkTchzHUBVs20+SP0lWe6IzTJ9fLs40Ywj
	 C28Ndmnh4r4/b0O2B8XsX9+RlqG4SNIC1xE0cp70RCOGbKo4lzOV/LLLEdnsIOCrvs
	 HfC3JUy3KyP7Rhm+noD6E7GCDOVsba5wI4jy+g+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DA87F80537;
	Wed, 14 Dec 2022 02:23:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF476F80551; Wed, 14 Dec 2022 02:23:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2091.outbound.protection.outlook.com [40.107.113.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60764F80536
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 02:23:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60764F80536
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=cJuztsOS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMXTkIta5bs1QRykzCDoXsiFvbgQ2czEswyp2pBV+2RQP4e++EfVXHHaaahsBoNv0mJHTSEHeEYnAYNk+PKOSwJlHFfNJpOMR5o7FuZPLxQMUYx4/0Qv6OsRI1M3F0rshJAPpsGqUN+QEg6H3q/qlsxHfc2ZVYLxsILPw9MKMvvjEh+mxszGXYLWL3MgABVUBDFvGFCKCMjtnEHWJaafvCsHesk+4kNypQQHKUZJum1DJsrgJcpydAycP6Lv5l9KBYFAzLrD9jiuB+UqoTiqzozq6ApnaqD/TeBcsgrFfXQ8TTlUmSkhbkDfy3nL1Vm2W6lcYPC2NYPRPxPcDnNy/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2w41nrpzvW9yNY1Tg4DK63hjFHtdJ40U6K7Xr37MCk=;
 b=BCVtTGEt+jFNfVl1LbxmiEX0e99iKj3rOYknK8FLcOq7hJo3fAHausJVg1ppneFaRl+295GHDpMj7ThOAxeY3D/ToaPkEP0HvyP/oWqemxQN6kzAj957r3THpm64b7nK2oeclmtkin24Y1IBCOrCpKBAZuadOFTZ8omQWK9B080JdOzE3RKdWRrBjSNipedfwXRAafk7b84Av/VLGJAX/sFnFM0zt0ZaaQog50zfal01Gml/z9mCJN2+B/RKkE6DEpYPZioABSPQ/ZXZDKNAV8HO+VU13XQaaKXyooEnLnyQEWLX1uXvx86O1og2KGesLy0oGqR95FmLiu7bojBJTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2w41nrpzvW9yNY1Tg4DK63hjFHtdJ40U6K7Xr37MCk=;
 b=cJuztsOSR9iXVU/X90D/MzfYI8WEyYXmgfpcD4mmmWCno5swuvec2ZibGda25UHua/QkvN925jIISO2nFitF9R2rS+/O7EU7E8UGa9ug1WRtett7VyTi8Y2N79LS6zHgEbNu3nn2NUdHGQ27RUg5cS4XaRE0OGnJO0bebLyupD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9887.jpnprd01.prod.outlook.com (2603:1096:400:237::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 01:23:44 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431%8]) with mapi id 15.20.5924.011; Wed, 14 Dec 2022
 01:23:44 +0000
Message-ID: <87k02upylb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/11] ASoC: dt-bindings: ak4613: enable Of-graph
 (Audio-Graph-Card) style
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
References: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 14 Dec 2022 01:23:44 +0000
X-ClientProxiedBy: TYBP286CA0018.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::30) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9887:EE_
X-MS-Office365-Filtering-Correlation-Id: 37a046d6-3670-4cc8-2c93-08dadd71d7b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0G76UOUG9++G0J4X3TNZgiCd+R42RxntL5yvfeGLLX87B1ExC/WR1f4t2e+PMva5gASUOGplU7PFhaM2dDUKFRw+U7RjhoQVW+3XxqcWNtysUZ/0f54SenL8GaZCS+SWaCUs8T9dOOZzomepOOmkuernlOTA0XSFq4ED3rG5kWmif3m1SF4PfdxsE0vzoOiCQMoKN+rmSbi8axpDJET3mLeY63NwpFvlVNUs9y/hDubxnBqRbtlKE7JQ3dmRoXe43q+77XUN3pqrt2VVKztgSs1JPSbO7ETgC+1ccJyJDC0xIEA9h15zFUErKUZJU3nOT2lSEZRwjbZMeWA7bwINTIMJKmr5o9Z8BDyOz3XwV81jZ2/ugTVlyRWsZphbinVQXPa3nE/qRH46vpdXqE8CYUGEmC2Zn5+0kHG7vCWDAqSI7zNBgs+eQBEzWgEa89GZbN+DT3JBQNLOoRXwTBDSwozlU3/W9DuS3a5+LC8vuFhn/y5ZxDhwN5sV8sdmagLaFvGpMGj7eke8HA9MEo3ugkn9ZmrNK4BzYlkUt1d75sJMofsHPLsUgWTUzkrQQtdZ90oy/P4ty1v6otR5MBA7ajqmp2xOiD/Lrz59sbGwM3JQLLWlxozM47aQgeahehJ0dnyPelenB+j7dJGv/oJl9fKPShY4VAMIsg4yaJLpFlHQr9D/9fKoj64PNzKRqFsFDC5PBMACqJOaR6bh/5ad3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199015)(6506007)(83380400001)(41300700001)(478600001)(6486002)(2616005)(8676002)(66556008)(36756003)(4326008)(66476007)(66946007)(38350700002)(86362001)(38100700002)(2906002)(52116002)(26005)(6512007)(186003)(5660300002)(54906003)(110136005)(7416002)(316002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+gML+Oj92/SS7NAsPnh5dW3C0ihgWl6tSNZGz57RK51/iy9JQWvpCjIY+s/W?=
 =?us-ascii?Q?7Jz9fLuuS9QTc38n8xe1tBj+OCXOgafr3DwxLnbg2Ws3z3RNmY38ORLhAJ5u?=
 =?us-ascii?Q?OMr9goEMTXddLY72UxEbwquNdgtWhMVpJ2oSrLPSckrCa3AyzZRwZ9ngVpKo?=
 =?us-ascii?Q?s9XYZrTNp5mtevoJkVUfd/5RnDEqyZRPU6UbViqBVicqpPdIsLj7uOGYcowA?=
 =?us-ascii?Q?YZV3eEQ5VC52GRk+eOj/yLDPpdxTJOxifQPmO45b630tcl6gOzRaNYFos+OS?=
 =?us-ascii?Q?k2yHdckZh5YRzHva/KFgsoLKMQ3rrvGY0PObbJQWDf+O5tu5dwwuM+fx16GY?=
 =?us-ascii?Q?DRYngcoVDD/3QN6OTTgPT0J228FS97cf8NSSyM0iPwj68n3qrJ1a3uU8EIyb?=
 =?us-ascii?Q?npTDxnEthFZjEVivN0F8MCSUgJUoEMKrHZ39nj9i6QVTy4E45Tfl/R2aiZuF?=
 =?us-ascii?Q?9FkwEEWIdZxYEqKkwFf+MGKngI8QKN6JoC625W/0hrYwQDvr9r5kcIbixlL+?=
 =?us-ascii?Q?dfYQ9fTcxtqj2/bkhB48x5OM6WYJqHwWP7mEWoGY/0Y57DPZObHF0d16onMf?=
 =?us-ascii?Q?ZhWTXAQophz7RHhYh3vyc3dmk53R2xixXiiF31GkjrjQAGfcZZZ5K+VaEVCp?=
 =?us-ascii?Q?YADF0Xz+A0CuJ++Y/hMfjEEcRXu+Pr19dcgB08J/1uI307uHlsh8+ONAmhL8?=
 =?us-ascii?Q?wpfJi2Z/hJ1glGsp+EpHX/+dELuCUSLq7ue3l7isl4vNYlzGqs6dn3w2z9gl?=
 =?us-ascii?Q?jK2LQAedEc7Okf7mBXK2rvaLstiIZkmTnf6+ZE7zn5hWxnKQP84xYlNS5UHV?=
 =?us-ascii?Q?DLYjDBnQFOCMB+MHZngdwlBqvZSvcAM5Rx7bA21j+Mq9Jt8f5C1CpB/gjUbC?=
 =?us-ascii?Q?xtpZNJzPnJHmO/+6HDlToDDHaIYFQyt6GAlsHJWsp9CZFgpp4/UEFlkNqc8y?=
 =?us-ascii?Q?yM/ZiTe0Q0XVml5YTmY+R8eE9JrY5+BDdKuomGTSGvvLeAXtuXQrCSnG3lBq?=
 =?us-ascii?Q?Vziuhg7E1cgr1n8MLtBmeFJ8cJ1wZ+z4lksNe9CQef9qN0j8EVYcdbl9NxG2?=
 =?us-ascii?Q?zVIPzrHwBeQ8fFqpkfDZmLGjJc+e0BvNmrz2EbpdqBNAsz1+WAmjfPrNkINo?=
 =?us-ascii?Q?Yl90H3By9bog4IViMRDiSBq4wa/PFns8pEbCexjX+e8J87hf6+I9CBFsEz2P?=
 =?us-ascii?Q?Hf6rLLbiE2r/gukI0raBmctrIB6oSJRY+LSr673YCDb22yY59l7Wdybm7jqD?=
 =?us-ascii?Q?8n7W4dN7GrwnbscAty/QeN5zoqUEmeXYAknIAKzb09MwPLp0IHvqhuUExMEp?=
 =?us-ascii?Q?mdnr0jL8zjpZgROk+9D0HKICz78q6/BcQxcQMS7BrSaSn0YLdNoNbOEhrdgP?=
 =?us-ascii?Q?3/YpUlsMkqNhci/XFy6kb3HePJvd0V+f/toRc8fpG2VhHRemhhgTNmQRmL7+?=
 =?us-ascii?Q?9Mu/R7vjM0rAdPjmmtT00TEAszoc6b+SQmX6ScTnDa+MSQdtXg5KIYaeqUtr?=
 =?us-ascii?Q?PvWB1c6fMusq1lHxUU3JrwerB8cTuVb8tqTmciZQSleUgVLnuTk2ErAYRJf8?=
 =?us-ascii?Q?HoUAi5uLoXX1DmUYJGf1ONXkXhan8an+mIoQ5Ffn88pLDsym5nkK2hXe6Rif?=
 =?us-ascii?Q?xyRvlgAyVsgfpaSiLi8C3As=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37a046d6-3670-4cc8-2c93-08dadd71d7b2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 01:23:44.7105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sKemjk4Icra7216iv1X25klbVmGRgDin1nsOxXUaV2/bkggfm7I4UstlQomZ6CHu2DNJORYtcaUONkAZLKrRCZYg6lOiv2Ivk17kg+QH8FsP9eo8LVxz56bYLonM3TCB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9887
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
 Geert Uytterhoeven <geert+renesas@glider.be>, Sameer Pujar <spujar@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Mohan Kumar <mkumard@nvidia.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

ak4613 is possible to use Of-graph (Audio-Graph-Card) style,
but we need to indicate it. Otherwise we will get below warning.
This patch add it.

${LINUX}/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dtb: codec@10: 'port' does not match any of the regexes: '^asahi-kasei,in[1-2]-single-end$', '^asahi-kasei,out[1-6]-single-end$', 'pinctrl-[0-9]+'
	From schema: ${LINUX}/Documentation/devicetree/bindings/sound/ak4613.yaml

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/sound/ak4613.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/ak4613.yaml b/Documentation/devicetree/bindings/sound/ak4613.yaml
index aa8a258a9f1c..99a90095a76d 100644
--- a/Documentation/devicetree/bindings/sound/ak4613.yaml
+++ b/Documentation/devicetree/bindings/sound/ak4613.yaml
@@ -22,6 +22,13 @@ properties:
   "#sound-dai-cells":
     const: 0
 
+  ports:
+    $ref: audio-graph-port.yaml#/definitions/ports
+
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
 patternProperties:
   "^asahi-kasei,in[1-2]-single-end$":
     description: Input Pin 1 - 2.
-- 
2.25.1

