Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 881BC495526
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 21:00:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D95672D73;
	Thu, 20 Jan 2022 20:59:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D95672D73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642708842;
	bh=iXayETYBe34wswKWR+HFAsICqVIbjBG9AoNkdbyM0t0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TtUL0Ze45WUSXSexa8CIBJ1hUJXzpp664KT5dH5gQ6EQ1SZGsEM7U038nO7umHBaA
	 EIR1k/H1i4zL6tC0YjnjTb2/VoRwDKSl2Niu8iPbPYMq6KIhmZOH+2VSO/u9MRc8KS
	 R9yMczIdsIuHSIfE0xBfSEmG/3HLLbU2VWmB3Fa8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90F7AF80507;
	Thu, 20 Jan 2022 20:59:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB5D5F80507; Thu, 20 Jan 2022 20:59:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0d-0054df01.pphosted.com (mx0d-0054df01.pphosted.com
 [67.231.150.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCC26F800F2
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 20:58:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCC26F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="I3Wch0gl"
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20KBlB4V009477;
 Thu, 20 Jan 2022 14:58:57 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com
 (mail-to1can01lp2054.outbound.protection.outlook.com [104.47.61.54])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dpmt68sbc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jan 2022 14:58:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esNFxsqSjT9RqAHsmZz8EyhZnT2TqiT88YJxg37BzjoAbMIpyJhH30O7Yjwa+SmXs87IeMiPMyBMUzrqhogJmJD7HRrpwUppwRf7WvoGXGztx7lIy/UPWpVsimqfE8gy0ieuCYcMHGznGD+j6JRWQ29GD0RKTsi7VSaOniighSIkpuItx/oeACPgF+80/kVmj19izGnhQaM2FRz3xJlBNYtGZB+wGY15173RIVVPiRSmjOECJ6WiD0j3TV9hmgbiqD9pML+Vdp99N5nG6dcv0UxMffUm/laNtGa1t2v1/fJz6qnd3bJZM/FCgYy0qTOH9xux/OkiGLbRVYk3BMTA+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBuGkiztIfrv7X50LeaVLlCCS1E9XCeo2SZegZqpvxM=;
 b=BOtA54sFGHyNlxtfWOqVHlx6jK5nBmsNlyk4D8W700ZV0RaPLknrb91pKfyiY1XzDlxM65N+5cbHIaZXSwYCWBRzd+r+I+zd/XNaaBoTi8/pp30jxy3dGFmcCbzV/f+uSviBvzc+Eot1yrvC11eCBn2P6YZk1uoqKxGq6WJiiNBkDH2QtSvfY0xqhGQk+OBxoWYt7dSQ1D3BFw22IDCbwDxhiDPEou9CwAQhtsBpRI2yfiwKAUepcE+swuLu5m5DcQMAFjfD5+AcODrd6COIgJGTCN+Mk8xGMbM53NcKWTREqTaEXfbpoS7O4NLMCmsJn+P0diJKCFid1vWENrCE3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBuGkiztIfrv7X50LeaVLlCCS1E9XCeo2SZegZqpvxM=;
 b=I3Wch0glVXVGtWPxiZEWtHDa03jFicahUutfgWaMi/RjZLi4f7XrPvVjai9WjrBES5MkHqCDmT7P82wed3vseFZUVmg7/fm+zBfZ/Fm24jiwbD76RqDsZM60Ag79+cEVplzn1MV4NJoRa7m4Z/FBu6l7sbYPVLjxDTzWHGIm8pM=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YTXPR0101MB1053.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.11; Thu, 20 Jan
 2022 19:58:55 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.014; Thu, 20 Jan 2022
 19:58:55 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 2/6] ASoC: xilinx: xlnx_i2s: create drvdata structure
Date: Thu, 20 Jan 2022 13:58:28 -0600
Message-Id: <20220120195832.1742271-3-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220120195832.1742271-1-robert.hancock@calian.com>
References: <20220120195832.1742271-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:610:76::29) To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75a4f976-cacc-4097-802b-08d9dc4f49cf
X-MS-TrafficTypeDiagnostic: YTXPR0101MB1053:EE_
X-Microsoft-Antispam-PRVS: <YTXPR0101MB105309C7FF1473DFD64ABEF2EC5A9@YTXPR0101MB1053.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:47;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8qd+Z7gtJh3sCcbfZ88KI3L5hFhg73oU6Qm9UDTDIcA7bwOXw/ooEoYH8BqHzmeqaSE3UNPTsNcAHAHuIhjgyh0z7B2mLhnVQ+dEbr59xnAKu+RRCvL2AE69jVMT6kncpmCD0pBwhuCzGL/y9i+kEhcD4J6Ob1tI2c3GGcxyb5uret8RKrB4GNAiC5nZAiA6JzGJAbvXguZiL6mWQ8vfmO72iogMMCPpoMwk9FhWCSkNbG4Xd4yxzaxxbfUR7jUocGdLjqA2WG154l/PxWNLbvBnTcL1wENNvjlYdeukulMabx7D76nhP2I9NXOZnVChckQd590KX19t3qsc0cYLwfyXgfpeLXmvswj/+SWxJF/2EhzZBHVITX0bbiCwFlJwJuwwceZaTVKW7m2UurtrQ52yDBmgNU/3GdwAsa6fSejx1VANlUVYPB+BokYtgQ/BZkg3j7FICP0FGU9ZC1Si59KPi9W0E8aB6wOHUe36Yg6HAvfx2yrhC1iUwwXlchkpbHqjF/zxskC3YfiXhjaXppVcWOn1SPo8dJHQvNkey1R5yUXq8J7k4zGgaHh34oI8TWcrba3SxVzhXyMrw0LG9X9HgZEcAWyM4SHFlWRmYiyfNnR0Zi3iSYKdjy5rRD/XcF5T/edNYA7MoYuJNeAEmB0A4pnhVdNjjEPcw+c8PYFR34rcPt2r8YR9ajFvOsTOxy/fssOvQG/G/LisGPPZFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(508600001)(26005)(83380400001)(2616005)(6512007)(107886003)(1076003)(2906002)(38100700002)(186003)(52116002)(66556008)(38350700002)(316002)(6666004)(4326008)(7416002)(66946007)(66476007)(6506007)(8936002)(6916009)(6486002)(36756003)(44832011)(8676002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zlJW/+jcfRCWBjJ1u4CVGtNznZt8BbzbY6WgrO7Hv2TyqTQd8rkn6xNNbMBA?=
 =?us-ascii?Q?QjEzG9FSquNZbXpqAVBAXY2V0VeE/rX6vFpXYUAaQrf71rYT8OVPLFjDFbBe?=
 =?us-ascii?Q?Uq3iVGSbQzxcQp+HY7dixgMtwMSYHe5SyBPF9GWHUW4q8TuGR1neMu7u5AlV?=
 =?us-ascii?Q?HPYLCnUNXoORHWTRggaDaasZ+VKFtS4yN/wrSPptopPyVDCMa0PCfjH5+bJU?=
 =?us-ascii?Q?1ILokEdzxIudHVjotaENMNsapldwvXH4Ba7fDQ4oQ4Rii9MHJgbrgUG41PW9?=
 =?us-ascii?Q?XThdt0A8fGrBkgGxDbCcPluR4G3VyhlVaeGwXCdAPyQKtH+Jlpph77cd9Dq9?=
 =?us-ascii?Q?y0GFKI3+Yo7fcmGYhhKHl9jyEY6fgudnxu/W2GslXue2GvPGPVF+Cz/FKdNj?=
 =?us-ascii?Q?wm0REv6FwykO261KUFjoaWgPkblAEfTYRw5iGm/XR8qDnfCTfXN9tU1NKDbk?=
 =?us-ascii?Q?uqlkO+QjDW7YiToD16/w+aCuR/mQDkbh9Ds6daEAexXuoZoNLQyecltyR/He?=
 =?us-ascii?Q?mObzfbJPGSAGP+qqVE8owP1gEoJqP4AL2VkvI6PudkvlI5Q35E6D19cbOolq?=
 =?us-ascii?Q?JuaQwu9SJnZwp86laQ3s1QK3yjj3uhdlEau/3l/aogyrRvg87rDWzmQaMOAM?=
 =?us-ascii?Q?CXLE2Nmz9YwQ6VdEtPWy+xlEhIev/vJmsxtaCMYVpsrg8IwCaEgha6TSUbLJ?=
 =?us-ascii?Q?898DLZ5IICHTYWcZZGMAtULBi69Wfa8h/GInyVhN2Fc63ljCv1SMkw3+nkcy?=
 =?us-ascii?Q?FU12VU1zzwr5mdN1jC1X05zO9BSL61CYBAeQ8StAq7EHSAdjeWcEsFvJORxc?=
 =?us-ascii?Q?YZOq7yjhSHeDI6UtVEwy6+pp5UdeXl/NjEAt+fjlHqJMK/Bsejie8ZSfAr/A?=
 =?us-ascii?Q?M6x2slh7aypTRc7DC3EUZsiavmFPlJd5FW/84k6j0UHeemGoG95zZRIppdqx?=
 =?us-ascii?Q?u51NtQ4n2JPUecLW62ChTCZPZ4kyDcd5Po7OEwWq9Axg6lzxjqwxQ8ZPxh+M?=
 =?us-ascii?Q?KniHb5TuCxgL7EKy7Z2IlN4fcsZg94lMs8e1Oj5NWPvmStvYfseNeSVrgK5/?=
 =?us-ascii?Q?AtSApc/FYhPjFMA79/9wa3poYytm5u4Z5M8oafFa5MjINwDHbPqtCn+axW54?=
 =?us-ascii?Q?F2iuqx6KYdB2vFGdfM8z1JTRzs0DgbfHvGnKudkRl0WTMavx5RVmCmouNLvg?=
 =?us-ascii?Q?fxqCgCrntWSzRCPkIy0Fbb5zKKclh8OuoB0MzCJ2vx3iXm9airX+bngrIJHK?=
 =?us-ascii?Q?EjIKKovH9+2Sb+0ECl359qbERqNTFb6HO+KdJBvD330II35S1oMERs0oIQg2?=
 =?us-ascii?Q?sysT1uwUWnywNSRG6WVSb3dOqR4UJIxJLF+5v9ROOgGW8mdGXewRg+aLvXoS?=
 =?us-ascii?Q?ZjmtCsq1MQLNdfo0yfhof9B/173WnqXM8SKH4VFhmyhW71457vjoTHYAuj0Q?=
 =?us-ascii?Q?w0iHKl8th3u6DmYM27McZ2WeI2yYqz7PonsdxzVHW2bUAriIok7E4FGv3oxs?=
 =?us-ascii?Q?o/LAMEce4ocviFL9qs+oXNCkrEX8HzwXy7amUUzw8/ZpBff5ydW0XLxfJA4S?=
 =?us-ascii?Q?iUIO03YCT35cvKr7Vq23f+hBsBpDcoRfRs1kS2ew/il/75L4uISoBo6+fwds?=
 =?us-ascii?Q?/lSCN3hKC4CmI7h6rkkxjNdVzPHva5Vf55vst4wLY6xA3zyP+2P3Bj08OIfO?=
 =?us-ascii?Q?TAw/m6z5degF5ulA8G2LUyB+pq0=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a4f976-cacc-4097-802b-08d9dc4f49cf
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 19:58:54.9748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPcluHKCTgFKmn0kJvcj3MiX0+v5bGMjldaZuiXbweN38MhKQSZRkFk5YU0ePt53DWIqgh106SejKtIM3Z8IiE+vE0g/B0DUbz2K8mOCmsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YTXPR0101MB1053
X-Proofpoint-GUID: TkibR7qVJVm_sxqH19N4SawOoHUEf8Nj
X-Proofpoint-ORIG-GUID: TkibR7qVJVm_sxqH19N4SawOoHUEf8Nj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-20_08,2022-01-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=610 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201200100
Cc: devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, tiwai@suse.com, robh+dt@kernel.org,
 michal.simek@xilinx.com, Robert Hancock <robert.hancock@calian.com>,
 broonie@kernel.org, maruthi.srinivas.bayyavarapu@xilinx.com
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

