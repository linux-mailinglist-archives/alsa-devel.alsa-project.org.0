Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4BB8940A7
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 18:32:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 975552408;
	Mon,  1 Apr 2024 18:32:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 975552408
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711989158;
	bh=eTX/7NaNoXDzfyhrzqmm6Ups4VgCiQZr26N1KsucA/U=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=T99qE9DkoDgyxwhjmwNVKLyxBXfKh5WFn6wOqTjm2P2KZtb7SRHB5j+2VXBHrAFQ4
	 oL0+KQgHXX6E3uVPCliEBt6vy68hmksLegIqvYVfvAtVkExdxYUsifeevMb4iZj3SK
	 Xja5pEthpVBMfFqmT/9AF9HvHbFnMMnnulPvXjto=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CAFFF80571; Mon,  1 Apr 2024 18:31:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B0F2F80638;
	Mon,  1 Apr 2024 18:31:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFFB9F805C4; Mon,  1 Apr 2024 18:31:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E48DF80238
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 18:30:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E48DF80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=j3csYqDk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711989051; x=1743525051;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=eTX/7NaNoXDzfyhrzqmm6Ups4VgCiQZr26N1KsucA/U=;
  b=j3csYqDkx+ZBl6a8emvTC5CX+Tw3zq96Bn/ZZlkmwi3+wcLmz1pIDyAq
   mXVPklR9HaXsOWhFHKvBe0TKfEirDT6iK/scCeWCmsv4G+ThzA5zl5D3b
   w3z7bIJ9nan9fKM39mw9FmJpLUNreGzPnmnKb7KMVu8h9gYgeuQRf3cpI
   LfUEUs42N0jKDDdDmRUxaoa1qNbQZ+KEkHJLiD+PZ36OxddIn62sk2dbx
   lXvS1qs5awPMoMLLoXoiFeC+BmtkBOqTl2Bpixnp5FJzfDz6/84SyAKKx
   K3u/oFS2h32YM2F1AnRDSS6AatmUndKeHRrQCfQiUTzvDCKKRksoRMIVP
   Q==;
X-CSE-ConnectionGUID: frho7VdkSmiEybNd6zHylQ==
X-CSE-MsgGUID: 5N+7Brm7QOKhQpgS3u06gw==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="10083783"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000";
   d="scan'208";a="10083783"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 09:30:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000";
   d="scan'208";a="18224594"
Received: from anahar-mobl.amr.corp.intel.com (HELO [10.212.2.239])
 ([10.212.2.239])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 09:30:47 -0700
Message-ID: <54ace545-8cdc-49aa-8214-5f07bee0e2f6@linux.intel.com>
Date: Mon, 1 Apr 2024 11:26:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/16] ASoC: remove snd_soc_dai_link_set_capabilities()
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
 <87h6gludmj.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87h6gludmj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MPZAERGNAWTFBCNIKXULHVJ5T4V2SDXY
X-Message-ID-Hash: MPZAERGNAWTFBCNIKXULHVJ5T4V2SDXY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MPZAERGNAWTFBCNIKXULHVJ5T4V2SDXY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/31/24 19:32, Kuninori Morimoto wrote:
> snd_soc_dai_link_set_capabilities() checks all CPU/Codec DAI (Y)(Z)
> for Playback/Capture (X) and checks its validation (A), and setup
> dpcm_playback/capture flags (a).
> 
> 	void snd_soc_dai_link_set_capabilities(...)
> 	{
> 		...
> (X)		for_each_pcm_streams(direction) {
> 			...
> (Y)			for_each_link_cpus(dai_link, i, cpu) {
> 				...
> (A)				if (... snd_soc_dai_stream_valid(...)) {
> 					...
> 				}
> 			}
> (Z)			for_each_link_codecs(dai_link, i, codec) {
> 				...
> (A)				if (... snd_soc_dai_stream_valid(...)) {
> 					...
> 				}
> 			}
> 			...
> 		}
> 
> (a)		dai_link->dpcm_playback = supported[...];
> (a)		dai_link->dpcm_capture  = supported[...];
> 	}
> 
> This validation check will be automatically done on new
> soc_get_playback_capture(). snd_soc_dai_link_set_capabilities() is no
> longer needed. Let's remove it.

Humm, this is really hard to review.

soc_get_playback_capture() used to do a verification of the match
between dailink and dais, and now it doesn't have it any longer and this
patch removes the checks?

