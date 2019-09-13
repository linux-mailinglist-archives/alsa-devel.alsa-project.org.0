Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A781FB17E9
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2019 07:50:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F5501674;
	Fri, 13 Sep 2019 07:49:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F5501674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568353837;
	bh=YKdVOisOV6rcKtiawZMfF0PKpXi2q9Tw2lxNVc9vGyI=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jkrUFTZblAeXuJ1DmWiIoPZ5PUN7SyS6qz8nYqTiqDIldrBwgn6LK4EECwco3g3FH
	 mNVut0eLARuvkUgS3QjtGPhP94aHe8B7K3mNrPn2bWTyPsvXonmHIUFeatmSRpbeiy
	 ifNZ73xnhyLAgtuQqPce/XlAm5gZhZ9LmdAEwAAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 543F6F804AB;
	Fri, 13 Sep 2019 07:48:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3948CF8036A; Fri, 13 Sep 2019 07:48:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10058.outbound.protection.outlook.com [40.107.1.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DE54F801EC
 for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2019 07:48:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DE54F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="c7EzigXK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Md7nIJRWD8rRWiYOpNWXsWjikTdmw+1mHwXaoy0knyl6qBSzXzg81m/a8nWhV0+HsiSPq4HoxaNHCyupTUIcEy+GxlNpdNSlwP/qyyWeh28alp9/u4mf3jqkEKC9DjgDH4qLNzz81ngfx/cXnLKBncS8fV3xgKsnW5Wi4m+rXJx1qXeuKr0mq1YV13R+51zd9JXXmbs4SEdk+qws7RIbzrbE0E+VlGG1tD/Qvq8Uw6NhRe+NDWmu2/UCEKiPNYdRnfmDmfk4J+h3Ehm/2npLQZaHN94Jbh7ckxP7De8Gs+1B86oOxGMRupMdNZQLxtfeM0ExpCwI6STpSXW9PnjgSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBCCnSJLpEpCMycoFYk04JXgRHL+UjgAb7/e8w8YAeI=;
 b=Cf1gA7xPgeZH7lMHz7uwwVIUm5XZdYq2UyyI02biPNESMdioqsaD68iPS1iwM7zZyUuC568eSyn3/kLyfHoshXV4El0P7aTL6McE5nHdEUIV3p8XNxdNwuXmF4PLuj6Co5/yH24thMM47xYurvuGbuSWBe/tqGSBXma0G76Rsx5oGliEsovQQbfOdCGGw5mNqnq/wedc61YcN0BU8XQn1URk5nyiv0aTvXCTPl7jXPfVWAHML6VOIkNThD7iJhD52FlwkvoPqEZWZpfo+TQkfYyL8+kfqeJj8oi24QVHkdkeBvQGrT//AZYYMB02uvaa0ar/WYxPJKk2ngyQCg8s1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBCCnSJLpEpCMycoFYk04JXgRHL+UjgAb7/e8w8YAeI=;
 b=c7EzigXK38N6U3PYd7xzVZ+sA35yjF8tdi6Vy7t6SGK7kFWohNohHFWtQb7lvYoDJU61yslrfrpZ3DWXSLKdi7wM52hQY82wAR+olgSyix64bxqFVmd3HdT9g7LiVe3jVIBc4dKqpeFOyEwJgH2GzKI/4jYXgTpyPiCwrtetM6o=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6701.eurprd04.prod.outlook.com (20.179.235.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.20; Fri, 13 Sep 2019 05:48:40 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::5049:d7e5:95ff:3d53]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::5049:d7e5:95ff:3d53%7]) with mapi id 15.20.2263.018; Fri, 13 Sep 2019
 05:48:40 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Thread-Topic: [EXT] Re: [PATCH 2/3] ASoC: fsl_asrc: update supported sample
 format
Thread-Index: AdVne99A50iblB+wSvqDBZhWvxbm4ACSRBCAAAw2tDA=
Date: Fri, 13 Sep 2019 05:48:40 +0000
Message-ID: <VE1PR04MB6479A4161F9C71FD394A3DA9E3B30@VE1PR04MB6479.eurprd04.prod.outlook.com>
References: <VE1PR04MB64791308D87F91C51412DF53E3B60@VE1PR04MB6479.eurprd04.prod.outlook.com>
 <20190912235103.GD24937@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20190912235103.GD24937@Asurada-Nvidia.nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80d7f1c8-ba1a-45d3-6e9d-08d7380e07e2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VE1PR04MB6701; 
x-ms-traffictypediagnostic: VE1PR04MB6701:
x-microsoft-antispam-prvs: <VE1PR04MB6701A1ECFCD5B77527DE78B1E3B30@VE1PR04MB6701.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0159AC2B97
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(189003)(199004)(256004)(8676002)(76116006)(3846002)(66946007)(6116002)(5660300002)(81156014)(52536014)(99286004)(6246003)(81166006)(53936002)(14454004)(76176011)(7696005)(486006)(54906003)(66556008)(66446008)(64756008)(66476007)(316002)(2906002)(229853002)(11346002)(4326008)(66066001)(1411001)(7416002)(446003)(305945005)(476003)(6506007)(478600001)(7736002)(55016002)(8936002)(86362001)(102836004)(186003)(26005)(6916009)(9686003)(71190400001)(25786009)(6436002)(74316002)(71200400001)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6701;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vRfzF51we1zFpC03lvmDd+vNL4EZIt1dtj+HQa8TNvjHhUkCHZxvcQEldJS4HzlxEbwouGAzNQ3Kbl+kXXfPe3E31eshzv5xjV46Mfiv6EgkyeP0YR7fOi4fy57N/OPpXWYJ7LQ9CP92GKHiwlADBNV0lUiscF0zyzurOCMPzD/hrI2eePynDYwaCrujswr3NKyxhJXupjA+GWVbIrawrUMx2l3tVfga1uiVI8z9nyNhIie20XyATV9FtmWKxNIvkEXrnQM5nB9W7PCZ4eeYSm3lEfLflusEaeqxFitem/zZCUGQIxzRQ32j9Syx+6p4xk5B7PsJOQEMkX78xiE9K0adDoWrQ0/lgjL8dF30zDzfj0Gq68/v2j/PkYuMIEDqoND6OQ+z7tlweijdMwz/DZ6hweg24hJ2OyMu3dVXyds=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d7f1c8-ba1a-45d3-6e9d-08d7380e07e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2019 05:48:40.7752 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GIkSRxHUcaYmMn9kgeGtSEr7ArNIH3/+q4ObXJL+kVbiNS9b/ylmVoLwTE742i5XBKW/Tagij7gCZ62Lgc0V1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6701
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [EXT] Re: [PATCH 2/3] ASoC: fsl_asrc: update
 supported sample format
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi

> 
> On Tue, Sep 10, 2019 at 02:07:25AM +0000, S.j. Wang wrote:
> > > On Mon, Sep 09, 2019 at 06:33:20PM -0400, Shengjiu Wang wrote:
> > > > The ASRC support 24bit/16bit/8bit input width, so S20_3LE format
> > > > should not be supported, it is word width is 20bit.
> > >
> > > I thought 3LE used 24-bit physical width. And the driver assigns
> > > ASRC_WIDTH_24_BIT to "width" for all non-16bit cases, so 20-bit
> > > would go for that 24-bit slot also. I don't clearly recall if I had
> > > explicitly tested S20_3LE, but I feel it should work since I put there...
> >
> > For S20_3LE, the width is 20bit,  but the ASRC only support 24bit, if
> > set the ASRMCR1n.IWD= 24bit, because the actual width is 20 bit, the
> > volume is Lower than expected,  it likes 24bit data right shift 4 bit.
> > So it is not supported.
> 
> Hmm..S20_3LE right-aligns 20 bits in a 24-bit slot? I thought they're left
> aligned...
> 
> If this is the case...shouldn't we have the same lower-volume problem for
> all hardwares that support S20_3LE now?

Actually some hardware/module when they do transmission from FIFO
to shift register, they can select the start bit, for example from the 20th
bit. but not all module have this capability.

For ASRC, it haven't.  IWD can only cover the data width,  there is no
Other bit for slot width.

Best regards
Wang shengjiu



_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
