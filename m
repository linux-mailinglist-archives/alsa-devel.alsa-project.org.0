Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E08651B9
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jul 2019 08:11:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5EEE16BE;
	Thu, 11 Jul 2019 08:10:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5EEE16BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562825505;
	bh=ilpgnw5LzUBC0QEdbV1sDcZTdhxY8MywhPNv+T/fnoM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EMRGikh16bDfOIsuABwVRdAlfdijniDSnjiW+GLKGpob1AqHY2QD18k/QFlgHKw5N
	 2HIEqIwSRUyRv+xjAGPw/pzaBCEBjG5ykue814Q7h0q5fH9ulGHzceRHwgbSQstuyl
	 kHNpr8W7LWJOjjMuiJqjpEyimnMLNCMeNquBvdaw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD822F80306;
	Thu, 11 Jul 2019 08:10:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A75F1F802FB; Thu, 11 Jul 2019 08:09:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PDS_NO_HELO_DNS,PRX_BODY_135,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10061.outbound.protection.outlook.com [40.107.1.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2DFDF800E2
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 08:09:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2DFDF800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="snO+I7nb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hK2zxCQB1xA7uBSqu+gnbHHiQZKWdAl6l32a3JOYE3Yf58HC8QPTho5VtPs/JROHmlwgdoaLpbbXzUKfaXGpcZ/4mXf/yeEZaWJITLEKRv0ERUAdFyKHvi6LQsbAj6Ir5JxaCfW9CCiAi76NPqzlLYnvsQtn0LEuelRWvEs3jkX1BpSLzNLD4mqorUPtD5qUq7ctzonTKPQJxfDJtc10slW6P+NbWziPcPinqahUvpE0bjuVz+04TaQkxy9ez70JskjNGlR8h5eToqdZXtSeWhnLXawdsAbpIgs/OjKeNojdPshM1xtkeJpzxHEQD5AC+aMdlzfnJnE7isSdkcS2FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLN3mEu8vtoWUHhO3H+NHA4Vwhislb+d6gaHJl1WQ8k=;
 b=kwDZfj+j6vQLppiz2ZU0f8jnULk+SoNlnCshZDUmlOcS4MAY/p8CLfAfrL3qXVGFQ0yDEryUPqh23tM1YTCjautVft08m3CT6E6InZw5DDfD0UEmgd32yrg4imRUiganzO8yj9j1t+Vr1a2A+6nPKJN7OkJgFW9c93keA8FopNVITprvQtjoL+eFlt/x85gTIQW/R1+bMAcogsofYwHwAgZBZE4tyzs7PbC+2mO2PbZbs106SBcf3MS/SMaWzoHMeOurjIwO0hl4l9vrbDhQHzUC41o2x+Op6nd7h/M3A2Hu2O8zYqog1SOJSanAUjk95gNYgtVgW9YwYVREryhS1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLN3mEu8vtoWUHhO3H+NHA4Vwhislb+d6gaHJl1WQ8k=;
 b=snO+I7nbDOaQaQAKk3HiS9vvZBz+MJEn70G4QW4T1+nxgocBc94kfQkvi6GXnVYo50+hLYR5SDKgytIMcHiPqJQfJ7tutIJ84eX9UsTWyXFAGbk9XyNSEipOv00tKYOwhrlYWtqBha7HFkuBg8wHTes19Qpdon7AoojSYmLxb1M=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6413.eurprd04.prod.outlook.com (20.179.232.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Thu, 11 Jul 2019 06:09:53 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::218e:ee37:1e81:e157]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::218e:ee37:1e81:e157%3]) with mapi id 15.20.2052.019; Thu, 11 Jul 2019
 06:09:53 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Thread-Topic: [PATCH V3 2/2] ASoC: fsl_esai: recover the channel swap after
 xrun
Thread-Index: AdU3rxXN4oVmSlwnSCSsxmm6rhEC4A==
Date: Thu, 11 Jul 2019 06:09:53 +0000
Message-ID: <VE1PR04MB64798D6D1D9AD9EC206EDCE1E3F30@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 279107f3-88de-4917-d9ba-08d705c6640d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6413; 
x-ms-traffictypediagnostic: VE1PR04MB6413:
x-microsoft-antispam-prvs: <VE1PR04MB6413E348D70402D8DBA1C0D2E3F30@VE1PR04MB6413.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(189003)(199004)(99286004)(68736007)(486006)(102836004)(316002)(71190400001)(71200400001)(86362001)(1411001)(54906003)(478600001)(476003)(6506007)(66556008)(7736002)(74316002)(305945005)(26005)(5660300002)(2906002)(6916009)(64756008)(7696005)(3846002)(14454004)(33656002)(6116002)(6436002)(4326008)(186003)(81166006)(25786009)(52536014)(9686003)(8936002)(66066001)(81156014)(53936002)(14444005)(6246003)(229853002)(76116006)(256004)(66946007)(66476007)(8676002)(55016002)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6413;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KDr2Y05m3GRhW9TisCUiaaX0abhf5Gw7NecjXfEhUauYTPKC7HlhsxXMzuIXU50jZyCo3pda9S1A48LjVoCLSAFwuLBjQf5oVYkfrxn+elfpmcxygdF41QAJLxaV33FCccUY+3rFCZFvtghXSUrwocy399d8WrDZN+cfIfd43NS/AQX3nJR4+l8bxwh8yq8ICwRF4gb9TzNgOI2ESuKl/F6NqEgZgjlH1/g01HnhniMCznqwNqBnkblU8SYmi6skthlfzKwOjJjX3O4R9eW0aaxk4EjZ25wd67ym2AwT1fk38cyGoIB3JC4A4Gr8h0pfBZs6bMIpQvEJ7E9a/He6M8yAVN7dvjh+EfaGkZ8gxY2IzSVJi0GdO+rXje6jHgyAlGVyCHCreT9fplXBnDwUe6Rf5YAwbz2nUIg6QmNEP+8=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 279107f3-88de-4917-d9ba-08d705c6640d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 06:09:53.5138 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: shengjiu.wang@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6413
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [alsa-devel] [PATCH V3 2/2] ASoC: fsl_esai: recover the channel
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
> Hi Shengjiu,
> 
> Mostly looks good to me, just some small comments.
> 
> On Mon, Jul 08, 2019 at 02:38:52PM +0800, shengjiu.wang@nxp.com wrote:
> 
> > +static void fsl_esai_hw_reset(unsigned long arg) {
> > +     struct fsl_esai *esai_priv = (struct fsl_esai *)arg;
> > +     u32 saisr, tfcr, rfcr;
> > +     bool tx = true, rx = false, enabled[2];
> 
> Could we swap the lines of u32 and bool? It'd look better.
> 
> > +     regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
> > +                        ESAI_xCR_xPR_MASK, ESAI_xCR_xPR);
> > +     regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
> > +                        ESAI_xCR_xPR_MASK, ESAI_xCR_xPR);
> 
> Let's add a line of comments for these two:
>         /* Enforce ESAI personal resets for both TX and RX */
> 
> > +     /*
> > +      * Restore registers by regcache_sync, and ignore
> > +      * return value
> > +      */
> 
> Could fit into single-line?
> 
> > +     regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
> > +                        ESAI_xCR_xPR_MASK, 0);
> > +     regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
> > +                        ESAI_xCR_xPR_MASK, 0);
> > +
> > +     regmap_update_bits(esai_priv->regmap, REG_ESAI_PRRC,
> > +                        ESAI_PRRC_PDC_MASK, ESAI_PRRC_PDC(ESAI_GPIO));
> > +     regmap_update_bits(esai_priv->regmap, REG_ESAI_PCRC,
> > +                        ESAI_PCRC_PC_MASK, ESAI_PCRC_PC(ESAI_GPIO));
> 
> Could remove the blank line and add a line of comments:
>         /* Remove ESAI personal resets by configuring PCRC and PRRC also */
> 
> Btw, I still feel this personal reset can be stuffed into one of the wrapper
> functions. But let's keep this simple for now.
> 
> > +     regmap_read(esai_priv->regmap, REG_ESAI_SAISR, &saisr);
> 
> Why do we read saisr here? All its bits would get cleared by the hardware
> reset. If it's a must to clear again, we should add a line of comments to
> emphasize it.

This line can be removed. 

Best regards
Wang Shengjiu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
