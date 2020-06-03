Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E96F31EC9D2
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 08:56:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 606DA1663;
	Wed,  3 Jun 2020 08:55:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 606DA1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591167377;
	bh=0sP1U4qt5YsVJuphHP7+YtBqFggUbF96eB8OqcGvblw=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PLO92ZI4v/XeFhkJoOAjlupvhicFDdJpLFXIVJBe4Z0wiVg70cA8AAiDG7kfXgr8F
	 a3e/ocnfHfM44lTfM/15jOkFjKJLgoaeQdNxW2picOpRa8BTJdvBbf8VMixmRhIjx/
	 xG3fw/CpFr4huH5fiaeRQBHYiAhVlHn+TK63hcpI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EBA2F801ED;
	Wed,  3 Jun 2020 08:54:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA859F801ED; Wed,  3 Jun 2020 08:54:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2131.outbound.protection.outlook.com [40.107.244.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 250FDF800BC
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 08:54:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 250FDF800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="ETDSIetI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLMBjRXiBECUtJQfwhRPEp7qpx1JXsuDd5mernf+w+js3jS9gtz72vSAhyJxral3Bov83aRy6xg6QlcwVcJX3u0XpKI7FbefkdPs+e/nrhDBVRcdSTu3x0JwfO2Fpjsi1LkWFkfiQK+Z/zCok0nh9ZraEBy6qUOMtWDb3aHhRctrhJN/Gx6FFNGTOzMamBEHUk8kYDzGhXWzPp1nZ3gGDAQRib1WQnxxZNfcb7Sn6mpgkOY/Akbvf7ER3ddaxriBY6xLdtfi00tnC4mYciJrRVoFTTv9e3z4lfl/8XgDsn0mGYaKadsY89RRBF2CYitrsXMLGGoPvafs9lm+/rdydw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDF09/U8Un/rlV5HLQO4VKAn4JyqkVjZWe8ye/KsfDs=;
 b=AxFXoZbx2mWwRnxt7nH0Sm7xZRMezDWEhiBBURTnthKLYGccEXO8OFBs7cEGOIg0vvHA3ubqFeMAEPGDGCQ+tH7CcmcwvkW1Y0IBP7/EuYn5dnzTVE/7vfRZnQOWCNpo6uF1IEyAH1PFOgdGRqpEsevjEqntenj4ulGG2mhCXvaZ01oj7P4/XMCTLfOrXOziyC7I1vNzGJVwRDMwcPlOJuJlC8CXxLbGN99zYMffzwmJKaUwc0sGD/tmBpSIFR42ZtY+VL2FSDR9bGYFCpdt/amRV1R911O+2zTTTdwj8N513gTHkdYHVKnQY4L/F//4tGnNr/TOfu4YfjNxXsES2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDF09/U8Un/rlV5HLQO4VKAn4JyqkVjZWe8ye/KsfDs=;
 b=ETDSIetIxFn8+Y98L4AaLqylcXndi5ge29kV1FDfeNKbjA9Bhm5DLo2Buhbqovasrm59QQ/ZZcYkbFWLCtG9pu/Tm1KMc9X7t1xwgl+oXuzVc/UeO9Y2N5G2eNsjihgVGZue+zsLYxEA7RhpXbdHxvazffiBh7u0dcsZdeYDa3o=
Received: from MWHPR11MB2047.namprd11.prod.outlook.com (2603:10b6:300:2a::12)
 by MWHPR11MB0032.namprd11.prod.outlook.com (2603:10b6:301:63::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.22; Wed, 3 Jun
 2020 06:54:22 +0000
Received: from MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::994e:6a48:f660:f363]) by MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::994e:6a48:f660:f363%5]) with mapi id 15.20.3066.018; Wed, 3 Jun 2020
 06:54:22 +0000
From: Steve Lee <SteveS.Lee@maximintegrated.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
Subject: RE: [GIT PULL] ASoC updates for v5.8
Thread-Topic: [GIT PULL] ASoC updates for v5.8
Thread-Index: AQHWOFokKpVzl/qJW02GB1YlanAA06jFiOKAgAAncACAAMaW4A==
Date: Wed, 3 Jun 2020 06:54:21 +0000
Message-ID: <MWHPR11MB2047E3836D41C0F76101299092880@MWHPR11MB2047.namprd11.prod.outlook.com>
References: <20200601121323.GB45647@sirena.org.uk>
 <s5hblm2iq1k.wl-tiwai@suse.de> <s5h8sh6iiyg.wl-tiwai@suse.de>
 <s5hv9k9fmha.wl-tiwai@suse.de> <20200602190334.GK5684@sirena.org.uk>
In-Reply-To: <20200602190334.GK5684@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=maximintegrated.com;
x-originating-ip: [211.35.184.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 068bc731-91f8-41a7-547e-08d8078af208
x-ms-traffictypediagnostic: MWHPR11MB0032:
x-microsoft-antispam-prvs: <MWHPR11MB0032D918F8862011A5849BC892880@MWHPR11MB0032.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04238CD941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ThjZTmeehU0hhHoQf4XSCLnfc0Dcq59MJymmqLnEiD2lQmpk9GmJPxW5s+M23GoX+WLqGE9KOGO8oHXCm80990obZx9OuJRUgMJEJg9ueYRQn9PL5AswOdzj9rSDPKYqMbp1XKqsu0Qzhx/khkWHcC3OPl9r7Nw7dA100wC/1fu/IpqQBvMZ7hcFtkwW2eUH7G9VZQenLHOpa7qvpR49Hgvz7ed/vthYy+AxJEwfzAVLkvFqxvyFYcIhiU/w2yyKdCqPsYhQs4PQ7MmS5pWclEXtIlbXAiOiordkjkpG2AzV0xsbNylRuzludePlIVADden62V87nHoESXUutKqfEg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB2047.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(186003)(2906002)(86362001)(53546011)(478600001)(26005)(6506007)(110136005)(316002)(71200400001)(7696005)(54906003)(52536014)(5660300002)(15650500001)(33656002)(8676002)(8936002)(83380400001)(66946007)(76116006)(9686003)(66476007)(66556008)(64756008)(66446008)(4326008)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: XoZju9lAPW+wwqFT7GafA/bg3VYQAFPkj1FwgPLu0NSckk7IYEUloqoIHtpEK3MUmkEBcqypssLjzRUmfIIiPwmyn8TX0NR3qHGnMJolJ1RRjIXnqDhuktmc6PkHFfO7t87anvpu0bm9SK++1F5kH159YfE9P83cTi19XlhO7rnjNRi+D16rDUW5QkZHuMcScL+VFr1tqcl3Dg0uz0QtNMTCu3AebSutkT+i+YtxjwIwQzDQ0mwGqltBPX91vdL40UxqDGQ8eGcJmCT66TIWFdidcjnwigT/fUsFo1S259pLGD1kgw/FoSBkyWKMZc1CX0AUiDBGHmrALNuB2Sty5/QU+tBofGc9aaTNCxVR46rhUZmSykFwgfXmc6bYivkNxqDWpA+p8iFqTVrYg5IxDsdBJpZn8TRh7mLGd32fI+d8jdYai3U6YAwktzYV0DjyUIbvEMOumAsoh0/TH4TslRxV/trEsfdqEt/31YdINZ+zgO+hpEfc2OrdYRDAILF7
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 068bc731-91f8-41a7-547e-08d8078af208
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2020 06:54:21.8629 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8FFYtQQwW3Okped4RtD3/W0dRqGM31GgL0bNaxiW3DfTLcPIsg8rSvTsiHNFrMN1m9haPfR6CA5cpnjd5GChYk4koZ17qTpkQ8V2ePZFGJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0032
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Wednesday, June 3, 2020 4:04 AM
> To: Takashi Iwai <tiwai@suse.de>
> Cc: alsa-devel@alsa-project.org; Liam Girdwood <lgirdwood@gmail.com>;
> Steve Lee <SteveS.Lee@maximintegrated.com>
> Subject: Re: [GIT PULL] ASoC updates for v5.8
>=20
> On Tue, Jun 02, 2020 at 06:42:25PM +0200, Takashi Iwai wrote:
>=20
> > But, looking more at the code around that line, I could spot many
> > other bugs.  You cannot trust the firmware file and you must check the
> > size.  The current code can trigger out-of-bound accesses and crash
> > very easily when a malformed firmware file is tossed; e.g. just put an
> > empty file (or a huge file) as dsm_param.bin.
>=20
> Yeah, it's not great - the potential impact is limited by regmap which wi=
ll bounds
> check attempts to write beyond the last register (though now I look again=
 we're
> using unsigned values so we should definitely be limiting the lower size)=
 but it
> would be better to limit it to just the registers that should be being co=
nfigured.
> Possibly even just to one valid file length if it's always all the same r=
egisters
> being configured.
>=20
> Steve?

  Thanks for suggest in detail. I will update as limiting size as prevent p=
otential risk.

