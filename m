Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7208988ED
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 15:38:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07E272C8E;
	Thu,  4 Apr 2024 15:38:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07E272C8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712237895;
	bh=O2FCZHFbVWkFqB1QcGwdd1JkWBZ9ekBrh/mg+gockjc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z3bEgzX2RmgsW3+PYgvIKN8ULygSCipRSHvC5B7db2eYoSUbwC3WUVeS5V89DaSS8
	 Nv6qTXTCHEe1BNsMvdQqkpZJlK1qxOogTsjHbGNcS69MChodbQa/SAyAeOKIKoFxM/
	 I1NmtMnzeMh4WBocqs9hFQvD+hRjyyQEJoVXzRhw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9AA6F8057F; Thu,  4 Apr 2024 15:37:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E6FEF8057B;
	Thu,  4 Apr 2024 15:37:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33BB2F8016E; Thu,  4 Apr 2024 15:32:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 316CCF80007
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 15:28:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 316CCF80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FatHKcD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712237288; x=1743773288;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=O2FCZHFbVWkFqB1QcGwdd1JkWBZ9ekBrh/mg+gockjc=;
  b=FatHKcD5YjsaY4w5GqGmwk1rdKWTu3ZX+wmNjYGtObWYd6sHdCrgcq14
   /QdWcV8Yz8YQcviqSj8yqRS1tjKhQLZTLtEq8RmyDl+MjzcsLFO6Yl1iw
   E9fnCO6CyBwNWs2WlsTpDyjcBK4Spngo31VBenZTA0ZmSUAE99OgiavrQ
   YKO+8kDoPzDA8qn59IcAhyUGtwzLYBk5eEVlHLYTTXxZiDXBLG1w5J5Ge
   YL/3fwKwFzrjyYV1D6H2Hgtiql23+uUzgXMSA8dPUI8DT+WVkINaghUx9
   tLObjnJ7UtTBsOA9RbDH67qKm5LOlzqAOTITmsfdYeV71w1KSOJN9QYJ3
   A==;
X-CSE-ConnectionGUID: DtrPQcu9Ta2SrlNAZomfsQ==
X-CSE-MsgGUID: L7jPmqFaQbuegKzLvYBi0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7385551"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000";
   d="scan'208";a="7385551"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 06:28:00 -0700
X-CSE-ConnectionGUID: sp3ox9/wRG+HXpegDZH/cQ==
X-CSE-MsgGUID: 2kE90uPZQRaWPfZtXz0Ytg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000";
   d="scan'208";a="23436766"
Received: from libintan-mobl.amr.corp.intel.com (HELO [10.213.164.95])
 ([10.213.164.95])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 06:27:58 -0700
Message-ID: <40e23972-6745-48e2-81ae-4b93f2ee2dcc@linux.intel.com>
Date: Thu, 4 Apr 2024 08:27:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] ASoC: soc-pcm.c: cleanup
 soc_get_playback_capture()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
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
 <87y19xudor.wl-kuninori.morimoto.gx@renesas.com>
 <b4b37541-b67f-4593-9fd5-fc6242a0673a@linux.intel.com>
 <87zfuc7gya.wl-kuninori.morimoto.gx@renesas.com>
 <600cef67-ad90-4b67-8da7-2006339d430b@linux.intel.com>
 <874jch99m5.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <874jch99m5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5JDR7QQ4DP6XGRPZ5TLQCFHGGFE6BKIA
X-Message-ID-Hash: 5JDR7QQ4DP6XGRPZ5TLQCFHGGFE6BKIA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5JDR7QQ4DP6XGRPZ5TLQCFHGGFE6BKIA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/3/24 20:53, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis
> 
> Thank you for your feedback.
> I could understand your comment 80%, but not yet 100%
> 
>> With the older code, if the dpcm_playback was set for the dailink but
>> there isn't any dai connected to support playback, an error was thrown.
>>
>> With the new code, if playback_only is set but there isn't any dai
>> connected, there is no error thrown, is there?
> (snip)
>> Again we had a verification that if the dpcm_playback was set at the
>> dailink level, it was actually supported by the dais.
>>
>> We seem to have lost this verification. We only have an error when there
>> are no settings at all.
> 
> Pseudo code of new soc_get_playback_capture() is like this
> 
> 	soc_get_playback_capture(...)
> 	{
> 		...
>  ^		for_each_rtd_ch_maps(...) {
>  |			...
> (A)			has_playback = xxx;
>  |			has_capture  = xxx;
>  v		}
> 
>  ^		if (dai_link->playback_only)
>  |			has_capture = 0;
> (B)
>  |		if (dai_link->capture_only)
>  v			has_playback = 0;
> 
>  ^		if (!has_playback && !has_capture) {
> (C)			dev_err(...);
>  v			return -EINVAL;
> 		}
> 		...
> 	}
> 
> In old/new soc_get_playback_capture(), has_xxx will be set at least
> if one of rtd connected DAI can handle playback/capture.
> In new code, it will be handled at (A).
> 
> And unneeded has_xxx will be removed if xxx_only was set (B)

The problem is that we have two sources of information

1) the dais included in the dailink (the (A) part above)
2) the dailink itself (the (B) part above)

the code in A) constructs the information from the ground-up, but it's
overridden by B).

You can view it as 'removing unneeded has_xxx' flags, but it's also a
problem is the dailink information is incorrect...

In the past we would report an error if the dailink was not aligned with
the dais. Now we just ignore the dai information.

That's the concern, we're changing the behavior.

> Then, if neither has_xxx was set, it will be error (C)

That's not the concern. The concern is a discrepancy between A) and B).

> 
> 	In new code, if playback_only is set but there isn't any dai
> 	connected, there is no error thrown, is there?
> 
> If playback_only was set, has_capture will be removed at (B).
> And if DAI was not playback-able, this means has_playback was not set at (A).
> In such case, (C) will indicate error. Same things happen if capture_only too.
> 
> So, old functions validation still exist in my opinion, but am I
> misunderstanding ?
> 
> One note here is that in DPCM case, old function checks CPU only,
> but new function checks both CPU and Codec.
> 
> 2nd note is that in current version of patch-set, if dai_link doesn't
> have xxx_only settings (= it should have both playback/capture), but if
> DAI has has_playback or has_capture only, it can't detect about it.
> I suggested it in previous mail, and will fix in v3
> 
>> The point is that these flags are sometimes set in the machine driver,
>> sometimes set in the framework, and the open is which one has the priority.
> 
> I couldn't understand this.
> 
> I think "machine driver" = CPU/Codec driver, but what is "these flags"
> which is sometimes set in machine driver, and sometimes set in framework ??
> dpcm_xxx ? xxx_only ?? I don't think framework set these...

The has_xxx flag is set based on dai capabilities in (A) - which I call
"the framework" OR by the machine driver setting the
playback_only/capture_only flags, then used in (B) to override (A).

When you have two sources of information competing to set a state, we
have to be really careful on which one has priority/precedence.
