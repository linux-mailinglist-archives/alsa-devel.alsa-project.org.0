Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDEA10FB07
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 10:47:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9F6E1612;
	Tue,  3 Dec 2019 10:47:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9F6E1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575366476;
	bh=C3P22Icdm1lPl9Jmr/CRwNvW3Z1cNcMDbO5xYdS1YLQ=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qCFTLsTNAibCeP8orcNdfDvK/hD5CU2yoKwTVolDZW5Lx7SOpvL72RRMA4AcG3Dh4
	 0XGLH1/iXS9ii2ihpXubUMrNmJ2vVRlcau9Gu8wfO42x8XALLmO4Fnh6dmMe8oxAwV
	 Lb24w0iAJ9hHkuyh7cq7ormFURqAj9XjEsFwCbDA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF578F8015A;
	Tue,  3 Dec 2019 10:46:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31F56F80227; Tue,  3 Dec 2019 10:46:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3C72F800B4
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 10:46:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3C72F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="v+PmwyRv"
Received: from [85.158.142.98] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-a.eu-central-1.aws.symcld.net id CF/E3-12484-DDE26ED5;
 Tue, 03 Dec 2019 09:46:05 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPJsWRWlGSWpSXmKPExsWSoc9lrHtH71m
 swatJNhZXLh5isljT3MFkMfXhEzaLb1eArMu75rBZdO7qZ7XY8H0towO7x4bPTWweO2fdZfdY
 vOclk8emVZ1sHvveLmPzWL/lKovH501yAexRrJl5SfkVCawZf7auYSw4K1TxbUIfYwPjFv4uR
 i4ORoGlzBINN+6xdjFyAjnHWCT+b0iDSGxmlPjd+5MNxGEROMEsMXHWBkYQR0hgKpPEvg1f2S
 GcB4wS964+BetnE7CQmHziARuILSIQL/Hq/i9mkCJmgQYmiVUrTjCBJIQF7CQ+PHnMDFFkL7G
 s8Rs7hG0k0fXuPlgzi4CKxJWd38DqeQUSJToengVbICTgJHHl72cwm1PAWaJ99X0miMNlJb40
 rgabySwgLnHryXywuISAgMSSPeeZIWxRiZeP/0E9mipxsukGI0RcR+Ls9SdQtpLEvLlHoGxZi
 Uvzu6FsX4k/z3rZYOo3z5wPNdNCYkl3K0sXIweQrSLx71AlRLhAYtWXcywQtprEjTcdUOUyEg
 cvrWAFhYmEwCtWib2fPjFOYNSfheRsCFtHYsHuT2wQtrbEsoWvmWeBg0JQ4uTMJywLGFlWMVo
 kFWWmZ5TkJmbm6BoaGOgaGhrrGuoam+klVukm6qWW6ian5pUUJQIl9RLLi/WKK3OTc1L08lJL
 NjEC01pKIaPKDsbur2/1DjFKcjApifL+/fwkVogvKT+lMiOxOCO+qDQntfgQowwHh5IEr7Hus
 1ghwaLU9NSKtMwcYIqFSUtw8CiJ8AaCpHmLCxJzizPTIVKnGHU5Jrycu4hZiCUvPy9VSpzXHq
 RIAKQoozQPbgQs3V9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMxbBzKFJzOvBG7TK6AjmIC
 OMG95BHJESSJCSqqBiVn3cYqAMov9DBnTZOYSqV+q1rn+suzt2x+9PzenXMH2fNDbxKwinQPy
 W+49OX/0+GpGs+jev3pLJ8xXzotedz/R9F3O2eSawrZvDSFXeo89ZPa5H/ggVvS1zB/mk2Veu
 68UbpQtmjIlyd6l/Gt09qaAI/qhD0qPiUyInK0U3DDnztSl+d0cJl8WOO6YMp+P7dy2cyKRm0
 UX+Yu9ZRRq/3nhovcawXWlHe9OfdeZ6HM5rzTf0P3xeuGKX/Lh7F9bj87QqEwt613s1NjBJ7t
 VRu0Kn/OMxD92d+YWpvhP/9rNF5J9w/UJZ3Fxutj9w5lhBkL65teM1po5dT1+pd2o/vpQ7Ak1
 /Zu7zvWvv3xaiaU4I9FQi7moOBEATQZW4XIEAAA=
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-9.tower-223.messagelabs.com!1575366364!868891!1
X-Originating-IP: [104.47.10.51]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23679 invoked from network); 3 Dec 2019 09:46:04 -0000
Received: from mail-db5eur03lp2051.outbound.protection.outlook.com (HELO
 EUR03-DB5-obe.outbound.protection.outlook.com) (104.47.10.51)
 by server-9.tower-223.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Dec 2019 09:46:04 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sd8r6mJbIqp+RBMNj+vCRffz8y8U5RtkYethFIKeEfNrza0TTf3KuL3BjIuNwWWPoXperm3dnnP4Sv8L55q9YLLWyE5eaw72pdQSjilskjw1bAc2dy2CSnqxHs15rZmSDbaXWLi3ZFpYxDYicnm9pxPIeyW2O/N4lsEhEUG3AP9wM6/wspsg4ge+Plr9Tn7tCcJ5W4BIKkn5xRWbjlKw6wsipq+FiY39j/wifDK/yWx2OoxwhJ3eYLZqkhnofVU8ccKeYijmyQP8DveTCGmcYOc7O3XqU1kVCSEfWBAG3XIt6F9t2tOqxaNd31fNZql65NZmkbmvvX1GEh2eIm/7Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdNSB01cclC01SHAwdTu6DDOH3OCHHxHgRQTi8rgJgI=;
 b=F7uehasa7kefQxYT3V4p5fhc1IW5zNf+x/VeDidJowquyeCKpoBtG9oHiMjtLhHO8UpCo2DqmyepL3Lhsn5D1Fcng4m3FIVaLN+7Z9//Mi7095OiEvfEWvdg0fggnn+I1WmOyI+PtmwPKVoS0qOpiOUvU1vrXq+IeFab2dazzl2Kitaw658eoCJAXYaVGajqETctDLzFqM91S/14Z6SlLikQEv6aCZhEHNaeIfu7t8Mrp3xKpzT8Y4dp2mQuh745tTuIfGw0bRLQEjgZ6pwkGg2SmIbD6mpgoNF9vBsB7LmLQ8/i4qI9SYf6VWlaAGUkVnCChxCx9aIlK9hT0+ONDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdNSB01cclC01SHAwdTu6DDOH3OCHHxHgRQTi8rgJgI=;
 b=v+PmwyRv+hx4MhefQcv4kXoq4PSiK/CYPGSi8+f1sxCglnA6hKeXnIAGDD7/REdTGZ1rzBE4suDTaQNxBu3wuvs3Wm8YkA7vqkBBTmQJpDKY87iRkvLbmGjxjVYJSEHHgFC4wQyxExTa1z3fVJSf8hqBCGybQ3S9ejSZE60z3Xk=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1185.EURPRD10.PROD.OUTLOOK.COM (10.169.153.147) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Tue, 3 Dec 2019 09:46:03 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 09:46:03 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Brent Lu <brent.lu@intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Thread-Topic: [PATCH] ASoC: da7219: remove SRM lock check retry
Thread-Index: AQHVqaxDP6cBrmECm0aX2T25rtDQx6eoJvjg
Date: Tue, 3 Dec 2019 09:46:03 +0000
Message-ID: <AM5PR1001MB0994EB497D3BC7D0F4C6FD9080420@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <1575358265-17905-1-git-send-email-brent.lu@intel.com>
In-Reply-To: <1575358265-17905-1-git-send-email-brent.lu@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c301817e-0e4d-4123-a5ed-08d777d59cae
x-ms-traffictypediagnostic: AM5PR1001MB1185:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB118569616121646057EFEC1AA7420@AM5PR1001MB1185.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02408926C4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(39860400002)(346002)(376002)(396003)(189003)(199004)(110136005)(71190400001)(33656002)(71200400001)(52536014)(2906002)(5660300002)(8676002)(86362001)(7736002)(305945005)(81156014)(74316002)(81166006)(2501003)(8936002)(55236004)(14454004)(99286004)(6246003)(54906003)(26005)(6306002)(11346002)(55016002)(102836004)(186003)(478600001)(446003)(9686003)(4326008)(966005)(7696005)(3846002)(66446008)(316002)(229853002)(14444005)(6116002)(76176011)(76116006)(64756008)(25786009)(256004)(66556008)(66476007)(6436002)(53546011)(6506007)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR1001MB1185;
 H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JQ7hR5g/j0+bxuu3WmBy0gp0fwvYrwsUQgq7yFKM9D7WNIRxqozuiOrt4mQCGdD9U9l+8bZQhng2izK0ZKN7YGNSwfvnSdEoI7qIjI2kEkgYy1wWd01HWkOfHEoKP/vdcvGTOm9hVe+xAoQieTDSiexfhMu2bPUamstccAU3ZxjD9Bage9gI8gtBXH1zCBZ2aE+zd+pCB15SaBouo0Qq5OpLg5k4sMYx9CrwGODKBXuzh3PpUWoQMBdc34bM27u9E9uzFLsMVecDjFF4S44i+VLgRe5c/XJ1u6w9C6zm/bJFsaQbEtnSyOX7ZlfmUuYLhDa3DqT0pLl0K44yEBBfbA0Hoe3YwC7J9E/r2SKY3o/6pHGRrHItpXDOvUp/+JswjwX0+3N1+0tAm3wEeGebXDl6AntGBwkkpThv2fiRnIWl6g+NMXVOmCrYgS3+HUWzqrR+oCwP5jFeKxuEn0cfMc0m9XfE8tNIDTy5LR6fFQ8=
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c301817e-0e4d-4123-a5ed-08d777d59cae
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 09:46:03.5845 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MNpVZLg+MQjdh+CyPbwJ7xxa6vdj3Zz0I5hXpxebg0RQujwMVeHFSPkwikkiv7RNp5QCMe7hfS/5J1ZHC/zb7HhnFciUVL7+xIm0BnDCUi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1185
Cc: Support Opensource <Support.Opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: da7219: remove SRM lock check retry
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

On 03 December 2019 07:31, Brent Lu wrote:

> For platforms not able to provide WCLK in the PREPARED runtime state, it
> takes 400ms for codec driver to print the message "SRM failed to lock" in
> the da7219_dai_event() function which is called when DAPM widgets are
> powering up. The latency penalty to audio input/output is too much so the
> retry (8 times) and delay (50ms each retry) are removed.
> 
> Another reason is current Cold output latency requirement in Android CDD is
> 500ms but will be reduced to 200ms for 2021 platforms. With the 400ms
> latency it would be difficult to pass the Android CTS test.

We can potentially reduce the timings here for something shorter although I'd
need to speak with the HW team as to what, if any reduction is feasible. However
this is not a real fix as there's potential for audible noises when you don't
enable WCLK first. As far as I can tell the Intel platforms are capable of
enabling clocks early, as can be seen in this board file with early SCLK enable:

https://elixir.bootlin.com/linux/latest/source/sound/soc/intel/boards/kbl_rt5663_max98927.c#L99

I think there's a need to find some method to enable the WCLK signal otherwise
there's the potential for audible artefacts when SRM finally locks which is not
going to be pleasant.

> 
> Signed-off-by: Brent Lu <brent.lu@intel.com>
> ---
>  sound/soc/codecs/da7219.c | 3 ++-
>  sound/soc/codecs/da7219.h | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
> index f83a6ea..042e701 100644
> --- a/sound/soc/codecs/da7219.c
> +++ b/sound/soc/codecs/da7219.c
> @@ -833,7 +833,8 @@ static int da7219_dai_event(struct snd_soc_dapm_widget
> *w,
>  				srm_lock = true;
>  			} else {
>  				++i;
> -				msleep(50);
> +				if (i < DA7219_SRM_CHECK_RETRIES)
> +					msleep(50);
>  			}
>  		} while ((i < DA7219_SRM_CHECK_RETRIES) && (!srm_lock));
> 
> diff --git a/sound/soc/codecs/da7219.h b/sound/soc/codecs/da7219.h
> index 88b67fe..3149986 100644
> --- a/sound/soc/codecs/da7219.h
> +++ b/sound/soc/codecs/da7219.h
> @@ -770,7 +770,7 @@
>  #define DA7219_PLL_INDIV_36_TO_54_MHZ_VAL	16
> 
>  /* SRM */
> -#define DA7219_SRM_CHECK_RETRIES	8
> +#define DA7219_SRM_CHECK_RETRIES	1
> 
>  /* System Controller */
>  #define DA7219_SYS_STAT_CHECK_RETRIES	6
> --
> 2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
