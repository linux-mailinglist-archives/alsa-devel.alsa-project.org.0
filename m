Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DC67F2584
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Nov 2023 06:49:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B078E10;
	Tue, 21 Nov 2023 06:49:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B078E10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700545753;
	bh=LxOMVZ8yaHqrbl7TyIZLDjk7p61CEtDxc/POWZCbvrE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iqbg4KdZwSsuZB28gUqf4T/bH2X5ZrRgYF/she4Vl6/vBy3Xi9DxYpSllzBXph0VN
	 nGPUmCKO+8AbgzVvrH22igULpvVsxVlDmt6z9Y6p4DINmVoyoLwqEHkVnlAa+YVDyz
	 /pdZlfLFFP6z6Ujb/SMNPBJXlKD3EkD3t8IzDjIY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A013F805B1; Tue, 21 Nov 2023 06:48:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22A91F805C3;
	Tue, 21 Nov 2023 06:48:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C74DF80310; Tue, 21 Nov 2023 06:47:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
	T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86895F80246
	for <alsa-devel@alsa-project.org>; Tue, 21 Nov 2023 06:47:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86895F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=roS91s+X
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eW4DbDK/fk6UIN1u5dafg/2DSovJKGp8xcVNdb+bXOIF8bM0gD8QPGakqnAt0thvGY7abbue5k0bt8WwLjvWjqBOaFkevn0+MP6CtpSArBE7tCL7ka+ttuXPXGyZUi8q8x//rJ9NcmKcobcuRjoDthv6qKRxK8UT+RaIAPkqEvIDu59SYyyJS2k7BhU/cL9Ic6bh7mYtedgoCDLjeWZ557mVL9W8bxYWUCLlUzNzv4qPagGCaaosXS7NBRRaoNTKD4F/xmUDr/s6411FX8Chl7tZjUTIhl8FIA8R4hOIVMsnBFRJT8NDQHxErTGnspg0oe03d3IpERfz1QEZNq0a8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AvwdRZBZwFSH2Kq2WT0Bk4fl8JUFhpKoqGheMfEKxnc=;
 b=WbaFCg8bj9CjICJOPTDqsUe6NnRX9AyKORTjzA4tk3skPDaxZbcHevE74um8KlaNfQaW9r04Xy45VVMj8M2QIR7qjjgl/tpSFMkrdLZvb0TxdskdOkNy6l/bHzCfJXtMZTUbLWkR0Vsb7gCPDSl4pKbDz+1pbIzZfwCus7kkaSPsOO2N/rukyxp0PP7G1Uvsr9o3c2t1Ilk7ihOMsWDgOqdM6LRIoWpvJ4Eaefrkqv1/hekDrdzPSVZHNWPVUjlvcbIsxMW2CrYyIytkbRtg+NDjvzYrf6KVJ3doxYcaSln3qC0eycbUiZb6ng1rYHGfeAuoz3xIc12FKO/YgN6EcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvwdRZBZwFSH2Kq2WT0Bk4fl8JUFhpKoqGheMfEKxnc=;
 b=roS91s+Xkg01BnVFl9BnSunZo6KLqYaXavSH32PVM8ZI+WlILZ2PCMgIQRMY7i/ODR6XhY32+1+yyB+CTQzmSXNzGORkaiujOOE/WoKwhgIGQ8JF9clQaUS9UG1OOtzmaZlvlN/HTThpBwrynrcjWA32XoZYhS8kfsQMB00pzOM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DBAPR04MB7270.eurprd04.prod.outlook.com (2603:10a6:10:1af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Tue, 21 Nov
 2023 05:47:36 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::dffc:1d:4398:7768]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::dffc:1d:4398:7768%6]) with mapi id 15.20.7025.015; Tue, 21 Nov 2023
 05:47:36 +0000
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
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Chancel Liu <chancel.liu@nxp.com>
Subject: [PATCH v5 2/2] ASoC: imx-rpmsg: Force codec power on in low power
 audio mode
Date: Tue, 21 Nov 2023 13:25:12 +0800
Message-Id: <20231121052512.20235-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231121052512.20235-1-chancel.liu@nxp.com>
References: <20231121052512.20235-1-chancel.liu@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM0P190CA0018.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::28) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DBAPR04MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: ca0b9148-b1b3-4a34-791f-08dbea555d53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	McUzxK5EFg/K0n5QUoLG7Cp6mlNTl5nlO8Ktf/XlrMjsYW2Uhf/D9I1w4Dz+eNHvyCrTK5NRKpjFJ7Q8yMEiY6xWP5v4MOyIx8YYkMfKQNxYMFPvUt/xjWGz+6J5qIh3jXqKfjnlTL2iGkdakwD5+2smLUwQLBlrH40ywY9B7qEzLyHWfAgKgDr3eMaVCI9CN2RwHNuxubIyTm0fzSAflJVWyI/akXY3gLtRfI8x7po/UrBRVV8CcfedoqFQ5lPoWHI2nGxkAtOxXf9mqBsWVMoRbab+ulqVwUnd9WRFdOFKp1GrathPh54bUmqvxPwl8MNE9bQMJtpZrjMEhkEKmgrfiHuRGEGNz9gayd9I4rd6vYPGXsnbKISEAVNHjseEFPCimklrR16JTBUNN27OdjxY9xjVdcxgVYSk8AWfbdRWQgCOaarmvKHqzIH7LqhelEa9KDPV3rOteiY1zKUX6K5F56/kMwVDXcfqkh2S3hsgGEwea/Wn54UiT5OlIDUM3uUnxMTVsE3vax/1HtQwDPJKw7ABnI5SIMQM03KIy87JcKUPcPNpujIRgpKlAuBkBX9tOoh25SjKCQPtBCuFn/wVbSIzaiR72AwHNW3+RcJJIZuk/P2EES+u38yPoLiNKgjQFosNix9Gd53MUhVUFPJXc4tEDqi6gPXipwNyhOk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(39860400002)(366004)(376002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(2906002)(5660300002)(7416002)(44832011)(2013699003)(41300700001)(8936002)(4326008)(8676002)(316002)(66476007)(66556008)(86362001)(1076003)(26005)(6486002)(478600001)(6512007)(6666004)(36756003)(52116002)(6506007)(2616005)(83380400001)(66946007)(38100700002)(38350700005)(921008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ACU7mDF+K8/AH3wWT8K/MOxx2JLqqMCElIuedtpRM0r3UkR6MsX89y/5fPaJ?=
 =?us-ascii?Q?usaU1NN8kJ5Ugu2PfyOruJan6nLTi4Zci1rNiWXA9UD84euoOjBuxuDmXnpk?=
 =?us-ascii?Q?fPOQsp4GTxq0uxwbdBP5C3XnW0hYRg05V6lHJnepXVRYTaq+yOwSQBoyh8Yw?=
 =?us-ascii?Q?vaYPdUgU35HpMyEsbqlID2jBCs/l1xX98l8afBVyxz3r51YIalqT+0Mb0Wam?=
 =?us-ascii?Q?Ad9WhAhlypL8E9XxvMrI1qdjYYOywJULJa6A0RYcIGbWreFR6Ke18Cx7+sXS?=
 =?us-ascii?Q?u19KRmeQiBEP0mo5nBAiarZzbshBVcXr6NcmEU6h5RS3wXqj5dLda94jlxMP?=
 =?us-ascii?Q?Ni/MyecRN/THAcg3unQLeaFm6rbOjywBgstJ0S53AFiqwERlNg1zuZF8qA9j?=
 =?us-ascii?Q?lcA9xeeaarKGK0PDkzGG6mK1atTEBhE7mVBH3CPE71/9IOJBcl5orypvqWsn?=
 =?us-ascii?Q?180eZFCaL3iwlSGigKPT90D4yE+pwGs0VrAMdTPGcw/jE0FXhpQURH0HuJ67?=
 =?us-ascii?Q?K8BJmn3eyCBqVzz/U0VZ50L9y5lSZDNDflp+d6yl3CZI8+NQ/sI43PgcVy0x?=
 =?us-ascii?Q?Z2iunphFAqCMWcFX87hqbaK8Cvq161/TtWNB82/+jusfFKNQVnL+mGAC8gPV?=
 =?us-ascii?Q?v9oERsZ2vljWkLq/NrP0LGwP5sCay0tpngFZGUJyb41hq5c8msv+LObs/n1v?=
 =?us-ascii?Q?aiZYGaopRlm+m7N0OxUc95kXz8E8MyInkdxJNStYnydvNXVE4VjBgVR7Qed3?=
 =?us-ascii?Q?eV4YND2FeffdZb3lWooLO5GIkgOB4GELT2tb5bvWr9yRyKuLZRwv5qwSeopR?=
 =?us-ascii?Q?vpXlpiSchgYHj/TP/AMHOyqkhI+8i9ZCV2Ua00NCFKGWgUaFArvD10FB9nR7?=
 =?us-ascii?Q?IqQyAUwRz0JAACMHNzZIp0ulSvSHFpy9dWB8Mf5S9fCnwQzreeqff1pjVKUt?=
 =?us-ascii?Q?bpOy13xSf1/NdmyUxSZHzUc/qsGwL1iSB+ONqlDwljgruxxzWi1tqxjpgcgR?=
 =?us-ascii?Q?Xzn6/xssBH/Lj5scU/g5X+9fDkdZRoyYXTwte45yYtTWWtf3PKo22rcsTNw/?=
 =?us-ascii?Q?ztTiv+Edv/pGb3/PwI/rrgOKJBT8J8xw3MHIWJZyNUmtq4+mCp7i1h8ea7db?=
 =?us-ascii?Q?RwaATmPIo3Wsi5xDK0HO2ZUfwgPe2/UM6VbGDTGahzcAteczGehnl0Lj6QeL?=
 =?us-ascii?Q?9eR9Lpf+R3yoZ/9atsyXFerNIDFt/KdYnckpJtRwHK31M2uKjCYaw9K/5tuy?=
 =?us-ascii?Q?/ighgG9caILmsbC++4I3zGSuRLTlnJ2IUw0qPa6qUePk9VnOYWEZN28dxp7p?=
 =?us-ascii?Q?m0weuQhRdCBBJRi5FN2fE5+O/vqcLjvAW14DzPRJtLTA12dbCG8lbLfp5ZKj?=
 =?us-ascii?Q?TOrkFmRV5BFZGPuyVtHiVzApEnPBD48WwR+8hpMASMzHd4Y4agKQdQ2Yxv4X?=
 =?us-ascii?Q?eDjG8s7yu3LDSC+GK4HjOwF7F3Duji3AJGSQJDZaPBjs4XPJCxckgyDwFG+h?=
 =?us-ascii?Q?LmyLQpvKu2n6ukMX7DMEWImwx2bakblcdC+kQIpInms+e58JADFfPRJwd+b0?=
 =?us-ascii?Q?mXBec5cw1asRaDRf9C2oZgSuVgzCiCbLORRa7qwz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ca0b9148-b1b3-4a34-791f-08dbea555d53
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 05:47:36.6876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VOSh7/GLFUjSOzzWue1oUm26fGVcGrXcVYTHuw9QPUwW+WlNn58oN6ub9A06qO3pypR1+QvWOt9/IK/U8ZbGww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7270
Message-ID-Hash: ZCZ7TV4UZGUILC7BBFOX3W6KVOXR6UXQ
X-Message-ID-Hash: ZCZ7TV4UZGUILC7BBFOX3W6KVOXR6UXQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZCZ7TV4UZGUILC7BBFOX3W6KVOXR6UXQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Low power audio mode requires binding codec still power on while Acore
enters into suspend so Mcore can continue playback music.

ASoC machine driver acquires DAPM endpoints through reading
"ignore-suspend-widgets" property from DT and then forces the path
between these endpoints ignoring suspend.

If the rpmsg sound card is in low power audio mode, the suspend/resume
callback of binding codec is overridden to disable the suspend/resume.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-rpmsg.c | 61 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 59 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index a0c5c35817dd..e5bd63dab10c 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -2,9 +2,8 @@
 // Copyright 2017-2020 NXP
 
 #include <linux/module.h>
-#include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
-#include <linux/platform_device.h>
 #include <linux/i2c.h>
 #include <linux/of_gpio.h>
 #include <linux/slab.h>
@@ -21,8 +20,11 @@ struct imx_rpmsg {
 	struct snd_soc_dai_link dai;
 	struct snd_soc_card card;
 	unsigned long sysclk;
+	bool lpa;
 };
 
+static struct dev_pm_ops lpa_pm;
+
 static const struct snd_soc_dapm_widget imx_rpmsg_dapm_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_SPK("Ext Spk", NULL),
@@ -39,6 +41,58 @@ static int imx_rpmsg_late_probe(struct snd_soc_card *card)
 	struct device *dev = card->dev;
 	int ret;
 
+	if (data->lpa) {
+		struct snd_soc_component *codec_comp;
+		struct device_node *codec_np;
+		struct device_driver *codec_drv;
+		struct device *codec_dev = NULL;
+
+		codec_np = data->dai.codecs->of_node;
+		if (codec_np) {
+			struct platform_device *codec_pdev;
+			struct i2c_client *codec_i2c;
+
+			codec_i2c = of_find_i2c_device_by_node(codec_np);
+			if (codec_i2c)
+				codec_dev = &codec_i2c->dev;
+			if (!codec_dev) {
+				codec_pdev = of_find_device_by_node(codec_np);
+				if (codec_pdev)
+					codec_dev = &codec_pdev->dev;
+			}
+		}
+		if (codec_dev) {
+			codec_comp = snd_soc_lookup_component_nolocked(codec_dev, NULL);
+			if (codec_comp) {
+				int i, num_widgets;
+				const char *widgets;
+				struct snd_soc_dapm_context *dapm;
+
+				num_widgets = of_property_count_strings(data->card.dev->of_node,
+									"ignore-suspend-widgets");
+				for (i = 0; i < num_widgets; i++) {
+					of_property_read_string_index(data->card.dev->of_node,
+								      "ignore-suspend-widgets",
+								      i, &widgets);
+					dapm = snd_soc_component_get_dapm(codec_comp);
+					snd_soc_dapm_ignore_suspend(dapm, widgets);
+				}
+			}
+			codec_drv = codec_dev->driver;
+			if (codec_drv->pm) {
+				memcpy(&lpa_pm, codec_drv->pm, sizeof(lpa_pm));
+				lpa_pm.suspend = NULL;
+				lpa_pm.resume = NULL;
+				lpa_pm.freeze = NULL;
+				lpa_pm.thaw = NULL;
+				lpa_pm.poweroff = NULL;
+				lpa_pm.restore = NULL;
+				codec_drv->pm = &lpa_pm;
+			}
+			put_device(codec_dev);
+		}
+	}
+
 	if (!data->sysclk)
 		return 0;
 
@@ -138,6 +192,9 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
+	if (of_property_read_bool(np, "fsl,enable-lpa"))
+		data->lpa = true;
+
 	data->card.dev = &pdev->dev;
 	data->card.owner = THIS_MODULE;
 	data->card.dapm_widgets = imx_rpmsg_dapm_widgets;
-- 
2.42.0

