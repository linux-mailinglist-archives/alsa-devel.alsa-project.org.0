Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A842714C728
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 09:06:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 436061673;
	Wed, 29 Jan 2020 09:05:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 436061673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580285182;
	bh=IjotzsR176ceNZ1nD1biraUdLPvEo79PxjAVlcnHqEk=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eJBbwdzzTnfaJW0Tyo015RHmu6iaVCEi15O0ELeOb5uFVN9VLl4R+Oa4fOmAO5E0f
	 R9eckQsxl5lwluU/0xKYf2/xqrH9YNsFzUe/ecJXN/bQIdJIwcFpBkZxl0emygD+Gc
	 mNaD7mO3K4W6zLQY0hwk7Ls01uv/setpzrej95is=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 272FAF80122;
	Wed, 29 Jan 2020 09:04:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D4E0F8021E; Wed, 29 Jan 2020 09:04:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2046.outbound.protection.outlook.com [40.107.22.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8740F80122
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 09:04:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8740F80122
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="lPIpBc2m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DW7zQJyf6i4Us2O5MU1t9ayHPMOdv4pRYI4qPzk45RpCDZ4YOhT+0jK0Kam2dGf2kmUXKE0zVoqNdTbHkSRAtjY3esC7lBYrJVsb1YBKTs08fZjsfhDTHY0nN/auMSOFdGnKnejayifYjJyiFhjFxX3xkaAIH/w0wNjv7CVVqqI/qXrGhgZw7WTUJuZQ3N61/DU+E3bz8uqr0c1JUFbPYlCfMiYhC6XQ9OnlnZQY1kdwWV6PMUvAlX7murLSNtXy1gPL2DlAurQ4tf2r9JCrhiZjsiey5SdzxnCQNSy7HimqlaQO93zXTBb42CGPo50i4QFM4K7mwz/71LPcgQwy9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWApCeLPCISTDpTFjGSk68vuiIt7h7VejGeDJaYfbvc=;
 b=AIBCU3MdR239M3BGF2CLU+QKsM7Lw026oUIi1DhIqIdpeQq5O2mQjvN5RSjG/hjyjaXkg4nh3EBg2sjf/UdXFSQW1YqNZeAcxYFOQvq2G2kJYWa+TB+XHYmVW65NXzIUzqRgdKtMUwK8cQphuihIiKLYktmkzRkIY1NfeioYEsXsUOIo2HkhaEVvMgd5jJfNSUE9lynofPv4GJ0QJ4CEtVPpw5ndSSP3VkHyx3ZDC2+EU+63gdehaGcJwJqHHnCCLqf1jwoUV78v+Au+KsEx0My97036TxPXC1GkUja8x9s8vZVWSI1toYZxQ2WX8AVVGNiUoWPM2ylUziMqkm/bMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWApCeLPCISTDpTFjGSk68vuiIt7h7VejGeDJaYfbvc=;
 b=lPIpBc2mEdqmQRpBRwYoQxAT0MQ08oEvBhyYTCtQfMnVCunv1gIkuuoPr1kYg235/ODldomENJ+874aefqpSSaUFEzcjjvgTCS4IYNTBaJIyU0GjbUCtRIAok4OhETH2eJvTKj4h5VWSM2fcSOM0CnJ8GV/UTTbNcpKbl0LDrY0=
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com (52.134.16.147) by
 VI1PR0402MB2813.eurprd04.prod.outlook.com (10.175.21.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.23; Wed, 29 Jan 2020 08:04:28 +0000
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::8881:e155:f058:c0d1]) by VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::8881:e155:f058:c0d1%4]) with mapi id 15.20.2665.027; Wed, 29 Jan 2020
 08:04:28 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [alsa-devel] [PATCH v3 11/11] ASoC: SOF: Intel: Add Probe
 compress CPU DAIs
Thread-Index: AQHV1nq614aiIP8R0EGtBxAZC4MEAw==
Date: Wed, 29 Jan 2020 08:04:28 +0000
Message-ID: <21b4a2ecdcf60bca06d7c82c8252bfd2a8ebfd5c.camel@nxp.com>
References: <20200128104356.16570-1-cezary.rojewski@intel.com>
 <20200128104356.16570-12-cezary.rojewski@intel.com>
In-Reply-To: <20200128104356.16570-12-cezary.rojewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 076d0bef-8619-4d25-0680-08d7a491dd33
x-ms-traffictypediagnostic: VI1PR0402MB2813:
x-microsoft-antispam-prvs: <VI1PR0402MB28132B4C1E1C3DC6321E3E75F9050@VI1PR0402MB2813.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-forefront-prvs: 02973C87BC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(396003)(346002)(366004)(199004)(189003)(2906002)(186003)(71200400001)(478600001)(26005)(5660300002)(8676002)(54906003)(110136005)(81156014)(81166006)(316002)(6486002)(8936002)(6512007)(36756003)(66556008)(64756008)(6506007)(66446008)(66476007)(76116006)(66946007)(86362001)(44832011)(2616005)(4326008)(91956017)(99106002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB2813;
 H:VI1PR0402MB3839.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xcX4+gfmOcwobOY3bADExCGm4cZEXZ565/ncDuLBS1VAShsN9gNpwVM8rzYPWE4MzVx8HjWfJuVgBvds6jW66uU6DaGb0VZmhlSIljC91Oi1IPnm2LLhxk4Cp8CBl9HM1/8qW3TLaLfrNxfWx6N2e005yK9bnvhEo5xuEux3ONs3OImvqHmO+3AkTOwh5BTCl3rYj6M1PiLIu4llkV7pHMEABIeFwY2XUYRgsunbUT0/H13BpSBvUcYiNgQ7/u39/tWTe+FXv+6dY59d7tnLu0Fag3NMi17zXLblaG6AroOOdo3GpgHUQG8XunRcplRjBZaew6qWOjIX6RBDly8KK7BWIxqmqoiMxiG7uH4Rb3/t/HMmHtr6lBOG5MP5GButB1l8As4I6H0XtmwSGMkK9iBZmxrseyCFjufSPAigOw7RUoC0TiORrpdA1X5k49AY6AYLb2wcjCafGBF0eNnd6JwCATjFcKxa9jvZlLc3UwU=
x-ms-exchange-antispam-messagedata: 1rh8QDH7yVL+07JKIhpEwB2cGV3OanJGjrZVofVoYS0zfIfI2SSwc4NQ1g8mj7Ed1P+GItUPtLn5BXv6DmjpC7ykO9ut/Lagj3V2zea3JyTb6Cqyp9r1Gk3By1dQjJFomZ5yi3s7Xkiqq38zgLbUXw==
x-ms-exchange-transport-forked: True
Content-ID: <7D4A2B77489CBB4FB0A40AAB67D2CD24@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 076d0bef-8619-4d25-0680-08d7a491dd33
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2020 08:04:28.4066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pNd6i4DuWzR5j4l4BsPWp6oD6NLPyVOIDMnR7wiqsLvHuXMuH/7bIJRDUrPIt6D5FRr6jBZS6Yc5jjH4j3d21Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2813
Cc: "tiwai@suse.com" <tiwai@suse.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v3 11/11] ASoC: SOF: Intel: Add Probe
 compress CPU DAIs
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

I'm not really happy with the changes inside pcm.c


On Tue, 2020-01-28 at 11:43 +0100, Cezary Rojewski wrote:
> --- a/sound/soc/sof/pcm.c
> +++ b/sound/soc/sof/pcm.c
> @@ -756,6 +756,15 @@ static void sof_pcm_remove(struct
> snd_soc_component *component)
>         snd_soc_tplg_component_remove(component,
> SND_SOC_TPLG_INDEX_ALL);
>  }
>  
> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
> +#include "compress.h"
> +
> struct snd_compr_ops sof_compressed_ops = {+
> +       .copy           = sof_probe_compr_copy,
> +};
> +EXPORT_SYMBOL(sof_compressed_ops);
> +#endif
> +

Maybe call this structure sof_probe_compressed ops. Othwerwise you will
conflict with the real sof_compressed_ops.


>  void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
>  {
>         struct snd_soc_component_driver *pd = &sdev->plat_drv;
> @@ -775,7 +784,7 @@ void snd_sof_new_platform_drv(struct snd_sof_dev
> *sdev)
>         pd->trigger = sof_pcm_trigger;
>         pd->pointer = sof_pcm_pointer;
>  
> -#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
>         pd->compr_ops = &sof_compressed_ops;
>  #endif
>         pd->pcm_construct = sof_pcm_new;
> 

Here you are breaking the non-existent yet compressed support. I would
leave:

#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
         pd->compr_ops = &sof_compressed_ops;
#endif

and only override compr_ops if SND_SOC_SOF_DEBUG_PROBES is set like
this:


#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
         pd->compr_ops = &sof_probe_compressed_ops;
#endif

Also does this mean we cannot support both "real" compressed sound card
and probes in the same time?


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
