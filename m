Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 191241AB0E8
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 21:06:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A4811663;
	Wed, 15 Apr 2020 21:06:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A4811663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586977617;
	bh=OM+wvA7Sh8VbejrMQc/rIKOcJrXcd1E0VUj/95nHd5M=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GgVkjmWB0VO9edf0xbCFvydGXQ46QWwwzRPhP9QPk0O1bdcqo+kkRxQcdKCwv8x+6
	 9EHHB5oEtYJm24afi0CII9r1twm7oF3Q9yK3y5huQOCBFLgEqQ4ECsNMUwfN5B7AwY
	 dWQoSDDBq7RrkV/zwc66atSggmdXUwm0lo2drw7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80AD2F80124;
	Wed, 15 Apr 2020 21:05:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBDF5F80245; Wed, 15 Apr 2020 21:05:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92A60F80115
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 21:05:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92A60F80115
IronPort-SDR: SGeyqciJknQElR8ymul89/fqP9BmmmCgaeuV4rT9wldvBqHNVA3x/xBMw/Tm5vyVzUaGZ2JAr9
 D2XDjGNECBzg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 12:05:04 -0700
IronPort-SDR: BrtkEpIIDmoa8GS8HAj2VZfTkBfdno2iIq8f4m9AADLxoFQlOXuycW9IO8xIAR2vMgUDksCWlP
 +58LXE4Dk1sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; d="scan'208";a="271819897"
Received: from jplam-mobl1.amr.corp.intel.com (HELO [10.209.82.197])
 ([10.209.82.197])
 by orsmga002.jf.intel.com with ESMTP; 15 Apr 2020 12:05:03 -0700
Subject: Re: [RFC TEST] ASoC: soc-dai: revert all changes to DAI
 startup/shutdown sequence
To: Mark Brown <broonie@kernel.org>
References: <20200415030437.23803-1-pierre-louis.bossart@linux.intel.com>
 <20200415172815.GJ5265@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <61692242-d22c-5923-c4ff-d9151d80ca64@linux.intel.com>
Date: Wed, 15 Apr 2020 14:05:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415172815.GJ5265@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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



On 4/15/20 12:28 PM, Mark Brown wrote:
> On Tue, Apr 14, 2020 at 10:04:37PM -0500, Pierre-Louis Bossart wrote:
> 
>> Sending as RFC since I don't have a good understanding of the
>> root-cause and for others to confirm my findings. Tested on top of
>> v5.7-rc1.
> 
> Hans?  Morimoto-san?  I'm fine with this as a fix, it's not ideal but
> I'm guessing anything more substantial is going to be unsuitable for a
> -rc series.

I looked up the code for about an hour and can't really find a better 
solution.

My only theory is that the Atom/sst driver directly uses the dai->active 
state in its .startup and .shutdown DAI callbacks, and will e.g. 
initialize the DSP with:

static int sst_enable_ssp(struct snd_pcm_substream *substream,
			struct snd_soc_dai *dai)
{
	int ret = 0;

	if (!dai->active) {
		ret = sst_handle_vb_timer(dai, true);
		sst_fill_ssp_defaults(dai);
	}
	return ret;
}

No other Intel driver uses this dai->active status. This is legacy 
2013/14 stuff from the phone days, I only have a vague memory of why 
this was used - everyone else involved at the time moved on, I am 
probably the last person standing, a scary thought in itself.

Anyways, since this .startup routine is invoked from two locations:

sound/soc/soc-dapm.c:           ret = snd_soc_dai_startup(source, 
substream);
sound/soc/soc-dapm.c:           ret = snd_soc_dai_startup(sink, substream);
sound/soc/soc-pcm.c:            ret = snd_soc_dai_startup(dai, substream);

we end-up using three booleans (dai->active, dai->started[0], 
dai->started[1]) to control what happens in the .startup callback, so we 
probably end-up in an undefined state.

I don't see an alternative to a revert here, we should probably clarify 
why we startup the dai in multiple locations and do something better for 
5.8.

-Pierre

