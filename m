Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 806DC6CB2BE
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 02:11:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9ED620B;
	Tue, 28 Mar 2023 02:11:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9ED620B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679962312;
	bh=NNWjTGuA4kgNCt0IGcnbFTJv5s3A5mhVX0a/ce39cOM=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HPSH3vB+svZHFCcvO3UdiS4aXV2RIqC9cNcQYCKWqd33jW3McmpU+SlO5mZaO5f+/
	 827Bbb3WrxmyiM+OSoegw1tod8nHUvNCYPf1tPk6F7O5DQe9H9Fa0k+CbZW8cP5vgY
	 rasI5p9h0TdxTJWzUyszKVANcURIq3MbQ2RBsZ7Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AA73F8024E;
	Tue, 28 Mar 2023 02:11:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4537F80272; Tue, 28 Mar 2023 02:10:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20705.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2DEBF80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 02:10:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2DEBF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=HxtJ6JsS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irwBPeqPJFHmhZQLAdSfJLQxitX8J9LP4EVf4/tKgJtK8xrhMzfNa6C3nDZobKWWRYLITqkrK4b7rC9c95kX1yTMPb5TpCwIYJ5wou6sZpYQuVRRfunpMsGGKKkmlJYPBHKMQzwZz84wNpp2c3JV0Yp8LUPjbRJXSGR4jbNalrXo1bqkYXt/e57Nm/w5H1FgFZHCXK/WW3T6C214e1/Hqmqc6mfmRu8f6ekwsq5sPeFPhzJygKdtKnZevOPB+MmsQdXZo9gqYcILVvBA5ppZiq9PjNc2kMKB80WWWRknwea3QRFC7Z179l5c2qjkeVj+gAzfELag6e0QG3D6C1iuUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHkmRk09SfpQfv1mBn9q9k8p4EmKNbPjRdL6rRUigtA=;
 b=atSJNwewdBCMgpgWC6MvTC0T4LiEH+eO5cE3jjCEkriEybPhz1mZhLxkuzTnLGjymfzrUrjCLEm3bkOYp0k8+JVVamawQpQAoJZEXuDUCPGzhScghGALConHjPNAEI778ttmoRnmduflQFDGXkdP62/i5eXLRV2tBODyZqftqNODRWHqnqr7IXUOcuzW6M44u/8BA7gWZzHl8pw9Uxl8V7m9X3MQrvRRsEkKlnOz5+uoKT513tt7RvonlVCLvblq+eQvoLrTV/7V1fKtogWFxiagihD6bCG+bd3tu/CsNMEWMPtz8q9BjUwoFjPh9pO59ddMjHqlk8c7mN3YnXp0pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHkmRk09SfpQfv1mBn9q9k8p4EmKNbPjRdL6rRUigtA=;
 b=HxtJ6JsSD78kj4Mzw1cjWNboS2E82l/hfmpsk9PmTN9PtvMbYXYfS2U4QgijL1/coxhuqJAhGMGB9zzTHeGFq7ImmTFF+1gYHm9TG8ZENtZgItInXGhS3DUrXF3Od73AV4cmCsB1WpPgd/Kl9Vz89UoCLtjf5XjaB4DIhP0Otdk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9751.jpnprd01.prod.outlook.com (2603:1096:400:20d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Tue, 28 Mar
 2023 00:10:47 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%4]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 00:10:47 +0000
Message-ID: <87lejhg2gp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: soc-dapm.c: tidyup dapm_connect_dai_pair()
In-Reply-To: <87sfdpg5hu.wl-kuninori.morimoto.gx@renesas.com>
References: <87ilen6ni4.wl-kuninori.morimoto.gx@renesas.com>
	<5a284544-bc08-a7e3-7be3-48641762ba44@linux.intel.com>
	<ZCHDYq2GTwQ8Db8y@sirena.org.uk>
	<87sfdpg5hu.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 Mar 2023 00:10:46 +0000
X-ClientProxiedBy: TYCPR01CA0178.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9751:EE_
X-MS-Office365-Filtering-Correlation-Id: 802532f7-7f48-46ff-a06b-08db2f20e11b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bsyLB2rQcjutVZe7rUTCs33ftu7fnrBc7hBrgOQR8cXsqu+ZN5ThnTPRh696JoP2CmqZqaCuVUvFGixmI4HEozd1fJRH5rlNVlGgEnhjeAfDG29EvsFbfVSFeHxgMBcoN3PkdiLpHivMSktZzMt2A70sbqYDaK+XtXBxFUsv+5IxxlzsL3A5n5RHKlgTaA6m3Li4LNz42PuRULSGkgvxxwqQHybcCFblDSs8n1+NBnmtvt7N0k5n006jGbVMQfEE941csnW6fr2pLgNLB16bl/srGZ1mcxYCn749HBMeYy13+y6Fmya6RK8NkEdxNSBICeYEDCq6sub4e72OSrwJwJqoOjNufoMltEeny2n7ffzL+OHFA4tFDHUnhy60o434HhVhF0I7ANwnmZHcZLAzqx0Rk3db7z7+vVGSO8GopOOwzYeBd76JAx5NaG0LR9IkpxoyQMKF1UWLTBexkB1Cf9TNzrqjD9PfFdswXPD/pZahKe7PhEDJnzWJuK5S4YMdUuWR9328qRA4BAL41S+h5iPVnAggcDXrFejr6q7315y3UY1cy5wVzWHTM7uinDHimvKVAGBahISuz5zSShvHTheTv3MjeppOpyRSsmJTGlitZH924iO3epRQxz7bqnMO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199021)(316002)(54906003)(478600001)(36756003)(8936002)(5660300002)(86362001)(38350700002)(4744005)(2906002)(4326008)(38100700002)(66476007)(8676002)(6916009)(66556008)(66946007)(41300700001)(186003)(6506007)(26005)(6512007)(2616005)(83380400001)(52116002)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?N7WW+wguxJJTniouJDUj36EWu5ew7tuZ2o3y4kIuXwgB7HJ146vijlL1xNqz?=
 =?us-ascii?Q?ufvTvd2YdJEjKA/5GLchk89Wkd+Fx9z6A6ZntlFm+HsD3rOhGhG8cQOsqiML?=
 =?us-ascii?Q?4+WeCg+svA/bXvtvPPj5V1XCuWjl8zSWiXMMPxuumEKBc0kJkrRIwA02rb9N?=
 =?us-ascii?Q?+w6i8KwJRLg2i9jxDN4Y6VCBTFgmRiAlo1WGZcUSroVo38EPMx54DE8rqgSm?=
 =?us-ascii?Q?RDL5WJTWqXIy9pu/YMXTTXMFDGC8KJtq6OQ5QmweoezsJpGZllmDzGQz4C1+?=
 =?us-ascii?Q?tPdg1H84F7zY98lb8Hmve1gckmQUgu7lsejjWqBuGbEmxXZWxfKs4yOya83g?=
 =?us-ascii?Q?tqcs4Go4JRy1hwOX+pOiWdFl9fkQFdARvhrZ+51N3xBh4BE3mDASHt1jSyxB?=
 =?us-ascii?Q?Toz/FzuD5/miMGmp0YLByxng1uEFXLN9LWVnuBYA93ODJeq1J2c+EJ+Q1Q39?=
 =?us-ascii?Q?6sDQbjHSnLA1FUko/EX9Inq1Yz0fEwIQeONkGZp+TVfwFqnqUGzdMtkS8P15?=
 =?us-ascii?Q?mXHs9cKVD7OAj0OTh77fWIPjl3kngpaChNU/+80jBGEoFfiEbObuZpGDM7PB?=
 =?us-ascii?Q?quRfl/Gqgf92vBy0pUqEdLMR9Zrkr6xpgFuK8hhstGEy+ES/5Y7Huco7yBWN?=
 =?us-ascii?Q?mLnqkk7PfUGa+cSuq2PdZkc0A/iULscVWkGuO3pXVGjqDq+YNubrOw0PUz31?=
 =?us-ascii?Q?AQy7Y5znVV7k6f9eXFZgz/lkYJn+eHd0lb+nWCVn4a6hR46H65XwVplgk8i8?=
 =?us-ascii?Q?iRjcL8xACs/6q2rJIu8r1EETwx6b6GkmBgDJaVjttufz+7jJXhZtANfJV+pC?=
 =?us-ascii?Q?88uskv8YvZqsSyOl60C2utUjwjWmdRqnczTwoGqdUMkAwO3A7ScVJbak+6t1?=
 =?us-ascii?Q?S49LJyJy6cIJYr0yKhI1uQi153Fq+gz4OBrl59iotumTvnWDExP5Og14KG/J?=
 =?us-ascii?Q?bmphBBC5i50Kz867NIqK1axGVOXjwrElmAcAsrEu7Q75QL1Mys/B2b+Xwcsx?=
 =?us-ascii?Q?KXYx+d5sn2jxBmz6LvFAH+sHPbawGtf9wzmShI4656YqcQG/rlpbg0OLORGe?=
 =?us-ascii?Q?1Vwy80AJ39851RxUo5Vp+YDUBBhucxDXDeD2phrd/obFp/EXa/A3PpjS3e3s?=
 =?us-ascii?Q?yqsuKerZEz1krGO8kNuyaDTgEPXOXAaePZ3HycSprDgrkCo/Zo+/dk/OJ/YC?=
 =?us-ascii?Q?ctC6Bn358PBQZxN2WtgM5Fe6yYVukLsP8cG6OUmmsknAX5t+JNg+6szFdRfl?=
 =?us-ascii?Q?8BXgKBVKozKO5VHJ99R/Qwz3ZN4JuPQer8wLW9+VAOh2eBV5k86BjNHnPskG?=
 =?us-ascii?Q?xeo+RKRh9EcVuZX/HYdXTycJeldDo+uSWBnoYgtaor7faX4Hv2yKDjZk5eEK?=
 =?us-ascii?Q?k9JCN+OtEvLp2i8dxGAk1m00V99Mi0LCCxNRXgAvYn+SHVZt6XrUGbTq9WOz?=
 =?us-ascii?Q?6Oo83PSixo/KvYDO7QLrppbFDP0QSNJ0Shh/tmYqsIF3WpDNIjtz8Ed+MaTu?=
 =?us-ascii?Q?NjxgdZDaJibiJdeYPDwWFVRX7weM/Xr/T6iTpRGeBt/xOjv+e/+WFnYNGFtb?=
 =?us-ascii?Q?7/K0PfA6GGt8+ydmgt7Woi0v052/9awh3a2MtbsgREpMY7XAVJTf9ZyNi79T?=
 =?us-ascii?Q?7RcjZbckcE8dosgxWAfnCbc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 802532f7-7f48-46ff-a06b-08db2f20e11b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 00:10:46.9952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 80yAW4k4cux9Tjmdf+0ffJBkcFk7u3fMvgJN1WbBgRa7fW0k5Hy3kdWCHTXYFcZ0Or5ak8WLO+ybgt5Xx2adthHXnEa2TTCaCtnLvZJ79Os2f92AN13iQPw0We+Yykoj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9751
Message-ID-Hash: ALHTCWDXXEXPGM2LQWODWF7ASZME3EBO
X-Message-ID-Hash: ALHTCWDXXEXPGM2LQWODWF7ASZME3EBO
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ALHTCWDXXEXPGM2LQWODWF7ASZME3EBO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

> > > > +static int convert_stream(int stream)
> > > > +{
> > > > +	if (stream == SNDRV_PCM_STREAM_CAPTURE)
> > 
> > > int get_cpu_stream_direction(struct snd_soc_dai_link *dai_link,
> > > 			     int stream)
> > 
> > > Add the comments here and use this to set the stream_cpu?
> > 
> > > The convert_stream() is an odd choice for the functionality.
> > 
> > I agree, I think the above is clearer.
> 
> Thank you for your feedback.
> I see, will do in v2

I noticed that this patch is based on my previous posted
Codec2Codec cleanup patch.
I will re-post this patch again if it was handled.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
