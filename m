Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFB4FAF03
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2019 11:53:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72E89165F;
	Wed, 13 Nov 2019 11:52:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72E89165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573642427;
	bh=d72u0Qa4ju2OGwKyI6dGvVNfH97iziVU0wFQpmvAd3o=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r0e8VDl64rJQYoRKzsGrJi501c5zhI+hosu81+3Ir/TYL7+pcUxt0mVHghVKbKLUW
	 S79IHck6+x3Wp7RmwZGOZVP9OuyEedLJWjKHqcEO80yojfAqGljRoOEe72uw6HeoJ1
	 AiFQxR54dFlBtHlhX1TPAIfKc8Mny0ibDVWIftY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 768C6F80051;
	Wed, 13 Nov 2019 11:52:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90F91F80038; Wed, 13 Nov 2019 11:51:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5D00F80038
 for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2019 11:51:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5D00F80038
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="BJVk/pkW"
Received: from [46.226.52.98] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 37/EB-19209-130EBCD5;
 Wed, 13 Nov 2019 10:51:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSfUxbVRjGe+69vb1rKF4KyIEAiVU0kbVQDe4
 2AhITk5rFZST+wZYwd5FL29iv9ZaMssmAfcmXLE6mMCjt+BzObBawrJCKdR9AsxGBMZww2WhM
 CoMo6DayrLPtLVP/+z3nec5z3py8BCr24UkEU2ZmTHpaK8GFmDqD95ZUvugtzOy7JqRmfvYgV
 NM9H07136znUw9nPkOoaVcrTtW4GvnUwsou6tKjb0Eeoby0UY0rhxY6gfJyy4JA6eirwZXu1W
 5ceXHgFqbccKTuFuzla/RFhrL9fPViTzNmdAvLbP4LgkowSNQCIQHILhSO+acRTlzD4G9Vzoj
 oB/BJwyYeEhg5hsINp5sfEmLyDAJd128hnLgHYMA+jdaCbQROUvD02CIe4jhSC12tHeEQSq4h
 8ImnIWzEkrlwKDAPuNA7sNvdj3L8LvTe/h4JMUamQet3vYIQi0gaus/MCrjXTiBwwjoYvryNz
 IFrfzeHSwGZAv+q+iZchJIJ8I6vPVwESRJ2jkyiHMdD/1KAz+UZOF49B7jz7fDGbV+EJdDadi
 XCKXCqvS7CH0DrDZtgK79ydDPCFOysO47VAiLIr8CAx8IdG+FJdyXO8auwY2YY4zgZzrm8EV7
 mw6nJxFMgo+U/U3O8HdqG13GO02G3fQVtCX9FDBxv9mE2gPUBqsikUanNOlqjlcozM6Vy+RtS
 ueJNqTwrS0aXS2kZUyo9yLBmqVxGH2RlrEX3sbZYpmfMDhBcuGLjj2eHQM36qswDEglEEi9yH
 vUWiqOLDMUWNc2qPzKVahnWA5IJQgJFBfNBL8bEqJiyEo02uLZbNiSiJHGi3XeDtog10jpWo+
 KsCSAlTvnbzqFiTG/QM0kJXIgMhdSl+ucVW8s/BVKSYkWAx+OJo4yMSacx/99fBgkEkMSK2FB
 LlEZvfv7ScnAIJDjEsZ8mQkOY6X+tpEpkoJl39/7418OFaG32VQWSA75S7NIRS6IPA70720ce
 tESfO1RuWBTO74n+pVeYnX8+bbqr48rAZs9k3LynjZTuUJQc3/F0pz9fFa89DMrek+f/kWG/k
 DereunywqHprILV/Ir0+vfb9sVYmpbeHhTdvEojOQdaf59YHhFHubo8D52W4QN3Kn7Ny536E6
 tqLfyiuqmht1ywZ1R1fjY7tS7VnIXZ9nlH74/rrz99Vv95rfFB/vwP+4tT1sm0UfuXr+1VtZb
 ock/YXzQcKddXHHE0nnalDafzWg7XDK052Po5RX9j8gsnL1r7qMefPHZ+OrAw93JXQeVs9xgf
 8R5LNDx71LMmwVg1LX8dNbH0P00ural3BAAA
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-7.tower-262.messagelabs.com!1573642288!1252747!1
X-Originating-IP: [104.47.0.54]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29043 invoked from network); 13 Nov 2019 10:51:29 -0000
Received: from mail-he1eur01lp2054.outbound.protection.outlook.com (HELO
 EUR01-HE1-obe.outbound.protection.outlook.com) (104.47.0.54)
 by server-7.tower-262.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Nov 2019 10:51:29 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDfFBEKoSclw8Z2qjHkyLoDrr2pIIqFvnMd/m6DsC8f/z+f0dsChH5lMaA47YuD/kovT+gvuahOkUFbMjgHC3iW7pBjO4+quAwSFIZqhyO11zQcmxtRXazCQxyA1b2xNGZXmKSD3hzXWnZNOgt/1jmUQST3rNqORznAHjzHVEzd69f9bFHFOOqT9X6gY8MaHWoKXQ5fzibgIUvungfKjCX6DkJ6/tyPOI//T54ZfggwhrkdfrTueQ/7YLJLR4DHcPGfC9LpCkp4OwOVgB4E1jA5hRPSfpEpQizi01h8DytqkdmTJ0IjuR5R/9dyulPLEsnI+wB9ok7q6vcAwAEvmHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lxfll/apY0cNyxj8qsT566aQgK9bz+g7JkrGkmrcB4o=;
 b=RBTn48USH/EbFoQTSCSQLwQlKrQJ8sgZiMnkwxY1h9wgavVS/DQ4JLe+SyS1RNZURdJq5+SPEGAozQBsegVWSChkFXiTWXCRT97KRBxNv+wpdsXkISYb8inHkR+qkhO19ma3zW2ONIYx29x6TSUGszqVMGWQGvh9hn2fzrDP1VTnMhI0srq+2lJQmr1yDwlnODAZBqy+hAAWpakJqokW4y85YmjfuT/EA1YD1Vy2hrIwoIbps4qRZ0zF5QgFYWMp/BNL9ki2uVPGtCozzmKkVPkbGKGCH7eA0jml34uESVhuPZbIDD+zEzhvvJVAvD7geGXZBDEiO/ZsrVKhHYqdRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lxfll/apY0cNyxj8qsT566aQgK9bz+g7JkrGkmrcB4o=;
 b=BJVk/pkWaCafALfvhWbGv1hsDrRN0CUEIrmWu93f5v9xqeypeXZbPUU0/+BaSZ/RVQW1HE6zOw/3bPvh66PG/wpKafmwVbuzzMo2agON5EFQInEVFxWwo5tUnT2GHEJ1JcOiQ1ModMw9k5L2WaEvA+/Xly3AaiHwBK7CWhhCIYs=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1188.EURPRD10.PROD.OUTLOOK.COM (10.169.154.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Wed, 13 Nov 2019 10:51:26 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2430.028; Wed, 13 Nov 2019
 10:51:26 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>
Thread-Topic: [PATCHv1 1/5] ASoC: da7213: Add regulator support
Thread-Index: AQHVllzP8vWbWmJf+UuFLSeQhWd9YaeGBE5QgAGpb4CAAUSk8A==
Date: Wed, 13 Nov 2019 10:51:26 +0000
Message-ID: <AM5PR1001MB0994E162BF3AA57B69198C4480760@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191108174843.11227-1-sebastian.reichel@collabora.com>
 <20191108174843.11227-2-sebastian.reichel@collabora.com>
 <AM5PR1001MB09942731970692EE42BE9CB180740@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191112152411.d626b34wmvkzpqjf@earth.universe>
In-Reply-To: <20191112152411.d626b34wmvkzpqjf@earth.universe>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 955c2561-f78e-40c9-ef82-08d768276e79
x-ms-traffictypediagnostic: AM5PR1001MB1188:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB1188713FDC649B0B8070CDF8A7760@AM5PR1001MB1188.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0220D4B98D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(346002)(39860400002)(366004)(396003)(199004)(189003)(14444005)(9686003)(66066001)(66446008)(71190400001)(446003)(99286004)(55016002)(64756008)(6436002)(66556008)(76116006)(71200400001)(476003)(6506007)(5660300002)(11346002)(66946007)(256004)(102836004)(53546011)(110136005)(54906003)(55236004)(26005)(486006)(186003)(6246003)(14454004)(66476007)(229853002)(7696005)(76176011)(33656002)(74316002)(305945005)(86362001)(478600001)(52536014)(316002)(2906002)(8936002)(81156014)(8676002)(25786009)(6116002)(4326008)(81166006)(3846002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR1001MB1188;
 H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AANcg/MTWqogy7H+NXwrSpeCnb6636hSeYo8HYMLNjMz3yli3U+j4XnYWD3CdLFk/4ibQzPtZBVyjoF4kyamI2P2PBfNA44Q0gy94uEZTKdgQMxOcNjrmn5KH12MXL6S0Y7837/DTR1OSp/oBs3PkesnlfQasx3o4CzrLNX+WH9LzHjbStR7D7r5maW4lqjY552vLiNd98vpm4cKhUo3VH8YbDaC1roLBeDr5unhdSbrTsIfwtHtn4Dgy/OfqFhvlEwVZdDhYWEJQ7URwbK855INlYzg0RlPIdppBPWtWLSVpc5E915dUVizvJpMuSG6BODc8rAz42vTVFJ91n1WNRgoIwcM1FIQSDRwKS4A2RqvHrgIf3LBH3xLkLB/ZAN3vnidP055XVlWGXpdx1dUJwEOR1EM7CckfAejKdFsCv/BXWZYH5jbM5fqYL964pdC
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 955c2561-f78e-40c9-ef82-08d768276e79
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2019 10:51:26.1403 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4oImFn1iKB7IlpoOtQ6czu0IVH88TsUfo6qJni7QtxRXVfMod2P88LYkiz4WQIjJbNODvQ/Z5p2omGNL3NRhh6qZQUEV9ULGTLZEMXbPqIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1188
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Support Opensource <Support.Opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [alsa-devel] [PATCHv1 1/5] ASoC: da7213: Add regulator support
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

On 12 November 2019 15:24, Sebastian Reichel wrote:

> > >  static const struct snd_soc_dapm_widget da7213_dapm_widgets[] = {
> > > +	/*
> > > +	 * Power Supply
> > > +	 */
> > > +	SND_SOC_DAPM_REGULATOR_SUPPLY("VDDA", 0, 0),
> >
> > Having spoken with our HW team, this will cause a POR in the device so we can't
> > just enable/disable VDD_A supply. Needs to present at all times. How are you
> > verifying this?
> 
> Ok. The system, that I used for testing shared a regulator
> for VDDIO and VDDA. I suppose this needs to be moved next
> to enabling VDDIO then.

Yes, and as Mark mentioned you can use the bulk enable/disable calls.

> > > +	da7213->vddio = devm_regulator_get(&i2c->dev, "VDDIO");
> > > +	if (IS_ERR(da7213->vddio))
> > > +		return PTR_ERR(da7213->vddio);
> > > +
> > > +	ret = regulator_enable(da7213->vddio);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	ret = devm_add_action_or_reset(&i2c->dev, da7213_power_off,
> > > da7213);
> > > +	if (ret < 0)
> > > +		return ret;
> >
> > We're seemingly leaving the VDDIO regulator enabled on failure, unless I'm
> > missing some magic somewhere?
> 
> If regulator_enable fails, the regulator is not enabled. If
> devm_add_action_or_reset
> fails, it will call da7213_power_off().

Right, didn't spot that as haven't seen that used before. Nice :)
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
