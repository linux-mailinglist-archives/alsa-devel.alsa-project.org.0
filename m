Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CDB9EE08E
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2024 08:48:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 187FB33E;
	Thu, 12 Dec 2024 08:48:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA03DF806B5; Thu, 12 Dec 2024 08:46:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F088F806A6;
	Thu, 12 Dec 2024 08:46:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA813F805F9; Thu, 12 Dec 2024 08:46:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,T_SPF_PERMERROR,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2613::613])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8F32F805FB
	for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2024 08:46:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8F32F805FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector1 header.b=hXiWnpNi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VlNbsK2GJUWvfYtpMgontUI103TDAm+XJE7HGY7M++PHJChl4yKFLpeQMRwVXMRw/T+pemo6HbnGEKP6bxOyGq7SZOwn9w1OYQcK4Tq2rqyrXjozrobvDlqVB4WkuE28+jL/AECq8P6w4bfupx+8MZ8ytxDofgoOPpA60wbFQyEJmvFhOG7b/yh3geFbruQMhY28YoTIZHs1y0LKRW7cT30CAQNmLNOdp15GYLJHtcTt/ZcnxuWtO3yXTiguF8uNMrahiEaU4humtk3R0wqiR5mESl2IDHkPwB5VOViLIKx+2zoYe0qtu9l+tPm0LyNgKUjnh/92ehfAEHGnmSuZcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJK8WWOvDdKnJn03HGc+yupP/YXIOxc9ngBNgUkeoqw=;
 b=tltCqmZoAjxAV892bmTIIFP7uaS082DGid7dGHpj+q/dqaewqZBZP1RfmhHttIcDQ7S04mjx9dcuRR4OBH9cdz+M2QW8G+XzQSi8RJzNp8W00J8NMlfiS/ntv8lU/FSs2fkBkzE8NgEtJenv/VQoY9Pv55ULzc9SvQj/iqWczR8bWJQucPr6iQwCyz/SIaxTYRvj2SinWhcRpnRETDUZyehAwVpfGFsSSnXwFqUAuCBKhx6H1nFFQVR/UlhfJiTR5gE/vqr6NaIDNPFrU2fQFPTcULB869/qo7m5IUd9kIxkngqtMjoYA07OKB5ASFDLj2nDoujb89iq8DdcgznNeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJK8WWOvDdKnJn03HGc+yupP/YXIOxc9ngBNgUkeoqw=;
 b=hXiWnpNiLup4+jQgeQFrRTgtFFMWTIhDX3tGYC+xT6E4Tz2pZxFYl7byvyOc9mWUJnHvbCprpVOrHnpKOZWUM1SqfA40NBf7WmtV+XrjXs/fCBugyoVkeSYb4vmEPf4c14Z1E2UduINHoxx3WwsWKKursKho2PRnfJYRXOO/4xCNUvJJljvHrcXdGRC37WB3ezHZCg3X1LPokzTyQkfZrAlhc1y2zN7yMU2HppriEGMSm+y0IsX+NtSVyB/9xUNlJcV0lK58vx4duX/Th8k754GZ3eb2OB+J95bqBGf2gHB2wvxxvXerToySUlfWMg6K1inpn4srqvtzuZaSM+blvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by DBAPR04MB7256.eurprd04.prod.outlook.com (2603:10a6:10:1a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 07:46:15 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 07:46:15 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 6/6] ASoC: fsl_easrc: register m2m platform device
Date: Thu, 12 Dec 2024 15:45:09 +0800
Message-Id: <20241212074509.3445859-7-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241212074509.3445859-1-shengjiu.wang@nxp.com>
References: <20241212074509.3445859-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:196::16) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|DBAPR04MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aa0d1d5-6436-4ed9-c3c8-08dd1a810e44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?67xsIYLlIuIilz7ORnMx1vOQ+MikMev0mI4YqboAqNbuYsxof+iSr+PV6aVH?=
 =?us-ascii?Q?Uc3Q7LWbpuZ13l8EofQ8LIH2iXsRC3l3lWdIyGgJZbjyWYdcV5qLlminDaFl?=
 =?us-ascii?Q?pd1UXc8nUwyK4KLWY0k497hgblzcSd+PFz4FbkfX2W/oTx63Kx1zGLH/siq4?=
 =?us-ascii?Q?kdOpELbL2TdpsnfWTIcjbDnil+eEjJmj7YJAFt4yBEg3ADLoktOAxirjVspf?=
 =?us-ascii?Q?uf9ErPcC8gfP4zRDEVXQ1IkSXeyJb+RomN9Ugeji2X40tDSzN4DiAqEIY2FD?=
 =?us-ascii?Q?/eiNoa2iRIFhjF3Xo/+YjXjmIdHdi8LxWEu2jrVX+Vtg7faLDI8to8UMq73p?=
 =?us-ascii?Q?srGNC5+2CtJS6rMw/amQQBM4I52E1MQF2bUO3krSGuj5cxjOCwqK33pmr0A2?=
 =?us-ascii?Q?oL6wzJvR2DQO0MwpXmQ5hm92PS1C4se41LEdiLiGY9O7ov4Mz31oHd+jAt8b?=
 =?us-ascii?Q?kpnwbzxiBTeIFMU9hOncAg4GJ2GP2Id9aCrHlnHgUq9+83CiPEHgKUKUOey1?=
 =?us-ascii?Q?X7gEYFsBdhHK7vsFITwC/wFwVOAFPEL2pVX0LlVN+slAnlskcrq+mCSL55XF?=
 =?us-ascii?Q?j+VOES3marIRVC7h2CyZwrZ3fUQY3gciFj3SA3G3Tegz1gq3aAoL49v7OPd/?=
 =?us-ascii?Q?fAK3ZNsEqHefx6FczTss06Z/zMqHnLKJkXRjLwcIepkm2mwE3oV13CnM+30J?=
 =?us-ascii?Q?2EXp3vuL7POjCBemuyoo4qxgu9UMK5lRsdRHYiVqzmlLmeBs8o3wBVJlCg/z?=
 =?us-ascii?Q?GgYDJA6v1l0vAorqMgyUzvDOVwdHgvl7uwDh2iAReGZ+h/Lf0xnUd5YZobpL?=
 =?us-ascii?Q?qzWPnYDOFvA6N6i2Bw9B1qWVjgDByzNHacPQdeqJTrz2YWSimpJQQo2n+FoI?=
 =?us-ascii?Q?ypH+laStqf+R5QWQmBAzxvWm2JZHJQg98jUAtPqqWltVb8dqhrnPCA1Z4Hqd?=
 =?us-ascii?Q?QrZPXuDhkp9nN/6epd2mN957/rmDyLhAWV6s9lNJbp1V1m9l8w+QysQdXkug?=
 =?us-ascii?Q?N3TTFQodg8oljPSNT/VDNQpY4bOAuMvhsqt12dNC4potj2u4tJmT1WLWju9C?=
 =?us-ascii?Q?0qKyUbrfoH92x5qnV5s1FktBRCc9WP0Bxgj2fBx4+1HSeB95VLBjjF1TD6b9?=
 =?us-ascii?Q?GHoPVg7gD7W4EsZidDr88NqTj9jW4XVoKKYCwp2tqp65KCh5wNt8HTd155MN?=
 =?us-ascii?Q?n/e3w38Br5B4+wZ0HHqSlhpOe59U4Ob56jJkxyeCi0SDLzeucTnpCIKSxeGN?=
 =?us-ascii?Q?pYzFofak8xDnPuLA3/Q9d/qvg6KVaDIA6sr/bt1G3IbI5ROPtFdu72UphZL6?=
 =?us-ascii?Q?vFfxVP532HypXj7vcFXi0GchK0u6PEhAz3gKKPuWJodsTYeAKBY/pbsuT3e1?=
 =?us-ascii?Q?H3IwayPkHeNvy9ZUw9Bf8uAvsW5z098PJyOk3BnLww8aH6wQDJvH3MJvRvzm?=
 =?us-ascii?Q?V+J3tkji+NE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3CnwpfzAp5ryjzm6IViyKTmvAvRv3aqmOD4l4C2dVK//rR8AtJqpUHmm4KQr?=
 =?us-ascii?Q?YU/OGhiaC4M01XP5hKa7fj9pd4hAwDcvSFpLr1Dcz4ywWdJcmK6DAYviqXZ0?=
 =?us-ascii?Q?bx9k06X74MiqBS9GD4RX/c0rGwx6hiKuVmCXBcORBce9cAa0wD0zrdUly9QU?=
 =?us-ascii?Q?DacOeyvx+2GiWX/STXq8wwNQTLCHpAOUIMH7LX1Xq60iyRCk/JW6SqUfY4n7?=
 =?us-ascii?Q?wgXkAFen7xDLaCCrEEGQfgzo3nx+BsCv8sAlhox+aPyaYKWXAL3Rt1D6O+oq?=
 =?us-ascii?Q?cLXgfyPAJQ58B7WPvfP55G4SUlEeGkTq8nhMyWzYRK2A1+V7QTDeODW02V4V?=
 =?us-ascii?Q?bxnUSzsi3fFuuqwv7VgN3L2csFF0FvReyKUNIQl2jttpU63RHDg2/jCiG3Zi?=
 =?us-ascii?Q?bI5L/i0nfT7TQfSlbpbQQJ4Jgy+qrxCxZWpizhlGnEtxkRQUucN27M4VAJ8j?=
 =?us-ascii?Q?kMrehTnmceOTZa42LjlEKKT2YnwQAuv9lFhewzBSMYrfo4dNvpZLraqygR67?=
 =?us-ascii?Q?EW1yaeGftNwkpRgHrVwTNpOceD2SkLndLfsxnJpfh+GZ4cC7jMKI0LeJ3bZs?=
 =?us-ascii?Q?/BqUy92oDCBiRseY7U0Hd69+J4S/GMsdJ09gD+hW2F7RvmWPtc3PV05wU86x?=
 =?us-ascii?Q?3/KdEGbs5LErUfk6F42xlmudQl8PPT74E2BWTvjY5rORzxYjGYBUmu6tyB8R?=
 =?us-ascii?Q?6G4TCSjuS9b7AGuzz4pVqX03TflRpBWbg4Xfqh51xwXJohBXFzUT6RMefnGF?=
 =?us-ascii?Q?Opct/BdFDuRhDmJ6b+ILrEed2Bm6lrQDgFhXwQAlUfU0EBTS8jwa1GErlM2u?=
 =?us-ascii?Q?NduwjEKINqb9To2czgmmTccZLhMFHBCPt/E+bAWhPRS5c9wYBnc3Bybt0L6L?=
 =?us-ascii?Q?rubkxznAh/sRmVdPINlaMaK8tOKFhJuBHci2y2oFsURZggSJQiYdxcuwwun3?=
 =?us-ascii?Q?KrV1b/ThQ1NCcGvgqE+AWm7jnSVktFIfvoDxS5/vwPARw40mudjb4ERPKHFE?=
 =?us-ascii?Q?+p5DLeWUfeR8RMuagBoICFNEBrtxR47XdGJ1ytFyWfxWU+jOJpBUHW+8W6vF?=
 =?us-ascii?Q?MyzArV0WgJpEiw/Sz9s+H4UqnxzRGdGxIoV3wVxA6z3QXUtlx92ctKSwcf7g?=
 =?us-ascii?Q?lYR9EbnnD5szDNFmFN1oUeShuQu/EObNeq279NxQwHvIB2u9vMVk2bzSMQJ9?=
 =?us-ascii?Q?0OK243aupJwghqW+83k13tf+ahQWnMt1h5RXMSWDjgt4xsCBKLS7l9EfWQcF?=
 =?us-ascii?Q?kA0+xqQY1nUjswMXQFde1uN0Ma3orKhLS7OqPY90lglIhc1wXM4REZW9GkTS?=
 =?us-ascii?Q?NbkLjPeLu0XQzRbFlo9fqh+yMUIf+Hy6ZwvvUTeprBrKw+MY2LivSW/wj2dM?=
 =?us-ascii?Q?CDsjoC38c3axhPNXomSdirBjkC/+am0UWHpmCCTTsVkg5oZP3YICJdBx92ko?=
 =?us-ascii?Q?VzJNsc84EbEXpyKq8n7KC2vUrUypRoAl7BtBO7aiWYw52AQdpUGw7i6e5qoL?=
 =?us-ascii?Q?TO9XOuoihXUQtSkehtOiqSRXBWlTmy890Ex6CEZQu9nwgrEGC3kK/1dLBZA1?=
 =?us-ascii?Q?NiD2GK5lvF47LArOHsJPSfvEP7UfXjdJEVzBGueZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0aa0d1d5-6436-4ed9-c3c8-08dd1a810e44
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 07:46:15.1684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TYshT6p8AoOdI4r57GCtsa0a1G0TZmDcYyn7fMowR2uE020Eh6c4dK9xoQV4OFCqhZujB+nqtPpwnNuc+YruPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7256
Message-ID-Hash: EST7TWFRKSHBFKMPDAMM43CPEVDNKIIE
X-Message-ID-Hash: EST7TWFRKSHBFKMPDAMM43CPEVDNKIIE
X-MailFrom: shengjiu.wang@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EST7TWFRKSHBFKMPDAMM43CPEVDNKIIE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Register m2m platform device,that user can
use M2M feature.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/soc/fsl/fsl_easrc.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index f17a185a1910..f404a39009e1 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -2204,6 +2204,12 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 		goto err_pm_disable;
 	}
 
+	ret = fsl_asrc_m2m_init(easrc);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to init m2m device %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 
 err_pm_disable:
@@ -2213,6 +2219,10 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 
 static void fsl_easrc_remove(struct platform_device *pdev)
 {
+	struct fsl_asrc *easrc = dev_get_drvdata(&pdev->dev);
+
+	fsl_asrc_m2m_exit(easrc);
+
 	pm_runtime_disable(&pdev->dev);
 }
 
@@ -2313,10 +2323,29 @@ static int fsl_easrc_runtime_resume(struct device *dev)
 	return ret;
 }
 
+static int fsl_easrc_suspend(struct device *dev)
+{
+	struct fsl_asrc *easrc = dev_get_drvdata(dev);
+	int ret;
+
+	fsl_asrc_m2m_suspend(easrc);
+	ret = pm_runtime_force_suspend(dev);
+	return ret;
+}
+
+static int fsl_easrc_resume(struct device *dev)
+{
+	struct fsl_asrc *easrc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	fsl_asrc_m2m_resume(easrc);
+	return ret;
+}
+
 static const struct dev_pm_ops fsl_easrc_pm_ops = {
 	RUNTIME_PM_OPS(fsl_easrc_runtime_suspend, fsl_easrc_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	SYSTEM_SLEEP_PM_OPS(fsl_easrc_suspend, fsl_easrc_resume)
 };
 
 static struct platform_driver fsl_easrc_driver = {
-- 
2.34.1

