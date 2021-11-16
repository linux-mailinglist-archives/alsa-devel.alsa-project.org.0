Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A4345365A
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 16:49:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBE01167E;
	Tue, 16 Nov 2021 16:48:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBE01167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637077780;
	bh=U+YDMrWv2nPAtY92X8bOgFaHsfN3pxLIqWIJxr6gwik=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BrMNvVjfV1wVMyM3PXBf199/gCswXg3kdMOCRj3tn1ddrxEEl0unAYmdOF2cMDu9F
	 +eUMQJdnJRfR2QETBObvNJx+x4o3T0MU+uubROt25ircA9EnRHNHwDc3+xrEjJJvOh
	 1XnJ0HYnux6aHvHyLSfyRplq5Smo8E4m6ZORK0Kc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8774F80506;
	Tue, 16 Nov 2021 16:46:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B16CF80423; Tue, 16 Nov 2021 16:46:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60073.outbound.protection.outlook.com [40.107.6.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F0CDF80272
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 16:46:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F0CDF80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="PbluOLEZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DY4FDsCojCzDq2yTdzxjW4IgUw/sivQAIQMGnRpVv9fSAWC0v1F/s7NYY0lAkcQ2WSgzoE7xMzeaj8ifWx2gC364QcZOk4kpC8Zwz57uQHIyR9RSAh4bTYMH9aygqPylheMIEAkfSnGIkkO1jes6XWkTdE+RAbcrPyQ1wK9zkAc44iD5Z6ryIJrb+x9f0TnvFhrfYD6WYT/+7SbRO/odhwnL1mlmhLAx8XIpvhvNZ10or0XeAzftHhNl5HwGyv6qO2UFoKnxG7HwVKNcjP6vNB3dzcdBempgYrdf0tebugbdqxQMOH8wQXXglD+v3FogAP3Fdnhis5VD9gbeT0hAlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qz9Gz2/8OmZFv6S4YKXp8+Zh0ek8cssRpE6TIWGU6Co=;
 b=kPXqAjP8mMX+fLi2jHAUN14R8L+i7CpqXwwYfuXvwspTiP9mQYwkzDx63yuqL30tO+FkbFriv/wUfOlvA4JMr6SLETgd1L+PK+cMHpUNwVsQofjIIBGVnenDvH2JY+9jTkNNjOZwjExKfUFa1S9heTc683l0l2D2/GIxoCTeXq0xJZ48KRSqTJhEzvl3rDcwJlkKT9T8QHs5Tejlzm0Gvhb89KNn6bd6IZP6BRCsYwCxZpmgyJpCtIvjP+jw2WziWpIE7KMEDEn58dzajWWE1l5IqzU5NXMTktWagOCkM7hgy9S4m22yX5n6tVEo2qZI65ZihzwqksU4S9jFtkzEyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qz9Gz2/8OmZFv6S4YKXp8+Zh0ek8cssRpE6TIWGU6Co=;
 b=PbluOLEZE9aYneUHgz2DR5q5wnJHyOgRDvn2ReZjZWFF+mH/6nL81b00v4Y73q1aaK7C8uncPFb0bEbAuImk4JlKcmGFHWqD3fJd1RsOM6PdpkhF896v9yPsBHCz27Lr11q3lLzV+0nryw9ZgYFWBi/VVMH4nGymqNv4QBPg+5s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR0402MB3824.eurprd04.prod.outlook.com (2603:10a6:803:22::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Tue, 16 Nov
 2021 15:46:37 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 15:46:37 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 5/5] ASoC: SOF: imx8m: Implement reset callback
Date: Tue, 16 Nov 2021 17:46:13 +0200
Message-Id: <20211116154613.57122-6-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211116154613.57122-1-daniel.baluta@oss.nxp.com>
References: <20211116154613.57122-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0076.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::17) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:1e69:ee6:2dad:c9e7)
 by AM0PR06CA0076.eurprd06.prod.outlook.com (2603:10a6:208:fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16 via Frontend
 Transport; Tue, 16 Nov 2021 15:46:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2abf873a-1ad6-49be-53b3-08d9a9184607
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3824:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3824B17D06A6D3216845EA42B8999@VI1PR0402MB3824.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UPgOLziK+tt8HfjARL64siGHCKK/cIKlsBI6yfBR3qLHe2UIJF+GU3EmIDE9rJjLTNWCh5nO1Xb789NsWZ/tRFcCUd8QU93BA83VSKBUSosYrKcxIXYsgE9oQQ7VE2QTTToZYrccguJmK04m060l59A7K+KxtbAlMOeTmI5cnaKOnTtqV84ryIKNqq5cc+8ios6BWL3eD1Zt2Ij5jIQmiMb0l8WsgxlLUc0Cy45Mj4CT5k1sHyrXwvcbpvJ8/aIySNVFw2XfptP+Lc+Y83QLI1eMOZe2VbiAFPhynh/xoJlHWE8agwo1mATXC+n3e1Uqwg+A5+3M5V/EnPWXBfMznFlgDvIbJ1J+EosBb96wnaRFOrpim7Hbt0LbvZjX/ljPu1wJ1OadMBfoAggKNz4ajmiDykEQm9cBzqXkxaLaeB5iaN/GZSOGUEt0tgbTHdZ8blwGqeR+UFsYzjflO/o+n2+86tkATyW0hYYVWde68O/LFXzvhsF5Vzz/dFrfhRvUoYtgJUQzjYi3XupnAUKCcFKLPH4lyIDOw6b5P+82rxXECKhFWIaKuvbWMi9gISfBtXyOOxe+7BS9INA74j0MR/hdA0gjTMIJBKumaf5i0DRd1O+Fk8i5DfIj4n1TRVjlAIv+/6pYD1IgXv46UZCumE/ZP/Yr/oE3pXmsPViD8M8kh1K5LZrOOXKp1C160fpdC/Oq/SB/lKkiGFbUnfJj6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(186003)(5660300002)(1076003)(8936002)(38100700002)(66946007)(66556008)(66476007)(7416002)(86362001)(44832011)(6506007)(316002)(2906002)(83380400001)(6512007)(6666004)(4326008)(508600001)(8676002)(2616005)(52116002)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QniOc87ci9WfhnKn4yys0TNohCV+0seJjWkqzq6qDqw0jBkOJOtkwWgAy8sg?=
 =?us-ascii?Q?w/vevb/ANQVOPPUPEQ36D0QNT2V7vKdLujZcsLNrjlCQ2mSZkjH3H6RbuQBL?=
 =?us-ascii?Q?bd+aTrDonua5I4kkjYKaThXoJpXBaTaEWW/UFujGc2G3ESULDQSLdmaflR+M?=
 =?us-ascii?Q?TXRAEVKgoIyL6Zt3DOdCxnsqBXSFPMFJ95/0RRxd58MpphvLNXkpdjZeslef?=
 =?us-ascii?Q?JuurHBkMP0KO/ypPaH3Z5VPF/R1qwtPoisR1Vw1ZsrG1qbcz1Hb9agvc46jQ?=
 =?us-ascii?Q?ba0+HwBxaWAHmJ5pUp+L4kqD3z4zrKQQnFnUTT0UY9H6wh9fItQIG35FIYuU?=
 =?us-ascii?Q?9/M0vLobcyFl8xFbRfKY/vNP11GnGKSaPIr4XH/mNQOfA31LNpfbVbEH3LRQ?=
 =?us-ascii?Q?VL4I/rbhYF1DKHmQr0Dk1gW0QEMB2h8pqGfyo03JeM9mOvoMekgrYhdGEnM4?=
 =?us-ascii?Q?FuqoJ3o7c0koh+FUtLx8RXCfhkrtmkgrB+4l7G+7G2/WI9iX7JEvdirba0sC?=
 =?us-ascii?Q?tiQQRizVMWdTm3Rhq7AVuVBn6uNP+HqZqsKuQSPrHtptoWR0r9LZwyIpGTBO?=
 =?us-ascii?Q?FM1OtPcRQis7EgwPHEyOzv37FgdILg6ULIKQaWgbr6OwlV4pqK5DbUBYXbeM?=
 =?us-ascii?Q?K30UlqvgDKTByXX4PcJdDdqW4evYI5U9jy7MkdXHvyUzxFDb7OgPiP7TepPb?=
 =?us-ascii?Q?yE7Wxca0DwMdWlZ7UKxCg+INJw2pB7TQd8f9Z+jjGL5ZM4rWWPxIgcDrnpSh?=
 =?us-ascii?Q?dz9mgI6JA+k/axXtR6QFhwnguqJfRZG786TqnK6slQMcpaiQWKX3E+txKeS3?=
 =?us-ascii?Q?Ipu5GKQxxIBIeR7+h440hCENzCZTiviFWfslFY2GZ64ydeXK0fMrqPW7+nfP?=
 =?us-ascii?Q?qDAsT5mNjkjR0cqkaEl0OKRsHyNEpXoFIC6xKXeUxGyeH3SiureFbgjNUkJt?=
 =?us-ascii?Q?+W3DPDh6kpIUFxhJHD00irfXHKUMy+YfU5tDLQlzC/XDZjrWi0Fz2BaR8xfK?=
 =?us-ascii?Q?ZD69gzmwfqyn8yQ+Ay4rUI0QyphW9Rtl8HT4w2oracAdvaXq0OLSi1XMhgRy?=
 =?us-ascii?Q?cMGldVxzyvn40jqM8gOy23YeK+FcjfxO07fEsTjAo4rJUOlg0pVNBbGuNsuJ?=
 =?us-ascii?Q?2GZCVihFKfni3+bXgUs/1/eTJ6U/49SQE5NPUJH4TOHmq+KuYMPInhyAew6Y?=
 =?us-ascii?Q?90STVyU0K+R37iRJ2SdY4AH9u/I3TDQBJDFG8U8pDnxN0S7wBeWSoYI+h0xR?=
 =?us-ascii?Q?5VJYde3jK/+I7fgnZJ3OFPW4w80JwDt5LB26lLDAluGtRYp0KiZ+il2I9+Az?=
 =?us-ascii?Q?je8yM4s4RdaxZDDtFRk5FfBd0urHyZZwcVCN5Km4UfOCfnEoxdxSZ9+OM5Q1?=
 =?us-ascii?Q?/w94V1UMeLc3hHWNRwemoKKXZ6PILJtyI22vyMrftRmrwjH+1awG8lCOBao7?=
 =?us-ascii?Q?5FP9NO6mtEC1C7OpI56ntGLFqMMt9mUbuxg4P+af4PSBEvDo2HS2PKfUadeW?=
 =?us-ascii?Q?WtFKyaUs6UB9Fz51FroXfacKMzfs5alMMoRC90RtO3nflkggcsBu8C/n9mMS?=
 =?us-ascii?Q?1OiFdmiRhFKej8rNcwH9hOMI9XJl+rlynWcWD/BDdgcn895E9QHTRG4fXPE5?=
 =?us-ascii?Q?QzNPXZlMpaumPr1oohahAQ6Ozpp6RxSosd3lkhWc1oRQfNEmVfE6sV1wc/wG?=
 =?us-ascii?Q?yHZDb+WWF0oQ2wfmA/S9JDqnBlw=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2abf873a-1ad6-49be-53b3-08d9a9184607
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 15:46:37.0279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6OPgYmO3iR3947da2hOLPgXpAxxx9HVWboTceHWp7Ie3hzNTwZC1eBtyTQdYb+8eSCSaB+sqMUEE3WnfG2hTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3824
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 guennadi.liakhovetski@linux.intel.com, daniel.baluta@gmail.com,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, linux-imx@nxp.com,
 peter.ujfalusi@linux.intel.com
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

From: Daniel Baluta <daniel.baluta@nxp.com>

Resume common flow (System PM / Runtime PM) is like this:

    sof_resume
      -> specific device resume
      -> snd_sof_load_firmware
         -> snd_sof_dsp_reset (1)
         -> load_modules()
      -> snd_sof_run_firmware (2)

    We need to implement dsp_reset callback (1) that will actually reset
    the DSP but keep it stalled.

    In order to implement this we do the following:
            -> put DSP into reset (assert CoreReset bit from PWRCTL)
            -> stall the DSP using RunStall bit from AudioDSP_REG2 mix
            -> take DSP out of reset (de-assert CoreReset bit from PWRCTL)

    At this moment the DSP is taken out of reset and Stalled! This means
    that we can load the firmware and then start the DSP (2).

    Until now we resetted the DSP by turning down the Audiomix PD. This
    doesn't work for Runtime PM if another IP is keeping Audiomix PD up.

    By introducing dsp_reset() we no longer rely on turning off the
    audiomix to reset the DSP.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/imx/imx8m.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index 9972ca8e6ec6..8f24c6db7f5b 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -32,6 +32,12 @@ static struct clk_bulk_data imx8m_dsp_clks[] = {
 	{ .id = "core" },
 };
 
+/* DAP registers */
+#define IMX8M_DAP_DEBUG                0x28800000
+#define IMX8M_DAP_DEBUG_SIZE   (64 * 1024)
+#define IMX8M_DAP_PWRCTL       (0x4000 + 0x3020)
+#define IMX8M_PWRCTL_CORERESET         BIT(16)
+
 /* DSP audio mix registers */
 #define AudioDSP_REG0	0x100
 #define AudioDSP_REG1	0x104
@@ -50,6 +56,7 @@ struct imx8m_priv {
 
 	struct imx_clocks *clks;
 
+	void __iomem *dap;
 	struct regmap *regmap;
 };
 
@@ -116,6 +123,30 @@ static int imx8m_run(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+static int imx8m_reset(struct snd_sof_dev *sdev)
+{
+	struct imx8m_priv *priv = (struct imx8m_priv *)sdev->pdata->hw_pdata;
+	u32 pwrctl;
+
+	/* put DSP into reset and stall */
+	pwrctl = readl(priv->dap + IMX8M_DAP_PWRCTL);
+	pwrctl |= IMX8M_PWRCTL_CORERESET;
+	writel(pwrctl, priv->dap + IMX8M_DAP_PWRCTL);
+
+	/* keep reset asserted for 10 cycles */
+	usleep_range(1, 2);
+
+	regmap_update_bits(priv->regmap, AudioDSP_REG2,
+			   AudioDSP_REG2_RUNSTALL, AudioDSP_REG2_RUNSTALL);
+
+	/* take the DSP out of reset and keep stalled for FW loading */
+	pwrctl = readl(priv->dap + IMX8M_DAP_PWRCTL);
+	pwrctl &= ~IMX8M_PWRCTL_CORERESET;
+	writel(pwrctl, priv->dap + IMX8M_DAP_PWRCTL);
+
+	return 0;
+}
+
 static int imx8m_probe(struct snd_sof_dev *sdev)
 {
 	struct platform_device *pdev =
@@ -168,6 +199,13 @@ static int imx8m_probe(struct snd_sof_dev *sdev)
 		goto exit_pdev_unregister;
 	}
 
+	priv->dap = devm_ioremap(sdev->dev, IMX8M_DAP_DEBUG, IMX8M_DAP_DEBUG_SIZE);
+	if (!priv->dap) {
+		dev_err(sdev->dev, "error: failed to map DAP debug memory area");
+		ret = -ENODEV;
+		goto exit_pdev_unregister;
+	}
+
 	sdev->bar[SOF_FW_BLK_TYPE_IRAM] = devm_ioremap(sdev->dev, base, size);
 	if (!sdev->bar[SOF_FW_BLK_TYPE_IRAM]) {
 		dev_err(sdev->dev, "failed to ioremap base 0x%x size 0x%x\n",
@@ -378,6 +416,7 @@ struct snd_sof_dsp_ops sof_imx8m_ops = {
 	.remove		= imx8m_remove,
 	/* DSP core boot */
 	.run		= imx8m_run,
+	.reset		= imx8m_reset,
 
 	/* Block IO */
 	.block_read	= sof_block_read,
-- 
2.27.0

