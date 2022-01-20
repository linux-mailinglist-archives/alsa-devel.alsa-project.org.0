Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D6B49552E
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 21:02:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45BBD2A10;
	Thu, 20 Jan 2022 21:01:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45BBD2A10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642708925;
	bh=UjzxF8lSvgMEC3w/bLrGLKeKGPwhFNJ/I7LIFV3Qaqg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mn+wEmYEtbgTBAYvucmvS0sfEXCiCZb505fcGs4j3u0fza6u13lMZ/o3s/Lr2VHLT
	 7xDj/SmogYmzhQp+CoZZlx8Gpwe4BNhwK76mJmsKFhrdSEwPlj9PjiYLWa+D23mIQX
	 +ZvQpHFRCxYHBSRVPhGLq2J+BziITF+em1bh5OcY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFB1DF80248;
	Thu, 20 Jan 2022 20:59:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AF08F80534; Thu, 20 Jan 2022 20:59:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0d-0054df01.pphosted.com (mx0d-0054df01.pphosted.com
 [67.231.150.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E9A3F80248
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 20:59:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E9A3F80248
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="Pm95KuRb"
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20KBU4fp019111;
 Thu, 20 Jan 2022 14:59:03 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com
 (mail-to1can01lp2054.outbound.protection.outlook.com [104.47.61.54])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dpmt68sbj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jan 2022 14:59:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJedHcep6vc2WjPEq0AUP+GIRflWYp8vgYsgqfTjtPNdaN6r9DcEFdAmMSjqFP2O/K56eRArHUv+eHATRC2K/IfFZG4QPqMpMiIQ7sb3sQqRyNsqJf4Ax8qpJyCUhkekP8zUQS07/eWpXzC/+ZrKvNvj5H8RhIc3Zw0/cgpMQh+u653TY2xaq36ObXUDLY35fE+JGr+GSB0ieWQplwnK+XfDhSu9HejM2zR5ZaoaSjw51xxpj1QS6AQ4x/ohJEyVzZYkElhz+ReO4e+C6NiIahLw6f/5RMF1k6bCPrW3yJZ01saVqWUx7RJIwn7JspvU01uG67SqtBlZsEAjpcH9Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMgsfwpumy/jE8Gq3Tpjiu55FEOAd72bTZuTjwVjA24=;
 b=mXGoeslt9k6gvIQ0hggy35pPwsy/Ky2cjSfr0E62RqnsopRbMF80Q9OMmcCVMz+7tk4JhUqpMPQSMkcIEeTqr/ZXUfdOwOaSZ9Lsl+JoBeuFNQTXdFlvGpqegIvN/5pawEeXDFZ2hLhkL/+d1hyG3DbcShFoCqrWWhcIEGnplPRSPLmbBtzYOg6dJBPBbp5W5XHuwP8BxxARc7Bw8uJjDEENJr/Kr1apRUG15PiGFDRh/iH28tB9dGKJ/w/r2z/rCRe4ZQEV8PtPQev6QCwuQr0CP5i72ZVy0YMgGXlsLpTQMkgc8BeoejBqg0X9hQ5BrnNlHDlDh5cIn8jjG5NyYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMgsfwpumy/jE8Gq3Tpjiu55FEOAd72bTZuTjwVjA24=;
 b=Pm95KuRbHls4ftSs7NxGnPpd4GUn+4JNHJP9wkpzG8WTIPllpnkVSmZuvQIXrZupHtwgTL+r9csHy8cU2JvXbAeG4jW7/plhTS99I7QbawcE788uOIi3YqH8gyTUSUZ5tEd90RZegt5o7Rago/a96KA+sWdtZfIoRMLi6Ti80Jk=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YQXPR01MB2710.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:48::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Thu, 20 Jan
 2022 19:59:00 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.014; Thu, 20 Jan 2022
 19:59:00 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 6/6] ASoC: simple-card-utils: Add new system-clock-fixed
 flag
Date: Thu, 20 Jan 2022 13:58:32 -0600
Message-Id: <20220120195832.1742271-7-robert.hancock@calian.com>
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
X-MS-Office365-Filtering-Correlation-Id: 667fbdcb-4a50-44b7-a185-08d9dc4f4d20
X-MS-TrafficTypeDiagnostic: YQXPR01MB2710:EE_
X-Microsoft-Antispam-PRVS: <YQXPR01MB27100B906EA86594D7C4C3A0EC5A9@YQXPR01MB2710.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5fdxjapaczwiEDcb4blO3fBjZxOrBJB2pNPA6Xm6yp0W4OXbSM90PmS5CkfcTAvTKBDTORComXEpyeM7DjM0Yf7f4n6nAu92HjdbywX9eQvhyhaXGjqpVy7533R6P+ksLwl6qDuvG58joRQvbh+UL8HdZWr83YPhVJw/L3IW606iJFSBIg5+R8+5ntTanSmDEYivsUDNhDDpFD+vdlZjPBo2X9xEMC6hr8vsbjq7tTD8YPMLi2DCDb31WV084scLGS6V9Lq0YNDr6weryNs+XYxz4dsl4UzHQ8slsMB8t3lLkiFgkUEpYdeGYySXb+/p80RjmaA9UvRVQL6Nkl0hg9BmFVf+B+0PsoVx8CfwLQBmlI/MAVbmfUmKkwNphdze/Z0k2VYLcum6cXSfC/rrdM+VsKNjJC/mVimJxH7n9vHWSLYx0EpBan6BPRfpaJh4sBktHVKj74Bc8MzTfTfiMGJoxeWoBBUQ7I/0wn+/YamtBBgmTR3/p+p8ebxCATLLAKpPZzSI4FkpFYZRjGAftzV7FElRtIDUgf+ySsLNn+IblIXWN3IT1EBKzGetwwFGzn2aEjKKesKVdPMTp7P5zvKfKvk7cQgM/2qvCv9YMOT4ZDse5LcYIcb8uSba3aHXXQw0r11ByEnMF3ZT6Gex1KJlsJxLhsgzJZc+HmIxx+SWfDXTuszWVu2LZgsRWnJZnV5BOvVy4Czh8GMAi9TlwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6916009)(36756003)(6666004)(26005)(2616005)(6512007)(66946007)(38100700002)(38350700002)(508600001)(8676002)(5660300002)(186003)(1076003)(7416002)(2906002)(6486002)(4326008)(107886003)(83380400001)(52116002)(86362001)(66476007)(66556008)(316002)(6506007)(8936002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SnLm3EIExwGONin1DZ0kP+jwXEJ5TfE5iFFVmtygdtxjhphc0K0GxurTGax4?=
 =?us-ascii?Q?KbiqTyfeYZsEOxCSExR/eo66H58QtxUzQkCvTqZMJaO/kAmgVJxeapTfVcly?=
 =?us-ascii?Q?vbBBs5xGXEPLL+Z2wQBQ1mxfKnHcCsfPK6jit/HN/2gSc+bVa8TmSQq1U0pq?=
 =?us-ascii?Q?+CySHhrYgqBJrDHnPXwFV4SRlWSPMseXploCRE5FtsPbfimBi33Q6uFxBZ7u?=
 =?us-ascii?Q?3URpCqjEVwSldNk41pE0WQIvTrEE/5BPf2cCyixTSu9ikaFXHelL4zIl2BMZ?=
 =?us-ascii?Q?jn21ht7mUpRzxNlCOdJ7Ic+z359Fcmo0Lb4FPQxmmNoEYCyn65zX1sg1Eu93?=
 =?us-ascii?Q?dU2ssR9FYXkFYU3H5cHdLJiK/jPMEUiJCr/ZaRZL1U+XnF0/fg1DyYvlAYoX?=
 =?us-ascii?Q?Liu25vW0huNDJ0Ho96DkcVMG06AGHgGN4pwVWWdftIYunL31JckrUyL+YPph?=
 =?us-ascii?Q?J3aEKny5/IA+vILpfXY/E0Dv1UkV5KNMMa+wRBuoCUfZY9/WfBJWJIcryPtp?=
 =?us-ascii?Q?shEhnDQShe61uYqQkj+YfA35lsIlEN2NHLZGEC3ObSdWqHzfK5Lfg9juM6lg?=
 =?us-ascii?Q?suf4UYw2y+KcV5hr6JX3f0tAmwd6KPKEGcGyfZarx1F4vUbrk5Ap0VmJLIsx?=
 =?us-ascii?Q?hX3pP9rZR3srxBhSwC+7wrhLEySP5KA2umc3GjDrPSu4mNfugI5LqF/xoEWJ?=
 =?us-ascii?Q?L9rJ0Ey/EEqKzwIabGbgxBGkeycgJg+o5E4vJXOMjSPfYso18J+KY6NZKLhA?=
 =?us-ascii?Q?pFtQ1SpcaLgZLJdHX7NQqKcdCZ5BA7i1CFu4y74+Q/GTy6V5m7A/mY92F+Wy?=
 =?us-ascii?Q?GinDnBHCtZfG3UYQVCs88QxCQ6aWRuh54Fh1BiO7jcaP0SBR0/SbuioHZNEh?=
 =?us-ascii?Q?msF0Cwj811rzJHgdsfTAS2h9mtIKAe2/VbTSardI2H+APH/8YUSvBDSKaesP?=
 =?us-ascii?Q?LFL5eW4zcZsWEpSksUlKvsjt7p2vpNqg87O6Z/xmHQd+94macnmVBlyaEJMC?=
 =?us-ascii?Q?sdmbkq6IEJ/7gMLByBwByaOaeOEXyLKEKTOrKHhs3EBgzLhVLQthpvLV2vFK?=
 =?us-ascii?Q?MJIMDd565KCC8pR6kHauI+2dN1RzJI0ljr7ZHqfE07rQ0HiyrT+faeZoODir?=
 =?us-ascii?Q?LXPJzDkvKIE6ZiXv6QCaT6G5dzkMHP9/0ktgnGEq4ud3rxWfLLvTg1MZbJ/8?=
 =?us-ascii?Q?h0iD8LCtywTeMXFvedxMge+HYo3Hn5rOfWvAJ8FFNtbFvD4MuhZZxDAwq3Ou?=
 =?us-ascii?Q?ghT2nnOaQTqeNWWLzq9bO/m2uLFrEicHcZY3RATH8G7gwx8VGOZ1W/mbn4+K?=
 =?us-ascii?Q?gW/GbFBv+KcqDHjoVMYh22zpjs2vOTryb6AmrtHNBw92chz6WNUUcnYIjGAU?=
 =?us-ascii?Q?SWMvvKpQzPg4Y6QUiDf/grkRGX9k1+JtqYd+kQlHZ5O9OzwU7V6waRDungiN?=
 =?us-ascii?Q?ymc/WvTwAVAQxV98Xp3QrQ4NnkokSwSROqwsh/ESBo6Fd3uM6R4Oj6Dta108?=
 =?us-ascii?Q?8bok9D8ZJA8Lgov0QqsCm3RTf3LBDxQtARFdoyAnskRf+U2Ewlao6FwdyLq2?=
 =?us-ascii?Q?eFQu8E5dVgJ6R4jRny1D6j82Ul5d90zwvMSq2lGsmv/v6trvioU/f9ce2VJV?=
 =?us-ascii?Q?5+LK7rA2rYA0dgVQqVtnSojz0pF0KOfBdzSjAFY1gLZ4j+JSgsOfmt53dTNa?=
 =?us-ascii?Q?Ep19GrOgUFCRuxbFo1oyHodfkiY=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 667fbdcb-4a50-44b7-a185-08d9dc4f4d20
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 19:59:00.5553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iem8qUkhS3umLSx61Tan5OCcZhiGd8n/QVgJwUi+9E1tfnlyB5vZrjtv81HRKeQjOlVtg22GlzQvhbd0ConddIccunJA0beiY2ZGG5deXOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQXPR01MB2710
X-Proofpoint-GUID: BXCxIuEB3ECbKYhvCn9VJ8tRNdm0jZYr
X-Proofpoint-ORIG-GUID: BXCxIuEB3ECbKYhvCn9VJ8tRNdm0jZYr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-20_08,2022-01-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=970 suspectscore=0
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

Add a new system-clock-fixed flag, which can be used to specify that the
driver cannot or should not allow the clock frequency of the mapped clock
to be modified. This behavior is also implied if the system-clock-frequency
parameter is set explicitly - the flag is meant for cases where a clock is
mapped to the DAI but which is, or should be treated as, fixed.

When mclk-fs is also specified, this causes a PCM constraint to be added
which enforces that only the corresponding valid sample rate can be used.

Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 include/sound/simple_card_utils.h     |  1 +
 sound/soc/generic/simple-card-utils.c | 71 ++++++++++++++++++++++-----
 2 files changed, 61 insertions(+), 11 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index df430f1c2a10..5ee269c59aac 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -25,6 +25,7 @@ struct asoc_simple_dai {
 	unsigned int tx_slot_mask;
 	unsigned int rx_slot_mask;
 	struct clk *clk;
+	bool clk_fixed;
 };
 
 struct asoc_simple_data {
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 9736102e6808..a4babfb63175 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -165,12 +165,15 @@ int asoc_simple_parse_clk(struct device *dev,
 	 *  or device's module clock.
 	 */
 	clk = devm_get_clk_from_child(dev, node, NULL);
+	simple_dai->clk_fixed = of_property_read_bool(
+		node, "system-clock-fixed");
 	if (!IS_ERR(clk)) {
 		simple_dai->sysclk = clk_get_rate(clk);
 
 		simple_dai->clk = clk;
 	} else if (!of_property_read_u32(node, "system-clock-frequency", &val)) {
 		simple_dai->sysclk = val;
+		simple_dai->clk_fixed = true;
 	} else {
 		clk = devm_get_clk_from_child(dev, dlc->of_node, NULL);
 		if (!IS_ERR(clk))
@@ -184,12 +187,29 @@ int asoc_simple_parse_clk(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(asoc_simple_parse_clk);
 
+static int asoc_simple_check_fixed_sysclk(struct device *dev,
+					  struct asoc_simple_dai *dai,
+					  unsigned int *fixed_sysclk)
+{
+	if (dai->clk_fixed) {
+		if (*fixed_sysclk && *fixed_sysclk != dai->sysclk) {
+			dev_err(dev, "inconsistent fixed sysclk rates (%u vs %u)\n",
+				*fixed_sysclk, dai->sysclk);
+			return -EINVAL;
+		}
+		*fixed_sysclk = dai->sysclk;
+	}
+
+	return 0;
+}
+
 int asoc_simple_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->num);
 	struct asoc_simple_dai *dai;
+	unsigned int fixed_sysclk = 0;
 	int i1, i2, i;
 	int ret;
 
@@ -197,12 +217,32 @@ int asoc_simple_startup(struct snd_pcm_substream *substream)
 		ret = asoc_simple_clk_enable(dai);
 		if (ret)
 			goto cpu_err;
+		ret = asoc_simple_check_fixed_sysclk(rtd->dev, dai, &fixed_sysclk);
+		if (ret)
+			goto cpu_err;
 	}
 
 	for_each_prop_dai_codec(props, i2, dai) {
 		ret = asoc_simple_clk_enable(dai);
 		if (ret)
 			goto codec_err;
+		ret = asoc_simple_check_fixed_sysclk(rtd->dev, dai, &fixed_sysclk);
+		if (ret)
+			goto codec_err;
+	}
+
+	if (fixed_sysclk && props->mclk_fs) {
+		unsigned int fixed_rate = fixed_sysclk / props->mclk_fs;
+
+		if (fixed_sysclk % props->mclk_fs) {
+			dev_err(rtd->dev, "fixed sysclk %u not divisible by mclk_fs %u\n",
+				fixed_sysclk, props->mclk_fs);
+			return -EINVAL;
+		}
+		ret = snd_pcm_hw_constraint_minmax(substream->runtime, SNDRV_PCM_HW_PARAM_RATE,
+			fixed_rate, fixed_rate);
+		if (ret)
+			goto codec_err;
 	}
 
 	return 0;
@@ -226,31 +266,40 @@ EXPORT_SYMBOL_GPL(asoc_simple_startup);
 void asoc_simple_shutdown(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->num);
 	struct asoc_simple_dai *dai;
 	int i;
 
-	if (props->mclk_fs) {
-		snd_soc_dai_set_sysclk(codec_dai, 0, 0, SND_SOC_CLOCK_IN);
-		snd_soc_dai_set_sysclk(cpu_dai, 0, 0, SND_SOC_CLOCK_OUT);
-	}
+	for_each_prop_dai_cpu(props, i, dai) {
+		if (props->mclk_fs && !dai->clk_fixed)
+			snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, i),
+					       0, 0, SND_SOC_CLOCK_IN);
 
-	for_each_prop_dai_cpu(props, i, dai)
 		asoc_simple_clk_disable(dai);
-	for_each_prop_dai_codec(props, i, dai)
+	}
+	for_each_prop_dai_codec(props, i, dai) {
+		if (props->mclk_fs && !dai->clk_fixed)
+			snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, i),
+					       0, 0, SND_SOC_CLOCK_IN);
+
 		asoc_simple_clk_disable(dai);
+	}
 }
 EXPORT_SYMBOL_GPL(asoc_simple_shutdown);
 
-static int asoc_simple_set_clk_rate(struct asoc_simple_dai *simple_dai,
+static int asoc_simple_set_clk_rate(struct device *dev,
+				    struct asoc_simple_dai *simple_dai,
 				    unsigned long rate)
 {
 	if (!simple_dai)
 		return 0;
 
+	if (simple_dai->clk_fixed && rate != simple_dai->sysclk) {
+		dev_err(dev, "dai %s invalid clock rate %lu\n", simple_dai->name, rate);
+		return -EINVAL;
+	}
+
 	if (!simple_dai->clk)
 		return 0;
 
@@ -279,13 +328,13 @@ int asoc_simple_hw_params(struct snd_pcm_substream *substream,
 		mclk = params_rate(params) * mclk_fs;
 
 		for_each_prop_dai_codec(props, i, pdai) {
-			ret = asoc_simple_set_clk_rate(pdai, mclk);
+			ret = asoc_simple_set_clk_rate(rtd->dev, pdai, mclk);
 			if (ret < 0)
 				return ret;
 		}
 
 		for_each_prop_dai_cpu(props, i, pdai) {
-			ret = asoc_simple_set_clk_rate(pdai, mclk);
+			ret = asoc_simple_set_clk_rate(rtd->dev, pdai, mclk);
 			if (ret < 0)
 				return ret;
 		}
-- 
2.31.1

