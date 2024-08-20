Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A93AC958956
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 16:31:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7886828;
	Tue, 20 Aug 2024 16:31:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7886828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724164279;
	bh=+LigA+kHGSOA6AomnYIpDvE9P03BnWt59TTUoVPEG/Q=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SgWdjyE2U99SMBnkX1n76tvPSKH0YDATr8U367RahAiDLIZmAzT1djJ3jEXsifLq6
	 PI6EaI6NV7MBA1HQFrVx+yC4I0es6XwCVPCOBCTWr+MH/hM+gqXkrCvAHTeJDHN6aL
	 QrmIkahmYNRFafbPv6Z9SxbM56dxZ0qWGDquKIHM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35733F80640; Tue, 20 Aug 2024 16:29:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C608FF80649;
	Tue, 20 Aug 2024 16:29:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 110FEF80494; Tue, 20 Aug 2024 12:22:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2011::608])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ECE39F80107
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 12:22:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECE39F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256
 header.s=selector2 header.b=btIQLVN0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IpwLgatJI9kwbYe9rMzN7C+HKMcSqwSVd7zWO0c5WTa0a7y+TAKbh212uSOiKTzlz5Uyh4WFOwPVl10jKQ70547YAKC3Bpy7oNUbXRq2/lPb+M3e3TaXbO+TgNTkaRpOoD1r+eMbMpIE/2H/0M+5miXJi/IZHbF0lt+73f15YiLLXAGpej3eN4rKsngVlQjiby8PwcayFo+7YETvuYWuptG6K9SMTrYk+vLy+XmAVlLfveRTqco7wsztF6vepEYL1V9hNASpQ+FVNGWIE64yHeS1PmSFR39KAbRkqL47B8JxIQEc0rEnEGbEJaZMWXKxhgTCUzmVGh8LC62HumN/HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sj3YHZ2HuFxMk0d+PQ52HeNC+n7cX6y0k5xtuMV/2Y4=;
 b=OvqgOAkSYZBpnqMzPbFHo2iL1WVwBvIV+8ZQWOaH9/7FWFwQPUZpEh+qGc33cTzS0AIvB6dv5NPhyVpxCJHrsmDX7kGg9Kl54yp3jzz8YO08u+z4hBO2m9hHt8nFtul7t+V1Xwc8CnovTprFvy7PXXRdFkEPmvlg+IloFxTd3As8RmF0K9uDRoVYr5lh7CIJD5tjACLC56c5UBfmHnBGThj7OaPuHxoAuh49I6FDm2wufxn+U7RW1KXiknHe7fcVng6b8MHHj3Qd2HOpinoXLLHOcecsavXX8SzKDUBNC5azApDQ14kZ768GGaKgGNptoQ7byS3Jo4pW9Ja89JVYlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sj3YHZ2HuFxMk0d+PQ52HeNC+n7cX6y0k5xtuMV/2Y4=;
 b=btIQLVN0tYnv/TZpkz7kDEvh1+72DpR4jO0+kbY32GPOrICReXS05GHMjDSldXjJoYLMBc6ABn9SpPEXFRA38xKQWeMwcpkLc+utZP2UUapSzpynGS/WDYXC6FXflI1X/f9ealL3SISLDt0j26VBvelefRkIBaDeKQg1EmDKEoyhrF+3oeLu0Haw7prHuk1+WZ48n4XG+Fchcuv5N1L/Noc5arb/Dz+MRaAp0EX9VNCavWh4KeXGU5PxxYSRq0GvSyWm9jKaY21ten1yXwMy4hysJ+TDaNgRmeyzvU77x5WmWto0Lg+AtR/h9PDk7sgBfEgebR7lD2rSgy8XxgIR+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SEZPR06MB6486.apcprd06.prod.outlook.com (2603:1096:101:179::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 10:22:20 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 10:22:20 +0000
From: Huan Yang <link@vivo.com>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH] soundwire: qcom: Use devm_clk_get_enabled() helpers
Date: Tue, 20 Aug 2024 18:22:09 +0800
Message-ID: <20240820102209.131512-1-link@vivo.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0027.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::22) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SEZPR06MB6486:EE_
X-MS-Office365-Filtering-Correlation-Id: 075a3bdd-edec-4deb-368b-08dcc101f92b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZyMdqVU/ttXtoePfe+54TWrfB2m+fv6GbmRPN1FjD9tw2Qau64L2KYfCm7D3?=
 =?us-ascii?Q?My+4d6MKMqFSar8a4kOlkYCTDzAPEGIb+6Am8rVkap6Zk8z+Dtv1aOPvZA5f?=
 =?us-ascii?Q?ukQLGF+JqpBSQwLE8HqKjnZ82uqmJLAqi70QchPh7mjyFyqB4etbwRrOQgk5?=
 =?us-ascii?Q?O3BU8P9h4xyyrtCqvWgieIHSwa7RfKcyrcCk/SRaHOlMkeqTDwX+maJMvKdT?=
 =?us-ascii?Q?O2Gj/IO3nfpTMl5rawoFn0ng5m7TFAcn+iuSndS8Ks7QA6ORvJKiG34VpUVf?=
 =?us-ascii?Q?3pr07RIfxj6QDjpdewN9wjHQcOavbm5dpGysSN962wFPxCS77Zyt3lj6lMuP?=
 =?us-ascii?Q?vb9wXlGchkyHVGKsL2WsWV0S7qr1uY5CXA6x4u4tJb2btpJ2m8/JqgvaDkdG?=
 =?us-ascii?Q?jMLcUIGQqB3cqrVj17TZvf5DjY1bsdJkdBSgI9+jWjxkPpEPALNQVQeqPwST?=
 =?us-ascii?Q?XMIUVQmjc1LFJEbrRQpQMOLAmnYGxLwdT22J4ZLR9BpXhhr+L2zWoqSJ2xjg?=
 =?us-ascii?Q?CZMmR+bUa2mCImd0nMx+UN1bXAbUoHdBkHoij+kM8gF4ZpcfW9jbScxREQFb?=
 =?us-ascii?Q?PfaS+gFxxX0wdQQF4Kgf87UvOEVluaOPTs/I5EVtkRJkExRwzkJ93+isEy6k?=
 =?us-ascii?Q?dWVL1GpYZl+3la5PMoPJrsqyO7o9z6sZhZg1ndcrzgObVOl2PoWcRBvh1b88?=
 =?us-ascii?Q?Fuf5lYKiBo8Qnx/HFKXWgGJG5bBy7NRvcd0O1JUPMEC4GiEE5pCMf3SwiDLa?=
 =?us-ascii?Q?G19Fr+GB20Nn9zgJD5rS31wHSSgf2kVpE3TvAx3z8A2AAAWr07wITTLPvvXX?=
 =?us-ascii?Q?Eg1vsnILR34z1dBR+U3Z+xqIvNUjZdAZt29I17tCiJ2fg/6MhxXI96cMxK6o?=
 =?us-ascii?Q?YZB7Gg2cta8TNvtCoBnkhrElFPKAQX648kgmk1Zy84FAMcSMuahZd517oVgh?=
 =?us-ascii?Q?6EnePS7ShthQqXRFob901dhJar9qa/AKTjZRNhPSlTSZMS+jRoXb6VC6ubQS?=
 =?us-ascii?Q?DAiP74hRwDIFUBwrllaKC2VSdO01vIdFsqTVTSFG3Ert13kPB8SFa/HtOT9o?=
 =?us-ascii?Q?HflzKJEaRwQoopQldoH0iOKQM0Bylx5Ri2JVW/oO0C1Z1Yqw/DSOk9I/ppgU?=
 =?us-ascii?Q?ocLQ/oi1UGlvib5Btc9+zERbXJJw+SR6kR1ZHtpYkNKVkNS8o4G7ix7hWnID?=
 =?us-ascii?Q?XLgmMne5uVYE/TfkYhnWU0LL44hzs9wBRNrY0TImAF5ojEqQSNXc8xV62mJp?=
 =?us-ascii?Q?x32Sym5DbR2OJoJxpOtSsn6d6UpN3fpNAGbrSf+iDbB7ccW/cZ8/zQLNgjoT?=
 =?us-ascii?Q?YNrre7+qsoQMGrc8RPNS1DmXMz83z3nc5wUjIEnwv/4kCkQMvI7f7Cr33HqE?=
 =?us-ascii?Q?ZQ7tlffRG2L32gNPc4VRYpmKRuzSD/uNXHa2X31hkJUXbrNy7w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5676.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/hq1w1rH8Ezlu/cIpZEcRCqoRYXElGUQEC3gwh+q44/I+cLPGPgvTFI6g9cv?=
 =?us-ascii?Q?we9LKEf/R3XNz2TGwIrpbkGfrC8vcAXJHmNJRNJr4QRn07QGuM9tojl79zjN?=
 =?us-ascii?Q?rxXaWPF2p6jPaVvHNJy3Q/DcGL0lXb/diK7R2ZjVJQXuVGXYSnLV3YBVYF/s?=
 =?us-ascii?Q?d3hP4kU5piBeRE02vtRylWmUoTAQW8Qwgy6I+ltaU2UWZtjiZl2yA9IN5Tt2?=
 =?us-ascii?Q?WWRv16ueipP54KCFFqYcHi9hICMcGUPwrfi5oH60jXV7cgLiFxdNllUhrYl3?=
 =?us-ascii?Q?XQSxNI9Hdzy8d3IOk/x0Pvh3lAiqjNCtEhMC2ujekyG7xxo+2wc5skH3tUOx?=
 =?us-ascii?Q?ao8aXoNOk+aM6D1j1iWlxrVslLvDI5d8O4bVnaO3JufsAO4kxsM3l1vPGzBL?=
 =?us-ascii?Q?vJ+JPL3OYZFHfa8mQJUsWr+4b2rQa/Iz/YrFIBKygPrLJiu5D3f9iiUCWTWM?=
 =?us-ascii?Q?f1cQmqj56pAIASupZNsYEo5mUbEI7XQEeKOG9/r1y5EWQt8yYip1EsKX/uxp?=
 =?us-ascii?Q?Zk3Fz4GjRRdmV56GicPfcWz8jX7ADRsR93SUfzeiUuvqdbWzM7nwx7Kw9IkK?=
 =?us-ascii?Q?9oPfCFYQ4vXJ8rV48krqaUHCZ/Zqx5+FiRZT5l3KL04rHoG7Xubmv63vrXA7?=
 =?us-ascii?Q?vGdxH7Y04JXrIgHdCdFiTVH3c6wuOdashc6P6LWrrEt4ad1iB8y3p+h/wSUw?=
 =?us-ascii?Q?9VHRNwAxPpcdFrJJi5XRc199FVQJayiiZkpVV6anFXhrbDLQUoQZBU5EYmnd?=
 =?us-ascii?Q?bIL4G6j8DOs5zTe+ZyWugNz0kT4z9rL9Ych+70ZaTRKvnwzKWcZ2BspT9E0o?=
 =?us-ascii?Q?SI3ji73fOnXYoq139InNLilSZ7AOtVxP1EqvM4/Gys8i/MvlZt0roVWdkIZy?=
 =?us-ascii?Q?qeeMDGtk+H8nTOftbCl7hAxgXrrgOu90g+RHQil6dMvPefMyyYwVSSQ88yC+?=
 =?us-ascii?Q?JgaBjCRUjqw0BlBTdmNqsXDgdBoSJliWNX3OBL7uE2/tWk87WV91CaKLRmRe?=
 =?us-ascii?Q?cwhXvshneEm1Sy+0vLa41q+1ocqIgi26yml5xPDAX/MexjTpQj9NXSXHOmgG?=
 =?us-ascii?Q?3Hu5wQXOpEm4MUciiXQGnlJZcHC0cTvaZxjBA5hsR1oEWQvoIqR6BnAM45z6?=
 =?us-ascii?Q?Aml6njBU4uGwad9TxR10d7yhCwyYdHoUk5eLUcjN/lZvDdE3JKGv4C7vVMyO?=
 =?us-ascii?Q?dajJy7YU+p9Ma4yDi0Xjcel+5AONKOCQZdf2oGos2fHiBd4RD3lh0HbxhftG?=
 =?us-ascii?Q?CwqIhuSwndxOrZUdvbnZc20zGf67inJ6/SRXSgszK2Q8EuiCr0+HOmOsQgB/?=
 =?us-ascii?Q?p7FgzEmJDMMaF7ASv1vZOwEmOsNbZytaBdXIgrxDdO7bwNKDlyETB1+eh/dV?=
 =?us-ascii?Q?abjXWtsKUuEthVQAZkKrnBVn+wZKfMkDfAMm5HkasNovW7/pkh+t2n8vNgK9?=
 =?us-ascii?Q?3ZgAO8DAdIkAifP2vvER0HmGUtb/2QA4xqdq8tTqH7wppCE7raelrodi95fT?=
 =?us-ascii?Q?fTe7vgFDub6vvmQK3HayKrVFHMFArWUZ5F5k7QTphZWzorwIccwVwWwFWpRu?=
 =?us-ascii?Q?IXbGOV1HtUPZ9Y5Bu1wBWR8mWTcDXzltyHF+kEAm?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 075a3bdd-edec-4deb-368b-08dcc101f92b
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 10:22:20.0567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ir/+L8hDRJ9wCBph6zlk35xWgldhC/JwtaziuZZQVdds1ldYHZpNLN2Bb2JYkEUl/DeTJiupx31bAdiuMnfMQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6486
X-MailFrom: link@vivo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IQQCOBK3JPXH5EITOFJFB7AREDBRLSMX
X-Message-ID-Hash: IQQCOBK3JPXH5EITOFJFB7AREDBRLSMX
X-Mailman-Approved-At: Tue, 20 Aug 2024 14:26:51 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IQQCOBK3JPXH5EITOFJFB7AREDBRLSMX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids the calls to clk_disable_unprepare().

Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/soundwire/qcom.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index aed57002fd0e..2a57ed9464b4 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1527,24 +1527,22 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		if (IS_ERR(ctrl->audio_cgcr)) {
 			dev_err(dev, "Failed to get cgcr reset ctrl required for SW gating\n");
 			ret = PTR_ERR(ctrl->audio_cgcr);
-			goto err_init;
+			return ret;
 		}
 	}
 
 	ctrl->irq = of_irq_get(dev->of_node, 0);
 	if (ctrl->irq < 0) {
 		ret = ctrl->irq;
-		goto err_init;
+		return ret;
 	}
 
-	ctrl->hclk = devm_clk_get(dev, "iface");
+	ctrl->hclk = devm_clk_get_enabled(dev, "iface");
 	if (IS_ERR(ctrl->hclk)) {
 		ret = dev_err_probe(dev, PTR_ERR(ctrl->hclk), "unable to get iface clock\n");
-		goto err_init;
+		return ret;
 	}
 
-	clk_prepare_enable(ctrl->hclk);
-
 	ctrl->dev = dev;
 	dev_set_drvdata(&pdev->dev, ctrl);
 	mutex_init(&ctrl->port_lock);
@@ -1558,7 +1556,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 
 	ret = qcom_swrm_get_port_config(ctrl);
 	if (ret)
-		goto err_clk;
+		return ret;
 
 	params = &ctrl->bus.params;
 	params->max_dr_freq = DEFAULT_CLK_FREQ;
@@ -1586,7 +1584,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 					"soundwire", ctrl);
 	if (ret) {
 		dev_err(dev, "Failed to request soundwire irq\n");
-		goto err_clk;
+		return ret;
 	}
 
 	ctrl->wake_irq = of_irq_get(dev->of_node, 1);
@@ -1597,7 +1595,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 						"swr_wake_irq", ctrl);
 		if (ret) {
 			dev_err(dev, "Failed to request soundwire wake irq\n");
-			goto err_init;
+			return ret;
 		}
 	}
 
@@ -1612,7 +1610,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(dev, "Failed to register Soundwire controller (%d)\n",
 			ret);
-		goto err_clk;
+		return ret;
 	}
 
 	qcom_swrm_init(ctrl);
@@ -1642,9 +1640,6 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 
 err_master_add:
 	sdw_bus_master_delete(&ctrl->bus);
-err_clk:
-	clk_disable_unprepare(ctrl->hclk);
-err_init:
 	return ret;
 }
 
@@ -1653,7 +1648,6 @@ static void qcom_swrm_remove(struct platform_device *pdev)
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(&pdev->dev);
 
 	sdw_bus_master_delete(&ctrl->bus);
-	clk_disable_unprepare(ctrl->hclk);
 }
 
 static int __maybe_unused swrm_runtime_resume(struct device *dev)
-- 
2.45.2

