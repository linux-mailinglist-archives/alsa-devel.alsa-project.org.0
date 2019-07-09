Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A3062F03
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2019 05:40:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABC57165D;
	Tue,  9 Jul 2019 05:39:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABC57165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562643630;
	bh=K97p2tJpR7v9jc315G1FTu9m1ZmTk7HbsE89aJkLprI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=quUGPjLy5LDQ5QVZ6U7R/qwSyVdFaUMQtrIrMVXnbUwnM2YeU+iCPJU31nUOjd5Eo
	 DvO0L9465cBay5eRbuzb7fZa2lurB3xaKAKJQJGKbB/Ozp08xLpD996vmXpdMztGW9
	 XDEjFFhUiIYtzpGX+n0zhBaN85P/gnbbAF60U/Hw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAFD5F800E2;
	Tue,  9 Jul 2019 05:38:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19B5DF800E2; Tue,  9 Jul 2019 05:38:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_135,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00058.outbound.protection.outlook.com [40.107.0.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95232F800E2
 for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2019 05:38:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95232F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="ZMEHdqxb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OX4rKEGLdam9UCJUPoJejNFiKqVs/jmJB0trusfsHI1ZkPBO4T6itYcuY2kAXkwGSqKVE+0ScVMtlg7MED1CznAfQi+cTvIDiGqijBICqovhpIxDgy9tFoPzZuzLtPT6wCYo3v7dTg/Qz4rbF+iuNCCV6U63uqHZfCvKG1IkaarLzR0tEDb1PKTs4nCb1QRfasAdH6sVNHTBMroYAnAiJ8Jje0NyRYfb5OLcgsLwp7BpWMJlJzbn1JGAOnTBhuPAaZI7CV1IUOlcSkO3N0Uk6luQlT+Qmynt/h0nGMimbVORKgqc4jhHzeHxoMPXw7WInk+kQ3jnm1dSTqlzE7Nlmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huOkNqQOkNf6RW6RjMupOGnDJsrlFbyhC+whMPQAauQ=;
 b=CSsP88CyhAE20u3AG19tVjDVTNRFpJe50F9Fsjs9eTnDAVePoRQZ7+W1aA2kaqQCAVI+l/MwfUpgxTzXP6854RGXij9MDJsXsdUI6huS1qw61SgV6JINYviqrGjcmxfNqfl7MZdXG844/EmwFGrpCkPq2hWHD163rGRHvYF4VvqIEirsRXtqt7uqBkLFuDIw45AFFAHIOsK9UKTW1x9suFKNRLmSpfTtKh2CClOEdB5JM9l5An03ak4zww8QG79PxPLVQBfa06iYGbfDHdPzMLoCPPvLZsQwoWE+0Ml8RWHrRmcrorE83RPnk+qQG6yc7wbVzEtEcU39DeiDuCdZFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huOkNqQOkNf6RW6RjMupOGnDJsrlFbyhC+whMPQAauQ=;
 b=ZMEHdqxbQDIeXs3XL+z3x1u0PwbquukEdLIQCm58r3ycjR6ArJlYBIiEhJrLl2gOC+/9zwiiXr0JQAgyOafCHy2BE43TCH1r6nW3CDzPGnN3RFfVqud6VWMuu8lzky94xRLN439lf0nYbDUxbC78N9r1pd18JEeuSp2nWuYnt1k=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1SPR01MB0007.eurprd04.prod.outlook.com (20.179.193.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Tue, 9 Jul 2019 03:38:36 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::218e:ee37:1e81:e157]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::218e:ee37:1e81:e157%3]) with mapi id 15.20.2052.019; Tue, 9 Jul 2019
 03:38:36 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Thread-Topic: [PATCH V2 2/2] ASoC: fsl_esai: recover the channel swap after
 xrun
Thread-Index: AdU2B0WWYdAyRfftRKe3kHbe3589Jg==
Date: Tue, 9 Jul 2019 03:38:36 +0000
Message-ID: <VE1PR04MB64797B5172DB5EC9EBA8232BE3F10@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a88d812-30ba-4402-14d6-08d7041eecad
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1SPR01MB0007; 
x-ms-traffictypediagnostic: VE1SPR01MB0007:
x-microsoft-antispam-prvs: <VE1SPR01MB0007B4D85981DDDCE2999FCBE3F10@VE1SPR01MB0007.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(199004)(189003)(478600001)(7736002)(1411001)(6506007)(4326008)(6436002)(5660300002)(99286004)(2906002)(66066001)(52536014)(229853002)(74316002)(8936002)(186003)(26005)(54906003)(14444005)(256004)(7696005)(316002)(305945005)(102836004)(9686003)(6246003)(81166006)(81156014)(33656002)(486006)(55016002)(25786009)(86362001)(6116002)(3846002)(53936002)(8676002)(68736007)(476003)(6916009)(73956011)(76116006)(66446008)(66476007)(66556008)(64756008)(14454004)(66946007)(71190400001)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1SPR01MB0007;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fAQ1lR7BTNuLiwG/an5SbhBxMlFnnxWvWLDDc56aHop6NRQZ75/n21L46B+hyREojhWrBtjLQ/NFQrcIMfeSyvnsWQMBZjcGmLgEvQzuO/Y/ccFNL+vEWTE2FIak+BOtj0R9IpdA8l65OCQsf8asEhaUeGiSBDiuV+SShTQUPFBPyyfmQp+dkLeDlyniuEWeihK37RJ1kXroTJoHyRdT1C0M7kVj0Ph3dC3Xtm/nBp/NsxoyK3SGCh4EWC5Yn51w5+7JzEGU1jZI85BVvnRVtNcvHIlMgIl69osViUMhT3sCtRtLgY+ic07p68MUOllI7ZaIRfqWMi8oQ8Wwtrq+Nsaehb1H2v1ouBcXd0x+JK1lg58I8+2PtR2SELkeuHXBo88ij38SkNuUSc3td3WJ0CAh8Eyp4qVxGOi2MTvCYvg=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a88d812-30ba-4402-14d6-08d7041eecad
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 03:38:36.0761 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: shengjiu.wang@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1SPR01MB0007
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


> > > > +
> > > > +     /* restore registers by regcache_sync */
> > > > +     fsl_esai_register_restore(esai_priv);
> > > > +
> > > > +     regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
> > > > +                        ESAI_xCR_xPR_MASK, 0);
> > > > +     regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
> > > > +                        ESAI_xCR_xPR_MASK, 0);
> > >
> > > And just for curious, can (or shall) we stuff this personal reset to
> > > the reset() function? I found this one is a part of the reset
> > > routine being mentioned in the RM -- it was done after ESAI reset is
> done via ECR register.
> > >
> >
> > There is a problem to do this, TPR/RPR need to be clear after
> > configure the control register. (TCCR, TCR). So it seems not only one
> > place (reset function) need to be changed.
> 
> Do you know (or remember) why we suddenly involve this TPR/PRP?
> The driver has no problem so far, even if we don't have them.
> 
> The "personal reset" sounds like a feature that we would use to reset TX or
> RX individually, while this hw_reset() does a full reset for both TX and RX.
> So I wonder whether they're necessary.

The hw_reset flow is suggested by design team, so involve TRP/RPP is from
them, I don't know the detail.

Best regards
Wang shengjiu  
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
