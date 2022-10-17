Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6A5601DBD
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 01:39:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B98498E34;
	Tue, 18 Oct 2022 01:38:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B98498E34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666049979;
	bh=ts9qgAGZ+NfUp8D0yN/ZbyZ5Yspjers7nlTJh0lV7Wk=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Aust6ibviLlPV/gOsQDj6yhHyP0OubUVjnWwIHg9EDWUHfTyZoBWlqb7v3bCRWIGG
	 cdZOnNdlTbdIoXlGWdgW5q6JDPC2pvv5olUpjogDmbu+bB3fUfUUJeGbe+LCDnbuvz
	 Kg50pt/PmElo6qO60w3DIdtSK0nte/srjMqEdc0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FEF6F8057F;
	Tue, 18 Oct 2022 01:37:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD53AF800AA; Tue, 18 Oct 2022 01:37:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2132.outbound.protection.outlook.com [40.107.114.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3863CF804D9
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 01:37:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3863CF804D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="hgALOVKd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XoxvUM83RfD6R2ZORmX32YikJCFp0wVH5dGLPEHCUS6bI26jZH4en1LlwXwY4czsvgkAyi+v/HHPz7KioD7Etz9U6LOuXnsOXv543Lq4f98gZmD7UzHdxEjfK/v2QG8b/FWt1lZ967d/BbcC82e0yb6pvOdembVOVNoyAbXq9yPR/cZxDz0PAp504UMA79QBSQHXmT8DNz25ZU2UXfjMe+27wqSyoHvMbVqOQhR+bpEyieYBfRzSUGd/6uZzTmeuZCY2Bhscn2735ywWeP5xjq1XR5ek3Uez+Et5+s97k/XBwI5whnraWCneuns9Y5es7kjP+X7Id06wyQ6i/uVEGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+uZwWuHOzVDByXqiRsc3L1cGM5dl4icoq7mH26bXiw=;
 b=Di9AwkpLKh1opOE0rXBis3juDlfgd4n/aS6Ue1FSa+E4HUpVIOuSX4dUY42pHdhzaPtaeo6E1ZXdzcVLPEhdNHx6vFbzyYz8cPjkkgrPKhEofEVgXCCrdFDrqTFIesbG3cAKbBw8ejVHrr+buO2cwQN3B9bNT8fX/DhpUpvAsb4fFhGFuhULzKD65k470OQ9OdbnhAMg6F4Xe6ZF+6e63wFySeA6JhFDaQtPybDW7whtMBMhvag0n/PissjIyrRS71EG08Pk7Gw+Q9biZhYbkAH7WFQyaChRqQ2ZHjvj73gSjG2ZH6Tp7qe3Y0zXSqU4tTmylJwhLEUW0Vl647Q5JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+uZwWuHOzVDByXqiRsc3L1cGM5dl4icoq7mH26bXiw=;
 b=hgALOVKdNOjz7g08xNcKOiGXmJv3Bl0QYoGi5sIXCKhPU7aj+RJ8fT+SFdJtN3BC62JkJyUSWG74jI6nU6LcGfA7A32yE1pyDDqiw/MXl4qRIXOE4rEpsYImfOyXBA0vkMKgRaPpjwK6lFWopIQGrRZ8ocWX+iq5e9yh/ccYhk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8180.jpnprd01.prod.outlook.com (2603:1096:604:176::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 23:37:21 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8860:a9ae:8e74:ec53]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8860:a9ae:8e74:ec53%6]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 23:37:21 +0000
Message-ID: <87pmeqowcu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/11] ASoC: soc-dapm.h: cleanup white space
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
References: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Oct 2022 23:37:21 +0000
X-ClientProxiedBy: TYCPR01CA0187.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::8) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f7ad0b3-9286-4e03-d6f1-08dab0988975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S2cbnN4EhvXzEHZR8rojDQKPsC3Ehbbjmnhn9JSkmNgyuWNPAjl3EhbinpuZZ+mn7fdGR/Nozn0omM2z46P2OJLBdNf5oZIQXox4nABxCYgdOknfG9Hgq2G/5WToc/wGT1qzFnRHc2OFXXjZ44jaiYtPaHB1oxi/eqNv2cDMTUTtUqXH+at3OIn3K9MN+cw9S/yn6jek5vDwWBSZr6u9DiKad3PQlHL5tZj5fczlko4OUeCGIbSyLchHdDm2njyyOJW3CX9YUmm471kwsuYQIt3OqXX5vT2TaXb3/h7seXMeoaZPQjF6PULg1BIR6K5xhFPErCfiP/eUlRkJO5o6CanjvyKEB7LKf0L6VClHINtOlG7MDTgWaFiA0AJ0zRc9TyFngLhZX2IRxkCV4/K0VEaWKe7cEAUxZWhz9k0lBY+YWSChZRZZ1CgIvs6KWRSchumUen6/3AdpUhtFi6rakpDWhc6bvKbYlH2hfddipMac/mTpsU2bHfQfqPfmn3BdFl5En2qicF0JwsXDxgQE/x9SSf5EQ+OyVgB5h+GB6/HLCelPwnYXD9vX2Zyt0MhRaq7wx7YzOpkr8qbiil03gHh/muaIo5cLwHa5vFIdCPRFDx5fs25yTgGvnVmEIYigLauG9jA123oFFsquQGVXX9W2qWrorYSzuf0uklG77pTvJa6QVqmFJ2uLz9eIsBdbUrJTrGrnZ1B5CmOnYahTlbV9dGH7TYlM9V+ZLJb/MD066FjpPv+5qVbsOFdAs4zoW20sx9lp3BJCfvQTDZ0rxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(451199015)(36756003)(86362001)(5660300002)(38100700002)(30864003)(2906002)(38350700002)(2616005)(186003)(83380400001)(316002)(6506007)(6512007)(478600001)(6486002)(26005)(6916009)(66946007)(66556008)(66476007)(41300700001)(4326008)(52116002)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YdnN1SipelMu9PMICRXaR9s7hNF7U7TT7QGAR8zCuCBPWdlZ6x++0BWAQM96?=
 =?us-ascii?Q?h4rJ2SEGWSIXnUPlZcDDYZFYF98t/ahUYyZVs9Co8AJH7zIptacItFCqlTyy?=
 =?us-ascii?Q?8WqS4QlczAFnUBKQ1PNuTHtE1//E/sM/1aWBNoAhOHMk79MWsbXQGwlswHTz?=
 =?us-ascii?Q?g734LggjZdLXd1xKmnTHZONpxKIp7rFJoi1J1DxTboPTcrriYWgOND9miVyz?=
 =?us-ascii?Q?3ND4YnW0nIHa54PhJlY/VVhC3DQ5kgWqJm5w3Xnc2e6G55IM0bvChzrGJi44?=
 =?us-ascii?Q?JLNSNCEnNHm2ngc7zFAdqxjf5IamTw14d87d0gDcqJCz/1KNby3MkqaoDzm2?=
 =?us-ascii?Q?5lZxJjgi/BSfpH2Upfjc5747IDfr18Hz9w+pzPrGDD296KhrKptPhchy+P3w?=
 =?us-ascii?Q?y2eLR1iIk7phQJLqk58AXJqQRZKHUJaeAw8zDoLMcsiBSrLLw/cP/LDL7W56?=
 =?us-ascii?Q?ZwKOARV/tu0HnXe4R5hEuQ1lyq/rG2jY4l54EuqgFBkehpf/SeU1O/0JGnPk?=
 =?us-ascii?Q?e5Fsyj7MPVm9UQSJLDJlfuWaRDguduO4bJxDCyyIfXd3T2c/J7UWuAAyTwf3?=
 =?us-ascii?Q?s5UM/qhi7VYxYbVrZzOvNJ0pp3Nnk237TUQcNk+CbN/cmTGXfuQeIpcmFkaY?=
 =?us-ascii?Q?fNmriJhgpkeqPiC3H33exwEPH1vCBEI3SlfUcfIDRDIASzToPlJx5SmJvAPx?=
 =?us-ascii?Q?CeXKTtbKMI+rkhqt2NrxYRqm/qFp6LKW45x2kcJpETNesvYOqUgHWbSBdEUp?=
 =?us-ascii?Q?JpgESifbIX8htsgv5k6HI2gHWhxX1dycJNH6334wmjMKLLbRo2Gr9DllRyE+?=
 =?us-ascii?Q?qC/XyMswThdmeBYUd19cB36aV7kG/a32XCm4npB+wGKjzbr2n8CINwFYSGkS?=
 =?us-ascii?Q?6BkvjgRJ43NePm5mn9ldjyZwmvTKWD8ZjzmhipqLPs7rTraUd8CVSRhLRTiF?=
 =?us-ascii?Q?26AyBQAbDUDBOT7B51ilCjf31s94Qwr/723vVSs36bp3/4ne1cIecP0vXA+n?=
 =?us-ascii?Q?QlAB0rB5iSOYxdBz/Al0lA+q9wV2KkE2cPi15r6I4mm5bLIGJnUBw4Dgmgi8?=
 =?us-ascii?Q?U8JiknoZwPGrCFA7Hm//CZi4Z4zi93b4uEniIgJU3F2BlA7fu0t4+MDqbJnH?=
 =?us-ascii?Q?Y4R0wdG6X+yEvqHD6WH3wB1bobeMUCrADSQo3IiUYFw5d5A656zlmHzlzGEo?=
 =?us-ascii?Q?behI8KZjtt9Lzvr3jI/HGepwJrZ+eW1kH9X3XMcucYqJzKl9OOLIVcLodMoM?=
 =?us-ascii?Q?EU5v/RCTOymP9ptNGGoP7pdgv44vxBl8ju5Zf8Jlwrpmyaaq72w8nbl6eCEt?=
 =?us-ascii?Q?4oHFX1s9NwyKl/HntT2xHjfD3+0uwCAniXvC6uz3nxMRDMOoU10/HTPlvy0a?=
 =?us-ascii?Q?SV8ArwSmehMOVpUddRboeI3OcbNgL+M021eFHSCgrQjQHJ/5oWn/FWTjlnlu?=
 =?us-ascii?Q?TYSWCWia002wEQqdEmV27wZnJ/Fo9Fira4JqVnF73h4HAqZI4i2CaOYslmCq?=
 =?us-ascii?Q?sEAE6l9dRBwiPw+SDGNV99A0n/zLZ85w6aizoXTG+QsQyfz00PoA+g/zBie3?=
 =?us-ascii?Q?mQz+SsRrw/PdJNjbH7FygPysWVzFhX6g0/oQBuMjzG9MMmMQsY84gtcAGIrG?=
 =?us-ascii?Q?Qa9eUrzuPbH1kzACOuHUbW0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7ad0b3-9286-4e03-d6f1-08dab0988975
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 23:37:21.5314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gA22ep2R0oasBDzlddNrcX7990wYwL4BBbTnAtgWxJQzGLsHqoE6N3mC2eX2mHbuFrv8TRBNbRlHG2pOwwqNWx2RcJ912i5nX5mJQcsVDaS8QtB6x3afHwz6b9PPJSiG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8180
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

soc-dapm.h defines many things, but it is using
randam white space and tag.
This patch do nothing, but cleanup its white space.
This patch cleanup also 100 char in 1 line.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 173 ++++++++++++++++-----------------------
 1 file changed, 71 insertions(+), 102 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 29d5700393c6..44597e63344d 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -341,31 +341,27 @@ struct soc_enum;
 #define SND_SOC_DAPM_STREAM_STOP		0x2
 #define SND_SOC_DAPM_STREAM_SUSPEND		0x4
 #define SND_SOC_DAPM_STREAM_RESUME		0x8
-#define SND_SOC_DAPM_STREAM_PAUSE_PUSH	0x10
+#define SND_SOC_DAPM_STREAM_PAUSE_PUSH		0x10
 #define SND_SOC_DAPM_STREAM_PAUSE_RELEASE	0x20
 
 /* dapm event types */
-#define SND_SOC_DAPM_PRE_PMU	0x1 	/* before widget power up */
-#define SND_SOC_DAPM_POST_PMU	0x2		/* after widget power up */
-#define SND_SOC_DAPM_PRE_PMD	0x4 	/* before widget power down */
-#define SND_SOC_DAPM_POST_PMD	0x8		/* after widget power down */
-#define SND_SOC_DAPM_PRE_REG	0x10	/* before audio path setup */
-#define SND_SOC_DAPM_POST_REG	0x20	/* after audio path setup */
-#define SND_SOC_DAPM_WILL_PMU   0x40    /* called at start of sequence */
-#define SND_SOC_DAPM_WILL_PMD   0x80    /* called at start of sequence */
-#define SND_SOC_DAPM_PRE_POST_PMD \
-				(SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD)
-#define SND_SOC_DAPM_PRE_POST_PMU \
-				(SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU)
+#define SND_SOC_DAPM_PRE_PMU		0x1	/* before widget power up */
+#define SND_SOC_DAPM_POST_PMU		0x2	/* after  widget power up */
+#define SND_SOC_DAPM_PRE_PMD		0x4	/* before widget power down */
+#define SND_SOC_DAPM_POST_PMD		0x8	/* after  widget power down */
+#define SND_SOC_DAPM_PRE_REG		0x10	/* before audio path setup */
+#define SND_SOC_DAPM_POST_REG		0x20	/* after  audio path setup */
+#define SND_SOC_DAPM_WILL_PMU		0x40	/* called at start of sequence */
+#define SND_SOC_DAPM_WILL_PMD		0x80	/* called at start of sequence */
+#define SND_SOC_DAPM_PRE_POST_PMD	(SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD)
+#define SND_SOC_DAPM_PRE_POST_PMU	(SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU)
 
 /* convenience event type detection */
-#define SND_SOC_DAPM_EVENT_ON(e)	\
-	(e & (SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU))
-#define SND_SOC_DAPM_EVENT_OFF(e)	\
-	(e & (SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD))
+#define SND_SOC_DAPM_EVENT_ON(e)	(e & (SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU))
+#define SND_SOC_DAPM_EVENT_OFF(e)	(e & (SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD))
 
 /* regulator widget flags */
-#define SND_SOC_DAPM_REGULATOR_BYPASS     0x1     /* bypass when disabled */
+#define SND_SOC_DAPM_REGULATOR_BYPASS	0x1	/* bypass when disabled */
 
 struct snd_soc_dapm_widget;
 enum snd_soc_dapm_type;
@@ -396,18 +392,13 @@ enum snd_soc_bias_level {
 	SND_SOC_BIAS_ON = 3,
 };
 
-int dapm_regulator_event(struct snd_soc_dapm_widget *w,
-			 struct snd_kcontrol *kcontrol, int event);
-int dapm_clock_event(struct snd_soc_dapm_widget *w,
-			 struct snd_kcontrol *kcontrol, int event);
-int dapm_pinctrl_event(struct snd_soc_dapm_widget *w,
-			 struct snd_kcontrol *kcontrol, int event);
+int dapm_regulator_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
+int dapm_clock_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
+int dapm_pinctrl_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
 
 /* dapm controls */
-int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol);
-int snd_soc_dapm_get_volsw(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol);
+int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol);
+int snd_soc_dapm_get_volsw(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol);
 int snd_soc_dapm_get_enum_double(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
 int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
@@ -419,30 +410,24 @@ int snd_soc_dapm_get_pin_switch(struct snd_kcontrol *kcontrol,
 int snd_soc_dapm_put_pin_switch(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *uncontrol);
 int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
-	const struct snd_soc_dapm_widget *widget,
-	int num);
-struct snd_soc_dapm_widget *snd_soc_dapm_new_control(
-		struct snd_soc_dapm_context *dapm,
+	const struct snd_soc_dapm_widget *widget, int num);
+struct snd_soc_dapm_widget *snd_soc_dapm_new_control(struct snd_soc_dapm_context *dapm,
 		const struct snd_soc_dapm_widget *widget);
-struct snd_soc_dapm_widget *snd_soc_dapm_new_control_unlocked(
-		struct snd_soc_dapm_context *dapm,
+struct snd_soc_dapm_widget *snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 		const struct snd_soc_dapm_widget *widget);
-int snd_soc_dapm_new_dai_widgets(struct snd_soc_dapm_context *dapm,
-				 struct snd_soc_dai *dai);
+int snd_soc_dapm_new_dai_widgets(struct snd_soc_dapm_context *dapm, struct snd_soc_dai *dai);
 void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w);
 int snd_soc_dapm_link_dai_widgets(struct snd_soc_card *card);
 void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card);
 
 int snd_soc_dapm_update_dai(struct snd_pcm_substream *substream,
-			    struct snd_pcm_hw_params *params,
-			    struct snd_soc_dai *dai);
+			    struct snd_pcm_hw_params *params, struct snd_soc_dai *dai);
 
 /* dapm path setup */
 int snd_soc_dapm_new_widgets(struct snd_soc_card *card);
 void snd_soc_dapm_free(struct snd_soc_dapm_context *dapm);
 void snd_soc_dapm_init(struct snd_soc_dapm_context *dapm,
-		       struct snd_soc_card *card,
-		       struct snd_soc_component *component);
+		       struct snd_soc_card *card, struct snd_soc_component *component);
 int snd_soc_dapm_add_routes(struct snd_soc_dapm_context *dapm,
 			    const struct snd_soc_dapm_route *route, int num);
 int snd_soc_dapm_del_routes(struct snd_soc_dapm_context *dapm,
@@ -452,46 +437,34 @@ int snd_soc_dapm_weak_routes(struct snd_soc_dapm_context *dapm,
 void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w);
 
 /* dapm events */
-void snd_soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream,
-	int event);
+void snd_soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream, int event);
 void snd_soc_dapm_stream_stop(struct snd_soc_pcm_runtime *rtd, int stream);
 void snd_soc_dapm_shutdown(struct snd_soc_card *card);
 
 /* external DAPM widget events */
 int snd_soc_dapm_mixer_update_power(struct snd_soc_dapm_context *dapm,
-		struct snd_kcontrol *kcontrol, int connect,
-		struct snd_soc_dapm_update *update);
+		struct snd_kcontrol *kcontrol, int connect, struct snd_soc_dapm_update *update);
 int snd_soc_dapm_mux_update_power(struct snd_soc_dapm_context *dapm,
 		struct snd_kcontrol *kcontrol, int mux, struct soc_enum *e,
 		struct snd_soc_dapm_update *update);
 
 /* dapm sys fs - used by the core */
 extern struct attribute *soc_dapm_dev_attrs[];
-void snd_soc_dapm_debugfs_init(struct snd_soc_dapm_context *dapm,
-				struct dentry *parent);
+void snd_soc_dapm_debugfs_init(struct snd_soc_dapm_context *dapm, struct dentry *parent);
 
 /* dapm audio pin control and status */
-int snd_soc_dapm_enable_pin(struct snd_soc_dapm_context *dapm,
-			    const char *pin);
-int snd_soc_dapm_enable_pin_unlocked(struct snd_soc_dapm_context *dapm,
-				     const char *pin);
-int snd_soc_dapm_disable_pin(struct snd_soc_dapm_context *dapm,
-			     const char *pin);
-int snd_soc_dapm_disable_pin_unlocked(struct snd_soc_dapm_context *dapm,
-				      const char *pin);
+int snd_soc_dapm_enable_pin(struct snd_soc_dapm_context *dapm, const char *pin);
+int snd_soc_dapm_enable_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
+int snd_soc_dapm_disable_pin(struct snd_soc_dapm_context *dapm, const char *pin);
+int snd_soc_dapm_disable_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
 int snd_soc_dapm_nc_pin(struct snd_soc_dapm_context *dapm, const char *pin);
-int snd_soc_dapm_nc_pin_unlocked(struct snd_soc_dapm_context *dapm,
-				 const char *pin);
-int snd_soc_dapm_get_pin_status(struct snd_soc_dapm_context *dapm,
-				const char *pin);
+int snd_soc_dapm_nc_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
+int snd_soc_dapm_get_pin_status(struct snd_soc_dapm_context *dapm, const char *pin);
 int snd_soc_dapm_sync(struct snd_soc_dapm_context *dapm);
 int snd_soc_dapm_sync_unlocked(struct snd_soc_dapm_context *dapm);
-int snd_soc_dapm_force_enable_pin(struct snd_soc_dapm_context *dapm,
-				  const char *pin);
-int snd_soc_dapm_force_enable_pin_unlocked(struct snd_soc_dapm_context *dapm,
-					   const char *pin);
-int snd_soc_dapm_ignore_suspend(struct snd_soc_dapm_context *dapm,
-				const char *pin);
+int snd_soc_dapm_force_enable_pin(struct snd_soc_dapm_context *dapm, const char *pin);
+int snd_soc_dapm_force_enable_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
+int snd_soc_dapm_ignore_suspend(struct snd_soc_dapm_context *dapm, const char *pin);
 unsigned int dapm_kcontrol_get_value(const struct snd_kcontrol *kcontrol);
 
 /* Mostly internal - should not normally be used */
@@ -500,40 +473,35 @@ void dapm_mark_endpoints_dirty(struct snd_soc_card *card);
 /* dapm path query */
 int snd_soc_dapm_dai_get_connected_widgets(struct snd_soc_dai *dai, int stream,
 	struct snd_soc_dapm_widget_list **list,
-	bool (*custom_stop_condition)(struct snd_soc_dapm_widget *,
-				      enum snd_soc_dapm_direction));
+	bool (*custom_stop_condition)(struct snd_soc_dapm_widget *, enum snd_soc_dapm_direction));
 void snd_soc_dapm_dai_free_widgets(struct snd_soc_dapm_widget_list **list);
 
-struct snd_soc_dapm_context *snd_soc_dapm_kcontrol_dapm(
-	struct snd_kcontrol *kcontrol);
+struct snd_soc_dapm_context *snd_soc_dapm_kcontrol_dapm(struct snd_kcontrol *kcontrol);
+struct snd_soc_dapm_widget *snd_soc_dapm_kcontrol_widget(struct snd_kcontrol *kcontrol);
 
-struct snd_soc_dapm_widget *snd_soc_dapm_kcontrol_widget(
-		struct snd_kcontrol *kcontrol);
-
-int snd_soc_dapm_force_bias_level(struct snd_soc_dapm_context *dapm,
-	enum snd_soc_bias_level level);
+int snd_soc_dapm_force_bias_level(struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level);
 
 /* dapm widget types */
 enum snd_soc_dapm_type {
 	snd_soc_dapm_input = 0,		/* input pin */
 	snd_soc_dapm_output,		/* output pin */
-	snd_soc_dapm_mux,			/* selects 1 analog signal from many inputs */
-	snd_soc_dapm_demux,			/* connects the input to one of multiple outputs */
-	snd_soc_dapm_mixer,			/* mixes several analog signals together */
-	snd_soc_dapm_mixer_named_ctl,		/* mixer with named controls */
-	snd_soc_dapm_pga,			/* programmable gain/attenuation (volume) */
-	snd_soc_dapm_out_drv,			/* output driver */
-	snd_soc_dapm_adc,			/* analog to digital converter */
-	snd_soc_dapm_dac,			/* digital to analog converter */
+	snd_soc_dapm_mux,		/* selects 1 analog signal from many inputs */
+	snd_soc_dapm_demux,		/* connects the input to one of multiple outputs */
+	snd_soc_dapm_mixer,		/* mixes several analog signals together */
+	snd_soc_dapm_mixer_named_ctl,	/* mixer with named controls */
+	snd_soc_dapm_pga,		/* programmable gain/attenuation (volume) */
+	snd_soc_dapm_out_drv,		/* output driver */
+	snd_soc_dapm_adc,		/* analog to digital converter */
+	snd_soc_dapm_dac,		/* digital to analog converter */
 	snd_soc_dapm_micbias,		/* microphone bias (power) - DEPRECATED: use snd_soc_dapm_supply */
-	snd_soc_dapm_mic,			/* microphone */
-	snd_soc_dapm_hp,			/* headphones */
-	snd_soc_dapm_spk,			/* speaker */
-	snd_soc_dapm_line,			/* line input/output */
+	snd_soc_dapm_mic,		/* microphone */
+	snd_soc_dapm_hp,		/* headphones */
+	snd_soc_dapm_spk,		/* speaker */
+	snd_soc_dapm_line,		/* line input/output */
 	snd_soc_dapm_switch,		/* analog switch */
-	snd_soc_dapm_vmid,			/* codec bias/vmid - to minimise pops */
-	snd_soc_dapm_pre,			/* machine specific pre widget - exec first */
-	snd_soc_dapm_post,			/* machine specific post widget - exec last */
+	snd_soc_dapm_vmid,		/* codec bias/vmid - to minimise pops */
+	snd_soc_dapm_pre,		/* machine specific pre widget - exec first */
+	snd_soc_dapm_post,		/* machine specific post widget - exec last */
 	snd_soc_dapm_supply,		/* power/clock supply */
 	snd_soc_dapm_pinctrl,		/* pinctrl */
 	snd_soc_dapm_regulator_supply,	/* external regulator */
@@ -599,9 +567,9 @@ struct snd_soc_dapm_path {
 	};
 
 	/* status */
-	u32 connect:1;	/* source and sink widgets are connected */
-	u32 walking:1;  /* path is in the process of being walked */
-	u32 weak:1;	/* path ignored for power management */
+	u32 connect:1;		/* source and sink widgets are connected */
+	u32 walking:1;		/* path is in the process of being walked */
+	u32 weak:1;		/* path ignored for power management */
 	u32 is_supply:1;	/* At least one of the connected widgets is a supply */
 
 	int (*connected)(struct snd_soc_dapm_widget *source,
@@ -615,8 +583,8 @@ struct snd_soc_dapm_path {
 /* dapm widget */
 struct snd_soc_dapm_widget {
 	enum snd_soc_dapm_type id;
-	const char *name;		/* widget name */
-	const char *sname;	/* stream name */
+	const char *name;			/* widget name */
+	const char *sname;			/* stream name */
 	struct list_head list;
 	struct snd_soc_dapm_context *dapm;
 
@@ -635,7 +603,7 @@ struct snd_soc_dapm_widget {
 	unsigned char connected:1;		/* connected codec pin */
 	unsigned char new:1;			/* cnew complete */
 	unsigned char force:1;			/* force state */
-	unsigned char ignore_suspend:1;         /* kept enabled over suspend */
+	unsigned char ignore_suspend:1;		/* kept enabled over suspend */
 	unsigned char new_power:1;		/* power from this run */
 	unsigned char power_checked:1;		/* power checked this run */
 	unsigned char is_supply:1;		/* Widget is a supply type widget */
@@ -682,13 +650,14 @@ struct snd_soc_dapm_update {
 /* DAPM context */
 struct snd_soc_dapm_context {
 	enum snd_soc_bias_level bias_level;
-	unsigned int idle_bias_off:1; /* Use BIAS_OFF instead of STANDBY */
-	/* Go to BIAS_OFF in suspend if the DAPM context is idle */
-	unsigned int suspend_bias_off:1;
 
-	struct device *dev; /* from parent - for debug */
-	struct snd_soc_component *component; /* parent component */
-	struct snd_soc_card *card; /* parent card */
+	/* bit field */
+	unsigned int idle_bias_off:1;		/* Use BIAS_OFF instead of STANDBY */
+	unsigned int suspend_bias_off:1;	/* Use BIAS_OFF in suspend if the DAPM is idle */
+
+	struct device *dev;			/* from parent - for debug */
+	struct snd_soc_component *component;	/* parent component */
+	struct snd_soc_card *card;		/* parent card */
 
 	/* used during DAPM updates */
 	enum snd_soc_bias_level target_bias_level;
@@ -762,8 +731,8 @@ enum snd_soc_dapm_direction {
 
 #define SND_SOC_DAPM_DIR_TO_EP(x) BIT(x)
 
-#define SND_SOC_DAPM_EP_SOURCE SND_SOC_DAPM_DIR_TO_EP(SND_SOC_DAPM_DIR_IN)
-#define SND_SOC_DAPM_EP_SINK SND_SOC_DAPM_DIR_TO_EP(SND_SOC_DAPM_DIR_OUT)
+#define SND_SOC_DAPM_EP_SOURCE	SND_SOC_DAPM_DIR_TO_EP(SND_SOC_DAPM_DIR_IN)
+#define SND_SOC_DAPM_EP_SINK	SND_SOC_DAPM_DIR_TO_EP(SND_SOC_DAPM_DIR_OUT)
 
 /**
  * snd_soc_dapm_widget_for_each_sink_path - Iterates over all paths in the
-- 
2.25.1

