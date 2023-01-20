Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74595674DBC
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:06:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E1D12E06;
	Fri, 20 Jan 2023 08:05:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E1D12E06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674198360;
	bh=rC6vpG1Ta9mnRrdRF74hBeGJBtsTTlZH2sKayhKRNb0=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=E9jGpCyqM7r6b7T+9X3t/0oiFxm67ymf0SDN72B1kpolxxuXfcp91dy7+bk+zhUbQ
	 ++meAZty07daGkuncKRetj1h5Ye9kR/6/R6LUZsa9yP6iutXe1Qodw/8+QBxZkCqSx
	 AFDTxXf/orblaH7dDkFSHi0OijVuw2d2K4pSh4Xc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67FD3F80549;
	Fri, 20 Jan 2023 08:03:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 049B2F805AD; Fri, 20 Jan 2023 08:03:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2112.outbound.protection.outlook.com [40.107.114.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CB3BF8024D
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 08:02:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CB3BF8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=oAfYVp+n
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grGFqtqx/AqzULCUapLH4BgCJ7++TODvER74GDuAntxRuVGt6FyvoSQhGqu9tFCpBOossgb2aFe63GjxRo7eWa/03sgN5+/JwMtFNOMubPB/r0qSc9oX/4rl8K0nXtqsbzvJeGHWp0SHq6/L2Vjny5PcpnKdp/NdqYQOX8h6Kq+KfMkWhyiUuIinWoxloTAxittsmTA6a0srLLsOfARFkRPC6nsi0C1kgJ3lf5cEvjnWLAVrXP+VoixWKn7gSh9NxYeyasDtV7I2BMYPkuoBpwF/xypqC6XVLguMra9XV7LIrnOsM9aQ1ogZNq6qkx1GvnDIi4FYSLkdmgYJiJJkbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2CsvswnVRA/ZNYiMOCeNyvKVtXWrxiY4lp1NA2px+0=;
 b=RKt8p+5G78Y4OuL64PSHwNYhR5CXn8/w2HNqM0D+tLAg2oXIHL0rzrcRwHFbyYgHRGaiOPCULticueOxuIfppuzufWIrLo8GbjCb7rD6VCMSZyRHP6hPZMtZl8GnEOJ40huBFqncXjJZVaKSQwH21jJEfUMiI6dr2PHgNlZ+H2AZPb3Eu01uWDXnc24rJ9UzYBV4qXo4pktDiStal0H9u/v/vMClrJpWjoxsQ6Lq1ZHsPcInp0Fg3A0jJYaQ6odWU8o89S3jCPCYaSBkGiT3m3/LVY4vsokbDZ8NqTr9CDCjq3SXcRNNK5yz/T3rpE+9zKg0tbRm8lFqKL4RFyaSPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2CsvswnVRA/ZNYiMOCeNyvKVtXWrxiY4lp1NA2px+0=;
 b=oAfYVp+nAl1gAWzPpH8xVdBLDtuetVK2tHGjm2Wva72MWQ67COfoKQEiAv18FAQEV5o2rMRtz5eURg0x4i2Z3SiEMSm6rDON/D4SB6Q3vqPJqgZYIPpID9Cv/jsjUjyCg8ltQjdJ2R9fNINzXIo2YTKhyZhul3BzXEjYKX9jFww=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9337.jpnprd01.prod.outlook.com (2603:1096:400:195::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Fri, 20 Jan
 2023 07:02:54 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 07:02:54 +0000
Message-ID: <87sfg5k7s2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 12/25] ASoC: sdw-mockup: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 07:02:53 +0000
X-ClientProxiedBy: TY2PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:404:a6::22) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: 86ae66ad-e5a4-4fd5-c92d-08dafab45a37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MBQGEK84jWsQJIfhn1TNXLpj7spe1vTli1h/9HTD6BLUlbHstD16wF+PGlZJ3xwR+25Te8iz3jyqD2MuK48q25yghHMLS2kun/ckZwH23KZlAVuW9jkrfGmz9g9IePudEkbOj7PmKvV5ONmGbHjbz1lAhSmDNEliko5xsMzamM50iFInVuPXGXJ1XTf7zdBrgRtT3as69Oc734+RA0v0JDvk1xyqwdK0HnNDTZ8PJKBUVeNv21vjU8iJSX+UASI2I+gEUscLawr8nSaWIcVATwMU2KKwGRdiLlF8XIyRl7uCKESuj2P+pBBbcbRDYA5UmXbps6BMg/4ViuAQxhw5ySpkjxLV7o/zXtS27YMtrGBTf+12TxP+h4JzmJ1Su3fDPCAHjfqTG9TQw/Gi+S9wHm10PrusF++DHHRCYksIAyXgoVpf+3zGlpxOnGZMcSDAw8s9GwB9LX4RXnfC1H3DNeq7CVYhAeQHyF/UO56+uFnM92LVWVEboPN7UnOn8nFIgF6Gf0QWRzB+Zl2FOxLufgjXFeknRIBBzC5bmUwIdFevlO61RTbCRAArG6Ccnln1QhDm3TR0ok6xtaDhu3e4t8GV5ClDfdcI4lobfFIsiNlnufLdn6TZ2ST8hR+SJTc5NDS5toUxNo94snccMnvGiDIuqF5NnCfs3QyIzda4vrl7IGMPudeaQcQ/gYA4ozsZTkcKKIX1V33S9lfPXuAa+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(2906002)(83380400001)(41300700001)(6916009)(66476007)(8676002)(66556008)(66946007)(36756003)(4326008)(4744005)(7416002)(2616005)(8936002)(54906003)(5660300002)(316002)(6512007)(186003)(26005)(478600001)(38100700002)(38350700002)(52116002)(6506007)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n3PFDsoBuqDmSaXvNRSgXf68c/2/FZUvdqNiEwAGUGWuP4r7664F/iWyfz6Y?=
 =?us-ascii?Q?mK+0BNWVATgGTV++lu/fRLjQZhctJUsdZT3lTMUdfybt4UUWcRz0qfmMbq2S?=
 =?us-ascii?Q?FIX/BC7G4WUiXk15f4kzEQdEHw30e/xnGY9glWOM4N+Dd1HpXWJtxh5T1C2h?=
 =?us-ascii?Q?NLlkpZR1irSxpnnc3CQHbFSsY/sRW6dje55m9IJ0uuSOdTWDA2oDMgwKuPEJ?=
 =?us-ascii?Q?7fb0JF9w7dQIu7QEOU3SS52As6vLLikBQxHA+CV5CH0DqonwfNDD+eflOS3R?=
 =?us-ascii?Q?gKpKsqoYg+CIkzegxT7dKnlUat0HmTDmkNY79ahN633UKBGewFTA8yyn9YEw?=
 =?us-ascii?Q?/e5G0B1qNIkaOlVBLPMxOmq6NqZHkk/inEAToTfU+c0i4RWPd1sCIOsrx+xv?=
 =?us-ascii?Q?Vh7gMv7dNrVl5L8Fyw/5KkO1QOOXNE3xHmKpvMyKr2Q57NNmtDWZvKneAnEn?=
 =?us-ascii?Q?hRZjiY0D4eRwc1Ma0cEV45wdzTgmFa6EXFRa36Wnrsn4TUmRrftwSErklxjw?=
 =?us-ascii?Q?QVwTi38Cy/WHjBK/DQXEwLxL+fkeok5lYAo/o7owLq80IXszJPIMkoI+PhNX?=
 =?us-ascii?Q?81Y1fom+iTjMYbuAZD2JOFcbQII0mgfbXoDvgMGUVR0s9tnJoHcWk95RMl05?=
 =?us-ascii?Q?Sa/Y6rkLTWsEmRlMQtXiA5QEQHtFIkvDrDnePk+loXaPONUI7Zy6jGwz010D?=
 =?us-ascii?Q?jSmfw1k0oV80Kyr5Ek7CtCcBiURzZCecF0vorah04ZfugKfHrqf/6BV+5Wr6?=
 =?us-ascii?Q?PLTjdsYisPFPpriBnblIsAm1/E1bouKWaiXBsaceSJsbgTa3xVDu2qNXSdB6?=
 =?us-ascii?Q?sbi44+jKdSiSrWWQj0k3yPsHsd4xr+OTx1hZmnMRc3m02vY7C7jTuR4OA5JH?=
 =?us-ascii?Q?1JRPPnbAsXCguC7ZCvFtJs4fwrt0jvMqGjc9kj5S9NWzvgYUXv+21BhKRpZf?=
 =?us-ascii?Q?o0O8YPInYmTNMuKRDXypp1yZCXyCMd1C6aIw2tvMfB0Qvu3aYEbDEgVLs7y0?=
 =?us-ascii?Q?M0IZo2Vc0DRxYUbW+Dwua4GOikTjHP8caDfZEs1V2PWkSXdAsaJGYy4WsL09?=
 =?us-ascii?Q?IeeQs0zuUtN+Zar5f6n0vs94FDVuFJrzBmWhszH9lGQPkY84DLtWvh9eoCj9?=
 =?us-ascii?Q?f7DlY1rx+mryHGCL7hU6MyV44AQTex6zi/hcxCxE5hduBNLJ7F1Y9D/XIw5o?=
 =?us-ascii?Q?VSnCs7RQYpAjxZhK5c9S2PUYI20KhwA6ZV+3Z/kOrw3tqOg3VjOTPyybVBeN?=
 =?us-ascii?Q?B17Qq9Kpn4Wc1AnQLE/H/rHjDdSrDTan+mabWdY48u/ULquxHjMRMLChSeDi?=
 =?us-ascii?Q?ugE0NMc29ZOSS8Po6n4bsKB2kX4KXK4B5om5Ayv0G4g0tc7pLf2wVQwHJjkp?=
 =?us-ascii?Q?vE0SUSks46UY5CMZA1LqOrx9rYDoaAq7kAyAEN7S4xTtdJoOUDMY5DrHneKt?=
 =?us-ascii?Q?IYwo6yMVgVwKVDoxgMaCaf15Mvuxdbb8ohpuNY+8IwYv4dBdxE6LHnYj+8ZJ?=
 =?us-ascii?Q?aP4qhEyNlM7agY6u4nlxej7Trewd7rigozGBuZo7NqehvPRJSKvgs7ZVEwmW?=
 =?us-ascii?Q?UOysIb67Im0+uXDfRTHgf0Z2jc1WGk/LVfFDC/tGmuXLbtZlOH9/dc+hWYhj?=
 =?us-ascii?Q?aiBUDdvEdLA7o/Sodg959rk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ae66ad-e5a4-4fd5-c92d-08dafab45a37
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:02:54.6008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3TQuxIyHt6azwcVaiHuAcQyIVjRXups76HLFl4uFVXcotaQ+p8WmyNLXK4sQGX3GfmLWpiHDlgScMiAfzqTnRX1ymLF+2WMCvuRkLYTS3BGEqze1+M52x2LFZS6eszEw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9337
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Heiko Stuebner <heiko@sntech.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Colin Ian King <colin.i.king@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/sdw-mockup.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/codecs/sdw-mockup.c b/sound/soc/codecs/sdw-mockup.c
index af52f2728854..62b02d764f09 100644
--- a/sound/soc/codecs/sdw-mockup.c
+++ b/sound/soc/codecs/sdw-mockup.c
@@ -57,10 +57,7 @@ static int sdw_mockup_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
-- 
2.25.1

