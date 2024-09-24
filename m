Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A56D98BC2E
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 14:36:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9834FB76;
	Tue,  1 Oct 2024 14:35:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9834FB76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727786161;
	bh=SPANKhWU8lqTYt8W/N1bKYFzZIIhFX8Guz1TUxUoWBM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RhSNZe/EbDid7rlIzHgjcuu9zqfqlaJHSrbMh6I6cVqfO5EhT9MVL7lSARxd6vNXP
	 OtF9TtSzA9e9krYpE0xx4SI4Ff5Iui2cbJbQBYsX7f5B05z1HaT64Z7h1zTeRRj6Gv
	 FEXlqgQaKumHQvCmkELf70aJ2tMOz2pe1cGFElJQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42ABEF805FA; Tue,  1 Oct 2024 14:35:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8BC9F805F6;
	Tue,  1 Oct 2024 14:35:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4FEBF802DB; Tue, 24 Sep 2024 04:42:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2011::608])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30CFAF80007
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 04:42:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30CFAF80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256
 header.s=selector2 header.b=G3XPtZ1h
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AFnEgrSokmvAM+yvZedSbsLLNhxmMGv1bNXMM64cQrbiYOFN0AXyBC0hdD76sqKepJQht+00y0KaB7eG77VEQydfCxBJwjiKoiTjzfRzyEk6IM36rshknPZ98W/zMW6gxoI68nVVxyRreNathpodryqtmdLexoYn5C5OsBfjhv46jMTfLpLZ4McF478mTfKFV5AaUsGr/H5F6iwvs1E+asM64xQSsqUXZizc5PWcq7NqgQZ7pq6FjHsxJ4xoG7cl/BuqS2Psl9U+JdMZ1RcKf3ROA60WB3Q2RGmPZUlreazJXLQ29EWvpF7YWBtSca7/T8OPEZGtm3jNdMIKNB7Cxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0bzR3n8X/8QqJRca3f+pWkgulxC61xKcDwinnePL110=;
 b=at6LylI9hMKwDQ2rY9yP7aTKeDdxhCDyBYge0z72GK82KvCfGxw3XbA+Rg/bVENHzVYmPqH+EJtbBf5ZDU2osuMqxAuls7TfRWcQh/S1bATzlgMFMw0KY5qvktIrUHsun2K4UdNm6cNnlijNSGjMTjnbDTkGxEg6rn6tYrR13A6Oe6DTSlAkX2Y3Y79lJNgvj3UvM8wXsl8542FpI10lhiWBC44jawzzHj/OYabpoPZma1L1Y9dOhYzTW/w7Zk3yuPCwH4lodjdxN4IDcsFoYdoDI8C4KkpW3nnkAu2g/xC4Alk1zTaX9UyVElh9nrLyO18sYIOUTi22mO9I+5fe8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bzR3n8X/8QqJRca3f+pWkgulxC61xKcDwinnePL110=;
 b=G3XPtZ1h0af/T2ETQfOSTDF0cpxESvVwbr7yyYp7fNf4FLZdN3REzGWZMoKK3VNeOSNrET/+LxySPuuojmp3RKcdv/ZvCKGXE2K5JOJq/7BWFqmmnGlP5RukjZYGtekoUjlBsjFSGVDZNihvnfA+k7hK337rQSUTVZLv+jCybgSrYmgh0L/vcMU+Vs+TW1LyG6FBOqTnQlUYpr5oQq1B/ufPNsxUSvdu6kFjlRlcY5CgKo7kWcH/HvRzlntaYyJ0Jo65WTLbmvPEfAkh3IDnut4EB11gmJGZIt3e6DoTGNa+YaNvMRynxzLC3GMfaQ4yEB6Wxw7uE6PLGlLVOF+64g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by SEYPR06MB6061.apcprd06.prod.outlook.com (2603:1096:101:d3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Tue, 24 Sep
 2024 02:41:49 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%5]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 02:41:49 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Vinod Koul <vkoul@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Pavel Hofman <pavel.hofman@ivitera.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1] ALSA: Fix typos in comments across various files
Date: Tue, 24 Sep 2024 10:41:26 +0800
Message-Id: <20240924024131.3121958-1-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0005.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::9) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|SEYPR06MB6061:EE_
X-MS-Office365-Filtering-Correlation-Id: e2f71901-6928-4125-1aed-08dcdc4270aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|7416014|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?n6TA/3iJP1AxZB1P0DB58QQfY+I/o8JJzG7pByODpZJvMeXdRTiAyLpIB23o?=
 =?us-ascii?Q?P82bz8eYQH+zM5i2yVQsvKorg+8kvPZ6EUggJ8s2QdHLEqgwQaz5OvrsouLZ?=
 =?us-ascii?Q?aniOOJeNTmE+WSXhIGiR1Pi6IVpyl9XZhn17eY3PS50Pzem7TLOGBlmb+M9s?=
 =?us-ascii?Q?PayQcLBf57FM/mmmsGNYZ1isCjqlc7SVg1kNnGqRMOlM5YP0NDl46vbY2KH0?=
 =?us-ascii?Q?b2efCwKnlm5t+yzdFoxt8jeWlORcYofNbKop/Tafv6UE3CMMxFwiei98kZyE?=
 =?us-ascii?Q?34DG6VAX+7LVIq9RJHXG4gdNkpbVoJwHDtxz+dxDfHFouEizznRKT7J1WbBc?=
 =?us-ascii?Q?noKhqeQWExF14ABAkTKr5l0S79Jz5yEH47TQVAXffakKvVp2fxLt0WwGuxgv?=
 =?us-ascii?Q?3cSlfI7m8pMBVixLFbHXETQ+VZ+Vpa+R7YOx9Pli3ZlF8RcCiyxDxJT6L2Py?=
 =?us-ascii?Q?K6PlOCJVHhOe44AeDI60wxVKPZKBiReH6LeqeZNF5oTTGuoIj5CPlFDhAiIy?=
 =?us-ascii?Q?CJbvUYFydnR7VnzI/hJpDmIqUtSbzsnzAYHu3Q812dANsccat3W9k5AnZlF7?=
 =?us-ascii?Q?TscbHbAQJpOoUGukh3ExI0A8RZMWRYBLejQPtX6i1+SuvyCU1OrQQrfA8Xwi?=
 =?us-ascii?Q?2Dw1qD8a1Y255xpt1m2+kVCWgE3iR+s1VlIfBvL5yYMAplVTwVwTWsJpLOBd?=
 =?us-ascii?Q?BJjb6aItgOFeaFiPfxVoCY/4WZEarcis3MbLvaMQOgA/83nB9Ts/9PugRckT?=
 =?us-ascii?Q?S1VZAtL34y+YRr9r4k7d2Pbkj4c9ljPdABo7o7xrLmj3odqMzGfLFOK2XQO7?=
 =?us-ascii?Q?GLKCbb5NBDoISYB0fFGgJkh/mCjJEyLtGz3KjpMRhOTSMI6Ponr0nBO5G5zR?=
 =?us-ascii?Q?hQKA+CPg3i1+xZp5x5s8q0rErhRvy9RBMd7E3cT7T5HyIsTOpay/n2FQ6FGY?=
 =?us-ascii?Q?TM59PKTjPg8C4ri+pOR//oqDo9gg5G+0xOs+W74u34gn3ll/m5XTrZbtmLRe?=
 =?us-ascii?Q?SPkXT4L4m8pMn2N5tIHjOD2qDuiJRQub+bTakbMAjxNhzzGMazMF4fbZMUzt?=
 =?us-ascii?Q?Uup4qnebE2O3UVyksGUiyGiGl0C5abaY1XyH+K1eWaOJnKd7mlhMhcwLdOpK?=
 =?us-ascii?Q?Z2WpXImukw5ScsVwRzhOJ3ydsK8kY35Wj66nl60Z9H7VlaXwEK5jtAfElJu/?=
 =?us-ascii?Q?YEdvb6+qBhzJY3Q9jZN9yHq8hhLIXjnnPz3vSC4VfaTL4iU+8BTdjJ46YZpm?=
 =?us-ascii?Q?sj0s+LRLxvDcccBUYhBlYrCBnXZSiqlufJYoh3FETZZOX2G5RQFm3BaRqzKW?=
 =?us-ascii?Q?/hfjcebf+zwSeBR1p4v3MhQQH9iRkoF4gkTqknbGFKHEPZX6K4ozqElIRKaf?=
 =?us-ascii?Q?+cWShvGo08q0pPSPImLjXuhLzLsQw5FhrgU77Cmdd5TXD0DQST7m9+ug2C3n?=
 =?us-ascii?Q?aNb9mjY0Mbc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4461.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BoS1OmR9V5m+Jt/HjctZ+9X3VfhTrHuRiSwkEeNLaAkt9EAguiRjUtTt2AG2?=
 =?us-ascii?Q?6LR7Ki+W+N0bLM2LRDgqO+2v3oFN223YA0pWkQWSzrZ7FSoUBuVR8OwgEOGC?=
 =?us-ascii?Q?Nuxsj12ZhxRS0RJ8JSZqbgCvz5k3K3glks6CXJAXQIezPhUx/yeiTOuzlnnG?=
 =?us-ascii?Q?mqw2sYofPyrP5EsUSpUDnjhqkrE2UvFBe2X+4EeXbUcufempNYgdNrv8g+xB?=
 =?us-ascii?Q?DKu/RZObR7X1nqT8z1fuLWPIlUt+Bt5GAseMOUctgraXoun0C02cDqw6rUwJ?=
 =?us-ascii?Q?8yn/v70oKXj0nlG5wpoiDs4+Z9sFM79ZTfBcFQwGtwAMYIdggZfQ8oX88a/I?=
 =?us-ascii?Q?hzYKi0YV0s8zjnM+pD2+P3yYsyQof1tw1/3WBMs3LGpA32SO8uYBey+iJbNk?=
 =?us-ascii?Q?c/3icsSyiQqpi+bTiAe+DwJYxsuxBHAZJAsvvezqHkzS1YQibUwBoBbIrerC?=
 =?us-ascii?Q?q4sS+wNoEWf3hX88VapwNScLNF4aYQtXu8DCVUOJOlwr635es8hZGsgPhkE8?=
 =?us-ascii?Q?wi2cUjzZqQIG0AxCymCEqMVQ/vtsuYa6iyjl/UTwDyH8KexXQeznGfhqWUK9?=
 =?us-ascii?Q?xd9lN1xDom/uLq6MPROEz7EPNI7CAXm5c2Llnw4KT+if+RCI3UbaSfrICyO1?=
 =?us-ascii?Q?ZObxy9HoZQbwak+jTCv1eVcuBUXlCglp4ILSnfbXSWRfuTboW3vnCoJ5FHsv?=
 =?us-ascii?Q?l/YrEwTV0zYFic4B1N0iMQUoD4+rIJNIvuNQ99vsu9SfgPn6zVlKnW6qLtmV?=
 =?us-ascii?Q?I2+Hyj1AAC8ESh1aSdQ3y06lRoGZsvRoNtJHrRglmUiwYl2amvoNfhjpOXuu?=
 =?us-ascii?Q?vvY/5Bsg6IzevzLnQ4JZSqnOHVyrWwb3EUcxqDNngb2cRZGsPckNFJyxcJxa?=
 =?us-ascii?Q?aWDNz3TR+rgO43HG+TN3EO3Xv/fBec+Ogm4c1tlVX+Pm4pscm14Ppgrf+l0v?=
 =?us-ascii?Q?UkXYFvRi3x7D+x17Mg8HuUF9vldtAV/Ou+42y2OYW5V7Cu7Md/RHTQT3mDvv?=
 =?us-ascii?Q?zF9u2BjbVLAX38eHBXatZm5xUE/YEFBAUlJmU6DaJfl7c0cFukI2FeQz7ALG?=
 =?us-ascii?Q?m3JUCIL+bQIWLY/qWlllFO3iSNQD7O2oY8fc7pfeUmMx1UMhsdOIVhMC/gZm?=
 =?us-ascii?Q?orQoPBNtFvTd5oNnQHIZLOq8rBfBbOG5BVbX4z3DxpfP0ZeCyIgLiEhDML0g?=
 =?us-ascii?Q?M0BCSgEAhBlkbRej3tYhdl8xujOsh6EXFTY6MbvmnlQZmALiYkqIs845EQou?=
 =?us-ascii?Q?n4DAIIWQo6F5QUSwhC4Hy9JVYCY9Oa6nWRjVpF4rVEBGkN3On/rwnuhN7mVj?=
 =?us-ascii?Q?0OTkUZypMonP9ayGApx814rmsEENNQdvjbdLZToDHL70l8NpawyR8shMJBTu?=
 =?us-ascii?Q?DWJiqpRdWhbgMm2dYr1Vyi1IaaIfKbtDhc7H3dIejj/VYsEZbefdBg5tMUiA?=
 =?us-ascii?Q?PnUlnX4nTCyXq9w20kjJHXb6UxQ/nciC2+XQZW0Ej4NhCg1xnICdR7sTy/zG?=
 =?us-ascii?Q?LWNGCxFN/f3vfVKPO/e3gXKsE9mhltQd02KbopPLfZRiI0yb65Aiy47T52Y7?=
 =?us-ascii?Q?wXviXsEHLHWRz35SDCkxiu7tj7F0UJ5A/qva+m1N?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e2f71901-6928-4125-1aed-08dcdc4270aa
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 02:41:49.7384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 udiQkzqiBVMHTrSTfXvBa/GXiWJApD4mDBAEs2qPfy7FJJS0Yb1KeS3q4+h9WT5u1wvXI8wIMv3v3Wfhuod2IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6061
X-MailFrom: yujiaoliang@vivo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LXLIRGCDV556SEXTNWJW3WB75GHIM3WM
X-Message-ID-Hash: LXLIRGCDV556SEXTNWJW3WB75GHIM3WM
X-Mailman-Approved-At: Tue, 01 Oct 2024 12:34:50 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LXLIRGCDV556SEXTNWJW3WB75GHIM3WM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch fixes typos in comments in the atomisp driver.
These changes improve code readability without affecting
functionality.

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 sound/core/compress_offload.c | 2 +-
 sound/core/oss/rate.c         | 2 +-
 sound/core/pcm_native.c       | 2 +-
 sound/core/sound.c            | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index b8c0d6edbdd1..bdf1d78de833 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -288,7 +288,7 @@ static ssize_t snd_compr_write(struct file *f, const char __user *buf,
 
 	stream = &data->stream;
 	guard(mutex)(&stream->device->lock);
-	/* write is allowed when stream is running or has been steup */
+	/* write is allowed when stream is running or has been setup */
 	switch (stream->runtime->state) {
 	case SNDRV_PCM_STATE_SETUP:
 	case SNDRV_PCM_STATE_PREPARED:
diff --git a/sound/core/oss/rate.c b/sound/core/oss/rate.c
index 98269119347f..b56eeda5e30e 100644
--- a/sound/core/oss/rate.c
+++ b/sound/core/oss/rate.c
@@ -294,7 +294,7 @@ static int rate_action(struct snd_pcm_plugin *plugin,
 	default:
 		break;
 	}
-	return 0;	/* silenty ignore other actions */
+	return 0;	/* silently ignore other actions */
 }
 
 int snd_pcm_plugin_build_rate(struct snd_pcm_substream *plug,
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 99e39b5359cc..b49bc89c0758 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3115,7 +3115,7 @@ struct snd_pcm_sync_ptr32 {
 	} c;
 } __packed;
 
-/* recalcuate the boundary within 32bit */
+/* recalculate the boundary within 32bit */
 static snd_pcm_uframes_t recalculate_boundary(struct snd_pcm_runtime *runtime)
 {
 	snd_pcm_uframes_t boundary;
diff --git a/sound/core/sound.c b/sound/core/sound.c
index b9db9aa0bfcb..6531a67f13b3 100644
--- a/sound/core/sound.c
+++ b/sound/core/sound.c
@@ -133,7 +133,7 @@ static struct snd_minor *autoload_device(unsigned int minor)
 		/* /dev/aloadSEQ */
 		snd_request_other(minor);
 	}
-	mutex_lock(&sound_mutex); /* reacuire lock */
+	mutex_lock(&sound_mutex); /* reacquire lock */
 	return snd_minors[minor];
 }
 #else /* !CONFIG_MODULES */
-- 
2.34.1

