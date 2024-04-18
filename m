Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD808A98C9
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 13:39:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 881FDE65;
	Thu, 18 Apr 2024 13:39:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 881FDE65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713440365;
	bh=lfgiUVfdfFtYYnbry1n8+JxXXsIYCYkmc2J1JwkNnRo=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=aEdvPNw39vjIDzKR3uGe4A2VdWSbyzCR3Ybxuzm28WlohTRmYfSYQR/cC5kZPz+nv
	 AgGMHkxMkogZEyCY9biCSXL2VkmS4VyGOOc64EpdacShGSTL8ZdqAqRYcrQ8OCr/6S
	 znte8jHYRb0DnK8ouulvOPAp6uxzqI6CdTVurZj4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25B60F80587; Thu, 18 Apr 2024 13:38:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22801F80568;
	Thu, 18 Apr 2024 13:38:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5491EF8025A; Thu, 18 Apr 2024 13:19:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C67C2F8013D
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 13:19:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C67C2F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iG1igice
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713439170; x=1744975170;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=lfgiUVfdfFtYYnbry1n8+JxXXsIYCYkmc2J1JwkNnRo=;
  b=iG1igicehpMe/4yKUcIu+Sa2KcnljzfqCqvf38qbNd0rW83yoRiZygR1
   Uo8S9gdtvttloqFphUi+R076NT3ZDrLYj4yWAwE59/oeUL2GbBNV5+7dF
   aPlNG6SdNjPVDW57IjwQ16y4IWOVHw0TE+lnkvDlsWcSqzTMpWF1Unwee
   uwIZzKRQzIAkNrExZ6X6EoioOD4QlM59NEvRVjRArmRoKukQ8VJ9udcWI
   Ilc3AVnzrU96fUg58JVFV8fAkmJOiARc65vEVQf2JR0Hye/tbepKJ44MQ
   DIgIyKdRUUIyoErhPZsFNXoBfXzzl5H427T/3CH9p1wT5v/B0CKNuhCZb
   A==;
X-CSE-ConnectionGUID: UBlVfaP2RGi0QLvyVTkQMg==
X-CSE-MsgGUID: 7/EIUvxARQKIUUL5KnXvyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9097496"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000";
   d="scan'208";a="9097496"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 04:19:24 -0700
X-CSE-ConnectionGUID: isirGcN4S1iK1h9wO2dd9g==
X-CSE-MsgGUID: 7OZ/fhyhQZOwpp+2HQcdxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000";
   d="scan'208";a="23008225"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 04:19:14 -0700
Message-ID: <481d5755-ac70-4a01-899d-9d39f5075350@linux.intel.com>
Date: Thu, 18 Apr 2024 13:19:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/23] ASoC: Intel: Replace playback/capture_only to
 playback/capture_assertion
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Jiawei Wang <me@jwang.link>, Jonathan Corbet <corbet@lwn.net>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, imx@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
 <87plun71db.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87plun71db.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FPEGXFA2PIO2YV7J6LR3HL4PKN6C6RMH
X-Message-ID-Hash: FPEGXFA2PIO2YV7J6LR3HL4PKN6C6RMH
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FPEGXFA2PIO2YV7J6LR3HL4PKN6C6RMH/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 4/18/2024 6:15 AM, Kuninori Morimoto wrote:
> soc_get_playback_capture() is now handling DPCM and normal
> comprehensively for playback/capture stream in same code.
> This patch converts xxx_only flag to xxx_assertion.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/intel/boards/bdw-rt5677.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
> index 54e3c5d3c251..9170b1d509e2 100644
> --- a/sound/soc/intel/boards/bdw-rt5677.c
> +++ b/sound/soc/intel/boards/bdw-rt5677.c
> @@ -339,7 +339,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
>   	{
>   		.name = "Codec DSP",
>   		.stream_name = "Wake on Voice",
> -		.capture_only = 1,
> +		.capture_assertion = 1,
>   		.ops = &bdw_rt5677_dsp_ops,
>   		SND_SOC_DAILINK_REG(dsp),
>   	},

Should this have been part of patch 8?
