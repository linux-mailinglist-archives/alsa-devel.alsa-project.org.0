Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EA210A2DD
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2019 17:57:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EADFD174C;
	Tue, 26 Nov 2019 17:56:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EADFD174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574787454;
	bh=u85OMQvth/aOeZigsvZt6lTYTg2By1Am4W97f204kCw=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uovK1Yq1/GfH7yCxi/IvjR1vVrUFdOiMfeFIAqNyBSSfTuWQXpReCrpWp1siIjq+B
	 WLC6aAL70TZLmWqJeegLc6GqGqqntGpHGA74GVn495DO/gRk2CtnIIGEszhnnhFy3S
	 jXDyuTPdB3yuz1VoiwODBnp2iwvmfYjCxpcwkW2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D785F801ED;
	Tue, 26 Nov 2019 17:55:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7474AF80159; Tue, 26 Nov 2019 17:55:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 283CDF80109
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 17:55:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 283CDF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="GsMAlOj0"
Received: from [85.158.142.108] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 51/18-12307-E095DDD5;
 Tue, 26 Nov 2019 16:55:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNJsWRWlGSWpSXmKPExsWSoc9rpssTeTf
 W4OV/a4srFw8xWUx9+ITNYvO5HlaLb1c6mCwu75rDZtG5q5/V4u5rP4sN39cyOnB4bPjcxOax
 4+4SRo+ds+6ye2xa1cnmse/tMjaP9Vuusnh83iQXwB7FmpmXlF+RwJrRuXo5W8E1p4oJ57wbG
 CebdjFycTAKLGWWOLXlACuEc4xFYsr7WVDOZkaJ370/2UAcFoETzBJztz5iBHGEBKYxSTx9+x
 vKecgo0fr0CVAZJwebgIXE5BMPwFpEBF4ySnzdMpUZxGEW+MgoceTOOVaQKmEBZ4nZ/W3MILa
 IgIvEoc1NQB0cQLaVxIbtTiBhFgFVif6+FUwgNq9AosTz+etYIbZdYpQ4Pm8iO0iCUyBJYsmB
 zYwgNqOArMSXxtVgM5kFxCVuPZkP1iwhICCxZM95ZghbVOLl43+sEPWpEiebbjBCxHUkzl5/A
 mUrScybewTKlpW4NL8byvaVuPl+NjNM/Z6eM1DzLSSWdLeygNwvIaAi8e9QJUS4QOLn7h9QrW
 oSVz8dZYGwZSReHTzPBPKLhMAtVon1u38xT2DUn4XkbAhbR2LB7k9sELa2xLKFr5lngcNCUOL
 kzCcsCxhZVjFaJhVlpmeU5CZm5ugaGhjoGhoa6wJJY1O9xCrdRL3UUt3k1LySokSgrF5iebFe
 cWVuck6KXl5qySZGYIpLKWRo38F44utbvUOMkhxMSqK8gex3Y4X4kvJTKjMSizPii0pzUosPM
 cpwcChJ8EpFAOUEi1LTUyvSMnOA6RYmLcHBoyTC+zgcKM1bXJCYW5yZDpE6xWjMMeHl3EXMHJ
 vnLl3ELMSSl5+XKiXOuxikVACkNKM0D24QLA9cYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCT
 MOwlkCk9mXgncvldApzABncI08xbIKSWJCCmpBqbqR7aRx5bkTuqXuSkYobRj564iNu2naxo6
 N8ToV0ru+ffS5XszJ+/Dw7mCJwqS/eL3l3ptUpUsb21IWRgbcWjXFpUYf/Wp/P1STGWGrDzL7
 HQKruzqvlXywuEjt8ujI3d2lT2+fOC+0JKtLh+WKC/cLLE6ZaZN1meD1gfpZ5ZM2BJqvHXx4Z
 1XLPzZogIPHmFXj7p0zdS9ruBFl0q/itvDBeXv1Jj8WCqnKlxeMcPmyw7Bx5Mr2ScIRYcZpX3
 8k8/k/+13mM7cDC21//fcndZaZimkdt/Ym+O1qP7rCeMn5/iOX7dfyLfoz9r/x2MO/r/v/D1P
 402q+tkCy79tnI1VAnVPG7bIy7U5ctXMdlJiKc5INNRiLipOBADEXE79fgQAAA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-31.tower-233.messagelabs.com!1574787340!21545!1
X-Originating-IP: [104.47.13.54]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8954 invoked from network); 26 Nov 2019 16:55:40 -0000
Received: from mail-he1eur04lp2054.outbound.protection.outlook.com (HELO
 EUR04-HE1-obe.outbound.protection.outlook.com) (104.47.13.54)
 by server-31.tower-233.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Nov 2019 16:55:40 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oz0LnT2KsouVliV6D2mefpl6zfcQ5tcL4nW5otIZa7p6NMrHbb57+VvKElah8NNIsB/R1k8UAeGTyI+K4xpdIyL1ozQUQXFV+X0en5Bmwu/6kZ8TRPs+y9xOI9R4J0jz9GamayFJ5Ivsxx10K0ojq/zOmStny16yW8xY2FqiuWNsi7KBE3+uXaHbPxl9YgsB53dc0/72cb1jyTYxfnk8zl99JQdilu2UkWtKkHNRJdtMoBCOoq2++P3kxv90YxnmAophzow0gOStKKN0MX4VaoJVmS5aZXmxKvbpd3gCwqn9nvAXJ1K77ZG96OmBptJ6E+URGSfpKS+hcJ1076oe3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ha+r2ZcJwgMOpeXZqQzK9hAD36L8Emkhc8K65S9JdwM=;
 b=AlcR+QuqOQ9IPsY8vXy7zOVthgom8OHifCpfQdOOHUG3d71xSXnMFVLLNOk6W+PnV0BxXdVHNpnwnpfyLGTuvS1ilc4Hz1i0pO/JvoY2ZOEUnceR8C7gYjmogKcWHPAjP0XMpoDJEVV12rq+snHcMvbQEwY7699i2ucQFxqQcruPLc9onS34ezCFQWExrZD/DLMWl8pkWiIMaIyM3yuwgLTGL3npkpjwR4TPhW40/ODukFtuskopRkD6UvZ31ekE6EOtdGLI3Oi+gjICweaIq5jeUs8zkvC39VTnjgyjMNvEEP/voBn+hZZHYQNo/QjfrlVUVhLMzQHNPUKhK5OA9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ha+r2ZcJwgMOpeXZqQzK9hAD36L8Emkhc8K65S9JdwM=;
 b=GsMAlOj0FVRt9hbY3bEeWocZLDAWEWZZUiLcL2f9C4XJTnGt4VNVTvYfwxRRlQSJeeOOZ6K79+Dca7VtQRw8AW18xdhlHRbgEvI7ilOd7AtqfGpdPl25Iotb3odhRaX0nmtQOxi2Gv7KFlRNtXhBoxJcq+RwMEZOcY6g7fUmkIA=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1108.EURPRD10.PROD.OUTLOOK.COM (10.169.155.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.21; Tue, 26 Nov 2019 16:55:39 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 16:55:39 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Sebastian Reichel
 <sebastian.reichel@collabora.com>, Support Opensource
 <Support.Opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>
Thread-Topic: [PATCHv2 6/6] ASoC: da7213: Add default clock handling
Thread-Index: AQHVn7aXMyQuMXvm70+jyJLut64noaeWIihwgAeSgIA=
Date: Tue, 26 Nov 2019 16:55:39 +0000
Message-ID: <AM5PR1001MB0994E628439F021F97B872D480450@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191120152406.2744-1-sebastian.reichel@collabora.com>
 <20191120152406.2744-7-sebastian.reichel@collabora.com>
 <AM5PR1001MB0994720A0D615339A978E35C804E0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AM5PR1001MB0994720A0D615339A978E35C804E0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 967a227b-82f8-4547-2c8a-08d77291773f
x-ms-traffictypediagnostic: AM5PR1001MB1108:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB11089460F2AF587EB9768829A7450@AM5PR1001MB1108.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0233768B38
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(346002)(396003)(39850400004)(366004)(189003)(199004)(54906003)(110136005)(76116006)(66946007)(11346002)(6436002)(6116002)(66476007)(14454004)(86362001)(3846002)(4326008)(446003)(25786009)(33656002)(102836004)(55016002)(2906002)(229853002)(74316002)(8676002)(7736002)(186003)(478600001)(305945005)(81156014)(9686003)(81166006)(8936002)(26005)(52536014)(99286004)(6246003)(66446008)(64756008)(316002)(66556008)(7696005)(6506007)(55236004)(71190400001)(71200400001)(5660300002)(76176011)(66066001)(256004)(53546011)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR1001MB1108;
 H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LDo9WF2XdptftbSTfcxJYUYXTrn70WDEPaOdx8ZNKfb0wjvmR4qGral9W564MtpDYFIyapNnB3n7HCOHo7f7nooAEF7iFA0ewHkA2ze24f3j8+rdrKMR4oWIKuQ1SOIlTCBGfwEWHYYLhGVE2R70JCx4mHoXr4KpiAUjXYz+M8cJbKB9tQP4Oon1rTp2egMsr+NUAnObz3wqDKgFgq2OYEEZZ0FM1PVMdO92/cm6Kd51i/A0RMTinxUyNyc6g7TCzYBohfYdBvwhFe3PH0oiX6l1onlC8Rbd00cMiOq8TIaRzJ5PI9TT1L7YzTbv05m4LhHa5+feXXog8Fv+sOF74e7VKbMBcePmA81Q8zIynDPswOye8rwGX0wJ5AK2uNT1oBW8YKtxCXEG8LQPhb1OPlN4En+aCzHzhxF4CUg1Lyk7QdFOkR1C7y1//f1gehy5
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 967a227b-82f8-4547-2c8a-08d77291773f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2019 16:55:39.0758 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MZBcZqkJsWPLMvUHiBHXDNDji86xjE4cSvgeOHfVjpZxJ2uMCs85ZMhor6m5lLuDny8ttqY7IgAF45ZNplemL3HLTqLrmic14pO9EvMzwAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1108
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kernel@collabora.com" <kernel@collabora.com>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCHv2 6/6] ASoC: da7213: Add default clock
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

On 21 November 2019 21:49, Adam Thomson wrote:

> On 20 November 2019 15:24, Sebastian Reichel wrote:
> 
> > This adds default clock/PLL configuration to the driver
> > for usage with generic drivers like simple-card for usage
> > with a fixed rate clock.
> >
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  sound/soc/codecs/da7213.c | 75
> > ++++++++++++++++++++++++++++++++++++---
> >  sound/soc/codecs/da7213.h |  2 ++
> >  2 files changed, 73 insertions(+), 4 deletions(-)
> >
> > diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
> > index 3e6ad996741b..ff1a936240be 100644
> > --- a/sound/soc/codecs/da7213.c
> > +++ b/sound/soc/codecs/da7213.c
> > @@ -1156,6 +1156,7 @@ static int da7213_hw_params(struct
> > snd_pcm_substream *substream,
> >  			    struct snd_soc_dai *dai)
> >  {
> >  	struct snd_soc_component *component = dai->component;
> > +	struct da7213_priv *da7213 =
> > snd_soc_component_get_drvdata(component);
> >  	u8 dai_ctrl = 0;
> >  	u8 fs;
> >
> > @@ -1181,33 +1182,43 @@ static int da7213_hw_params(struct
> > snd_pcm_substream *substream,
> >  	switch (params_rate(params)) {
> >  	case 8000:
> >  		fs = DA7213_SR_8000;
> > +		da7213->out_rate = DA7213_PLL_FREQ_OUT_98304000;
> >  		break;
> >  	case 11025:
> >  		fs = DA7213_SR_11025;
> > +		da7213->out_rate = DA7213_PLL_FREQ_OUT_90316800;
> >  		break;
> >  	case 12000:
> >  		fs = DA7213_SR_12000;
> > +		da7213->out_rate = DA7213_PLL_FREQ_OUT_98304000;
> >  		break;
> >  	case 16000:
> >  		fs = DA7213_SR_16000;
> > +		da7213->out_rate = DA7213_PLL_FREQ_OUT_98304000;
> >  		break;
> >  	case 22050:
> >  		fs = DA7213_SR_22050;
> > +		da7213->out_rate = DA7213_PLL_FREQ_OUT_90316800;
> >  		break;
> >  	case 32000:
> >  		fs = DA7213_SR_32000;
> > +		da7213->out_rate = DA7213_PLL_FREQ_OUT_98304000;
> >  		break;
> >  	case 44100:
> >  		fs = DA7213_SR_44100;
> > +		da7213->out_rate = DA7213_PLL_FREQ_OUT_90316800;
> >  		break;
> >  	case 48000:
> >  		fs = DA7213_SR_48000;
> > +		da7213->out_rate = DA7213_PLL_FREQ_OUT_98304000;
> >  		break;
> >  	case 88200:
> >  		fs = DA7213_SR_88200;
> > +		da7213->out_rate = DA7213_PLL_FREQ_OUT_90316800;
> >  		break;
> >  	case 96000:
> >  		fs = DA7213_SR_96000;
> > +		da7213->out_rate = DA7213_PLL_FREQ_OUT_98304000;
> >  		break;
> >  	default:
> >  		return -EINVAL;
> > @@ -1392,9 +1403,9 @@ static int da7213_set_component_sysclk(struct
> > snd_soc_component *component,
> >  }
> >
> >  /* Supported PLL input frequencies are 32KHz, 5MHz - 54MHz. */
> > -static int da7213_set_component_pll(struct snd_soc_component
> *component,
> > -				    int pll_id, int source,
> > -				    unsigned int fref, unsigned int fout)
> > +static int _da7213_set_component_pll(struct snd_soc_component
> > *component,
> > +				     int pll_id, int source,
> > +				     unsigned int fref, unsigned int fout)
> >  {
> >  	struct da7213_priv *da7213 =
> > snd_soc_component_get_drvdata(component);
> >
> > @@ -1503,6 +1514,16 @@ static int da7213_set_component_pll(struct
> > snd_soc_component *component,
> >  	return 0;
> >  }
> >
> > +static int da7213_set_component_pll(struct snd_soc_component
> *component,
> > +				    int pll_id, int source,
> > +				    unsigned int fref, unsigned int fout)
> > +{
> > +	struct da7213_priv *da7213 =
> > snd_soc_component_get_drvdata(component);
> > +	da7213->fixed_clk_auto_pll = false;
> > +
> > +	return _da7213_set_component_pll(component, pll_id, source, fref,
> > fout);
> > +}
> > +
> >  /* DAI operations */
> >  static const struct snd_soc_dai_ops da7213_dai_ops = {
> >  	.hw_params	= da7213_hw_params,
> > @@ -1532,6 +1553,43 @@ static struct snd_soc_dai_driver da7213_dai = {
> >  	.symmetric_rates = 1,
> >  };
> >
> > +static int da7213_set_auto_pll(struct snd_soc_component *component, bool
> > enable)
> > +{
> > +	struct da7213_priv *da7213 =
> > snd_soc_component_get_drvdata(component);
> > +	int mode;
> > +
> > +	if (!da7213->fixed_clk_auto_pll)
> > +		return 0;
> > +
> > +	da7213->mclk_rate = clk_get_rate(da7213->mclk);
> > +
> > +	if (enable)
> > +		mode = DA7213_SYSCLK_PLL;
> > +	else
> > +		mode = DA7213_SYSCLK_MCLK;
> 
> If we're the clock slave, and we're using an MCLK that's not a harmonic then
> SRM is required to synchronise the PLL to the incoming WCLK signal. I assume
> simple sound card should allow for both master and slave modes? If so we'll
> need to do something here to determine this as well.
> 
> > +
> > +	switch (da7213->out_rate) {
> > +	case DA7213_PLL_FREQ_OUT_90316800:
> > +		if (da7213->mclk_rate == 11289600 ||
> > +		    da7213->mclk_rate == 22579200 ||
> > +		    da7213->mclk_rate == 45158400)
> > +			mode = DA7213_SYSCLK_MCLK;
> > +		break;
> > +	case DA7213_PLL_FREQ_OUT_98304000:
> > +		if (da7213->mclk_rate == 12288000 ||
> > +		    da7213->mclk_rate == 24576000 ||
> > +		    da7213->mclk_rate == 49152000)
> > +			mode = DA7213_SYSCLK_MCLK;
> > +
> > +		break;
> > +	default:
> > +		return -1;
> > +	}
> > +
> > +	return _da7213_set_component_pll(component, 0, mode,
> > +					 da7213->mclk_rate, da7213->out_rate);
> > +}
> > +
> >  static int da7213_set_bias_level(struct snd_soc_component *component,
> >  				 enum snd_soc_bias_level level)
> >  {
> > @@ -1551,6 +1609,8 @@ static int da7213_set_bias_level(struct
> > snd_soc_component *component,
> >  						"Failed to enable mclk\n");
> >  					return ret;
> >  				}
> > +
> > +				da7213_set_auto_pll(component, true);
> 
> I've thought more about this and for the scenario where a machine driver
> controls the PLL through a DAPM widget associated with this codec (like some
> Intel boards do), then the PLL will be configured once here and then again
> when the relevant widget is called. I don't think that will matter but I will
> take a further look just in case this might cause some oddities.

So I don't see any issues per say with the PLL function being called twice in
the example I mentioned. However it still feels a bit clunky; You either live
with it or you have something in the machine driver to call the codec's PLL
function early doors to prevent the bias_level() code of the codec controlling
the PLL automatically. Am wondering though if there would be some use in having
an indicator that simple-card is being used so we can avoid this? I guess we
could check the parent sound card instance's OF node to look at the compatible
string and see if it's a simple-card instantiation. Bit messy maybe.
Alternatively would it be worthwhile storing in the snd_soc_card instance that
this is a simple-card instantiation? We could then use that to determine
whether the codec driver should automatically deal with the PLL or not. This
would of course require an update to the snd_soc_card structure to add the new
flag and then some update to simple-card.c to flag this.

I think relying on the timing of the call to the codec's PLL configuration
function from a machine driver isn't ideal.

> 
> >  			}
> >  		}
> >  		break;
> > @@ -1562,8 +1622,10 @@ static int da7213_set_bias_level(struct
> > snd_soc_component *component,
> >  					    DA7213_VMID_EN | DA7213_BIAS_EN);
> >  		} else {
> >  			/* Remove MCLK */
> > -			if (da7213->mclk)
> > +			if (da7213->mclk) {
> > +				da7213_set_auto_pll(component, false);
> >  				clk_disable_unprepare(da7213->mclk);
> > +			}
> >  		}
> >  		break;
> >  	case SND_SOC_BIAS_OFF:
> > @@ -1829,6 +1891,11 @@ static int da7213_probe(struct snd_soc_component
> > *component)
> >  			return PTR_ERR(da7213->mclk);
> >  		else
> >  			da7213->mclk = NULL;
> > +	} else {
> > +		/* Do automatic PLL handling assuming fixed clock until
> > +		 * set_pll() has been called. This makes the codec usable
> > +		 * with the simple-audio-card driver. */
> > +		da7213->fixed_clk_auto_pll = true;
> >  	}
> >
> >  	return 0;
> > diff --git a/sound/soc/codecs/da7213.h b/sound/soc/codecs/da7213.h
> > index 3890829dfb6e..97ccf0ddd2be 100644
> > --- a/sound/soc/codecs/da7213.h
> > +++ b/sound/soc/codecs/da7213.h
> > @@ -535,10 +535,12 @@ struct da7213_priv {
> >  	struct regulator_bulk_data supplies[DA7213_NUM_SUPPLIES];
> >  	struct clk *mclk;
> >  	unsigned int mclk_rate;
> > +	unsigned int out_rate;
> >  	int clk_src;
> >  	bool master;
> >  	bool alc_calib_auto;
> >  	bool alc_en;
> > +	bool fixed_clk_auto_pll;
> >  	struct da7213_platform_data *pdata;
> >  };
> >
> > --
> > 2.24.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
