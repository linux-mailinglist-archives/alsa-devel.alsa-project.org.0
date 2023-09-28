Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A3A7B0FC3
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 02:05:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 188ED829;
	Thu, 28 Sep 2023 02:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 188ED829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695859530;
	bh=dqwdFOtbLtnqLzyMpP0Rxyf8yHyA4lRI/SsMddob0lQ=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VbWPLf5ciyGtBBROPFOk+5wWYdqNv28gHM8IuGGZDqdmlFg3SlMdOFcBY98lQUg6Z
	 neB3JkCPm6ykZ0XjcS79qLdXmLYmlcECaJBtJUIkpd86jUpsPIcBRmc+gB44kc3lxh
	 m0Yi7sOjWNK+jo71nmor5OQ5rqdaQETyea++NlQs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61CDBF8047D; Thu, 28 Sep 2023 02:04:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10AA0F80130;
	Thu, 28 Sep 2023 02:04:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A6CAF801D5; Thu, 28 Sep 2023 02:04:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20717.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::717])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50B01F800AE
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 02:04:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50B01F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ed6fYi5V
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5yOzTIyYlSMnQi47jGGgVbPSvUCsWOsxUZlKv4gacVQdu/+26oa3d2z65Ufly8P6xaRtmG8eAq6TZ71ycAk230H+Rb0cbUjROApPiX0EEJvgpDtRU0lB+9U+GsH5Ue95tWmYT9ulxTEJw9KUjzOjMQXQuaRuf7W+L6mFxgm4jCkRbp4kdMWO7KwkltbTiiHeYt40OGh9VnvO+DPl/xFG1DrvMRJyBfHblxdUEP+Wk55xZPY1BgGg32V2lsqPjfBIdkq84dwmHvntH6rq/5RpOOrdwmwAdzSNREoyISzdL+/p0DHF8UFc3roDvtd/jYj5Fz0ABbTeFsqb+AHHZ3HaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6egjXJBKJ/qhjW7M3zE00OGmX031EnIUd5jpAqi4ps8=;
 b=oJqY6sbydDVkkV3UceXNCvdQTRZBO2Zi9dCbf7OuRvPoL282YSYA1g4xWSlF+2qsVSy93Q5DohmX80X9sXF6y8mW5SBxQSw9t0FxbWgqYudaxlf4FsRYtYOZN2loNdmrP8Q1VbJe/jgJQUAV7gRDMzoby9jm6mBtLMqCDmAJ3qeuZ8rCR1jLEKXZ3+j7LuYACumk3yYhAohP1atyr/gZ33dANcloHr2jodu/beSyDS3RcSdNHQJ0dG2yi545iOSOz6D1DCDv0MumG1j0ClysPR6QfeFZpmIawEfJz5TYngc8UU7NclzWHpjFJZJyPM5yk18YD1RdE7A+9ZktUA8HpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6egjXJBKJ/qhjW7M3zE00OGmX031EnIUd5jpAqi4ps8=;
 b=ed6fYi5V++sx/S2eh+EBNYpY0DKcoaTSHMqA6JVJCZrYhOk5RIOJi3yNTiyxfR9K7I43jCw4CbZJCCKXQrkxtfDU0yKl72VY4YrzoW3A5/sR6VB8I3wX51SexsFDnbzs29ThIspihbApkXpbBWYNUuZKsfA+q0a7mlyNZ5sZ6oc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB6011.jpnprd01.prod.outlook.com (2603:1096:402:35::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.24; Thu, 28 Sep
 2023 00:04:16 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 00:04:16 +0000
Message-ID: <87ttrfgo3j.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] sh: boards: Fix Sound Simple-Card struct name
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 28 Sep 2023 00:04:16 +0000
X-ClientProxiedBy: TYXPR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:403:a::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYAPR01MB6011:EE_
X-MS-Office365-Filtering-Correlation-Id: dcb1cef8-5433-4b0d-4357-08dbbfb674aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Mx/UTW25WANQZQxD0wT+rcqteIif9nmhbzTfXP5yFoMVBdvmtCw5rpcPou9RcZV5XblQk5K7RHB/xu5XjZUS0EH9Fp8rmWZ/dI+ZR5jg2wUZcltMLJyz2L3p1HmX7p0A4K5JaGzrAg8z+b4xcyOgSTY78i+BQVcxF8Eu6W0NoOHxfNsd/jBPsqfU37CQQRieQTBmicVC7t95i8AQs/ZoFps5KFvTcJliNigqOuZ8jEIbBX9FWKRwJE7jtAXaPRt30v8BRVYT7cgg9PIYfDa1+Fs1FOvMw179TbUAyddQME4FtH4S8ym2lgl/YuagDEkBvrHpAIHoAl2onmoO1JK4fo/aUSUJ7Odxizw0OoWT7Vo56MbLzWcXmrJB8vduxXoimCyd8Zc+6goUav7m2sObq7mIBPSNXxroFlYG807/ti3n0yc0u8gvwCBu3+usgderSxRLYy/sH054ygnTZbIghafXdAbRJ7zXPir40s+q1asQBo0bf5e0VJwDKvSGWkGacBIwqKxoHrDHb2rYZzTpVGO0TruD8FReRe8jj1YZXqpbYiio0MwReZ0Dynpfzm9bJ6fJk5sl3v4yRDkvwNVtI2TDJuMdY1gtQ05BxA1eZr9rxHH4W4cFj+kAyHBUJOJg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(396003)(346002)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(5660300002)(6512007)(52116002)(4326008)(8676002)(8936002)(66476007)(66556008)(110136005)(66946007)(316002)(478600001)(6486002)(966005)(2616005)(6506007)(2906002)(26005)(83380400001)(41300700001)(38100700002)(38350700002)(86362001)(36756003)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6W1Jks90jyLckFh8Eip8nQPh38aWlP/3JzmStL2sn4SiVzOFtmtPMJAnZgf5?=
 =?us-ascii?Q?ybrFbjwL5RrM78V4fLog/iiOJjDiPqYOIUcr13hNNsmAvvdWuDFFgqYDN8Pq?=
 =?us-ascii?Q?kXng780Fyn3v3mjalWrlHgxvEmGkxnr/AYTzF75A1tpbTSydxBd7IccOhb6a?=
 =?us-ascii?Q?AbeK2S4DpBY0w/tLKs9N26zoUJbum5wob6Ky973BVwNLD46y+fHXGn777EdV?=
 =?us-ascii?Q?13uYnoSReVJe/+Kq/k7GfIS4pubbxDXd544ZApE4YD33Nti7dK8OFBHkwN4O?=
 =?us-ascii?Q?aqpQyD1Dt+ONpF3NLoc3yCgpkNkjnI3NHvb/Yy+mx3OdeQzvVSkqp47x7+Ru?=
 =?us-ascii?Q?ejqqgY5k1BhJqA8mIHoGj0s5SK5/28izJthrbV2qTOsmb3Mfll+1xyyWRbEd?=
 =?us-ascii?Q?/chbzyU7swdHWP7LOGx1uQRsKigQJj1vKZFJ7BLsVwpZfr8iAiHZkfR3+IA5?=
 =?us-ascii?Q?e+r7/H0k+rqdhV2pMZXEaoWFZl3V5Ynmcfk+HQgPvOvnOSvoUKV0WvxE66Zu?=
 =?us-ascii?Q?YSNFpKy44vm53jfDnRG5+PmEJNkvn93ecCIDcw4blbFsdFtG72w1tbvUBfY8?=
 =?us-ascii?Q?6iSNdB3TGJDVwWYZyqE/kRgFmhVAc+gtKyQ0Gkl+JCQndhF0sCOKgy45PW5k?=
 =?us-ascii?Q?3Pf2m6VeAeuRyk0Bf+Ssb7BQrV2c2oXgNJjNJMB9GHbIQXd9b+/xDFm7cXTg?=
 =?us-ascii?Q?hu1eRknWbm0x/HKfjwMr7+s7FaUKSWK4uiKjkpXZskIIz/zfn3ptuGHA5Uw6?=
 =?us-ascii?Q?TecldBn8HSxZGcmyMpHTNJ3nMdk/6sNgMxvNmQZPNCF7JG0d6YmDJ8Uimy2B?=
 =?us-ascii?Q?0nrtluZvUz0lgndFVlsZMDXnrspEz5Gacf3nmyeW7XERqtc/psG29kxaz8yw?=
 =?us-ascii?Q?eI0yVIAjHe38cOnl1kbJ+3T8d6l8U3x81DfNSKHOJ6T8w8TlutxYeB8M/bDh?=
 =?us-ascii?Q?ii3l5VoFT5aLI/KZwwRIs4AaE6iVcg/OWcfyyrSrjeeMPuOj2tFZDNvqjaUD?=
 =?us-ascii?Q?SAv9SFUfuQBlaL+mEPxFj9ijWr7m0i9KrvGOaw/E5PYo76InOrKU4tC7uXsI?=
 =?us-ascii?Q?vt3KJ2ipQG70Zl8ZimBWZVHNntTxxSwoTTY/WzXK2Mo5/uyXt2a7W6/CCeen?=
 =?us-ascii?Q?aCiLUOy/sbhEKIDIqcnnb6Wgp+FPT04EKSu7EpiBqipCydr2gcrvLi/E5vxE?=
 =?us-ascii?Q?z+swNLgZ2U58WHaiBKd5eKXUwFu442f/txH+fsLWkm0zv3D2WQCKtbyCPN2I?=
 =?us-ascii?Q?zcDz8zyU72bleSYH8vukkw5blx2AlecoPnn6zDcGzAeoZLl56X7U1YRCMLAL?=
 =?us-ascii?Q?8gJhomGNlfIewPcusD5AFnpi5/VvTNp2pjOiCVBHqdFW+FjIUdYpcUSyes7E?=
 =?us-ascii?Q?1LAUEFTAS82YreoV8iVrWzuXVmbslDCSyKquR0aNL1Xbk3uNAzDnqnz3tO/8?=
 =?us-ascii?Q?eEwRoT0is5/3LUPwthpmN6b75fDJJzsafrbZjNJG5JFVzbm2vwRdZpCCAAEu?=
 =?us-ascii?Q?/v54uU7iLpMXVZn6k/5A4klUCUVswLUHGwqRnbPXaQWESiqNnf6a3KPIliqA?=
 =?us-ascii?Q?vCuxRzZ47uMhVbSh4f9Dc3170G/g74eVQoAQJ/rlktoIVCXuYyiFFF5KSknX?=
 =?us-ascii?Q?Ev8UEgo1IvvC5iGhhIGz/qA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dcb1cef8-5433-4b0d-4357-08dbbfb674aa
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 00:04:16.6507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HSSuFlqwNDofkCwT/k4dL2ATGig24cBA0F7TR50dkpn+kWAc0Ai9k2oBNPZvryMhRv5L8zur7suDlnZQEZsIEbq/56G2hRMz8NoDA9IgvJa86YzMBBtfIQ47MGVmH2C4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6011
Message-ID-Hash: LS4BV7TZPCI64V7IF7VJNJOIWMTE2UJM
X-Message-ID-Hash: LS4BV7TZPCI64V7IF7VJNJOIWMTE2UJM
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LS4BV7TZPCI64V7IF7VJNJOIWMTE2UJM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

"asoc_simple_card_info" was renamed to "simple_util_info" by
commit ad484cc98f2 ("ASoC: remove asoc_xxx() compatible macro").
This patch fixup it For SH7724 boards.

Fixes: ad484cc98f2 ("ASoC: remove asoc_xxx() compatible macro")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202309280417.rOLRdrdM-lkp@intel.com/
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
Mark, John

This patch is for latest asoc for-next branch

 arch/sh/boards/mach-ecovec24/setup.c | 2 +-
 arch/sh/boards/mach-se/7724/setup.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-ecovec24/setup.c
index 3be293335de5..0f279360838a 100644
--- a/arch/sh/boards/mach-ecovec24/setup.c
+++ b/arch/sh/boards/mach-ecovec24/setup.c
@@ -881,7 +881,7 @@ static struct platform_device fsi_device = {
 	.resource	= fsi_resources,
 };
 
-static struct asoc_simple_card_info fsi_da7210_info = {
+static struct simple_util_info fsi_da7210_info = {
 	.name		= "DA7210",
 	.card		= "FSIB-DA7210",
 	.codec		= "da7210.0-001a",
diff --git a/arch/sh/boards/mach-se/7724/setup.c b/arch/sh/boards/mach-se/7724/setup.c
index 6495f9354065..787ddd3c627a 100644
--- a/arch/sh/boards/mach-se/7724/setup.c
+++ b/arch/sh/boards/mach-se/7724/setup.c
@@ -300,7 +300,7 @@ static struct platform_device fsi_device = {
 	.resource	= fsi_resources,
 };
 
-static struct asoc_simple_card_info fsi_ak4642_info = {
+static struct simple_util_info fsi_ak4642_info = {
 	.name		= "AK4642",
 	.card		= "FSIA-AK4642",
 	.codec		= "ak4642-codec.0-0012",
-- 
2.25.1

