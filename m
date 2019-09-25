Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23509BD6C8
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2019 05:36:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92DCE16C5;
	Wed, 25 Sep 2019 05:35:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92DCE16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569382600;
	bh=gUP6FWQwOax6w7h4m1XIK0x21pLfBdaoVnmcOcmA4dI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ud0NXhBtEd24LBxVIUKZmSiGx0IFr1svAzCdw1Z65amqIfrZGSeBlUhNIp7ruvZh9
	 R/5DwVyTmAkHeWJxc19t9O775BZE8S/miYRmHHy7Gb1EAi+gXowvGKCnwK5SHAEPOH
	 RnTHHAyBnMqkEpxQ4YAggCdpqKj1WORGoP7ehlJo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1197AF8049A;
	Wed, 25 Sep 2019 05:34:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DB34F802BD; Wed, 25 Sep 2019 05:34:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70072.outbound.protection.outlook.com [40.107.7.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14A96F802BD
 for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2019 05:34:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14A96F802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="bnFF7R6N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URrGibzPduHFL4Cj/qbsI27S02o/A3AGkx59xNBeR+tCMy3P4pBt5uGu9VhgkAEBjHNSibxWYqOP069pLsS4KDDg1pH36y6XnwPSMWvH5E+uR/MEBSyTYFFA8fe2nGc5o2iWpDmd9p1glqGPx/OJ/gbquXSlRx0EM4jM+y73hWGZZiRTOybRz7ndm5cIXTqA/JJAviwriY86atlFZiVESNP7zFt4n8SdgtYUhTxuFzCBLXbLxmIFpqycOQHEntsuMwUPjelopo6Qq1t7ZLpXoT1qXStRDqWZfnJN7EU9Yw5zK5ECBIEsVTUPu946zJy9vNxUUprggkEzQ16dsdPUjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQ6TgO9jjXwz6VthJCuxc4Hg8en8OdiiORD8G8ad0/M=;
 b=SG3qlnZY3neKFpSofcr75B8v9M0hovnwHxRcwDFHV1RCYEcQnbveEkcVypUpox57+F7CyacUaqbfUUg0bAZQkLhmdpPVU+ieCCSSth7ueY7rmcc9DDevp+q7ACqAOH73Xnuw9efNDQY6ZFpfPRwf0v0/y+7PrGHIjUDCuAU2tXdxvL+roR9ayI/wD/4VZxo20RdoNGAqJKgyO57YT+CKh4gTNFmCsxwpP0BywBJA3PUHqUjwbiYA5KXcAgBsIqbNgAzu+ubVrMVIw9/ZT44fsfEnqYFS3vWDj1MqjaFHlJ+Z9kcMm2WPJM4PIOX2xtPVYjgdjLwl+VdUYmL2y5NF8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQ6TgO9jjXwz6VthJCuxc4Hg8en8OdiiORD8G8ad0/M=;
 b=bnFF7R6NS/33mvy9PvK5UIS66YLbQ/E2q5rFLZIKEYMY8cWW8hASPVAeZgylPN3fTsJtcbcaULaWVyaqFV93/nE8BDt+lwwGQJKmMKy7T7oBYsJKd95+3JDmcdJUvfp2vdDcEmY0oj93+Wp97JTYsdXWTs7lU8aEs5htUPdqpG8=
Received: from AM0PR04MB6468.eurprd04.prod.outlook.com (20.179.254.214) by
 AM0PR04MB4993.eurprd04.prod.outlook.com (20.177.41.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Wed, 25 Sep 2019 03:34:45 +0000
Received: from AM0PR04MB6468.eurprd04.prod.outlook.com
 ([fe80::9974:f659:52e:40b6]) by AM0PR04MB6468.eurprd04.prod.outlook.com
 ([fe80::9974:f659:52e:40b6%4]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 03:34:44 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Thread-Topic: [PATCH V4 4/4] ASoC: fsl_asrc: Fix error with S24_3LE format
 bitstream in i.MX8
Thread-Index: AdVzUXTsa3VOQwaBSAODOXmc76582A==
Date: Wed, 25 Sep 2019 03:34:44 +0000
Message-ID: <AM0PR04MB6468B2731299F16400BD4601E3870@AM0PR04MB6468.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b17a451-efd2-40dd-64f3-08d741694f06
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR04MB4993; 
x-ms-traffictypediagnostic: AM0PR04MB4993:
x-microsoft-antispam-prvs: <AM0PR04MB499301404885738ADF93699AE3870@AM0PR04MB4993.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(189003)(199004)(6116002)(1411001)(66556008)(3846002)(71190400001)(26005)(476003)(66446008)(2906002)(186003)(66476007)(7696005)(8676002)(99286004)(102836004)(14454004)(6246003)(305945005)(7736002)(81156014)(81166006)(86362001)(5660300002)(478600001)(54906003)(7416002)(55016002)(9686003)(6916009)(8936002)(6506007)(71200400001)(74316002)(66066001)(4326008)(14444005)(76116006)(33656002)(486006)(256004)(229853002)(52536014)(64756008)(316002)(6436002)(66946007)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB4993;
 H:AM0PR04MB6468.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MeVQok7MfHaEFh60Ye2Xu1C4HDAXl6wOkhUJZZh72RqRZltvInCgDQwdcakS1ySDHbq461O7V+ndE5XBbymQrhLazo+7bXUc3FxjgiHQLyyaNvoMGfrMwkidPe/XRPVYOXyQWYylge2s5VKYIbXlAFlCUGCdliOMF/G0xvMFtrDQvuFnN8KCuKoAeIvEu9HOy7ui8w70wmmi/oIcJcLl9dnxCD18ecovuRBatUPEpMIZ0BEc9c4U2j0aP92F0FOL3Q7/4QyiCIYGs+Ey7cPVcUfTiK9GJIejsa+pObmFBCBIzuAloasEY2FlkMSnJBMgVuEhWRTBs/TpuD+iupc7mWwWVEv58MOgIzhgAjBhF/ZWgJgl4DOTujI0WY1sUz9rrHFpOewnBMfKP5a+Va1XoHREv9wZrq90aXJEVPVBvkY=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b17a451-efd2-40dd-64f3-08d741694f06
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 03:34:44.8345 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z+99T4hJgGWNuwtCFzBdPQUOBIoW37cS9ZydgqUys9BVT6EkVBB2K1i7aJ6p2GYerWe6GPjc/2pgsKOipkI6Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4993
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
Subject: Re: [alsa-devel] [PATCH V4 4/4] ASoC: fsl_asrc: Fix error with
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

> On Tue, Sep 24, 2019 at 06:52:35PM +0800, Shengjiu Wang wrote:
> > There is error "aplay: pcm_write:2023: write error: Input/output error"
> > on i.MX8QM/i.MX8QXP platform for S24_3LE format.
> >
> > In i.MX8QM/i.MX8QXP, the DMA is EDMA, which don't support 24bit
> > sample, but we didn't add any constraint, that cause issues.
> >
> > So we need to query the caps of dma, then update the hw parameters
> > according to the caps.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_asrc.c     |  4 +--
> >  sound/soc/fsl/fsl_asrc.h     |  3 ++
> >  sound/soc/fsl/fsl_asrc_dma.c | 59
> > +++++++++++++++++++++++++++++++-----
> >  3 files changed, 56 insertions(+), 10 deletions(-)
> >
> > @@ -270,12 +268,17 @@ static int fsl_asrc_dma_hw_free(struct
> > snd_pcm_substream *substream)
> >
> >  static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)
> > {
> > +     bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
> >       struct snd_soc_pcm_runtime *rtd = substream->private_data;
> >       struct snd_pcm_runtime *runtime = substream->runtime;
> >       struct snd_soc_component *component =
> snd_soc_rtdcom_lookup(rtd,
> > DRV_NAME);
> > +     struct snd_dmaengine_dai_dma_data *dma_data;
> >       struct device *dev = component->dev;
> >       struct fsl_asrc *asrc_priv = dev_get_drvdata(dev);
> >       struct fsl_asrc_pair *pair;
> > +     struct dma_chan *tmp_chan = NULL;
> > +     u8 dir = tx ? OUT : IN;
> > +     int ret = 0;
> >
> >       pair = kzalloc(sizeof(struct fsl_asrc_pair), GFP_KERNEL);
> 
> Sorry, I didn't catch it previously. We would need to release this memory
> also for all error-out paths, as the code doesn't have any error-out routine,
> prior to applying this change.
> 
> >       if (!pair)
> > @@ -285,11 +288,51 @@ static int fsl_asrc_dma_startup(struct
> > snd_pcm_substream *substream)
> 
> > +     /* Request a dummy pair, which will be released later.
> > +      * Request pair function needs channel num as input, for this
> > +      * dummy pair, we just request "1" channel temporary.
> > +      */
> 
> "temporary" => "temporarily"
> 
> > +     ret = fsl_asrc_request_pair(1, pair);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to request asrc pair\n");
> > +             return ret;
> > +     }
> > +
> > +     /* Request a dummy dma channel, which will be release later. */
> 
> "release" => "released"

Ok, will update them.

Best regards
Wang shengjiu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
