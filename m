Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0E511DBDA
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2019 02:53:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E819A1737;
	Fri, 13 Dec 2019 02:52:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E819A1737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576201980;
	bh=QJAVQQkM16uAQQOITMzreFddopKEq1/MHkPCD3d4njk=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NH2VVfVAcl7N8Qsfh4WiL+f/qZ7iuqyGD7XTiD6FHIHzln9pE+/7We2kW4/IyAQLD
	 Wrxc0ksNtRF2Wt9BNvNRfeZUW9zkFwMHFJPfswOIWIEchLRXg8bBzGRlWCn3lMYKcB
	 84CZti+SCjSLLNVhsuPtFS4av2C39B9p1YnfEJS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 400EDF800EC;
	Fri, 13 Dec 2019 02:51:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8D07F8020C; Fri, 13 Dec 2019 02:51:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,PRX_BODY_135,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20055.outbound.protection.outlook.com [40.107.2.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 153CAF800EC
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 02:51:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 153CAF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="gK4EeqOF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCcTfM9TZgiXZiZcxmaLVG2MQGYdb6//Hz5pSIaT1liLjQQHxmaji41gnuDqBc+cAimspKzbJ9KMU1VZercweR7uGzJ40AA/9+HQEW0035uw6YyF55GFv0mCGo+PyzTVTVetuYhSkrH59MQb9AdbkCqsDN7u4vXueKaKMDMNdInUveIiyUFc0MK2BRnx1fEpgRYLKxgcdvaxiglRNxesRBRXcZXAgQQfC8gKdzGaXdDz1C53qDMpms7oRSQ9sJe9Y5nHxG7b2vxvrsnENYEkf12AZuRcm0uCxoXWvxXnbDpOfbC1g/F2OfgV0CxlPaZeN2sxUL+8H7K5OXWYGXIpUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wmtk87XYlfJyE4vMdtQ2K5jmkdQhIjjZv/8XeWm7Hk=;
 b=UDM+bGzFvKh6hanKjd0Nn4ZP8//LNo4DCgKrF2bGh2wf0w68Mfr14Qm3mfuPyp/fZaOuO4ir0jEzodTK0wOexyYbZ3oJWIh8lO2oszPeHoBuJxHG3HG+LXJFiKupN+B816mBkR/cXGGB2u2fz6vsr0TRyR7jBHUi0yAMg+d6wjlMXNe2SaJYCCcDLI6cPJ8wVbL3QJvuUwvHMRIsxU2XpPICrNg2cZUo2wW0zGfwyoC/gYvAris8ckXDVFWczz64kcdhqF75yJ+rlCr2m57+V/tKbEnoN8hTayLP/05xrWSnVthqhIF6+LSzEdumkzI6tuXI6291QEX5atNhYP9aww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wmtk87XYlfJyE4vMdtQ2K5jmkdQhIjjZv/8XeWm7Hk=;
 b=gK4EeqOFM0Hf0vozW7S7KlzfmCzcZeH0ChVWrSlku+BhODC//ijbqkwSAV9aRE4TSVvWYj78dKobIuW2dC0VgSiSRWQo668traML4ITWwNYmdReVahaAZSzT9crOMfAFsEbycYZ0neP/4QfzEz4JPNhKIEXlI/8yEvW62QKd/Ag=
Received: from VI1PR04MB4062.eurprd04.prod.outlook.com (52.133.12.32) by
 VI1PR04MB5696.eurprd04.prod.outlook.com (20.178.127.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.16; Fri, 13 Dec 2019 01:51:08 +0000
Received: from VI1PR04MB4062.eurprd04.prod.outlook.com
 ([fe80::20fe:3e38:4eec:ea03]) by VI1PR04MB4062.eurprd04.prod.outlook.com
 ([fe80::20fe:3e38:4eec:ea03%7]) with mapi id 15.20.2516.020; Fri, 13 Dec 2019
 01:51:07 +0000
From: Alison Wang <alison.wang@nxp.com>
To: Daniel Baluta <daniel.baluta@nxp.com>, "broonie@kernel.org"
 <broonie@kernel.org>
Thread-Topic: [alsa-devel] [EXT] Re: [PATCH] ASoC: sgtl5000: Revert "ASoC:
 sgtl5000: Fix of unmute outputs on probe"
Thread-Index: AQHVsLyIRDFbzLs7vEuxsFkXl6DgTKe2NokAgAAA1bCAAAyIYIAABwsAgAAETYiAAB0nAIAALvcAgACye4A=
Date: Fri, 13 Dec 2019 01:51:07 +0000
Message-ID: <VI1PR04MB4062BC61C06E7BC28C44F317F4540@VI1PR04MB4062.eurprd04.prod.outlook.com>
References: <20191212071847.45561-1-alison.wang@nxp.com>
 <CAGgjyvHHzPWjRTqxYmGCmk3qa6=kOezHywVDFomgD6UNj-zwpQ@mail.gmail.com>
 <VI1PR04MB40627CDD5F0C17D8DCDCFFE2F4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
 <VI1PR04MB4062C67906888DA8142C17E1F4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
 <CAGgjyvGAjx1SV=K66AM24DxMTA_sAF2uhhDw5gXCFTGNZi8E7Q@mail.gmail.com>
 <VI1PR04MB40620DD55D5ED0FDC3E94C2BF4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
 <20191212122318.GB4310@sirena.org.uk>
 <0705e7e703b9ff110ad9465ee9e06c9db76fd998.camel@nxp.com>
In-Reply-To: <0705e7e703b9ff110ad9465ee9e06c9db76fd998.camel@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=alison.wang@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 692160d0-ff3c-456b-c00b-08d77f6eebf3
x-ms-traffictypediagnostic: VI1PR04MB5696:|VI1PR04MB5696:|VI1PR04MB5696:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB569603A43974B385598FF512F4540@VI1PR04MB5696.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 0250B840C1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(199004)(189003)(66446008)(66556008)(64756008)(66476007)(6506007)(66946007)(8676002)(478600001)(2906002)(71200400001)(26005)(7696005)(4744005)(76116006)(4001150100001)(86362001)(186003)(52536014)(55016002)(8936002)(4326008)(44832011)(81166006)(33656002)(9686003)(81156014)(110136005)(316002)(54906003)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5696;
 H:VI1PR04MB4062.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3TZ8VSXmTaHa4yIkAbOCEyukJIg3tezgG3y1DPqb34PO0iOYi/I7uoHhnxQFBD9+A/JYYPGEWnkS4bn1v7Q61cG5yfeXok0YxJsYqS622FJiFMoaSiCZe+JrLlBJV9CboRLnH/Y49335vyDQ6PtGgq8gnQSct0Ssjm9d2QLK3fDParA4X71K8QGJfaS5eK6DcEnjUuJDV6wReDHjLrr0y/XEnEI7iyi46p4SXTwUwDDd/h5xn0/RDtHQzYd82b+31iRBmnzGr9bxWlSyXHgwPUdutJ86KPYDmAKMCTAwhlggJaUdhfHZNPQ8/2ebML5Xn1rp6XqeBpUYxV13uQF+LrneSw+/+vkUk/5E+o/1OL2m3kj5mw7AIl03+44sz1hTzcaL6agGprQofHNAW89MCWJhBaPlVFe0I8M0Lw3q2rT4oWrI2Tblmc6tuAL6PADK
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 692160d0-ff3c-456b-c00b-08d77f6eebf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2019 01:51:07.6515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2AdPAd67Cg8ds9sE+6+2U8y7lufNU8e01dCQBDRrvvx6MbdLCZIk+bBvtj1/44Ld7JZ1J6EPbcohYau5IhPfKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5696
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "igor.opaniuk@toradex.com" <igor.opaniuk@toradex.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "oleksandr.suvorov@toradex.com" <oleksandr.suvorov@toradex.com>,
 "festevam@gmail.com" <festevam@gmail.com>
Subject: Re: [alsa-devel] [EXT] Re: [PATCH] ASoC: sgtl5000: Revert "ASoC:
 sgtl5000: Fix of unmute outputs on probe"
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

Hi, Daniel,

On Thu, 2019-12-12 at 12:23 +0000, Mark Brown wrote:
On Thu, Dec 12, 2019 at 10:46:31AM +0000, Alison Wang wrote:

> We tested this standard solution using gstreamer and standard ALSA
> tools like aplay, arecord and all these tools unmute needed blocks
> successfully.

> [Alison Wang] I am using aplay. Do you mean I need to add some parameters for aplay or others to unmute the outputs?

Hi Alison,

You can also update your asound.state file with default state for your controls.
[Alison] Got it. Thanks.

Best Regards,
Alison Wang
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
