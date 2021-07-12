Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 960CC3C6580
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jul 2021 23:33:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2454A16CD;
	Mon, 12 Jul 2021 23:32:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2454A16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626125622;
	bh=0C+0DOdt32d4p310omnQ4dSRthZX12SNFF58KxMSvRQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NzZvBtLYQ4YRXb9ndpazmwAOmBwbPKfXHpge5X1gZXQlyCbmDkIcVuxxz+3o2BBKy
	 aGxjrn4RR9y1E1959pxvGDbACBPrJMjWJICJXnPYPDWwVPU+dVSJm+VcN6v6uqP7TV
	 6liWQ+mlbd/O8FCw3RjQH0+gPsB2nNfj7TjmF9kI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ADA4F80254;
	Mon, 12 Jul 2021 23:32:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FEC9F8025B; Mon, 12 Jul 2021 23:32:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 517B6F80253
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 23:32:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 517B6F80253
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="210101177"
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="210101177"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 14:32:06 -0700
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="492286017"
Received: from yangbosh-mobl3.amr.corp.intel.com (HELO [10.212.95.167])
 ([10.212.95.167])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 14:32:05 -0700
Subject: Re: [PATCH 8/8] ASoC: SOF: Intel: add .ack support for HDaudio
 platforms
To: Takashi Iwai <tiwai@suse.de>
References: <20210610205326.1176400-1-pierre-louis.bossart@linux.intel.com>
 <20210610205326.1176400-9-pierre-louis.bossart@linux.intel.com>
 <s5h35tm5ij5.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <de5e91c6-5f0e-9866-a1c2-0943b4342359@linux.intel.com>
Date: Mon, 12 Jul 2021 16:30:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <s5h35tm5ij5.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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



>> +/* update SPIB register with appl position */
>> +int hda_dsp_pcm_ack(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream)
>> +{
>> +	struct hdac_stream *hstream = substream->runtime->private_data;
>> +	struct hdac_ext_stream *stream = stream_to_hdac_ext_stream(hstream);
>> +	struct snd_pcm_runtime *runtime = substream->runtime;
>> +	ssize_t appl_pos, buf_size;
>> +	u32 spib;
>> +
>> +	if (!hda_disable_rewinds)
>> +		return 0;
>> +
>> +	/*
>> +	 * paranoia check: if a rewind request took place after the RUN bits were programmed,
>> +	 * deny it since hardware only supports monotonic (modulo) increments for SPIB.
>> +	 */
>> +	if (hstream->running) {
>> +		if (runtime->control->appl_ptr < stream->old_appl_ptr)
>> +			return -EINVAL;
> 
> This condition won't be enough when the appl_ptr overlap the buffer
> boundary.  It's still possible on 32bit architecture.

And I missed this feedback as well...I only replied at the comments on module parameters/KConfig/controls/new API.

Takashi, is this saying that on 32-bit architectures there's no way to make the difference in the .ack implementation between
- regular rewind and forward after the buffer max boundary
- regular forward and rewind before the buffer zero boundary

If that was the case, the proposal made in this patch to validate the rewind with the .ack wouldn't work, we would have to go back to a filter in snd_pcm_rewind similar to what was initially suggested in [1]

[1] https://lore.kernel.org/alsa-devel/1494896518-23399-2-git-send-email-subhransu.s.prusty@intel.com/
