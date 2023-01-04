Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C910C65CD4D
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jan 2023 07:45:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1971D9264;
	Wed,  4 Jan 2023 07:44:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1971D9264
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672814706;
	bh=GnGezXyBWcIslQFm/mCsbNWWjVpIrr6SBnScQJFRsAc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=SEUHGrrPIgdG1nLECaRMvTCZcva8FUrfyuW1CqD+QkbcjoD09SyikZNF0OKXWeTOy
	 q2TGahOFeXHObEpG22s9s3oi6IdLZLxmWpfEKduN8oZ5RYL8ulwlSfyFWO9AkI+Nkb
	 SSy1cQUF73J9EiFZGQE0tVbU+7wqrVyjPaS1Ei64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF32AF8023B;
	Wed,  4 Jan 2023 07:44:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C4A5F8024D; Wed,  4 Jan 2023 07:44:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-ps2kor01on2087.outbound.protection.outlook.com [40.107.128.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30324F8023A
 for <alsa-devel@alsa-project.org>; Wed,  4 Jan 2023 07:44:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30324F8023A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBf3OJrNph6i0MLrOSVoad7fnZe/m4Ls/bE6ZVq92H30sjl0v2hEb5TjMLsmKB06Zwr5fcEUcth7uDJAK5nDZDW3B1jvwFgEE51pcFFK122Kf//uD+GCka/caI3YTUZPyeMzMvCyY6VwKsvQRtGn7YbzS0Z6ISCl3v/TJpXNlnunbhGyFIprMftmd7GcFnHqUwUuPoZJFBj+4w8B0+M+/LDWSEtHaVrd3/m0lAD+fyINn+7Y1IR6NrNNAF3juShsgmdGlbsc1LRqJ9yjf4rl9avo8PL6UqObG7Np45EPgbK612PAFWvwOfV8YxcCXaK4VDYGM4QrvSz01unzXZpV4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6Z5whngIrPUrgCL02Brdbxou9d3Vp6ZC05vtsaLTHw=;
 b=FdXykYUvjpyMq2AT0WK2prnFBYfyxn7j9lIozIWkKEt96LjTFEwtKhF2MoE+JzFReeNzttXGYkliV0+FteFChco+1+CV7BEznlFPFf75CyEhPkwBD+1gLxM+UF8+L8O2k+40GeIFC21n/9vQFwXgSxd9cewZIcTrczPCY82tr0gcOAny5o1IAw+UrDYyCidEyIDmHILzUKLImxns8JOFjuEkYDR63B6t8j5Ep98WhxhMm2Hj39MmY+UUBsV3oj+xXF5PwGm9MeyDieRByBYiMDaSBjKUGrm+V/FKIoMT63wGoLNUZToyo5EH8J59yAsGDoruXeLZFhvlOFCJsMtMhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PU4P216MB1820.KORP216.PROD.OUTLOOK.COM (2603:1096:301:10a::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Wed, 4 Jan 2023 06:44:02 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 06:44:02 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/3] ASoC: Add a driver for the Iron Device SMA1303 Amp
Date: Wed,  4 Jan 2023 15:43:39 +0900
Message-Id: <20230104064342.2094-1-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0141.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::20) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|PU4P216MB1820:EE_
X-MS-Office365-Filtering-Correlation-Id: 18464fe2-ffad-4fb8-c499-08daee1f10c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zrawGP2KzXZHyvV7Q0HygxOTrNkkEee36xUWT4hauo2+KGEZo+/uqnUzjsFU3M962QgCfTq7PHfy025F/HRNsNsxD4Drz523QA4H/jlfQ6VSZhi3HP4wSNEIZtDcFNxm+EQ6lbzUWpguy+23MceVrJFsxFXVIg1RVkmkmX3gAmgWJzuL2Kuzi1dX+8K07uwtYhoWHmzTQrj+SPDCW0Iea/tHzPu9C8TMWtSzhevRjOS5e805oUfNPL1kM+GvTLjvPXNLAM9S2nCcRbv8s9XSlfphEOtwiuCa1MFCMkQ4yoFK5BedHo1Z7oPATRHzvgbO6yBO7Esi81KgX6j2OkcZZkUVCFgcFO1AiStnGG2DWL1ocYf6DOckQB6q+d1WEdU3K6uU9WVmNgivPksLRNEDXLLZjIw46ib2Imjvku4sgHg90H6V3f9kh34b/8L+v0CHBhl+2PJW9bBdizcNTuDyUOQgfn2DdzG0SU0zmINZdFnXWdH9s8wf5yHpB2Hirx79ChOvKu16vGcxX67CCj0ihAaY2tggyXa403MAgLmd15IfH0RxUVztaWa4wntdlmSRBXmGjnhn8y+1GGlBOiKZNIHIG5btt4gBnKhxAPAq+4dxweK9/cHsGFXfdeN2ZTMFLkJySvrI6HaAqgMHbOU17X0UoufSW+u9E0oKgyhjVcMsSkNxDgN57m5df6LWupk9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39830400003)(376002)(346002)(396003)(136003)(451199015)(5660300002)(2906002)(44832011)(4744005)(8936002)(41300700001)(4326008)(478600001)(8676002)(316002)(66476007)(66946007)(6916009)(66556008)(52116002)(6486002)(6666004)(6512007)(26005)(6506007)(107886003)(1076003)(186003)(38100700002)(2616005)(38350700002)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jbN139+tFnCqlRKaP9wrLIrBUvntXSglXAPxCROnYpNHo437KIwJE4KyGKrc?=
 =?us-ascii?Q?zu9xar95jjO2mk+u621vnGbdWKeLBA8PSP3i+1zyKGj38zIWWSrUp8nFUfQl?=
 =?us-ascii?Q?29qzfyQ8rc3SPG+8wgbICJS8gd9D/lyTvuF1a6K068D29AevJTvdL+mYEgu+?=
 =?us-ascii?Q?F5YZXv0APo+TL27KL0DrkCXyRp8auwlhxanaVMS/AhGDjZDEWgd9IBE6tf+X?=
 =?us-ascii?Q?i2G27thvc3gl3mmZaLxQUqHIMoC0Ap0VEqHuQa2YTDysxCMBP0bx/C/V72Cb?=
 =?us-ascii?Q?63SUBHEuW7Z3r5g0JYbG3+aFOyw9bfkQdctTJO9iwQR66ocTE802RIBXWTSz?=
 =?us-ascii?Q?3znYWCfut+hh3oX4MLC43QmemdvgYjBcn2PPi4u3D0CQ0kNkcpLF3nSfIAoV?=
 =?us-ascii?Q?AUcBaOo49wKev9K7g/kIOjYNinFUUXr6vA0t7D6OUPP9aYWC8bXjQLmpJiaA?=
 =?us-ascii?Q?MW9cj2U8bNYKA7Ist1NkePh2DX3TQggfMNxSphq/hgYGo/zvrDHRZlC021wH?=
 =?us-ascii?Q?QVSVQf/zOght9XbDeJ3buMyd/oTwinIzKi205MncEgEFBOgTmKfthXLEo1Dr?=
 =?us-ascii?Q?Llbz0roy92gCKf3MJ9g6SmiaVwtURIZcCDy9Ceq5G+5T9grtyW7kr28ttzDz?=
 =?us-ascii?Q?iWBvhQ9WV0MmRJpDsIDErFZVPmPNp9to5FCsA6xIv17kEBR38WewT7sfZ2m9?=
 =?us-ascii?Q?6yF1uKDF/dCKoSyoSxykRhlC0r6cW8oQUGHKfCxKD0EYDGLwdd8HeFHnFQ6z?=
 =?us-ascii?Q?HrBE1hh2keU1wvKBQW3xwcj1vOG1Dwx9icEc+dN0+H7TBPEjRhgZZD1FBC2S?=
 =?us-ascii?Q?JdAlqA76IafR3h1no3fwCK8AzdIMWr92CXyMKf5X6g7e0EO4lyE7A2TziTLc?=
 =?us-ascii?Q?Z6YGaBLEks5n2XMVEQoRfGdfXUFt2IL4D5qMUqCiwtrw+R9c3llxdHQ4U7v8?=
 =?us-ascii?Q?PFiARtWRPly15q9rgwRIYnch9bR/l+UbAgW+BMIP91uW8wtb6NYvPcFUKMWh?=
 =?us-ascii?Q?lS6i6pvtpioIrMN0D7Sh+FO8e6pn6Hecb/Szu0KJppw0X6jOGC0RdMQ1Hl7j?=
 =?us-ascii?Q?LkI79wX1LLw3V8VnJG/q2Ua5RQQT2ouYL7iunfKax69BhqMO37xl1Roa/1ng?=
 =?us-ascii?Q?mbPEQZo3obASYNw02kdCtJwWzS/hGdvZX6BpTfkbABnIXK3H/3f32fAK170a?=
 =?us-ascii?Q?dx36pPoV3pNWT3eECj7sLIUn/T3KFO+fa7NqXH/5e3qQwQnIgn6Lixlqa50j?=
 =?us-ascii?Q?WtWfaunse5S/BvWc5gqfymIP2dSAMHKetkgoMdR9C2i3Z8vPGO2jD+H6RNKt?=
 =?us-ascii?Q?7bfJZe7FGUAyMY9Zh8UsAyWWRDTRUQLR+l55ySL6SA138vQd9ejSXSV9Olbg?=
 =?us-ascii?Q?ZETMFA6QsfAUnwFOmdK9mszXdtExft+cKEFHGDOmIWyePSpC66FlZOSHxihp?=
 =?us-ascii?Q?BvTr7l47PJ+gapOGa9zIpRer/Im2ALGXvYFTpr4G3aJVgDXx41C4NYoZSIAt?=
 =?us-ascii?Q?oo1ENpPHbN+orJ0z2+xX4Rvb7RTNP83wbchcYdcwQiP3/QurR/L1BgZyyGvR?=
 =?us-ascii?Q?pNQxdS7YFO9log2Z/A+St4E32GvmMyrrZ8karctn?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18464fe2-ffad-4fb8-c499-08daee1f10c7
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 06:44:02.2551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFry5mb8JMVRK4xAUmx1xmAyH4ACw8zPqbfjN3MQ/SDSCzGOErA4+D2ZiTROX8NxKgBarpaXbTzAK9dU+x7PnSdC0pQ0nRMzIIZhW5nzCG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1820
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

Kiseok Jo (3):
  ASoC: sma1303: Add driver for Iron Device SMA1303 Amp
  ASoC: dt-bindings: sma1303: Iron Device SMA1303 Amp
  ASOC: sma1303: change the overall contents

 .../bindings/sound/irondevice,sma1303.yaml    |   40 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 scripts/kconfig/mconf-cfg                     |    2 +
 sound/soc/codecs/Kconfig                      |    7 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/sma1303.c                    | 1720 +++++++++++++++++
 sound/soc/codecs/sma1303.h                    |  614 ++++++
 7 files changed, 2387 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
 create mode 100644 scripts/kconfig/mconf-cfg
 create mode 100644 sound/soc/codecs/sma1303.c
 create mode 100644 sound/soc/codecs/sma1303.h

-- 
2.30.2

