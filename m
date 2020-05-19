Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 166391D9C37
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 18:16:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4ABD1782;
	Tue, 19 May 2020 18:15:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4ABD1782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589904985;
	bh=0XFHqVi3fX3yDFg775uo3mAi1sOhRafylF7d3RXi6EI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=t+vO9Ex2qedY2n1JiJEXay2Qsa8Fo/htCJZErJ+VTbPBGBQ58Dz1+V54626k6BFeD
	 YLInz0EpCPZhx+cV622WaLQ4zMRdW8DB0sClU+5Ipy/bJI3npYLTry49QO/I7cnuZs
	 gzcJ2fmFSEXHubihFqvIm45edOVf9TIGisqfkQag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6B8EF801F8;
	Tue, 19 May 2020 18:14:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7394AF801A3; Tue, 19 May 2020 18:14:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05olkn2104.outbound.protection.outlook.com [40.92.89.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB16CF80132
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 18:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB16CF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="lWvd1Mqi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKCO/i1tN/n6oP+2AypMaqctFQl8WYi4vnEVBz0Vpatr6LDOOO6uUUJQcw2XA7AdruBavZHZGcNPcdzu+esN4rnw2659jQlQ1VAG0BK8sx+pDP754I0XtrtT9MUJJZhv0jMzxllOaNshWB3bmOcy5qAD5rfDCAd+Gky0mpa858bTVkvMMVrw3RQj8Hfqy92W0J453eZQwjUcaQrLJVLQOqxBeCgqXBlOwIZzV6PYP+1n0ja1fe+3rj4asGNdUZIElMmQLgAgph9HhvKdmG9wmKsZGpZ6VZWTvxMXrcY2OcV4N3lGlXbwHHUyqbvrKLPWVD/vvLYINci1qgNxW+tvFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rb7HR1ZUaeOGJzfH4wLpSvLOKVdrO8EoF3lNios8NE0=;
 b=BHQ7YcTs84so4Z868M3KPP02xftUKTxdTSrrpA4BGHYeLL0sxtJxqOBpP3lmfLf8vNtkeRpONAu8lfKx56JVJb7iZlM6DBB+xUSbHJYoFCeHIaLAMCM9lVYSp1rATXgz+c4RHWqi2K0YOUL/4e7PuCoiZ+W8bhDRIk7uMt9saEb96PiY0gZnsad1gzhbOJlNouC8ohMZ/piteK3tElHzKENfYJj8ZQCgvSOay8DAfr1W+awimCrZX+3a6FXQwf11aoVWKzkrZ8Gpm/Vy9LQJjYBMxkQV/xjryPBanJCo3c36I3pzHQ03S2DkT3bb7AOvDf6fgBedefiF1ce6ganL1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hotmail.com; dmarc=pass action=none header.from=hotmail.com;
 dkim=pass header.d=hotmail.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rb7HR1ZUaeOGJzfH4wLpSvLOKVdrO8EoF3lNios8NE0=;
 b=lWvd1MqiZu0b0gRjOl+7prqF0YuJGRI1s6FGkz4pVDLIwEhT89KfEngN8ykXPPtxZ+aO+SP/Nvx+P+/hdq2IQ75O6wmA6pT1mqvGTGU9ICt0Tl7UFL3rTu5USpetC5IsCvlP5KlppB7Hs4k20T7780bt6tVc+EqNJV3q2F7BWpUlbz5e2IEltyFbke4ue0Ps0EXsyD2fUr4UHGtKVedUcgTi91lF46f0QE6P/HbZF+Wl9BzdN2yqpVj3XE74bHUUaw461C8kTIoyUMgovU5uYZI8h4l6zCnPrhnoyEziB9NpyQSxi7NnEhCKYOhqmThiVseOBJ282cok6lz6iQUo7g==
Received: from AM6EUR05FT043.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc11::41) by
 AM6EUR05HT156.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc11::486)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.19; Tue, 19 May
 2020 16:14:30 +0000
Received: from HE1P191MB0153.EURP191.PROD.OUTLOOK.COM (2a01:111:e400:fc11::52)
 by AM6EUR05FT043.mail.protection.outlook.com
 (2a01:111:e400:fc11::429) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.19 via Frontend
 Transport; Tue, 19 May 2020 16:14:30 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:AB6DE0C54B6ECC80A7D85E9B9FAB6DA5665E40443280BD0A6AFA7FA5A1469859;
 UpperCasedChecksum:FCA59323D85524992EF8EC7C361D80E0522E4F30839BE83D74EF30E5D15832A9;
 SizeAsReceived:7462; Count:47
Received: from HE1P191MB0153.EURP191.PROD.OUTLOOK.COM
 ([fe80::8dd1:2eb0:a33c:bf69]) by HE1P191MB0153.EURP191.PROD.OUTLOOK.COM
 ([fe80::8dd1:2eb0:a33c:bf69%6]) with mapi id 15.20.3000.034; Tue, 19 May 2020
 16:14:30 +0000
From: Maarten Baert <maarten-baert@hotmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] pcm: dmix: fix incorrect boundary handling in
 snd_pcm_dmix_sync_area
Date: Tue, 19 May 2020 18:14:15 +0200
Message-ID: <HE1P191MB0153779C50995EA59EF71882E2B90@HE1P191MB0153.EURP191.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.26.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR01CA0164.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::33) To HE1P191MB0153.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:3:c8::22)
X-Microsoft-Original-Message-ID: <20200519161415.399334-1-maarten-baert@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (81.246.190.254) by
 AM0PR01CA0164.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.24 via Frontend
 Transport; Tue, 19 May 2020 16:14:29 +0000
X-Mailer: git-send-email 2.26.2
X-Microsoft-Original-Message-ID: <20200519161415.399334-1-maarten-baert@hotmail.com>
X-TMN: [PmUoDzskGC3p7h+mZ+3XVBTAhQOuTTY+]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 9d1a0401-6bcf-4392-e4ef-08d7fc0fb5ad
X-MS-TrafficTypeDiagnostic: AM6EUR05HT156:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7nd9Hq+W1P3EbAjfRC/X2jCaKpyuo/4Y6GY7dyRf1/VJrpWiH/HwYb9sUkC6gIc5z8mXwH8CFnB2kQV4CBrWwj8a7OgGSFC7HeypgcSzF+I3Zt9wXeKLl9TkULgVHeeor0WWfINUKcia7PQZTYvfkjAjnDzlEl5CfGROl9fyVM2dbruEUox5Pl9cr2E5xRZBnXfRBr8nBi7FEEMv2rjfdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1P191MB0153.EURP191.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
X-MS-Exchange-AntiSpam-MessageData: +KfBMPdjUy/P7B6fdKlxSKMPrSRs2A1eRfG4gbmIUJhdHRmnTL3MTMjm9MBXrR1IPtUEyPIQRdh/uwGO2fGu6LpmHTYLDCYgqc0t2OifIztvf4tgou8KKEIP5RWgSYWWRjXPPuZ+Oj9z25Er3yhtQA==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1a0401-6bcf-4392-e4ef-08d7fc0fb5ad
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2020 16:14:30.4213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6EUR05HT156
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

The available size calculation did not handle wraparound correctly. Also, the
underrun handling code confused slave_buffer_size with slave_boundary, causing
another integer overflow that results in too many samples being skipped.

Signed-off-by: Maarten Baert <maarten-baert@hotmail.com>
---
 src/pcm/pcm_dmix.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/src/pcm/pcm_dmix.c b/src/pcm/pcm_dmix.c
index 843fa316..b5fdb240 100644
--- a/src/pcm/pcm_dmix.c
+++ b/src/pcm/pcm_dmix.c
@@ -315,11 +315,12 @@ static void snd_pcm_dmix_sync_area(snd_pcm_t *pcm)
 	/* check the available size in the local buffer
 	 * last_appl_ptr keeps the last updated position
 	 */
-	size = dmix->appl_ptr - dmix->last_appl_ptr;
+	if (dmix->appl_ptr >= dmix->last_appl_ptr)
+		size = dmix->appl_ptr - dmix->last_appl_ptr;
+	else
+		size = dmix->appl_ptr + (pcm->boundary - dmix->last_appl_ptr);
 	if (! size)
 		return;
-	if (size >= pcm->boundary / 2)
-		size = pcm->boundary - size;
 
 	/* the slave_app_ptr can be far behind the slave_hw_ptr */
 	/* reduce mixing and errors here - just skip not catched writes */
@@ -328,18 +329,19 @@ static void snd_pcm_dmix_sync_area(snd_pcm_t *pcm)
 	else
 		slave_size = dmix->slave_appl_ptr + (dmix->slave_boundary - dmix->slave_hw_ptr);
 	if (slave_size > dmix->slave_buffer_size) {
-		transfer = dmix->slave_buffer_size - slave_size;
+		transfer = dmix->slave_boundary - slave_size;
 		if (transfer > size)
 			transfer = size;
 		dmix->last_appl_ptr += transfer;
 		dmix->last_appl_ptr %= pcm->boundary;
 		dmix->slave_appl_ptr += transfer;
 		dmix->slave_appl_ptr %= dmix->slave_boundary;
-		size = dmix->appl_ptr - dmix->last_appl_ptr;
+		if (dmix->appl_ptr >= dmix->last_appl_ptr)
+			size = dmix->appl_ptr - dmix->last_appl_ptr;
+		else
+			size = dmix->appl_ptr + (pcm->boundary - dmix->last_appl_ptr);
 		if (! size)
 			return;
-		if (size >= pcm->boundary / 2)
-			size = pcm->boundary - size;
 	}
 
 	/* check the available size in the slave PCM buffer */
-- 
2.26.2

