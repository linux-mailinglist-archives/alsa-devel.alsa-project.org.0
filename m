Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 337AD25D540
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 11:37:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF9281AF9;
	Fri,  4 Sep 2020 11:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF9281AF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599212249;
	bh=ZdHfR51xTZqj/wKjInIbSf7hwSoIOCbabwFDy8sREQs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D4UBdCtrPXLo7iaX/Nv3drMiFjgYep6QywXdbqt2AEVlIbX3z2tBPdk0cyJf63WjL
	 9zi5tf9YQGHIfHzJKOjPWocUFoMMqQKDxfRe8/PyhvNNmi+MFDi0mW2Toit7Gk5ks/
	 jO8PkD8pLS4LxYRNVrpqvwjMAJyYQQfliIU1fIyo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D86E6F801DA;
	Fri,  4 Sep 2020 11:35:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7119FF8024A; Fri,  4 Sep 2020 11:35:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAE4EF800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 11:35:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAE4EF800F0
IronPort-SDR: Vn8AYkj6gVFAaQvZ1u8NAbD1FMpcA6mnppTs6VyMjOwgN5VURdHH7RkocUEDdhJgSE953SxB+g
 vYOcgqzZoAmg==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="156980602"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="156980602"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 02:35:32 -0700
IronPort-SDR: Y1WOmM1Dhvgz5S9ctMQvq4G6ofkhKHd1szetLwNvv6IkMMjAaD760f68GdOSQOyH6oxNAeGOQd
 Tejvb6yrCggg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="447246232"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.13.55])
 ([10.213.13.55])
 by orsmga004.jf.intel.com with ESMTP; 04 Sep 2020 02:35:30 -0700
Subject: Re: [RFC] soc_pcm_open: error path behavior change since v5.6
To: Mark Brown <broonie@kernel.org>
References: <48810933-41cf-265c-1784-2e2acf979720@intel.com>
 <20200903131633.GA4771@sirena.org.uk>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <f9a67925-046c-69d4-bc55-5d5e24d75425@intel.com>
Date: Fri, 4 Sep 2020 11:35:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200903131633.GA4771@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>
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

On 2020-09-03 3:16 PM, Mark Brown wrote:
> On Thu, Sep 03, 2020 at 10:31:35AM +0200, Cezary Rojewski wrote:
> 
>> Some time ago negative-tests found out that behavior of soc_pcm_open has
>> changed, quite sure this might be a regression hence my email. Till v5.6
>> soc_pcm_open was invoking ::shutdown() for cpu_dai in error path only if
>> ::startup() succeeded first (label: 'out'). After addition of commit:
> 
> Please don't invent new notation that nobody else uses, it just makes
> your messages harder to read.
> 
>> Should dai's ::shutdown() be introducing some kind of state-check from now
>> on? - similarly to how developers deal with some of the core pcm operations
>> e.g.: ::prepare() (as it may get invoked multiple times in a row so check is
>> there to prevent redundancy).
> 
> If there are stateful things it's probably better to do that from a
> robustness point of view whatever is going on.
> 
>> Or, perhaps behavior change should be reverted with ::shutdown() routine
>> again being called only after successful ::startup()?
> 
> IIRC part of the thinking there was that we were getting the keeping
> track part of things wrong and sometimes missing things that should be
> being shut down in error paths.  Anything that tries to stop extra calls
> would need to be very clearly robust and easily maintainable.
> 

I'm sorry if my explanation was somewhat lackluster. In fact, thread's 
name is misleading too -> regression sincec v5.7, not v5.6. Comparison 
of code pieces found below should make it clearer:

v5.6 soc_pcm_open:
https://elixir.bootlin.com/linux/v5.6.19/source/sound/soc/soc-pcm.c#L534

static int soc_pcm_open(struct snd_pcm_substream *substream)
{

(...)

	/* startup the audio subsystem */
	ret = snd_soc_dai_startup(cpu_dai, substream);
	if (ret < 0) {
		dev_err(cpu_dai->dev, "ASoC: can't open interface %s: %d\n",
			cpu_dai->name, ret);
		goto out;
	}

	ret = soc_pcm_components_open(substream, &component);
	if (ret < 0)
		goto component_err;

	for_each_rtd_codec_dai(rtd, i, codec_dai) {
		ret = snd_soc_dai_startup(codec_dai, substream);
		if (ret < 0) {
			dev_err(codec_dai->dev,
				"ASoC: can't open codec %s: %d\n",
				codec_dai->name, ret);
			goto codec_dai_err;
		}

(...)

codec_dai_err:
	for_each_rtd_codec_dai_rollback(rtd, i, codec_dai)
		snd_soc_dai_shutdown(codec_dai, substream);

component_err:
	soc_pcm_components_close(substream, component);

	snd_soc_dai_shutdown(cpu_dai, substream);
out:
	mutex_unlock(&rtd->card->pcm_mutex);


-

Now the equivalent from newer kernel e.g. v5.8:
https://elixir.bootlin.com/linux/v5.8.6/source/sound/soc/soc-pcm.c#L711

static int soc_pcm_open(struct snd_pcm_substream *substream)
{

(...)

	/* startup the audio subsystem */
	for_each_rtd_dais(rtd, i, dai) {
		ret = snd_soc_dai_startup(dai, substream);
		if (ret < 0) {
			dev_err(dai->dev,
				"ASoC: can't open DAI %s: %d\n",
				dai->name, ret);
			goto config_err;
		}

		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
			dai->tx_mask = 0;
		else
			dai->rx_mask = 0;
	}

(...)

config_err:
	for_each_rtd_dais(rtd, i, dai)
		snd_soc_dai_shutdown(dai, substream);

-

Let's assume we have 10 dais. In newer kernels, if snd_soc_dai_startup() 
fails at i=5, error path will attempt to perform snd_soc_dai_shutdown() 
for all dais (all 10) regardless if respective dai was opened or not. 
This is a clear behavior change when compared to v5.6 where cpu_dai was 
cleaned-up only if it was previously started successfully. Due to usage 
of for_each_rtd_codec_dai_rollback macro, the same applies to codec_dais.

Czarek
