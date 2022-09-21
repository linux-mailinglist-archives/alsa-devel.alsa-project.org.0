Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1115BF58E
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 06:45:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABAD6857;
	Wed, 21 Sep 2022 06:45:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABAD6857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663735550;
	bh=f2UHmuNVErCtDLkqW3Y5GWipQpVL70rFdIvRxho7LN4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oNXrdbyMPPz2o/hIdu/b/up7wHLu75cX2MYCq2sBoa/JQ5J3Z3LIA7a2MxivSxWKI
	 YHmSr957avf9pA/drkmSoZ/GChUndiz1pNiUYZkshy0QIeqNx95RWFGO5ax2pFxafo
	 fgyuz5AgCbJ0AuWz4hMlDewsywUtNr7nyCVoYTfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14259F804C2;
	Wed, 21 Sep 2022 06:44:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FE58F80425; Wed, 21 Sep 2022 06:44:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-ps2kor01on2055.outbound.protection.outlook.com [40.107.128.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81D30F800C9
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 06:44:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81D30F800C9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQevUDI/l/qiYeWqpk8EJysgdPg6m8gyImRur/WepHnEStvRSCrG0klSYex0XF6kkzfqT4qozlXcizGjVNkc+hhO8GQVfLBmfxuoGwM4dl03Mdt69xbgbJLkwrp9bBpB5RYLzlUpvwiFd61xojuFDrea/yBt/kvJxwyZCFMaowbfBc3fOolbyssxcKrzIe1ndu1qOxB2yEknMMhUWDps3GDb3YXi8TSh6YnmeijEjg1aaUbwCjYZs9H42HfcujkUY45oT5k3aW0ogU8g93hKAz9yNlXHxMuwa3WfW4lNxDZpYMzhUHy/5RF52iCNaiXYKRtpqMwbfSB0Fk6gK+fUsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NJC+afmHQRvz5u3nqosAaJIZAqVb1tcIWCy3B72B7I=;
 b=GVpI0YSAoSQk/ljBIjVIpdOYb7JD3De8YTf7dMv9Q6zeLsDIj1ma14bOen7TPA5eNcgeB2/ctG4c6+NVWkzYJZcRIDatlYbFvbR7yuuAfKRnrCC0Q3319yzPFZ0dKlklosftMGWRIXjg7I/+SVTtaabAVcklRN/ZpNMm6Xe//XUhyxPKkiOsVQdf/j4AyRDgrNN2NYYx5Wk26NkVVuNlNaLvw3ehRMQhqUIHzXFtR0kY0bZIDpwO5DQSSS/WovX3JttjY3QRqPRi2uIgVx2K+J9ne085DnGUW90fQS3KigYm+UHYxYvWV9yj/OHdBTsTSgwcfBlrqNBIZt8hkNIj2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 SL2P216MB1564.KORP216.PROD.OUTLOOK.COM (2603:1096:101:32::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.16; Wed, 21 Sep 2022 04:44:39 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::c0c8:be70:d34b:6dd]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::c0c8:be70:d34b:6dd%5]) with mapi id 15.20.5632.023; Wed, 21 Sep 2022
 04:44:39 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Gyuhwa Park <gyuhwa.park@irondevice.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] ASoC: Add a driver for the Iron Device SMA1303 Amp
Date: Wed, 21 Sep 2022 13:44:03 +0900
Message-Id: <20220921044405.4441-1-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR04CA0023.apcprd04.prod.outlook.com
 (2603:1096:100:2d::35) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|SL2P216MB1564:EE_
X-MS-Office365-Filtering-Correlation-Id: 1578998c-6bf2-4ce6-ceeb-08da9b8bfd9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RkJ8AYtyRdTcKMSgbZA40vwSlYgezC5oY85rnJLPXjWoCjdbuVux5BJY89IVfR64EFPVCyF9pP9oM8+sQ0igeezJpy2EYh7AF3Dq7H5K4jiY5cILHsWoW/sVqCaW3V5DxACPm086/bI5aet/AaH3CbpvAb900CIJpxxbmZ3yrLr1tYh1wC7ABLMyry/j8bPU4DQOM6DcUcoHyc2IvC8P4NFVxtM2/OBtFfxnfjZNgGVhwY9OBYDF0TDtC2wL411DN9nC62Dv87yJ1qk9PbdyvofXKxDCD5t5JN0dSKhi1pOTbe75l7NUwL7aRlEgNHjEKLr+QwyM7AfhhsNnh9m7PRyyMemOaHX89LOnAvivIvlnGAlOJsgDig5AY5RQd9ZqIWmnv9bIlQVLCeNo+yHf91r5oRE9JbL4wtxX6kF0JQ9WuifvUw/fU1hle/YlbvnsPoG1q9BenAS5RxwdxfYQQOq2TM+6QMkxGxkt044IROilZyHuCxMxK9pa/7Z87wvT2uCY1LIQcADwhuXSnVBbgx09uVKiu8FKHgMrf0U5RE6WJUWZokQUNCB2T4F+/lcs05Aan33Drv8rTYQXnHxWgvg9yw/hIhn+VtX5Vtz2jMnLT9zQxxP0zjGE/OoLgbzW0WgsbXZ7DQBxKvILAxXzbbrIpIw3H6/GlEUhBSNge1RfMwOV8+VG9v5mlm2xxGsGtvU//8P2UGVva5e7nOaZu5beGafaogEbfxFIMWq8AMDjfDJugC/OFHKz2OLNr58o
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(39830400003)(366004)(396003)(136003)(346002)(376002)(451199015)(2616005)(186003)(52116002)(2906002)(36756003)(41300700001)(1076003)(6666004)(107886003)(4744005)(86362001)(44832011)(38100700002)(38350700002)(8676002)(316002)(110136005)(6506007)(6512007)(26005)(4326008)(5660300002)(8936002)(6486002)(66946007)(478600001)(66476007)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wWMzfGcWDN53W/cfOON3esi6H+6eP5kHGGjoGJ5VGN88DlR54ve7tmIGL3jT?=
 =?us-ascii?Q?0qZV0sywLowPxO4zD42NH2rLK8NA/GMWojoef53SKXfMNb+dQoFTKxVUyh94?=
 =?us-ascii?Q?Cxc9PH1NX2xeDuWiWHCwEFuLwfc5yhc6ZfIY17cpkp3nTxu1M719yjcspKdv?=
 =?us-ascii?Q?KDTK1sxVzVWtbI9JMjpEoI5xcNJEC7VpLeDWY62I8T1SlGTMmakdgf9jv09A?=
 =?us-ascii?Q?TBYRH/Wzt+sxat2/PSnPvRKjp6RUZJS/3LPnwDUnpVWoO6uFZEZA8wMgZmfF?=
 =?us-ascii?Q?BE20g0Wp94/dPLQLrLFE5DgKBv4CyVQt5B+3hNJjxaImfbrS8qbeh/RybP2H?=
 =?us-ascii?Q?OOWj884RA2mCv6E2WS+6vLyEQI9KJCfHVusaDaegFXhilYuvK3+tLavznBSM?=
 =?us-ascii?Q?u9sL4ld9Wxly82JTWXSxtkmqxIIAPigCf9kYxpI0CdohTcgVaK0AMBh6s0zY?=
 =?us-ascii?Q?9WJOgZ6NNIqFoq5VEWWNw38/zi+512S/VFtaut3ILAASAD0kEP+3NAfjxx/g?=
 =?us-ascii?Q?QS1ob0YOV+q3AhaaEqIIOuy0Oh5qpsOnadOIk7JxCT3FinFPq0GrAWarjThK?=
 =?us-ascii?Q?Io48/OQ64kphj0R4M8+RIZZDzE2H9BB8dgvigBHr1ZHvxkjG0FAuEyEg1eUZ?=
 =?us-ascii?Q?rhZbCyhy7i5qEKUeRAjnx0IHrv1i64Z/1gmJmtOdZPya3eX5OjJ32Jl7fsGn?=
 =?us-ascii?Q?yeKO6seR40YIzx0d2SkMsn0dRo/kK6OgWeF6tXE59jG2Jva6IQiVcJjM5D9b?=
 =?us-ascii?Q?s2JVKGVY4NYiCIOu+ZxihziYHVC56bSCEdFKdU/VuzYkY1Iy9FaVTRUWq6T1?=
 =?us-ascii?Q?pKF65Vcv07fxNdO5pUmw9W19qeYlZjDP04p7CjmA1Xez8MGobkjaAYppkeR/?=
 =?us-ascii?Q?fHCGgP+eSw8k9XWxT4Z86Tv8vENTdbZoL2WPoeDuJpJq+Hk8CU4pXBDWVP99?=
 =?us-ascii?Q?FshGVnUhwt8qwpAAMVfyNPzpiWwhZ2e31HymkKU5eNY7BEcvwPKaMCmRydXj?=
 =?us-ascii?Q?ybt1di3J17OsxIDyvcpI5RwbPZgpLNmhORx7E/5Q/MA6hlq4bFcFSwScJDnl?=
 =?us-ascii?Q?dgZxJTWhf4b6OZ1S8/QGDRvJTeq5UQzf9WTuPRkPWbxtyXOSag+XTtXG3Z8L?=
 =?us-ascii?Q?3EWww2Uu1dD18ypbLpVBfLOketYLPJh6tBanJEIktQZ1Hp87BH72oHpyrrkc?=
 =?us-ascii?Q?4RHnah93O4hdvh3Es7Hodc4EdziqaCOujMXGPZVDFl+kdgwkUQxNicgYQCBM?=
 =?us-ascii?Q?cEUDVZbeIYoTtEijfsVysQ4zERN5hrMCKmXEJO+zQxhLzqO8WfLb+MdEsjPh?=
 =?us-ascii?Q?Lj6Q9WsXDtXiE8d29lCi3fSvfxSa3mOuUQ2hT+xXTTX2quQ3nY4aIjQi3W/P?=
 =?us-ascii?Q?fuPIKMHt6v9/u4wLdvE95MGfpT/PNu9ceJHgu3r5asDjxK1St2YmdcKpgXT7?=
 =?us-ascii?Q?ZSyONkKQRldhYXSHU9uVMcGzA7zsxILLku/VsWuk54gb3cimuo1HSv22pH91?=
 =?us-ascii?Q?2p1SXHnJBNxlh0f6WZh190E1oRDLE8ntU/uxLqM+c9DxUQuh6mrbBXZWH755?=
 =?us-ascii?Q?F1t2tSRAz8NcSlUQvbZWh/ugQuF9Kk39M2ERuxW7?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1578998c-6bf2-4ce6-ceeb-08da9b8bfd9f
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 04:44:39.3120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ka8CjGW4sxwJ+b5wo0L6DnSDMzT23m4m5U4Q4JKztkkkJGfGRGkKl4Z+q4HRG9EOsuGj7aX5VpYQkDUK+eIQVbX0N4Ty994TrOBmAfpf0s4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1564
Cc: alsa-devel@alsa-project.org, application@irondevice.com,
 Kiseok Jo <kiseok.jo@irondevice.com>
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

This adds basic audio support for the Iron Device SMA1303 amplifier.

Kiseok Jo (2):
  ASoC: sma1303: Add driver for Iron Device SMA1303 Amp
  ASoC: dt-bindings: sma1303: Iron Device SMA1303 Amp

 .../bindings/sound/irondevice,sma1303.yaml    |   40 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 sound/soc/codecs/Kconfig                      |    7 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/sma1303.c                    | 2119 +++++++++++++++++
 sound/soc/codecs/sma1303.h                    |  609 +++++
 6 files changed, 2779 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
 create mode 100644 sound/soc/codecs/sma1303.c
 create mode 100644 sound/soc/codecs/sma1303.h

-- 
2.30.2

