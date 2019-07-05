Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5AE6013F
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2019 09:05:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3059169A;
	Fri,  5 Jul 2019 09:04:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3059169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562310340;
	bh=86Mc5vvr40qMWczftP/KOPkH/kh3jgOOiStbhGiO18Q=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OsdVqP0fCigJe29pcSioF9p/VY1eor/9wD/+Fam6kCjJW/9uxQx8q92/LxTRxNCD/
	 mMR/+QOK4VqNGAz0M2eVGuAbFZ9OHbTieUg6WWGMtQY6q8mKuVsRO3W3lGFLJ2yp69
	 TY6GMuzYtkIOZmDiusHB8DMX8lc96zeUIWxwo6N0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31B6FF8011F;
	Fri,  5 Jul 2019 09:03:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33828F8011F; Fri,  5 Jul 2019 09:03:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_135,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80075.outbound.protection.outlook.com [40.107.8.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CC41F800E7
 for <alsa-devel@alsa-project.org>; Fri,  5 Jul 2019 09:03:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CC41F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="PrezOeEJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pc7H8JZvi5b5UBWgWjaKfr+XUoJO+fPtC8xJ63htuLk=;
 b=PrezOeEJn+Px6OHq/TmJCADMukMTFav+xRbm4Jw0uLoHqmqsXl/ga5auMBgK42FLMmrog+anVicUg/0/g2g4GFQ3fvv6yUujEtAeobd8CFCTTYmBF1fEP9WHRVRtv1AzO0thhTs5w2WjPjUMq4wzPed1pwfAakQK/ddRO34bY04=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6734.eurprd04.prod.outlook.com (20.179.234.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Fri, 5 Jul 2019 07:03:48 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::9818:813d:1b75:61fe]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::9818:813d:1b75:61fe%7]) with mapi id 15.20.2032.019; Fri, 5 Jul 2019
 07:03:48 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Thread-Topic: [PATCH V2 2/2] ASoC: fsl_esai: recover the channel swap after
 xrun
Thread-Index: AdUy/vnfzjEA6p6XSCSN/32Dn+RQkA==
Date: Fri, 5 Jul 2019 07:03:47 +0000
Message-ID: <VE1PR04MB64796C22C2D41B9A45E726BEE3F50@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 704f6f43-6dc0-4db1-9421-08d70116ed66
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6734; 
x-ms-traffictypediagnostic: VE1PR04MB6734:
x-microsoft-antispam-prvs: <VE1PR04MB67346B87306CAD03C691E4DFE3F50@VE1PR04MB6734.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(189003)(199004)(478600001)(71190400001)(6116002)(66066001)(3846002)(486006)(71200400001)(53936002)(9686003)(8676002)(256004)(81156014)(14454004)(81166006)(4744005)(5660300002)(186003)(68736007)(14444005)(6436002)(33656002)(8936002)(229853002)(66556008)(74316002)(6916009)(55016002)(6246003)(476003)(54906003)(99286004)(305945005)(102836004)(7696005)(7736002)(66446008)(2906002)(6506007)(52536014)(26005)(64756008)(66476007)(1411001)(316002)(66946007)(86362001)(76116006)(25786009)(73956011)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6734;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XG4zzy2vM7nLn5q66oq9XBTbKzr6dpxGugTy5iiSDGvPgCcLKjr0PA8E4adTLJO7uVHWevY7v+4zz4FP+p0nnOLmi7TXzxyBAQGLim5qWhGOM7Ysv2gwqRh9diJ2SpFGF8Cr8nFH2LS3mVz9KtdMOaKnIsfoMKcr2RKtvce7B4H7F3Avs3aNFS6e1mTbJzaVyI9azy2EC9r/7i8Aj4a2GbngTle7xzD5piOiqom+Il+Q9XQY5FtrkNInbilPioAWXwqFwxtbxe+onS2qwil4SzyQP8eGhdWkwJ5jK746efxb1QVHk+o3OjY1r6H1ru99OM6cZ0P3snka1oYS9UE5ZXddVY+K9NTDL4BLbJrRZ1r/vHhwyuVOiGx5+qYCSAtycbAvqFLwgDfEmpV2eJEZwCYjxICYToW4g31Ss0TSEco=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 704f6f43-6dc0-4db1-9421-08d70116ed66
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 07:03:47.8956 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: shengjiu.wang@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6734
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [alsa-devel] [PATCH V2 2/2] ASoC: fsl_esai: recover the channel
 swap after xrun
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

> 
> > +
> > +     /* restore registers by regcache_sync */
> > +     fsl_esai_register_restore(esai_priv);
> > +
> > +     regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
> > +                        ESAI_xCR_xPR_MASK, 0);
> > +     regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
> > +                        ESAI_xCR_xPR_MASK, 0);
> 
> And just for curious, can (or shall) we stuff this personal reset to the reset()
> function? I found this one is a part of the reset routine being mentioned in
> the RM -- it was done after ESAI reset is done via ECR register.
> 

There is a problem to do this, TPR/RPR need to be clear after configure the control
register. (TCCR, TCR). So it seems not only one place (reset function) need to be
changed.

Best regards
Wang shengjiu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
