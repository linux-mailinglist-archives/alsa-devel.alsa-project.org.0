Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63844BEB0C
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 05:59:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D905E1725;
	Thu, 26 Sep 2019 05:58:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D905E1725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569470350;
	bh=jkgE737MAhkSqpyPKVGcLohZMRasG8YMtxmyXgMvkdo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OzMMMpR/XGF9K4/bjbAsYDXFDZ8lF3xODvb1khidB05l/0ZmjB/qdGUzd0DiV6ekC
	 sbabdaH3zV+dUOOPch/PZ0k/1h3jXUhvuvvgVWScd2rvt2OZ6S526tU6EtcP4Ic3ji
	 GwlBB9omq+ArzRIHk60vIaDf/gk8tfutMqphASUE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62676F802BD;
	Thu, 26 Sep 2019 05:57:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85DFCF803F4; Thu, 26 Sep 2019 05:57:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00056.outbound.protection.outlook.com [40.107.0.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1381F80213
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 05:57:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1381F80213
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="iarMhq+c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBEwGvOsb0xlGOAxch+x7m+IRtpGnfZoBQVXg2o49V3rshhjbJbey8S8yXut/47KhUOWRMfK94DDc7y4l/GYbfz1Qva/P5Pt1ziKVpwclIKeFfItBQEsFlu0pOkafwaPx6PNBw/IuSnQ2PiME7MAsLirGquD9uQFALCkKyDknPLhcSbZJZ3ak6p+eifa7qwdSqyz7DmluWrYxHriYKBOSpCv+1somCuSFJreaNJNLWsHkTMUVI+7z1bqn4qCZLn5gAm1Vaj/pt/8LFxnYNESkdsDP4WMdGny8wDzGCVfnXMYnKg1YZts9/8F0s2Hcl+fYlaoAsYBfu76lTVxu7HqmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFtETIWmItbz8sgkDjSwYdwaW7nZaOXUhJA46UX0nYw=;
 b=DU9MiRJdy2c6qntScnFDMFCb8veqf3Gr8iZexBzBCqXLHbXx2n59GO3ecjZo46jbWQJTPSwt6vSQtWP1B1Id6mQl/+26Q9hxRcaw4iQyXKH993+hhUEf2nKP7HbOvek4IAQpTVbDVr/F8mVwav6IeQWAF1ApJqaWl9mD5U+9jPdxyfXOq2XK0qOHvkyT+ZXBlIBaVchNOqmK3fHxNaRhRC1rZ6H+0Le6lOWvpudAtAmOdUIjz3q1CUUSgL1m1r65sV69XKqvnrybNuQ/8l1oiDJoH93xkQoNzr1xEXaijG33juWG+IWYqVTEs1Vf+RpKR2kCNVXM0WFbEeRZfYQeBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFtETIWmItbz8sgkDjSwYdwaW7nZaOXUhJA46UX0nYw=;
 b=iarMhq+c76PXDwhA5OMOii1bNsVBD7m0A2I8v/gDbAb4lnCoMpRh0qdO3f2WaEDL4dKbfleIpjRWlaWR0P/wNdiF8gCCPJAMDbB61rH6g+tKNSHe5w5UsN0AEmB2OAaL/J7u9L+cObJwH1c5A2l8pARuoNEYGbUfe17LltC+BAo=
Received: from AM6PR04MB6470.eurprd04.prod.outlook.com (20.179.246.160) by
 AM6PR04MB5847.eurprd04.prod.outlook.com (20.179.2.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Thu, 26 Sep 2019 03:57:17 +0000
Received: from AM6PR04MB6470.eurprd04.prod.outlook.com
 ([fe80::85ae:95e1:4532:2cdc]) by AM6PR04MB6470.eurprd04.prod.outlook.com
 ([fe80::85ae:95e1:4532:2cdc%5]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 03:57:17 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Thread-Topic: [PATCH V5 4/4] ASoC: fsl_asrc: Fix error with S24_3LE format
 bitstream in i.MX8
Thread-Index: AdV0HmLgytY2LH8gSNeymPbPUv29fw==
Date: Thu, 26 Sep 2019 03:57:16 +0000
Message-ID: <AM6PR04MB6470AFE4170063A6F1429C33E3860@AM6PR04MB6470.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cfbbd9ea-8e00-43c8-dd06-08d742359f5b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM6PR04MB5847; 
x-ms-traffictypediagnostic: AM6PR04MB5847:
x-microsoft-antispam-prvs: <AM6PR04MB5847FCC5C07CBC6F185A78AFE3860@AM6PR04MB5847.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(199004)(189003)(7736002)(3846002)(305945005)(66556008)(64756008)(66446008)(74316002)(186003)(66476007)(86362001)(14454004)(66946007)(8676002)(486006)(81156014)(71190400001)(55016002)(71200400001)(4326008)(76116006)(229853002)(102836004)(81166006)(9686003)(52536014)(7696005)(478600001)(2906002)(6246003)(33656002)(6436002)(4744005)(66066001)(26005)(6506007)(25786009)(1411001)(316002)(7416002)(476003)(6916009)(54906003)(8936002)(256004)(5660300002)(6116002)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR04MB5847;
 H:AM6PR04MB6470.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: m5cnDYf4gGcgD5+R5Voar6Ga3w+HbFLMuUaTk0Fzj2B1n9shEgECVJk5/MZtuFX9VJI4me7PPTI/gKw7cnLbLTNU1jkRbSmjWp2VNMAt84hoJI8xrNkvOBXYA4U3XfQ7eeUKGRlZx5FoyndUMV+673mteWlRQ1HomIxxp2clwqmruvXK2bsArufHE7A2tKynQXWRSKTEHlM6Y16KAGfLP/nIgbSfVWF5LSD01oAbEUdfe8IKEds+LNSfZweU2i4r+Z0kaYVbI36fHw0CPc14PHkJWsghIMutqvZHt+K/1Sn365zNj3LLQPyP1/JQe+FUVSVwcD3Z/Bz/ejQoN2GS0ftvk7rQ02sFdwIyXCxJKsEJWQ6aylCg+ov5fQrvIDw6+nX5SOaHcz+x/DI1qk5L5roLw4L0YzT3HJZpPEjEahs=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfbbd9ea-8e00-43c8-dd06-08d742359f5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 03:57:16.9532 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2LHO7HIpoqI9HKouJNSskC4JAfxwdBbNTA9TRqzUnx+uVp74hDe5Naikfn9iMQlFIowf6uSBGl2pD1Ixj90/bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5847
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH V5 4/4] ASoC: fsl_asrc: Fix error with
 S24_3LE format bitstream in i.MX8
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

> Just a small concern...
> 
> On Thu, Sep 26, 2019 at 09:29:51AM +0800, Shengjiu Wang wrote:
> >  static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)
> > {
> > +
> > +     release_pair = false;
> > +     ret = snd_soc_set_runtime_hwparams(substream,
> > + &snd_imx_hardware);
> 
> This set_runtime_hwparams() always returns 0 for now, but if one day it
> changes and it fails here, kfree() will be still ignored although the startup()
> gets error-out.
> 
> We could avoid this if we continue to ignore the return value like the
> current code. Or we may check ret at kfree() also?

I like to ignore the return value.

Best regards
Wang shengjiu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
