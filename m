Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D289EC2F8
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 04:11:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4243B21B8;
	Wed, 11 Dec 2024 04:11:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4243B21B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733886673;
	bh=eaglozq8t0d4nlGcs6Y+qsEJTgvkUm23HBBmMfaan/Y=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=XsmkNMY0aaIGhBPywGnJaOr2yUBiPpsZNt4ND5IheqKSeIx9jx7aA9aW1f0vk7jkW
	 OTR7UobG1pjd2QwvTywgY87qmXQo736nmt2FhJRtQhafIgpBO9/vX9ejZJvaoko2dM
	 qGHfHHMZFyJzBcik/oqGh+lkykLGF/S0YWrh98Cc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6DEAF805F2; Wed, 11 Dec 2024 04:10:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FDF8F805CB;
	Wed, 11 Dec 2024 04:10:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8DE1F80482; Wed, 11 Dec 2024 04:10:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2046.outbound.protection.outlook.com [40.107.20.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30AA5F8016C
	for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2024 04:10:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30AA5F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector1 header.b=Qlq215t8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aG6UZAoXcc/jMEeUHyPVaiwVJjVgQjBFfZkr1KqAXx+qiAAorzks5anSgLeeWQPYmTVCzZvo6Lr8k/rdnWXgUjFIZU/XQdDABQBSuPjbOQDsF0JXRRdpj7xfjjWVhMumg35r03/FJQJ9QXkcm/g2sO3eb0+DY8nBX3DkXCLWZ67bhBpMLh3zjQj22miAz2sxNBKH21j+xrasBfIqCWp87yqImKOZ71FUo8E/t+U8eOPjJ8SstQFnbHf2jstILtwt6Jai8OZbCG45cRj6K4QQZ1DQAYriv2K/sFRZVQ4H0d+ABLzZDv0b2I2fUBPz6s9hBKjgtH4luNzlGUzThcwbEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sWeVsIaATm7hVEpA/2OiVm3+pET2HYag/XaD38+9/8=;
 b=KhoEvQhdGO1QCtzPcSpRD62q7S6P4SzPlvpimOkbD10UDZGt9enGrEvmAnjvxwNq7SanNuGwzK1YSO2GTJmwn231GAXopRUBMDOaIy52JPj2OjiUoKX0VHwtHHIxAlRM42FbnPisXCpiQJ3xAMB7I9y9drXWYDJd1pE4K11mlr3QLGF1tRLHqpoIJpbF3r9DrZVP6XTq6o3kH90DXNUL70hMLSTX/WC95nZHZ5iSptWK5xnQ4vm/pkWRiF7tkC237vJMguorvV5ruYkNjnIYRjLXzz8ly9TBZ5Z3KdSgWhSSYQ5L4vzCXfskhi18UAHQEf5RumAhMGw41c28m47mOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sWeVsIaATm7hVEpA/2OiVm3+pET2HYag/XaD38+9/8=;
 b=Qlq215t8l27Nh3BnWgfuO3kK36ij/VI9YH8cL/DOtxn3H2kXre4VKYb7OOWbbGkaaHWTINZIYmcyF5NF72FSzVl7OrSOwI+kxL1EUDSKexlkNAHGZJYxL0meXCIt5AXnLxjpi9j74m7oYwFPzZILOKFkVqbwMA+FdxjkTCYxlVLXxMwcREuNFL/MFKYFc1uG13Z/p5+l/oSYtSwPP5a2yvo8SjK4v6qhZ8bGh/RIciCR+6jvVYjL7YzEzhXLBrdNal4ZzdNKobcMXuRu8yq2MtLvEUXcEJ1qo1xdgG0NVwCvb9u8qiLA/4hU4KnO9aUBnOnzCuq0ZfzHsm3zOtfjbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM8PR04MB8033.eurprd04.prod.outlook.com (2603:10a6:20b:234::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.19; Wed, 11 Dec
 2024 03:10:02 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 03:10:02 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 1/6] ALSA: compress: Add output rate and output format
 support
Date: Wed, 11 Dec 2024 11:08:44 +0800
Message-Id: <20241211030849.1834450-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241211030849.1834450-1-shengjiu.wang@nxp.com>
References: <20241211030849.1834450-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM8PR04MB8033:EE_
X-MS-Office365-Filtering-Correlation-Id: caa2c2d6-8636-4058-6c63-08dd19914e09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|7053199007|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?We/EdkJEHLyuL9yh2lSXjQTbu8SUj58x3vMn4EyEZ9qLwdSqAK3mDRb6vntY?=
 =?us-ascii?Q?Loddto6hZPoVcKJcgKDbXEzFicPyOeXc5wCyBoCFC2hNgNU7+nIsrYKfOD6V?=
 =?us-ascii?Q?8qsJSbkNFyBDAeTu/aiw2Es4jF64er64nuJpMVJ+aF/PbvYlGUdWpaNOpQgl?=
 =?us-ascii?Q?JfGaO9CGbYmlaM7lCOQq7JKxX4Y3WZ3sPIP+qj8uInT9qEcjkWj153E2FOBD?=
 =?us-ascii?Q?xodsv7vZ83ifVh8D8zJhgEKBPFiZYzkGXYmWX/kDRIFEd0LMospxJmKbebMV?=
 =?us-ascii?Q?BcW5BuFFAxF9Gu3LMwWx/mNgX1aBUWR2DNslRlknCDUpJVCNCvwb25edOfNo?=
 =?us-ascii?Q?XTlg3Fe0EqNU78yz/sAf2XQJKMfp1xo7iLpsX5Ewk3qIRdzQxiCIv3WFT60l?=
 =?us-ascii?Q?DS33bvi7hLXg2jiVQR46f6ooZjropr1b4FWrYuXM1vvHlLZCxxSODuYcViXR?=
 =?us-ascii?Q?MnRigE/27W2QOAbmQyzjsK9hYAKxaDlPznOu9Kt3+0J9o5gRj52z3vw+B5kR?=
 =?us-ascii?Q?kVHc0G9/CjhFns5nJeE/b09v5q0JTna1gtY1J4Z1UMbmY3EkT0wf+xipuMkQ?=
 =?us-ascii?Q?Qn4kOqlu69Mp9ATs+JPgZLZ+QAmcDU8Ck8fCB8hgu1zqdMZ1/6vrNadwpkPK?=
 =?us-ascii?Q?aUY64JOrOPffcaew32aFKI9ez5Zw7gX/S0E9H3jFx2+MadX3ZXplj34TyHwv?=
 =?us-ascii?Q?kTB7CgWB/yEBP+MbKpMPEy359CyXX8Hr1h+L8940OKosUDaoI86tdRqXzB7X?=
 =?us-ascii?Q?TJeJ+xmcW8hR/R/059G8iKK4z+f4lji4QJTHktwDk5/z5ejR8z6Fz9b8CPSp?=
 =?us-ascii?Q?/X8BikopG6D0p+pwJwUuUgREEU6FQAb9Xj46LjRkeMRw+e25TUFNutAFk8Va?=
 =?us-ascii?Q?SahhOtTj+nsA0TsAXscqWw9iAYL0TQ62ZKWGBX3RojrWs2qaOGm/Z25akMVi?=
 =?us-ascii?Q?MUhj2rYQaaPITux5Agrpy/RgSYLRDH1S6N6QXdCgZ9fJtSmN9rlpsWGZKV6c?=
 =?us-ascii?Q?l6O37U0wcGtnxNarGloEH9NoqNVCVF7XYfzPxNiewtO4Yo0J1qPrrCj4fQ4K?=
 =?us-ascii?Q?zlOpda8/J4xaByhX6mWe9zQgUVONpnv6+5bywEGqCAHC+fu18mOza5sKgxhe?=
 =?us-ascii?Q?xd0O6Ka6DitnYxN6dOj6e5+mq18qJdIVu6eRO4WrLG6DcYm2xDnB8yquffVz?=
 =?us-ascii?Q?/vAcaJnC2mk8IFZEpDJ4wtwi4ppycS//ZLlmr/9kTM3780Er+9DOLhPsREX5?=
 =?us-ascii?Q?CjjcidkKrB4CLpPoFZUqGkjJGF11XgYiHpnWl7iY7w1E6bbcUj0DlUgATH+Z?=
 =?us-ascii?Q?GJxoPabjHoXM/WfcD8UvF3OQtWR9RX2IL+MkC+2/3SKsYrdUDDT6iAgFqoQs?=
 =?us-ascii?Q?gtPMmz0Q6sX7lFSlNWYD5Dvkk1ZByvTjkj1IHVWBI6mxx6AS/MUeNSORUSp9?=
 =?us-ascii?Q?0VTRczUireA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(7053199007)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BJjJO3Sm3lF0bfpa9iRT8KYqelYLm6iomuzbasBXrR6n8pRFvDmt2kUt+oS1?=
 =?us-ascii?Q?xqxs4KPoBNPq4ObDhLQifpIfK6iLA39XwsEUGyvP0VlwyaUy0MufkCZXJEiT?=
 =?us-ascii?Q?3Lk/Eq19GBk4UX4HEOEpb0J8fuWx20zyIpRRzbLU5FJuQcZ7UbQnOgN5V0B9?=
 =?us-ascii?Q?ZuUarnHJ/dOcWqarlCHk7YAu9pd3P7jtT8KArRUZ/fcDqXbSWZI9zIZOxfGd?=
 =?us-ascii?Q?SKZb7iomNq2mdi6PrxYU1U61bs4KBkXF6kn2sjB4O03HXM2gUVn+qv8zopRL?=
 =?us-ascii?Q?pPNK06t9dee008SbuGsck8UhtBqZWxQ7ySs4OpBLWzgY8Ur2u/SFxGXGugu0?=
 =?us-ascii?Q?I3tQsBFfaR9ZzKSNiypDuCssZp5AH6NRPE+Xtmzejq4UyDNO+Jwlv1MIi2nP?=
 =?us-ascii?Q?A+6K6Lsy9+MODu8Wa4JLhS9td4ZX6awEMXF1a5uf0UpV52Lrj5dYBXxBgBtT?=
 =?us-ascii?Q?zED/CXHXLTfz1qprcC71vtnUasNKCj1unIKouvx/UW7R8zyFAdgGRmUqxOQX?=
 =?us-ascii?Q?XtgSX5B8p3fzkieTfTmqXiGLLl6b/rgZ02Aia4psTftbiETJq4RPTHgQ8ykW?=
 =?us-ascii?Q?5ObReNZrTvOMW80KQPVxGvrwxRJvHXZtCKgbRWiclsftfooXYjwKcmvAjQIv?=
 =?us-ascii?Q?ILuSh37AgL3zDA7voShbchw7ZGeRZZZpLec7CxsSFLigFnnnFhFq8i9Y2F0U?=
 =?us-ascii?Q?tyyBPr40AGtPrmeputGdfMkL94waAdlpgsxusytbmdsA8yQj9uSbZqFLvfH9?=
 =?us-ascii?Q?hLV61FOwVEOUX+uR3qV2z4OHJFsyi3/ZMHQKupta+XbSWWM1mTKjT/FTPtcZ?=
 =?us-ascii?Q?kfWg4bRcVVqMhzJ98tpfhvb/AWQep2GDqZDnxl3B9AnevKqzANgfuC5bcHlo?=
 =?us-ascii?Q?dqglugI+4f+UMDL/juNzcWVvc3LFTOm/075ez/c3BHP2xhG9UkA31XDgE4c9?=
 =?us-ascii?Q?afA4HAWs24/BRXPTPcc1yf/fMiMTqKa4jyyb9yQduU45hho9cFGDA6wL6bNw?=
 =?us-ascii?Q?1Q7SuuxIwt3EyhtxqBLTluPpaYS2vsppfmZbzSbiulWq/FToGvZhWjHwI2np?=
 =?us-ascii?Q?237iW0JzqHJWyH6xgE15lu2EcUflUUEIeGOrZgTmKH+iwg2d8f0tiCC7/h53?=
 =?us-ascii?Q?SLGcqXeGh5ZwiXLPRmFMBpmZ30o8mLYWqyH0xIg41O6kBUIA2gNmVRLd2V5R?=
 =?us-ascii?Q?y13iD1CKnVEjL1y+wPuVHcZsQmkwaveYtQ8YBZRMBulBokPzEU9p3x/hzZ5I?=
 =?us-ascii?Q?NnoRzRD/QnzICHLwiP4kYjy9wM/QDkmLEZvlEHbGAV/E42taFPgd2XL08XQh?=
 =?us-ascii?Q?14dFT3fmv9B2whaOQ9NlbHcmqFDbJiZMVwyPm5S0jgpbShkvNi0tw0GSY/2T?=
 =?us-ascii?Q?2T0vXhDo90c/LQbVyZWMb+aAQ3Sj1JBHdjfZFh38HguFDnfkw5ijewaRzHFb?=
 =?us-ascii?Q?ehDBU5CLugyJF74jbxVWNBrhclopPm2O0Lg0gBkqjGYhAu4etvonVaVtxkX4?=
 =?us-ascii?Q?xPxIopk/A17oKggQH/uuZKkjlte8OCTwHwu+K2VHp07bGBl3k5Eu7K0JdQYL?=
 =?us-ascii?Q?xQH5kD537nAgXNcd0dPmFHSgTn0qUOk+P+CE4Q2C?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 caa2c2d6-8636-4058-6c63-08dd19914e09
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 03:10:02.8732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zVpsQrBjsvEmMNyVr8dwSWgglsxX3ZQmKa3p3kl7mmo7f4s44oJXoJ73ZSa1l07fhkTYdvoA9V4fz/gHkQgvmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8033
Message-ID-Hash: PVSJQQ6UB5E3WF5FBKQAIMOAFUQGAIFD
X-Message-ID-Hash: PVSJQQ6UB5E3WF5FBKQAIMOAFUQGAIFD
X-MailFrom: shengjiu.wang@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PVSJQQ6UB5E3WF5FBKQAIMOAFUQGAIFD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add 'pcm_format' for struct snd_codec, add 'pcm_formats' for
struct snd_codec_desc, these are used for accelerator usage.

Current accelerator example is sample rate converter (SRC).
Define struct snd_codec_desc_src for descript minmum and maxmum
sample rates. And add 'src_d' in union snd_codec_options
structure. These are mainly used for capbility query.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Jaroslav Kysela <perex@perex.cz>
Acked-by: Vinod Koul <vkoul@kernel.org>
---
 include/uapi/sound/compress_params.h | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
index ddc77322d571..bc7648a30746 100644
--- a/include/uapi/sound/compress_params.h
+++ b/include/uapi/sound/compress_params.h
@@ -334,6 +334,14 @@ union snd_codec_options {
 	struct snd_dec_wma wma_d;
 	struct snd_dec_alac alac_d;
 	struct snd_dec_ape ape_d;
+	struct {
+		__u32 out_sample_rate;
+	} src_d;
+} __attribute__((packed, aligned(4)));
+
+struct snd_codec_desc_src {
+	__u32 out_sample_rate_min;
+	__u32 out_sample_rate_max;
 } __attribute__((packed, aligned(4)));
 
 /** struct snd_codec_desc - description of codec capabilities
@@ -347,6 +355,9 @@ union snd_codec_options {
  * @modes: Supported modes. See SND_AUDIOMODE defines
  * @formats: Supported formats. See SND_AUDIOSTREAMFORMAT defines
  * @min_buffer: Minimum buffer size handled by codec implementation
+ * @pcm_formats: Output (for decoders) or input (for encoders)
+ *               PCM formats (required to accel mode, 0 for other modes)
+ * @u_space: union space (for codec dependent data)
  * @reserved: reserved for future use
  *
  * This structure provides a scalar value for profiles, modes and stream
@@ -370,7 +381,12 @@ struct snd_codec_desc {
 	__u32 modes;
 	__u32 formats;
 	__u32 min_buffer;
-	__u32 reserved[15];
+	__u32 pcm_formats;
+	union {
+		__u32 u_space[6];
+		struct snd_codec_desc_src src;
+	} __attribute__((packed, aligned(4)));
+	__u32 reserved[8];
 } __attribute__((packed, aligned(4)));
 
 /** struct snd_codec
@@ -395,6 +411,8 @@ struct snd_codec_desc {
  * @align: Block alignment in bytes of an audio sample.
  *		Only required for PCM or IEC formats.
  * @options: encoder-specific settings
+ * @pcm_format: Output (for decoders) or input (for encoders)
+ *               PCM formats (required to accel mode, 0 for other modes)
  * @reserved: reserved for future use
  */
 
@@ -411,7 +429,8 @@ struct snd_codec {
 	__u32 format;
 	__u32 align;
 	union snd_codec_options options;
-	__u32 reserved[3];
+	__u32 pcm_format;
+	__u32 reserved[2];
 } __attribute__((packed, aligned(4)));
 
 #endif
-- 
2.34.1

