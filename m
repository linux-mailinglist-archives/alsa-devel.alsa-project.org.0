Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF307E121F
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 08:27:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CA9E1660;
	Wed, 23 Oct 2019 08:26:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CA9E1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571812037;
	bh=sbUc2ErmKrNCjsHdOAwoJvl6eqj/CpCxWrkxHM46ouw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cHyKAHQzunWCaSP+KMH6y4tLZKbi7WmTyUlq4yue/YlssgxgyRmHPSnTAwAeP+as9
	 38DstNPybVfoeHwuNWKamg1Y25OsnMO2+N/hn2sZApSyJq0u8Iuu4DeEpkSYKq3mUS
	 vmR50fCcQRUo7gyU7wAcxSkQxl6uOFbKnCFT28nQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D6AAF80368;
	Wed, 23 Oct 2019 08:25:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF6AEF80368; Wed, 23 Oct 2019 08:25:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80082.outbound.protection.outlook.com [40.107.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E5F4F80112
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 08:25:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E5F4F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="nLzBgvZW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGuuBNE55uGFhDbovelsgB+C3DkhiNh7588HUN7XsWGqfx524Xod3544RGFbUhDJO/LIMGDs9Hsj40lkhW9Qc2+YdU//JaoiPfCo8fkRvCeuKa87aLTHHFZQpKVsUYh+U3n8NAwo6RyEpcQ7LURf1gMskJnb6AlcZwCwYdfsrrZcSC3Rrft9xKSikMbw9+gm/TPW+JZmuC9tsb9rPI9dvP9ZnbXDsEqGPmeppJrNNTV7NHIdrm7ZCais9HEnfnYp3QbcV1roUMSnXUNGcBK75KwbZ5F4wMVj2BHH2lwB63kARscDqj87/Di0lBJpxMqWfWJcKyCUh7buU1U7xAv0zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwFcst4YdmOpjXouE+DS7TwC839qNMPH0c2dslst9FA=;
 b=DHWROIS5Qx8sJEmBk/NQfbc6qvaAL7Y3i2fgTpAjJjb7hm8mpJZv4QmMCHKHe9jnKe+WQxABilMwViqdoNrncYNTEAc+WgiQiqOCjsL3d5fjT2iQ1AfIoAkBvLo9w0+CzYje8yA9RIM1SAEbThoR81w14shZ35n0P2BlQH6M+o2TrHJMdje3xWzdRZrvtTQ4luY6/CBo6a5js08BBrP6HZrv1lMFSNLLVlaEYFdkc6DWv1s7vTVsVV6jIxadau6ULXN6VP3GOA3mZIqER70satUrmBnnuGWVsJslkVzp9sWQeZ3bqzNgEA73byVd/ZFOMVoxmtvZyAYQJIfV9Uv/uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwFcst4YdmOpjXouE+DS7TwC839qNMPH0c2dslst9FA=;
 b=nLzBgvZWAguCpYzm9Ovg9/VdDQM+u+quoEt3XwrERF7ZTDQr+/inIEmbfTvpDKBpb9v0tKniriyWFQxuoQnkkd+fTmBpk78FCRBmoSNBheG3hvXHc3Dh42gDOcxc9WU2FAi3tHqB+ylMBEhGQetDAEPi5UBKFT2MmsveKo8ZuK0=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.232.225) by
 VE1PR04MB6448.eurprd04.prod.outlook.com (20.179.233.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Wed, 23 Oct 2019 06:25:20 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::e052:9278:76a3:27c]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::e052:9278:76a3:27c%6]) with mapi id 15.20.2367.025; Wed, 23 Oct 2019
 06:25:20 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Thread-Topic: [PATCH] ASoC: fsl_asrc: refine the setting of internal clock
 divider
Thread-Index: AdWJZk9DEXe2B671Q+yQ9uqxyJIM0A==
Date: Wed, 23 Oct 2019 06:25:20 +0000
Message-ID: <VE1PR04MB647949BE7BDB9CD2B1B2C521E36B0@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 77250e01-f42b-4d61-201f-08d75781c7af
x-ms-traffictypediagnostic: VE1PR04MB6448:
x-microsoft-antispam-prvs: <VE1PR04MB6448E91B048F160B86096405E36B0@VE1PR04MB6448.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(199004)(189003)(64756008)(6436002)(66446008)(478600001)(66066001)(316002)(8936002)(74316002)(2906002)(7416002)(6916009)(5660300002)(4326008)(7696005)(305945005)(71200400001)(476003)(54906003)(186003)(66476007)(8676002)(52536014)(66556008)(33656002)(71190400001)(55016002)(66946007)(76116006)(81156014)(7736002)(81166006)(6506007)(229853002)(486006)(26005)(25786009)(9686003)(3846002)(256004)(14444005)(1411001)(6116002)(99286004)(14454004)(86362001)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6448;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pcJ6o003m1XG1Z9aGX74nywKkFbQc8vcF9oD9AHy6uqfDwb8SmPSnGQDho8EMemP9aMscDgnVj2QF6PcmGzeIJPe2jON5ZiG5C+VS7Revz71rlI6Nn7myVLZ1G1jXP57j4mLAUHvrVtuilSur2RqjZfPC/Magz27or56dUHxo3ejpTbaOaZ1F1vN8fwVoJXqmliVXavhdcIf9VAj7DK9PUL8+3Sh9Hk0xzgsqmHxfI/7GvL+ncraqy2ALI8XL5mDuqfe3D6IxmHusKIVzbh5bTi7efFgAZZdDqRs4bw67nm0P4wZEBSL2pPJxtZcIjTIyfD8K+4z6BnctBLXJcK/HBoVvMA/37UaucUHJ4AIO3dsIThZqoNqwu7twxXWrf3bHkJEIt4NdjfRkyl+amHwg3wlSC21DDLDQ5UikfKfqptpRxgwxNfqf+OqTPtFyj8w
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77250e01-f42b-4d61-201f-08d75781c7af
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 06:25:20.7056 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UDivvz047kj41ZQ+pVdNDfJPGpldpGqHkxopiXrpeTVoFpSNNjemufAqGeskFCIZGjL9IyvvGyZ3z/9x44MKKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6448
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_asrc: refine the setting of
 internal clock divider
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
> On Thu, Oct 17, 2019 at 02:21:08PM +0800, Shengjiu Wang wrote:
> > For P2P output, the output divider should align with the output sample
> 
> I think we should avoid "P2P" (or "M2M") keyword in the mainline code as
> we know M2M will never get merged while somebody working with the
> mainline and caring about new feature might be confused.

Ok. But we still curious that is there a way to upstream m2m?

> 
> > rate, if use ideal sample rate, there will be a lot of overload, which
> > would cause underrun.
> 
> If I understand it correctly, setting to ideal ratio provides a faster converting
> speed but increases the load of the processor of ASRC. So we choose a
> slower converting speed here since real- time playback mode doesn't really
> need a faster conversion?

Yes.  Slower speed is enough for real-time playback

> 
> It makes sense to me, yet I feel that the delay at the beginning of the audio
> playback might be longer as a compromise. I am okay with this decision
> though...
> 
> > The maximum divider of asrc clock is 1024, but there is no judgement
> > for this limitaion in driver, which may cause the divider setting not
> > correct.
> >
> > For non-ideal ratio mode, the clock rate should divide the sample rate
> > with no remainder, and the quotient should be less than 1024.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_asrc.c | 40
> > +++++++++++++++++++++++++++++++---------
> >  1 file changed, 31 insertions(+), 9 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c index
> > 0bf91a6f54b9..44d05ec28bd3 100644
> > --- a/sound/soc/fsl/fsl_asrc.c
> > +++ b/sound/soc/fsl/fsl_asrc.c
> > @@ -260,7 +260,7 @@ static int fsl_asrc_set_ideal_ratio(struct
> fsl_asrc_pair *pair,
> >   * of struct asrc_config which includes in/output sample rate, width,
> channel
> >   * and clock settings.
> >   */
> > -static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
> > +static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool p2p)
> >  {
> >       struct asrc_config *config = pair->config;
> >       struct fsl_asrc *asrc_priv = pair->asrc_priv; @@ -268,7 +268,8
> > @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
> >       enum asrc_word_width input_word_width;
> >       enum asrc_word_width output_word_width;
> >       u32 inrate, outrate, indiv, outdiv;
> > -     u32 clk_index[2], div[2];
> > +     u32 clk_index[2], div[2], rem[2];
> > +     u64 clk_rate;
> >       int in, out, channels;
> >       int pre_proc, post_proc;
> >       struct clk *clk;
> > @@ -351,7 +352,9 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair
> *pair)
> >       /* We only have output clock for ideal ratio mode */
> >       clk = asrc_priv->asrck_clk[clk_index[ideal ? OUT : IN]];
> >
> > -     div[IN] = clk_get_rate(clk) / inrate;
> > +     clk_rate = clk_get_rate(clk);
> 
> The fsl_asrc.c file has config.inclk being set to INCLK_NONE and this sets the
> "ideal" in this function to true. So, although we tend to not use ideal ratio
> setting for p2p cases, yet the input clock is still not physically connected, so
> we still use output clock for div[IN] calculation?

For p2p case, it can be ideal or non-ideal.  For non-ideal, we still use
Output clock for div calculation.

> 
> I am thinking something simplier: if we decided not to use ideal ratio for
> "P2P", instead of adding "bool p2p" with the confusing "ideal" in this
> function, could we just set config.inclk to the same clock as the output one
> for "P2P"? By doing so, "P2P" won't go through ideal ratio mode while still
> having a clock rate from the output clock for div[IN] calculation here.

Bool p2p is to force output rate to be sample rate, no impact to ideal
Ratio mode.

> 
> > +     rem[IN] = do_div(clk_rate, inrate);
> > +     div[IN] = (u32)clk_rate;
> >       if (div[IN] == 0) {
> 
> Could we check div[IN] and rem[IN] here? Like:
>         if (div[IN] == 0 || div[IN] > 1024) {
>                 pair_err();
>                 goto out;
>         }
> 
>         if (!ideal && rem[IN]) {
>                 pair_err();
>                 goto out;
>         }
> 
> According to your commit log, I think the max-1024 limitation should be
> applied to all cases, not confined to "!ideal" cases right? And we should
> add some comments also, indicating it is limited by hardware.

For ideal mode,  my test result is  the divider not impact the output result.
Which means it is ok for ideal mode even divider is not correct... 

> 
> >               pair_err("failed to support input sample rate %dHz by
> asrck_%x\n",
> >                               inrate, clk_index[ideal ? OUT : IN]); @@
> > -360,11 +363,20 @@ static int fsl_asrc_config_pair(struct
> > fsl_asrc_pair *pair)
> >
> >       clk = asrc_priv->asrck_clk[clk_index[OUT]];
> >
> > -     /* Use fixed output rate for Ideal Ratio mode (INCLK_NONE) */
> > -     if (ideal)
> > -             div[OUT] = clk_get_rate(clk) / IDEAL_RATIO_RATE;
> > -     else
> > -             div[OUT] = clk_get_rate(clk) / outrate;
> > +     /*
> > +      * When P2P mode, output rate should align with the out samplerate.
> > +      * if set too high output rate, there will be lots of Overload.
> > +      * When M2M mode, output rate should also need to align with the
> > + out
> 
> For this "should", do you actually mean "M2M could also"? Sorry, I'm just
> trying to understand everyting here, not intentionally being picky at words.
> My understanding is that we still keep the ideal ratio setting because
> "M2M" still uses it.

We use IDEAL_RATIO_RATE as output rate for m2m mode, it likes a
Tricky operation, in order to improve the performance. I think
The correct operation is to use the real output rate, but the performance
Is bad.  So it is a compromise.

> 
> > +      * samplerate, but M2M must use less time to achieve good
> performance.
> > +      */
> > +     clk_rate = clk_get_rate(clk);
> > +     if (p2p || !ideal) {
> > +             rem[OUT] = do_div(clk_rate, outrate);
> > +             div[OUT] = clk_rate;
> > +     } else {
> > +             rem[OUT] = do_div(clk_rate, IDEAL_RATIO_RATE);
> > +             div[OUT] = clk_rate;
> > +     }
> >
> >       if (div[OUT] == 0) {
> >               pair_err("failed to support output sample rate %dHz by
> > asrck_%x\n", @@ -372,6 +384,16 @@ static int fsl_asrc_config_pair(struct
> fsl_asrc_pair *pair)
> >               return -EINVAL;
> >       }
> >
> > +     if (!ideal && (div[IN] > 1024 || div[OUT] > 1024 ||
> > +                    rem[IN] != 0 || rem[OUT] != 0)) {
> > +     if (!ideal && (div[IN] > 1024 || div[OUT] > 1024 || rem[IN] ||
> > + rem[OUT] != 0)) {
> 
> So for ideal == true, these limitaions are not applied any more?
> Remember that the "ideal" is true for "p2p == true" cases here.

No, not applied.  for ideal, the div don't impact the output result
Even it is not accurate.

> 
> > +             pair_err("The divider can't be used for non ideal mode\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     /* Divider range is [1, 1024] */
> > +     div[IN] = min_t(u32, 1024, div[IN]);
> > +     div[OUT] = min_t(u32, 1024, div[OUT]);
> 
> Hmm, this looks like we want to allow ideal ratio cases and p2p cases to
> operate any way, even if the divider wasn't within the range to get the
> in/out rates from the output clock?

Yes. We still allow the p2p = true,  ideal = false.  Note that p2p is not
Equal to ideal.


Best regards
Wang shengjiu

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
