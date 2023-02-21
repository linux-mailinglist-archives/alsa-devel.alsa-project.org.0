Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE7769E6CF
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 19:05:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B43DE76;
	Tue, 21 Feb 2023 19:05:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B43DE76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677002753;
	bh=ihZKaLNGSWG3qNYgbisyi+AvTv2NlMGpvPTE2WUE7c0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JJx3LF149hS1K+tn9uov7OgLahhTXclooChJBlgILfs7PagBa+btJvUqGA1vIRP+q
	 IesIfhppDm6gc+XQCCSq9m1DHy9zsLADUFC7s90e8mD5+FoHRZgcHNLciKj0AOlEa9
	 4Yot8d2T7madyn71RNKQjblfobyH9GipKiAKkfmA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C29CCF80266;
	Tue, 21 Feb 2023 19:05:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F36EF802DB; Tue, 21 Feb 2023 19:04:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0110DF800B6
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 19:04:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0110DF800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BRb4UCH7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677002696; x=1708538696;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ihZKaLNGSWG3qNYgbisyi+AvTv2NlMGpvPTE2WUE7c0=;
  b=BRb4UCH7Lxgw77Aw6QLwKAwrUL6zwk/QVSVGbkF1Pc0hgvDtX4SSGZCj
   zYOkpglIoKOYfX4Inhi2OrpOrla8tGw8omvZjnS75Z/ZIKGWCOQsc8fup
   eSQkvECeCBQpoVTg9SvffHI7fbKXSgGfy3N4+gpLagEkSwQ8CxsVat+hM
   4YXqHVJ4sivaRjPLqA/AFUoClC4JBOX3vIWj2p1+SKWYcypYgjfTtGlyv
   wLPoMBTGQptSOr3Qy+fSo23bRWWdjjcu5wuXXEfP8nWWCu7dL30EJmnZX
   50udJ9wgJA8vKuB1T57ssT8vlNX3YcRSddb/axAQrfOJrGis6YT3Q+lnr
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="397398174"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000";
   d="scan'208";a="397398174"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 10:04:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="740501480"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000";
   d="scan'208";a="740501480"
Received: from taevough-mobl.amr.corp.intel.com (HELO [10.209.174.213])
 ([10.209.174.213])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 10:04:16 -0800
Message-ID: <273e1484-0285-29b6-4852-9f5bc2d24e2a@linux.intel.com>
Date: Tue, 21 Feb 2023 13:03:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH 09/10] ASoC: Intel: sof_sdw: Add support for Cirrus Logic
 CS35L56
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org,
 cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, kai.vehmanen@linux.intel.com
References: <20230217161410.915202-1-rf@opensource.cirrus.com>
 <20230217161410.915202-10-rf@opensource.cirrus.com>
 <dfebabad-4777-b5e3-8f58-1301faf97f7e@linux.intel.com>
 <f3d70939-49e5-1da2-c104-11b370888d7c@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <f3d70939-49e5-1da2-c104-11b370888d7c@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: R2JAO5VQJR3H3JUTIGLLFEBMCYL7XI2O
X-Message-ID-Hash: R2JAO5VQJR3H3JUTIGLLFEBMCYL7XI2O
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R2JAO5VQJR3H3JUTIGLLFEBMCYL7XI2O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>> +                      card->components);
>>> +    if (!card->components)
>>> +        return -ENOMEM;
>>> +
>>> +    ret = snd_soc_dapm_new_controls(&card->dapm,
>>> +                    cs35l56_sof_widgets,
>>> ARRAY_SIZE(cs35l56_sof_widgets));
>>> +    if (ret) {
>>> +        dev_err(card->dev, "Widgets add failed: %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    ret = snd_soc_dapm_add_routes(&card->dapm, cs35l56_sof_map, count);
>>> +    if (ret) {
>>> +        dev_err(card->dev, "Map add %d failed: %d\n", count, ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    /* Enable one feedback TX per amp on different slots */
>>> +    for_each_rtd_codec_dais(rtd, i, codec_dai) {
>>> +        ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x3, 1 << i, 4, 16);
>>
>> TDM slots? Not getting how this would work with SoundWire?
>>
> 
> Strictly speaking Soundwire is TDM (the frame time is divided up into
> slots for each sample...).
> 
> The problem is if you have N amps on the dailink all feeding back audio
> on the same bus. Their DP slots are all programmed to the same positions
> in the frame, same as for the playback. So you have 4 amps all trying to
> send 6 audio channels in the same positions in the frame and you'll just
> get a ton of bus clash interrupts.
> 
> So we use the set_tdm_slot() like we do with I2S TDM to set which slots
> are active for each amp.
> 
> I can't see that there's any obvious "generic" way that the manager code
> can automatically figure out how many channels to enable on each amp and
> what order to map them, so we do it here. Just as with I2S TDM - you
> have many slots and many codecs but the machine driver has to tell it
> how to map those.

IIRC Bard did the same thing recently, and the order of the feedback
channels is really defined by the order in which the peripheral devices
are added in the dailink. See
https://github.com/thesofproject/linux/pull/4108

There's also another open related to the number of channels, we need to
patch what the CPU DAI can handle, see
https://github.com/thesofproject/linux/pull/4136 or
https://github.com/thesofproject/linux/pull/4134
