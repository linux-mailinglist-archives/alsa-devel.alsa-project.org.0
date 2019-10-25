Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6EFE42EF
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 07:35:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEEC6174A;
	Fri, 25 Oct 2019 07:34:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEEC6174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571981712;
	bh=BQfY1wGLG4c3FNmvfBxFKyPGbMz6fZwjwdBeQnZg8x0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g6IcLPYW1C7ZMGa5FqVTXszkJR5ZftNrRtEgCmIKwTUS/cPuWyZJVsQtKUDmY1Xn4
	 LiQqmj3O3EtrljhMFpOTswC+9UktqF/2il0xj0/ZTkCScN2uQ2cmB5Vtjk3Q8tpEww
	 /Gqifw1D8NqSD1+4VXhxLBWAnlDpTrlrRyg4GYZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1832BF80368;
	Fri, 25 Oct 2019 07:33:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B404F8036F; Fri, 25 Oct 2019 07:33:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,PRX_BODY_30,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40060.outbound.protection.outlook.com [40.107.4.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C410F802A0
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 07:33:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C410F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="iKPguvyG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bANNtyattuCfVFk8oXdarzoigiZc3BRwRMZxF9JyJWRW4nf3reDAtpW+wDj3+jIShsIaEfxBqo6ahkpvyKz+22NjHLa2cMNKoRmf9Ds+MPtLfewbA4ncz8c14k+Ot8ohkfeigy0p0aCgctfhlp9XPgJhXwpOlV0aX6sK9FQo3F1wPsOmnIZhhxh6eYbIYL3Tno6qZye3MzRQXzlSMHnljchXw6ul3zSa+mjVEfSLpAdwXgWdGzadgFCyZvszNOaKIcTtRJabyr0pvdxJJEwkVAWZoyuE9YPAPZDw/0uBODx6VY3wbHgccyKjUF79h4c6LjriOcwdlQJWy5XGoaxUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUBVgelz4AwMtHaj0VsEAB8Tt+bc2KN8Yn6Wk5H4+0E=;
 b=lBSkSWZOHuHB9vuaNPZJpqUVMvcZ3clqy97u4hUjd8CTjESUwWh3q1agYNlJDJhkEJTP4A8L8JfZMt7G8CmE1ZzW1YqQ0OiRxe6a0hDrTjhgAMVu7ELI2JGxFnrz6pAifH0pfjPE8X9wTDSFGqv5QwKDdnsAJ0gUIL5DDp/OR0Jf1warSCsiYiY0aoSeVXJoAFcfqirnUrQn/HhFL1pNTBt9NKdsmVWPqWwHl9eI8JiOnIlbUTV1qXLySw4rwCApr6mUDOxCGU/Gl7ffTqinSFbWnmZpM4znovk7gFftWiEGNWcCYoNBLs/ApZlvz69gv2gfCWS41Q5MlkzgR3cXAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUBVgelz4AwMtHaj0VsEAB8Tt+bc2KN8Yn6Wk5H4+0E=;
 b=iKPguvyGDRzn9PVZdJ33N96QnJCEWy8BsaAqqdPgxbqWSKOU+tlznkCg3GO+n1WpZinPVY3k4BaKoOVWpdKPoiskhN/pUrTcKSqMUAfBlXjxxxoIc7fPzPqJyYX+VElLWtjEh8pubG+OfcVA6EbG+yZ2D+JYHYaR1jx1SrNmawU=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.232.225) by
 VE1PR04MB6621.eurprd04.prod.outlook.com (20.179.234.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 25 Oct 2019 05:33:17 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::e052:9278:76a3:27c]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::e052:9278:76a3:27c%6]) with mapi id 15.20.2387.025; Fri, 25 Oct 2019
 05:33:17 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Thread-Topic: [PATCH] ASoC: fsl_asrc: refine the setting of internal clock
 divider
Thread-Index: AdWK9JxJMGzwqHsSSM+MgjXQwBho3Q==
Date: Fri, 25 Oct 2019 05:33:17 +0000
Message-ID: <VE1PR04MB6479AC63FFE5D57B4E2C33D2E3650@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1c541a0d-ca89-4f03-6280-08d7590cd70d
x-ms-traffictypediagnostic: VE1PR04MB6621:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VE1PR04MB66217ACEB8DBD0A20901DA64E3650@VE1PR04MB6621.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(366004)(39860400002)(189003)(199004)(102836004)(52536014)(76116006)(66066001)(7736002)(6506007)(6436002)(305945005)(26005)(55016002)(25786009)(2906002)(7416002)(186003)(8936002)(9686003)(6306002)(3846002)(7696005)(8676002)(1411001)(66476007)(486006)(256004)(14454004)(6116002)(5660300002)(66556008)(64756008)(66946007)(74316002)(14444005)(229853002)(81156014)(6916009)(81166006)(33656002)(478600001)(966005)(45080400002)(71190400001)(54906003)(71200400001)(4326008)(86362001)(6246003)(316002)(99286004)(476003)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6621;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pOo3QArFOPUBQPwjY1TM9LIelmVU956hvJyjyG9XDwa1e+XjiE5RPrrBYnI0oFDBRO6KeF2WZZxsDDd2wkvfBTn2g3WeD9RNQta2hGCcb2rJ+dhApv7gb9Bi5Oxw25sSCvW/yot2Jiml6njfXiIYiHfnP39EdmaLahvVueuRy9A2Xa5o9yGdebLpoNzCB3XzM/plm9WMZVKiHJfpTtWm36v7fk//Rr3P9Z5ikBABnAETYy3fNzbj3NcWBk/4sQKGA4quxcVfy0aulY80Hrhv4hRO6VvcHgqRgAgyIBQA90pQkWqjUcKiPmcqQ8MEGX0oMbwhtjAU2q074cuGGa4owDKZ3M4CwOjxcGyqRxNw2IvnM0R+JdhU++FcCl5nf2WST5qdeRwZQrnZGWqdEgG6zg7PhBTH/OLNW8P00VetcF+Cwe1gudQJWZXBm5hKjm83
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c541a0d-ca89-4f03-6280-08d7590cd70d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 05:33:17.6613 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Bdj5SPVsEECrGMBWqbAdN6DQBb92uZ8Ku9JkmNDSbX38qV15glplFKw/vFHpBTJiaIfOClu2aJnxoGzzNT11Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6621
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
> On Wed, Oct 23, 2019 at 06:25:20AM +0000, S.j. Wang wrote:
> > > On Thu, Oct 17, 2019 at 02:21:08PM +0800, Shengjiu Wang wrote:
> > > > For P2P output, the output divider should align with the output
> > > > sample
> > >
> > > I think we should avoid "P2P" (or "M2M") keyword in the mainline
> > > code as we know M2M will never get merged while somebody working
> > > with the mainline and caring about new feature might be confused.
> >
> > Ok. But we still curious that is there a way to upstream m2m?
> 
> Hmm..I would love to see that happening. Here is an old discussion that
> you may want to take a look:
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fmail
> man.alsa-project.org%2Fpipermail%2Falsa-devel%2F2014-
> May%2F076797.html&amp;data=02%7C01%7Cshengjiu.wang%40nxp.com%7
> Ce902d2bac4254d2faa0f08d757ecac0e%7C686ea1d3bc2b4c6fa92cd99c5c301
> 635%7C0%7C0%7C637074546320396681&amp;sdata=bg%2BLwRQnUPhW8f
> mE972O%2F53MyVftJkK140PSnmC%2FDKQ%3D&amp;reserved=0
> 
> > > It makes sense to me, yet I feel that the delay at the beginning of
> > > the audio playback might be longer as a compromise. I am okay with
> > > this decision though...
> > >
> > > > The maximum divider of asrc clock is 1024, but there is no
> > > > judgement for this limitaion in driver, which may cause the
> > > > divider setting not correct.
> > > >
> > > > For non-ideal ratio mode, the clock rate should divide the sample
> > > > rate with no remainder, and the quotient should be less than 1024.
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> > > > @@ -351,7 +352,9 @@ static int fsl_asrc_config_pair(struct
> > > > fsl_asrc_pair
> > > *pair)
> > > >       /* We only have output clock for ideal ratio mode */
> > > >       clk = asrc_priv->asrck_clk[clk_index[ideal ? OUT : IN]];
> > > >
> > > > -     div[IN] = clk_get_rate(clk) / inrate;
> > > > +     clk_rate = clk_get_rate(clk);
> > >
> > > The fsl_asrc.c file has config.inclk being set to INCLK_NONE and
> > > this sets the "ideal" in this function to true. So, although we tend
> > > to not use ideal ratio setting for p2p cases, yet the input clock is
> > > still not physically connected, so we still use output clock for div[IN]
> calculation?
> >
> > For p2p case, it can be ideal or non-ideal.  For non-ideal, we still
> > use Output clock for div calculation.
> >
> > >
> > > I am thinking something simplier: if we decided not to use ideal
> > > ratio for "P2P", instead of adding "bool p2p" with the confusing
> > > "ideal" in this function, could we just set config.inclk to the same
> > > clock as the output one for "P2P"? By doing so, "P2P" won't go
> > > through ideal ratio mode while still having a clock rate from the output
> clock for div[IN] calculation here.
> >
> > Bool p2p is to force output rate to be sample rate, no impact to ideal
> > Ratio mode.
> 
> I just realized that the function has a bottom part for ideal mode
> exclusively -- if we treat p2p as !ideal, those configurations will be missing.
> So you're right, should have an extra boolean variable.
> 
> > >
> > > > +     rem[IN] = do_div(clk_rate, inrate);
> > > > +     div[IN] = (u32)clk_rate;
> > > >       if (div[IN] == 0) {
> > >
> > > Could we check div[IN] and rem[IN] here? Like:
> > >         if (div[IN] == 0 || div[IN] > 1024) {
> > >                 pair_err();
> > >                 goto out;
> > >         }
> > >
> > >         if (!ideal && rem[IN]) {
> > >                 pair_err();
> > >                 goto out;
> > >         }
> > >
> > > According to your commit log, I think the max-1024 limitation should
> > > be applied to all cases, not confined to "!ideal" cases right? And
> > > we should add some comments also, indicating it is limited by hardware.
> >
> > For ideal mode,  my test result is  the divider not impact the output result.
> > Which means it is ok for ideal mode even divider is not correct...
> 
> OK.
> 
> > >
> > > >               pair_err("failed to support input sample rate %dHz
> > > > by
> > > asrck_%x\n",
> > > >                               inrate, clk_index[ideal ? OUT :
> > > > IN]); @@
> > > > -360,11 +363,20 @@ static int fsl_asrc_config_pair(struct
> > > > fsl_asrc_pair *pair)
> > > >
> > > >       clk = asrc_priv->asrck_clk[clk_index[OUT]];
> > > >
> > > > -     /* Use fixed output rate for Ideal Ratio mode (INCLK_NONE) */
> > > > -     if (ideal)
> > > > -             div[OUT] = clk_get_rate(clk) / IDEAL_RATIO_RATE;
> > > > -     else
> > > > -             div[OUT] = clk_get_rate(clk) / outrate;
> > > > +     /*
> > > > +      * When P2P mode, output rate should align with the out
> samplerate.
> > > > +      * if set too high output rate, there will be lots of Overload.
> > > > +      * When M2M mode, output rate should also need to align with
> > > > + the out
> > >
> > > For this "should", do you actually mean "M2M could also"? Sorry, I'm
> > > just trying to understand everyting here, not intentionally being picky at
> words.
> > > My understanding is that we still keep the ideal ratio setting
> > > because "M2M" still uses it.
> >
> > We use IDEAL_RATIO_RATE as output rate for m2m mode, it likes a Tricky
> > operation, in order to improve the performance. I think The correct
> > operation is to use the real output rate, but the performance Is bad.
> > So it is a compromise.
> 
> I see.
> 
> > >
> > > > +      * samplerate, but M2M must use less time to achieve good
> > > performance.
> > > > +      */
> > > > +     clk_rate = clk_get_rate(clk);
> > > > +     if (p2p || !ideal) {
> > > > +             rem[OUT] = do_div(clk_rate, outrate);
> > > > +             div[OUT] = clk_rate;
> > > > +     } else {
> > > > +             rem[OUT] = do_div(clk_rate, IDEAL_RATIO_RATE);
> > > > +             div[OUT] = clk_rate;
> > > > +     }
> > > >
> > > >       if (div[OUT] == 0) {
> > > >               pair_err("failed to support output sample rate %dHz
> > > > by asrck_%x\n", @@ -372,6 +384,16 @@ static int
> > > > fsl_asrc_config_pair(struct
> > > fsl_asrc_pair *pair)
> > > >               return -EINVAL;
> > > >       }
> > > >
> > > > +     if (!ideal && (div[IN] > 1024 || div[OUT] > 1024 ||
> > > > +                    rem[IN] != 0 || rem[OUT] != 0)) {
> > > > +     if (!ideal && (div[IN] > 1024 || div[OUT] > 1024 || rem[IN]
> > > > + || rem[OUT] != 0)) {
> > >
> > > So for ideal == true, these limitaions are not applied any more?
> > > Remember that the "ideal" is true for "p2p == true" cases here.
> >
> > No, not applied.  for ideal, the div don't impact the output result
> > Even it is not accurate.
> 
> I see.
> 
> > >
> > > > +             pair_err("The divider can't be used for non ideal mode\n");
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > > > +     /* Divider range is [1, 1024] */
> > > > +     div[IN] = min_t(u32, 1024, div[IN]);
> > > > +     div[OUT] = min_t(u32, 1024, div[OUT]);
> > >
> > > Hmm, this looks like we want to allow ideal ratio cases and p2p
> > > cases to operate any way, even if the divider wasn't within the
> > > range to get the in/out rates from the output clock?
> >
> > Yes. We still allow the p2p = true,  ideal = false.  Note that p2p is
> > not Equal to ideal.
> 
> Got it.
> 
> Overall, I feel it's better to have a naming to state the purpose of using
> ideal configurations without the IDEAL_RATIO_RATE setup.
>         bool use_ideal_rate;
> And we can put into the asrc_config structure if there's no major problem.
> 

Asrc_config may exposed to user, I don't think user need to care about
The using of ideal rate or not. 

> So the condition check for the calculation would be:
> +       if (ideal && config->use_ideal_rate)
> +               rem[OUT] = do_div(clk_rate, IDEAL_RATIO_RATE);
> +       else
> +               rem[OUT] = do_div(clk_rate, outrate);
> +       div[OUT] = clk_rate;
> 
> And for that if (!ideal && div[IN]....rem[OUT]), I feel it would be clear to
> have them separately, as the existing "div[IN] == 0"
> and "div[OUT] == 0" checks, so that we can tell users which side of the
> divider is out of range and what the sample rate and clock rate are.
> 
Do you mean need to combine this judgement with "div[IN] == 0"
Or "div[OUT] == 0"?

Best regards
Wang shengjiu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
