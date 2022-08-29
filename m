Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F36255A5107
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Aug 2022 18:08:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 882891670;
	Mon, 29 Aug 2022 18:07:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 882891670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661789276;
	bh=v4r6N1ZnINaBoM4misPL8/wVIlc+s2XkhBMbGVVaNt0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g/fOitnOqu+HLDCvveIW3UyuIwqczlZoZnw4e+iK3hE/KLXYwNpW1oCUgNs9lScjg
	 R5MzwMQuiwWpMWUjtRc9o6CAbbDIOcbj4Xym09HCmpEodYJU1dZ8B9l1zsH0CY0OiF
	 tOnzIk3WMJyr+tU3l4kNwBpVnyai6FYVGInkZraI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20A99F8053A;
	Mon, 29 Aug 2022 18:05:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C65EFF80115; Mon, 29 Aug 2022 09:56:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60041.outbound.protection.outlook.com [40.107.6.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB3DDF80115
 for <alsa-devel@alsa-project.org>; Mon, 29 Aug 2022 09:56:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB3DDF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="LyY8sRlB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evnyeTIuJeaU5leWWo8z2tJ6oGGqyBNuAlvYf6uVG6bbLy8azceKAIHfRZVOTHCKMXkwHNn60Lx3D9sqGGnRqa+mmltaca4dF2zBxOQYCwc3lSJXXlPlUVk8CofDT9mPCoMWZ0s2wn+++IaULJfk53ymjI3BmJyOQi6Ri+qo7L0bCTDkx7E/HZJgW7aaVrsDAoGBi//x83j8jfFn5PMqeCnxznDbiVMQ2pvbhmQH7yPj+Z54CuH5C+lpdPPmbli48u3X9reLM4qc0+s4UzZ2zxj6OlfCqPZrq89k4FEMSXgRAlWXAqIsXnKfGikoOc2CgFEjdwGGem9kCpfsDdAAyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1T5Sh4LzecjkdbzOioNKLEueHhLNPnhNTFNT8XJLTU=;
 b=NQ461Av6tcq7BPYsbyp3R9aaK/WvBi+E7ZNLD9DDt6whIbwfDhnqO5heXMDu82Yp7CPYuBVDSvozQH6FBJLtelqKh5dMk4NSYdDdotVdn1G9H6NVho6a1D1pi+E3ayLD5NHBoQXLznRXEQcNIbTrHxtcezIrAtLEpAqi2xQja8JiB2W8eNPTCMKG7qTRhpx7s1HKQhPNqtAWmDF+PJEIJJErxptk22UeIyT2ZYUsnnvIh0maUlIToHdi/yewz/qZ/AAcbghIu0R2974sO6ULyObIvITMKTVwbfElLsVQ0/k3Kll2R7TxTRpxURe+g5HQIChefOQbEmh1TjsAYyi6jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1T5Sh4LzecjkdbzOioNKLEueHhLNPnhNTFNT8XJLTU=;
 b=LyY8sRlBZoT+azM7h+IksJPcJWrAxk0jJpZX0xckoehpFehZxaz9upBYBsh39s51I8HaMb5AzCsze8G7McwZkihr/QA6eCY9rA7GZ+RMQnMDzpcVy1xFtRfd4BbwfecI4yIWtQyyYbZlx4wyOHODCNLdjvcP9miWGrqbL7h/SoE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by DB7PR04MB4220.eurprd04.prod.outlook.com (2603:10a6:5:27::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Mon, 29 Aug
 2022 07:56:07 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::3139:70b4:6648:bd32]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::3139:70b4:6648:bd32%4]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 07:56:07 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, shengjiu.wang@nxp.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/5] ASoC: imx-pcm-rpmsg: Register different platform drivers
Date: Mon, 29 Aug 2022 15:51:42 +0800
Message-Id: <20220829075144.2405000-4-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829075144.2405000-1-chancel.liu@nxp.com>
References: <20220829075144.2405000-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:4:186::13) To VI1PR04MB4222.eurprd04.prod.outlook.com
 (2603:10a6:803:46::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39c33c8d-26e2-457b-cede-08da8993edfe
X-MS-TrafficTypeDiagnostic: DB7PR04MB4220:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BAdthjNCpbJK/ft5z1ZykjzHOsZOlGf/tz2uQrfQDUiMWdRjO0MNR4due/pzDQ4nv4vnX2XE+TdBJ/s4zFyID1n769nnoTF54dlHQHZv1Kljl5onlsXFb1MOcZSd/jxBqb6tAyJObUnyUflF1rgSV4AfaDCIBflBYTnPPzcpjKKPFriN9O4srdaxq4bSEfT4tJlMogZn1khXQ9WOF1xxcLSrsC9oLNfeyNb3a0AYxcYwAYhyt8SchGDUilqS07qCPyqxIznzpYQxeiQMi1VrvCrU+KG/Q2I3FsYf+tPeijfePdZvAaeO9rjH7mSw46LhaWYIZaj09kIhIWFCnfqVeIOBnynMTW3T78pVzromi49xcMIaKnTIzoccPJJJ6pgKNrAoQSUycqTMZClnHcEizryxnTzV/+LOrmroRQF239yJ4X/EEITr057dBIeTpBHQ4tYQ2/Us/pDPfugjlAPvLcULjwpM0fKnS8gFfuzTrVENMJPA4UoHy1d4nEjkLv5Hat1rTEMhVq83beBtpihp340munxU7veo+gom2AhRsh73d5gY0Vhc9dIBvvfkaTvxerV6yFRnK6W0q1JXdsXHktRmgpQBOjV3LYkhBske4Tr/+PahuxBxLMiDUb6nHpIYeDvr0iIRsi2Z8BD8GIg4E0GtxIvefyQhLGZwlAH5J6kJF0IpMQMhqCgexj5WC2Oa9nqHqViGvc7vF4i1CeiIqny9vE2ekHsJzzmbMMDi6k5/sj4p0QepA4OXSHQA2IVkr4HefxdlswZT5yLDCVEdM2L/9catIsSTg+eaFsrDNMg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB4222.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(6506007)(38100700002)(52116002)(2906002)(44832011)(38350700002)(6666004)(2616005)(83380400001)(6512007)(186003)(26005)(8676002)(6486002)(4326008)(86362001)(66476007)(66556008)(66946007)(1076003)(316002)(36756003)(7416002)(921005)(8936002)(41300700001)(478600001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pdp6jFyJu7Qr3UE+pGlEASishHhz0zptljZvFqe1YiP1s/EAAN157HfwrRvr?=
 =?us-ascii?Q?LQKfDojeTwsdxNqaQ3Ez/37M73Noa9C/f9m8Q2pS2AUsowXySUanrRlfXOWJ?=
 =?us-ascii?Q?OiNYfw/9tROGrFZwjm8V8t34lmVEFVvVkZB7mM2LEhKiM7OhduYUrH526dgx?=
 =?us-ascii?Q?O9bi+sKiCRlQEPh99borMgdXr8PzgVpSGxYE6xwSy6k50bvqSEEu2N1e4pbT?=
 =?us-ascii?Q?JP6c1hb9Y251xB+sKo4Kae8b8SVT5p32jM9zVD5vkwTxSITVlEFIl5KlOwzn?=
 =?us-ascii?Q?Jgc/ODvRVmtwTBcSSY20Ft5NkSg+Mq/Ap3r7bquhXw65ZSEb5JMKOX6NLHej?=
 =?us-ascii?Q?JttOP577tcZcJpjhrz7lKiILLkRMrP5tHNKnm7MiG/+ZI+U0x73msj3cOPyg?=
 =?us-ascii?Q?xqb3HMi0JWYklDIVmCpJP9l8K9i73LOWR85Bl5gubYIKslhdVQCtSOBKm4QX?=
 =?us-ascii?Q?17esA+7i1AShLvkPWFeMyNG7n2VnauhVJSqmKFc8a7NH1r5gJPaDcOLNUYyL?=
 =?us-ascii?Q?okmLjgVcXHOd2NnCf3EJjopxi65S20cFwIGdnOkWQoM00yinFS0SFrUG9BPh?=
 =?us-ascii?Q?VUcHawdX1IMIgzR3z7DXlFPLxeTo9GcqavKDkH9262RoNUar62AdKgqp5i8W?=
 =?us-ascii?Q?Up3+0mtOSnFb37z6hAd1uwC5hQGgCdxYo38zGUSAMC6EFeYDAr7yJYhjlBlP?=
 =?us-ascii?Q?2KCiwC1HJaajSh+H310MOkpr1nCxhXESYr4G0Kz1HXgwu3Ndjk93U7QVCLvo?=
 =?us-ascii?Q?d3ikVobNnBfEnRKMKK77Ex9T/3gwYjQ7JGj56Ug+F1fht/wL9eUqfRzWca8h?=
 =?us-ascii?Q?6s4OmKiYhqVXd9GnrS4KoSgdZNufSgRJkmrBVyD4vly5mNAFUx5V4clJAtcQ?=
 =?us-ascii?Q?/MADK2s0JU/P++iz/n0Ld0JCf5q8KJb8WjYg8+5uUiNifBmVQ+iVNP6q2Jx3?=
 =?us-ascii?Q?Rw+Vr0XkteNnHYb99ZnlW24NogTINuUmYjjM/KBw4HQD+PDUT8NMSgLoQKqh?=
 =?us-ascii?Q?3+faMUgKIdoWPBmr2SoHp9a+igim1AkxpjaREsm0N2nMZ6IJn7tF5zX+4BCN?=
 =?us-ascii?Q?mM6nuEFaZpG4bsi/Ltq2vO9P+3yRKqpM811GRzE79MsPTOzv6a1/Rbv2xdrc?=
 =?us-ascii?Q?UNPiTcGt3fcal0mF45rUaxmCLgCeGDoj42ZThCAbXZg1yEtCvGQSkb65cjN0?=
 =?us-ascii?Q?ET+mlEf1DfgebHLi1DlJlZrzf3M9uAh3b85QpaY7zGag7FL6SMPKgUY80pUj?=
 =?us-ascii?Q?1GauzFWvElGvaW+uG6qrj5BioEJUp41827aVLLAt/4o/HdVxYQ27vtNZ3Fo8?=
 =?us-ascii?Q?MXXOahVHLu/bJ3CH2F0k4nAmJruFrE65H0yVsD/Wy7n9XbXqrsNM4VpQHS50?=
 =?us-ascii?Q?T7SqLjCN5HsdxhUG7Iq/MFXyWv8t6JRZnoYb/hcckylpr2OnVvkAynIpp7RG?=
 =?us-ascii?Q?4Kuj+0R/NZD/Nzguz7upNTvTfenV/ggZSv8sczzcR/XsHqB3QMrBrItTQIJ6?=
 =?us-ascii?Q?D1yK5/FFW6L7yhYjSJIAEvZRcN6uJPG6puhjbkQYYv9TSrJ6DnmfJRbcPcBF?=
 =?us-ascii?Q?7cscdFe1HNgj+com3zb/YDNhPMpLEj7bKfdrTOnB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c33c8d-26e2-457b-cede-08da8993edfe
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 07:56:07.4162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J5AURrRz1gAJbx850DgVzIkkrf05UGh1P1cFQtq2oSgEpbNyOqIVI4ykedD2VTmMFbj1fG/7SA3rbfM2CMyZLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4220
X-Mailman-Approved-At: Mon, 29 Aug 2022 18:05:43 +0200
Cc: Chancel Liu <chancel.liu@nxp.com>
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

This patch can register different ASoC platform drivers in reference
to "fsl,platform" property of the corresponding node in dts. So sound
cards based on different rpmsg channels can link to their respective
platform drivers.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 35049043e532..2f310994f7ee 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -178,7 +178,7 @@ static int imx_rpmsg_pcm_hw_params(struct snd_soc_component *component,
 		msg->s_msg.param.channels = RPMSG_CH_STEREO;
 		break;
 	default:
-		ret = -EINVAL;
+		msg->s_msg.param.channels = params_channels(params);
 		break;
 	}
 
@@ -684,7 +684,7 @@ static int imx_rpmsg_pcm_probe(struct platform_device *pdev)
 	info->rpdev = container_of(pdev->dev.parent, struct rpmsg_device, dev);
 	info->dev = &pdev->dev;
 	/* Setup work queue */
-	info->rpmsg_wq = alloc_ordered_workqueue("rpmsg_audio",
+	info->rpmsg_wq = alloc_ordered_workqueue(info->rpdev->id.name,
 						 WQ_HIGHPRI |
 						 WQ_UNBOUND |
 						 WQ_FREEZABLE);
@@ -723,11 +723,15 @@ static int imx_rpmsg_pcm_probe(struct platform_device *pdev)
 	if (ret)
 		goto fail;
 
-	component = snd_soc_lookup_component(&pdev->dev, IMX_PCM_DRV_NAME);
+	component = snd_soc_lookup_component(&pdev->dev, NULL);
 	if (!component) {
 		ret = -EINVAL;
 		goto fail;
 	}
+
+	/* platform component name is used by machine driver to link with */
+	component->name = info->rpdev->id.name;
+
 #ifdef CONFIG_DEBUG_FS
 	component->debugfs_prefix = "rpmsg";
 #endif
-- 
2.25.1

