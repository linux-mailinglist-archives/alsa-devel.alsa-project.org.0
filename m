Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B46E3645283
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Dec 2022 04:21:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 186F317E6;
	Wed,  7 Dec 2022 04:21:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 186F317E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670383313;
	bh=Hw0TiWuXRsmUHnm9Db5f6ZyROf/5pEgIkXzbtiHNqUY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b7uMZYQP4OEcW2F2jfo5P9b0oK8xMWBRLiZM6KiuLFuvwZCeFFtpdlBdYe4gtMWte
	 qBA1q9J/maw7oDwfQmiTPTg0P856b8/DljvloxAHc4f/9Y5vZigib02hlpT8nLqnqv
	 lT/7PDyFsb9kiKLE7WtsvyCdYeW8NG4w4GddjvkY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAC60F80301;
	Wed,  7 Dec 2022 04:20:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12722F802BE; Wed,  7 Dec 2022 04:20:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01olkn2080c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::80c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2F8EF80121
 for <alsa-devel@alsa-project.org>; Wed,  7 Dec 2022 04:20:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2F8EF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="iXTJYRGe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kb3CSGm6N4TVqvfWRYCxM7Vwk4pmhyzW/5keLOVoOxPasvGV2Vl/Gkbodkd+DvIk71m/PtGH0v1JakaCkRn+IbaoXCQf2EMPyfCcaguUKpNCOriS1UZSdbiq524MfoxAJoxLZ7VRgks8cdXuO7dyTV5AieTKHcB4IF95+jx/83cZ4MzfSbuttee5Xi5TaDL9IjPy9YY71qHPz4LDxQuqf1QL/0iN+lLYBR7M/b4W40PGzJ2p3ZPVheqgKBVULaPIs7NJYO0hI9tC4u4Zo0qXxOUH6x+x3x5LiIUX5LMXfbvbSUn33LP2g12yFkOdkGqe/4A+EVoTNaHWt7VASlLjvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ygrx8jG4GN9LmJLO6IGTc3kPJztQLPVgtjoAyjN1eo=;
 b=M5s4T97MjuE41qspCjf5w3BpnU2cR9sn6VOFWmFYqV6IzhIgJgKeRPy/O8zmXBco3XRkN5kHG3O2M1oCDk5oBGXWlw66hshw700/U8K+bVFrd+kGSPXlw0E9jMcPAzv5lliP5yYPajzKBL2quiAOLLN9d9QgiYSlDTaAhMRak99Xnu3d7dIE8WCbW5YEM8mom/saXPqo1k9nGPVbMEhLn/hoDY3CijYs44oo+cPQEh0G+bQ9UTtZ5dkaNFNTYQdOyEhUDW3FGmi7Nzw5Msu18/1U/b6IVBVUObSdgtNW0Ug60f9g1bTMCe5FvfFOFqM+QqN/GubaLq1R1gflTfsglg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ygrx8jG4GN9LmJLO6IGTc3kPJztQLPVgtjoAyjN1eo=;
 b=iXTJYRGek340MwwnJPyTgzqGAon2t0wQoAy0jHYH3pJqcl+inyGz+tVzVfg0apelkd6Vqp9vImVxUL06Zi8eolZ/guzQurmn2tEpSRNDkSHsMiif4APLID9aW3ChIfrEUduKVR2ufeXEuL3WjbeZP4+cd+6zBraQvdUDmL65uEvd4InNPvlkL7bCJLCwSsIqfOdyM22qsIfivSVap8qKgy54J8o6HX5oLBHCQgmJKnWf9FvAE5Xow4StP9B+Ay9b7P0kvnF5tEpDk0KXb0CfoqM8kttPgy8tf/GNSgSOIMKsznkRGJ8rh3beUjC330IDLA/cseJOPzDewx8SFT6Qqg==
Received: from SG2PR02MB5878.apcprd02.prod.outlook.com (2603:1096:4:1d2::9) by
 TYZPR02MB6163.apcprd02.prod.outlook.com (2603:1096:400:28c::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.10; Wed, 7 Dec 2022 03:20:41 +0000
Received: from SG2PR02MB5878.apcprd02.prod.outlook.com
 ([fe80::2c81:c803:d49b:eebb]) by SG2PR02MB5878.apcprd02.prod.outlook.com
 ([fe80::2c81:c803:d49b:eebb%6]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 03:20:41 +0000
From: Dicheng Wang <wangdicheng123@hotmail.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH v3 -next] ALSA:usb-audio:add the information of KT0206 device
 driven by USB audio
Date: Wed,  7 Dec 2022 11:20:23 +0800
Message-ID: <SG2PR02MB58789FBF9A2EA801AF49D5E88A1A9@SG2PR02MB5878.apcprd02.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <Y480pd/XynYddrHk@kroah.com>
References: <Y480pd/XynYddrHk@kroah.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [3TPzpI3AAqcz5P36QnqqV5jlBmA3iZkb]
X-ClientProxiedBy: TYAPR01CA0228.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::24) To SG2PR02MB5878.apcprd02.prod.outlook.com
 (2603:1096:4:1d2::9)
X-Microsoft-Original-Message-ID: <20221207032023.65856-1-wangdicheng123@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR02MB5878:EE_|TYZPR02MB6163:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f09f2f-c9cf-452b-f9b8-08dad80204ab
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cu/cnXDfltxnHy9+pyHtFcaZz3W2KoLbBZDPUpSQxQrV856U9GPZ0MDI0X13hf03P8VFRxVWZONncaZlec10K6E+/p2K5WYj1akPERhgeScLVSJBcVSVPzvNXDT9odQr2wTmDXPkRbH8g7vVob0Ap4u3uVOsP+NvLxT6Klg6k5TC709sCiNsGWVVsEUkMZ/PGWimN+QOHejb1W8nl4a2Irh1mk2u87uoeYRRJLKvO8e840YNitodG1Cswz7CmXw/VXmEkdJwCGh8Uqnl1NUs95KTf1FB7To9AiyvqQQhgXveq+pEize1pt3BXNaImI2cnGgv+RKVKNuTjjTJiZ+dFfCpXRP+ACKCBP0csGCdZu9EUUEPipRQTTGC1v460HVPTRXz2B/OHlMlu4AtkIDfz1ztYe/60zixRAz6Dc7KSZ677PgJNKDgX4d2U/BCeqe/fcVyjSfpTds6rgYKxvHIeQZDIhgPyNLTYv1UElQ6lPqPeo73gGhz4rgFJiLNof1zVWTmlfM16sXAqVxgSA2lCeGo+mddYC6Hjnd0wYJ+/n80GCZIKMkaRpR7NeHUXINv1uoQgI+m+bnbi4aqWS+plxUvafkFrl71eYJgsvn8+xQ=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ezbQs0lgVB41nPMexRxIaNirHrzc0e1Rb0DRvbx6LibT8XfwlgWafaL9oIME?=
 =?us-ascii?Q?LG/ShX7kONKX6Cvl//cO1IF29wkW1ZEuCQFVQfDlwGZypdXFVcDru3pvu9Yn?=
 =?us-ascii?Q?f7iFH3Ky1OM10U5qeqe3+tZKlpPw3PTV+dPLiCPvUHw7e8YvhwXHz4xSxbdI?=
 =?us-ascii?Q?40XGLU1hDOlZWGFNKls9osdZr1W8D34K1kVWxa7y1vb14oiottUYjd+H3XMQ?=
 =?us-ascii?Q?h6BFBnc08QPDkbc+V4D2vU3h0MFlW1XRiJQG8eKwDBSm0K9jhXecqXNBevMu?=
 =?us-ascii?Q?ftvrw2P++/BPAuO3YWoqKMTpGiqjs+QRMSlaf4NyJQ2a6YSagbdlfhMHM/ES?=
 =?us-ascii?Q?Qh2MGGLV5vtK8qSAdSxhGOsskCmE4Fa8AKguyXVxQsrbQeZ8drMatMWSBOb6?=
 =?us-ascii?Q?y2si1pP0lYxUkK4RA4hmkIj59QWGjNc7AMpM+qZHDxSJvjZLdyq8NUfVXjoA?=
 =?us-ascii?Q?z3GNEbeUTyIQLLas1fNk9cnC6adR89XS8OF9FZJWR/H/JLU39wr1lDi6Fzw6?=
 =?us-ascii?Q?Ev+vcvNAchbA7WFRk/yyGubd6kghu4ZYgj1rlebdrtuLre5/hxBf54fT5Onv?=
 =?us-ascii?Q?5QaMg6fMztiZYEUIeEdv3snRxDi7Zfyt4GCzmy0VMyjvd/h5QCPgcX6mw4LE?=
 =?us-ascii?Q?GVpOH9eO0sb0hUzBlv+JoIk2ihwEHQmruNidUsWH0GQSjtCdKCCMdDOi1GgS?=
 =?us-ascii?Q?EwEWzxMJ93LsMbraeqsKF5ZVXlsNbxInIb6Wu7ckE5r1D2uao+giI+ltkjc3?=
 =?us-ascii?Q?M6gnuJqqiLa8gNNa3HcEthPGWb/bLJr9ZHBegw0ivQ7aYPki5aU9SARwe6vw?=
 =?us-ascii?Q?BU3YujPC6ubPkvlVmUw/IFPMND20+aYL/3h+EnLp5tJ2zklQa4o/G1ZxmziP?=
 =?us-ascii?Q?qwcBjWNR6VwJGXpBMx8FR3V2E1VlIKGDL0fidaejvBt+vFbJKxkViGaMpAgs?=
 =?us-ascii?Q?5NUBvDquln2+540qaQpaeKyBuI7wfPXHaxAO6dquT/sZjD1khb1jwVyUfZWV?=
 =?us-ascii?Q?JlFW5QUr7K69Empr5qk56BiFhkXDLEtwQgt5SztQARWNe4evCGMZRQsnKcQ/?=
 =?us-ascii?Q?Q/c5S8F36ZfR9E46GhQUUDq3ZRDT8aXvU+ArvoYYAkwjZXYJU4gcm43F/xSt?=
 =?us-ascii?Q?g4+c3ydu6r1zKjKfQyuXzgRYcvv+F2ZUOp7iNdSCFRO4dh7fpL/tu3Wtb//m?=
 =?us-ascii?Q?4wMzIUwVtrchxvsPEcgMX/5Ux9jCe/VCPxdlSETLdge6cGYbixGDrEEgYjKc?=
 =?us-ascii?Q?sslHWdF2JXHw6Q9xtieE+vLIN84MxT4k5/k9qs5prVBcNIQ+lcmb00iAoLp4?=
 =?us-ascii?Q?1fU=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-20e34.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f09f2f-c9cf-452b-f9b8-08dad80204ab
X-MS-Exchange-CrossTenant-AuthSource: SG2PR02MB5878.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 03:20:41.0009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6163
Cc: alsa-devel@alsa-project.org, john-linux@pelago.org.uk,
 connerknoxpublic@gmail.com, sdoregor@sdore.me, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, tiwai@suse.com, hahnjo@hahnjo.de,
 wangdicheng@kylinos.cn
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

From: wangdicheng <wangdicheng@kylinos.cn>

Add relevant information to the quirks-table.h file.
The test passes and the sound source file plays normally.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
v3:add body information 

v2:use USB_DEVICE_VENDOR_SPEC() suggested by Takashi Iwai

 sound/usb/quirks-table.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 874fcf245747..271884e35003 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -76,6 +76,8 @@
 { USB_DEVICE_VENDOR_SPEC(0x041e, 0x3f0a) },
 /* E-Mu 0204 USB */
 { USB_DEVICE_VENDOR_SPEC(0x041e, 0x3f19) },
+/* Ktmicro Usb_audio device */
+{ USB_DEVICE_VENDOR_SPEC(0x31b2, 0x0011) },
 
 /*
  * Creative Technology, Ltd Live! Cam Sync HD [VF0770]
-- 
2.25.1

