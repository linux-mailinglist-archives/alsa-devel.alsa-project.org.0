Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA6A2DCD51
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Dec 2020 09:01:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70F851725;
	Thu, 17 Dec 2020 09:01:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70F851725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608192118;
	bh=FZV+7zbNbJF5cPIOdaTC+P9/XBrlHDz8ek95Au3ikRw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=buxXMo46X3EvH4rsm+KM7IzN8VwRn9SA/zuAyAnEEIzS+7tNhR98T7bCed9jDwQ5c
	 /wHZyt7qVH9qB+nuGpG8+d5lnkXsMP6/udPhP8IPtDx0Ia/e2AYkEbGTVdQoAnpxZY
	 Rf90ehbRQ4XghR317cKZzKu7nrfHTjcpMJwFRJ4Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7E54F80278;
	Thu, 17 Dec 2020 09:00:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9372F80260; Thu, 17 Dec 2020 09:00:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50074.outbound.protection.outlook.com [40.107.5.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCEACF8014B
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 09:00:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCEACF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="L7x7dviX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHaz4fkccrtJ/l5WhMeks8dA/mm4WD0LstdngQu1IhL4j5+OoQePA7Y/ehe3j0Z5iLeB7A7WlANHFrbLRi1AkRsXk1v1csspmJqpYEU0dq/dx9Ku9OSHQzllINcn4Mpaqf6Psl2PjOQZ1ESWG39/TRDCG/BlJFlByY+JMRgzlwau0j5/xALs4STQn8zZI+LhnfNPzB37vKe3tfpPJGue9hAi7rVWRvswQAi9lbNHW+TxlRaLrgtCIozRL5vgaaziHcP/CNlzIGKgPEC6Xv7CvWueY7FW8jSthBKwNWDGtYncjm1RWa5YasAw7SuD25oELzRWyGtzeXXnqlaAZoeTfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hg8l/NYhQ+1E/LChxorRpKnBB3P4TfJ2XYNh5dqZNQY=;
 b=ZmNU+y51YGFisq6kzIoGROLefbfXg45q6ab40OcjtGMmKE5BleUV6QGDNEBRqvD61neA3eqi+zUPJIGWd/r5uOZ+NxpQ902BY8xPm/ksWn/9nnPnWFoHXBzx7k2pvdUVwoQgx/2vKzUsSPjxE6dC6St8GmzSrZ9efRcfRRcz8l4Tx/xVYrYVppjeKoMCW6XGpHqIj/Kyq/LyyQ4TXyJQOtA2w8WmisgKuSdfzoq5upKuPXHjdiQJYy/oB3O7KLQ0qXRNo5NL6hz9F39nDu5UFQa7CbzYa0TsYLzyhQFKu2tYRysMXwn3n/kK3lU69kDZSR+04a+KYpcZqFUdVuvGzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hg8l/NYhQ+1E/LChxorRpKnBB3P4TfJ2XYNh5dqZNQY=;
 b=L7x7dviXKQZM4qPzpbRyrUUPj/zJUeEPEbvV35Y1Jki6JLgRNvX8IEFO2zqbBvcKjzOPkyXbYLP1qpEOB/vvf19wyY2FmztT0ow+XmWHH2rFAUFPlwh8WbNuFwpW9EUJHhGx9ew3bM6JHAbY532of6p27pQvuMBzG6YL/zRKipo=
Authentication-Results: perex.cz; dkim=none (message not signed)
 header.d=none;perex.cz; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com (2603:10a6:803:119::15)
 by VI1PR0402MB3549.eurprd04.prod.outlook.com (2603:10a6:803:8::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.15; Thu, 17 Dec
 2020 08:00:03 +0000
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::b042:5b55:165a:87e2]) by VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::b042:5b55:165a:87e2%5]) with mapi id 15.20.3676.025; Thu, 17 Dec 2020
 08:00:03 +0000
From: Robin Gong <yibin.gong@nxp.com>
To: perex@perex.cz, tiwai@suse.com, akpm@linux-foundation.org,
 xiang@kernel.org, pierre-louis.bossart@linux.intel.com,
 gustavoars@kernel.org, shengjiu.wang@nxp.com
Subject: [PATCH v1 ] ALSA: core: memalloc: add page alignment for iram
Date: Fri, 18 Dec 2020 00:15:47 +0800
Message-Id: <1608221747-3474-1-git-send-email-yibin.gong@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:3:17::16) To VE1PR04MB6638.eurprd04.prod.outlook.com
 (2603:10a6:803:119::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from robin-OptiPlex-790.ap.freescale.net (119.31.174.66) by
 SG2PR02CA0004.apcprd02.prod.outlook.com (2603:1096:3:17::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3654.12 via Frontend Transport; Thu, 17 Dec 2020 07:59:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bcdca302-a3c5-4ed3-1bb3-08d8a261c278
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3549:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3549B4067E546C4BEC61BF3E89C40@VI1PR0402MB3549.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oxBOE49abwn1qigOjMY4nWRCp6G726ZQMHyGGYlWe9vx9qt8e76FGoI2g4zq2z0IJd3v/nkEuUenR67es6iY+uckiHe5uyPmWKUtlot6Cs+k+hj6hlkePMOnjkjKjroPrfaO3GX1GiJ+a4SeGuHFOhlIUPm4Msy0XVb5ZOQIxjCCkPH12fcvPTOZi/6r/57s2sUlr90HzHQw130vue7vxCsnV3szAAvyaAxtFdg52oSOeDAdXwcDJHbsf+CqAajkCIU52fxpfrmYav12J2Idz7Rpca60mID5MSAZJSsBsYFMDmUOYR4+91o97ox3nWgUM23h4dYSgOv798PlycygRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6638.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(396003)(376002)(136003)(6512007)(316002)(956004)(66476007)(478600001)(6486002)(36756003)(86362001)(6666004)(6636002)(52116002)(8936002)(186003)(4326008)(66946007)(83380400001)(2616005)(16526019)(26005)(4744005)(2906002)(8676002)(5660300002)(66556008)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?d6kRqk39AqeaA9nRnlDXo7iq7Cjhb3mrGV+HUYVUfvmfKgUMsYEb3csfNDGK?=
 =?us-ascii?Q?9jYrKPfDog7Rjvfl8MaIUNGmSuJ0Htu1lCBSsuvFpV98SJCc6QZ5FiOJGOIm?=
 =?us-ascii?Q?OzlQGa3Edl26ssojdyf14iBgSYzC5OlxNjjV4dOOizhr/FwwhThrqnQEBghN?=
 =?us-ascii?Q?u2UzhE2jPm5DiPRsLG4+F91E1ik115P5+O1c/eBL6+W/JeBBouZi+AV76yX2?=
 =?us-ascii?Q?PY8ZNKBXUrrV3/FAZHUhQT2zm6Q2HutToHki66XQ5PKkl+1Y2VrOH21anOd6?=
 =?us-ascii?Q?rBKPkGDbUV3THCI9JmrCg9n0W2H5qHjCaXYIghjswFEx9bxP/qkfSrQAhehQ?=
 =?us-ascii?Q?1QOTvi3hfT48XaP9qR9sj1/Te4W0L5jH0nzfPr9B1RssxCqXj8VWUKW+g0CH?=
 =?us-ascii?Q?azEA99Fa4XvXN3rbBDQw64XihrPyFr6sN6a6nGF38kuPn3zwy04dfd+3KoXc?=
 =?us-ascii?Q?bEuEcyfwLE756EfqzQC4sIrV6LU18zBGt4SnUYwvxTFSQG/X2204Hr9Ao3Qv?=
 =?us-ascii?Q?Qtno423TEZbi3YWoXAzWSzb7y553qLHDfSZuEjqmeLS1FVMI4Ytfb7gQd1FU?=
 =?us-ascii?Q?6MCujNSSKMXYgUYXaS1bFj/pWMnEPh+9kAPfTLVMY1YPsHJesGEVivobBKcw?=
 =?us-ascii?Q?OhymYwFcnWd2HUSLmBvKdpXclxnAN2eIXYQy37mYPxJlFS6FpoQ3P8ZgRL8N?=
 =?us-ascii?Q?cPKgjFTXx6QRVPYsPdoZgglHIFlEI+YnFC8wAN4tQC2KI68+PD4TG/Eo5VSJ?=
 =?us-ascii?Q?I0Nd8Wr/u6WvvtM944N9XPLdzhTIPwhsWUMT6psFIslmv2qveupav7DthYlP?=
 =?us-ascii?Q?C1BPS4cceyrrR/JwIb3iJ/mZsxCKqf8dBhuHN7lBIikXSkjKfo9LiqgOONvn?=
 =?us-ascii?Q?dfjHcKx8FNVNIh+UF8QzBvZeho/Rys2QoFzacShhji6dwNKHzO8l/yoilgdK?=
 =?us-ascii?Q?QEEB81UgxAelgb8ytmTrTZZcWD9S27RuoDAwanEgvCmwuiVI1VhCimzlDuXZ?=
 =?us-ascii?Q?wJyv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6638.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 08:00:03.0104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: bcdca302-a3c5-4ed3-1bb3-08d8a261c278
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rYccN9F+yDGyi3QGBd1QKhYCXx9xaw8uC7wwyJ97eci0wl+ImjM9VB8KNqipatu13n2ntmtrFQ8KX04Cnn1wjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3549
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Since mmap for userspace is based on page alignment, add page alignment
for iram alloc from pool, otherwise, some good data located in the same
page of dmab->area maybe touched wrongly by userspace like pulseaudio.

Signed-off-by: Robin Gong <yibin.gong@nxp.com>
---
 sound/core/memalloc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 0aeeb62..0f33516 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -77,7 +77,8 @@ static void snd_malloc_dev_iram(struct snd_dma_buffer *dmab, size_t size)
 	/* Assign the pool into private_data field */
 	dmab->private_data = pool;
 
-	dmab->area = gen_pool_dma_alloc(pool, size, &dmab->addr);
+	dmab->area = gen_pool_dma_alloc_align(pool, size, &dmab->addr,
+					PAGE_SIZE);
 }
 
 /**
-- 
2.7.4

