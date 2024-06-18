Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F160490C065
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 02:37:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C01582A;
	Tue, 18 Jun 2024 02:37:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C01582A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718671043;
	bh=XBM1Semt3LcPyAGbrWTnEAQty4kR0wtd9GxW6NwZugo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HUzo+LIBO/4tJ0TojQjBCKrsPyqMjjfpYR/D1OjlUFoNmD6DY+VoI4JZOQ4Mg98iI
	 PG6soKAgmXvS7j9uOMqiCEJCrPtpoCxE3GdK2YGYAMYsrSkhPQw3YBUqtzTk0nnYhG
	 eRkFrCm6PpcT7EwR9jwWLmrW0OLmLokGzIVi3s6s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E594F80269; Tue, 18 Jun 2024 02:36:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE93AF80587;
	Tue, 18 Jun 2024 02:36:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7C8EF8023A; Tue, 18 Jun 2024 02:36:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94C2FF800ED
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 02:36:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94C2FF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ZFJOP56O
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7yHxe6KO/ZD22tRXYebqeBKaspa29Y0D8HIugn+qA5a3Un03StnAhe4rhRrSATGd2G6141McBT3lMiwatt/r4EwM8JhAsyszhkupOMK91OnShj5ILuyb5YaBrW5CmfVEUcLsPjn7Ic4F56KkNAPrARUCRWXyH/34MgZEn/gVZxkSirS4wQzLsXOnmEdpynIfeB/5yazVagdaZPrMYbufGshOT9itlgeeiE2R4nWvB22W+LglzBIrjcKpvmQom6BlqFP99BgKfCpDhoZycpFpmvJEj1nLioUNLV1H6jRWfrzBgSjfr3xhdyU4V+DwmR5widldqfRcjEvWdNxzfpVeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1hfEIeXgQoYrNZhEEhZswvU6a/jCaZnvmy2TMUX/Pk=;
 b=Urvmy5kcuAvP8GadwGRoTF1PUGlP7I2Q+2MZ4UBuOW6oWl4s3LexfRU/m43+1rqz7RkCpHWqFLU3Q6KKxpHL+PzqvaKK6txV/VeuVZcU+Rnbor1s6SbPhX5gd1AtXGTY20tXBf054dUDxCcSeTjNPgcSYvTIWmMz9YBhzI/YqOUvC+z9q+k5DZGCR/EiCqEZ063u7uvxy73ij4P6u9+M1LpXVqb5YBZg2iw1gdvMhYSwPbwql6cAJkQjcoCNfRRKFW+cCkOKl8lcSZ0r5sWRTN9F8wNARzR53YzcMpgSpFMoZ1x8clOMtE2yVJlU0lPncKzIyNgJ2bsmuOVF60+HxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1hfEIeXgQoYrNZhEEhZswvU6a/jCaZnvmy2TMUX/Pk=;
 b=ZFJOP56OqSgON5l8XZqYBqFb++AqdpqL8X/jJaT4mF+AvC7kAl9+UV8KNBT9ue3Acx7qpj42MdezCJ1I8F3UfhabPSuCCO27MvsqyPYA5iZVYhbm145No/co+9u40NEO2ccHUT/YD9fIo5KhPXWoEJSWyD8xGpLEdZhRG24jgVw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11574.jpnprd01.prod.outlook.com
 (2603:1096:400:374::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 00:36:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 00:36:27 +0000
Message-ID: <87frtb3x4k.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org,
 Khanh Le <khanh.le.xr@renesas.com>
Subject: [PATCH v2 0/2] ASoC: Add ak4619 codec support
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 18 Jun 2024 00:36:27 +0000
X-ClientProxiedBy: TYCP286CA0156.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11574:EE_
X-MS-Office365-Filtering-Correlation-Id: fcdce077-2d94-408c-7b1f-08dc8f2eb0cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|1800799021|366013|52116011|376011|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?skj+KF0RJ+ZzN5S1PHYGI1kD2wegUmVgH1UELxlW7PHN0GHKkI67tigSyUTy?=
 =?us-ascii?Q?UHxBc/4hGRO1ZgO/d9ca2EGRl96XHftz1hZ+hOVl+el/tH4Ciz7OC5wJCCCf?=
 =?us-ascii?Q?ipbsfn4nK0iqEY67nvaHdFVt9yW4AW1QcuOeJx/voTPA0bjQwnBowpwzDPqz?=
 =?us-ascii?Q?P5q8ZiQLFYTkzwSmkWLqXhfLgytXA1wl1gE3TO82m3fonh1ejeKkehdcFUdV?=
 =?us-ascii?Q?euWz4pzNPHvkY9T5Almt+1L4KtZu9CwDpKByO4l2Ns+Cj2Im53szJLfzhZHw?=
 =?us-ascii?Q?AkOn/QfCx8/VsJkQr3QCYPdMvEunDoyZHZXhzwx8Qs127PGiMkaV0zwni6Pq?=
 =?us-ascii?Q?LrEwSkhrXtcGgHb31ZPGM0kLohWqk+SgGh4L0x3rnJ1T5lAIgt4ZRBDTjWID?=
 =?us-ascii?Q?xe+L9jxOan6bpgWVMM/fRaGym/SVGK7edS8VZfcbfIZXtQiHHqLvDw5xV7gC?=
 =?us-ascii?Q?A+LrgMIpIDZvIyFUu8UAGmhtUfDwlP8d3sV/uPTPK6eD3iO2IAgGOz/p6CGP?=
 =?us-ascii?Q?SgyN9jCNUbo74tzVQ+DyhtIb1hQ37B8Yw4pIuzZsAa/bpC8oV2EkhDaBBkYH?=
 =?us-ascii?Q?7agyP+Fb7dTJPk+z/scRFUj9Bzk1FLz7VLaExSfoOHB9SUcWC1sCku+SYiSY?=
 =?us-ascii?Q?fWp25L3zkYap1cmck7WZmOuJd1VjIaaYY03bLqZyTOeC7My9DBerPgoAmwmH?=
 =?us-ascii?Q?+vMgmLhstQVi7PmMi7BgkyRTDdJED9Se8/0XwWEJ/vrIp6hfcNRMNyAgrqza?=
 =?us-ascii?Q?7VoHnv48ReXhkNnL5hZbV7nCeVpEJi3+PgT7d7HnCPzVT1tv99gHOc41SnK/?=
 =?us-ascii?Q?3F4aIfJksqaIvC141F28NC2/9YidnVAJdi8JALQxnKtoQphMIupGYe8w4KM4?=
 =?us-ascii?Q?+meXXi3G5fgGRvH1Mw4I0Ybh3jmVEcPA62nmkBMnBrM2FNpQZAJbgumNknc3?=
 =?us-ascii?Q?euslmfL5Yd6ExCKrtth14P/sPzO7cTwQ2FJKPz8OdxBG4RIwWBSWqsu/SBGA?=
 =?us-ascii?Q?8wuE0Vd8LyC1mwbV/9ujTrC4iO4MyoIpwmJlEfTDYvjrS/f382qiqAhqWn6W?=
 =?us-ascii?Q?1GtNhlW8LmeOTt+JqnsT0bBKOm9qrHSiHKZ5byrRzvLiGh79FHY4dz8hSc8+?=
 =?us-ascii?Q?Umb2uSWBZK2+Q7bD3qZl9OSaSXwHxn2XTDjbE0C601Q5jVQ8dEu4+cXyAN6z?=
 =?us-ascii?Q?YFAahtmZPAd1F6Z2e+keaZMY1nt90okKSeT9t3fUC6Uow+BIWC81aAiZ3dzr?=
 =?us-ascii?Q?R2TPNMDjKCDWsNdviYJgdytXylZxqs9p2vUjorToFnMV5blMPiYfopLll+Wv?=
 =?us-ascii?Q?OdOp5994tSkxrQpgxKbikxBJ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(52116011)(376011)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mZcp59natkM01EQEktidUMFRJGGbG92yAx5gH+Cqn40mFNpZ25BbELtzQPdu?=
 =?us-ascii?Q?WBr6OzPjgCWB6IXSLUzXPwPe2yhV273pe/R9fvFiFkr8lHERYLSSJoLTKMWE?=
 =?us-ascii?Q?BB4ZC+OAP5fm9FlibqqD5MAUyD7jhrCFGWILGPKJE1W363w4qirbCg85Bclu?=
 =?us-ascii?Q?t++z1NJPi7sthGszIw0ewhTDnx7t6o8xj5+qkDWKGvIb8rHQ8THAabD8Quyt?=
 =?us-ascii?Q?VqwmgXciEc2Bs2MaoxTwcJMArGtuIi50egfWAgKrDZFjFc2HL51PkxYJ1RtB?=
 =?us-ascii?Q?qwRZRKswLI1eRuVfPf0A06VLkx8IaAPkwFOV464AKI/7XlK/RJOGj89azyIK?=
 =?us-ascii?Q?FpudTnltvCWn945tpSW//eWcN3+57JVrjIYNmUYvGAI4wDqY3hSgUB6+FGmf?=
 =?us-ascii?Q?7KAYVb9r73SVOZdFRmL/Eyz6jkPNANFvLZWxSQH6vNwHDgYHRiQFLuC+rJy9?=
 =?us-ascii?Q?ZH/2rXMNrMPHZiJdNcWz03HioHJvr0Cb9ye7fMg8dtDH/aLHdgJ6TVG7sOQ4?=
 =?us-ascii?Q?RSvOlKp3jamhFtxFOyUZSe9/y1B2ccKxKq90+TWnP74AU60HObOTNnp5qu9b?=
 =?us-ascii?Q?R29z4FKUhGizFFj8MTbXhAxrCwsPQquNXiM5TaWyBj+AcDoJamRZEbJwdcfq?=
 =?us-ascii?Q?jokABHIqMboZx9NSDU8XL1gBbkuBGRsf+aBj2FX4V0C5r8NCq1VH77XR3E5M?=
 =?us-ascii?Q?LcSzD4Dh8iZOC40brAzQQ2gYRvBoXDp+igyc3No+d9H65SDNjh40N1vgtToi?=
 =?us-ascii?Q?UQV5DdOBfxk5i9GS/cNzzVcNbIgCvBbQebR5a5KCwbgjrk7v+HpGgCH+WM5V?=
 =?us-ascii?Q?2r+H/Ro0fmZt+uvvNaa6nZ5GT1P3VTvmmmpl5HpYt3mJHQZcw0p4gIhwVuZU?=
 =?us-ascii?Q?gd+enzNHa4F6lBC97PEpoeJSwmaKvuoVuPWrBzNxvdtWCuQ3UeYtirzaEeAZ?=
 =?us-ascii?Q?av2+tVf8JOLG7gFcATxpivBxx+5tCLQVWK7BlTwmTf85hUs20d01jjtLWtVx?=
 =?us-ascii?Q?qby1T10yJ9Omscv89HnlH4w94GOwuaxcLDqy2b8sxf9DMIEBo0fd7QCQ49xP?=
 =?us-ascii?Q?N9NhTXsoH9K3HAiTEV44ybO01S37UpDgllcITi9Lwmbc8OZc+kyNIoz0zqxa?=
 =?us-ascii?Q?026xF6pYcGv61uEKtcPF7HUkhwyZrlk71jbRISWWK7gst9CLiTGIevmQerhr?=
 =?us-ascii?Q?XGlCpntyNBMcRRlwbe5KnWDlrYlucrX6QOTfiKmsYQBi0sYkOgVsD4EIpSrp?=
 =?us-ascii?Q?EEO/Y7KU/YSJlYc2stdax78Boh7Xu4G/O1TW22ZXF1Hyy6oDligKYX3OypCQ?=
 =?us-ascii?Q?uJFg+kR96Yj1yPTjgxxJ/aEUjP4vKtm8XzQ/wxvACby3/MGgTbV0X8AFASx8?=
 =?us-ascii?Q?AG0xdgxSoxVOGlfknTMUx1tfVqCMAu3eBvSKrZqS9UMrmKKOyub+zHIE+TTv?=
 =?us-ascii?Q?hcXm28Ia1vsY4bQOPt+1n/2Q448FXb1XPEaWfFKxJivHZfXCYZhSoVovYUby?=
 =?us-ascii?Q?DoXPy5v3YV9n8CLrdoQ/PudGZvspWKIMR7Hg+4kfKyAB0sxXOjdl4TWmkmpO?=
 =?us-ascii?Q?R+ku0OnLjCIoXXjz+CtOEZT/POW5Gz74WSLJlUvbP6YNu0UFJRK19eiXCNxq?=
 =?us-ascii?Q?JvJ2hn5x730qr3D9lkBFWdw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fcdce077-2d94-408c-7b1f-08dc8f2eb0cf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 00:36:27.8700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 npACvHL+YA4v9fUsLkxkbPJkeyhWqMsUA3qF+pSbFLgxu+BswVWLRzhs5TIpmViTYIm9m1DFxCgg7DuSHR1J1pB1c/eJy3fs2G/T+2CgTKo4qGYTf9xnEw3xGobxqo0g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11574
Message-ID-Hash: HFM6MFAP3UTD3QA7IAHNMA5XKLO32OJR
X-Message-ID-Hash: HFM6MFAP3UTD3QA7IAHNMA5XKLO32OJR
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HFM6MFAP3UTD3QA7IAHNMA5XKLO32OJR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

This patch-set adds ak4619 driver.
It was created by Khanh, and I updated/adjusted to upstream.
It was tested on Renesas V4M GrayH

Link: https://lore.kernel.org/r/877ceotnrg.wl-kuninori.morimoto.gx@renesas.com

v1 -> v2
	- fixup git-log style
	- add vendor prefix for Doc
	- remove "ports" from Doc
	- add examples on Doc
	- add missing property on Doc
	- add const on driver
	- use sizeof(*) on driver

Khanh Le (1):
  ASoC: Add ak4619 codec support

Kuninori Morimoto (1):
  ASoC: dt-bindings: ak4619: Add initial DT binding

 .../bindings/sound/asahi-kasei,ak4619.yaml    |  62 ++
 sound/soc/codecs/Kconfig                      |   5 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/ak4619.c                     | 903 ++++++++++++++++++
 4 files changed, 972 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml
 create mode 100644 sound/soc/codecs/ak4619.c

-- 
2.43.0

