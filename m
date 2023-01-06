Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F9065FD66
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 10:17:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1491819F;
	Fri,  6 Jan 2023 10:16:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1491819F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672996622;
	bh=/db4cN7GJDX+STfjJLPSOSLtbmaigc8aQsJ4tPgiYqw=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=uCxwkN4JKlnD9IaasNqelFa88vN/Qd4+UEnx90RWrYVyN2rCUy6mvXEHW4vEouuVC
	 hEguZyukhFJxQqhzd2cRNduLQeq0616amBnJO4Gth986Uv5IREn0Onuud0bV0qng29
	 M70YkCrFrKwVMsyO61Kxz1gVGV2NRzVdIgOFsobA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 852B5F800C0;
	Fri,  6 Jan 2023 10:16:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EEF1F8024E; Fri,  6 Jan 2023 10:16:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-sl2kor01on2059.outbound.protection.outlook.com [40.107.129.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6E6EF800C0
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 10:15:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6E6EF800C0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltvN7HGWgRf3bEM5i6jeT+Op8h9o3LfE2GTfUUoay91unjoZYszSC3bx8y3iviabqwdRQpNBxZzPkfoCdkrYRwXUsKmBUl1lS7J+KxYS7ulPiUNXw8pXi4poZTizM2rD6t2ijCaMHz3Olp75H8TI+xaQ4U1j0EDxnK5vPXIMux1Jhj+tYF34hib5t6nAH9rxoAuMM08cIW9LbPvfJkE03JZvUAqhNk3o84Q3f6YjSFgvzNA9hiAEqVaUo+B8850dSy8WebbN/6WiEnt0kZykErH98Em6dQP7VZlB9eMqbiRZ0T2Te3nrsq36oqgN17M/uE9U15kV0RXGKOPgzuYcyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f07lkUocofEVRiVs/r2oJDituaoO4HooC0g4kYcbrtc=;
 b=Gvmkcuu6RfHbtOl5wYB29uOokONKDUdDi1yCezSvpXn9wJazrBmXt8Sn7eW6s790SvoA3arC69nlACvmr1HrgKjRgt4oAUwTh4uPTY2FS7KJPLb/LBj/7xWLh793PKlH/zsC2YLiul4P7Y8+9YrgLSzb7nVOMlZIHDwAViJxPMizSeBssspnCGHYIf1OhIk75aZMFhxNdxP6jpMXcITaHPZF3e0BE3oeBnKE3Y+uywCshhAVo7nr1E/ulbCUfIJvSCxmtMonK/XBMWXlxaZ5HFU5OYZp1tm+eKLuyBvmy22KA7Kt0zm1Z1zKlu8zAcHK7dZRgNRn77SEk56WkXYc7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PS2P216MB1300.KORP216.PROD.OUTLOOK.COM (2603:1096:301:98::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Fri, 6 Jan 2023 09:15:53 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 09:15:52 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 00/14] ASoC: Add a driver the Iron Device SMA1303 AMP
Date: Fri,  6 Jan 2023 18:15:29 +0900
Message-Id: <20230106091543.2440-1-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::29) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|PS2P216MB1300:EE_
X-MS-Office365-Filtering-Correlation-Id: 1989ea06-c3d9-4c99-09c5-08daefc69bef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZoUfE3zFHWFmZYqYRpRzqdLTlEv1qHiVanMQ8d+c+LtXh19O+5msK2exN6zRfRRl2Agx+IKRAhVC2jUo9TGlcTJ3+IHOLv1kOB0rxXisVuCAdQAT0YHw45fUVL+R/BY6VyF/vsaTKBnopuIJoXXYAlDwJvDNsktXaByLXwP9YROgD1+dy2ncvb9v0VyYN8a4j7axMQjsXouepx/8ViCDRuT8sbSHwN0Pvc0ixVy3aXRpAhU/xJ8prqVysFeVhS6LO0eUNwwwFX8CTB0/wc1Mt9Vit8fzOt8Qs1OhX8spBVQcjj3jN6DqA/txhAff2x/aLR/HOMoaaNUXuoSB+En83XV/oRDfJJ5hrQSj4nX8Py52N75Zzx9l8wMN5I3ZB/27COIDruTS2QjVkt6Pi2Xf9gbnqev2CeusXk3T3VO/LNPwf1ayM2RBTOmNAYLetlK4P08qLkMJ8p467/djHlwWPPm1ZR/Qo8r6N/ZX34Sb4eLFeMiIiXnGToHpROri9I95UTrp6KUlyugwMz7NPrpYJd/aY9SRN9Q3ET1vgG8yvdrt2kndgwEL/mueU5J7JzsLw3M1YjqUGCRronDWGmw3vISz3b6Dmy2Zq1Yj2kc5iyjJbEVxGF2AyxyohgeQPjkw81dTJpQ7mR8fHTydIJ6cacTRtnmzl3GOSyCe6pUOUv93/m7c6+gO+j8BdDMMG5su
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39840400004)(396003)(376002)(136003)(346002)(451199015)(8936002)(2906002)(5660300002)(44832011)(8676002)(41300700001)(4326008)(6916009)(66476007)(66946007)(52116002)(66556008)(316002)(6486002)(478600001)(83380400001)(26005)(186003)(6512007)(107886003)(6666004)(6506007)(2616005)(38350700002)(1076003)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?894BLJH5WMgPDjMzGoWmuF+fPkxHBkw2ATWYkpjz1Mve55QB2fh4/SlgZ/KF?=
 =?us-ascii?Q?uW5Rr/dx0GCGsuhcZnIBrZZgkSLXvzgsW2j22oqG1Jrq3oONfeq0LWfodOng?=
 =?us-ascii?Q?FRvsgiktl1yXOD1c/bGpp+iPM96x5B3s3F3QXLy66EjxyppAhSxbpwa3dplL?=
 =?us-ascii?Q?y1tCfqhixAVXpzW5dINkut2B+NhQhxtwLJ+YG4WEPrlUpuCC2TEXb6jIHT35?=
 =?us-ascii?Q?gM01IYPfBPmbCviNvK+6e01bePu6v/68fCkkbC2xY0fWbTmFHERYEH1LdTfW?=
 =?us-ascii?Q?CvlOC77tonEe4Zz97II5DW8YHRN3Qw2i+d0VLguyFGdSU3YumOtq4cEObVw8?=
 =?us-ascii?Q?Za+tBLOt02lul6twSB1+o+Qd8/1ewfPHziyoVm8t5epO0bP6f0cHjSDl0MDu?=
 =?us-ascii?Q?xlcgNiPBcYh7vtvVeNpuk/TdVEk5h13COsm73kQ7nr0zSxkbEt5eATL2HX40?=
 =?us-ascii?Q?cxcw5AcQHd8PJy0ZlxJkFYP4Wi1hK68HYzOTLo9/Hie2l1a6X7JaUlpRFWun?=
 =?us-ascii?Q?bofmQ3n6ToXd5GfxTUnYJAU+o+e5G72ZpkvMQ8fKZnYsEqqDESNgNOECwEry?=
 =?us-ascii?Q?1nFWJ517SAe0UquK0zt88vZbIuEcczptwQUKVD5/P4EsCpHleX0MfPojRCG2?=
 =?us-ascii?Q?CgxvoVV1no2JotF237uaGwuyrR5Bm+nFoc4s2J/GRlCTletb+zezOWCmMIS6?=
 =?us-ascii?Q?Pu8+NZYsWkKGTDuXjcb+aljM1NhLYyHsjWmNkkRFDGDCjxv26/y8NcZjB479?=
 =?us-ascii?Q?tr6TMOdfeEjNRuJhBjEaflS6ryInigdkX586YWSsKrD6zSXyv2gO/X3rdEYl?=
 =?us-ascii?Q?njJRdjQMSBqQ1hTPciWqD9xbiC2q+TA3nYxjvY0b2e50Rijpkste2gHDYDf1?=
 =?us-ascii?Q?S55WKLSUw+Me7ncgJpeaSOBLh8uAMpf2QbgtYPh06yDGSbQlTMAGiteUhexo?=
 =?us-ascii?Q?zAtEfUgzpeICyUBC9gVI65DazALNhfvOjAooHVbnaQGQAcpJxCTqQLy2wGqM?=
 =?us-ascii?Q?0hK47YCQ9pn6u4Ny2zqfroYYIg8aK//7Ub+EnxdHMscXauQZPHhHOiwUR23F?=
 =?us-ascii?Q?U7lOmrcOV/ahzOI/JLZWWOFkHnWv3a5wm1/3cFqyw4ag2b2SLQ9Dn8Aj9XUr?=
 =?us-ascii?Q?uz8WXDkbBkm4fFneptm1ljWHylGWbwFbKEAZX6ZBmubykM+cWrvwxC2M30Nv?=
 =?us-ascii?Q?D0paWRvhRfSFZFi2h8Xx+HzflheFZm6wlYfWUDpvXiT/C9Ufeh4PlAb+jSOZ?=
 =?us-ascii?Q?EbGtc4MHVRvJBbwdvLcBelK+5/hakUnoU59otnKT+bY7A/SNddQSGFBEE9UY?=
 =?us-ascii?Q?xVds0spVRFHrzjHAsMmNSKDRz+fIV81XhFLIkf+XKfsYCsosFTV4+WTEPvH5?=
 =?us-ascii?Q?tgjwQ7ocqRybjPrCdG0HKMUOHw2PrL3sg7yvSCXKz9v8I6xEuiBhZarv/5hn?=
 =?us-ascii?Q?EPKW6W2x8qRAW3PYZwBAngbPYDllRwyoA4GO0dOWectGo2C7gARt+mDU4k2S?=
 =?us-ascii?Q?3E1NWbAh1o5D7JuFLxsINQBZKJz6YJSkZuNt05sD1m5XdCSj5rUOJp/ddQNR?=
 =?us-ascii?Q?OOy7vonbGdrzYtqr8iCTsJ08cXf06ex3CaRuRwO9?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1989ea06-c3d9-4c99-09c5-08daefc69bef
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 09:15:52.7855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pifd4Q9cnIvJ8tKyGjVf0S3F8YKb4f6aMrdcGe3OiKQ5DIJCL79Z0hUYHH2b3QhLyTibI0zZ+7bv3Op/uDq2bvrXViwaZptvIKFAoEZGx1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB1300
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, application@irondevice.com,
 Kiseok Jo <kiseok.jo@irondevice.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This adds basic audio support for the Iron Device SMA1303 amplifier.

Kiseok Jo (14):
  ASoC: sma1303: Add driver for Iron Device SMA1303 Amp
  ASoC: dt-bindings: sma1303: Iron Device SMA1303 Amp
  Add the i2c-retry count and callback function in regmap function.
  Removed the usage control and add the power switch on DAPM route.
  Change the DAPM route and widgets
  Use the prefixs all definitions
  Remove the control of output format
  Remove the mute control
  Add the prefix for component controls
  Remove the shutdown and startup when set PLL
  Delete the header file of "linux/version.h"
  Add the postscaler's switch in DAPM manage.
  Move the initial settings to i2c driver probe
  Fixed the retry_cnt bug about being zero

 .../bindings/sound/irondevice,sma1303.yaml    |   40 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 sound/soc/codecs/Kconfig                      |    7 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/sma1303.c                    | 1747 +++++++++++++++++
 sound/soc/codecs/sma1303.h                    |  616 ++++++
 6 files changed, 2414 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
 create mode 100644 sound/soc/codecs/sma1303.c
 create mode 100644 sound/soc/codecs/sma1303.h


base-commit: f873f5d1cee54466f00c974ac7f47bc7ed33fbd6
-- 
2.30.2

