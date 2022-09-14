Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9B45B8683
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 12:40:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66B3B187A;
	Wed, 14 Sep 2022 12:39:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66B3B187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663152026;
	bh=f2UHmuNVErCtDLkqW3Y5GWipQpVL70rFdIvRxho7LN4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BALH/BLgdN9s0qbhoEPPTr3Tqp+4RAFIg7n0zKuuhTA7r0twHjiMyoDlhGCQrW/X8
	 DbNadrMAxcGDHH8bdB735DibNuovyiYeTtxQGiegSw7gh6izGGgWeCVW6upwlkvEaR
	 0/Dp6uGGtUbvgIEnj92BrCDOAaXijkIavOz+pFV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D992AF800FE;
	Wed, 14 Sep 2022 12:39:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66627F8008E; Wed, 14 Sep 2022 12:39:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=FORGED_SPF_HELO,
 KHOP_HELO_FCRDNS,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-ps2kor01on2044.outbound.protection.outlook.com [40.107.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B4C3F8008E
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 12:39:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B4C3F8008E
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJC8MXUjGVcTfZZooSsRxAVPc2cPqgfVvFpxtSzYVuIWDKy0fKgNeqtId59tWWze1lflXQ41v4XFRF9DFQRBGTG3eMG4O+LfLPrbcRn2I3go4BT1B4tMr1y27eXjUdQfgtx3HhAICbqdLa1sgKZe9frNxT/8wNwhsQEHfj408B8HFoQxydhpBorAFrcZLNmte0fYWXg1XNEOY2RHTiTsqw9ujRT7LribyqH+Epl09tByDtO8USu+Enc8PwBCyyUlonWSPh0wu5w4d0MrAWY1rMcYD9wHGA7+Uv0cpv7bBFH50CMjFYfve2SAXn3WFzXuW/b6FCJ1Z35G+SKt0SSHdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NJC+afmHQRvz5u3nqosAaJIZAqVb1tcIWCy3B72B7I=;
 b=iGGQ9SFEddVx9TcXq9NynQkojoHg4IcWfeWNUziw+Wmw2YHJE7mwRKCh7zKvywAet96QRK3KirDGAny1vJgQxJMtUVfZjP2in2uYF3jWRLt3POLu5KnN/VQxVzHfkeoJ6FngLO2ApazD7hhBW5AYrjjalXTNjPhV6IxBzKooMLzk5+I6v0aPHsqXLmN/3WQEhKtKjcvQb11xFipL/nCM5jk4PlUOA0/xZPyZn3q0vEIwZ6GBugFRzj6ZBsPmFQ2R5qKF2ye7koAsJ5tcWjvc7n0gDdEg6Q+aG26TPnJH6PD3moIWNijk66ZCDg8CXiWleoeB76p96JWtcFe6w7PYHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 SLXP216MB0430.KORP216.PROD.OUTLOOK.COM (2603:1096:100:d::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.20; Wed, 14 Sep 2022 10:39:16 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::c0c8:be70:d34b:6dd]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::c0c8:be70:d34b:6dd%5]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 10:39:16 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Gyuhwa Park <gyuhwa.park@irondevice.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] ASoC: Add a driver for the Iron Device SMA1303 Amp
Date: Wed, 14 Sep 2022 19:38:52 +0900
Message-Id: <20220914103854.11351-1-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0177.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::19) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|SLXP216MB0430:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c741d1a-44cb-45e4-f1ea-08da963d5f2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MZqo/NBWID6QKtXj0o5gj4SK0N2bmWdUilZg6HOyr799zK5KHQ/yZZLztII5ghMPGAxQJWFSaGXyLcXqLC+3lokNZn2/YntnS9gQe0/i+dK1NC1DA5t63FqqhW50AQSGFw6Ph7WVds/+ptTp5yR/QGkSSczTVdNML3IGJp6MKgmUYdbK3e8G0UoYDzb0tWzDuRRWpLruQVfZmXHp+/XViFmqvaicuClov+ge6w1rH8Yt5OthoggwVtYahFSTy5g4aH+aXsXa5Pl+lNKjrYA6T+3WKxh1ybmWVzp4x/WKclYl3BTPoGHsZ/i9wnZ+rlM8qMuIkf3qZk6J05Pe+/dMsfGwmOJe70GNZZdrDnBFiMj8V/YX/hMJOvQvg4H5CQpwR11lcIBskIAHeV8+Wk3WyK2wyfrjAH9ZKE12v1zjwPWR86CK8kn6dNR7rB+JnIOgjOxuA4uWJXkdQ+pVXTCcE5/uhDlw5U1yCok1VR42bYwV9qkdd12Tn9AVqgxxuQOoV0bHL79lgi2HfYmcZuOuDNMsWY5HbuKGZnM5KF5b2scwQhc8TO9oqhTqDQxLZkldiSVqq8kSgbtY07Ew5iVkm2Jd2cyO75nldZqznLJTker+FJ60s8vdRGnUhJlk1NWensWwu6+yqvvgUMwR969I2QkGt0zVou8EnBc5b8kjinriBmFe+93/t+WRBRlJ3Cw+6lcTx+yYpreRKaK8D9RByy4SzUu6yM7KZuB5Ju5ubtWsRHSWw5twWhhFpKT0E3VCzmibKKohgTaxLfv6/+t7Wg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(39840400004)(396003)(376002)(346002)(451199015)(6512007)(4326008)(316002)(66946007)(2616005)(5660300002)(478600001)(38350700002)(6486002)(1076003)(38100700002)(4744005)(44832011)(66556008)(6506007)(107886003)(186003)(26005)(36756003)(6666004)(66476007)(41300700001)(8936002)(110136005)(2906002)(52116002)(86362001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zYKjEJqWRCKoXU/n2MsGeNYNMgjgYOGZVduTHHqSm60O8ly66g4Baj7l4SRW?=
 =?us-ascii?Q?XNDWhgCZZ1CqVOFfZJVkodx/rFdbEkuiJGFpEWwgGKKpmHRUjhrS46MVo3rY?=
 =?us-ascii?Q?jCtI5jRVJD9YLQO1pG5qyB3RJsrTug307esUwuZibDaYtLf8K15NysWcmGXG?=
 =?us-ascii?Q?oEdKWMU0YJOBmf5z+D6rArKvFvL+qvGylTz+w1vuPpjY2ThZ2hGozHyZH0wS?=
 =?us-ascii?Q?nd2UnHsmlSWtqYn/gkWh5Tn/t/io2ZTY6y19ptIEY7qz1vw6rAPBzaqceb0D?=
 =?us-ascii?Q?rVOO0dh2Ht7ma45y8HRF1z+XmL/ag/3Je+lusDfYrEn2LOVDIo5WidZTW+wc?=
 =?us-ascii?Q?ZmXyQRmJBXEpE6u5zjwoPvGXFy+pgCp5u7l00ESZ7pCzYYNyV/Z32Q9jmOvW?=
 =?us-ascii?Q?h25I2vxsvn6uafCd93a9EeQ2J3hukXDt8JYzc3hZTPotbvWYeobTzsFhL11q?=
 =?us-ascii?Q?Wf+R5D1Okt8GkpHM+FrGQGSIjXjnZIbAnTXj6X751O4JrhIoZrXUkMmvdARC?=
 =?us-ascii?Q?jh7CF1ZVtDjUhGPtuJxXKF4k/c6Pk/AX+9tocH2SL/iqP18oKQ84A/UXZbIf?=
 =?us-ascii?Q?+TTS+R69G9NQKKC2E+nakJM2A41fxOj+eRh/J5tdbynMXj9fiXNyyMl2hgqD?=
 =?us-ascii?Q?fCbRaH4tAGQERN5Wys6tnfbm1Zm8QPDawdwRzonANR5/1NgCx83SAh7HCiF4?=
 =?us-ascii?Q?AvcsdT1MAEdh0QOXNGGDyk4ds6PbJt95bxh3+4LbxHW277JbQaeEJqZ7fDvW?=
 =?us-ascii?Q?nAEERqsHPexwQ6Rr0RrM3d88IhE/48IYv8AVo2jh0969kx4JsaHFZ6wHGfQe?=
 =?us-ascii?Q?fUahJWlXQAd0/9ugH8zeDo0vSSyjz0p0T+qY5oXyxjDTpHSeJmcJdUI3fiqC?=
 =?us-ascii?Q?rqFiy2DHHkzPeR92gzlsxbt61qukC9cj+WymI15J2khwXv+Y6oQ5Vt01weQM?=
 =?us-ascii?Q?8QOO+0FTsWQpOVFSHmM+HUB3Zmd65NbNPjljzvsTWZ9xcMSO/oZPBK53ZaX8?=
 =?us-ascii?Q?h+L12PDYRMR14EcfN8ff8KdvOO5PNprgxhPqjuq/Wn1JhciVOndLGvXf+Mwr?=
 =?us-ascii?Q?xOSP2x6kmBbOQ6r3dJQ7VnVQq+CbEMgEWlIIBc5RtgJNFOQdDsxQiIBSaAbw?=
 =?us-ascii?Q?JVjgGwcdpWKeP8Xxl9orIj6nVOruSYCe91fZuBMu+qaSXwXii3TPBIDlyPPB?=
 =?us-ascii?Q?tooD7SaVLjC684SGgTOOK64VglL5ZuVCQDnHgVSI8zWQwY0NVPsTrBX7NBQG?=
 =?us-ascii?Q?kLJsj1YPtauC1RGYnszLFzfzVKbzLjYTM8EkrVzEzTVj1/pxRWGg5SqLXoxO?=
 =?us-ascii?Q?ub5B4heFdQ2n+bqPu1E3ycwTPw1/UdmLIIFcGrmgweJ4l6b5gNB/jTcwLO+7?=
 =?us-ascii?Q?U1lRzEstUTl9eQiuMCFNSetuRnx8R/TNaVzNJU+/Tld6OH7Gw7+RTdR+XSOm?=
 =?us-ascii?Q?JN/bANr8hsof2A8jFEYvDr2UQeWNZWzgRHu5fgTXwbJblf8EuXgt8gtaeT+5?=
 =?us-ascii?Q?j2cmP29dmLQHzFDtuTyIgSr89AUlcWn2qw40wyMJ+clXkWmndsTZpCzmZmQA?=
 =?us-ascii?Q?yF9hA1zsL6cajb74bgqA9rGz0BTGuH9Xkm6XPetN?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c741d1a-44cb-45e4-f1ea-08da963d5f2a
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 10:39:16.2823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/1jk69zYY9tJvbMNvGTF/ScQqEHqh5yh411/H31YJ2jL8f0WiEcHhc9lbfpdOyCk/lsA1V/OdUKbRk8lRKZIlhqeXPwdrWuijVe7Fn9JiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SLXP216MB0430
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

