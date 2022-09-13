Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A68385B65E8
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 04:59:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C05F170F;
	Tue, 13 Sep 2022 04:58:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C05F170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663037969;
	bh=JfDox8JCKzrjk8KRstxdbfphNbt1H5gihtTuo3oKrMo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dRwYF8gm3e5K0/dioNwFukEFZlIVDs5NXmgHybPJv4KKZQh0Rgz9zPxdGfMuKHpB0
	 2Ky6Uu7TjtINWEjA59x4ZzVCmkqrmZYEQ8EGRM2z70FeTFvSTLIgPtjwHG7QvtexDK
	 6JP88Wmjn7AuOpMPQla59ACgMCsPn5D0Qqcsq9RQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DC19F80533;
	Tue, 13 Sep 2022 04:58:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBE00F8028B; Tue, 13 Sep 2022 04:58:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80073.outbound.protection.outlook.com [40.107.8.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0757F801EC
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 04:58:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0757F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="KQfuNy4W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWIldctAxO0Uudg5aOVbnUbE9DX9xDwQPsj0d3hfX2Fv3czgjuybkMfjescB0BDOQQ+mJm1EbCi8qR2apvlHQs+tfYf8FqxiGewq5BR3oJCNbx07UcLSch6SyW0j/9xERpzeFSoKbAwT8bG4OKEy3/Mk8WKWfLJzXyIlGZjBb0g/1UrCRKJgPp3HswPu5m64RA0vlDbZopFzQ8GZgHMKhONXZkbPZTMKon26qXp/lJ+dWQGuj1dPmRcQV0w1ZjCTznvhjP2Uq7bA70Ne0KZmv6ayxMl83ZZ57KEPERTy1T9xRhLxpESsZUUwpgwkTcj1GgD51WVNywaynloEiWQfsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s93a9neDtpRKBMXetbkkZHgl7f8zAD28muTIpSzDU+A=;
 b=UoKExpv29FVuqtLBdlQpX3z52a7PGCm3dN7woBkcXDnk8Vp2AdjgkxkFPX4Zv+JsXrAF4N+vIgoaiKj0/rkiEEEPvQXE9j0dSl1pOvIj2B16nMOyjFGpUu/5vB3hkJz5IwuhmZvIzP2oCT1SJDxjcmSndLLH50/NmWsRvMR7I7dVUW4bv6nSi7RoDq4051u9HM+YO6o2wRGW4OoVQHEzKICN+bTSG6VCrnqFB/lRDBJi9JedMf85HTYDi0myX7AKH4D5DO/xeDZv8YiuvhPHXy2zGVo2jsoQ8RVPPvncAa73Q7W+0a6UcAmABoJ1Kk0qWpuTIrwzWiQ7arPHrdYgIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s93a9neDtpRKBMXetbkkZHgl7f8zAD28muTIpSzDU+A=;
 b=KQfuNy4WK3puwvX/CqRGpRWShlj0th5OPRx0P2/TFWyL7/NKyeKHDGN02eWF0Zn0arbkyLCyT49e4lTuKmISTLOdmC4dC7/YBdDdjgxC+YgX41zZIgJZ0pgywyhgs1Ws7+cX481G15B1Rtgg6ax5Z4yuPi3Vn8YzLR+Pqyxg2kw=
Received: from DB9PR04MB9355.eurprd04.prod.outlook.com (2603:10a6:10:36b::18)
 by PA4PR04MB7502.eurprd04.prod.outlook.com (2603:10a6:102:ef::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Tue, 13 Sep
 2022 02:58:23 +0000
Received: from DB9PR04MB9355.eurprd04.prod.outlook.com
 ([fe80::cd3e:5547:9f2:38d0]) by DB9PR04MB9355.eurprd04.prod.outlook.com
 ([fe80::cd3e:5547:9f2:38d0%4]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 02:58:23 +0000
From: "S.J. Wang" <shengjiu.wang@nxp.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: ak4458.c: move ak4458_reset() under CONFIG_PM
Thread-Topic: [PATCH] ASoC: ak4458.c: move ak4458_reset() under CONFIG_PM
Thread-Index: AdjHGnJh009opkawQL+3PcERhJ/Lng==
Date: Tue, 13 Sep 2022 02:58:23 +0000
Message-ID: <DB9PR04MB9355019BE33DB9A2A0D2557FE3479@DB9PR04MB9355.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9355:EE_|PA4PR04MB7502:EE_
x-ms-office365-filtering-correlation-id: c7e59c7b-d87e-49d4-a416-08da9533d29d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kZWfbeV/qUmyo3Ta90+wtgJ4Ocix3JX4ie9JXeaRre8AGmHCKzdncxJAvrU71PbaNAlk5t/sEls9ZZQ4xZdij8Ovb8Dn2Tt9F7H0XDvliqSWYvaj/v9FhRG9cXZX2thOr5Guq89NY1Ik3M1oVmbJK+cG89iml3y/HzFokDckmHMzYt/i66KSZfKlbgrT4hqROduxUD8WmMujB8CT4SFiocBiOlPjmgkjcvV7Ak/ugPhbzKfI4hE4Z1XJufpMeAcDZdMTMe3CFxwtFYycDMKjQMVD5YZKbL3tpEv+BakTNG7t99+hCOtXjKh2sKjPlw6S8ZtjNURRpgUTbjX6VAj2X2KQngfKcy8ilyX0kTAOS7Pf5XRTKcRSyOWxnM4oOd48msVimSv5t3oYCDhWlH0L28zvV8TCW8nLT3FGR2FjAq6xHUWYjqTczoifu5dxzLa1OmA6gcPxhxCUZixluW0C3Bc/ud/6agQfCqbflANlsn1DvRWD5D64qR1WnEF8ho+M9P57PnaC67Nj4E/QOUfMMHrAhi4KiSVOwmPu/863QaC29iYc3PSQpUjtUdRAyfmdEIxfi2zrkTCLZ3raXADL4e3HYxcixHKBO2BChESArVMG+JkO/WS0KXI1GoxJGSKYTApwrbxdHxEn/UXrL/Nf4g7oedqijHPITZNxVZJs0dRKetrPwB7R/FoMek/AQw3uvT3b9l7CP+tLMdK3gL8Kl9+f392Vdko5DMmLIDRzEfkkqAqa4uswkBEG/ZLJGYGaFF7DRlhNurPerbVmvlMnSg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9355.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(451199015)(66556008)(66946007)(76116006)(66476007)(8676002)(4326008)(38100700002)(66446008)(2906002)(110136005)(316002)(41300700001)(478600001)(38070700005)(55016003)(71200400001)(4744005)(8936002)(5660300002)(52536014)(122000001)(6506007)(7696005)(33656002)(9686003)(26005)(83380400001)(186003)(86362001)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3r04vyDnnBKCTakgKRRttXDABIM8yMsiKwiaVj+F9iQWwHizTzYchMuAvX7T?=
 =?us-ascii?Q?KMyRisxijEZlO79YxiTWh8nahvYACnnf2Apx0xCGsrPkPFiOXZhFD3E0kPsI?=
 =?us-ascii?Q?h9c+mDqNC2/DdQsffriqtCUjsOZkxwVhSrrJ9wuf9KGeXkxdqVt2ek/LUusa?=
 =?us-ascii?Q?rcyrR/wkqydBnH76Bi00z2YatB4w9Z61yYLkYLZ6zALGrs8dJg8Y2Ng/2FTf?=
 =?us-ascii?Q?caq74M5upHAvlf+V2WBkMRQl3pgBaIQ7WGnJuvbhrFFfKCgay3nO78pUZ8GR?=
 =?us-ascii?Q?Ik4V895qyzI+qflshp6/55qQM4eNTL3GoBggllWZaPB/XOKP5b+7RkZ6iun1?=
 =?us-ascii?Q?Z2c10yCFkCwAAUR5JWFwTmbeKYfHjvmNJZEugGqC3vlg7S4ZubYS8WL2DGUD?=
 =?us-ascii?Q?SBbRMYQ4q/cWp9Mtbz0Y9yQdkaLdy53Ii26GMirzANuDB9UjtXqwxMwafjvy?=
 =?us-ascii?Q?Urt4GBFCuBpDlBulaaG/h1zGuR+622Aatp+VCoNg+mpIa+rnpQSZd2FFrC3j?=
 =?us-ascii?Q?cUIjBIDXOcVYBAegr7RyudmTySNaajqZYDzKvIVbH55IdpI6wbvegOaYdfat?=
 =?us-ascii?Q?kNqRoGaf7gtEE5jotah2C6N/Vu38MFB8Z8PaWQz76mBkRYAWoQe/C0ugdwSd?=
 =?us-ascii?Q?7q06u7BlbajTzAkIChJwuEBUNMjyynQJoV22n3QePXGVcHKbOMP5I4rXjkS2?=
 =?us-ascii?Q?34d+4oBXRz8bCYBTzmnZkZzG84cYQTTOpbC5NlHepJERSIHZkB1GoF6Xwfod?=
 =?us-ascii?Q?EWptuBgcWaFtUO+tPv3NnSTKPA1qiPhVi8OfcmZLnCJA86fmVo5kFeIzsVnl?=
 =?us-ascii?Q?7IcX1VeGQTpH4D2eyvHtIdEbSruHczKDzaTThxi+alXY5PS75BG5qca2kdy6?=
 =?us-ascii?Q?fyP30ejVw1OIQw5dwF0o6A/l2cO5LoTRnahq5DERBnRiS3+WDkTTkKJ//wFh?=
 =?us-ascii?Q?GC9fyOzd2PqNHGYU6uuGqqIaz2JuIg0bz9qMVqIbt9/Ho+RT7TYykz9d0TQA?=
 =?us-ascii?Q?Hb4KmNmpuuIvGzP29u4ylmxdfOb9VQVkZDr8B7iGIpKE7Eyz87s5spChNBWS?=
 =?us-ascii?Q?gf4XDA3TswxMd22MHzGz1DPTr8ULflamIO+9ij/pZjVJS9oqH0gGJO8sOLJo?=
 =?us-ascii?Q?PMy0kujdf3BZmQWKlQk47FFEcTaPfWpsfRAlxMkb8h/91mPQvrUGy+5qGFxl?=
 =?us-ascii?Q?DJglJuE5RF9oJoFGMmBxchLc4EZH2fCxiYK33Rph1bUvUjA0PmQ+skSbQRCl?=
 =?us-ascii?Q?A8OrHfaN4IXkH3uisAhNowqgVe5iEoRks2FdvFzb078b74g8Dm1dNCecVfuC?=
 =?us-ascii?Q?xpXINU7xVDBnABkMkoN4SisIi4HKgq4OurE893OzO+aiX3u+64/9Rvv2AbAM?=
 =?us-ascii?Q?HAnLDJII9Tftu+42O9RSqVUCcUJ3Ee3hE7J/f3FfMxXP63T6w+5yoNNcs8mW?=
 =?us-ascii?Q?LcKAcc8Us8q1N2mPzFT+jOn6y42UPFxNqaHma8u953vTaDfv8DLyWVrfm78N?=
 =?us-ascii?Q?4QYcfTnge0GG+rDwGH5fOwM6g4Ti0h7fEx4jwWbzFkFnNGM5KU8XJ4Qnqg42?=
 =?us-ascii?Q?A/R3PxxYff/8xuI06k2W5EOusBZTB78n9KzN+no/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9355.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e59c7b-d87e-49d4-a416-08da9533d29d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 02:58:23.5138 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qcjy3tQKwDCS6SN6d0ApZgfwmBogRLUllB9ZZzyLkAmiXRmOkBqIQt/aP8CIp1sDfOlURRUwN57n+bn3HfvtWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7502
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

> Hi Mark
>=20
> > > This patch fixup this warning
> > >
> > > linux/sound/soc/codecs/ak4458.c:631:13: error: 'ak4458_reset' defined
> but\
> > >     not used [-Werror=3Dunused-function]
> > >   631 | static void ak4458_reset(struct ak4458_priv *ak4458, bool act=
ive)
> > >       |             ^~~~~~~~~~~~
> > > cc1: all warnings being treated as errors
> > >
> > > Fixes: e9e7df88996d64 ("ASoC: ak4458: Remove component probe() and
> > > remove()")
> >
> > Is this the best fix, or should we be adding _reset() calls into the
> > device level probe() and remove() functions?
>=20
> Hmm... I'm not familiar with ak4458.c.
> Is your opinion for original patch ? or this patch ?
> This patch is just trying to fix the compile issue.
>=20
> Thank you for your help !!
>=20

Thanks for catching this issue.
Without or with _reset() in probe() and remove(), the driver can work in bo=
th
case.

Best regards
Wang shengjiu

