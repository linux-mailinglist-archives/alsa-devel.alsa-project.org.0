Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A436C995B
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 03:33:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 790FDA4B;
	Mon, 27 Mar 2023 03:32:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 790FDA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679880805;
	bh=mO2m9AB9Mc5zKwtGhNAEvGhhfAfKjHSmWhvngFOfRcI=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tdkQlYWNyZyOKe8c5QaEEhZBMoQ2yXQxjIiLNWSrdztRm0biQYUCt7ZweV4izWSAL
	 KNiIwgVatuCtbzXBcKzHoQLL/JWtAVEdp4ZAihbeRh5DczAsWP4WC39Hr9aQz++f/S
	 UCuIPmrgftwCCJCVANdkfxhcP0v8kTw5th3ApRrE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3E4BF8024E;
	Mon, 27 Mar 2023 03:32:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44A15F80272; Mon, 27 Mar 2023 03:32:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-3.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::703])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52203F80249
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 03:32:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52203F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=fZdjqzBY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BsZIbAGPQa72qlJNuQp5NGvj0Hq5Bmg+rmNdGbrSoEIOJGA9xnyee8pwWpx5xvLdnz0BzyOx0X+HwBuFNWY4vhl2hKWHZGgKVQpSWThdP5izlnH031sxXBlTVCsGezDvjl2o6kwgBK8fN5OAB5MKCjCUuJ7mx5EGOPYQL5GlcG6iN6eLtgIiyINPwQG1fxvdqCsv78ntg51ol0TD7Dh3aP8UxMkLa7iyAfkibzS4Xf/2e4hRtb4VL7oaH7EAFiF3pgdvR7F1XeE5FOGeKtuxaaUO0xFKXdLFKewj2YAg201lPSxB0H8X08s4Hgl2usoyOThN+4lbYxOhPLRNJlI8rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4hFpFfKO5xn+gwzQSOq2+Sl0VXWvCn9dQbq7aOEgCs=;
 b=c43C83mEnHUEMkqDjmfWWgzNqE9PrszJQmTwFk8DBC+YosyCMBYRbKl2J7uvAKSog3cx/pBrmOlxP09SXYIbbSvBh+5dl3AxSoSfrqOoDIW0kwca3AzB67wmZa+8Sn8UhCC1L6cLWX1ZGBWCQX4RUnmT1YpXfm9ccqT1bNH+apngicjEDKS0h4hprrVPNgAzm7SRR77vWcLJBtS44u24d5d0lhRTylJUckqCKiDbypTtFcjdx7w62f5N5SDtXeW4/b2s+sDCwlyoafKNxU8kGV8ti6yRaxGXTgTgx4sc4AhyKpYw2CB9vok4onbxCAvuJAZRk9uxwFKekn+7PZfKeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4hFpFfKO5xn+gwzQSOq2+Sl0VXWvCn9dQbq7aOEgCs=;
 b=fZdjqzBY7G+8FA66WAwlvYQZBybi9QCztFtnOSny/0JFgDGsB492ctBTGQ4nHCNBFozQ/EWobRbzMgbketRDf58Xxm+bg4uvpfO5VPpHdCLdgeJnwY5EuzzJxzLP7E1F2N58QD4248cUs4TN1r0gz79R14PGp9Zn2i4/Pth5vlk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB5673.jpnprd01.prod.outlook.com (2603:1096:404:8052::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 01:32:06 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%3]) with mapi id 15.20.6222.030; Mon, 27 Mar 2023
 01:32:06 +0000
Message-ID: <87fs9r6ktm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: da7213.c: add missing pm_runtime_disable()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 27 Mar 2023 01:32:06 +0000
X-ClientProxiedBy: TYCPR01CA0072.jpnprd01.prod.outlook.com
 (2603:1096:405:2::36) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYAPR01MB5673:EE_
X-MS-Office365-Filtering-Correlation-Id: e4a7d04e-996c-45dd-57bf-08db2e63132a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Q4uCXFSn+nPDAEhmr+OvBI12gS1YxTEjfoMDS7JEBlePQdwO3ByVFfS/N0d+RIq6/ackyMqsgpy9rSFor0TPIa9HTidEJojIkOiQXAUE5gneSaIGQpki4RB3dp5evFiK9icpKpDepB7M2GRb4c0n9QMEMnkh2i8ooCB93ua+42PBWs6LSNHIG9xZpVjAw5/KvPAUZIgUPoLsdS+vDxS3SJLmpKuP8oQxfkDro/q/cTDsmMADDCHyLWWyU9HPccZVcoI85mrpB/Zu+AQPtA8LLztobizFIvq+goigZfC6HkgLqdAAiTr0ktpJBSV6rHtQeB52A+XNznRj5DskhYO1cdB4ALlshqjBWaU3Tf1jbr6njsIYeCND8K+mX85PXT/bMigyO81Yq3BT6wKHDMWX0j6IiCz8haMzH/grr9yxMHomCwaZ7w3VmW4RNRzRdf82L3K6DA9kO0lr7yCqZ0w/xf+cdUsTlsvrjnZU13plz8VvMEDqFgZfpdHAAMNH91zFCWDiNjZxyFDVJ8sfozhSeaELCjU4nCQOlk1o8ZfgG00bpWaB8/rGtJGU32njhlGhkYzrpeP2Rc5UgQfjSbceDN9uFUH5RuydPDtAih8e05mCj3UQjW+EU9QpVE9l4zZJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(451199021)(316002)(54906003)(478600001)(8936002)(5660300002)(36756003)(86362001)(38350700002)(38100700002)(2906002)(4326008)(66556008)(66476007)(6916009)(8676002)(66946007)(41300700001)(107886003)(186003)(6512007)(6506007)(26005)(2616005)(83380400001)(52116002)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FH5l1Yj6/NJiU6HZStW5nxNzNAOYJ4mi4wyu6NJRsF4ni7meP0oIBz7GFKZv?=
 =?us-ascii?Q?xTqFcCrSBcRpq6FRPrl2p8wTf6cCKFwCc4l07oUSfn8MaubQjMTfWb7GBWJs?=
 =?us-ascii?Q?RF4QZqKjK5ufqA+wNMaL9G1eaDs4uN6Ot5TMInCKMwTYAxzjkPal/wsnSGqk?=
 =?us-ascii?Q?Fdx07pzCNMPtu60EgkhDbqV8UZzzumK7MVujwXtwO/p21S97lXmueXQNFhX+?=
 =?us-ascii?Q?PjaKH1iE0lZgXOFVAqARnY+ajUOx7jZ7TsGPtmZLl7kbV8J+qxO8r+3ed9vW?=
 =?us-ascii?Q?cQe4jueSSRJ1g4MdI7xvUZ2yDzAvgu8F4P9x1ZoG6dZkttQDh+Hc624wty4f?=
 =?us-ascii?Q?fqvG95egKdxnXdcbULcS5v2KTcW+iQE4NKpK0Xazx42FwyiYYl9j9p36TdLs?=
 =?us-ascii?Q?QwGvF2ml9cy3vGjp4YkFJU8GkNrcD3wVgPehq6OoDTZI2zF7UCm96JtUxPwF?=
 =?us-ascii?Q?ZeFLpEW3DLL7piIkGxmG4TleUH677ojm2fxHZZU0/53Lo78VXOe6WTDC0IdG?=
 =?us-ascii?Q?Fo5RIYQVcIi6yyu0k5CnxOYj9syEPjFKGukP7ON//7i+T0o5uLAo4pvtmXgB?=
 =?us-ascii?Q?0EetkwWF2Efdnp783JnJssjQWhrofkmrHaePsheYJO46xOcPHDUAft85JOt1?=
 =?us-ascii?Q?UOff782wgajDQtdLe2CBKCznEpeE1V1zHXbTHROXcmlHLZ5xpP774z6uEb/h?=
 =?us-ascii?Q?7TlTAFoKvKUWju9sdSrtK5wCaDD3FhlNJFntKXAtHvYeMVvVntHzxdZk13Gs?=
 =?us-ascii?Q?5PkkG67+u4DVA6sL6EzIA7nQfqU6dA8hkZiaB8uSSqkhOWq799JZFLsM9/YD?=
 =?us-ascii?Q?eJPEw3OiU503y48rx5bQRnnPvuTQ6b3It2Z9ZmjKpI0sJaeOKayuKs75KV7f?=
 =?us-ascii?Q?mJh5YQMnF+HRVqHoV/RC3tL8G77//TMJmBI/YVx7PW3klhdJjPFUNeAONvUI?=
 =?us-ascii?Q?rQ1uFUksUpxAl29bXkTLWk8Ns3c1v3PVcgd7ItWSMMtsGc3dE9mIHMV3XNu5?=
 =?us-ascii?Q?IYb9ubfazRLaay4Tgw+bMNe4GOyOP10nSS3Z3V7XoK0ptZQsy0jtI1fq7MKq?=
 =?us-ascii?Q?OUOHI+c2zsjdowWVseD7aRakgeq0Cksogh3hhwhygHXYExfw2FVQW0zdLmoF?=
 =?us-ascii?Q?P2zbMo3Y8ydmnft2PA8oii/tzcuf6JSmTVqhjcda72bQ+9QohyjVMCUp9ly7?=
 =?us-ascii?Q?IutJXNuEVorlGYGp0ufDBeSw5KTTVrdf0iMir/JJ1E7rGtC77CPfj8Zd7NmW?=
 =?us-ascii?Q?/4WczB5xLDn4O0ylfPBcSjLbBmEwNQodudICydDZTJGUylhM5JKQL7AIVqbe?=
 =?us-ascii?Q?A+jCPabdT37Ow1k7GuVkovsd3nxlRZ+f1KGwlpwtvafo/7OEUwlPD3OIbvHV?=
 =?us-ascii?Q?xTb88uw4+sUIaP0Ot5uxkXmzzP9V7toRtSjyOm2GYkSj/TtEcovKxt3E4ieq?=
 =?us-ascii?Q?Xa8n60Ip2URH6P00it+fHwW4bke6MnqU9GS6Hc8ILnX2Hen/N8+OvrpSO2BP?=
 =?us-ascii?Q?tl3Ys3e1NrJsYmABMITH4H8v1nI3XmvFRTWn3t0HKiNxd/EVSdT/GcZS9Gk2?=
 =?us-ascii?Q?jO4I1wh26661eQ8IVgHSS63b7LUMenixDB/9hjlDxgnzbCpaM9ZGGQUMOuyf?=
 =?us-ascii?Q?OldNQjbM5dzzjRW5Xe6n4IM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e4a7d04e-996c-45dd-57bf-08db2e63132a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 01:32:06.4103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BRKLJSVbYiAEoE3JqX2eViebmpWKvpjbm4H4fKZhRdBzqizr4EudHQk77gGhEeR/9j5/Vx/lzeXp0DbVBZT+5v8mmZXul7vvcA1l0zR3cs3FHwoDkNtgMvqxxAye9IE/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5673
Message-ID-Hash: PWCYYYGY7AO6YSKGBA6AVVIUZDIGQXGS
X-Message-ID-Hash: PWCYYYGY7AO6YSKGBA6AVVIUZDIGQXGS
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>,
 Duy Nguyen <duy.nguyen.rh@renesas.com>, Khanh Le <khanh.le.xr@renesas.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PWCYYYGY7AO6YSKGBA6AVVIUZDIGQXGS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

da7213.c is missing pm_runtime_disable(), thus we will get
below error when rmmod -> insmod. This patch solves it.

	$ rmmod  snd-soc-da7213.ko
	$ insmod snd-soc-da7213.ko
	da7213 0-001a: Unbalanced pm_runtime_enable!"

[Kuninori adjusted to latest upstream]

Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Khanh Le <khanh.le.xr@renesas.com>
---
 sound/soc/codecs/da7213.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 0068780fe0a7..1c1f211a8e2e 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -2022,6 +2022,11 @@ static int da7213_i2c_probe(struct i2c_client *i2c)
 	return ret;
 }
 
+static void da7213_i2c_remove(struct i2c_client *i2c)
+{
+	pm_runtime_disable(&i2c->dev);
+}
+
 static int __maybe_unused da7213_runtime_suspend(struct device *dev)
 {
 	struct da7213_priv *da7213 = dev_get_drvdata(dev);
@@ -2065,6 +2070,7 @@ static struct i2c_driver da7213_i2c_driver = {
 		.pm = &da7213_pm,
 	},
 	.probe_new	= da7213_i2c_probe,
+	.remove		= da7213_i2c_remove,
 	.id_table	= da7213_i2c_id,
 };
 
-- 
2.25.1

