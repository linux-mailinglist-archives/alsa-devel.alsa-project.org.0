Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2349710A2ED
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2019 18:04:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A09731763;
	Tue, 26 Nov 2019 18:03:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A09731763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574787843;
	bh=lfNxXYkIl/q/SGXYADh0MqsSAVZLEg47xrfZF7lix58=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NlSy68PhEFkTQGfmuX6oyh0EzKNmtFZE6cpC5QaFgshsqpszPCSvoFLYu1mk0r8H1
	 EHAddWxQ+IH+yBOwDXbs8KVIU2HBD8bAR9Vl7ZiOcsb15tHBb10LqSK7TGmIYn/ris
	 lnC8v0Dlr1c4cwAwyp6S12w1Bp05aKvAmG/3FutM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42D53F80149;
	Tue, 26 Nov 2019 18:02:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9385F80159; Tue, 26 Nov 2019 18:02:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C427F800DD
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 18:02:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C427F800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="eHLLCcN2"
Received: from [85.158.142.108] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 23/5F-19913-69A5DDD5;
 Tue, 26 Nov 2019 17:02:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSbUxTZxTHee69vb0gF68Fx1kn+9BBMnGtsLn
 sYgYaNpc63yOJk0HGRS600pbSlwDL1jCQMGAFHEOBgYJWsmHG614AmRuVIAqIAkaD6dTJEqlR
 pxZ1MnS3veC2L09+5/z/zzknJ4fCZb+TcorPtfAmA6dTkAGEZjX2prI60ZUcNdWwlp284MTY6
 uvTJNt17gsJ+3Dyc4yd6K0n2ZLeCgnrurWVbX/0HVpPqdsfFJDqbpcDqXvqXFJ1Z0sJqT55u5
 lUt31/kVA/6Hx5uzRRojWkZuWmSDROx13c2Lchdzb/tDQftb5VigIoxBzDYfTXeVwMBgkouDS
 KxKALwZz9L7IU+VMEM4RD/my2V5AxBzCoszswMbiOoLv8HPK6SIaFqqFrvh8hjA5664/6TDhz
 B4M5p90nBDNx4Cn8BYmmdVBy765U5HhwXz1BiO0ioNgxIPEyzXBQc7DD91fG7MOgvTXIy/5ML
 HjOTvjyiAkDz2fHcS/jTChMTR/GvAwMA46+MVzk5TBz46lE9PNwpuAyEvOvweil6QVWwKGGgQ
 UOg/HDZQu8Ba70H5Iu+hsn3ITILDjKigSmBA6Hp848EY1wr4MXMQIuTgaK5hXg7h/zbQSYKQn
 8WFIlqUSr6/4ztMhCgxP3SZFXQXPTLbzOt4hlcKZ2mmhERAuKSTVpMzQWPafVKaOjopTR0W8o
 hTeGVXEfKzkVb1Xu4Q0WEyeoKi7HrDLn6ffo0lQG3tKJhHNLy/Yb7EZl92+rnOhFClMsp3dIX
 cmyoNSstDwNZ9Z8ZLLqeLMTraAoBdDyDwRtmYnP4HPTtTrhaBdloAIVIbRqtyDTZiOnN2szRO
 ksUlKVMw1HcBlhyDLw8lDa7q3BeE0aq+F5icXTH0dh8mAa+fn5yQKNvEmvtfxfd6NQCimCaYm
 3VaDWYHneyS0MgQlDYLVT3iEs3L+SPB/LKb2y89mALTEh7pXyl97ptA/G1vvvXAdN3yT9Oesp
 PsmPBPH1rqFt1/5WpBjPv74/SX782LD61MBVuTFzq8S63t3oOuBcWaPdm/n4k+r3W4qPjqXP5
 0fm1CyxzZjtScX0kaLdTVq9/nFuQsjN5m9vxof3x2yOz64Jj+185Az4jfzh1cpIUwYYU37umL
 F6tm30Hzff+PrDyw21B79MD2wMqXhY2DP/R+VKGlUErTEUJcR5ht/Oktk2EW0J5U92nS7re7L
 FmgxtI5v2TW63hAV8NVf16VIbDHjoVRXNFV0Xct5NcI1seFaIvZcZsaZnbUDWxo5dp0JbG2LP
 D/8UPGdb8sKdHXsVhFnDRUfiJjP3D3grI0J1BAAA
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-11.tower-233.messagelabs.com!1574787733!22037!1
X-Originating-IP: [104.47.2.53]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8162 invoked from network); 26 Nov 2019 17:02:13 -0000
Received: from mail-db5eur01lp2053.outbound.protection.outlook.com (HELO
 EUR01-DB5-obe.outbound.protection.outlook.com) (104.47.2.53)
 by server-11.tower-233.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Nov 2019 17:02:13 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aj3kOKKhXdqspBtJWUW2MXQhQmydgjOy90HZ/yvevd+dzJ4GEixkae2RI4Bo1dOofjp51dtsrct2bpe0Zj/kJy71ZkT/t5xJmu/T/VYpe9GE5bwj8aFQI9gXe1HgraQYRMZD0fv88fwRJTCb55ODuwcKg5ESGbwjiDGIyH1A/VcJHEINrRBzu9WY0v+xoucdypdt8L9y9CzilbOoGWdCyqEO5yugRqoKqN9qa7zMCaqjb2A0PE6CMsmJfTatmmp0+QZ+4mP0Pr8RF8wsEYr6TpsLM5QvD0YkeIgJq/HBGlVqF7EjNLmgbCaS/S1BORmusYgjUEUJkHoLYYxbsRksGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2V0gz/tfXQyJZe3+mCkQjDXOpzMjnYkTppIKtgjiRgs=;
 b=ZOGaCs8vAf85MNRCRhPqJvdZ6ctT3HNwofTxf50hwQFCS+B0hZ4KyoS4s3JyeKFw+oHu0wpyVSowFrNPc2H2UF21HRRMAjGm9XGBvXROP6jeSc5QoXl0O9P2EdN3S3MO1DXCnR3COKax6mt8+xWhRiFQhHiQzbzyP9B2354PuBMMZRvfKWE+g9ViUeXHtQV22W0c41BM+bdxqF8dp3/0XalCjzJXvhhpOoH52EbMgyvPFglKtXxdzx+f/trflTuj1Dt6jsxwmx2NysJpnywnBLVtcrXlj3FBPyLjUc59TVEkH2DlUgqeR85y8byJDyPBdVnlhjaKjTal9zWecKeiZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2V0gz/tfXQyJZe3+mCkQjDXOpzMjnYkTppIKtgjiRgs=;
 b=eHLLCcN2e69i8Un1u/zcu6SXh7yNHRJQmrvgJsuWamnqByAeZxnhIM4rTDz9YYBFxjtTnD8xYvafYk3jQbfcNWHdB1ZpzcaOGJmBB7IeCbcguAT0f6eDqXzLvQPa5QNWLYTaVuA5Fv6YJX2iE2cvokltL8wJPPVhgTYu5G0i0pk=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1170.EURPRD10.PROD.OUTLOOK.COM (10.169.155.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Tue, 26 Nov 2019 17:02:12 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 17:02:12 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>
Thread-Topic: [PATCHv2 2/6] ASoC: da7213: Add regulator support
Thread-Index: AQHVn7aUUebhVdnv70SSWjcAgccCf6eWEA7QgAFfzACABkV0cA==
Date: Tue, 26 Nov 2019 17:02:12 +0000
Message-ID: <AM5PR1001MB09941D80A91358F99189CB6D80450@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191120152406.2744-1-sebastian.reichel@collabora.com>
 <20191120152406.2744-3-sebastian.reichel@collabora.com>
 <AM5PR1001MB09945AE319B4ED33C193ABE9804E0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191122170946.kbodf45wa24jnz2n@earth.universe>
In-Reply-To: <20191122170946.kbodf45wa24jnz2n@earth.universe>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7225f1b6-2e41-4163-3dfd-08d7729261b7
x-ms-traffictypediagnostic: AM5PR1001MB1170:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB11702A790A80AFC3B6E4AC33A7450@AM5PR1001MB1170.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:765;
x-forefront-prvs: 0233768B38
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(346002)(396003)(39860400002)(136003)(199004)(189003)(86362001)(52536014)(6506007)(55236004)(71200400001)(53546011)(26005)(76116006)(7696005)(71190400001)(6436002)(64756008)(66446008)(102836004)(9686003)(54906003)(25786009)(110136005)(55016002)(446003)(11346002)(8936002)(2906002)(186003)(6116002)(66476007)(99286004)(66946007)(3846002)(66556008)(5660300002)(66066001)(33656002)(6246003)(14444005)(256004)(74316002)(305945005)(7736002)(8676002)(81166006)(229853002)(81156014)(76176011)(316002)(478600001)(4326008)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR1001MB1170;
 H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FuCtYvvOcm3csR2ks8ieiZpp3k+XpdID5p9KKV3RW53GJqDtxHmUmpsHDZ8WcKZ4QxV+MOKE5RMgXeq9lnTBsK/GNRBvFBEbR+ieHKi+Do6QwJNhf3vPIdPAJyXl5EFj9BOl99idXI3tJ/Rz/UiwWK2K/DkiNy2gcY/UtIwUaAW3BjDTmUSrGbhhmvM7PzmGvu2YUEwM0a4P82GwovwxJJ0aSOpPO2VgKLOR6PPj8lw0pkd05++rB8dy2NrklOLbaIFsOtqPxZQYrxbpggNBIwZ+431+cVuz9GYkyJd6laeIsRbMszraLSVCVB+myKZTYU4Wb5D9o+S8mMEaHg91Wy3n9ALnfM5rmJ9TdSN2bEJqWuGt1WAkh9xFxdZypc17fi5xyt8NYaI9coVaHY8SffraSHFQUTsPf0M5q+MpbcFzVk1OR41RkZ4H17ps8WFx
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7225f1b6-2e41-4163-3dfd-08d7729261b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2019 17:02:12.5185 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TWOKvclp6Ff8AGuj97NglcBh1Gze/j2OY26YBUpm+FXIwTIPhdYRsOdfXtsbGgTYrHVyrrMxk1NW42oLu4nhCuabIyDO0zdeCYu8UFqUDYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1170
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Support Opensource <Support.Opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [alsa-devel] [PATCHv2 2/6] ASoC: da7213: Add regulator support
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

On 22 November 2019 17:10, Sebastian Reichel wrote:

> Hi,

Ok, based on feedback I have no further comment so:

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> 
> On Thu, Nov 21, 2019 at 09:15:02PM +0000, Adam Thomson wrote:
> > On 20 November 2019 15:24, Sebastian Reichel wrote:
> >
> > > This adds support for most regulators of da7212 for improved
> > > power management. The only thing skipped was the speaker supply,
> > > which has some undocumented dependencies. It's supposed to be
> > > either always-enabled or always-disabled.
> > >
> > > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > ---
> > >  .../devicetree/bindings/sound/da7213.txt      |  4 +
> > >  sound/soc/codecs/da7213.c                     | 79 ++++++++++++++++++-
> > >  sound/soc/codecs/da7213.h                     |  9 +++
> > >  3 files changed, 91 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/sound/da7213.txt
> > > b/Documentation/devicetree/bindings/sound/da7213.txt
> > > index 759bb04e0283..cc8200b7d748 100644
> > > --- a/Documentation/devicetree/bindings/sound/da7213.txt
> > > +++ b/Documentation/devicetree/bindings/sound/da7213.txt
> > > @@ -21,6 +21,10 @@ Optional properties:
> > >  - dlg,dmic-clkrate : DMIC clock frequency (Hz).
> > >  	[<1500000>, <3000000>]
> > >
> > > + - VDDA-supply : Regulator phandle for Analogue power supply
> > > + - VDDMIC-supply : Regulator phandle for Mic Bias
> > > + - VDDIO-supply : Regulator phandle for I/O power supply
> > > +
> > >  ======
> > >
> > >  Example:
> > > diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
> > > index aff306bb58df..0359249118d0 100644
> > > --- a/sound/soc/codecs/da7213.c
> > > +++ b/sound/soc/codecs/da7213.c
> > > @@ -19,6 +19,7 @@
> > >  #include <linux/module.h>
> > >  #include <sound/pcm.h>
> > >  #include <sound/pcm_params.h>
> > > +#include <linux/pm_runtime.h>
> > >  #include <sound/soc.h>
> > >  #include <sound/initval.h>
> > >  #include <sound/tlv.h>
> > > @@ -806,6 +807,11 @@ static int da7213_dai_event(struct
> > > snd_soc_dapm_widget *w,
> > >   */
> > >
> > >  static const struct snd_soc_dapm_widget da7213_dapm_widgets[] = {
> > > +	/*
> > > +	 * Power Supply
> > > +	 */
> > > +	SND_SOC_DAPM_REGULATOR_SUPPLY("VDDMIC", 0, 0),
> > > +
> > >  	/*
> > >  	 * Input & Output
> > >  	 */
> > > @@ -932,6 +938,9 @@ static const struct snd_soc_dapm_route
> > > da7213_audio_map[] = {
> > >  	/* Dest       Connecting Widget    source */
> > >
> > >  	/* Input path */
> > > +	{"Mic Bias 1", NULL, "VDDMIC"},
> > > +	{"Mic Bias 2", NULL, "VDDMIC"},
> > > +
> > >  	{"MIC1", NULL, "Mic Bias 1"},
> > >  	{"MIC2", NULL, "Mic Bias 2"},
> > >
> > > @@ -1691,6 +1700,8 @@ static int da7213_probe(struct snd_soc_component
> > > *component)
> > >  {
> > >  	struct da7213_priv *da7213 =
> > > snd_soc_component_get_drvdata(component);
> > >
> > > +	pm_runtime_get_sync(component->dev);
> >
> > It seems that this function can return errors, although I do see lots of
> > instances of this being called where the return value isn't checked. Not had
> > time to walk the code fully but are we sure no errors are going to happen here?
> 
> In this case, the runtime PM is already enabled because of
> pm_runtime_set_active() being called previously. So this only
> increases the usage counter.
> 
> > > +
> > >  	/* Default to using ALC auto offset calibration mode. */
> > >  	snd_soc_component_update_bits(component, DA7213_ALC_CTRL1,
> > >  			    DA7213_ALC_CALIB_MODE_MAN, 0);
> > > @@ -1811,6 +1822,8 @@ static int da7213_probe(struct snd_soc_component
> > > *component)
> > >  				    DA7213_DMIC_CLK_RATE_MASK, dmic_cfg);
> > >  	}
> > >
> > > +	pm_runtime_put_sync(component->dev);
> >
> > Same question here.
> 
> da7213_runtime_suspend() always returns 0.
> 
> > > +
> > >  	/* Check if MCLK provided */
> > >  	da7213->mclk = devm_clk_get(component->dev, "mclk");
> > >  	if (IS_ERR(da7213->mclk)) {
> > > @@ -1848,11 +1861,22 @@ static const struct regmap_config
> > > da7213_regmap_config = {
> > >  	.cache_type = REGCACHE_RBTREE,
> > >  };
> > >
> > > +static void da7213_power_off(void *data)
> > > +{
> > > +	struct da7213_priv *da7213 = data;
> > > +	regulator_bulk_disable(DA7213_NUM_SUPPLIES, da7213->supplies);
> > > +}
> > > +
> > > +static const char *da7213_supply_names[DA7213_NUM_SUPPLIES] = {
> > > +	[DA7213_SUPPLY_VDDA] = "VDDA",
> > > +	[DA7213_SUPPLY_VDDIO] = "VDDIO",
> > > +};
> > > +
> > >  static int da7213_i2c_probe(struct i2c_client *i2c,
> > >  			    const struct i2c_device_id *id)
> > >  {
> > >  	struct da7213_priv *da7213;
> > > -	int ret;
> > > +	int i, ret;
> > >
> > >  	da7213 = devm_kzalloc(&i2c->dev, sizeof(*da7213), GFP_KERNEL);
> > >  	if (!da7213)
> > > @@ -1860,6 +1884,25 @@ static int da7213_i2c_probe(struct i2c_client *i2c,
> > >
> > >  	i2c_set_clientdata(i2c, da7213);
> > >
> > > +	/* Get required supplies */
> > > +	for (i = 0; i < DA7213_NUM_SUPPLIES; ++i)
> > > +		da7213->supplies[i].supply = da7213_supply_names[i];
> > > +
> > > +	ret = devm_regulator_bulk_get(&i2c->dev, DA7213_NUM_SUPPLIES,
> > > +				      da7213->supplies);
> > > +	if (ret) {
> > > +		dev_err(&i2c->dev, "Failed to get supplies: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = regulator_bulk_enable(DA7213_NUM_SUPPLIES, da7213-
> > > >supplies);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	ret = devm_add_action_or_reset(&i2c->dev, da7213_power_off,
> > > da7213);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > >  	da7213->regmap = devm_regmap_init_i2c(i2c, &da7213_regmap_config);
> > >  	if (IS_ERR(da7213->regmap)) {
> > >  		ret = PTR_ERR(da7213->regmap);
> > > @@ -1867,6 +1910,11 @@ static int da7213_i2c_probe(struct i2c_client *i2c,
> > >  		return ret;
> > >  	}
> > >
> > > +	pm_runtime_set_autosuspend_delay(&i2c->dev, 100);
> > > +	pm_runtime_use_autosuspend(&i2c->dev);
> > > +	pm_runtime_set_active(&i2c->dev);
> >
> > Again this can return an error. Are we certain this won't fail?
> 
> This only provides the information, that the device is running. The
> parent might be affected, but that is running anyways since we are
> probing a child device.
> 
> > > +	pm_runtime_enable(&i2c->dev);
> > > +
> > >  	ret = devm_snd_soc_register_component(&i2c->dev,
> > >  			&soc_component_dev_da7213, &da7213_dai, 1);
> > >  	if (ret < 0) {
> > > @@ -1876,6 +1924,34 @@ static int da7213_i2c_probe(struct i2c_client *i2c,
> > >  	return ret;
> > >  }
> > >
> > > +static int __maybe_unused da7213_runtime_suspend(struct device *dev)
> > > +{
> > > +	struct da7213_priv *da7213 = dev_get_drvdata(dev);
> > > +
> > > +	regcache_cache_only(da7213->regmap, true);
> > > +	regcache_mark_dirty(da7213->regmap);
> > > +	regulator_bulk_disable(DA7213_NUM_SUPPLIES, da7213->supplies);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int __maybe_unused da7213_runtime_resume(struct device *dev)
> > > +{
> > > +	struct da7213_priv *da7213 = dev_get_drvdata(dev);
> > > +	int ret;
> > > +
> > > +	ret = regulator_bulk_enable(DA7213_NUM_SUPPLIES, da7213-
> > > >supplies);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +	regcache_cache_only(da7213->regmap, false);
> > > +	regcache_sync(da7213->regmap);
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct dev_pm_ops da7213_pm = {
> > > +	SET_RUNTIME_PM_OPS(da7213_runtime_suspend,
> > > da7213_runtime_resume, NULL)
> > > +};
> > > +
> > >  static const struct i2c_device_id da7213_i2c_id[] = {
> > >  	{ "da7213", 0 },
> > >  	{ }
> > > @@ -1888,6 +1964,7 @@ static struct i2c_driver da7213_i2c_driver = {
> > >  		.name = "da7213",
> > >  		.of_match_table = of_match_ptr(da7213_of_match),
> > >  		.acpi_match_table = ACPI_PTR(da7213_acpi_match),
> > > +		.pm = &da7213_pm,
> > >  	},
> > >  	.probe		= da7213_i2c_probe,
> > >  	.id_table	= da7213_i2c_id,
> > > diff --git a/sound/soc/codecs/da7213.h b/sound/soc/codecs/da7213.h
> > > index 3250a3821fcc..3890829dfb6e 100644
> > > --- a/sound/soc/codecs/da7213.h
> > > +++ b/sound/soc/codecs/da7213.h
> > > @@ -12,6 +12,7 @@
> > >
> > >  #include <linux/clk.h>
> > >  #include <linux/regmap.h>
> > > +#include <linux/regulator/consumer.h>
> > >  #include <sound/da7213.h>
> > >
> > >  /*
> > > @@ -521,9 +522,17 @@ enum da7213_sys_clk {
> > >  	DA7213_SYSCLK_PLL_32KHZ
> > >  };
> > >
> > > +/* Regulators */
> > > +enum da7213_supplies {
> > > +	DA7213_SUPPLY_VDDA = 0,
> > > +	DA7213_SUPPLY_VDDIO,
> > > +	DA7213_NUM_SUPPLIES,
> > > +};
> > > +
> > >  /* Codec private data */
> > >  struct da7213_priv {
> > >  	struct regmap *regmap;
> > > +	struct regulator_bulk_data supplies[DA7213_NUM_SUPPLIES];
> > >  	struct clk *mclk;
> > >  	unsigned int mclk_rate;
> > >  	int clk_src;
> > > --
> > > 2.24.0
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
