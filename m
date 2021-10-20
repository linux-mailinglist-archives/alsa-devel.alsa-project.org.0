Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3660434483
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 07:09:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75EF2169B;
	Wed, 20 Oct 2021 07:08:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75EF2169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634706563;
	bh=tctqa8rkHBhQQ5R52uqjHwlijqZtsx98J2DkJdBQyxo=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aKVo874EbVBnV0mbHB3IsuFZUimgFV8kKv81++GGDm0l5HxvBwP6CsT7NI8L2RVq0
	 /9g8AuUnGTlCyxUPXEm+1+fdxa48jzXcqtroLvezkxnUyNOEpiV92VbJp0lrIseD/Z
	 hdgDBto5pe0qkvXt2JFWtavlRujtbtfZS4DJqt1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35941F80082;
	Wed, 20 Oct 2021 07:08:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C13A8F80229; Wed, 20 Oct 2021 07:08:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2139.outbound.protection.outlook.com [40.107.220.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEFA4F80082
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 07:08:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEFA4F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="EUGYE1TH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOPq+N0SnYL5vF72TSPj/yOcHvxgkJjoV1Z7NzJxzoYewiqAQZUrwYGjYGEAPEnjBkHxLq7b7T/Elo6aQe0ZEf0ZC1/LhQCAITJd/Dp/bQ4C2RVA04U2yhWqV2qbuf1QPM5rv+u0tle7gK79/YbB+MkMUNG+MKaMlow8RsDvfTPG57zJdDqnQQTyub5cQrPnLcslHjZHQGatixMmYUOxGiSIGBxlujB+LZYZnroOcdm6L6GlX1A6PlcdFCzdWU+WnTpDxXvb9wDsII/iB00wyVxNToxcJJOSMM7UPEyUFopGEnL/2Z9WFIUx2pen9E3pz+TpRw6lUnYh+Qh99Ewdpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tctqa8rkHBhQQ5R52uqjHwlijqZtsx98J2DkJdBQyxo=;
 b=lWzdDN7uX7yE6zzcTfTBIRa8SKfe5SaoR12z7SzAZ7eu122mXSYIR70rY2mz9/xNGe07li2z3vedBkPhboStyihb0IaHZGcT9FDPmUTDTs2vQBvq1skdUG1SdwJMUwwLX482/0mExJzxPHhiAMreLaE6NaFCwHjABne79Ajpt/S1XsUFhZXrAuJ2OYnfqLnuUGSx5EyQs17OVq4RPhOgyYi5fUcRgi5pPFlgiZRdLvXSxpCPqBxJ0Udgp0XOxY8reBxBrbUrMP40CcEzmqkfXCSOr1JQVcjbnrcBaGyJFPXnWg2ut/+Neur9+bgbxmLlXJECMHf0PShmKvk/CVzcJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tctqa8rkHBhQQ5R52uqjHwlijqZtsx98J2DkJdBQyxo=;
 b=EUGYE1THWmdD/gOftJuVGCZsfL3seRT/64FhMMxCObP/zI1E/nI6pH417FKzmqy5DeaJ6jlGUA8mvVYXFf9CoGpqDXFNm5fhWifoXisJhY4TCCBxlBuIGbAdiUnHOPg59OT1ehmkpOTBoODNZGE+BJ6iluhKBm/iCnm/KaMrJYk=
Received: from BYAPR11MB3671.namprd11.prod.outlook.com (2603:10b6:a03:b3::15)
 by BY5PR11MB4387.namprd11.prod.outlook.com (2603:10b6:a03:1cb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 05:07:55 +0000
Received: from BYAPR11MB3671.namprd11.prod.outlook.com
 ([fe80::49d4:a1dd:5b55:4c94]) by BYAPR11MB3671.namprd11.prod.outlook.com
 ([fe80::49d4:a1dd:5b55:4c94%6]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 05:07:55 +0000
From: George Song <George.Song@maximintegrated.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [EXTERNAL] Re: [v4] ASoC: max98520: add max98520 audio amplifier
 driver
Thread-Topic: [EXTERNAL] Re: [v4] ASoC: max98520: add max98520 audio amplifier
 driver
Thread-Index: AQHXxMZJ/DXqVgDAh0ytNaangbnP9qvaOdYAgAEdfHA=
Date: Wed, 20 Oct 2021 05:07:55 +0000
Message-ID: <BYAPR11MB367162792F06F4EC4499BB25F4BE9@BYAPR11MB3671.namprd11.prod.outlook.com>
References: <20211019084914.14622-1-george.song@maximintegrated.com>
 <YW60rmCStn2o7o31@sirena.org.uk>
In-Reply-To: <YW60rmCStn2o7o31@sirena.org.uk>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=maximintegrated.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d9492f8-5716-45b8-0fe0-08d993879368
x-ms-traffictypediagnostic: BY5PR11MB4387:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4387ECA70CD01FC538598552F4BE9@BY5PR11MB4387.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M2aFeiHTLvrRcAqGiwnCaMPo4LsO9GbCQOXAG+qZHi4nT4wIitENwydZ5COEdT6mS8BqcfcSrt63Sj5hEHlUec+DOpW9C8KTL5pYWjN71ZNXABdK/DYCo/tWWx5KiUeMwrIaK1gzx6Xf7vsJ0cJiN8SLEo4ilO4lWcQJjp6ttl/HFwAjXCOMP9g/2+Czkv+DcqVujSTFXh2wFvVh7PDNiTkIx0dcYNbnQAp+YNkdUTHcJXArIDqrE7qKzFcnYjTdi+pS+t3NwiODJ/WiMT5NeLKe5w02x8yry7nbJpQph8iQ+7vzjHlx+QMN7Ohdqt5rts2roNIM3zpIqoGWU7xA1uZUM9TKlciRAI/gcqYZdD35d3pahRO6UdBUeLYaTdE3Tm8gP+QwPZ9ON6Z5uAcui4iy7fvc+TTRJUhgGXTgp9I8rq9zxlJTr3LhVkZz5VgawHP5jhyEa3FYp7PAnQYg2Yg8JB5d8XDsvzP8zUMlCtm3tFSto56r8u9nHhYfFnsw3qLqnSigczFZt1Kx438aKSXxd+OTwUYXYb4/I/4nEvge8ArRr/90fpxKrMZPaDWCxaBAdxND1o9HlJmXC76MB0IXe5eBHXgxBUCN/GoWTpgrOAt2iDLzvM/ejm8hiJ1/pB79iuA6NVLSRIstXBTFrKU7Hvxe5dk5FHFx+3fz8JhEZjlJPGSE8txJJIDc3svwuJ/r/3c6ybLhgOsZ+IVZ6g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3671.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(33656002)(6916009)(4326008)(7696005)(38070700005)(55016002)(9686003)(86362001)(508600001)(8676002)(122000001)(26005)(76116006)(316002)(64756008)(71200400001)(8936002)(558084003)(6506007)(66556008)(186003)(66946007)(66446008)(66476007)(38100700002)(2906002)(52536014)(5660300002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?q5bLXqsGCG32naHDiWrjY5khYB4wD0OXuUKcR/ulLaVFjUMtCepTUg0B/N6t?=
 =?us-ascii?Q?D1wuQyEt0LVWxLJk0OPrUMDVddtsP+lmFZHjojeUruOQ4K6g+dsdb9Cynoz1?=
 =?us-ascii?Q?7zY8reuz5aU6WWeLSlm9cBOxHO2PgBmEioyRIbSFVELaRP2LhNU1i//2B7F6?=
 =?us-ascii?Q?NXmnm9OBBgf0raYT92rBhqxkQVKkVewoIgmVX/6DosjCLM5oiahLaWruLesF?=
 =?us-ascii?Q?wn7ExHjPP7/DL2Olhts3jn0F28U5Z7FWMuE6rNBg7DP4h0GlGNph+IusSB3k?=
 =?us-ascii?Q?gmCRAbegrhCpWy4xJuBWEUK+yp/svUcOMe1OSpmFq/QRB9Eunco7I85XAdIZ?=
 =?us-ascii?Q?kVtw2mMkZtPu5o3MeKUZXY8P8surkJoxl736+OuYQ9C0kHUo25xuf+3IDTI+?=
 =?us-ascii?Q?lMG9Z+DddM0yW2sQtG+i3HZQNesJCPydPTDr84dCgfVP8bQEgOzaCaqu9KI7?=
 =?us-ascii?Q?fiez/ok7I6IrmgNqbTux8sUGNq0okEa5YJ9XtK1yg6exhWN4lpfmKZ8MYT0+?=
 =?us-ascii?Q?yAVUSPwBTNTPCb7TGvkeQkCPWT/6kECCvRHCGPK0ATK+OOnhX10mRp/STOkr?=
 =?us-ascii?Q?xqQZC4AX9Kmx7ROgsVhL48Ma7+kPP3iGgPrmEVFYCCkVE2eUe9sjmWm6nE+m?=
 =?us-ascii?Q?ah8/J1W2htuTY6PegnJURq2t5IJebvjVolzQriU2mYg1s8dVx35W6Fd/03om?=
 =?us-ascii?Q?N+5i7ACtn5qcXwID1Apnmbkwg4J5RV+go+/3/IElfifUAoaOHPtL2A2Y56BK?=
 =?us-ascii?Q?cCvdeIw/ZcmwLNtMuJxZtv8T5DG9B2LTmLMtEYpgqAys4NiyyX+rBMTPBfLa?=
 =?us-ascii?Q?DIPNwii7VpaIASsemEvmM1AU22iT+AY2pjJg/a5ha8O6PYlOSGWimreUyp8y?=
 =?us-ascii?Q?gJLHeUuWSiVwsx0msFrJy/9w6d/6xh+zxEjxD2CCJYN95G26WRiAS4Ur7Md8?=
 =?us-ascii?Q?cGi6layK/plfSnZAc2FqSkv3BdUvDdrMB/dF2nJ7NHj6U2pyAp1R3+VvgUDI?=
 =?us-ascii?Q?rtOPgF8LoNArVUuO/uPkuOr+ZV7lSRZvlGI6TmPtZTqg6q7bzrBCrRAmvmHK?=
 =?us-ascii?Q?6hZBrlKkCKVrArQP+Ih8YC1prZiAoIt9xBJzXbDslqjqtC/aAb8y2sYFoAi3?=
 =?us-ascii?Q?akR2jnMCSqmrhXaKUjQFtIX0Q8V+y51A36dW66M/V9AGCq/1iQaJsAMoGk/x?=
 =?us-ascii?Q?HkAH/U+8ZYSvBnhz0zCKGnYVwc2jWMGUXqFoClsppMDhTL3Jx8Dtib6jyIS2?=
 =?us-ascii?Q?fDZXYOAH3c8UcLVBFP4+PjU9ZmflDQP0t3sRI+6pniUxfi0W6i/4VDWBm5E8?=
 =?us-ascii?Q?D/xtuSHCv+Y/+CIuW9wlx/+C?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3671.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9492f8-5716-45b8-0fe0-08d993879368
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 05:07:55.1105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jo7LdZSlPIaKRD2/qNv8h1d4Euh6p4rShLxOCIJ8kW8JMVP+rUeAQrja8UnLxpKN3SkzkPNHyY5FzBUSDmp4pIYt5ttJg0GIf7T/HJP+LsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4387
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Steve Lee <SteveS.Lee@maximintegrated.com>,
 Ryan Lee <RyanS.Lee@maximintegrated.com>,
 "george.song@analog.com" <george.song@analog.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
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

> On Tue, Oct 19, 2021 at 05:49:14PM +0900, George Song wrote:
> > add max98520 audio amplifier driver
>=20
> You seem to have dropped the binding document from this version?
It was reviewed binding document this version.
I`ll re send patch both binding document and driver in next patch.
