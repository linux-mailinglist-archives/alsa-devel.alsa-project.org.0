Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5062D70F4FB
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 13:22:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EA9C1EC;
	Wed, 24 May 2023 13:21:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EA9C1EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684927350;
	bh=nTH1NoAMCZFcFLltEl2TmIhRP4t6fm9BWWNijr/Xzv4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p9CXqjXnarWhqVSFa1mld723pd6BIIkU4Jo/0Rmy6vI0vYO0+R4n08jd8NOiQl1ur
	 0Kc/1FUNuFUgcQiGu8IBXHvZQFq/ERKexzSTYqiEdJI5Rtt73OaOJH0LHfa80964zb
	 xu/LPZgopi9deiZph4mmMeD0Z/EnU/bSsMyS3cUo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57A6EF80086; Wed, 24 May 2023 13:21:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08E25F8016A;
	Wed, 24 May 2023 13:21:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D1E4F80249; Wed, 24 May 2023 13:21:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 546E7F80086
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 13:21:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 546E7F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fotEiQdK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684927291; x=1716463291;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nTH1NoAMCZFcFLltEl2TmIhRP4t6fm9BWWNijr/Xzv4=;
  b=fotEiQdK6bBX6TqD40YoPPCiKLmtSTPeTOaHRUBsR7IwMhEVwHkBf3Jl
   itgeljwcPeABEGKUnpbUyArKD+eZCLtpMwQbQBVYzR11KAgouQML/vw0b
   uEIsAfKxRwSQgXa63RCpeZJDcqQu6O1e3lmnrFUJ/7Ainuee0xqYcgNeM
   3skpq0FpeH/hKzbZApijuxkBhAlxsWFcqKkrUgUBROFKfxRgO9ffYv2cG
   oyJUw+rzBwg+2Su/G/sYnpy7ba0gwOuQ80PnBQGz/iW6jVcITBI301Gao
   xHATSTw5LTq69p2Dq4/9kpt80FEAlery/keYKDnXuHYWv12YjOGPGRldu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="419246208"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400";
   d="scan'208";a="419246208"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 04:21:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="848712780"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400";
   d="scan'208";a="848712780"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 04:21:11 -0700
Message-ID: <ab3f0c0a-62fd-a468-b3cf-0e4b59bac6ae@linux.intel.com>
Date: Wed, 24 May 2023 13:21:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 08/20] ASoC: soc-pcm.c: cleanup soc_get_playback_capture()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
 <87r0rep4we.wl-kuninori.morimoto.gx@renesas.com>
 <2e84d6f3-902f-d6f3-0084-ddfbd61ffa1f@linux.intel.com>
 <87lehh2db4.wl-kuninori.morimoto.gx@renesas.com>
 <8f977a29-14c2-a160-5eea-10fce6a73742@linux.intel.com>
 <87wn10ncyi.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87wn10ncyi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7HUM2BASCPJ4PQKUGYBY7CK4ZSXR2QXI
X-Message-ID-Hash: 7HUM2BASCPJ4PQKUGYBY7CK4ZSXR2QXI
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7HUM2BASCPJ4PQKUGYBY7CK4ZSXR2QXI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/23/2023 1:49 AM, Kuninori Morimoto wrote:
> 
> Hi Amadeusz
> 
>>> static int soc_get_playback_capture(...)
>>> {
>>> 	...
>>> (A)	if (dai_link->dynamic || dai_link->no_pcm) {
>>> 		...
>>> 		if (dai_link->dpcm_playback) {
>>> 			...
>>> (B)			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
>>> 				...
>>> 			}
>>> 			...
>>> 		}
>>> 		if (dai_link->dpcm_capture) {
>>> 			...
>>> (B)			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
>>> 				...
>>> 			}
>>> 		}
>>> 		...
>>> 	}
>>> }
>>>
>>> It checks CPU (B) when no_pcm (A) on original.
>>> But I think "no_pcm - CPU" is dummy DAI -> above check is no meaning.
>>> After the patch, it checks both CPU/Codec.
> (snip)
>>> I wonder is your Codec which is connected to no_pcm DAI valid ?
>>
>> I'm not sure what do you mean, if it is valid? It works fine before this
>> patch ;)
> 
> Ah, sorry, let me explain detail.
> 
> 	static int soc_get_playback_capture(...)
> 	{
> 		...
> (A)		if (dai_link->dynamic || dai_link->no_pcm) {
> 			int stream;
> 
> 			if (dai_link->dpcm_playback) {
> 				stream = SNDRV_PCM_STREAM_PLAYBACK;
> 
> (B)				for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> (C)					if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
> 						has_playback = 1;
> 						break;
> 					}
> 				}
> 			...
> 	}
> 
> Before appling the patch, in DPCM case (A), it checks CPU valid only (B)/(C).
> In many case, DPCM is like this
> 
> 	dynamic			no_pcm
> 	[CPU/dummy-Codec] - [dummy-CPU/Codec]
> 
> I noticed that before the patch, it checks dummy DAI only for no_pcm case.
> But after appling the patch, it will check both CPU and Codec
> valid (X)/(Y)/(Z).
> 
> I think this was changed after patch.
> So, my question was what happen for snd_soc_dai_stream_valid() on your Codec.
> 
> # I notcied that avs_create_dai_links() is not using dummy CPU on no_pcm case...
> 
> 
> 	static int soc_get_playback_capture(...)
> 	{
> 		...
> (X)		for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> (Y)			codec_dai = asoc_rtd_to_codec(rtd, i); /* get paired codec */
> 
> (Z)			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
> (Z)			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
> 				has_playback = 1;
> (Z)			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
> (Z)			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
> 				has_capture = 1;
> 		}
> 		...
> 	}
> 
> Thank you for your help !!
> 

Hi,
sorry for small delay, I've debugged the issue. Seems like one less 
critical problem is in ASoC HDA codec, which blocks HDA and HDMI probing 
altogether in our driver, something like this should fix this:

commit ed93e4fbc045b8da7906484a9c88e6b53864949b (HEAD)
Author: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Date:   Wed May 24 20:54:44 2023 +0200

     ASoC: codecs: hda: Fix probe codec definition

     In order to properly bind snd_soc_dai_driver its snd_soc_pcm_stream 
need
     to provide channels_min value, otherwise ASoC framework may think that
     stream is improper.

     Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
index d57b043d6bfe..62fd99f530bf 100644
--- a/sound/soc/codecs/hda.c
+++ b/sound/soc/codecs/hda.c
@@ -341,6 +341,8 @@ static const struct snd_soc_dapm_widget 
hda_dapm_widgets[] = {
  static struct snd_soc_dai_driver card_binder_dai = {
         .id = -1,
         .name = "codec-probing-DAI",
+       .capture.channels_min = 1,
+       .playback.channels_min = 1,
  };

  static int hda_hdev_attach(struct hdac_device *hdev)


With the above fixed, there is issue with how HDMI is being initialized 
and I consider it a blocker. So it needs to be fixed first before this 
patchset can be merged. I did simple patch like:

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 64a944016c78..e84c3e46557e 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2317,6 +2317,7 @@ static int generic_hdmi_build_pcms(struct 
hda_codec *codec)
                 if (spec->pcm_used >= ARRAY_SIZE(spec->pcm_rec))
                         break;
                 /* other pstr fields are set in open */
+               pstr->channels_min = 1;
         }

         return 0;

and it works for testing purposes, but as commented in code, those 
fields are initialized later (in hdmi_pcm_open()), which apparently in 
case of ASoC binding is too late. Likely those assignments need to be 
moved earlier.

Another thing that should probably be done is some kind of look through 
ASoC codec files to make sure that they all define channels_min 
properly, otherwise there may be more unexpected failures.

Thanks,
Amadeusz
