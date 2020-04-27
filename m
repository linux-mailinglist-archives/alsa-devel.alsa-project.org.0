Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 769591C0332
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 18:55:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC3B51697;
	Thu, 30 Apr 2020 18:54:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC3B51697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588265710;
	bh=lIZZslpdy3PZ/wzQwAEpOfjRJr5BKEf8N4o8MpdhKQY=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nfiHYt2vo6K/2U+sB2ruuHGNIPAp2QAPHPVURU7up5UYOqReI26GNoAFJGYg5lPEH
	 s7zURgfIZYycFZCJeFbXl8oJ7sKNcIVRC3LPkWkDBm1e0rmll8WyQ1YcFIAnauom0q
	 ZQW6EuAQWJTehZhdvzB/dzL2WWmvRuIS6m7fKYPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCF06F8021C;
	Thu, 30 Apr 2020 18:53:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B57D0F8022B; Mon, 27 Apr 2020 15:22:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_MUA_MOZILLA,FREEMAIL_FROM,MSGID_FROM_MTA_HEADER,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-oln040092011014.outbound.protection.outlook.com [40.92.11.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E71B7F8010A
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 15:21:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E71B7F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=live.com header.i=@live.com
 header.b="XreVNChW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWWUIlkWEojjDbQuh2QvW94CsxLatZfBNvsoER/YeMhd/Vv5UBcUAtUbbZy/n89NZNKLi7Yh4hsr4puUvR05al2LGM1YnYt6n9/qAHnJBBH68XaMiJbB4WuKaacQ1HhZJ/miwM35iBCeZ7t+UEqRY5VSglX8OsOTAGHXylEH7DGNWo12UpR7bLFyrqp9qbmDYVR+uo+BBdBhiNvbxnCrogjMIfit64UYdolWRwPTEFu57WwYISQQCV6xU1GaBaFWCvviggehNhjPTcbUXsi560Hhz/manOZSEQsY7T3GAPbkf3xi5QFMnITJHvpkgZHIFihi035yrHpuUDJZOe/eNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cvq5dyRPz/uNdaZd3X4ZsEXWLleQBKmNZa3JHEEAJ1Y=;
 b=Cgux75KkA7bqSaGo/QRYt6ZzTWzGJKgAkCmj05sEGnlOxcK5TcXyJ4EWuVCAOPgtADciAnY7//aJ62qKn9N0o99QcN2jvNMDqqNwHVhsmzBhtp8NOoIP3p+zYE9tlqZhSjM2VQQUDsp5iZ/SX47cyVxjBY8bAY1uvP1t7YicCQylLeG/kPfL7pfndRrCfIueS8ozbSK4gxMD6235KxjI+R9IfIFpJ9v+5vAvtxcSh8Ljrg/uehUCvHlU1c09wwFI2DSDpZqUtsZNOxNV7vCCx4QBLRtwY4+KmYke85yN9dcarThPyhZ8VeMbpm99nsSof9TFPGsVNkuIZNqttzV31Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=live.com; dmarc=pass action=none header.from=live.com;
 dkim=pass header.d=live.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cvq5dyRPz/uNdaZd3X4ZsEXWLleQBKmNZa3JHEEAJ1Y=;
 b=XreVNChWfZlAqukYSxBoR0vYjjlDKkHbIJyYGJDd2fpn5IKdg3xELYo8/Sku4XPYJ4KGlOcWYrfQ7bSmIUZKtCe65ymloaYm8SG2xek1gvnN5v6A6ox/4a4Tgh40xKDRESpfmTyjLwHKqqlXbZ6hgRryFanpaPnC5Z87yCohxwOzs8QGIJzVI4oZ/Wn1TZ41U4OleZ/bIS4I3Vlf66yTIU2mE0mp8NLsphqe+Wa63FqJW/uKQKlnYWmhSLzHlxuI149izcM22UPM4/Q4BIpvRV5NOkx2y3joqSZNJJYzHMcy/SV+uGkZ/CEyOxJmOWwo9r8DXDKnn1FSGdd5DN91Ig==
Received: from BN3NAM04FT033.eop-NAM04.prod.protection.outlook.com
 (10.152.92.53) by BN3NAM04HT209.eop-NAM04.prod.protection.outlook.com
 (10.152.93.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15; Mon, 27 Apr
 2020 13:21:42 +0000
Received: from BY5PR19MB3634.namprd19.prod.outlook.com
 (2a01:111:e400:7e4e::45) by BN3NAM04FT033.mail.protection.outlook.com
 (2a01:111:e400:7e4e::165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15 via Frontend
 Transport; Mon, 27 Apr 2020 13:21:42 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:D8AE1E278B3F5DEAF62E8EC017166B6CD65255D617871E534C666568FF18C25E;
 UpperCasedChecksum:4D8BE75E2C9BC46777C09950FC86473C8998CC6BC755D897BE48E177636FC5A7;
 SizeAsReceived:8611; Count:47
Received: from BY5PR19MB3634.namprd19.prod.outlook.com
 ([fe80::e0b0:b753:eddd:d261]) by BY5PR19MB3634.namprd19.prod.outlook.com
 ([fe80::e0b0:b753:eddd:d261%7]) with mapi id 15.20.2937.023; Mon, 27 Apr 2020
 13:21:41 +0000
To: alsa-devel@alsa-project.org
From: Jesus Ramos <jesus-ramos@live.com>
Subject: [PATCH] Add control message quirk delay for Kingston HyperX headset
Message-ID: <BY5PR19MB3634BA68C7CCA23D8DF428E796AF0@BY5PR19MB3634.namprd19.prod.outlook.com>
Date: Mon, 27 Apr 2020 06:21:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0077.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::18) To BY5PR19MB3634.namprd19.prod.outlook.com
 (2603:10b6:a03:1c2::25)
X-Microsoft-Original-Message-ID: <49378903-8f02-76d1-14a8-ffab7300ed02@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.102] (76.126.18.149) by
 BYAPR11CA0077.namprd11.prod.outlook.com (2603:10b6:a03:f4::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.13 via Frontend Transport; Mon, 27 Apr 2020 13:21:40 +0000
X-Microsoft-Original-Message-ID: <49378903-8f02-76d1-14a8-ffab7300ed02@live.com>
X-TMN: [4SJ3UWaVfxwn9p/8a2AohPP55+qvJqU4]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: e02a0d02-fe3c-4c82-815c-08d7eaadebd8
X-MS-TrafficTypeDiagnostic: BN3NAM04HT209:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1yKf4RE57tA0Z0supN5OJT1GzQ3WgOAfRPSG3f6iS3nkMcO08vBve/zLPLHUF8D054Mq/P7m4M8qiT+ZjKNE39ZkMxDyhx2fmHWVHCcl0/FHxnai3qCXsL5LLUjFjbxScVMpDmyK0djf+BEh+lImGvd0oPEDkMPBlu1WWxGO14v6Mb8OmCXsUA5Qc6vrPBEvpUiUTbavuGnocDwClTlibw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR19MB3634.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
X-MS-Exchange-AntiSpam-MessageData: 8nMiHcRs+a7m6l7eC07fAAxzV1UpY2n2DAjEpPDlpEWdOT7nZ62QjjWp90frmQ1OTjLb+E3wq3IZQ5W8EUul+Et8F0I/engb+t85YFA+5hwlwooE6r6H2LFo98KqCNeBB3GPBBoxxMsGCjE1XbSsyw==
X-OriginatorOrg: live.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e02a0d02-fe3c-4c82-815c-08d7eaadebd8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2020 13:21:41.6403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3NAM04HT209
X-Mailman-Approved-At: Thu, 30 Apr 2020 18:53:43 +0200
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


Signed-off-by: Jesus Ramos <jesus-ramos@live.com>
---
 sound/usb/quirks.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 351ba214a9d3..0af54728552c 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1636,13 +1636,14 @@ void snd_usb_ctl_msg_quirk(struct usb_device *dev, unsigned int pipe,
            && (requesttype & USB_TYPE_MASK) == USB_TYPE_CLASS)
                msleep(20);
 
-       /* Zoom R16/24, Logitech H650e, Jabra 550a needs a tiny delay here,
-        * otherwise requests like get/set frequency return as failed despite
-        * actually succeeding.
+       /* Zoom R16/24, Logitech H650e, Jabra 550a, Kingston HyperX needs a tiny
+        * delay here, otherwise requests like get/set frequency return as
+        * failed despite actually succeeding.
         */
        if ((chip->usb_id == USB_ID(0x1686, 0x00dd) ||
             chip->usb_id == USB_ID(0x046d, 0x0a46) ||
-            chip->usb_id == USB_ID(0x0b0e, 0x0349)) &&
+            chip->usb_id == USB_ID(0x0b0e, 0x0349) ||
+            chip->usb_id == USB_ID(0x0951, 0x16ad)) &&
            (requesttype & USB_TYPE_MASK) == USB_TYPE_CLASS)
                usleep_range(1000, 2000);
 }
-- 
2.24.0
