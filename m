Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA748CB0F8
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2024 17:05:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3868826;
	Tue, 21 May 2024 17:05:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3868826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716303922;
	bh=QH+jxpZJ7+q25EINDFGxXNJP1mlcv08ZKRhlur3HLdU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ctohUCp7Hl10hnSKCVuy5VNFWTG85bTBQFbrfbPfuPj1B8q6itu4ljYVaSE/Vw2YP
	 fm9WSeL0pWJLjCsSylSq1uh1grWlNSNMkEGxtURTguCuGSnS0FC3BJ2Bspe3S9Yu0T
	 BAvPWPR10xKbOQAjsO2AlV4tyUkmRyJ8V9rBmuKk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53276F805C5; Tue, 21 May 2024 17:04:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39218F805D3;
	Tue, 21 May 2024 17:04:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 693B2F8026A; Tue, 21 May 2024 17:04:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E290F80051
	for <alsa-devel@alsa-project.org>; Tue, 21 May 2024 17:04:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E290F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lI0JRwtr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716303857; x=1747839857;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QH+jxpZJ7+q25EINDFGxXNJP1mlcv08ZKRhlur3HLdU=;
  b=lI0JRwtrD3GeDmHpm2jbsWufyCtR1/kJEPpxhv1pAvrx8iHRix3b33dS
   ve2oyHYNTSZm7jiU29oQjgSdGgCsszlOXeC048K//iCgSQ+9bd7ZLWipx
   Cr1J6+vAU6o+qaBzv+lGq658jFdIUt4GmSSbuWETL4iuaaGOiTTu4Q9z4
   RPRqN8cVmUz6VrEqLJ7IqPZHG8vJPkYQpNlzgROrA33XqED62kqRuPYv1
   czFNnotDvfwTSoDTLG2GZpd2XgQ3T9ivgfz+JREkbC5hAWQCMr9dt6uwa
   SRIhNNEjVNhKd5nJNFEIW1EiWwKxA9IuiJIabh960DFUOoxdO3LvMvL5q
   w==;
X-CSE-ConnectionGUID: rX/MA2MdSmaAuqJYygWM+w==
X-CSE-MsgGUID: 6mnIUGl2S8+WOr9auqtilA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="16343165"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000";
   d="scan'208";a="16343165"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 08:04:07 -0700
X-CSE-ConnectionGUID: M2q3kxPiQWuVHkmLFXUSjA==
X-CSE-MsgGUID: o4ITyljUTQKDVHRYws8yvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000";
   d="scan'208";a="33369001"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO [10.125.109.138])
 ([10.125.109.138])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 08:04:04 -0700
Message-ID: <3e67d62d-fe08-4f55-ab5b-ece8a57154f9@linux.intel.com>
Date: Tue, 21 May 2024 08:43:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ASoC: soc-pcm: Indicate warning if CPU / Codec
 availability mismatch
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
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
 Mark Brown <broonie@kernel.org>, Maso Huang <maso.huang@mediatek.com>,
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
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <875xv8c6dn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YQC5DUCYNXFDXQ24HC462LW7JNOKXI76
X-Message-ID-Hash: YQC5DUCYNXFDXQ24HC462LW7JNOKXI76
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YQC5DUCYNXFDXQ24HC462LW7JNOKXI76/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/20/24 20:15, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis, Mark
> 
>> We cannot change the Maxim amplifier driver, it's used in a variety of
>> usages and platforms, and there's no reason to create a fake capture dai
>> just to reflect the use of a capture stream on the CPU side on some
>> Chromebooks.
> 
> Why cannot ??
> There is no effect to user if Maxim driver has full channel setting same as
> dammy DAI. It will be handled together with CPU, and system gets CPU
> channels as-is.

That would be changing the meaning and purpose of a 'dummy dai'

A 'dummy dai' has historically been used when data was
transmitted/received but the control of that DAI was done externally
with a sideband interface.

Here there is just no hardware for capture in the Maxim amp.

Adding a pretend DAI for the sake of adding a stricter 'sanity check'
does not sound good to me.

>> I don't disagree that the unconditional use of dpcm_capture isn't very
>> elegant, but it is what it is. This platform has been around since 2019
>> and still has about 6 or 7 years of support, so we can't break it with
>> stricter criteria.
> 
> My opinion is that working without channels settings is wrong.
> I can understand that it was working in long years, but it is working with
> wrong settings. So justify a wrong-settings is not good idea for me.
> And I don't think it is stricter criteria, it becomes *sane* criteria, IMO.
> 
> Because it was working with wrong-settings, we need to makes it sane.
> This is the reason why it has grace time.

allow me to give you another counter example, beyond the AEC reference I
mentioned earlier. It's not uncommon for CPU DAIs to have loopback
capabilities, which are used for tests on boards where the codec has no
capture capabilities. I think it's a feature that needs to be allowed,
not a 'wrong setting'.
