Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2FD1F7BA9
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 18:33:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97FB11681;
	Fri, 12 Jun 2020 18:32:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97FB11681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591979624;
	bh=c7zag5jijQqBkuAREjhv3Qzi84mf/Bd01E2oL1Lr/wM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l0HXQFTMT0bM/zm+vySb2mf1khsJw+Ukuo8DhGN/EaNsHjz5mqruSSBLX5DUVDtzF
	 bx8PSh5crleJjoN4jaQAI4KqBXFLyErBTNzfN+xUPKQyQ3WTvoSp35Z44VeJsI5odV
	 bquM8zXhAFRxEugfoZjf4X8pElw/Xx0nKI7WtruE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAFD6F80228;
	Fri, 12 Jun 2020 18:32:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CABFBF8021C; Fri, 12 Jun 2020 18:32:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B040DF801F7
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 18:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B040DF801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="osPVkyY/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxuUZ6daiwQDdxwjUiIg4iXqjYs8YvYBYF36j9W+fj2GOOxOK6BZE/Hriw0hXRYtNpfJgfc36nKGv3gp8Sjryr1SRTT2AZQWRuWt694P5/N88Law8KjYOZyTLXpkjLC3DEyWr0v09++jEADWIzbfYHIYQh8ZVDPO0VjKIKVi9wuVU6HyIFT9de/DOKll3eeZB7/TLUT+A9hZ0kV9oejrsWO7jwZZJcXU4hUzN/P1A2UG4Zv6fZmuHhFTcNL6SOGnRtf9yP/uLVbPUT1RXqfiYGbkux9duVM/YWiybuij2OxQsWuiKxsbUhEwm548VrkgpzhMpbtaiTUtctOxAsswZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWYCOq5ichBtzOcLqhLn9mA0IaPvK6Mx+89H2sEAqRs=;
 b=CsH+nKu71+0j+prR/TA/34VULpbw5J0ZGzA+Iw3ZHD4MV2+O16MKfjGXeJyT6MQ9qc3Pcqcx6JsrvkTTyug9v1plsNnmLnPuBjGJTNKoX5sFA3Lu4NbR7Nj0kJNm4KQL1Z6oRBi/kXFe1ihjLfpISDpDSP/I609jlNOLfSk0C09DfzwxwFlfxw2zFUyafQwtwiFZ9NEyFHVokG/4k5Uza5xI6hCUdynJtnMrttTXsYeDPwL88n/1x9Nd92LBCCwQy6m/g3NLKEp60gRe2DhpoOdSbbw105qm4DQsy7dT2Lr7mLhMeTglPZZnh1Nupt4bYdUFOYg2hgOgONgOoF96Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWYCOq5ichBtzOcLqhLn9mA0IaPvK6Mx+89H2sEAqRs=;
 b=osPVkyY/yZH+W0rcRMP48CDg8fItt3xo1BE7fHVbmtGhZmN48DGpvA9w1O7flVi9HZ/qIttU1M5YT9H5b2MLl9xGArjOswhH+BhfQiALyHX3nxNGGmBsy9r373cJey7twpxCsmIM0kPdTmwGgNpu7SXCUFLndW+DYRTATSheF+s=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1337.namprd12.prod.outlook.com (2603:10b6:3:6e::11) by
 DM6PR12MB2940.namprd12.prod.outlook.com (2603:10b6:5:15f::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18; Fri, 12 Jun 2020 16:31:51 +0000
Received: from DM5PR12MB1337.namprd12.prod.outlook.com
 ([fe80::f51a:1689:5079:c01b]) by DM5PR12MB1337.namprd12.prod.outlook.com
 ([fe80::f51a:1689:5079:c01b%11]) with mapi id 15.20.3088.025; Fri, 12 Jun
 2020 16:31:50 +0000
From: Akshu Agrawal <akshu.agrawal@amd.com>
To: 
Subject: [PATCH] ASoC: rt5682: Register clocks even when mclk is NULL
Date: Fri, 12 Jun 2020 22:01:11 +0530
Message-Id: <20200612163111.11730-1-akshu.agrawal@amd.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::16) To DM5PR12MB1337.namprd12.prod.outlook.com
 (2603:10b6:3:6e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from akshu-HP-EliteBook-745-G4.dlink.router (122.171.36.38) by
 MAXPR01CA0098.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.19 via Frontend Transport; Fri, 12 Jun 2020 16:31:40 +0000
X-Mailer: git-send-email 2.20.1
X-Originating-IP: [122.171.36.38]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e9e914be-eb8b-47da-4bfd-08d80eee1bb6
X-MS-TrafficTypeDiagnostic: DM6PR12MB2940:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB29403800A3F1DC975444AFD9F8810@DM6PR12MB2940.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0432A04947
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5I3nuFhni4pPxhajP9ItJfMXf0bVCJGuFfYbY3ssiRApIgOG4cDNgDn+xSmw9C/i+7AmCAzvldDEyNesAoETLjMXpNXVH10wl6WzZ0koqfHO9jAUUK08bWuTRoHPTB6prJN1X8kBlHjnxFTF3wT2XsVzGWwhu8Q7iRkPO7z+EO9I996GoNYM8Vw4KHAU39gFNeg2pgsesb0x/1SMFKYOagwJ4wHzhDbhUcoz8swXWLQUmOqUHhu9qwQMnveFGr5B2ObFHf2m59EJGtMPXiN6wiIyPNaWEWcanmkV0QY6fw3YQgn1/EtBlm1PQSfOI58OIW4w659ZPp04kALSoVE7KDpBy5/OZftubM/kXKCALUWKhqkHnt3GO1tQenffXTEe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1337.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(6666004)(52116002)(6486002)(5660300002)(4326008)(956004)(2616005)(36756003)(44832011)(186003)(16526019)(83380400001)(66476007)(478600001)(6506007)(6512007)(4744005)(2906002)(86362001)(66946007)(54906003)(66556008)(26005)(8676002)(316002)(7416002)(1076003)(109986005)(8936002)(266003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: nNZTm48gi20vh6OGaWXQpRiPN4HYGnourdWuW7J/mkSI7DH/hnHHUdigdb/+sdDczfwvr8zhHkyyHV/nirjANz7WgOv0d0n/lHdOjJrz0ZKutSileBJm0eo/SLRfWoPugoTl+SVaA/jpZqbYjMQmWP5HJPhC7B9iR91Q4/P/ahfxJs0hYJEkiyTtcbsgj7CXJAhAo3yJD8DAutC5j5eBYWx5nbIA8QUfViTD9B6Hl1Q34rqpDlx+CUl4MBoRVbPjRy03u7UCjbaJnpldM1lavQrobm4g5Jgx+anzUASAaD5TKjPx19ehD6yI/dlaEItHd/VOeE5e8BGmwbFp8AwZObd2ZRQyZsyjj4y8+CGSvLrhHIaAPLbK2Arrt3kmH8M4ySzJAsR3RPp0VU3rZ3qDKEEyDIXG3RFS0Jot3dcbGqJbaVfZMrDoVHe7ixt4Mi4DY54Qx30EDxTIY+6c/AouAQMNS0VT51KUh6/dunvXbbg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9e914be-eb8b-47da-4bfd-08d80eee1bb6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2020 16:31:50.7860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hbosULiYIpiCcKiQpJWLVVrAjD47Dwy78e8yaqbmD37T56gKzhJ/Y2Qgk/36fXyRwklZesjKHFCfEjSM4m2ADg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2940
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 yuhsuan@chromium.org, albertchen@realtek.com, Mark Brown <broonie@kernel.org>,
 derek.fang@realtek.com, akshu.agrawal@amd.com
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

Fixes kernel crash on platforms which do not have mclk exposed
in CCF framework. For these platforms have mclk as NULL and
continue to register clocks.

Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
---
 sound/soc/codecs/rt5682.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index d3245123101d..7c8b8d839db8 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2829,12 +2829,11 @@ static int rt5682_probe(struct snd_soc_component *component)
 				return ret;
 			}
 			rt5682->mclk = NULL;
-		} else {
-			/* Register CCF DAI clock control */
-			ret = rt5682_register_dai_clks(component);
-			if (ret)
-				return ret;
 		}
+		/* Register CCF DAI clock control */
+		ret = rt5682_register_dai_clks(component);
+		if (ret)
+			return ret;
 		/* Initial setup for CCF */
 		rt5682->lrck[RT5682_AIF1] = CLK_48;
 #endif
-- 
2.20.1

