Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B338C20EEC5
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 08:48:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3572D1612;
	Tue, 30 Jun 2020 08:47:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3572D1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593499685;
	bh=YuWbuQwC3YQ811E3lUh5V+4fUCvuz/qegmmWuz8jJ/w=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cdPZmEb2VogCGYB1+D+3jiIpEfARbEltww4boj3dfE9LaFT1IbcC/QOhe5lYXKyhP
	 v21rCajeTWk2J1iz7lfp8OdcY2vbW6EWhOuAZP4JyImcJ2fHLDCPEb3Onwy9bwTeNO
	 UqcRRhA8bQ7s9nDNLYn8Rtb/oUKa0rQ7RvEcXnSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5075DF800EA;
	Tue, 30 Jun 2020 08:46:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D05BF801F2; Tue, 30 Jun 2020 08:46:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4074FF800EA
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 08:46:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4074FF800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="k8My/VL8"
IronPort-SDR: I8njuq0FSMz3ZH0/PCckmbeUwHZpbtSSWvk5GCz66Zgfhk0RnyyxKwhPgJ3Uet4d1/KcbzIlC2
 RPbUGd4AbA/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="134460202"
X-IronPort-AV: E=Sophos;i="5.75,296,1589266800"; d="scan'208";a="134460202"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2020 23:46:10 -0700
IronPort-SDR: xPyIGqsIbHlo/Zy7/8AIopBRpU294NM5tCYOPJTmOKnxP6GoEZx4+RgSR5JEGE+lIVzLOD991f
 fWAjVvcNdkQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,296,1589266800"; d="scan'208";a="312281612"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
 by orsmga008.jf.intel.com with ESMTP; 29 Jun 2020 23:46:10 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 29 Jun 2020 23:46:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 29 Jun 2020 23:46:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gp5Ly5sdphxkwNDNIuS3iWeppR0oPAme/CrAupB62GTwQPFGN188TQ0n9ez244674HlutjYWe/XZUrU2VwdT9Z4PWQuMuw9FJvs9agfFC9g+GkGM3Ca0dJXuko1/VQMJRdEjDnjFt3C8pv84LTXA8EdGsefGgTPWs1NtmOTOpUJz7P6jSie6eksR7oULeSOcbFZrpL8TbGVaK2UfUdc/QK8iqaPL1HrSJhmfQ1ewL0jNN0WVOBKRAjdl5RGrRugmjWg+WrnJJ7cFeh15f6EK01TtymfGiuMXNQ89LlUbznMBdFHrBiditwNIrtCSRqP56/B1DOci9u6GuYuLRW27cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DU7yg59ELO3zziztL3Zgn3lQESBF1pZD5rAuEzZzfk=;
 b=EyPmOGIIU4rVk7ohvAci7vX7fw/wmAYwIFy0soiKPSYSi079ICfHxUH67eGSxOzv+lxjsR68eGP9pI4jj3jf37BjRKxLOP2fD4EmFCO34Sa5l/ATOjTUUCcbl44FPxFUB22roTdMmn32T4YPvbTX52flURtDiV+nD8P9tmb/3T73rc2P3kZm8s57A35tNnww63XMIWgGdaS+aFYnB4i7RVjhpGg5D3yFlyfFPcwWF8aR+LeIVFiux/JEK/iqjGvOfkcc4ogvReAVHgNvB/MzJ9Tl0jQpji3MoqE9sy1vlfYbOe1X/i/CVTH/e8suqgstoKnozgm7OQs5rCOHQXER7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DU7yg59ELO3zziztL3Zgn3lQESBF1pZD5rAuEzZzfk=;
 b=k8My/VL84Xel5RMx3b1AILd/VpUBw2errHhK70b4F3GwWO615fGVE/5zxvP0dEGIQkXhu8YVU80hfqYG2TeVNiVkl61zg6zp0MmD9HY3mt6eH4bpsbUhNe3GmJNbo1tSkkpKaZYpa72n8hAI7HVY+f5UldfY3w0boEn2Jzi25HQ=
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by DM6PR11MB2587.namprd11.prod.outlook.com (2603:10b6:5:c3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Tue, 30 Jun
 2020 06:46:07 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::29db:26c0:5600:9a71]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::29db:26c0:5600:9a71%7]) with mapi id 15.20.3131.028; Tue, 30 Jun 2020
 06:46:07 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: Intel: bxt-da7219-max98357a: support MAX98390
 speaker amp
Thread-Topic: [PATCH] ASoC: Intel: bxt-da7219-max98357a: support MAX98390
 speaker amp
Thread-Index: AQHWTqkAWJec9MAQSEmIR6xGM1dpWajwtd2w
Date: Tue, 30 Jun 2020 06:46:06 +0000
Message-ID: <DM6PR11MB4316CA5F11462D11D1751C6C976F0@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1593498722-7074-1-git-send-email-brent.lu@intel.com>
In-Reply-To: <1593498722-7074-1-git-send-email-brent.lu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: alsa-project.org; dkim=none (message not signed)
 header.d=none; alsa-project.org; dmarc=none action=none header.from=intel.com; 
x-originating-ip: [192.198.147.199]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9024713-67b2-47a4-9767-08d81cc14478
x-ms-traffictypediagnostic: DM6PR11MB2587:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB2587FB6F5E80A6FFD2516A25976F0@DM6PR11MB2587.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:51;
x-forefront-prvs: 0450A714CB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z9NElgEM8AkRQFoPtznCeRcgyqew3PiX8R5xlDS0VqqEsp1FxRuOQMWZkfcprjmnDwBcuCW2lyt063Bc1a8e49L9uAquef9u9keHRtXGPtsQoPalm8cXWZTNI+h50F6O1sLwRFT3HnymCOQWhCWBE78K4umMFEOXHZt5hHCbYm5g657SZYCW2YoK2xXmeCz2JFWAUjzvxDdI0DktqN1hpEBEwIwC1spLEIGE5TBohmy0TqCiS6OW6zfDLDdzVP9if1lYDHyTGyd8rFIFJSi/xPffrb7uRFvWTCb4KXYzb3HrpMGAK2gJ5n74tms7MTIfx0qhVQTScsWtKSaAjM3Olg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4316.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(9686003)(71200400001)(478600001)(7416002)(83380400001)(2906002)(55016002)(6506007)(5660300002)(33656002)(30864003)(52536014)(4326008)(6916009)(64756008)(54906003)(26005)(66556008)(66946007)(66446008)(66476007)(76116006)(7696005)(316002)(186003)(86362001)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: SImS8Y3RtWGFrE18F/NHWGwVKZXwx0nabAK2R29ra/bwrfyRf2qoaDdVaFZM0+xQc5Q6EYoCHQs/PjRLtZ2LGoyBpB097Hgn8DifxN8l3ujKZONh0MN1hyKTpB/yLTQ2AqVszEgN8HiRCYjXA+7adRez8Pcb5b0t2AXCJULiqdREBl/rrsQgqNsljB+Crq5E54+eCwhm3XIzsXsuxNgRI3vtu05ukCaqyhZmgEtk0ALXCdhKqy1bH0lJl0ncAHM/AyNaVhcE9aE9rWgaIEUpT3ARiw2A/wHQvlRAzqckbIjjhu8YGfpdIBekStc4uCdVRYTYZQ4HroZX/nmqWb5SrcuPzeHUExPGKZpfbjRjOILtGgAWcpkemRziIvlZlGFNHN/GHfB+DxEUI9X1yBn5VLnfcx+308vtswoNZmTW5Ie0OoCeG6cVPJ43SOq2KTPrf3KVl9s2cb+gL3LNDGVlIVuLUyZzAmxyEhq6YwLcQIm94UT5wgkUcX0qi/fOXns5
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9024713-67b2-47a4-9767-08d81cc14478
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2020 06:46:06.4801 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hK5psqRDdy6tt+clO82au0eQ3WSmbakHfsT1QJbH0S+seS7V7qTYQs5yf7pqhIcxhKplwZlQUhZEZ62PjbEOYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2587
X-OriginatorOrg: intel.com
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, "Chiang,
 Mac" <mac.chiang@intel.com>, "Song, Chao" <chao.song@intel.com>,
 Libin Yang <libin.yang@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, "Zhi, 
 Yong" <yong.zhi@intel.com>, Mark Brown <broonie@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, "M,
 Naveen" <naveen.m@intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jason Yan <yanaijie@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

>=20
> Support MAX98390 speaker amplifier on cometlake platform. Driver now
> detects amplifier type in the probe function and installs corresponding
> controls and DAPM widgets/routes in the late_probe function.
>=20
> Signed-off-by: Brent Lu <brent.lu@intel.com>

This patch is from Chrome-v4.19 branch to support the combination of DA7219
and MAX98390 on a CML Chromebook. It reuses the topology file
sof-cml-da7219-max98357a.tplg


> ---
>  sound/soc/intel/boards/Kconfig                    |  20 ++++
>  sound/soc/intel/boards/bxt_da7219_max98357a.c     | 129
> ++++++++++++++++++++--
>  sound/soc/intel/common/soc-acpi-intel-cml-match.c |   4 +-
>  3 files changed, 139 insertions(+), 14 deletions(-)
>=20
> diff --git a/sound/soc/intel/boards/Kconfig
> b/sound/soc/intel/boards/Kconfig index 3d820e1..b3b863e 100644
> --- a/sound/soc/intel/boards/Kconfig
> +++ b/sound/soc/intel/boards/Kconfig
> @@ -291,9 +291,17 @@ config
> SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
>  	select SND_SOC_DMIC
>  	select SND_SOC_HDAC_HDMI
>=20
> +config SND_SOC_INTEL_DA7219_MAX98390_GENERIC
> +	tristate
> +	select SND_SOC_DA7219
> +	select SND_SOC_MAX98390
> +	select SND_SOC_DMIC
> +	select SND_SOC_HDAC_HDMI
> +
>  config SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
>  	tristate
>  	select SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
> +	select SND_SOC_INTEL_DA7219_MAX98390_GENERIC
>=20
>  if SND_SOC_INTEL_APL
>=20
> @@ -309,6 +317,18 @@ config
> SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH
>  	   Say Y or m if you have such a device. This is a recommended option.
>  	   If unsure select "N".
>=20
> +config SND_SOC_INTEL_BXT_DA7219_MAX98390_MACH
> +	tristate "Broxton with DA7219 and MAX98390 in I2S Mode"
> +	depends on I2C && ACPI && GPIOLIB
> +	depends on MFD_INTEL_LPSS || COMPILE_TEST
> +	depends on SND_HDA_CODEC_HDMI
> +	select SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
> +	help
> +	   This adds support for ASoC machine driver for Broxton-P platforms
> +	   with DA7219 + MAX98390 I2S audio codec.
> +	   Say Y or m if you have such a device. This is a recommended option.
> +	   If unsure select "N".
> +
>  config SND_SOC_INTEL_BXT_RT298_MACH
>  	tristate "Broxton with RT298 I2S mode"
>  	depends on I2C && ACPI && GPIOLIB
> diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c
> b/sound/soc/intel/boards/bxt_da7219_max98357a.c
> index 44016c1..12f07e1 100644
> --- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
> +++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
> @@ -25,9 +25,14 @@
>=20
>  #define BXT_DIALOG_CODEC_DAI	"da7219-hifi"
>  #define BXT_MAXIM_CODEC_DAI	"HiFi"
> +#define MAX98390_DEV0_NAME	"i2c-MX98390:00"
> +#define MAX98390_DEV1_NAME	"i2c-MX98390:01"
>  #define DUAL_CHANNEL		2
>  #define QUAD_CHANNEL		4
>=20
> +#define SPKAMP_MAX98357A	1
> +#define SPKAMP_MAX98390	2
> +
>  static struct snd_soc_jack broxton_headset;  static struct snd_soc_jack
> broxton_hdmi[3];
>=20
> @@ -40,6 +45,7 @@ struct bxt_hdmi_pcm {
>  struct bxt_card_private {
>  	struct list_head hdmi_pcm_list;
>  	bool common_hdmi_codec_drv;
> +	int spkamp;
>  };
>=20
>  enum {
> @@ -85,13 +91,20 @@ static int platform_clock_control(struct
> snd_soc_dapm_widget *w,  static const struct snd_kcontrol_new
> broxton_controls[] =3D {
>  	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
>  	SOC_DAPM_PIN_SWITCH("Headset Mic"),
> +};
> +
> +static const struct snd_kcontrol_new max98357a_controls[] =3D {
>  	SOC_DAPM_PIN_SWITCH("Spk"),
>  };
>=20
> +static const struct snd_kcontrol_new max98390_controls[] =3D {
> +	SOC_DAPM_PIN_SWITCH("Left Spk"),
> +	SOC_DAPM_PIN_SWITCH("Right Spk"),
> +};
> +
>  static const struct snd_soc_dapm_widget broxton_widgets[] =3D {
>  	SND_SOC_DAPM_HP("Headphone Jack", NULL),
>  	SND_SOC_DAPM_MIC("Headset Mic", NULL),
> -	SND_SOC_DAPM_SPK("Spk", NULL),
>  	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
>  	SND_SOC_DAPM_SPK("HDMI1", NULL),
>  	SND_SOC_DAPM_SPK("HDMI2", NULL),
> @@ -100,14 +113,20 @@ static const struct snd_soc_dapm_widget
> broxton_widgets[] =3D {
>  			platform_clock_control,
> 	SND_SOC_DAPM_POST_PMD|SND_SOC_DAPM_PRE_PMU),
>  };
>=20
> +static const struct snd_soc_dapm_widget max98357a_widgets[] =3D {
> +	SND_SOC_DAPM_SPK("Spk", NULL),
> +};
> +
> +static const struct snd_soc_dapm_widget max98390_widgets[] =3D {
> +	SND_SOC_DAPM_SPK("Left Spk", NULL),
> +	SND_SOC_DAPM_SPK("Right Spk", NULL),
> +};
> +
>  static const struct snd_soc_dapm_route audio_map[] =3D {
>  	/* HP jack connectors - unknown if we have jack detection */
>  	{"Headphone Jack", NULL, "HPL"},
>  	{"Headphone Jack", NULL, "HPR"},
>=20
> -	/* speaker */
> -	{"Spk", NULL, "Speaker"},
> -
>  	/* other jacks */
>  	{"MIC", NULL, "Headset Mic"},
>=20
> @@ -134,6 +153,17 @@ static const struct snd_soc_dapm_route audio_map[]
> =3D {
>  	{ "Headset Mic", NULL, "Platform Clock" },  };
>=20
> +static const struct snd_soc_dapm_route max98357a_routes[] =3D {
> +	/* speaker */
> +	{"Spk", NULL, "Speaker"},
> +};
> +
> +static const struct snd_soc_dapm_route max98390_routes[] =3D {
> +	/* Speaker */
> +	{"Left Spk", NULL, "Left BE_OUT"},
> +	{"Right Spk", NULL, "Right BE_OUT"},
> +};
> +
>  static const struct snd_soc_dapm_route broxton_map[] =3D {
>  	{"HiFi Playback", NULL, "ssp5 Tx"},
>  	{"ssp5 Tx", NULL, "codec0_out"},
> @@ -404,6 +434,10 @@ SND_SOC_DAILINK_DEF(ssp5_pin,
> SND_SOC_DAILINK_DEF(ssp5_codec,
>  	DAILINK_COMP_ARRAY(COMP_CODEC("MX98357A:00",
>  				      BXT_MAXIM_CODEC_DAI)));
> +SND_SOC_DAILINK_DEF(max98390_codec,
> +	DAILINK_COMP_ARRAY(
> +	/* Left */	COMP_CODEC(MAX98390_DEV0_NAME, "max98390-
> aif1"),
> +	/* Right */	COMP_CODEC(MAX98390_DEV1_NAME, "max98390-
> aif1")));
>=20
>  SND_SOC_DAILINK_DEF(ssp1_pin,
>  	DAILINK_COMP_ARRAY(COMP_CPU("SSP1 Pin"))); @@ -601,15
> +635,69 @@ static struct snd_soc_dai_link broxton_dais[] =3D {
>  	},
>  };
>=20
> +static struct snd_soc_codec_conf max98390_codec_confs[] =3D {
> +	{
> +		.dlc =3D COMP_CODEC_CONF(MAX98390_DEV0_NAME),
> +		.name_prefix =3D "Left",
> +	},
> +	{
> +		.dlc =3D COMP_CODEC_CONF(MAX98390_DEV1_NAME),
> +		.name_prefix =3D "Right",
> +	},
> +};
> +
>  #define NAME_SIZE	32
>  static int bxt_card_late_probe(struct snd_soc_card *card)  {
>  	struct bxt_card_private *ctx =3D snd_soc_card_get_drvdata(card);
>  	struct bxt_hdmi_pcm *pcm;
>  	struct snd_soc_component *component =3D NULL;
> -	int err, i =3D 0;
> +	const struct snd_kcontrol_new *controls;
> +	const struct snd_soc_dapm_widget *widgets;
> +	const struct snd_soc_dapm_route *routes;
> +	int num_controls, num_widgets, num_routes, ret, i =3D 0;
>  	char jack_name[NAME_SIZE];
>=20
> +	switch (ctx->spkamp) {
> +	case SPKAMP_MAX98357A:
> +		controls =3D max98357a_controls;
> +		num_controls =3D ARRAY_SIZE(max98357a_controls);
> +		widgets =3D max98357a_widgets;
> +		num_widgets =3D ARRAY_SIZE(max98357a_widgets);
> +		routes =3D max98357a_routes;
> +		num_routes =3D ARRAY_SIZE(max98357a_routes);
> +		break;
> +	case SPKAMP_MAX98390:
> +		controls =3D max98390_controls;
> +		num_controls =3D ARRAY_SIZE(max98390_controls);
> +		widgets =3D max98390_widgets;
> +		num_widgets =3D ARRAY_SIZE(max98390_widgets);
> +		routes =3D max98390_routes;
> +		num_routes =3D ARRAY_SIZE(max98390_routes);
> +		break;
> +	default:
> +		dev_err(card->dev, "Invalid speaker amplifier %d\n", ctx-
> >spkamp);
> +		break;
> +	}
> +
> +	ret =3D snd_soc_dapm_new_controls(&card->dapm, widgets,
> num_widgets);
> +	if (ret) {
> +		dev_err(card->dev, "Fail to new widgets\n");
> +		return ret;
> +	}
> +
> +	ret =3D snd_soc_add_card_controls(card, controls, num_controls);
> +	if (ret) {
> +		dev_err(card->dev, "Fail to add controls\n");
> +		return ret;
> +	}
> +
> +	ret =3D snd_soc_dapm_add_routes(&card->dapm, routes,
> num_routes);
> +	if (ret) {
> +		dev_err(card->dev, "Fail to add routes\n");
> +		return ret;
> +	}
> +
>  	if (soc_intel_is_glk())
>  		snd_soc_dapm_add_routes(&card->dapm, gemini_map,
>  					ARRAY_SIZE(gemini_map));
> @@ -631,17 +719,17 @@ static int bxt_card_late_probe(struct snd_soc_card
> *card)
>  		component =3D pcm->codec_dai->component;
>  		snprintf(jack_name, sizeof(jack_name),
>  			"HDMI/DP, pcm=3D%d Jack", pcm->device);
> -		err =3D snd_soc_card_jack_new(card, jack_name,
> +		ret =3D snd_soc_card_jack_new(card, jack_name,
>  					SND_JACK_AVOUT,
> &broxton_hdmi[i],
>  					NULL, 0);
>=20
> -		if (err)
> -			return err;
> +		if (ret)
> +			return ret;
>=20
> -		err =3D hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
> +		ret =3D hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
>  						&broxton_hdmi[i]);
> -		if (err < 0)
> -			return err;
> +		if (ret < 0)
> +			return ret;
>=20
>  		i++;
>  	}
> @@ -678,6 +766,11 @@ static int broxton_audio_probe(struct
> platform_device *pdev)
>=20
>  	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
>=20
> +	if (acpi_dev_present("MX98390", NULL, -1))
> +		ctx->spkamp =3D SPKAMP_MAX98390;
> +	else
> +		ctx->spkamp =3D SPKAMP_MAX98357A;
> +
>  	broxton_audio_card.dev =3D &pdev->dev;
>  	snd_soc_card_set_drvdata(&broxton_audio_card, ctx);
>  	if (soc_intel_is_glk()) {
> @@ -702,7 +795,13 @@ static int broxton_audio_probe(struct
> platform_device *pdev)
>  	} else if (soc_intel_is_cml()) {
>  		unsigned int i;
>=20
> -		broxton_audio_card.name =3D "cmlda7219max";
> +		if (ctx->spkamp =3D=3D SPKAMP_MAX98390) {
> +			broxton_audio_card.name =3D
> "cml_max98390_da7219";
> +
> +			broxton_audio_card.codec_conf =3D
> max98390_codec_confs;
> +			broxton_audio_card.num_configs =3D
> ARRAY_SIZE(max98390_codec_confs);
> +		} else
> +			broxton_audio_card.name =3D "cmlda7219max";
>=20
>  		for (i =3D 0; i < ARRAY_SIZE(broxton_dais); i++) {
>  			/* MAXIM_CODEC is connected to SSP1. */ @@ -
> 710,6 +809,11 @@ static int broxton_audio_probe(struct platform_device
> *pdev)
>  					BXT_MAXIM_CODEC_DAI)) {
>  				broxton_dais[i].name =3D "SSP1-Codec";
>  				broxton_dais[i].cpus->dai_name =3D "SSP1 Pin";
> +
> +				if (ctx->spkamp =3D=3D SPKAMP_MAX98390) {
> +					broxton_dais[i].codecs =3D
> max98390_codec;
> +					broxton_dais[i].num_codecs =3D
> ARRAY_SIZE(max98390_codec);
> +				}
>  			}
>  			/* DIALOG_CODEC is connected to SSP0 */
>  			else if (!strcmp(broxton_dais[i].codecs->dai_name,
> @@ -759,6 +863,7 @@ MODULE_AUTHOR("Harsha Priya
> <harshapriya.n@intel.com>");  MODULE_AUTHOR("Conrad Cooke
> <conrad.cooke@intel.com>");  MODULE_AUTHOR("Naveen Manohar
> <naveen.m@intel.com>");  MODULE_AUTHOR("Mac Chiang
> <mac.chiang@intel.com>");
> +MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
>  MODULE_LICENSE("GPL v2");
>  MODULE_ALIAS("platform:bxt_da7219_max98357a");
>  MODULE_ALIAS("platform:glk_da7219_max98357a");
> diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
> b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
> index cdea0c0..7dc9ba9 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
> @@ -15,8 +15,8 @@ static struct snd_soc_acpi_codecs rt1011_spk_codecs =3D
> {  };
>=20
>  static struct snd_soc_acpi_codecs max98357a_spk_codecs =3D {
> -	.num_codecs =3D 1,
> -	.codecs =3D {"MX98357A"}
> +	.num_codecs =3D 2,
> +	.codecs =3D {"MX98357A", "MX98390"}
>  };
>=20
>  /*
> --
> 2.7.4

