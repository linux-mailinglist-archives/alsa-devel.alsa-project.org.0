Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9D21D55EB
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 18:26:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC6A91669;
	Fri, 15 May 2020 18:25:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC6A91669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589559965;
	bh=cQkt2BYOQr+nc3vKkGrBCkKyEozvZwdi7Ymaa9kb49o=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uEaDR/zlC+MBLT+crygu85RdszqJB8UDMyXvlIykL+LaL6Pv7OQMEkPCZLYFRiUcT
	 j0IOn0qy8yKGWIp3ttmh8nwP8cGT3HLKqQYjgOWiCwuWxSvTO9D9//0pmMljsDoLFO
	 OFdDysrR1G6DTAwqbsjGaxU+MZoct9szsrfuBs6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB37BF8022D;
	Fri, 15 May 2020 18:24:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD941F80247; Fri, 15 May 2020 18:24:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FORGED_MUA_MOZILLA,FREEMAIL_FROM,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-oln040092073082.outbound.protection.outlook.com [40.92.73.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E872F800B8
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 18:24:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E872F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="sGJDE+el"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnSldsEgNFioO1x8Nzhz1b4VmxPFOsiAgBAfwaFBUcGm/X+3DckIa1ZvjdeFt6KheLeIXYzTJTzlQyWJpbd643gOGRrDXdH5qgG2QjPN5dFBmb347y0YkdEZCcNSMF1jhvOr5XperhvZM0m0gR0gH9CxIJy7rbcm0InAg2Y0Y/Cnr219k1+RJog3LCOjs5A+IExFyTm1xSrYEXisd/uxKBh8TI7XufAt7ZVev++j1qe5KN+s6QCkEN/ugCbnzvzvd0afAWH6xiMSkAQpo3sDlbtP4Y9L/3FLO9iDqc5aVzCeIoJCWa3rzFYLC+Am8uG1oLqfO5sHa0hAhMqhyKNtKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rb7HR1ZUaeOGJzfH4wLpSvLOKVdrO8EoF3lNios8NE0=;
 b=Jod4Pfn6WCFaAoYbYPSxtyrSVemRfC2z4syP8asXFY+3hdWlziGhJe0BnZ8rdkFOqF3UY6FYOdJQKjMxKtaqBGPHTdn/7g0J0LwsI26pACq+R7FTTVSl6hAgnWUHGiJ14tWBA9Fze7R4ksgZ/Imz6VqQF+BozmsuDMw+3L+CsSQwj8TtjUaB1ckOTP8vNYy4XAXK3/ts7npPzq0/nbdSv6tlVqJq+5aYn009WChjynX5JxJUbus5LfvsGb/q1chjzX0+ZxnPUIR1oVKaaRySRWBGKQrpLP9VVzYa8ITMLOVRLCho+B+E+lX9tsgZWThq11QuX1ixynn6NSqpBK1Nqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hotmail.com; dmarc=pass action=none header.from=hotmail.com;
 dkim=pass header.d=hotmail.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rb7HR1ZUaeOGJzfH4wLpSvLOKVdrO8EoF3lNios8NE0=;
 b=sGJDE+elZgij2gZfTL5XIXcD7STbD4J9QL5vHycVLBoZ2p/2G5oabrv3u4X4oyt7d8HLCZ1KsPnP5lTc5D7Nq+yn7qjuWnGkR7VCFSwYOCc86QvYnHMFKbR7z9zwQXv6pijroWWEzRTO4uVR0CFIIMhc2xe5YOZVeYUdjT1p6jjy+nkXK1fsj9PK6eX2r1Fec/VDwGqpeEC3TQKxY7Vwdc/d5ik05IM4me5EgPu0/8mmOVu4nI1zdIvDO7HwoFc0GBQ2JG4K+FA6kDJAKv/RNxqLOzGull5NTa1hVN+iyJrDr9b7gYY05tMRmG/UfySvwVhlcz9xFE90ykFFyMu9nQ==
Received: from HE1EUR04FT015.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0d::4f) by
 HE1EUR04HT235.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0d::420)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.19; Fri, 15 May
 2020 16:24:09 +0000
Received: from HE1P191MB0153.EURP191.PROD.OUTLOOK.COM (2a01:111:e400:7e0d::4a)
 by HE1EUR04FT015.mail.protection.outlook.com
 (2a01:111:e400:7e0d::74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.19 via Frontend
 Transport; Fri, 15 May 2020 16:24:09 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:D3FD1CB973EC940EA3E5BE1DC13D251CADD7D6D1667749AB03F841B4B6FEEC02;
 UpperCasedChecksum:B85A4245801536B45E92192814A4552D6038E3ED8DCFB26D89F516A3C61CEF91;
 SizeAsReceived:8653; Count:47
Received: from HE1P191MB0153.EURP191.PROD.OUTLOOK.COM
 ([fe80::8dd1:2eb0:a33c:bf69]) by HE1P191MB0153.EURP191.PROD.OUTLOOK.COM
 ([fe80::8dd1:2eb0:a33c:bf69%6]) with mapi id 15.20.2979.033; Fri, 15 May 2020
 16:24:09 +0000
To: alsa-devel@alsa-project.org
From: Maarten Baert <maarten-baert@hotmail.com>
Subject: [PATCH] pcm: dmix: fix incorrect boundary handling in
 snd_pcm_dmix_sync_area
Message-ID: <HE1P191MB0153D35FC0B82F7F6D2E409AE2BD0@HE1P191MB0153.EURP191.PROD.OUTLOOK.COM>
Date: Fri, 15 May 2020 18:24:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR06CA0122.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::27) To HE1P191MB0153.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:3:c8::22)
X-Microsoft-Original-Message-ID: <a4e50608-b658-6b83-914a-229b94d7b696@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.101] (81.246.190.254) by
 AM0PR06CA0122.eurprd06.prod.outlook.com (2603:10a6:208:ab::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.20 via Frontend Transport; Fri, 15 May 2020 16:24:09 +0000
X-Microsoft-Original-Message-ID: <a4e50608-b658-6b83-914a-229b94d7b696@hotmail.com>
X-TMN: [kX3ZxvcN6q11LhRPEMl3/XlWfRnEanHL]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: edd07047-c384-4a40-6c18-08d7f8ec6557
X-MS-TrafficTypeDiagnostic: HE1EUR04HT235:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qK3vfpXlW3mDcT/L03SD0k+fpTqpEEnaBw9oJqI/nm6cejh8tw0sCgmYf0MwL+sPoUyB2OjdC9BFPl1c9ovuTI2cqHcVqWi2bGSJ+3Wa/RXhPlDKDXHn9CJ+NgF2vHUdZKJ8rq1z8QeGTOd7V3eJLUdzuX9OtdfnCFDlDLOmSUQPF0ygT+Sd7dwPDxgRfpsScQVUGkJLdbDJEkg8urLW6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1P191MB0153.EURP191.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
X-MS-Exchange-AntiSpam-MessageData: j7OqUkD/3tIxhYoLV4bXhWUUWWNw9ASm0r/BKv2QyD63A2Kp+s0JlEpxEQkorFgPl73LkMcMosq75FKSdzF5TfXPBegeKFtVPqfAiUqXDIDJdex+sdPARMl3NzkILewzoA/CTWT0tPKK4z6qumqkyw==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edd07047-c384-4a40-6c18-08d7f8ec6557
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2020 16:24:09.6441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR04HT235
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

