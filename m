Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B54482BAFC
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jan 2024 06:44:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E78010BE;
	Fri, 12 Jan 2024 06:44:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E78010BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705038293;
	bh=RCkkDb/4tISMLu6OjFmjDghJ1r+WtfgsTBY2YV/cF5o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pDrcMQA4H7OqI9IyTgzcfa/qzLaWWBoZmlVndBY/1ZuPya8E5ciCLGjZGroUvIftu
	 kxZMWVwEEGOthBgExhkJ9+SuJayjDsVdjjIPkrOSNUKZgMIeVETNVFy4yIzHTixUNG
	 29mhtRfNoopS1+0DkaYbXMul6H+Jj7TlTkBForN8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B086F805CA; Fri, 12 Jan 2024 06:44:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5F92F80589;
	Fri, 12 Jan 2024 06:44:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CC67F80254; Fri, 12 Jan 2024 06:44:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::62f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8EA3F80086
	for <alsa-devel@alsa-project.org>; Fri, 12 Jan 2024 06:44:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8EA3F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=hnBmLg8A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=McAQSdSXIZujeYJ6zgZs9deiZ7kfJUFmuKy8bCfyIUgtWhEXzP0/NaeQ0frXx6CmdfawnN2f4SjPU/2olPJ3a2YWBb6kAmiLuAWbsa5WkAMnPC4I18xCsHW5a6dVsiRbidiZEztvtXiPekNCDzsgbkqaSVpQtfhxaiS89y2Gji7PcRn+3eJjgqnAdSfF7SXg6ZLvQbUjzS/wr6uZDwP2yo0YeR7AdLtKG9dMv/nZqiTfXLpOXWM4CB3QZu+UpAzOtm44KiwZsh28pZKCUb8zljq7ttpj8GbierVNUNLa3SPEGb+50aXAA0TMUfRKh6XS/+x9MqgtD4F7UF3SLdKh0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bh+CjWBIdXQorNeBS2vlGSzaWTzdMUE5dSCwv4P9+jo=;
 b=GwJ8p3AR5FyvmE4emCq5keeNIdOX2NAxIcHEExMefmXzXwMErax8LBXkbIAs8g2ZTN2bNQXLNgw5oQ3ee4kCOCej75d0NrkH3TLpy56miPOTWijqC/r66RJOYmV9LbIaiMq9aGLbgsq+UnSA6rmHA39ahAytfRF0EXugxTq9Fu1pzqHcNvWpqwduo/+9yGsJu6sm19PZUrvBcI5c2QGI/aXnNy3S/hC0HPbsqWgegLBUQAZxGZa0PnG5kG9ArXKP32Qr/XOEtUhPaFKGJkkQhxhBQSH08XKG1mY4z0oxF+CG/TRNYR4wOnz35ju65u2AmOgFAFS9AN/Pl7yMp9uo1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bh+CjWBIdXQorNeBS2vlGSzaWTzdMUE5dSCwv4P9+jo=;
 b=hnBmLg8AG1CIcREED7+p6b7xgEq/AJP9gB92+Tk5FqLHe+lamYSpeFYFGZ/gL/KHhJLkF/OggTSAnk4s9mbcw+I6PX0KYM3mQT+LSny+exJRWJvcCjaGwxWWP0Pu86GMhY5nRwycBPggYWXvG3n98Y/pA9V/MjNWW3iqUpQg8oc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by VI1PR04MB9833.eurprd04.prod.outlook.com (2603:10a6:800:1da::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Fri, 12 Jan
 2024 05:43:59 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::2a3c:9a90:b09f:293c]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::2a3c:9a90:b09f:293c%3]) with mapi id 15.20.7181.020; Fri, 12 Jan 2024
 05:43:59 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Cc: Chancel Liu <chancel.liu@nxp.com>
Subject: [PATCH v2 1/3] ASoC: dt-bindings: fsl,sai: Add compatible string for
 i.MX95 platform
Date: Fri, 12 Jan 2024 14:43:29 +0900
Message-ID: <20240112054331.3244104-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240112054331.3244104-1-chancel.liu@nxp.com>
References: <20240112054331.3244104-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0043.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::12) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|VI1PR04MB9833:EE_
X-MS-Office365-Filtering-Correlation-Id: bc11650a-f8dc-4333-09ed-08dc13317927
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KYH43uWpJEDOTzf84IOm2nG8Krpo5FtLVPsGql1c9o+k2n3zxxRwvwho1ltucyh38XGE2M5vbLhH9GDrPlUxkYnrYxRUg8JeSDdMoGnu2HG5HptO8s0Q5rTY5qHy+qWSGuoQ55FSzhAtxHjOxztSTho7QaKxr9q93QXF+ifcAsw7En1yxdbKYv5+UgIKnZgkWIYQz4j11+4D7XmCpsEj0NXlMe7kZnir3l8VlnDXdaawUaxopR5+GqVpBi1TdaPE75PcOwL+heCbqb33v5PqOsbzLLYPKGe4sU7Vl4HMULgjKMrN3TuW6pu9Att3oKjnVM42yFhLh3+Xdk1GdZ1ugBvv41L8AtomDMi15OtA7MUnNc71a42ckWuaczcUtccXsR007Ou1ABFeVznnAxHHXsAeDtU+0CPi8xV55MdwNDFVLUmXDvqXcz6eeraRC7fyCkD7Ue8eQyEMV2spdPQqQ3ahxd2/S5xf4Wh+LE6YTWg8F9Svx2qERLB4YYxRwFCwYsia+5wfguyMaGGz/TkMrKb7n2ca0Zu6WUB2h4/sQJ9NODA31XV58rk1hOYS28qZUSQUlXxcTrff5fBKeXOgKubE0zUTcy0oRgGNVY0/cTE74Di1B8QzPHIGwLWLZ6wjuPBAhHEHYw8spoDr0ELtUA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(366004)(136003)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(316002)(38100700002)(41300700001)(36756003)(2906002)(86362001)(6486002)(6506007)(66476007)(66946007)(52116002)(66556008)(6666004)(478600001)(7416002)(4744005)(6512007)(5660300002)(4326008)(2616005)(26005)(8936002)(44832011)(1076003)(8676002)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qApNY2XKHBtgx2bTnEVr4XNyFZW9Hx9451/J/XeDR8gJjgjpiuyI1SHg3smk?=
 =?us-ascii?Q?EN2w/IHbSb7ONzXkClJkGkkZhfflPJgkihZBIy8z+WitLA53A9OEpjBQqfWH?=
 =?us-ascii?Q?zeLde4/aVZQc50PKBnpjd3eKSMAW2FI6ywtjEf5KSurWDZJgrD9+R7uNCo1k?=
 =?us-ascii?Q?8niuXZ1j9pPUig2qx+UF6nLBMERuGySTb+BfozBYRAf+uzmuK4L338KwgIeX?=
 =?us-ascii?Q?ay0pbjOquPfopRdZ/zi3nL/vcSCd8ESe0lkUU+/z2P22DrAvu69OtulT0axO?=
 =?us-ascii?Q?p3Cj/FrYP/irSVBdcG8UZrtEOQkap64WDbpRbqLlTw/bHxkInbsCLoAXgLi8?=
 =?us-ascii?Q?8Z7Zc+YM6Ud0lNmWVnafl9M+M6Wt7cLXA+9vjdidFXlbiE5kJJUp6hg7x1rD?=
 =?us-ascii?Q?rX06R/H15KQYits8eny2ugOBSUybZiy18uN/e6PYTqTtZUiPKn+0GbKOdnea?=
 =?us-ascii?Q?VATOC+0NEtPU6dvforYpUEzh4Jo60A3iug6hTuAA+xGYLzssP74MeUlSr3ZG?=
 =?us-ascii?Q?9n1Mgp/Y9hJT/VSEWzbaZ9TM043FgOgfIZsfuq/ZClocSs2l5hV1kzXGrTXz?=
 =?us-ascii?Q?QjvM6mzmWQ+PKMrpcpmbNoOhIvZOJkIyIQL8ZrryxSyZ5kafTU/Keism47Ru?=
 =?us-ascii?Q?XvWwti6qIqTMv9WJHVlUnhI5DObnuJDdAY/TZeUgKxCWHsLrqbo16xyZqXmf?=
 =?us-ascii?Q?9FZZD83egGKoCpKLkaySMfI8LGaRcOqgPUHzK7dSaMNH8mj/kPMiPMYxnVUB?=
 =?us-ascii?Q?nPgu6klmiCk+95VJAIN3VG/CIaHi7r5mCq+TS7ptvKMqdHA9jzEmJztJDKCo?=
 =?us-ascii?Q?T2HtYsKgXm80rGXXQYipU0CRx2Fs4lgHpP7u6hv+sswEC2Xq4GhWltx33A4s?=
 =?us-ascii?Q?w2i5z+KdISeO5esoYc9/VAb11xkKPMyoawf5nP49c1oCb6IBz6SmJMdDSaj7?=
 =?us-ascii?Q?/gefjNhEK4BrfrPxtLgOmUo23BOiig3rLfRgsFlrhHpQHlCDR+7ZGMLoftJP?=
 =?us-ascii?Q?JELPcEsy62iQhm2OGC4uZV+R6HWR6ftQ+0SCAaIlblBjr38+FLzn2zQcc08l?=
 =?us-ascii?Q?8qGGH/HGm221SIzyNXK74Vm6K7XdonJe27zC12WeahT7uD50rFKf2+eiXOaH?=
 =?us-ascii?Q?4gzcUGKJqjGx48m5SGl7ARzoxBOwTBOLT2e2AbNxqfjuXj1LHniQXJpN85ae?=
 =?us-ascii?Q?Sx9KokWAfh73mocpxXWPUQjfRe/RYHVG+KsBHRihYDFpu5P1qx7VxvuNZp+t?=
 =?us-ascii?Q?APadffkHQrnjt4lvxSSR8fAfYrDaDJqR3+wrmXghCPCV1YpDSrsqjyCFVaTs?=
 =?us-ascii?Q?DTdjSyndF7KkjxylHpgkrQoa0aH98LsnYLED+ArmtMrcoJW0ai5RFyXY7mHl?=
 =?us-ascii?Q?lGM9mnS4yyzkvOFzIdYuwCDvGoER63SoYanRGWazpVWZWHLddVqpAbbyMi4E?=
 =?us-ascii?Q?U4P+jahzJVQskvNjdf/E3BODAHAzOGfmQcvWCZxcnrycXOABsT/6OWWfLGQG?=
 =?us-ascii?Q?14cupNKE/ICD33Fl5rKkSSIY5RxBAz34VRnie6RRCbZxjDDplIUKadLLcO+h?=
 =?us-ascii?Q?tNTbInJUXOhdMex7l/TXOKKe4gvbpLMpFJvLqqyT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bc11650a-f8dc-4333-09ed-08dc13317927
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 05:43:58.9928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SIAdctoxSqYdfJrDggWx5EFoOwvV1U4gX8HEW1rcJ+/AarJsiq3dbmQgkFcBtWanuzj/bsNLaSXZKUuppJg07w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9833
Message-ID-Hash: SUZAECFBQLPBZLW6TAM3FVSR47AHM37G
X-Message-ID-Hash: SUZAECFBQLPBZLW6TAM3FVSR47AHM37G
X-MailFrom: chancel.liu@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SUZAECFBQLPBZLW6TAM3FVSR47AHM37G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add compatible string "fsl,imx95-sai" for i.MX95 platform.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,sai.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
index 088c26b001cc..d81c8fe1893e 100644
--- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
@@ -39,6 +39,7 @@ properties:
               - fsl,imx8qm-sai
               - fsl,imx8ulp-sai
               - fsl,imx93-sai
+              - fsl,imx95-sai
               - fsl,vf610-sai
 
   reg:
-- 
2.42.0

