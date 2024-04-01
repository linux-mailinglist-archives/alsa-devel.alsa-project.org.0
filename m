Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C3689409C
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 18:32:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E8E82341;
	Mon,  1 Apr 2024 18:31:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E8E82341
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711989128;
	bh=X6o+CiRuRbPSoFA1uNV4CraaV9Ro04bAs5btj8iowP0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=DznCclKFvunN3Grv0SocB2aPtDcp9Af4VHXkp+VX5e3PTswdpSoIsolA2/xRPc6zO
	 j9XhAdDEGfNvkVYDvS6asD613MuvSTa6K1EwcqRdVq+BFxGC+WoMaFWi7VhRaQLIxL
	 7zS+b5aGrusfZIpvDCIy3zluPYMXPvVHWFMQFiHc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98F8DF805F2; Mon,  1 Apr 2024 18:31:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F079F805F5;
	Mon,  1 Apr 2024 18:31:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0FA2F8055C; Mon,  1 Apr 2024 18:30:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E544F80236
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 18:30:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E544F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QIJ38AlZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711989050; x=1743525050;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=X6o+CiRuRbPSoFA1uNV4CraaV9Ro04bAs5btj8iowP0=;
  b=QIJ38AlZvcUdUOlXTUo710bIu9YN8jFCv5rxNLiFuw0VWK9dXE4tTTbw
   6RuPdAckgiBOZwNdfwXuC2zDmX7cCzBoXS6XVNyb3/bjtKKWddWXYHMLe
   qE4/FdQvfP9dM5fpmZt/fYneomY9tUaO+T+X3EIIYpKKXxkLWtAaaulBA
   zpL3h0a/psT97MOKwz5RpMwPyhbkYBJ2Rd/zCO+pIDLK9zixvkBrziRvS
   /fpoBVBFYbkVSo7AJUyWRA4lunHeONzUhymYa08xWiD9tY/jArH9edEPO
   wz3z5S8/iDocouO1MhMXPSj/ozuI3P+Wqhi22BKaSqrWQoYKNlhOjl+dR
   g==;
X-CSE-ConnectionGUID: hjwm6ltjToiAJse9itLcHw==
X-CSE-MsgGUID: f73mKAsoSIeEYrCUsCybdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="10083752"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000";
   d="scan'208";a="10083752"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 09:30:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000";
   d="scan'208";a="18224587"
Received: from anahar-mobl.amr.corp.intel.com (HELO [10.212.2.239])
 ([10.212.2.239])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 09:30:43 -0700
Message-ID: <1a42ebbb-1e1f-4ecf-a1ec-7af292f7ff96@linux.intel.com>
Date: Mon, 1 Apr 2024 11:22:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/16] ASoC: soc-core: Replace dpcm_playback/capture to
 playback/capture_only
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>,
 Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, alsa-devel@alsa-project.org,
 imx@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
 <87msqdudn7.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87msqdudn7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OXPGRO4MFPTMCGUHD54QKYSGXSOXAKCS
X-Message-ID-Hash: OXPGRO4MFPTMCGUHD54QKYSGXSOXAKCS
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OXPGRO4MFPTMCGUHD54QKYSGXSOXAKCS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/31/24 19:31, Kuninori Morimoto wrote:
> soc_get_playback_capture() is now handling DPCM and normal comprehensively
> for playback/capture stream. We can use playback/capture_only flag
> instead of using dpcm_playback/capture. This patch replace these.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---
>  sound/soc/soc-core.c | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 3ab6626ad680..b168cf642092 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2000,25 +2000,7 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
>  				dai_link->platforms->name = component->name;
>  
>  			/* convert non BE into BE */
> -			if (!dai_link->no_pcm) {
> -				dai_link->no_pcm = 1;
> -
> -				if (dai_link->dpcm_playback)
> -					dev_warn(card->dev,
> -						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_playback=1\n",
> -						 dai_link->name);
> -				if (dai_link->dpcm_capture)
> -					dev_warn(card->dev,
> -						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_capture=1\n",
> -						 dai_link->name);
> -
> -				/* convert normal link into DPCM one */
> -				if (!(dai_link->dpcm_playback ||
> -				      dai_link->dpcm_capture)) {
> -					dai_link->dpcm_playback = !dai_link->capture_only;
> -					dai_link->dpcm_capture = !dai_link->playback_only;
> -				}
> -			}
> +			dai_link->no_pcm = 1;
>  
>  			/*
>  			 * override any BE fixups

Not following this last change either, the code used to be conditional

                        /* convert non BE into BE */
			if (!dai_link->no_pcm) {
				dai_link->no_pcm = 1;

and not it's unconditional

                        dai_link->no_pcm = 1;

It's not clear to me how this is related to the
dpcm_playback/dpcm_capture removal.
