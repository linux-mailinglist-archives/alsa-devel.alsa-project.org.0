Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF66B715060
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 22:12:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8633C3E8;
	Mon, 29 May 2023 22:11:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8633C3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685391154;
	bh=ZRTIJ8qFmCwwxcb7fRc3QVrHmp2syNU6IrEWHxqcYLM=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BcYVLp1e0ocaQaI6ppw/5H+6gWM/5z0iR3C2iaNorNy2Karxa3KEYgCDGaLBRCkXK
	 DjOImy6JuVzNPYGtIJGHZPkceDyw3QtRS4CQhGuKzmP1QG6/IzF9LIYyz3k5TE7kAE
	 gpjkW6lcHxpY1OG9eZO5ZeehwIjkO+pRVYJQCJr0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FD47F80542; Mon, 29 May 2023 22:11:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 675D7F800DF;
	Mon, 29 May 2023 22:11:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14FEDF8042F; Mon, 29 May 2023 22:11:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20728.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::728])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98CC2F800DF
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 22:11:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98CC2F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=purdue0.onmicrosoft.com header.i=@purdue0.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-purdue0-onmicrosoft-com
 header.b=OtuaqDsN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qh/6vitxotk7ZKA9aIgBRwo7rV/pdTO7mE6xYIzcRdhQ/m9Nyhf0Qzt+8qX4D8KRJ99jDDig4jlpG9niPIZii8nze0e+gdy4qp+kLM9ZbvoxMTk3s7mFnICSu1kMNE54qwhZaz3oowj0mi8GvZQuEGij7w18TPj8yBo3bbMXILe98yBqhVgzAffLKQ9CT+yfAd/pSHS1NZJt6Fj4zw7aFZ1Tfh4beE9ca9SBN44WnTWauA8/DRBkaFd0g0JRC+TIMtCifFe+FyW604phjk6TOrWKLwx2By77ciV0cMhnQKKVKs7BuS17KWvCE80NJZxaxh2Gz8+YQe0K0l/eobJBUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpMjOJPG/Dj2g7KYbVW9Nfd05Kf1lbq4dOVQ6Mf2DWM=;
 b=DjZuS35qz/g1rvTDfJrOT5YvUYFp2Ndag6V1Co4LZnWjb3BOgVHyoFBJycNlEMQuOAtmVS6DNGQslh6rFrhjjTXeu3CYds0NaMjioWWnbS31Kt0viHhlyjqiwu5+l+aWULaZ5dcOPotwS39UAGxxl+fh7EH9JCzMHc3FtHmpWF2d9L/bZt1Vs7wVDg0roBN7FdLDkjx7sVHNFl00Z7TqRqOK9SiLY2CXDAUPa62Xyn0XMk/LSmQh6tdTiyYESrTgW6BHr9DbujYW0E//ApYxB2kpJOjOHceMd8A22ulV6J6/G7EgpbKsPFrFvS8U87uYzLV9euz6Qr67NlMEIUOQDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=purdue.edu; dmarc=pass action=none header.from=purdue.edu;
 dkim=pass header.d=purdue.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=purdue0.onmicrosoft.com; s=selector2-purdue0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpMjOJPG/Dj2g7KYbVW9Nfd05Kf1lbq4dOVQ6Mf2DWM=;
 b=OtuaqDsNGU2U5tIKWYrugl6YeRMs/rWnMmdV7G5cOuagBJ8gkbVxclxQVLxdkwc0kTjrNquHyh5rM90yxNWPpYhPGylXVghTN90CI1CAIgKcu2KP/wqPPl4Z2tJaurcRmxsSiQntF7QqSGt0A/5OnjA56jHiwMILT0kWjKxDkeI=
Received: from SA1PR22MB3124.namprd22.prod.outlook.com (2603:10b6:806:23c::12)
 by MW5PR22MB3106.namprd22.prod.outlook.com (2603:10b6:303:1a1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.20; Mon, 29 May
 2023 20:11:24 +0000
Received: from SA1PR22MB3124.namprd22.prod.outlook.com
 ([fe80::647d:bdd1:e07f:42e1]) by SA1PR22MB3124.namprd22.prod.outlook.com
 ([fe80::647d:bdd1:e07f:42e1%4]) with mapi id 15.20.6455.020; Mon, 29 May 2023
 20:11:24 +0000
From: "Gong, Sishuai" <sishuai@purdue.edu>
To: "tiwai@suse.com" <tiwai@suse.com>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: A data race between snd_seq_oss_midi_open and
 snd_seq_oss_midi_filemode
Thread-Topic: A data race between snd_seq_oss_midi_open and
 snd_seq_oss_midi_filemode
Thread-Index: AQHZkmm+a2mWRQKZLk6SxbR5Wt/ADg==
Date: Mon, 29 May 2023 20:11:24 +0000
Message-ID: <7DC9AF71-F481-4ABA-955F-76C535661E33@purdue.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=purdue.edu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR22MB3124:EE_|MW5PR22MB3106:EE_
x-ms-office365-filtering-correlation-id: 93c75426-294d-4caa-7a16-08db6080e0cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 50CgzqvPdat82Q86Wq9rd/8O9H1cXHe8rRwhd57sz8DezsZG/uihMicab8tzV4918YhRGAPVSuXLRMAXgookBx4rKbA02MM9I1DHJHrC62FY3JVOoNJp5cRHNeD1UP5CBQZHe7f8RITCbVGBz4OYfZtaxG2iQDjD2s2vbaTedUCQ6QYxBwmx+1cfO8/B3mcrmpdCIyh8yy/d5i8z0o0gWXKCcVyjOt0parz94SNAdzSqX1mxnwpCfjHFBmVik7XBUDHsI2++wqvw/DWfcu7Fjm3AUjWTvnKGtUSK3+Cm98Uqb8RyToUrhe3aEXNn2e8SbJqVNZNaCH8HxpqL6cTtjMJzl9hlVxTnlW7MFOVzCK+P6J3SOYgc5/Jssj7DZKwP3Qx3/zPfBEcaKGfXDCXdoQSv3c7zOkbEfT6JY39ETh3oPHMKdStH7JxIQdLHCVQt85BrhmFZaSj+/Up3RSuBJlkrGTicgaDnCBqz/AcTVE+2OLkfoy70y+gYJ+CKvqUomswTdNSKEGLoRWHSsN4GfkMs+xUV3EyHnp+Fb1sZTnlH9NCPUHyBAioujGuDlqN0smv1EoDaagO/pwTnREOCmip8l2SoGBiSAtPhHiVSGxZsvbq6zOciweAjO7A2DZPWTLCBo9SBdebBkXn5OJ+Q5w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR22MB3124.namprd22.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(75432002)(86362001)(33656002)(71200400001)(5660300002)(786003)(316002)(41320700001)(64756008)(66476007)(66556008)(66446008)(66946007)(76116006)(91956017)(6916009)(4326008)(38070700005)(36756003)(122000001)(8676002)(8936002)(6486002)(41300700001)(38100700002)(2906002)(2616005)(4744005)(6506007)(6512007)(186003)(478600001)(26005)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?X0RzsJ5X18H7rRzujKEeQQtg9WYULWGcrDaSlmhCIJOPy/Ys6vqs/D1rEX5S?=
 =?us-ascii?Q?Wo71p2Lmn3xaFBklQRMi8SNlt0Om9ARgO7F3H645+nTXUH+ezA/oAnJeTvxD?=
 =?us-ascii?Q?BSWHaai9C/4fdUGhGRHCMiN+0DgpTU9En4o4g5aw77fbVOzKE68v1FuhRN/O?=
 =?us-ascii?Q?x2tONj5wYeS6Jxth9kv5borRnAPSbpAZl36rWMxJCzDHuKwaF2jYdVZxlemS?=
 =?us-ascii?Q?3eAOEAKETnL5lZOZRtAcKpuO0L7PuZxbxmbFoywcIsI6YHv41onM1qIZ2pIK?=
 =?us-ascii?Q?qU81esEvwpyHeaBfSRcvdvr7g5aqPsU/uKFmabVqWLJpiHT6bH0lwwVNoktr?=
 =?us-ascii?Q?tTJ7mNNfYnDGRbYy8sATW5pmKbxaxQIcdnWAkAjETWqE+ECvbPoNwkxkzVHz?=
 =?us-ascii?Q?QajZou7v+RS8w/qIlkPNJj0uVjll6no7r/BcLZGBIv+utD6TO6cY4r8wOUSA?=
 =?us-ascii?Q?8Q1vzCdblQzyOT4fjxKrG3dlZIVSnbwbSBOlPsgGJ9qBaIdoSLIFV+v9z4kx?=
 =?us-ascii?Q?g5XoV4OKRj76JkX5rlXWuZk1ys4sWU7YwHWOwugu8t2Y70tZ/W9GhsNtxdCl?=
 =?us-ascii?Q?ruHpAXXTjaeH1VKNXh2W5QNef92ClpMIHatpZJnvFPAMWOdv/zL/rWLPdwma?=
 =?us-ascii?Q?V9MGTS/iWKe4WMESamVnw6CXZFRjeexkkw5+PlouFyP+oeeqojHl/wredK3U?=
 =?us-ascii?Q?5jaG/BVJl1ENUfB243PRF/TOxktkYjFw5EZCM0BdvLrqZaCSmeFAp/NFsvdr?=
 =?us-ascii?Q?mYVvAvFxGKBOadT0Jk735t9Kqm1io3cAYgxBqsrj4cooNeDiTtCZZ4mFx1Ys?=
 =?us-ascii?Q?nNplievV3599kOVdGJVP/B1r9LXYfirSDbo3zpJZZGYLVHmRKazJB8+fK9gq?=
 =?us-ascii?Q?NBztQeoddt+xrIO9/xrenCZZ6RAKbeE9vJpsiwPT6olrk0QKhP9iTeOOGLGz?=
 =?us-ascii?Q?IWo2JsQezLneeKpSr8NC8A/4mVQNKnSGZMySXH2fe+CQ1lMyzgnk53K1YLC7?=
 =?us-ascii?Q?OGo9vqqaK9XlO1IzmVQfCNHRJ7PUyhtawUyEIKpJeo2/t5Z+S2ERgh6BkFKY?=
 =?us-ascii?Q?drWjf7LiXiAdsOVDFrjbMKKkKOBxHEAoIm6Xjq/KFkhV4e+iG9REnFW4fDWi?=
 =?us-ascii?Q?qZWEhl/BofB+Xk483/IPhM9Bavq26SeteicAFGsjwwMRnrtVTZE0ElAHxvX4?=
 =?us-ascii?Q?XyENBurmXwBudwMMS8wocmUK5qqr8+PIvO6u90bpoGh/61szgif0vbY8x6Vj?=
 =?us-ascii?Q?hPkLhOpYLYyxERYczUk4nhSpzls2zxOfe3raZtF89R2kgpyqcEpNXDSLh5y9?=
 =?us-ascii?Q?QxhRxMjXFtI6Syyhrtw7BgIiL/xBi53G6WIWkWGjMqzfUNnuF+qA6U+pFWID?=
 =?us-ascii?Q?5JnESG2Viuc1HBASeAlMAPA0MX0BC7TvPj40OCcDkApnCZTQT9q4GJzRqLYn?=
 =?us-ascii?Q?igZKl9eiwetflMi0QfiBQNnNPlGmAcPTaxs0htd/Z7N6fL9GOUWtagpnWv8Q?=
 =?us-ascii?Q?xZlEv/hpSLBSJNFKEUWVuwxFualhGM/qwmxXGe406KZ8K2m88fYKXFUvQi4F?=
 =?us-ascii?Q?tinXcEwl+ElOMa94pXZQiGyh8aGXSUpFyVbHd6dF?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2187294476CB644A8945F0607B424668@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: purdue.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR22MB3124.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 93c75426-294d-4caa-7a16-08db6080e0cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2023 20:11:24.6358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4130bd39-7c53-419c-b1e5-8758d6d63f21
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 XAAGVHQ6es56I+qI/p50NPu+7+jZVwGjBR1omaqW97w275ilYzalDZMA1SlYE2sE+gPgbhNXAS35owHeJBmXkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR22MB3106
Message-ID-Hash: X5VU2JUUG5MZKGMLT5Y4IACALLOKRWD3
X-Message-ID-Hash: X5VU2JUUG5MZKGMLT5Y4IACALLOKRWD3
X-MailFrom: sishuai@purdue.edu
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X5VU2JUUG5MZKGMLT5Y4IACALLOKRWD3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi there,

We found a data race could happen between snd_seq_oss_midi_open() and
snd_seq_oss_midi_filemode() over the variable mdev->opened.

When running concurrently, snd_seq_oss_midi_open() makes the return
value of snd_seq_oss_midi_filemode() non-deterministic:
Thread-1							Thread-2
//snd_seq_oss_midi_filemode()		//snd_seq_oss_midi_open()
if (mdev->opened & PERM_WRITE)
	mode |=3D SNDRV_SEQ_OSS_FILE_WRITE;
								mdev->opened |=3D PERM_READ;
if (mdev->opened & PERM_READ)
	mode |=3D SNDRV_SEQ_OSS_FILE_READ;

It is not clear to us that whether this is a serious problem but we would l=
ike
to report this just in case.

Thanks,
Sishuai=
