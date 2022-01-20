Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 752D3495529
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 21:01:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 148CF2D68;
	Thu, 20 Jan 2022 21:00:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 148CF2D68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642708892;
	bh=KjDCSVtlTNBcdEi69GwiB+0EnHgkFFjlj/KszgRw31Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kyV5LUxAQN2yLR5k6c4Qf5cakE1QyaZ0YZdYALe4OkNV1DcOdfGZv6sXz7Uk4WZ+1
	 9bkXKuAnplWD+tMC3iKcsyW+XYXSxJ0i29JyqJRMzbpPPJOPDDWlJA3MBLF7cKtywW
	 6cTwxwp2qC8pvyAeQJlXEW7jOK78Tfq1ya8Q14s8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55EDAF80520;
	Thu, 20 Jan 2022 20:59:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76FB5F80515; Thu, 20 Jan 2022 20:59:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0d-0054df01.pphosted.com (mx0d-0054df01.pphosted.com
 [67.231.150.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DFC2F80508
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 20:59:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DFC2F80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="TNkbJ1A1"
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20KBm6oV009919;
 Thu, 20 Jan 2022 14:59:03 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com
 (mail-to1can01lp2059.outbound.protection.outlook.com [104.47.61.59])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dpmt68sbg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jan 2022 14:59:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KZ1zXXCMmk049NzhSgCsdwVsEUse/l5BHHT954YCVRj3QERxyZ3xux0iVpU+0QOQz71MTudWXe2FdEGq1S1RxFNfVqWw4j//sSswRyZ41wOU4TrtosdWe3xmY/3fv+eLEmV0YKUsbvXAPuUbC4zGuySEM7JiusCQuODzLmTTkUXH2GmHVbZ3UUHOBkn+tmaasjb1X0O3eTbNeXOe8gmsopo7XBCTvs47VYkH0Yv9tC1sKkwa71gJEsGyZmnPUoDTa9SMKtF/N2XkKKJyf0xPMeJfZTvP+V0fF9qB/gxJ93Ktp51prFXPF9izPMzCem4glXqRvxnboLR2ifSFBhOEaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i97jDy7mOdm7uwmcVa3etIad5sFBYKEF8w0XoNnqOmg=;
 b=ao7w2NvJ5+rTcnNyLNbPE8EaehuhY//6+qSOzJBSt01auf+4VX9uBTsKf3647Ux/Ez6ApC+Zm4FshaUKd5Pz8/Ctb8OxI4eH0cwZovXWBueeBApWYpum1kT9AfyfULLW9iOWK4xYltIPnTLk6Iwd7I3vLU9FsqNWjgAbGW3hIUuChY9mHv1GnuHFm/NDoB6zgCQpKyEGiEJimSjh2aNUNF++dZDenPTvAQFok+UZGvoB4uyUB/I+kDq1vwvevXwSK5rbXHarC/ziWgcHPZ02w4zXdt7yQbAnHiJ7wkOTDOeN1WX5l69gBUKLHgFdl9KytktRHQExZn3efkXcM5pg2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i97jDy7mOdm7uwmcVa3etIad5sFBYKEF8w0XoNnqOmg=;
 b=TNkbJ1A1t8Xbp0YQWS5cR0gdm+9Kj8HiSupi9+tcmA/4rX10uJycAYpa/gSp4VNeEFUSM1dbZMJqQTGjp4lqsDUle215GkMLicCmNy0/+r4hQRQ1xBh8E6mS7K/4FkIqHRt8lJiWv9mWtmjdEmqDZ79nY1zwIDwuc2oZKhKtBf4=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YQXPR01MB3254.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:51::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Thu, 20 Jan
 2022 19:59:00 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.014; Thu, 20 Jan 2022
 19:58:59 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 4/6] ASoC: simple-card-utils: Set sysclk on all components
Date: Thu, 20 Jan 2022 13:58:30 -0600
Message-Id: <20220120195832.1742271-5-robert.hancock@calian.com>
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
X-MS-Office365-Filtering-Correlation-Id: 17614e12-5f18-4caa-83c3-08d9dc4f4b6e
X-MS-TrafficTypeDiagnostic: YQXPR01MB3254:EE_
X-Microsoft-Antispam-PRVS: <YQXPR01MB32544A36E11459C54201EB2AEC5A9@YQXPR01MB3254.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NeSocDf6ahQpBc4dKZfTx2A/W0ENYoEcDUYjuqvIV0uFKj7Sw+MzgDFxWISBkgI9b0WlLfsKefgLh9Cp+rVNKfdxQs0MZmfdHWHb61JaQGcH39gqc+yctOCc3EHy43R/PF5yJEYYClzg36hK3B/y046aCl4bOjZJKIOL8Yg5poa8fDlMTLzi2uU6O8xGQ98CKk5xwK0x2ea1uwa6i6mBHsL+/QUIFjSM7RUjSw7Wsg4mINWbh9I0aGQTVm+H1tEKSVxxIfb8bn1SSOBPM1E4JT/w3TLsee/3WhhwtjdOQyCKxSohEt15xkXZunGV/ewdtGSe5XvTiNQJsMe1Ov0vOtBWSb7NCJUI7b3m7FdFwItue52zftDL18S7QNz9hr1XyaGIzaWtBXrGu1q7Gmbl83y5KR7ngZb2ZCHFQs/Mp2fs0AT+4PBFTSPk+Z2qD0BJnQpSEZzl7YLrRu9bBYiEd9F8dyBj9PX9IKQLK5i6BkkjRT2Io6XVa3n23l/CA/GMspFjN3o7vvpP/DNmEIIWNqUKB3aXsXNYFqoC5I3KhoOWTVPJYJKgnQXv6cXlnlDH+wk8oFkz3kBuUWqgyhQjt7HZgUMXY+dGWk5gDM19Z3u6vmvvQyC6a4yGF6lPKFz+ouIlCr7+4S0UbuzqHUWbt3tp/OZb5+5/3slLWtsHrw4gPSpWzucSZdmwcA1PP1xScf/OJWxiwH1OWV9JhIa55w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6916009)(26005)(6486002)(2616005)(186003)(7416002)(1076003)(52116002)(107886003)(4326008)(8936002)(66476007)(2906002)(6666004)(8676002)(86362001)(83380400001)(66556008)(36756003)(38100700002)(66946007)(6512007)(316002)(38350700002)(44832011)(5660300002)(508600001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r+2OVdQ7eTMjU5rYlf3ZoPquW36qqfTMkKo+giKkGAopKFAQp80aUtfj3eHO?=
 =?us-ascii?Q?4ftEZKjvgyDWeXFPmg0bKCrPqtCxdZXxYzLruE+CXgSOWa5iJQiNLhRY9yH3?=
 =?us-ascii?Q?JlCC5TShn9Qt+wo/3whT9F4kTig9AUC7u86Fc6ZXqtf8ExzgRJC4B3AWFJGn?=
 =?us-ascii?Q?wFkIi4MCs45l8bFQy8URXsP68twVeu8nSG8afSKr5XU5AxsS6o3Nw2rrT3S8?=
 =?us-ascii?Q?t2SfDMCcPuKi/+zEfcG0O8wNv1hWoH7nVpXbr/D/Z38hz28JQkMaHkC8gnVH?=
 =?us-ascii?Q?AFhvVuTBWkcgCP3uXKHzkfb3MN0OPFF0KhQR0gQMG2Op55QdCUnrDo/z21ct?=
 =?us-ascii?Q?jIywBBOFw3T8dh410oEEaM/ahx50eV/NYdy4EFIMb+5LoTlgNPMkvio0aptF?=
 =?us-ascii?Q?tbCEtiqiltOXjkHRZYpVj+UnErYE+WTlo6WZN6XZ+01oduEioJfWcYcChYER?=
 =?us-ascii?Q?N5b1GOfOHUawCAzBFuoSY8AsYQKJeYMpCg5N/DYMRSJ/R0BJKwnAn4CQBcPC?=
 =?us-ascii?Q?LhPb9yPE5zE9A5/oVHOFrT6MIfDnnVF6Ak6Gd9es7pirDMVmnfkwrym0z4qk?=
 =?us-ascii?Q?xg1U4Y2YL8tGN+y35LnWVU37lfBtVf1SXelmsFH2pwJxMCZL414dx776MnSI?=
 =?us-ascii?Q?3Q//8Dy2S3VoaQMmNrIzQZlXqosjfkKdZtBAXVxkjBhmZcW/YBX5Iqz5pF/B?=
 =?us-ascii?Q?OJdanGbjF1GqTYcuICerHwgQKR92FysWg/jsX2HGs0kUbZbzi7CXZ3QVY5vg?=
 =?us-ascii?Q?vvh9//7etMlSDbUJR/772vBhptzVVZAJ5+invyfuLnfJX/Vwt+ylydD3xBI6?=
 =?us-ascii?Q?Wj0CMOXFjbkt72Y9gMCM6we5zBNVatNQhpuIiX87ED8IXdyWD6+Ga0UF07Gb?=
 =?us-ascii?Q?yTTlKGjgP4hKVLNVCEQnSNtDapi33n4xRCCCpxECVbeNCL8sBD2IEPD/YM5Z?=
 =?us-ascii?Q?e26vLGW5x78AOSdfCF/2Y153mqkBQeA93PfqCQKfKzcXv8nrBqiPR2FylC/w?=
 =?us-ascii?Q?mWVIzGZfOo3w0fMCT9jzeFeyplWAm5qK790nZZtnIGew8Z6naKMDPPFmqceP?=
 =?us-ascii?Q?8I3vccBN/DLViPi2HERU9USFh8l0wwyIa6/OXpq4I010fuU/q9HwVjXVUh8B?=
 =?us-ascii?Q?obBEjQqSGsJ58Y0Ocrg0r5U30q3rqtK1Pkm/CgXCY2nF7UDT4rWhy8u0KVJx?=
 =?us-ascii?Q?80esz2T8JdJVGwrE2iqtJp5FFdl1yrgC0wZxBNyyfZdDbGRpi/7PxxEVuQms?=
 =?us-ascii?Q?4BsGwLAMNltUTttO7s4v4+xldCKGaDnHU1MEUyyD9fhsfd7oGNmoPTfkvxFi?=
 =?us-ascii?Q?cnl5SsujnBTlE8C8VFmINH4DiWlEpUZZWlgVfdfqkjEj/NPSXKCzQDAk0USP?=
 =?us-ascii?Q?7Z11WChz76SS7AK/DuGdoKmBv3up3on21sbCh28pkHmhC3ZRKLRig0WuXoMy?=
 =?us-ascii?Q?kGOkNnWEsfWca9hKYs1btggLsWiGe3/4ujDcB8AftdF/afQw8Mi3b0pihQvy?=
 =?us-ascii?Q?IUXHBUtZDYvbMGSdJauQQPswOK48HoFQhnbuE95ms3UO1gcvYDbJMIAF8oKg?=
 =?us-ascii?Q?Vr7PzCpCbXdB/rJmmkLg7QPFZeYgoYrZGO9InPYk7yeuYcVrC08fbkJjrkCD?=
 =?us-ascii?Q?ZfR7lYwa0qDhvtuPMVlFvz3w57JqqSicIJN2FQFzMZb8vNgm3+ET0/WLEjmS?=
 =?us-ascii?Q?2OIciiX5FV/1md5207g9hPi+qUM=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17614e12-5f18-4caa-83c3-08d9dc4f4b6e
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 19:58:57.6946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zu/fv4q/dqd0v3RNVEw6ZU3psATJAdtH7XQsFQZqV7QWThNJOrqVK5Q+f0PAbU+onOnt7gF4oWAQS5DRIOTOr54LxMyeMIz8vrHpaz588rQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQXPR01MB3254
X-Proofpoint-GUID: 1QaGqTusFcU0oP_rhnY5Lv_knHrMnleZ
X-Proofpoint-ORIG-GUID: 1QaGqTusFcU0oP_rhnY5Lv_knHrMnleZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-20_08,2022-01-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=901 suspectscore=0
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

If an mclk-fs value was provided in the device tree configuration, the
calculated MCLK was fed into the downstream codec DAI and CPU DAI,
however set_sysclk was not being called on the platform device. Some
platform devices such as the Xilinx Audio Formatter need to know the MCLK
as well.

Call snd_soc_component_set_sysclk on each component in the stream to set
the proper sysclk value in addition to the existing call of
snd_soc_dai_set_sysclk on the codec DAI and CPU DAI. This may end up
resulting in redundant calls if one of the snd_soc_dai_set_sysclk calls
ends up calling snd_soc_component_set_sysclk itself, but that isn't
expected to cause any significant harm.

Fixes: f48dcbb6d47d ("ASoC: simple-card-utils: share asoc_simple_hw_param()")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 sound/soc/generic/simple-card-utils.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index a81323d1691d..9736102e6808 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -275,6 +275,7 @@ int asoc_simple_hw_params(struct snd_pcm_substream *substream,
 		mclk_fs = props->mclk_fs;
 
 	if (mclk_fs) {
+		struct snd_soc_component *component;
 		mclk = params_rate(params) * mclk_fs;
 
 		for_each_prop_dai_codec(props, i, pdai) {
@@ -282,16 +283,30 @@ int asoc_simple_hw_params(struct snd_pcm_substream *substream,
 			if (ret < 0)
 				return ret;
 		}
+
 		for_each_prop_dai_cpu(props, i, pdai) {
 			ret = asoc_simple_set_clk_rate(pdai, mclk);
 			if (ret < 0)
 				return ret;
 		}
+
+		/* Ensure sysclk is set on all components in case any
+		 * (such as platform components) are missed by calls to
+		 * snd_soc_dai_set_sysclk.
+		 */
+		for_each_rtd_components(rtd, i, component) {
+			ret = snd_soc_component_set_sysclk(component, 0, 0,
+							   mclk, SND_SOC_CLOCK_IN);
+			if (ret && ret != -ENOTSUPP)
+				return ret;
+		}
+
 		for_each_rtd_codec_dais(rtd, i, sdai) {
 			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, SND_SOC_CLOCK_IN);
 			if (ret && ret != -ENOTSUPP)
 				return ret;
 		}
+
 		for_each_rtd_cpu_dais(rtd, i, sdai) {
 			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, SND_SOC_CLOCK_OUT);
 			if (ret && ret != -ENOTSUPP)
-- 
2.31.1

