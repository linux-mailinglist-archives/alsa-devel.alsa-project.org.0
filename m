Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5694E82C84
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 09:23:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDDA5167A;
	Tue,  6 Aug 2019 09:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDDA5167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565076187;
	bh=9lnLPbuSXvMOhcMryQdJ8hGz3+/FsrzkDRAI12vc/Ls=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HfE75LhWrS1lGcbopqdQ+ss+cOkIQiLJdmIuKdTw5UJgttZYcF8srB7JX0IEGFTl8
	 HE4ZiMtWNYQSetv1Y54gdyqstbffuuoaGDvM5Ekq7tjmPkaeARrZmTutKWkPhTD9DM
	 zb8Kos6lY8luy0ZdJ4HHidjLFy4ifiiCbk/Wpl2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2295FF80483;
	Tue,  6 Aug 2019 09:21:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FE8AF80483; Tue,  6 Aug 2019 09:21:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE022F8011B
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 09:21:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE022F8011B
IronPort-SDR: VrU+hO6gOEx35WSHrNMq6/+v3LCHaJFPKzP/sCHCvHW8Nk/ySWs3fBn4VoXVY6HEys/hJzz/WB
 H2nmWxFBaZaTr/OjoCto6/rQdvJQFjxMiC6+q35N8YZfI9XZAaQT1YIzkx1BnGmKZFpUq/hmur
 N8SY08eBMqBK5SUbHRgJ41dbqwqj1RJDVb7L8SAyZEJS7EURHvJZhOZHSIZYy972m3KrFcIRMM
 /bEVZ40SWRHvqBarqHPNdJNjpm2RnACggpZJXYkWFqFSH3oicipSrRJ2ASYHfyZsaNCUYNPMac
 Kx0=
X-IronPort-AV: E=Sophos;i="5.64,352,1559548800"; d="scan'208";a="40199746"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa3.mentor.iphmx.com with ESMTP; 05 Aug 2019 23:21:15 -0800
IronPort-SDR: WP1n50YQpkUi8UHPfq9Uhy3Q80W3OHO97juBjokPJAwmL7Zz0mkFVtLgVHXDqV2jeQefMn+NrJ
 vqdEoFmoHrG6CV16CKijBkganpIIFKPu2loYop2jASZ4k0XMqasQ0qUiIgIZDWyLLW3vXUduNY
 V2lsdIlKA4twG3HIuGbD6mxdVzpC0dcNZr8be5be6C97S2EiDHjlMBAAqVC4mHICB3/vWi+nTJ
 S1yi0WOAa+f84zOgKExAG64oyp283ot+X3e1EjdFTBcW4SyV8OiF/rJMaTplXRCm4Y0lnfyfB3
 Dsc=
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20190722072403.11008-1-jiada_wang@mentor.com>
 <20190722072403.11008-3-jiada_wang@mentor.com>
 <87a7d6h3b2.wl-kuninori.morimoto.gx@renesas.com>
From: Jiada Wang <jiada_wang@mentor.com>
Message-ID: <731330d0-e177-f9cb-50d2-91701f8dff0a@mentor.com>
Date: Tue, 6 Aug 2019 16:21:00 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87a7d6h3b2.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
X-ClientProxiedBy: SVR-ORW-MBX-05.mgc.mentorg.com (147.34.90.205) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Cc: twischer@de.adit-jv.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v1 2/3] ASoC: rsnd: Allow reconfiguration
	of clock rate
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Morimoto-san

Sorry for the delayed response

On 2019/07/22 17:41, Kuninori Morimoto wrote:
> 
> Hi Jiada
> 
> The solution looks very over-kill to me,
> especiallyq [3/3] patch is too much to me.
> 
> 1st, can we start clock at .hw_param, instead of .prepare ?
> and stop it at .hw_free ?
> 
the reasoning to move start of clock from .init to .prepare by
commit 4d230d1271064 ("ASoC: rsnd: fixup not to call clk_get/set under 
non-atomic")
is to prevent clk_{get, set_rate} be called from atomic context,
since .hw_params is non atomic context,
so I think start of clock can be moved from .prepare to .hw_params

> 2nd, can we keep usrcnt setup as-is ?
> I guess we can just avoid rsnd_ssi_master_clk_start() if ssi->rate was not 0 ?

I don't fully understand your 2nd question,
in case of rsnd_ssi_master_clk_stop(), if avoid 
rsnd_ssi_master_clk_stop() when ssi->rate is 0 by apply following change

  	static void rsnd_ssi_master_clk_stop(struct rsnd_mod *mod,
  				     struct rsnd_dai_stream *io)
  	{
  		...
  -		if (ssi->usrcnt > 1)
  +		if (ssi->rate == 0)
  			return;
  		...
  	}

then when any IO stream with same SSI calls .hw_free,
the other IO stream's clock will be stopped too.

Thanks,
Jiada

> similar for rsnd_ssi_master_clk_stop()
> 
> 	static int rsnd_ssi_master_clk_start(struct rsnd_mod *mod,
> 				     struct rsnd_dai_stream *io)
> 	{
> 		...
> 		if (ssi->rate)
> 			return 0;
> 		...
> 	}
> 
> 	static void rsnd_ssi_master_clk_stop(struct rsnd_mod *mod,
> 				     struct rsnd_dai_stream *io)
> 	{
> 		...
> -		if (ssi->usrcnt > 1)
> +		if (ssi->rate == 0)
> 			return;
> 		...
> 	}
> 
> 
>> From: Timo Wischer <twischer@de.adit-jv.com>
>>
>> Currently after clock rate is started in .prepare reconfiguration
>> of clock rate is not allowed, unless the stream is stopped.
>>
>> But there is use case in Gstreamer ALSA sink, in case of changed caps
>> Gsreatmer reconfigs and it calls snd_pcm_hw_free() before snd_pcm_prepre().
>> See gstreamer1.0-plugins-base/
>> gst-libs/gst/audio/gstaudiobasesink.c: gst_audio_base_sink_setcaps():
>> - gst_audio_ring_buffer_release()
>> - gst_audio_sink_ring_buffer_release()
>> - gst_alsasink_unprepare()
>> - snd_pcm_hw_free()
>> is called before
>> - gst_audio_ring_buffer_acquire()
>> - gst_audio_sink_ring_buffer_acquire()
>> - gst_alsasink_prepare()
>> - set_hwparams()
>> - snd_pcm_hw_params()
>> - snd_pcm_prepare()
>>
>> The issue mentioned in this commit can be reproduced with the following
>> aplay patch:
>>
>>      >diff --git a/aplay/aplay.c b/aplay/aplay.c
>>      >@@ -2760,6 +2760,8 @@ static void playback_go(int fd, size_t loaded,
>>      >      header(rtype, name);
>>      >      set_params();
>>      >+     hwparams.rate = (hwparams.rate == 48000) ? 44100 : 48000;
>>      >+     set_params();
>>      >
>>      >      while (loaded > chunk_bytes && written < count && !in_aborting)
>>      >      {
>>      >              if (pcm_write(audiobuf + written, chunk_size) <= 0)
>>
>> $ aplay -Dplughw:0,0,0 -c8 -fS24_LE -r48000 /dev/zero
>> rcar_sound ec500000.sound: SSI parent/child should use same rate
>> rcar_sound ec500000.sound: ssi[3] : prepare error -22
>> rcar_sound ec500000.sound: ASoC: cpu DAI prepare error: -22
>> rsnd_link0: ASoC: prepare FE rsnd_link0 failed
>>
>> this patch address the issue by stop clock in .hw_free,
>> to allow reconfiguration of clock rate without stop of the stream.
>>
>> Signed-off-by: Timo Wischer <twischer@de.adit-jv.com>
>> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
>> ---
>>   sound/soc/sh/rcar/ssi.c | 53 +++++++++++++++++++++++++++++------------
>>   1 file changed, 38 insertions(+), 15 deletions(-)
>>
>> diff --git a/sound/soc/sh/rcar/ssi.c b/sound/soc/sh/rcar/ssi.c
>> index f6a7466622ea..f43937d2c588 100644
>> --- a/sound/soc/sh/rcar/ssi.c
>> +++ b/sound/soc/sh/rcar/ssi.c
>> @@ -286,7 +286,7 @@ static int rsnd_ssi_master_clk_start(struct rsnd_mod *mod,
>>   	if (rsnd_ssi_is_multi_slave(mod, io))
>>   		return 0;
>>   
>> -	if (ssi->usrcnt > 0) {
>> +	if (ssi->rate) {
>>   		if (ssi->rate != rate) {
>>   			dev_err(dev, "SSI parent/child should use same rate\n");
>>   			return -EINVAL;
>> @@ -471,13 +471,9 @@ static int rsnd_ssi_init(struct rsnd_mod *mod,
>>   			 struct rsnd_dai_stream *io,
>>   			 struct rsnd_priv *priv)
>>   {
>> -	struct rsnd_ssi *ssi = rsnd_mod_to_ssi(mod);
>> -
>>   	if (!rsnd_ssi_is_run_mods(mod, io))
>>   		return 0;
>>   
>> -	ssi->usrcnt++;
>> -
>>   	rsnd_mod_power_on(mod);
>>   
>>   	rsnd_ssi_config_init(mod, io);
>> @@ -505,18 +501,8 @@ static int rsnd_ssi_quit(struct rsnd_mod *mod,
>>   		return -EIO;
>>   	}
>>   
>> -	rsnd_ssi_master_clk_stop(mod, io);
>> -
>>   	rsnd_mod_power_off(mod);
>>   
>> -	ssi->usrcnt--;
>> -
>> -	if (!ssi->usrcnt) {
>> -		ssi->cr_own	= 0;
>> -		ssi->cr_mode	= 0;
>> -		ssi->wsr	= 0;
>> -	}
>> -
>>   	return 0;
>>   }
>>   
>> @@ -525,6 +511,7 @@ static int rsnd_ssi_hw_params(struct rsnd_mod *mod,
>>   			      struct snd_pcm_substream *substream,
>>   			      struct snd_pcm_hw_params *params)
>>   {
>> +	struct rsnd_ssi *ssi = rsnd_mod_to_ssi(mod);
>>   	struct rsnd_dai *rdai = rsnd_io_to_rdai(io);
>>   	unsigned int fmt_width = snd_pcm_format_width(params_format(params));
>>   
>> @@ -536,6 +523,11 @@ static int rsnd_ssi_hw_params(struct rsnd_mod *mod,
>>   		return -EINVAL;
>>   	}
>>   
>> +	if (!rsnd_ssi_is_run_mods(mod, io))
>> +		return 0;
>> +
>> +	ssi->usrcnt++;
>> +
>>   	return 0;
>>   }
>>   
>> @@ -913,6 +905,35 @@ static int rsnd_ssi_prepare(struct rsnd_mod *mod,
>>   	return rsnd_ssi_master_clk_start(mod, io);
>>   }
>>   
>> +static int rsnd_ssi_hw_free(struct rsnd_mod *mod, struct rsnd_dai_stream *io,
>> +			    struct snd_pcm_substream *substream)
>> +{
>> +	struct rsnd_ssi *ssi = rsnd_mod_to_ssi(mod);
>> +
>> +	if (!rsnd_ssi_is_run_mods(mod, io))
>> +		return 0;
>> +
>> +	if (!ssi->usrcnt) {
>> +		struct rsnd_priv *priv = rsnd_mod_to_priv(mod);
>> +		struct device *dev = rsnd_priv_to_dev(priv);
>> +
>> +		dev_err(dev, "%s usrcnt error\n", rsnd_mod_name(mod));
>> +		return -EIO;
>> +	}
>> +
>> +	rsnd_ssi_master_clk_stop(mod, io);
>> +
>> +	ssi->usrcnt--;
>> +
>> +	if (!ssi->usrcnt) {
>> +		ssi->cr_own	= 0;
>> +		ssi->cr_mode	= 0;
>> +		ssi->wsr	= 0;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static struct rsnd_mod_ops rsnd_ssi_pio_ops = {
>>   	.name		= SSI_NAME,
>>   	.probe		= rsnd_ssi_common_probe,
>> @@ -926,6 +947,7 @@ static struct rsnd_mod_ops rsnd_ssi_pio_ops = {
>>   	.pcm_new	= rsnd_ssi_pcm_new,
>>   	.hw_params	= rsnd_ssi_hw_params,
>>   	.prepare	= rsnd_ssi_prepare,
>> +	.hw_free	= rsnd_ssi_hw_free,
>>   	.get_status	= rsnd_ssi_get_status,
>>   };
>>   
>> @@ -1012,6 +1034,7 @@ static struct rsnd_mod_ops rsnd_ssi_dma_ops = {
>>   	.pcm_new	= rsnd_ssi_pcm_new,
>>   	.fallback	= rsnd_ssi_fallback,
>>   	.hw_params	= rsnd_ssi_hw_params,
>> +	.hw_free	= rsnd_ssi_hw_free,
>>   	.prepare	= rsnd_ssi_prepare,
>>   	.get_status	= rsnd_ssi_get_status,
>>   };
>> -- 
>> 2.19.2
>>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
