Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE908CB42C
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2024 21:23:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 246351FE;
	Tue, 21 May 2024 21:23:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 246351FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716319427;
	bh=4N/74mraQC7VEhtz55ALD01JAGltOePrtVxMK+VGzi8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZTv8ymmGFMs8LyiKlZuBS6BooSSdh/gWsQvfFLcuRgwEfYz8INsQOPpJMtIpO+SUk
	 nuTx86hrVUFfF7XS9ZlOSzaHIk3Q2IJm8ct61R1Tlx+B988RZIdRCfE76OOkck3S0c
	 ziJy2DTdjgrlV63ZYeY503HqbD5OdbGgYyF891bI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED623F805A1; Tue, 21 May 2024 21:23:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47582F805A8;
	Tue, 21 May 2024 21:23:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF8C1F8026A; Tue, 21 May 2024 21:23:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67665F800BA
	for <alsa-devel@alsa-project.org>; Tue, 21 May 2024 21:23:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67665F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eAWhrYVA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716319385; x=1747855385;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4N/74mraQC7VEhtz55ALD01JAGltOePrtVxMK+VGzi8=;
  b=eAWhrYVAyE5sz5MFa9TqIPkcTGEcdnTp49MF6q4CGEXXxgB6hS5+kZCC
   E042OH42VR7vRRi7Zsug0I8MkiMjXWEzNwH1VKZU+Wt39DMwroj/ASI+o
   FbYbrk01SJ9cL23Mr7yLHQkSqK0IxyDN0bUehfikzNBX0jZG+ORFYYp4x
   gIcuazirsRkvxW8i+CJ0QOdqd1Q+JgHK6Fsmw6PI4KwxRKYsr2gIJjJoI
   kf6hPJfSL7rerKk7i3fFQVMuxifm+03AR7t3FkubrtmVHSmJZ8a2Fnbyk
   sDBVkPKtesfkXgB6u+8k58hmHypPKJH3R4fBzQkf/V+abjdzvRZoBZmq+
   Q==;
X-CSE-ConnectionGUID: vmQ5gmUFTLaWZ08Hgn++rg==
X-CSE-MsgGUID: umurKSPZTTy5Yx0afECECQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12767852"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000";
   d="scan'208";a="12767852"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 12:22:57 -0700
X-CSE-ConnectionGUID: xkUvcTuCT9eN3cXu1ftmOA==
X-CSE-MsgGUID: HPJ2dTZTQQOdy5EU5YOyow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000";
   d="scan'208";a="37980785"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO [10.125.109.138])
 ([10.125.109.138])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 12:22:55 -0700
Message-ID: <ec063ea9-3d72-457a-9c73-46c5f5b1f6e4@linux.intel.com>
Date: Tue, 21 May 2024 11:03:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ASoC: soc-pcm: Indicate warning if CPU / Codec
 availability mismatch
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
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
 Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, imx@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <87msole5wc.wl-kuninori.morimoto.gx@renesas.com>
 <87jzjpe5vh.wl-kuninori.morimoto.gx@renesas.com>
 <77e9221e-05d2-453f-9ce1-ff4a4b53d09d@linux.intel.com>
 <87y184cbed.wl-kuninori.morimoto.gx@renesas.com>
 <7b430ea3-3ce8-4ef9-8440-bac02993f676@linux.intel.com>
 <875xv8c6dn.wl-kuninori.morimoto.gx@renesas.com>
 <3e67d62d-fe08-4f55-ab5b-ece8a57154f9@linux.intel.com>
 <1f8e6e3c-a116-48d8-991f-4184d1eebc79@sirena.org.uk>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1f8e6e3c-a116-48d8-991f-4184d1eebc79@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5QQWUMV3XSRWDRB2N5QX7VUPCL2WRJ36
X-Message-ID-Hash: 5QQWUMV3XSRWDRB2N5QX7VUPCL2WRJ36
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5QQWUMV3XSRWDRB2N5QX7VUPCL2WRJ36/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/21/24 10:12, Mark Brown wrote:
> On Tue, May 21, 2024 at 08:43:09AM -0500, Pierre-Louis Bossart wrote:
> 
>> allow me to give you another counter example, beyond the AEC reference I
>> mentioned earlier. It's not uncommon for CPU DAIs to have loopback
>> capabilities, which are used for tests on boards where the codec has no
>> capture capabilities. I think it's a feature that needs to be allowed,
>> not a 'wrong setting'.
> 
> This is something we could do properly if we had full digital routing
> rather than bolting things on the side of the CPU<->CODEC model - having
> these things where we have to take a CODEC into account even though
> we're not actually using it is one of the big issues with DPCM.

No disagreement here, these echo references and loopbacks are ugly to
support with the dependency between playback and capture directions that
isn't well handled, e.g. if someone starts to capture before playback
started.

For now we're kind of stuck, what I would suggest is just to remove the
extra check that both CPU and codec dai can support a direction, and
move on with the other cleanups suggested by Morimoto-san.
