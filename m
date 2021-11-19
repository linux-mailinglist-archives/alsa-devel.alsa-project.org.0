Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04656456CB3
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Nov 2021 10:46:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9402A17BF;
	Fri, 19 Nov 2021 10:45:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9402A17BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637315207;
	bh=Ge50TPm+139sQyF3toP87ek8DlxjjZQr35hjGDlVGp8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QxGO05wE5nFnjPdq7UUlZEcf7KmjvvX91EKJKo9VxkU66atI8WLJD7Gh0hRuKszWE
	 WdV/Gk78wZt+vVchJm7IOfOyhAY8kVREj3K30jwfJ9KNVi4Q66nZa16Bm2/1XVDoNf
	 Q4Z96HjWIVk4PP5UWmLu88apwKZmH6yO+hwJUM+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E28DF8051F;
	Fri, 19 Nov 2021 10:43:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1EDAF80511; Fri, 19 Nov 2021 10:43:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 KHOP_HELO_FCRDNS,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7C4BF804FC
 for <alsa-devel@alsa-project.org>; Fri, 19 Nov 2021 10:43:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7C4BF804FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="P0Z/4Evs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSzOxskF189Nt9y7lhcr1xYEBgkWQuSYq3wgvCVtmNsZNjWtCrG0n0YKMmnpShXW5y6zSKghfWutzqAszv5OOqHRv10yxgX/P81RLFTs2/Mw+k1GNH5BFia6LaByp6h6KixHWX92t4TVuUtfJsaj2XD1En4qHCwqeDbwHDeZuxHLZmreE/c7H4IFDljPzWa9beC5bTnGxyyZrAVUW9QmhyrgBCVPph2HXhvUz95XX2MFfJJo3iH/a2Bp7x5E9jXH/Q1nxjnnW3PWCwCR07L0TWvDxByHsn8XEAkPKuSSNzOzPXE3h8uxQH5GDRHoKD24vjVRbo/eMt7kLoCw20jbrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFUS2st6QprWZMLIXB95W5udJX2cidYwawtNnifBbws=;
 b=HiIJT4V9qp/O5ef08rG1u71SKUYeqhdTzu30R6xP5Y/IV4A2HkXSKDlMhqZ4/6MGWmnRmSiedbXUnn5SWt7J8IE8mZ+udYk2R/KBhearfEtm+KHysibz60RyRPq18Mz4ycOZots5yh4hePNOXAFCpclLEwPJ6PyGgYyqEaeiM3G6NtqDvEJLVhUoZtPTYvtjs13npLLLYUfWK6rYu62bQqzZ9OvLvKP+ngmVQ6ds69eoOSU6C5qgpVgXRJzsijxObODiTU9fzs63A7X9BqewcbsA6XYuDQimgewy1vn7TdgyHXiijLcezMRBRPKZqV53/OvzgnBPAt4+Vrst2LiJNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFUS2st6QprWZMLIXB95W5udJX2cidYwawtNnifBbws=;
 b=P0Z/4EvsRuUqlWGgA7ruhZrbZjsOtvpifQM4LpEwsFejuewQPhGJI0FVVuKKyUkk3tK7Qq5IAtfg4piTgQOXMW/Kxu37NPNDjfBLnxRKasRD2T/KkidBIg94PN9SZxMCpOvLIMNad2K4DqlsyAUJw9hHsp7PMevqrQNdw8/G27I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB3037.eurprd04.prod.outlook.com (2603:10a6:802:9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Fri, 19 Nov
 2021 09:43:37 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.029; Fri, 19 Nov 2021
 09:43:37 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 5/5] ASoC: SOF: imx8m: Implement reset callback
Date: Fri, 19 Nov 2021 11:43:19 +0200
Message-Id: <20211119094319.81674-6-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211119094319.81674-1-daniel.baluta@oss.nxp.com>
References: <20211119094319.81674-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0099.eurprd02.prod.outlook.com
 (2603:10a6:208:154::40) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:187d:3f5e:91e7:280d)
 by AM0PR02CA0099.eurprd02.prod.outlook.com (2603:10a6:208:154::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Fri, 19 Nov 2021 09:43:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fba66f14-dfdd-4760-c955-08d9ab410f5d
X-MS-TrafficTypeDiagnostic: VI1PR04MB3037:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB3037881248C35F0981591E81B89C9@VI1PR04MB3037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JYi2NORZ/ISCuqKQ2OAtru+LiJKmYf7k+0br/aSEMJFfO5T22NmKU1hNzDdeFbms+YWRQVPuuyw0xG4Ha6UoGJ2rbr/rr5R/esrJXNhUQeAKhqdtzk73QzXl/47KiG4OmL5h9MLd1fVznmTJwY/D3IWgIPmxr6Q22VMyjsjUvL00/roxIFYRTHixvFjwiq2u4seIXU9/xv9l/2BNySD0hXVI1E7qEi6q9cM8ZGhhuIev7bep8qneOPX92yw6hCgKJRqGqs+3fW58OU91FzxdC71K0D75kz5wD/tD7YmTqiGgrBe2t1INxN/51erBc53oV9nkSN9rzdJOT82xJxkGI6m+Sa4UXGYpKB3lAOrU8hqZTqNUH5nk+VzJ7wWv5c7xuBiAg1SggYuYt4FwLbR1ihtn5HeSjrktb/E2pZVMnOfDT+0AKPFIk6jBZuL6Pzqo29ct7moxH8X+fL02A+eTFy8vD1YuwVJNMZcZ1BnvFwElMoafTgLdX9idEF8x8KUYUGZTXfrKAxYDMryUh0AGPa81mkhvCwjXN0xNwH7AYuIrxUV9hAwCpD70IbZv2e0bqbWRvWRLBJQOF2G1v6ov8dA+lzD4j0ZJdoX5+/qYW1BfqGMk5iuMH8amNO7C9j8iclrgQgHERnnecuG9bSDIw2PRzBiJAie6BQfxiTaZ4QkSicWswPNY0+f5nj9nw4NMogFNawJsB09bX1vyN/MFvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(4326008)(5660300002)(8936002)(86362001)(8676002)(6512007)(66556008)(186003)(66476007)(6506007)(52116002)(66946007)(2906002)(83380400001)(316002)(38100700002)(44832011)(6486002)(2616005)(508600001)(1076003)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dAHvWqZYxTfItQOfb9HpmC9Ue0rntFeJcFsPBZq438lsiLgoBRH/eM528QWT?=
 =?us-ascii?Q?ZOGtriw4fd31w5c0PhihYtyKUIRhe46lPdHLi+oCCFdUo/Nm0T80eOUNtOY3?=
 =?us-ascii?Q?VNSZMkVptKx6Tp2vuwxoVIL6+H3r8S+2xe7z8bkAi0EfCKENiVJrsUM68k4q?=
 =?us-ascii?Q?RuhjfA2h7dTwBbi8bc6qhi6yvQHv+ygXUo0DmNUsnPjajVXE8ucT0rDgESmR?=
 =?us-ascii?Q?5Mpc+x7ssaollqjmIhZcnV/gGEH5PzoVfA7Z8+Dlp85mhDezlJ2s0NusCTZ6?=
 =?us-ascii?Q?jNiI0Qk33HSfNPg6U7SUpM+j28SAlbSdsHfnBIa/IqLZZ44zV8TwjchkkrIW?=
 =?us-ascii?Q?oAlQCUVGhzTSdPw476cS2paGBtp29JiPR/9yI/pUQUoqyBHKUS4uH3RdUe1N?=
 =?us-ascii?Q?k7R9dGP0w/qNzd8sg6Oc3NF5134j2UtP6OKmxUDLUO13dZIYV00wulegGbHT?=
 =?us-ascii?Q?CZypVui9/VuC77vq4rl3h4B4HKfyo92AagFYTbXY89bWQaytceZihXK4sjfv?=
 =?us-ascii?Q?WuzaBPYm9P0MP0HkkpmSFn7LD68JjSeAUin8TuVHvH0GjN23CLUHmMBhsXpY?=
 =?us-ascii?Q?p1c4Di614z6h36SzNraAUPrxhiH3BJIu1yDZKR6ZKJf/jkcGPzGpEdZ2Wd+m?=
 =?us-ascii?Q?KTK8pBnm6R6jeIq+2uWAJbkLQ5rW8yZfB+Nhh4ZJ8b5S/Fu3qvLvRGfTRyTf?=
 =?us-ascii?Q?1ekddy82FmJcK4stjLoMKkSEe1Bkrjx3DW3ZaD9UpZYbCpoPAKPZo+gvOuzP?=
 =?us-ascii?Q?5SmwCsDA/9Un5qx7zWaDWn1ldfDV8zSZRkkC7GZoXx6iMPa/nhBnM9C2HMx9?=
 =?us-ascii?Q?uyptXtFhlL+Kz4/Hy762my9+vXuBEOhaxwpgOq+M9xGc8oxbJIC+zyeevzbC?=
 =?us-ascii?Q?4myx5+jajqP9LUImN5+fvMvcjF6US95PW3wG1GwXxfGlCd9nqEu9uuP9Nufs?=
 =?us-ascii?Q?Ct2NmB03AUQFqzVkXHk1uo5yaTc3Tv5SN+n0EO0f+zpteqfTkhiD+dUJbxRk?=
 =?us-ascii?Q?Zyh54iNuG/F5Vaa7BhELBvVvyjBrOz7pTXXwcQVYJL3tnSJEpgsHw3dwTZWv?=
 =?us-ascii?Q?Z3eQkFLLr2g16yPYRtKb9vhqRwyQOntsR9SrfQrM2+C1xPDDPelgGbAY15zv?=
 =?us-ascii?Q?tqmGaovk5FX+eYdJ4vFmtYK+8TaBDRtJvxsT7JOA34fAed6OhW1SgF74RnKp?=
 =?us-ascii?Q?4Bsl2mZsSbZUMTxrrm8meuQJst8RAvCgoQTdTYl4ecfgVVVcLq/0q0vNA4fU?=
 =?us-ascii?Q?DQnw08f3/11S6rNEBG4aOHUhOIy0uBwHcSa3w2zDeZivmzbWYk0fM6TzkTeg?=
 =?us-ascii?Q?0nePtew8b1R54RwNC8/T6ctIp3BFffGCCfPawLroHDHbHPZMxOMwe3iNU+bs?=
 =?us-ascii?Q?4FfDyVaULxK0t0RmfTqR29lzxl4XjZSZfI/o9EPzYh8Mu38IknwSXTpQA8z9?=
 =?us-ascii?Q?O693WQk7G5HrCke2ezJdQKTTAL9YWY0xbjwC6XNmNi5dyBg8093awI4bRYb/?=
 =?us-ascii?Q?r4If82Bf8vl/UvUuJkq/LAlGRMfeqPPZ8J68xOFyx55BcYzGEnylFXvlhxU7?=
 =?us-ascii?Q?7+cQKOuB2/XX3HS6b119928JKLGJEFgkDn36IOgBeZLA2yF3U22GnzKfsPWU?=
 =?us-ascii?Q?p1t4ybGJ+sM7VA7co23huG93jl56auIp3QK2gBOuOlyF34ugPCS5Rc3sVSDD?=
 =?us-ascii?Q?55LBrvPs0mH5kkROeRb7N4kDqfvG5sjeNDew8JpAKROE6XB1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fba66f14-dfdd-4760-c955-08d9ab410f5d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 09:43:37.0283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1keFNm6+yXDMksgrGeJtO2iBYIL+BJwAu7eEeVof04ZUKBZYwK2Vxzg/0ezAG7xiPdKyLIEFKSOLHxrvlEe5iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3037
Cc: daniel.baluta@gmail.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-imx@nxp.com, daniel.baluta@nxp.com
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

