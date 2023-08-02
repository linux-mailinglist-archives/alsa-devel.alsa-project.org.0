Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C6E76C0FC
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 01:35:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07E3D210;
	Wed,  2 Aug 2023 01:34:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07E3D210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690932912;
	bh=OB/JGQ6fWHFM+2qZE6eF+OcPGrtD2vtPYYDNe4eQzQA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SMOG9vpO//7ZsvHUd5/Otc8HVynKMa7ZArhd81SbeLs/w/ouS7kB+3HFRZOhrJv7/
	 2uEGKaILOF2wXcoa6ve9egVU6FyTgguivNo3Tq++YROwfpGANpcBMycmTY+vrMQbBz
	 VGry/J4JtV/AyI1ZhWUL9qqD/W7yRUinAr8KXXMo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 643F4F80087; Wed,  2 Aug 2023 01:34:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8B3AF8016D;
	Wed,  2 Aug 2023 01:34:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD838F801D5; Wed,  2 Aug 2023 01:31:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74053F80087
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 01:31:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74053F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=BbYTfaep
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvnBLr1c66GstBdNid+MHzzUoSIA6nanw2mI5vpUMEnHDVjuS3FI7RdtDtot+Hq1qId3gM3zFrorRLGamVzWkoAmVxD7kfMVs4JmPftUNCS3V5Y2aH4N81U3JhzGBSBGhtObcdYlR+8UWXNRw9vNvOFgf7NfmhGOnAY4oaYJNGKa7Dyr0Ye7gtNjeeJ8o+P0eG/NULM8a3lQroBZUGc0VXIh4k7hSHAdPsNdc2wy72TnJSkNB4ArGG3O9K8T913TFSOUxOS7e96ySYZ1MtE3tuyZd+oAWViv3iNdfqbSyuDsBtB2dbaGb16MU2QgeMZ/iBflWyEnbI0jhyGUINrAaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XN+YVzK5EsZuIt6/nyeLxbegeRFjNgn+NuiyoQARSjo=;
 b=FVuFeE2ta9ontAA8KhtcdyBUbwOjXN+h7LZ2SmvsquMe91pZTsClCYdx91XChQ+3EEJAtN2R7hbtw4IaaajFaZ7VhpmM4AUvrSICt+PRUsbL11bsAkMJ0DNlCPsEfSzAFum9fARpzfGpB/sfU4BPndZOeh+mDHYBMVi+NlA2L9Xsy8BsEiCbdAv4u9dZ8Ry5IAYTnTWmcIJtAu0lYLIOJFKsjjXrdohUItDGK8bwdevXu+a4/jA8clo9FrFa2/TDGvkKytFzRAN5pmyKUKLg90N1Es1lWpKT96Y3r09/qJSxaFyRNNPsR9Z1x9+EjiY/VzEkbjJAOHCkwpwhtu2caA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XN+YVzK5EsZuIt6/nyeLxbegeRFjNgn+NuiyoQARSjo=;
 b=BbYTfaepxg4c1avigpsjUdPAlFR52t6B6WTDnei+XXVtCBdzZ/Srvk7pEPbzpHqgY+PJ/zXi6VOvFDFS28jHJyS67R7Y/wwkdN80s+GTp3GBvdcqmv5D6IttVAMYA86X+2eZptoYjVxddnZ+rCdWALeUZRXqVK1eHsdFAG8KDPU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10180.jpnprd01.prod.outlook.com (2603:1096:400:1ec::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Tue, 1 Aug
 2023 23:31:05 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Tue, 1 Aug 2023
 23:31:05 +0000
Message-ID: <87cz06uypz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: broonie@kernel.org,
	alsa-devel@alsa-project.org,
	robh+dt@kernel.org,
	spujar@nvidia.com,
	tiwai@suse.com,
	perex@perex.cz,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	devicetree@vger.kernel.org,
	daniel.baluta@gmail.com
Subject: Re: [PATCH 1/2] ASoC: simple-card: Introduce playback-only/capture
 only DAI link flags
In-Reply-To: <20230801082433.548206-2-daniel.baluta@oss.nxp.com>
References: <20230801082433.548206-1-daniel.baluta@oss.nxp.com>
	<20230801082433.548206-2-daniel.baluta@oss.nxp.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Aug 2023 23:31:05 +0000
X-ClientProxiedBy: TY2PR02CA0071.apcprd02.prod.outlook.com
 (2603:1096:404:e2::35) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10180:EE_
X-MS-Office365-Filtering-Correlation-Id: b02747f2-55d4-4288-395b-08db92e7607b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	28UtqZhsq59MDzGZjN0VB9X09GfWGZsiDDV72/rWVDgwhUqcjw+8EGVD8c+W3xrLCzbA3Xn4i8UUyb2MHSuKhKcQtthLBBAm66lZT0tK+mMZj/GJLY3CSNOOVw0Lix5D9oILtwR+2Kk/4YEHhsBc6k5qwJMJo6KWKrLeQVqTpezNqep1rQ73wDzQfpBmvzxMsrDBc2fpio20jt1ZjUsD9L2u17xMeM5gnZ/MtCtVGTYqvWAOi9uBP0ziHqhEE1DV6ph1ubztXAZ6ReJKdmPBvNaQgJVe21aOz7XNc1JcLVW7zE/JiC/12KQUL8kHNSii8O4gL29C/lCv5ypqVbtWpUZtxMUzpm20DH6t5MLfIMhKuLBcLCj9VwqVr2fe+EaqSCrUoHwva3OtUdSl74sBWM7Fl4CmMnA0cDArn6hPduDui7bAheW0O5PDdfsT88bZcgduMQFZtAweFIg89RU8KUvchbbKj/E0fktkPJ/YFqxWks7HXDjmuDgMl00/cYPzv2PzB/45GNwCIrUV4LO6nWcraT2rp3r6VI9KZ2Bf+GHixl357/sJhosnMQsVDycSo2NzeyAdle259ayMl8E5wxikOLQf5kPucOnUgJ+i5X+zl/35vgdzMgGB82Sf1+06
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(451199021)(2616005)(186003)(36756003)(6512007)(316002)(86362001)(478600001)(38350700002)(38100700002)(66946007)(66556008)(66476007)(6486002)(52116002)(4326008)(6916009)(6506007)(41300700001)(26005)(8676002)(5660300002)(8936002)(4744005)(2906002)(66899021)(7416002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rlitR5+FdlXeOze0OQvjKntjErVnYmIOJSEGqsCNTmg6FCa84lpUtduReP2Z?=
 =?us-ascii?Q?n+zZNkIHq9rgr00wewewdvA1cHywysN+vEi/bPBYEJUdIruocspEYpNFADL1?=
 =?us-ascii?Q?zRl0Sretk5fk2uHonfS8pbz2mMYNpBAfYOY3ftwWCNq6QJdk0b+e+vlr6yte?=
 =?us-ascii?Q?/M2+Fcl33RaP9Ha2efPJ8YbaI8YKSQ2SuozWqZ3XiZ5VzwTEIaQ5LDvYPxF4?=
 =?us-ascii?Q?zXitJfcXQwIFZA9tixQLt70p8aCdhAI9Ii/gKZraJ1YjX3vn4OOpvwqPMMnM?=
 =?us-ascii?Q?0OkisAWmXpQVB2zcm1Eo4dsrFHvlrJezS5xICU+T75kphOLIe4eXnVx37L/S?=
 =?us-ascii?Q?iRf+X26S9t7OkzT/uwNuv0FKAi/6+UcKHTDhAMzTnH3Nx21QeAgnSsSWcdU4?=
 =?us-ascii?Q?PBC8kML/J5oavM4EpL28pBxk9pDSwID61gb/kulH9z8sRXRzqr7l9Qm3vOp/?=
 =?us-ascii?Q?4HFyGF2KRs518n2quDeklBjr2Cgb7EXe5gBVIM5lUXTD8frZNvCCp3nU1luG?=
 =?us-ascii?Q?qqhQCJfP8AX0r9+0TkcrtLiJM/KJ2uLgkGYT3qNrgCTltR1vvNpvZe7wA9nt?=
 =?us-ascii?Q?W99UvOXguhsYFS/kPrX3YkVaRVcAjADWpNsTTyuxvVRVe2gbaa2L4hFXMkIR?=
 =?us-ascii?Q?yGcE+5wqtCRdjUnDWyQyqwmQVP8vOwc3y7Ll4jdQnIDhzjjvzwwtOCkIf4jr?=
 =?us-ascii?Q?s5igXbskSzUselhBKL5L3dh+/LG8KbZODKhLsG7YmYUk9Wr3//ccFd+4DYsU?=
 =?us-ascii?Q?SMokU4FkiAl/3phCZBNku/GgZrC76tP6trhQm9EC3GpSvKb1tlR6gjYG8UYF?=
 =?us-ascii?Q?mj4k+wxjW8pZ6JeQxfaZDHE/1VdSIOQyH80hH7ZWC6/m1nTvmxEVkpDNqEmn?=
 =?us-ascii?Q?evhDnwVOmcoMNTjL/xjne61M69fzheRykC4CCXcuHFhWU1FGgMAyjVhXq3lD?=
 =?us-ascii?Q?uSxuXFJ3MwGs+Qy1Zzfwda7PgHuHChmgJsfC08ENRbo4t6T0vfENZogWB9sC?=
 =?us-ascii?Q?qAUBnHthWZ/EHuLagmioodf3GQ75BG1eVNATDc+qBUgqdP+jHEfamixf6h3Y?=
 =?us-ascii?Q?+QCkE8piVhsDVO93iaOM3KhCCX3O1AoDJrCpqeluIKYnPW0okzbyUMnBlUaj?=
 =?us-ascii?Q?I9RNVvN0DLSj8vl9+r61oTnogjqkoW5qrsX+k2vOQBl+qd21xA7L/MdcaYLt?=
 =?us-ascii?Q?ne87zSEhNU0qCeOZzpszjpAJnIVTefTXdAik5IxIylszMk39C2lSHlnyYZ8H?=
 =?us-ascii?Q?uoHV76ZhCwloQ5fjUPBg6CVF15EZJA87djGbK1RSGwukVGedA0MMIirh2WXM?=
 =?us-ascii?Q?1OiqDHXVJh6DlhjjbcU/T7JYIvp3YLC+ha5XkZnc9TKu5mrkbeL6dcmSVKbI?=
 =?us-ascii?Q?mA0W/cu+OBmtJ7HPSTssR4cPg6wfw8cschBxYuQuMfdXxcrvz/P+ROYiH2o7?=
 =?us-ascii?Q?Mx3nU+C5uh9pZhFzyUk54nq5WygaXcoKCRHYmLN/L/BUZYCcI+gP4hcGR//j?=
 =?us-ascii?Q?SLRBzzjKSHlK+3eNnkcmo7DulvCxDWdsjoExz4AP5X1Aw6PnKc0MYCh0z7xZ?=
 =?us-ascii?Q?X5TQyFMjqnjUValLD6MPIxkw6bm3jc4CW+FxzPz5iMlDnDV5SsTQVbTVsk9R?=
 =?us-ascii?Q?DqJPi0n8b7wskVJ2qpX7QiE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b02747f2-55d4-4288-395b-08db92e7607b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 23:31:05.7727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hkLzKQ8ixJS+nJ+aT9W5IkGLncujv/bKUP+jV5lACcZaJrSy87Yh+b+TIopfkCL0224ed0LklLlm9Y7wIbxJHDDsV540fgImhbM2TIOM5dYRMi0A+ZPKd8EPTED5Czu0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10180
Message-ID-Hash: TAP6AO5CT33ZZHBMFCCBWMMEDIQNTW3W
X-Message-ID-Hash: TAP6AO5CT33ZZHBMFCCBWMMEDIQNTW3W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TAP6AO5CT33ZZHBMFCCBWMMEDIQNTW3W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Daniel

Thank you for your patch.
This is not a big deal, but...

> We need this to signal that DAI link supports only 1 direction that
> can only be either playback or capture.
(snip)
> +	if (of_property_read_bool(node, "playback-only"))
> +		is_playback_only = true;
> +
> +	if (of_property_read_bool(node, "capture-only"))
> +		is_capture_only = true;

More simply

	is_playback_only = of_property_read_bool(node, "playback-only");
	is_capture_only  = of_property_read_bool(node, "capture-only");

> +	ret = asoc_simple_parse_link_direction(dev, node, prefix,
> +					       &is_playback_only,
> +					       &is_capture_only);
> +	if (ret < 0)
> +		return 0;
> +
> +	dai_link->playback_only = is_playback_only;
> +	dai_link->capture_only = is_capture_only;

It doesn't overwrite when error case, so
More simply

	ret = asoc_simple_parse_link_direction(dev, node, prefix,
						&dai_link->playback_only,
						&dai_link->capture_only);


Thank you for your help !!

Best regards
---
Kuninori Morimoto
