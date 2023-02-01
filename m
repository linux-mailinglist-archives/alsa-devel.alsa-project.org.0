Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C62E685CFB
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 03:03:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 556661E8;
	Wed,  1 Feb 2023 03:02:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 556661E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675217005;
	bh=ndBPOEOG7pTa4qKu397LM48FdXsi0ENZoaL+7Lnu+Js=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GPNRSLk4HviUK9kkWfLjuNAxhcMorZJOIIBPdkGkNKJDbUYFO0o4jJpkRXPHhhQ41
	 kp66Fq+ZrCCSHFbCW5SgRQPcKdPhJ3NPd2SoqYX6q055TPyGz+dn5V24ULIg7XoBnU
	 uBlkpOGbDvPiA1vwpTrxnzmFDd8WwIMp7H1zyjwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 438E4F80557;
	Wed,  1 Feb 2023 03:00:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91E5EF805A1; Wed,  1 Feb 2023 03:00:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=unavailable autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2124.outbound.protection.outlook.com [40.107.117.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E423F8057D
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 03:00:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E423F8057D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=IktRBJr9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3v+1hMl3t9Qf+dVAxT93YPh407pHxwZ2GOmZhjtRZjcgW1Tp/YPe8ecoyNrmy+RJ/RgW2df2+OJj7zmNuG3CwkXRIS1OfWRzbIp5grWD8Glntpg1CtEznrkzICtigZdh5LXEsX77EhIAf+4vZAc+rWRcy6X4rT2GdALpdElQrwNYap3TXDwZa4mMA2wtQGBCTNX8iHCWlVwa8NLF05+L6qvB9PJELnAnZ+XuqxitiEfJRIEOHqL5lWvxONi3DCT1HWlo8kn1MsALMHjigvXzE5Y5FsyaC9uTVAgLdgcnAMc47AdXG7XSTnhQALbr+Cu8kfWBbac/HcPKH3Cba9Djg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5YMEvz9vpzCYAGyFsKoyVOgJLU6Z5Q2JsBZ0uy6JPA=;
 b=dfvw3qanhlWa0S23E+UitvLFtIlRKYoT2ktt/dvNmbnl9zlj7y4TBZGVleyXP7gjLMibdV88HNqjvLY63uqs4avTZ2XVspHtvIrKs4zo5V4qDC8LF7ycQQphiVXZ5p0mINBzPRLcZCgQcZzoaFdVHAqSkgyHSuZbuTeRTGlO0jhGHNIGBYLpbEVVtr6a250MQciV6nJ9dxrPVW/SpykzXiSnO0fLd+A/u3l01aolBYAkZm7QKGSGtuTxay/3JokOm62bV9mWb5L/4pqBK5K37H06rET0OBmmws9PUFXo96FuSu/Xrf6cMJ0ElPEWK8PkVeL9mGF4dh6IeLdMGStOSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5YMEvz9vpzCYAGyFsKoyVOgJLU6Z5Q2JsBZ0uy6JPA=;
 b=IktRBJr9vmQE9Tg2qAFWQTNH2+iJ4zrbmGjgPr1EZHEYCwpW330EQqOD66FHetTSMKNpiAPHW6C03z2/yCDqsr3Ik7g7cwDu5pjSbk8BMByt+j8tiNcgr1LdGugK6joJnNPm7OAV1PP2TjZMqC85vFzBz8skcycKA+VF2NnK4g4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8772.jpnprd01.prod.outlook.com (2603:1096:400:18a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Wed, 1 Feb
 2023 02:00:27 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 02:00:27 +0000
Message-ID: <87wn525emc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/15] ASoC: rsnd: moves clkout_name to top of the file
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
References: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Feb 2023 02:00:27 +0000
X-ClientProxiedBy: TYCP286CA0007.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: aff410ea-b644-4f2d-d43f-08db03f81713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k0eu7ZbiSh2CybKH4ds99NmQIkspUFh6b4TV624iXDMVX/Byu9L0DYHxPTfsFPl+cCKZF1CJDwqSPS2fJ2h9IKS1CZEKz0kY6P48VjWQfKLwUt4SJo4aftggWMEQw+8gciULpzM+mbjdbnwawPnYn5sfF7KmgEIeMLm4inPDAppBRsvgQMuGl9+YSHgYwOMtfO+YtQ0Qk/F6LSrqu0vxdc31+//uNvjm8ngknZyfOZxuKKjWmxFfQV7ZfXU+idYlB0OP045gOpGkVGZah2a6cPaonxIJQoW+0Xx4yWaaD5dsGsxvDhErMnJhhbG4bsquRhXwuof0Lwkbt4PEle+7FUtA8i6wZKMvDgdDpm+qtOfdvZsYn9b+hUDywzEz5DMVKFKpEDP2JQRTraskU9+NbKG6Sq5dLzHIHieZAGXHN5oBtr7ccB8a5ZzMU8qfV5YXQ3SfSRORgnSVVnp4qww6NCHIMmwCL0n7WQWqHArZV3fAXUyBm/KdXdy+goI9YFBzW5cmYURgG2bASjmtf54PO+PYWj5ojIv9jArlf+tNfIqZAgdX1QX+kp0rZyWMC2TEI4cYS3WWbK8EJHWx2XlzItq3tKEBp+qiBxRGXHcafsXyUICHSZnAO1Y3EfoQPujk6ZMp/glaQN2LLrP63BbYIOn/OKpwGKEqZ1vX6sGGPFgaHB+/aNN0Ygy95DRE4DMhR+n4GvLWaZ87Imz4G53aoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199018)(86362001)(36756003)(38350700002)(38100700002)(83380400001)(6506007)(6512007)(186003)(26005)(2616005)(2906002)(316002)(66476007)(52116002)(8676002)(6486002)(478600001)(66556008)(6916009)(66946007)(4326008)(5660300002)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NaeQjmN75cl5T8Xe6d/tIYdUIJWXaJDuQ8WrJ3mUT4pF0xpK/nGCJfdnZF4j?=
 =?us-ascii?Q?1F02H5YG3zf3xBgujun2GVNuroaukBdgfYc+MPLGhXr2ZPUB4O0EQOLxh75f?=
 =?us-ascii?Q?eQB/gxxSDbA2jfvFT5zCHUV68F4lIKb/1VSqvquwMIV3JdK5DPwXliW0TZPR?=
 =?us-ascii?Q?jOQ07FzXAN1djJBTRdFrgBIVfcSX4/1osCovfRX8fpDSLkLZMB7K1g6ytYYN?=
 =?us-ascii?Q?L/xwPS/BXbXOrvpNeC5SSp4hbCayRTZE0NnJ0N93GuFgxABg0MZ9Jtus/psv?=
 =?us-ascii?Q?5FvIIbBKflU4b/e1ERFxxmi61twSt7gRi3E3zAAQNaXRshukfH0qKpfuuNfJ?=
 =?us-ascii?Q?lN4YD7emagD/Id6d7cfVrfZP+o8KJ1doDnXgMTqBVdJ45DPhITSLjUn4CKqW?=
 =?us-ascii?Q?mK1QktIwRJR1vUv8nLwdjNmqb8qBJA12qX/vEkbd0RRFPOVWl1S0XOkvj4Ci?=
 =?us-ascii?Q?MMzt2k/ogoPzaMxrs1RYemiBm4bQkDW2x60fkRpZP+76FXWZDxN1tzmPuNwC?=
 =?us-ascii?Q?KmOynbil/y7pWeiWg9RXAArjCvxcbRYBehRQUvb2iDpPIcMNy87yr/WUsBF2?=
 =?us-ascii?Q?vmXb/r9didtVFWyhcs2zlaAoeqLGGvtu7Qv16BSavXumGdrVw1QmEidLgyf0?=
 =?us-ascii?Q?/CWYGp1V6ba44sC0ESwpgjV7XAp4FmqJwf0cEo5/Dyaiphkm+4Saq/BMvTPq?=
 =?us-ascii?Q?dNq9ciOEb9oIJOFZbZwWRucIgSsdvLTJ3yEG7K3/aFnLXNKa+/0L1sthsRCL?=
 =?us-ascii?Q?LIOX2l5SLnYACnravpe5QQsqoJ74ZvCtAd9yJM3iQ46z6WIbN1Y3Ux5YXpfb?=
 =?us-ascii?Q?8XjZaZWCe52QGGPBBcbar+YgxTrJzdpHgjnTrscIvu+1UNQW0mVTUs+pvDg4?=
 =?us-ascii?Q?UyIGFgJyMgLzkp5Qn/fAoIzKCJIx9TtsPlXYLHv0UW3m5Qh07Q+iz56WM3pi?=
 =?us-ascii?Q?f5aOTb9hvZW1wVwjJvsfvdQHrT0DgiToB2HvlzcPqBuMvA0tGp0Unf90hGVp?=
 =?us-ascii?Q?hjQfB/w67XSf2NJHfRoLx5QJVJDpTjcKD5vbvHgKqpzb9Jc404UAxsXTHROj?=
 =?us-ascii?Q?FpcSE/Pn/3weHO9vlckWep8fpStURnFy/yDVrPZFl52Ur5coKnPu5KaNszRO?=
 =?us-ascii?Q?bJzrmBult5FHMap4DprJOPnqkPqx8gvYd2r3clBo6/LTFKR2dHc8jovrq7jd?=
 =?us-ascii?Q?q6/fJ2soOBAVPs4HDO6aFU4Qe4Bu+FZwRa6UfAkX6L6rT77AryUCuew5sgB0?=
 =?us-ascii?Q?tkMdmsYXSmLTqAO2Ccn3JHRECCj8JfByEGIzNzYWI5QAZzKmKJ+ZhYB19dll?=
 =?us-ascii?Q?gRnPUsApravEYaZrLRCDtpWCxk1sAHUChTHXb/uqjSBSMORZaKu07SA1yy5R?=
 =?us-ascii?Q?A48x19/KXBuUc9AsmvFT1X2ie+mNESzguDCzqdPTJpUmHKM/ErI2U3HHsHXH?=
 =?us-ascii?Q?r3YrGtZMhsTDDAEpk5VbkZCExOHZKL1fnAHWUOHE8JCFNhtyOl3/PArrpvva?=
 =?us-ascii?Q?OK1Gxz4ORNH52ONyAc3GJpxAVQVD9aHeve4xjg6HNLl7rG7lxPYf2C3qcN6X?=
 =?us-ascii?Q?Ij+P17Y+L+vmeDEwGWDGPW/dLLfB1aR73gBKG8IGY8SXl8sq27uRhSMD3ZhT?=
 =?us-ascii?Q?rjHkmT1hdY9buAAsVevW67A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aff410ea-b644-4f2d-d43f-08db03f81713
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 02:00:27.7942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HzLyuT/RaSWlLLlc8+8byfWPVeM4mzfezmFnqUS65cKCxtSyeX6pJh/QgK8NsXxBo82Een4FNicZpMFxpE2ij6WUwmRQSDtre7o2jNouHF1f6kXaRCGX+NTeiRjeI6gJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8772
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This patch moves clkout_name to top of the file to handling both
clkin/clkout in the same place.

This is prepare for R-Car Gen4 support.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/adg.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/sh/rcar/adg.c
index 6392d20ad4a3..f937cd4fe09e 100644
--- a/sound/soc/sh/rcar/adg.c
+++ b/sound/soc/sh/rcar/adg.c
@@ -59,6 +59,13 @@ static const char * const clkin_name[] = {
 	[CLKI]	= "clk_i",
 };
 
+static const char * const clkout_name[] = {
+	[CLKOUT]  = "audio_clkout",
+	[CLKOUT1] = "audio_clkout1",
+	[CLKOUT2] = "audio_clkout2",
+	[CLKOUT3] = "audio_clkout3",
+};
+
 static u32 rsnd_adg_calculate_rbgx(unsigned long div)
 {
 	int i;
@@ -465,12 +472,6 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 	unsigned long req_48kHz_rate, req_441kHz_rate;
 	int i, req_size;
 	const char *parent_clk_name = NULL;
-	static const char * const clkout_name[] = {
-		[CLKOUT]  = "audio_clkout",
-		[CLKOUT1] = "audio_clkout1",
-		[CLKOUT2] = "audio_clkout2",
-		[CLKOUT3] = "audio_clkout3",
-	};
 	int brg_table[] = {
 		[CLKA] = 0x0,
 		[CLKB] = 0x1,
-- 
2.25.1

