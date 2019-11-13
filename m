Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E51AFAFAE
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2019 12:27:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEBDB1668;
	Wed, 13 Nov 2019 12:26:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEBDB1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573644449;
	bh=LsbspMxkKCSRYuhQjax8IUHeg7jMgJvkL37MtDkDhwc=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E+Iep5BBqVFaKH+kK3yC4LzgnUsWVuqI2/QsqyHj5zPJ+fMvSze/5ahXjhkGqaZAM
	 KpWvuOo/l0lehHGdFUxsmtpsh//DuUZ2yF2g1u0tlMAADBoMoRyNGSumMVxeTHVvKW
	 ucdjBk6aKEIN1Ms/tG4SyZbxrZ6VGX3zgTW4GK14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88C05F8007E;
	Wed, 13 Nov 2019 12:25:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69EFDF8007E; Wed, 13 Nov 2019 12:25:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34979F80038
 for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2019 12:25:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34979F80038
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="zr6gHphn"
Received: from [46.226.52.104] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 36/47-19209-F28EBCD5;
 Wed, 13 Nov 2019 11:25:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSfUwTZxzHee6ux6F0O1sIjwSWrLqZIS3U19s
 SE2SGNEGQvSXKxrZDTtrZlqYt0G7LwipzpbyMBEQFyosUUNxEeYlaV6bdnFg6F8QNM+1ALaBV
 NkXZnLi6ux647a/n8/t9v3l+3+fJj0BFN/BYgjEZGb2WVkvwRZgyCaekSTeHcpKrLPHUpWE3Q
 u255sep3gsVAuqPS1aEGnE24lSZ8wsB5budSR398yuQQiiO3rfgihM+B1CcrPeFK3q6ynDFwH
 QHruju+wlT3O95Lis8W6DS5haY3hcoXd5jmK5iuenvYRcoAZVxNhBBALIdhbVnUBtYxPL3GCw
 96AB80QvgXOVfOFdg5CAKd+/rFnCFiKxDYHl7J8oX1wB8fLcG5y7DSQrWDI6HOIpUQ2djG8KZ
 UPI3BM65K0OCmHwVBr4MILxpE7Re/xHlORWem/CFc4yRL8Ca4JWQX0jS8PHVBsBP241AR7cHc
 EIEuQFax0ZR/hnx8MGnh0OMkjHwF39zaAAkSej4mh8AyWh460ZQwPsZeN5yGfD9RPjDqH+eJb
 DJ/t08x8OLzeUsEyxnwDb7Swt27+RBnGcKOso/w3jLchh0m/m2Dh5pcM0nWAFL7zUJeI6Dl51
 DGPcUSAYE0NF1BK8GSfX/Sc1zImw5NYPzvBJ2tN5G60NfsQSe3+/HWgDWBahcvSpfadTQKrVU
 npwslctXSeUvr2HPtTL6QyktYwqlxYzBKJXL6GKDzGDWbFfnybSMsQew+5ancxtOgDuz0zI3W
 Eogkmjh8V1DOaJncgvyzEraoHxPX6hmDG4QRxASKOyZZLUleiafMe1QqdmtXZAhESmJEqZMsL
 LQoKM1BlU+L3mAlKi+ZT+AijBtgZaJjRGmTLEmkjMpC7VPr1jY/YsgPlYsBGFhYaJIHaPXqIz
 /1wMghgASsdDLJYlUaY1PJwXYEAgbovRbDxfCSP8rxZYgVY66dOvVlhJzettmxa+HL4Rv/abg
 nTc7r3vSpUWbk2df3zsVdL9STqdu6T+7YXoge71spC/K2TRp68+sKh1fOmdaHLZntXnnGr+j+
 oNG5aNh8XF7d0XTRFpaRPnN4hxqLVqdkffus8uy/Q82jbQEXb9vfLg3YdBi1czc3eodHXTUis
 0I8nbw4aGyfQPri85ljKduy/po9ZlW3+JPshIisEf36lft6B/riO78GKvTjM141Nhbu/qKXNt
 ssrPexHXbl50uCWbaMjYG53aejGxcqQg8n+NRt9J3noyAbA3We6wTvDG7f+LAlReJdvlrFpvk
 iWvFodrPm0/NTJ1uWNdl/3lUnibBDEpanoDqDfQ/oDHhBnYEAAA=
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-33.tower-268.messagelabs.com!1573644334!427359!1
X-Originating-IP: [104.47.6.56]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27214 invoked from network); 13 Nov 2019 11:25:35 -0000
Received: from mail-ve1eur02lp2056.outbound.protection.outlook.com (HELO
 EUR02-VE1-obe.outbound.protection.outlook.com) (104.47.6.56)
 by server-33.tower-268.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Nov 2019 11:25:35 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fx2e0g7QbM5qRqPyBSZtvaXyI1hiFzR26BaQXwQB8Xmyv2uqw3nh+3tVgKJszoMIs5H2XPcvnhkb55Hc8jvqcDWqOuvzUng4Kv3waapsxTntieiyp2Jfp1u5xAx2noOd6Nwy6eOo8Y3mCjfyJAjoyfVpzTN+7ScwVmGqxQ0lV5qXJVzLoyLi+qs91tZBG2Katl6F0u/UrCa9C5Qgvyi9z5ycsZO57HwFF2G10OLGW28ToM9qIkMgQvEfgCUr5r7kjtIK/wyUyBWkYLqY5/7IrPLxh57/NXzq0xQdHMSZNQ6yljokp51k2oOmTRQ/cEE9zkqSRaY0MQMgnRjci+ioWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKOcNEbaXD3HMcJXO5m26AHDs3wpR0G9lkEVkUUujlU=;
 b=BGgNYmk/BuGN1VhbrO2EeB/1mVq1IU4VMfD2wJJYm4fObPTDxVUWZoq7eDrQMDoEHJN4SRMmHfjD4bb+MZLVH1n9QnS345SBOb4pxPIL7AAwjvXRI6MwqvzLHQHGYDtE8lcZQRa1JuIy/ERvQtUYx2aaDU8A4UMB1nNrg2uV7u4cMj8EJRw6YGs/ajMizxKmDYCNs04B+ULYRmslud2K7rMn7PVvywd+WRG/yJMkPgqUeU1r2R4Us4j2aIngu3fwjl57pxq6cNRoxRUzz70aaKit62tTlF93dXbi1NTJ7xAeFwWIbpe0ggVahFbHWxKal3eQ4G0Rv+EOrkRaQLSuDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKOcNEbaXD3HMcJXO5m26AHDs3wpR0G9lkEVkUUujlU=;
 b=zr6gHphnrKIQsuAaHR5LKIwaKg830/+O+AbPSoznkR14jzqQSj2ew7AXVHpV4cj+ipVkgYREQALhwlBebLLQ8xHsgMTkR5wT+ykR8VtVdtx7Ht3UWvVqIbrHEHXMu7wO6Qag0AxgSmLNmXyKOMKuRB/kYRrX+rXKG+MrlGNRvs8=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1186.EURPRD10.PROD.OUTLOOK.COM (10.169.155.142) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Wed, 13 Nov 2019 11:25:34 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2430.028; Wed, 13 Nov 2019
 11:25:33 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>
Thread-Topic: [PATCHv1 5/5] ASoC: da7213: add default clock handling
Thread-Index: AQHVllzQw2CNfaAmcE6K1Kk6A2rmoqeGBqQQgAG5dgCAAT0i8A==
Date: Wed, 13 Nov 2019 11:25:33 +0000
Message-ID: <AM5PR1001MB0994D91E64529B8B3C13977F80760@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191108174843.11227-1-sebastian.reichel@collabora.com>
 <20191108174843.11227-6-sebastian.reichel@collabora.com>
 <AM5PR1001MB099473C446536341366A70A680740@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191112162954.aac77rtfbl6mlut6@earth.universe>
In-Reply-To: <20191112162954.aac77rtfbl6mlut6@earth.universe>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96376ae9-178e-4197-e27f-08d7682c32f7
x-ms-traffictypediagnostic: AM5PR1001MB1186:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB11866466958DD31C19C1F777A7760@AM5PR1001MB1186.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0220D4B98D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(376002)(346002)(396003)(136003)(199004)(189003)(64756008)(33656002)(5660300002)(71200400001)(316002)(52536014)(7696005)(76176011)(76116006)(71190400001)(14454004)(66066001)(66946007)(66476007)(66556008)(66446008)(9686003)(55016002)(6436002)(6246003)(4326008)(11346002)(446003)(110136005)(486006)(256004)(54906003)(99286004)(2906002)(26005)(229853002)(476003)(14444005)(3846002)(186003)(81156014)(81166006)(6116002)(8676002)(55236004)(102836004)(74316002)(305945005)(7736002)(8936002)(53546011)(6506007)(478600001)(86362001)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR1001MB1186;
 H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x12WLCD2cDI0BPsk6Dp6ZB4M27tUkAAwrPb1bU84SR4u9omrsepADYvxxww1PtY7EJBwRE3mHpj+oxj6+clCrk+0yr0lwPMl9jGFve3V4EpTecBhT2771tXLnn+96mUXXx6YrWQ5hsqWCDCzzxX8oGt8slAiQQITbrRA7rgASfb0G/Pm9Fl3lUX37bYrpGPN20PsB8E0S0DEL5MOJvn9xkJ15HrIXMr2Rbc4SbIJdLeQORQInkirJ1+1JItbkNSZ3so/GsVwOoBCp2N6xeFD0deoNUa1zHm+JxNFUIfdA0VTr7hQOFV1/1bkicTToyVXurnBtISKkvzgUinqDOAWFLBaEv/SVj6uTc9l9mvdg2NKIMW9YdofyHIR5I8Ex2Aycl0CkOKQaZtsvONPnyzLoumuIKJD12/o6ZF5hee1GVoVnC8YmLulrFx0C8sIw+V1
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96376ae9-178e-4197-e27f-08d7682c32f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2019 11:25:33.8310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C36pIXaVmXKtMNHPKccuq4pzqQhnrordrqqBNCthWAgLkuiNVRE4bchAb5CmSruW0d+E2tc7kmNobzVVejSPEM7HiMhk5RI/5mzrs947uwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1186
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Support Opensource <Support.Opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [alsa-devel] [PATCHv1 5/5] ASoC: da7213: add default clock
	handling
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

On 12 November 2019 16:30, Sebastian Reichel wrote:

> > > @@ -1188,38 +1190,54 @@ static int da7213_hw_params(struct
> > > snd_pcm_substream *substream,
> > >  	switch (params_rate(params)) {
> > >  	case 8000:
> > >  		fs = DA7213_SR_8000;
> > > +		freq = DA7213_PLL_FREQ_OUT_98304000;
> > >  		break;
> > >  	case 11025:
> > >  		fs = DA7213_SR_11025;
> > > +		freq = DA7213_PLL_FREQ_OUT_90316800;
> > >  		break;
> > >  	case 12000:
> > >  		fs = DA7213_SR_12000;
> > > +		freq = DA7213_PLL_FREQ_OUT_98304000;
> > >  		break;
> > >  	case 16000:
> > >  		fs = DA7213_SR_16000;
> > > +		freq = DA7213_PLL_FREQ_OUT_98304000;
> > >  		break;
> > >  	case 22050:
> > >  		fs = DA7213_SR_22050;
> > > +		freq = DA7213_PLL_FREQ_OUT_90316800;
> > >  		break;
> > >  	case 32000:
> > >  		fs = DA7213_SR_32000;
> > > +		freq = DA7213_PLL_FREQ_OUT_98304000;
> > >  		break;
> > >  	case 44100:
> > >  		fs = DA7213_SR_44100;
> > > +		freq = DA7213_PLL_FREQ_OUT_90316800;
> > >  		break;
> > >  	case 48000:
> > >  		fs = DA7213_SR_48000;
> > > +		freq = DA7213_PLL_FREQ_OUT_98304000;
> > >  		break;
> > >  	case 88200:
> > >  		fs = DA7213_SR_88200;
> > > +		freq = DA7213_PLL_FREQ_OUT_90316800;
> > >  		break;
> > >  	case 96000:
> > >  		fs = DA7213_SR_96000;
> > > +		freq = DA7213_PLL_FREQ_OUT_98304000;
> > >  		break;
> > >  	default:
> > >  		return -EINVAL;
> > >  	}
> > >
> > > +	/* setup PLL */
> > > +	if (da7213->fixed_clk_auto) {
> > > +		snd_soc_component_set_pll(component, 0,
> > > DA7213_SYSCLK_PLL,
> > > +					  da7213->mclk_rate, freq);
> > > +	}
> > > +
> >
> > Are we happy with the PLL being always enabled? Seems like a power drain,
> > especially if you're using an MCLK which is a natural harmonic for the SR in
> > question in which case the PLL can be bypassed. Also the bias level function in
> > this driver will enable and disable the MCLK, if it has been provided, so it's a
> > bit strange to have the PLL enabled but it's clock source taken away.
> 
> So you are suggesting adding something like this to
> da7213_set_bias_level()?
> 
> if (freq % da7213->mclk_rate == 0)
>     source = DA7213_SYSCLK_MCLK
> else
>     source = DA7213_SYSCLK_PLL
> snd_soc_component_set_pll(component, 0, source, da7213->mclk_rate, freq);

Yes it would make more sense to control the PLL there as for MCLK. Also for the
transition back to SND_SOC_BIAS_STANDBY you would want to configure the PLL as
DA7213_SYSCLK_MCLK so it's in bypass mode (i.e. disabled).

Selecting bypass mode for natural harmonic MCLK frequencies (11.2896/12.288,
22.5792/24.576 and 45.1584/49.152 as stated in the datasheet) would be ideal. I
think the check you suggest above though might not be enough as it will pick out
valid MCLK rates of 5.6448/6.144 as allowing PLL bypass but the datasheet
doesn't state those as valid options for bypass.

> > > @@ -1836,6 +1854,20 @@ static int da7213_probe(struct
> snd_soc_component
> > > *component)
> > >  			return PTR_ERR(da7213->mclk);
> > >  		else
> > >  			da7213->mclk = NULL;
> > > +	} else {
> > > +		/* Store clock rate for fixed clocks for automatic PLL setup */
> > > +		ret = clk_prepare_enable(da7213->mclk);
> > > +		if (ret) {
> > > +			dev_err(component->dev, "Failed to enable mclk\n");
> > > +			return ret;
> > > +		}
> >
> > I've not gone through the clk framework code but surprised to see the need to
> > enable a clock to retrieve it's rate.
> 
> /**
>  * clk_get_rate - obtain the current clock rate (in Hz) for a clock source.
>  *                This is only valid once the clock source has been enabled.
>  * @clk: clock source
>  */
> unsigned long clk_get_rate(struct clk *clk);
> 
> Which makes sense for a non-fixed clock, which uses the same API.

Hmmm. Fair enough. Just seems odd to me that you would need to enable a clock
to retrieve it's configured rate. Surely it would have been configured prior to
enabling. Reading into that code, the clk rate value is always taken from cache
so until it's enabled then the cache isn't updated. Actually with the suggestion
to move PLL control to the bias_level() function, you could just get the clk
rate there instead.

> 
> > > +		da7213->mclk_rate = clk_get_rate(da7213->mclk);
> > > +
> > > +		clk_disable_unprepare(da7213->mclk);
> > > +
> > > +		/* assume fixed clock until set_sysclk() is being called */
> > > +		da7213->fixed_clk_auto = true;
> >
> > I don't see any code where 'fixed_clk_auto' is set to false so it seems that
> > previous operational usage is being broken here.
> 
> oops.

:)
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
