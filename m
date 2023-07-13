Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4454754EB6
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jul 2023 14:59:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAD24AEA;
	Sun, 16 Jul 2023 14:59:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAD24AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689512396;
	bh=0f7/EYz5sCt/loFy8J+K7H13HuUxy/zt7tByPh8s8R0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qjNKYZP/kH+je14xurEmIPGRqp+6edfUEFAsPplOEQtLLudvI+8S5O8KqcWmrCaQ+
	 r2aLKJsakY0LcolOa1qwTUQw01vTSoSRwOEX3neldUkzh5gCnqGeW/W3YYId1S6COk
	 I7Le7qszRUMJa8zkxvKHnNh/YOsZBV8SDfs1ZA4M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CBE3F805A8; Sun, 16 Jul 2023 14:57:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29CE6F80587;
	Sun, 16 Jul 2023 14:57:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C93DDF80249; Fri, 14 Jul 2023 00:25:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D29FF80153
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 00:25:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D29FF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=YC9n/jja
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nk1fU1KM9x2//O7LoUcelAX/taayqiQqqXV8NYUiAeQ4R4SF9y6bAw2xON2x5919Q45pghPscdFhYTXXN2m3jdyN/jTgQd9ts83ozjxdindI6FdugGsjHWtrzJqHnSCpr+JR+TGUlNH2tYXGlLP0S5YoZsHuCnFHfkTyaNSeYCG0efLbmTkx1JA1brj2pL2Xge/6fgq/NgpZgAaTn53ODMC1+e0pEZKo6vhSYZHQ2TnRYOmc4ieRjvOzHdrnnbn64NzMjYSHEjd3N84zHuQcCHicszMZuCXm2Bbg74Cu99PlqKJdN86WnA8WhUw8g/dGBaLYO+HsmecHdYR/U6C+5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3Ja3XydHohlEjuiC77t2CBkeeAzV0R7OjAAbBbe4OI=;
 b=ArdsqXoVzdIDKyBCTVOwZijrvkXz+oEnxb+0dcLlAUbfAn/vjX8/8UnSf0jWEMc/4imR3JSwTqFIqnrnflyZLuDdvBUSvMteooyt5CborkO7OZtLwXPtWJZn8T8Hw7olbDzH5AvjJI766nrxxj7rVAGnGB2ozK9QdoL7IBv+U5s6apC5GnaLnmcD9sYF2GkRaa5LhdABOF+DGsBc/rHd1In8YOeGS9/lnM8JiKgL2C9b5YEwyd5n8TgSaTDrqLOB6N5eDQOdK5MzSSZkkK4lZ5nQOOvcQuD1nqu1g+kuNEakocxDofN85nDrloIHtocQfXpGKEr93XLo+teeUiwXRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3Ja3XydHohlEjuiC77t2CBkeeAzV0R7OjAAbBbe4OI=;
 b=YC9n/jjaEq2vRiElz/mhCbPWUyBPqKUCydALxlQKWWDLIvdcpsTAHoN/u+97hceLIEVNtMx6E1dtR8piejeBTaxf8+9npivtlG2iotsG45vPBOnEGPCDa+PVwzmSOk1qFzlq42a41UpQ1o3gqlkYqWhWxpUddyG594brtitk05A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4845.eurprd04.prod.outlook.com (2603:10a6:803:51::30)
 by AS5PR04MB10043.eurprd04.prod.outlook.com (2603:10a6:20b:67f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 22:25:35 +0000
Received: from VI1PR04MB4845.eurprd04.prod.outlook.com
 ([fe80::e93e:96cd:99c7:5dca]) by VI1PR04MB4845.eurprd04.prod.outlook.com
 ([fe80::e93e:96cd:99c7:5dca%5]) with mapi id 15.20.6588.024; Thu, 13 Jul 2023
 22:25:35 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	=?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
	Wolfram Sang <wsa@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	patches@opensource.cirrus.com (open list:WOLFSON MICROELECTRONICS DRIVERS),
	alsa-devel@alsa-project.org (moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM...),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	shengjiu.wang@nxp.com
Subject: [PATCH 1/1] ASoC: codec: wm8960: add additional probe check for codec
 identification
Date: Thu, 13 Jul 2023 18:25:12 -0400
Message-Id: <20230713222513.1636591-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0069.namprd07.prod.outlook.com
 (2603:10b6:a03:60::46) To VI1PR04MB4845.eurprd04.prod.outlook.com
 (2603:10a6:803:51::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB4845:EE_|AS5PR04MB10043:EE_
X-MS-Office365-Filtering-Correlation-Id: 19300ea0-7543-4b18-ebdd-08db83f013cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	deQIv60CGCLtsuHwBB68P2RndhdeIgpJAjqxIWMLYHiN8elAVf+5UPYRQhEOhbZhjRltFGRmntIMCOnDFv56QbfLMLWhMTVGKNWPxWdWUWw+UZlzD3/xPukkdnTwgbLYuy6fDriAks5ruQ/sIAjS+fqMGSGy1BcAy0vqEXO/K8IyNtq5yRp7AHcRQU8VPHtbc7OmGavdMAHE8JnjN2ltf4m1IVC8e+lXUw/2pFPiGbRKozFlgO0gol7S2d2BFSICIO6pt195Z+15W06gAyqKiSRvN0q9CcSRoPI8HLyNnq3o+gkb3PpUk+Cd5e8ZfHJEZAwwAEMy1jHet064zWHW6V95bz4Da4mLITS2wnMLps8hk9E5CTsANJLPzGhHmo8C8roZJn4OjmVj3ajvFN2/LB6RZKNUZfkLwrUnO0stN3dg7fedKR8hghsU+d9aWYOaHMreqfY0u5flsFBTzoE7lYVXqoXlUc4bksH05I0MFD34PW/Ciy65s3uyOqJw4sQ1dCZijZqnjpxT12LPOquxG9kJLM/mx3a4t9jan82ORxs/AaMGoiFEXFVvkY3HKmwHjeB4HsF9ZgyGotcLqPc3ry2cUqNEtj6JYrpYUd9Pcc2t3demFHuiowtywMRYGoOww2ETo5UX3KCO6QVVLnF4CQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4845.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199021)(7416002)(8676002)(8936002)(2906002)(2616005)(36756003)(38350700002)(38100700002)(921005)(1076003)(86362001)(5660300002)(26005)(6506007)(186003)(316002)(110136005)(6666004)(52116002)(4326008)(66556008)(66476007)(6486002)(66946007)(41300700001)(6512007)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UhrMiNRgabm8CY+R9oAmGPtCyppvCcxthcyC2BbFi0l1Se31VLP0VgKaJkXE?=
 =?us-ascii?Q?BDd2sW+RwypNgWPgVldeI0kPQRThYAwXFOVC8sYOJYIUGhb2SPZBtViJCpnL?=
 =?us-ascii?Q?DIPLkIg+I04ZdjxCEOm2z1awKUXdITQnSdACYVNKDxcAoPoQsgM0Wz78Ynts?=
 =?us-ascii?Q?mRY101QB5IPKGCBZ3TAo+w3b2TxD3MDfgiUmEsjuyYGQFp/orLGHvfmAwRFy?=
 =?us-ascii?Q?Y+hli5o7ryDe16C+vgL9TsSOgTKjijV+xZ2ulir9LprBU4yGm/kcNI0eS/rX?=
 =?us-ascii?Q?6Sf3kQ8so3MWh/pOqHhyY5vLXgkYbMkX2XjeTJExe1hUOYX14l8FBYVPoe3d?=
 =?us-ascii?Q?h/0okT3fosqohT3hyqMaig+I+SN+DkNafyGSanGwYGhAK1JD05A/piso0+KC?=
 =?us-ascii?Q?NXAlDNDyjWAZRFBeXmh7/lTk1Zv6KCdPoB3EhPDP/nj4cFq+MzmJB9l014aQ?=
 =?us-ascii?Q?Ui6rKimL6TYz2NSDbKj4rfRFkBea9GF/YMMQkX4g/QkE1ih9efnpmGnKLghW?=
 =?us-ascii?Q?pXFolwTayE9YGT4XBndtYjuxgDgCVQJM/eua0gwWfm2hdSIbt4qyBtf3gdlo?=
 =?us-ascii?Q?W9TQcNG1/21MQI3GfTAKHhASsQIoWPYo/LksTjss661GWSBKW677Ioe05Wpl?=
 =?us-ascii?Q?QiB1N4a/stgqGR03YrSI4JD9cnchxRinnPd9t29nhM05N77omRd9dm+eEkOY?=
 =?us-ascii?Q?jNJTB3aSsMK0psNC4fidp6pXo1CYDn88kkts6rTpf96TV+u/Wy3sx8R5iYso?=
 =?us-ascii?Q?mvZVLdpjs70Zpca6q8VrvURF9ZAI8skfCOzXUGLHq353lfJAjwfkekRfekFx?=
 =?us-ascii?Q?tAhqokTKJjkZMvD4VZd2J2s7RJEdmHssDgf0L1uZJZA/vdAjRJvHbTmXi6jw?=
 =?us-ascii?Q?BO+yCGYkwG3BH+gWPZPswulqEDl5NaUI0vJ7+xuNlSioaFDtnGdf5J3isqt+?=
 =?us-ascii?Q?mO08CqjykB6cGX4WEYoSjXKAgsJCqxJORMDpCfyKtU8cR8+RawymKLgE+JJ6?=
 =?us-ascii?Q?G3g6z8sYDR7F1mrnyA0X82RJH7J5/RiGKt7TPA2Rj6WXhA7gHcvyajtb7ME7?=
 =?us-ascii?Q?G9CHVcCqv8WwwAchGDMdCDJ+n/EcSnNAyjL1mCyc3TDpCWArfea58u6tJQVe?=
 =?us-ascii?Q?HVNBwdSJ0Snqq3YIRdyWJWuVnJUYnZOYEthNd9dR77fzqnxviEoBMZr4WqqE?=
 =?us-ascii?Q?+UCaUVCH6WinTKVcmk5yiSorulx94xFYlCbK1rrCWA/4ir46G+PME5153f/I?=
 =?us-ascii?Q?tvUIpCdNEvaEjGCxKSeAJNksnK/N30/VKFvCRfIaKoT3HkxYpFW/Md0o6afV?=
 =?us-ascii?Q?Yk+yW5K6we+7aYRMQ4Q9MnuxNCLsxHk8D9VtUe3rsqxBIo9QuJ65KmfC8a6v?=
 =?us-ascii?Q?+227KORwIO7fQlBn9Eac5MeFl04Uw1iSlemgfOyHV+A/JK/cfB2984+vWRil?=
 =?us-ascii?Q?PncaBCtMgH+sgiJaW8MmV1H7f6ajsnZ3a0fShTCyEAZeSRkZqByWSRqYJQZF?=
 =?us-ascii?Q?jCEigsvB+zBI9uONiQhJhNUYcNjKiChpyAfN0qupb+6mCw7L4Qt28FmqZBNU?=
 =?us-ascii?Q?UlSf94HRbA5PmvuenwmgFwRil5ImT22XMdwMQhhd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 19300ea0-7543-4b18-ebdd-08db83f013cf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4845.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 22:25:35.5569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HOD5hmS3I7sBNkRtM3H/3riyv7P5+vikmgkhepbmFMsaKA8OR4Kd2CJdAWkcnTH0wn9o7uIjjQVi5zDgjH6OOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10043
X-MailFrom: frank.li@nxp.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OLZQR3O46I4V5XKVU5MXEENRHKFPRCKQ
X-Message-ID-Hash: OLZQR3O46I4V5XKVU5MXEENRHKFPRCKQ
X-Mailman-Approved-At: Sun, 16 Jul 2023 12:57:52 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OLZQR3O46I4V5XKVU5MXEENRHKFPRCKQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The wm8960 codec is not readable, resulting in a NACK for address 0x3d (8-bit).
This can partially indicate it. For example: wm8962 codec use the same address
but is readable. This additional probe check will help prevent loading the wm8960
module incorrectly on wm8962 hardware.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 sound/soc/codecs/wm8960.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
index 0d167238a369..783c85912c59 100644
--- a/sound/soc/codecs/wm8960.c
+++ b/sound/soc/codecs/wm8960.c
@@ -1415,6 +1415,7 @@ static int wm8960_i2c_probe(struct i2c_client *i2c)
 	struct wm8960_data *pdata = dev_get_platdata(&i2c->dev);
 	struct wm8960_priv *wm8960;
 	int ret;
+	u8 val;
 
 	wm8960 = devm_kzalloc(&i2c->dev, sizeof(struct wm8960_priv),
 			      GFP_KERNEL);
@@ -1436,6 +1437,12 @@ static int wm8960_i2c_probe(struct i2c_client *i2c)
 	else if (i2c->dev.of_node)
 		wm8960_set_pdata_from_of(i2c, &wm8960->pdata);
 
+	ret = i2c_master_recv(i2c, &val, sizeof(val));
+	if (ret >= 0) {
+		dev_err(&i2c->dev, "Not wm8960, wm8960 reg can not read by i2c\n");
+		return -EINVAL;
+	}
+
 	ret = wm8960_reset(wm8960->regmap);
 	if (ret != 0) {
 		dev_err(&i2c->dev, "Failed to issue reset\n");
-- 
2.34.1

