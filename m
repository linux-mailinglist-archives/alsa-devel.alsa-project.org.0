Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D2943AC31
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 08:18:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F158D16E9;
	Tue, 26 Oct 2021 08:17:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F158D16E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635229092;
	bh=Gdj8byTr7nBxsNtNtZJ6cIQfjtmDGCxgdhu9HpSpM/s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iPqTolkBJ0DZKHdKcdjcjVPkKzW8+q4yo+BvQ290fvSevi5UKxc4FkS1ic6cAbpPd
	 qhI64HNuu7xkxvMjI/qIH9I9PlUZoA7amFFJObRgp4ua7QoYsMb229kXXuWm2UF5zk
	 bOL9H/JeGsZPnKJYaoT7vgcOwo2rX3CDA4gj93VY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00B21F80511;
	Tue, 26 Oct 2021 08:14:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1951F802C8; Sun, 24 Oct 2021 13:18:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410124.outbound.protection.outlook.com [40.107.141.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47396F8013D
 for <alsa-devel@alsa-project.org>; Sun, 24 Oct 2021 13:17:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47396F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=connect.ust.hk header.i=@connect.ust.hk
 header.b="HzNSnw2o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BL+HRngFUemjOJeEiuilTQgiwpjcP9AyjWq9Kw7+mhEbboHt2VjZHVC8vPBlxhB5bmeXt/M2IyfK3LNNAnbAPkQmUvOXL/MCFsRA6f1ciSWIgV4bfht1Da8CB2PXmeN47iHvfQi4ZU/TGj+kg6adNNFLYhO6IwHjhHd2be6scFKDl5mCjOpmhP2jar4qesTrhfaWKOxo+QU1jE4EZZArZJdSjHC4einZqMFNfrCMVk/rwcSSxUl62V8NV1ZPC6zaMHliiii4Kb7UjaSWqJwyVKFW8PdhZVwF6IJTtZBrybBVE8HiSKrh6T9Qt1i3+1nYtB9zgvYgcvUq9UgPip8pUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPmspgTCkXiBBz3G9sJUzRNW+PnUJg18F/3czbx+yHc=;
 b=CIyCZ/n5C4kmWFx0jlZyPDaO0XiJiYc8eE7AjF2ufQxfGMr7t6AQGqxH0ntedB8mfhQADSeYA5Kzc9uFT9kx0FUmEUv325Dm2sg1B7Frm/2qarhGpevzRPXProGBpAV4jr1c2+wPX3mT8myY/HRicOdmMoHV5OHCjS8vZEdW1s3FRlGphLiNw7Yq3gk5PX2k+rqSoRd6eEEsjt7Cw4N9Ns1u3Y1UjPwnErpT2tWM3tyMyEiBDmtUW9PXmZXaFXSER60E+9DaJH31BkwF2VwglMIKwaJjajUaa739Xe2JFlptkFVFNf8Ehf97QgRNs5QA7wCJz2Ov26scCmF/Mn/9sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=connect.ust.hk; dmarc=pass action=none
 header.from=connect.ust.hk; dkim=pass header.d=connect.ust.hk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connect.ust.hk;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPmspgTCkXiBBz3G9sJUzRNW+PnUJg18F/3czbx+yHc=;
 b=HzNSnw2o6Ip2D6Ay1gaYh/YmqS6m6OzkmywVFJDJtHfiIfAFPuSGgvtXi5CEW5QOZJTmW9ezRCUNVeXdJ20QXj9wVal8lV0tXX7JWUdilha9WMC4CUPxxOvpE38WKujdrv9tdwn/+6kiop9Z6A9tFIbibnqyOsRkQDxQB1qO94w=
Authentication-Results: perex.cz; dkim=none (message not signed)
 header.d=none;perex.cz; dmarc=none action=none header.from=connect.ust.hk;
Received: from TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:b7::8) by
 TYYP286MB1099.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:ce::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18; Sun, 24 Oct 2021 11:17:47 +0000
Received: from TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c0af:a534:cead:3a04]) by TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c0af:a534:cead:3a04%7]) with mapi id 15.20.4628.020; Sun, 24 Oct 2021
 11:17:47 +0000
From: Chengfeng Ye <cyeaa@connect.ust.hk>
To: perex@perex.cz, tiwai@suse.com, chihhao.chen@mediatek.com,
 damien@zamaudio.com
Subject: [PATCH] sound/usb: fix null pointer dereference on pointer cs_desc
Date: Sun, 24 Oct 2021 04:17:36 -0700
Message-Id: <20211024111736.11342-1-cyeaa@connect.ust.hk>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR03CA0046.apcprd03.prod.outlook.com
 (2603:1096:202:17::16) To TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:b7::8)
MIME-Version: 1.0
Received: from ubuntu.localdomain (175.159.121.169) by
 HK2PR03CA0046.apcprd03.prod.outlook.com (2603:1096:202:17::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.11 via Frontend Transport; Sun, 24 Oct 2021 11:17:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b8b3645-d0df-400c-e56c-08d996dfe8c6
X-MS-TrafficTypeDiagnostic: TYYP286MB1099:
X-Microsoft-Antispam-PRVS: <TYYP286MB10991AE55863A6C8C27A61B68A829@TYYP286MB1099.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OipoEwmnSd8XX5XB3qPsvUQijd2oOHdQfJVCGwKJfqRl3mBHcC9mWYj34QeMGl5TDnJbpEI8IVj2sfcclFqNADiwTjqT3GIpMG+hH+RTCS40WGAGL0aX8kq8sqJ/hEyRh2MfUlN5N9oA6R/ssYqM3OSlZ85KsLRYQpsi1AnAFx/VkM2vRI3YqBRQ4Lnc5sDofc10TgSsy4pg414RgkCqDUoZrqGZCgQGQZizxvZd+TsluchEQUy4Ed3T4O5JArapSrtEmfdxJORTrCr1slcLyNQYi1cdx6tBeg0pbhJATz3V3yvNdA+9IJVEOpkwgywvYWtnWYCUr5hnMlf6OdhL1jY5sU0il1boEp1QgOL5rBtBkswfOsoEWlJzAaZ9JGpnUhtIp58FP5+zgsNHFAqrGdK0K1zpAe5FUoO6L96nJy4iDIAHsnFNjG9fG3axk9PPx5+FZO1+ChlZyrxAafkg/GkkRZES0hGugezYLhRDcPU6rprERF1hru16uNG833H/2f3W1hgA6puzgbykRR8FyT31k5RsgF9ynkiC5hMyYW9zy8TuuUU8Z1v4c5bRwFzo8W7OTT6jyK/eUyn5l8OBoW2nKRswAVcG4w3DhMWwnHZIjx55Y+UmIaXwQYbChBgb5EsZwl1idvAZ4eQKG9unw+qT5NwfTfBsELjmNOghu/UQxAZVHIQeSSj3M/A7cBT9HjAOHX82u0L0PtP2hsr0VA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(4326008)(6512007)(186003)(956004)(786003)(2906002)(26005)(508600001)(6666004)(316002)(83380400001)(2616005)(4744005)(1076003)(38350700002)(38100700002)(66476007)(66556008)(36756003)(5660300002)(8936002)(6506007)(107886003)(86362001)(8676002)(66946007)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sd0LS/nRirHgoz5dWOoGtD2gVQGlpytbRG2mOrIRfVda7qiSFES4nK+CrKDP?=
 =?us-ascii?Q?nMiXmpbEFDLgcnvYmrpGl9a0RZoKa83OybaRzw4/Sx9SQ0SIngZqQdfPx+MF?=
 =?us-ascii?Q?KEcgjk3Z4M5LUZOFwocG/2IiUXwJXcXznt5XIeA6QZ/rnfIyacBN7GuI6VIO?=
 =?us-ascii?Q?xR7fmA1JLGM2k2PMm/j+8h9QmXwNXpPb1nq9BPDGqneHJPfiRK3rqKu7dBJt?=
 =?us-ascii?Q?KcNT4lI1DXqjcMk+ybo4I9oe3X6BmyyoaXGEAUbaG34ggCu/GUMJq289ZkdZ?=
 =?us-ascii?Q?UVKJs2H6XIFZv4YXoX4K/80ArBp7cl7NZc/Qv/QQYKl+3FJWMODc91arJExd?=
 =?us-ascii?Q?7+ljfvZlpNkJJNduiq38qMTL6e5uFzdTo3K+EzqxleHGnHG/wlFGTDNYBEZr?=
 =?us-ascii?Q?LRqE+0643lvWWdl+VtgLjxDYBFb093G2bEKImitFccqcNUqVZPgUSTO99Iaq?=
 =?us-ascii?Q?7Zk+cI9QFNKmlHsbzuHqUpFTNwZLky7ZzIust7x9L27Rit+j8sagQ/w68lc/?=
 =?us-ascii?Q?UcjPWODroMyOrpEsuagx2CmRfn5N/+JJBkJXKW/sWSui7sLK+fIW/IiYoKFU?=
 =?us-ascii?Q?NhyXXtGdhkGBCL/ELhFrUIpv4i+I2O50KeIHwb+3PxQAqZ56v39EHW+7JtxQ?=
 =?us-ascii?Q?eot868gjdhYrBkuccAP4BVLWsF4oOe6FcWMVhjezwaBmwvYxIP2xhHR8rF2A?=
 =?us-ascii?Q?03CV4XH0kIf7ioMzMiwXkOH8k7ojW4DeCBFqjjz/fjiXLWn6A/A4Ldnda+VJ?=
 =?us-ascii?Q?9NMbYhQB7oCSQMrTNLrlLQIWsQX06DCVTW39RbvrtYfEHUeZHbB98hiLWDXg?=
 =?us-ascii?Q?mw00ERlXk4IsmtcTc7SZBwBsPVHzsRfs3mDFzoLetdwX2xlNDD1e9qYjR2Ul?=
 =?us-ascii?Q?ILkXD7assMlmf4mb+umMmOTCxKLsH1yBpXK7O8wz2Um9S3JPPgjOcDPzVM+k?=
 =?us-ascii?Q?7kIAxb2EaSSm8+hPZJkOV5zoNzf6txJQULRRnmDw684g6Ppa/nA0p3V7hq6X?=
 =?us-ascii?Q?0uBLalQBLBtHGLVi09/whjybI/8QzJ/xvBTaLK1wpyw/TOBZE/qCyYN9giKy?=
 =?us-ascii?Q?9t5pMuaeQqtPe/8JILaatgAr4noipYMxBOb+AKp+yuVTDnIyYArTauvDXUKL?=
 =?us-ascii?Q?p0xrmtNzN5SHJBEdNJDR9hbF4/LIheUNFPVKf8cWAT28ZKBw+s3806jkfIGm?=
 =?us-ascii?Q?WApFdfvFq4X8ghlqCttuhSrN6XJbZC1XiwN8/1iQf+ayOLqqjjrCUFrSsT9Y?=
 =?us-ascii?Q?7Z2NRxsWbwhJI8XXp7hEQTgGgwmSJlUfumBVHyYlHx5q26/HqeL5jjhnuJWI?=
 =?us-ascii?Q?L3TXutNBjExyYA5s14FXEW17D28Q4yvUlPGJj9MEFYYPW009uKdUy5l1WR9u?=
 =?us-ascii?Q?xVjeWHMkVr1GvyqSj9Ik0aOf0HaFanOAmTGJZMm5oV+XwtbUAMp6DR3Tg0GK?=
 =?us-ascii?Q?C1D2JpOXX8J6NRqbPF4cLYFVByF9K+PsSLmQCsHDTQapql4Tt1DUXRilDNO3?=
 =?us-ascii?Q?oZiBeZnrkkmh/RAJKunAtuNd7wpi2jOgfDaRWHY/ZRiOuRgsuSp83Ug6PtR2?=
 =?us-ascii?Q?h1GFHaUoBGKmqObA9GocW1EVdy6K/Lpbz+O5/SDSijK/sUzYrULENqn+wy9c?=
 =?us-ascii?Q?XgVnLVvtU1gVCP6x6qafNow=3D?=
X-OriginatorOrg: connect.ust.hk
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8b3645-d0df-400c-e56c-08d996dfe8c6
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2021 11:17:47.8580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c1d4152-39d0-44ca-88d9-b8d6ddca0708
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BtGDMmDGhcmOTxZrP7PTpspMhDwLh8g14YFI42c9cXXDY6L8k1djZVRYMPXxmSqd+FdCGNKGBLnts7o0Cgh0KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1099
X-Mailman-Approved-At: Tue, 26 Oct 2021 08:14:36 +0200
Cc: alsa-devel@alsa-project.org, Chengfeng Ye <cyeaa@connect.ust.hk>,
 linux-kernel@vger.kernel.org
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

The pointer cs_desc return from snd_usb_find_clock_source could
be null, so there is a potential null pointer dereference issue.
Fix this by adding a null check before dereference.

Fixes: 9ec73005 ("ALSA: usb-audio: Refactoring UAC2/3 clock setup code")
Signed-off-by: Chengfeng Ye <cyeaa@connect.ust.hk>
---
 sound/usb/clock.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 81d5ce07d548..98345a695dcc 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -496,6 +496,10 @@ int snd_usb_set_sample_rate_v2v3(struct snd_usb_audio *chip,
 	union uac23_clock_source_desc *cs_desc;
 
 	cs_desc = snd_usb_find_clock_source(chip, clock, fmt->protocol);
+
+	if (!cs_desc)
+		return 0;
+
 	if (fmt->protocol == UAC_VERSION_3)
 		bmControls = le32_to_cpu(cs_desc->v3.bmControls);
 	else
-- 
2.17.1

