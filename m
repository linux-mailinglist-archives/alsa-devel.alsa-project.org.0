Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1322E487E7F
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jan 2022 22:50:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9892618F4;
	Fri,  7 Jan 2022 22:49:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9892618F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641592214;
	bh=iXayETYBe34wswKWR+HFAsICqVIbjBG9AoNkdbyM0t0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n/XleskWhHb86C1YUJUkXOu5eqHNASVL7J5xB0JmIDoEsTTCaMKMOwLOFWc1o1dsM
	 kbAlrPAgOqGU6uxSrXkIhJh8ia4OTdufWqWyXy2K2xD8ELyrbXjdrKsi+LltfVTrum
	 sDwtBfnNJRolfvMo8IX6LiaX4ypejF1iiSQkBdNI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C61DF8050F;
	Fri,  7 Jan 2022 22:47:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4761F80515; Fri,  7 Jan 2022 22:47:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0d-0054df01.pphosted.com (mx0d-0054df01.pphosted.com
 [67.231.150.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF611F80425
 for <alsa-devel@alsa-project.org>; Fri,  7 Jan 2022 22:47:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF611F80425
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="SM36YUZg"
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 207LPGa2026852;
 Fri, 7 Jan 2022 16:47:40 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com
 (mail-qb1can01lp2057.outbound.protection.outlook.com [104.47.60.57])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3de4vqgpyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 16:47:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VeJ49kSNFO0wsBpMyH+604VnJHk64vUTc1rvMgmR/emG93xwQvdD1bFUHTJ5egxisToCpsKIvg9AY2CYQyO5wjDgYC2heVVsbaVxF1LtO1DEo/FSycMidXJSZip0k5IJC6v87CuNcZb2FQXoWA/RM0m//SCf79s3J0kbPV98kxLJlrDgVqBff4rpR/CWA3dVaWuVtf1f2FfWsx9wja1k5ZQM70wcsp0HdQNkIiyfFNPQ6OiQBMFN4S7PeBrxafq2OrV9iWxJFcqr8ORFuaErguaHwRYwDgQfvDJxcBeTpaIWsY6Lm9+501YY8sdouYF202oXJI2gQsEeCGahnZxciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBuGkiztIfrv7X50LeaVLlCCS1E9XCeo2SZegZqpvxM=;
 b=PZmrTMYk9NRv8uBkzmrW4Ge9RxJtK1sjEFfdQiYtNWiER4RLiyqqujti0qKakbdxYG0BfjeHIynJuok/lOiTiqYMHi8WW2uV2j9tiILZW3vN17ceGYsoy8Wscx6/Aay3XU3wSiojI1/Ac0kVgMz+0akryUF6U13okuvl15ctntaS6/yKNkDqJ5Pnhx2/g6Ky+bgJv6oxVVhfBa48Fj3U3eXq8VTXb6oWG01D2a5xTsIa+jKxLjc/ybFjtYb920hpONYHSpLr9eU8IjnP77/EQ0Vq1KpPgcpaYnj1fUX/L4HDG8jtDDI5jhP2A6n10wM9IfwaQM1S42U3LbASX9qMVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBuGkiztIfrv7X50LeaVLlCCS1E9XCeo2SZegZqpvxM=;
 b=SM36YUZgAbF8MwCn8KSCA6q9U0Oh2TqJIqyvT07nXfauKo5ti18L0v2jkfqUp14SEsdy6/iuttQ7elYnlK+xALr/tDiQZip4McZ3FrZaCM2QFS89MVOMfG4P0mMSgyFEz27gqWWcVjip+rNTwiepebRFD/Y9IsiclsNLOeh5XDE=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT3PR01MB6275.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Fri, 7 Jan
 2022 21:47:39 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76%5]) with mapi id 15.20.4844.016; Fri, 7 Jan 2022
 21:47:39 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 3/6] ASoC: xilinx: xlnx_i2s: create drvdata structure
Date: Fri,  7 Jan 2022 15:47:08 -0600
Message-Id: <20220107214711.1100162-4-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220107214711.1100162-1-robert.hancock@calian.com>
References: <20220107214711.1100162-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CO2PR04CA0136.namprd04.prod.outlook.com (2603:10b6:104::14)
 To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0072bf79-c1ae-4ede-d6f1-08d9d227532c
X-MS-TrafficTypeDiagnostic: YT3PR01MB6275:EE_
X-Microsoft-Antispam-PRVS: <YT3PR01MB6275DC593048833029228BBAEC4D9@YT3PR01MB6275.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:47;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TkDFRMF3w1NJIGvV5XbjPcVEg5KqqmxAvsVsQmbmj3t74l/yHUlOBEzf6443erDoWAqODjfrb4zbY3qbmh3Z2QCp7x3jxQAU7TFXcGJTuX8OT9WHdMTLxxtNY7Y28ylU5B9FLi0rmXoU9x2EXxB5qLWiH14dwkOnbJ1OIungQ0OfhDSHVSesT+hB/XMM8o01+l2O9L8BXhgr1nU66uYL7ck+sfRqGfcVfB7YlMenmG2z5HKp5MKncmAbi4o2EI6biVuB5P879ZWriHTHKXsADYkQaTAGORyuMCI3ELM2ka0jiNzcoTPbZ297oXzEeL6MnddLKfButo0iaqgqVTEX/P2t+Jrks9mWuC2CSMhSzZDAd0SBJqwO7qhfw3uKEWpO9FfZHzFk+YFfyyf5Gm7/F/B+4tDJLw69oxCaWdZXSKzpvQabkrnW8bMRA45TF6M7eRuXStk5tqRGfxfSQYi8Pq0O7XTl62X341Wu1fv1uwodBHgZ/s9XYRnzlhSmwOwhNJTHvbxB1WCOyq1+rVtdurL86i3as26+nQmh+hjTCuPRD2veZtpIzXJ7QQU2TArxAUACrbfuPCS9Vbg5tuQOhaNLb4GCnAa6RtKU5oMtdAg5AvXRoNFPgo9P59PqD6PJro5FzdMkz3JBLEQJEmqaC3KGeRayuZyXA9O2tNnjyhmDMLWAVbGZmeJ5SOlHKCMoNE3BcwhT7eO9hoKeRVK4Uw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(38350700002)(83380400001)(86362001)(26005)(6666004)(316002)(8676002)(4326008)(508600001)(52116002)(8936002)(186003)(36756003)(44832011)(6916009)(2616005)(6486002)(6512007)(2906002)(107886003)(6506007)(66476007)(66556008)(5660300002)(66946007)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EYr6iLIW2RMcvNIxZj31AgGjQUBnV96qpnBz77SCCWzjzuTYzsfYna7ymE/X?=
 =?us-ascii?Q?3Xref4vCT3Jyz1oGlhWIC0pF7Pp2QJAnwhYUA+Gf1TPofSmYtOB9VoEs1WDG?=
 =?us-ascii?Q?p5ZahfIghGo2bLTcbDxRyNcRvOGkOzOJhBEHdj9iD9eZqwIe+vBjmXeT8ehL?=
 =?us-ascii?Q?URmPZ7RPApEqwSkz60nxVEHuKu3ySlgy2jEe6ihzXSvT4pLHu6Emtt9T9jsT?=
 =?us-ascii?Q?29/U6usYhns5zGn/uQ2WL4isdIjuz3zLtfrEowYfKhAuZVyzTBrl7eTXc7YC?=
 =?us-ascii?Q?s6AQOhYtgCl4RFs0YlsLhRh4Fo9/SkCk0m3PRjFlbiWpTzzw+JPuOnk+1Ryp?=
 =?us-ascii?Q?F6TItRdfbjowgvDGLxIyEI/A1NLaDMTsgtcke1fjnlV0sPrP+lbkeW9/Ar0s?=
 =?us-ascii?Q?95jxqgYr1EkRq88LTAEBZMhGiG7dUGpJB3ZexZTarKHhLJ96+9Az3e2c+w3d?=
 =?us-ascii?Q?WYkny9GbSLZrDxWR6AegftyS1+vBrHRa5k3b7KiRfsUSsCTrVdb5P5Px/huQ?=
 =?us-ascii?Q?AuefHl+rW9cUMo+aMuidxXiahFit3DmG/6VVs+X0vr9kpShJ/dI6A5DtygwJ?=
 =?us-ascii?Q?bQqzqmUcRLDngEG/+4dfxSVh+T6gyf6QKfahE9EXsP0w6OLbLoWmnFU5SrrL?=
 =?us-ascii?Q?dp7Qvjaz8Fo5nZXDENkp5U8FdHE6wKwEbp95IgfJaUKTp1q92/adj1j+H/5v?=
 =?us-ascii?Q?l80qoJjlvBMVOhO4I2o7zhFBDPcK7tR+S4Q2CcjW1D9wrDGXsP/wc8snVH2H?=
 =?us-ascii?Q?bEblMozTUi5ELCTGJsj34wHkJYPnyc9J7Oo/Jd+hIWu5TlQN6D2HwxW7nIgJ?=
 =?us-ascii?Q?/pxbrh4Kl9qirHGVq6hdgEabEfp7LgBF/3ZpnSIv0O4GRvlntQPWL8aD7kTM?=
 =?us-ascii?Q?pssOwYn4ighzaybB4NvrEbT3whu6sRA3CRSCpg1NN9HlmByHMZV5154gYxn8?=
 =?us-ascii?Q?iysDGblaOP3HZsPaOl2I5og902ZhGGLD/GiUD/sMkAHdvjr5gI5HjqZv/BXH?=
 =?us-ascii?Q?bg97S0JRz+sOIqo9sOaURDPdpy9A+Z2TsX2sXw8JAN94cYtbl9do/dq19Wm2?=
 =?us-ascii?Q?uyGxW0aSVhavBobK99vrdg0EH3zmz0OZYTeA7a4gKhGR9k0EZWb7VUim+lIl?=
 =?us-ascii?Q?OZsvCwcEDoosaudF0zPEZv3B4ZLZzBNourxXZTJzOAR/vXJQyOZteGeFyOjB?=
 =?us-ascii?Q?t7kcnOD0VC6CyeELth6yjGoJNglGvEhAsClElfDQFYCu/OcCsQIfqNzDvH5f?=
 =?us-ascii?Q?pH3YXSOAiTVnirGCZ7Uyv42X1mlVRM5ZJIm8ajkjokzbzgPUIOHAYhauIaso?=
 =?us-ascii?Q?3a0REe4E+YQzP1j1oe9XR9kIfeLbNr9QODWasWITSojziAnDt5u3mT5hu7m7?=
 =?us-ascii?Q?Vz0kMX1gwzu6VJRDgPaKmO2r7ZSG6qJqAR60GXGx8EzDNoI5M7KV6c+Jz2AI?=
 =?us-ascii?Q?5M6/4PaazF2TXZL6b8LZxpqEOmvpn2sP9Vaxnx28bh4F1LGuHMfJkzmLxzeM?=
 =?us-ascii?Q?6QRn0UHQLpGOMybrYhxpEtcimapCrC2+uwVuTBrCCxUrDUoQQwjNMHl5vcZ9?=
 =?us-ascii?Q?rjhwd0smEFc4U9SUuROnvWVINSrn8J0CQChuyr9/HTobFrp0EUjsYXuT2opQ?=
 =?us-ascii?Q?P5olrC5Vab+pdBuBiylSm2VCUwfFK+EqecZ7e5xFdfX89Ncum/ahKh/BeHV1?=
 =?us-ascii?Q?jLZ1bdl6tZq37ZvqAM6j/4ODTDU=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0072bf79-c1ae-4ede-d6f1-08d9d227532c
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 21:47:39.1890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxqvCWyCLpM+fbIrHnvqgKTEj89g/ejrTKnKh+v7kz/qQ2QWVf3AbtGI/DW1zVIJiwsEAFxNeUmst2XN2INDR96gyIf+8TtydiYkE7X5TL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB6275
X-Proofpoint-GUID: iDh8HMsnSoNGq4hkKGli3Sn0dSsPk4Z3
X-Proofpoint-ORIG-GUID: iDh8HMsnSoNGq4hkKGli3Sn0dSsPk4Z3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_10,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=620 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201070129
Cc: kuninori.morimoto.gx@renesas.com, michal.simek@xilinx.com,
 maruthi.srinivas.bayyavarapu@xilinx.com, tiwai@suse.com,
 Robert Hancock <robert.hancock@calian.com>, broonie@kernel.org
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

An upcoming change will require storing additional driver data other
than the memory base address. Create a drvdata structure and use that
rather than storing the raw base address pointer.

Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 sound/soc/xilinx/xlnx_i2s.c | 66 ++++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 31 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_i2s.c b/sound/soc/xilinx/xlnx_i2s.c
index cc641e582c82..3bafa34b789a 100644
--- a/sound/soc/xilinx/xlnx_i2s.c
+++ b/sound/soc/xilinx/xlnx_i2s.c
@@ -22,15 +22,20 @@
 #define I2S_CH0_OFFSET			0x30
 #define I2S_I2STIM_VALID_MASK		GENMASK(7, 0)
 
+struct xlnx_i2s_drv_data {
+	struct snd_soc_dai_driver dai_drv;
+	void __iomem *base;
+};
+
 static int xlnx_i2s_set_sclkout_div(struct snd_soc_dai *cpu_dai,
 				    int div_id, int div)
 {
-	void __iomem *base = snd_soc_dai_get_drvdata(cpu_dai);
+	struct xlnx_i2s_drv_data *drv_data = snd_soc_dai_get_drvdata(cpu_dai);
 
 	if (!div || (div & ~I2S_I2STIM_VALID_MASK))
 		return -EINVAL;
 
-	writel(div, base + I2S_I2STIM_OFFSET);
+	writel(div, drv_data->base + I2S_I2STIM_OFFSET);
 
 	return 0;
 }
@@ -40,13 +45,13 @@ static int xlnx_i2s_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *i2s_dai)
 {
 	u32 reg_off, chan_id;
-	void __iomem *base = snd_soc_dai_get_drvdata(i2s_dai);
+	struct xlnx_i2s_drv_data *drv_data = snd_soc_dai_get_drvdata(i2s_dai);
 
 	chan_id = params_channels(params) / 2;
 
 	while (chan_id > 0) {
 		reg_off = I2S_CH0_OFFSET + ((chan_id - 1) * 4);
-		writel(chan_id, base + reg_off);
+		writel(chan_id, drv_data->base + reg_off);
 		chan_id--;
 	}
 
@@ -56,18 +61,18 @@ static int xlnx_i2s_hw_params(struct snd_pcm_substream *substream,
 static int xlnx_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 			    struct snd_soc_dai *i2s_dai)
 {
-	void __iomem *base = snd_soc_dai_get_drvdata(i2s_dai);
+	struct xlnx_i2s_drv_data *drv_data = snd_soc_dai_get_drvdata(i2s_dai);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		writel(1, base + I2S_CORE_CTRL_OFFSET);
+		writel(1, drv_data->base + I2S_CORE_CTRL_OFFSET);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		writel(0, base + I2S_CORE_CTRL_OFFSET);
+		writel(0, drv_data->base + I2S_CORE_CTRL_OFFSET);
 		break;
 	default:
 		return -EINVAL;
@@ -95,20 +100,19 @@ MODULE_DEVICE_TABLE(of, xlnx_i2s_of_match);
 
 static int xlnx_i2s_probe(struct platform_device *pdev)
 {
-	void __iomem *base;
-	struct snd_soc_dai_driver *dai_drv;
+	struct xlnx_i2s_drv_data *drv_data;
 	int ret;
 	u32 ch, format, data_width;
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
 
-	dai_drv = devm_kzalloc(&pdev->dev, sizeof(*dai_drv), GFP_KERNEL);
-	if (!dai_drv)
+	drv_data = devm_kzalloc(&pdev->dev, sizeof(*drv_data), GFP_KERNEL);
+	if (!drv_data)
 		return -ENOMEM;
 
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	drv_data->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(drv_data->base))
+		return PTR_ERR(drv_data->base);
 
 	ret = of_property_read_u32(node, "xlnx,num-channels", &ch);
 	if (ret < 0) {
@@ -134,35 +138,35 @@ static int xlnx_i2s_probe(struct platform_device *pdev)
 	}
 
 	if (of_device_is_compatible(node, "xlnx,i2s-transmitter-1.0")) {
-		dai_drv->name = "xlnx_i2s_playback";
-		dai_drv->playback.stream_name = "Playback";
-		dai_drv->playback.formats = format;
-		dai_drv->playback.channels_min = ch;
-		dai_drv->playback.channels_max = ch;
-		dai_drv->playback.rates	= SNDRV_PCM_RATE_8000_192000;
-		dai_drv->ops = &xlnx_i2s_dai_ops;
+		drv_data->dai_drv.name = "xlnx_i2s_playback";
+		drv_data->dai_drv.playback.stream_name = "Playback";
+		drv_data->dai_drv.playback.formats = format;
+		drv_data->dai_drv.playback.channels_min = ch;
+		drv_data->dai_drv.playback.channels_max = ch;
+		drv_data->dai_drv.playback.rates	= SNDRV_PCM_RATE_8000_192000;
+		drv_data->dai_drv.ops = &xlnx_i2s_dai_ops;
 	} else if (of_device_is_compatible(node, "xlnx,i2s-receiver-1.0")) {
-		dai_drv->name = "xlnx_i2s_capture";
-		dai_drv->capture.stream_name = "Capture";
-		dai_drv->capture.formats = format;
-		dai_drv->capture.channels_min = ch;
-		dai_drv->capture.channels_max = ch;
-		dai_drv->capture.rates = SNDRV_PCM_RATE_8000_192000;
-		dai_drv->ops = &xlnx_i2s_dai_ops;
+		drv_data->dai_drv.name = "xlnx_i2s_capture";
+		drv_data->dai_drv.capture.stream_name = "Capture";
+		drv_data->dai_drv.capture.formats = format;
+		drv_data->dai_drv.capture.channels_min = ch;
+		drv_data->dai_drv.capture.channels_max = ch;
+		drv_data->dai_drv.capture.rates = SNDRV_PCM_RATE_8000_192000;
+		drv_data->dai_drv.ops = &xlnx_i2s_dai_ops;
 	} else {
 		return -ENODEV;
 	}
 
-	dev_set_drvdata(&pdev->dev, base);
+	dev_set_drvdata(&pdev->dev, drv_data);
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &xlnx_i2s_component,
-					      dai_drv, 1);
+					      &drv_data->dai_drv, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "i2s component registration failed\n");
 		return ret;
 	}
 
-	dev_info(&pdev->dev, "%s DAI registered\n", dai_drv->name);
+	dev_info(&pdev->dev, "%s DAI registered\n", drv_data->dai_drv.name);
 
 	return ret;
 }
-- 
2.31.1

