Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 183032C982
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 17:05:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6325B17FB;
	Tue, 28 May 2019 17:04:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6325B17FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559055944;
	bh=FLO3Obdnrgzshypah5TYcowrP/Uk74MIPXzHhu5hGfI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XQJIYHoMAHQ1RPq3xbXYPsE5OGlG33IRYM3lhlt8rMSmlGBcOGbq5xF5V6Q92yrZY
	 znQi9LsFn8rWxRFw/stzB/CrHydyfgZodxGa+9u2hSkUyaTwilIBNBVbEGJbP0XiJ9
	 3dsit74CLj6mn87yTKs8g+GrGHCPeoYGdNvcT/cg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4A37F896EB;
	Tue, 28 May 2019 17:03:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E34F8F89706; Tue, 28 May 2019 09:40:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740047.outbound.protection.outlook.com [40.107.74.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3CA5F896B8
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 09:39:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3CA5F896B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com
 header.i=@analog.onmicrosoft.com header.b="Hq4eM0+Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWdImhCfyTIUCYzNfD1iIQYARnPSsxhTsT74g8CuXY0=;
 b=Hq4eM0+YUiVIoYHYAGGuEpOyjhWPdcPFHxn0lkng78s7kuN0jDXksfvZQE0kEOvNPTuar+4Cwfyt9c47tyog14C+ba401xryJ9s5hnJiPDekCnghCGKZj4HeQKs4EbPbnH2B4kKA0p9wn6It0lmbB4CJ95H2YYd7PUpoLM2vyVQ=
Received: from BN6PR03CA0012.namprd03.prod.outlook.com (2603:10b6:404:23::22)
 by BL2PR03MB545.namprd03.prod.outlook.com (2a01:111:e400:c23::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.15; Tue, 28 May
 2019 07:39:47 +0000
Received: from BL2NAM02FT030.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::202) by BN6PR03CA0012.outlook.office365.com
 (2603:10b6:404:23::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.16 via Frontend
 Transport; Tue, 28 May 2019 07:39:47 +0000
Authentication-Results: spf=pass (sender IP is 137.71.25.55)
 smtp.mailfrom=analog.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=bestguesspass action=none
 header.from=analog.com;
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 BL2NAM02FT030.mail.protection.outlook.com (10.152.77.172) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1922.16
 via Frontend Transport; Tue, 28 May 2019 07:39:46 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x4S7dkpQ023241
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 28 May 2019 00:39:46 -0700
Received: from saturn.analog.com (10.50.1.244) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server id 14.3.408.0; Tue, 28 May 2019
 03:39:45 -0400
From: Alexandru Ardelean <alexandru.ardelean@analog.com>
To: <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <linux-ide@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-rpi-kernel@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-pm@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <linux-omap@vger.kernel.org>,
 <linux-mmc@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <linux-tegra@vger.kernel.org>, <devel@driverdev.osuosl.org>,
 <linux-usb@vger.kernel.org>, <kvm@vger.kernel.org>,
 <linux-fbdev@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <cgroups@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-security-module@vger.kernel.org>,
 <linux-integrity@vger.kernel.org>, <alsa-devel@alsa-project.org>
Date: Tue, 28 May 2019 10:39:30 +0300
Message-ID: <20190528073932.25365-1-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190508112842.11654-1-alexandru.ardelean@analog.com>
References: <20190508112842.11654-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(1496009)(376002)(396003)(39860400002)(136003)(346002)(2980300002)(54534003)(189003)(199004)(70586007)(70206006)(2441003)(8936002)(47776003)(7416002)(107886003)(316002)(2201001)(8676002)(14444005)(2906002)(2870700001)(86362001)(356004)(51416003)(6666004)(7696005)(26005)(305945005)(7636002)(1076003)(478600001)(36756003)(4326008)(110136005)(2616005)(126002)(44832011)(54906003)(76176011)(48376002)(486006)(476003)(106002)(50466002)(446003)(11346002)(186003)(50226002)(7406005)(426003)(336012)(53416004)(5660300002)(77096007)(246002)(921003)(1121003)(83996005)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL2PR03MB545; H:nwd2mta1.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail10.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c76f02a-34d6-47de-ba0c-08d6e33fa89e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(4709054)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BL2PR03MB545; 
X-MS-TrafficTypeDiagnostic: BL2PR03MB545:
X-Microsoft-Antispam-PRVS: <BL2PR03MB545CA0A06BB0E64A1EFBE91F91E0@BL2PR03MB545.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 00514A2FE6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: WYQoPPTo42AknDYSpY9w/xftF7FT7SRtXtbzi4SohjgnHD5P3hVPp3WTmUFaLfcDpBMThORg4NphooGNDC9igOh5UCY+z/qJehstorHN6dXF0JXfvmEyhD606e1CCgn1vUccxto/xRVdXdjRcRHavbu1mYcyAlmvTmEDKuQrxdfC1Vrm8H9/tkgoumu/npzY4P0Eyoj1Hwx3z5/P2OctimPreVyglKaTNX/j7lM7XosmVhLrWYt/TLXycti79mDqjngT5xwxZMvszzx4GLzrMAGI+oe486mPjGQdr4mkGPORfalJMEV5ae4/UIaivCRaqH3nuCzPeZes99dzedzF7DJd9vUvbhN8XxbI4NVjhC5LKkww2k/x2hqF8pFkOcddaQzB5rfbyVzu+jJvUQ8J9ZT6v/eq/Une//VX7JZ43bw=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2019 07:39:46.9658 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c76f02a-34d6-47de-ba0c-08d6e33fa89e
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.55];
 Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR03MB545
X-Mailman-Approved-At: Tue, 28 May 2019 17:03:57 +0200
Cc: gregkh@linuxfoundation.org,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com
Subject: [alsa-devel] [PATCH 1/3][V2] lib: fix match_string() helper on -1
	array size
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The documentation the `_match_string()` helper mentions that `n`
should be:
 * @n: number of strings in the array or -1 for NULL terminated arrays

The behavior of the function is different, in the sense that it exits on
the first NULL element in the array, regardless of whether `n` is -1 or a
positive number.

This patch changes the behavior, to exit the loop when a NULL element is
found and n == -1. Essentially, this aligns the behavior with the
doc-string.

There are currently many users of `match_string()`, and so, in order to go
through them, the next patches in the series will focus on doing some
cosmetic changes, which are aimed at grouping the users of
`match_string()`.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---

Changelog v1 -> v2:
* split the initial series into just 3 patches that fix the
  `match_string()` helper and start introducing a new version of this
  helper, which computes array-size of static arrays

 lib/string.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/string.c b/lib/string.c
index 6016eb3ac73d..e2cf5acc83bd 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -681,8 +681,11 @@ int match_string(const char * const *array, size_t n, const char *string)
 
 	for (index = 0; index < n; index++) {
 		item = array[index];
-		if (!item)
+		if (!item) {
+			if (n != (size_t)-1)
+				continue;
 			break;
+		}
 		if (!strcmp(item, string))
 			return index;
 	}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
