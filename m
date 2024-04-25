Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B798B2CA7
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 00:06:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5184F21B4;
	Fri, 26 Apr 2024 00:06:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5184F21B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714082778;
	bh=o9KSTJFxVxkC/2zpLND+WBnpa99h44cUt3h8M5U7thQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BQCyMf0i6E24jLw33OUmL/Da0USJgB/15LIMr9128JQ+MZQipIGKMSn3LXNdZekUc
	 ViF9amWzCYV1hlXTVTrF0deEJYBYu65TluJC1qQf7fP96UgGr2ctDsAnE773sDDbSH
	 gV/I9emisETY5Hl1BlQNBJ07tEsyjeX0VX+7dz44=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E785F805A0; Thu, 25 Apr 2024 23:59:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 523C4F805D3;
	Thu, 25 Apr 2024 23:59:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A236F8057B; Thu, 25 Apr 2024 23:59:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8AAE6F80568
	for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2024 23:59:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AAE6F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=e0FEs9Cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714082350; x=1745618350;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=o9KSTJFxVxkC/2zpLND+WBnpa99h44cUt3h8M5U7thQ=;
  b=e0FEs9CzJlxXJAOliRNfcQ4aT79+VoxiGChfYIn6/CMASyFgKYXqRZug
   g6+m9QKnktDr/wQyiUUl1aF9ixbgq4OsZzs9DMTNvnKnGfsCSRIIKTj+t
   tgn5KjHF6StXjZ+UQZKruQqJ5tWOyYk7hib0EARjiZPOT323YnR4ocVHw
   +7pjMhCbO5HnvbCTkWs4h8XpdYtmg+YUXHDjAnKKadwcx/uXBPI++Nxzv
   pvijoNU9k641WiZf60iGl7upuHIt1bgEN7Q1+qAvfn609hockhB6IRFqo
   hryEC16G1gaQperAYmodey/EMD6U5SoEGtxXqmrxV/CI5mNbKxvIDp1fN
   A==;
X-CSE-ConnectionGUID: x5aF17fITpSCB4teCuVBZg==
X-CSE-MsgGUID: kIqF3Ri9TFS78mk/RK+qRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20355665"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000";
   d="scan'208";a="20355665"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 14:59:06 -0700
X-CSE-ConnectionGUID: 2Qq/ilTSTEC7XEdh5FlKFg==
X-CSE-MsgGUID: g08zHUITSoyoXKghXI76bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000";
   d="scan'208";a="25222489"
Received: from mhillikx-mobl.amr.corp.intel.com (HELO [10.212.81.51])
 ([10.212.81.51])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 14:59:05 -0700
Message-ID: <bdf31350-1f99-4588-8d6d-f4b9c8bad96f@linux.intel.com>
Date: Thu, 25 Apr 2024 16:59:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/23] ASoC: soc-pcm: cleanup
 soc_get_playback_capture()
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
References: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
 <87frvj8g2v.wl-kuninori.morimoto.gx@renesas.com>
 <a1f63065-6d8a-404f-b4be-331d829f802f@linux.intel.com>
 <87ttjytayy.wl-kuninori.morimoto.gx@renesas.com>
 <92054f87-dded-4b66-8108-8b2a10909883@linux.intel.com>
 <87edaym2cg.wl-kuninori.morimoto.gx@renesas.com>
 <93294e52-97e5-4441-a849-867429da6573@linux.intel.com>
 <87h6fsisn8.wl-kuninori.morimoto.gx@renesas.com>
 <87plueovm1.wl-kuninori.morimoto.gx@renesas.com>
 <f65efc7b-d268-4b39-8665-5c4fe8e3ca1a@linux.intel.com>
Content-Language: en-US
In-Reply-To: <f65efc7b-d268-4b39-8665-5c4fe8e3ca1a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4GZ7TVSW47OWIQ2DROUM2KDHHE2CBDGH
X-Message-ID-Hash: 4GZ7TVSW47OWIQ2DROUM2KDHHE2CBDGH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4GZ7TVSW47OWIQ2DROUM2KDHHE2CBDGH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>> But because we have been used dpcm_xxx for 10 years since (B),
>> I understand to feel anxious to suddenly remove dpcm_xxx.
> 
> Indeed we err on the side of paranoia with such changes!
> 
>> I think it should be removed anyway, but want to have grace time ?
>> If so, the idea is that we can use it as "option flag" instead of
>> "mandatory flag" for a while, like below
>>
>> 	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
>> 		playback = (cpu_dai->driver->playback.channels_min > 0) ||
>> 			   rtd->dai_link->dpcm_playback;
>> 		capture  = (cpu_dai->driver->capture.channels_min  > 0) ||
>> 			   rtd->dai_link->dpcm_capture;
>>
>> * maybe we want to indicate message like "place re-check the flag and
>>   remove it" via dev_info() if dpcm_xxx flag was used ?
>>
>> I think +2 kernel version or so is enough for grace time ?
>> After that, we can remove dpcm_xxx flag.
> 
> I am good with that plan, but I'll need to investigate first why we had
> a failure with one of the Chromebooks on this v3 patchset. That may give
> us some insights on "special" uses of those flags.

I found the reason why this patchset failed on Intel CI: a dailink
direction is deemed supported only if ALL cpu- and codec-dais support it.

That is a stricter criterion than in existing code. This was a good
intention based on symmetry, but in practice there are exceptions to the
rule...

On some Chromebooks, we tag a dailink as supporting capture for echo
reference, but that echo reference is generated by the Intel firmware.
The amplifiers only support playback.

see https://github.com/thesofproject/linux/pull/4937 for details, I
added a clear log:

[  807.304740] kernel:  SSP1-Codec: CPU dai SSP1 Pin supports capture
but codec DAI rt1011-aif does not

So I think for now we probably want to avoid this stricter criterion and
only check the supported direction with the cpu-dais. Or we add an
escape mechanism to let the core know that the capture support was
intentional.

Also we relax the checks to go back to (E)
4f8721542f7b75954bfad98c51aa59d683d35b50
("ASoC: core: use less strict tests for dailink capabilities")

"
This patch modifies the snd_soc_dai_link_set_capabilities() helper so
that the dpcm_playback (resp. dpcm_capture) dailink capabilities are set
if at least one [cpu-]dai supports playback (resp. capture).
"

We tried checking all cpu-dais before and found issues, so "at least one
cpu dai" seems the strictest test to apply without breaking legacy.
