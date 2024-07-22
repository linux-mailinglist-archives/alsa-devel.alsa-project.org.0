Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 215DF938BFF
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 11:24:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F6D5E7F;
	Mon, 22 Jul 2024 11:24:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F6D5E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721640293;
	bh=h0Rr8xPNog/phid+n3/pM/7ktbWMd/fWczfKdXnXhD4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cCGmksGOe8g2N58zBI2oREXD1HACWAZLrBcbkmy1lv7y7KpOBUi1sJZdksBm49Rt5
	 TMM00A+dQy9Ehtc/OKJavUxh5WghKdjU0yM6eExyCMKlCyRd2lyr/RF3KKGNlmsG14
	 cY5QDjDeLTV8oirdp+RkUuIx419Nrj95SmbrwPjM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB591F80589; Mon, 22 Jul 2024 11:24:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17D92F80589;
	Mon, 22 Jul 2024 11:24:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 988E4F800C9; Mon, 22 Jul 2024 11:24:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2412EF800C9
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 11:24:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2412EF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Rw+qjnFl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721640247; x=1753176247;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=h0Rr8xPNog/phid+n3/pM/7ktbWMd/fWczfKdXnXhD4=;
  b=Rw+qjnFlB9574kh5paYVZG+liRGMCkUD/Qi/EqZ7wVP/qJqqxasW2/eU
   5Ha61KVooz9Ix/wQle4dW9k7ePAPakkQMJ1kWMVBY6PADtlShf5wHC+A9
   YMwCNdhV56W5NQ5/8cM7uCteLhe17WRJt1vR8JkZxiHItSI6MlselK83X
   +X2cuXizDzpp3Qlm8R5Unk8O+oQFWUPj0bb1n1isFta8mB5bQdd0qByVm
   bZURXySpZFBmCuT6x0fMyPq1c5kDC9q0x1NbstZSCDND/rmiBD0zuaGQn
   dhh/MZO49b17D85IqqIRN3sub0L/Ptx9UkfUvaNdBqCONwmFlp9I7GWBw
   A==;
X-CSE-ConnectionGUID: kCVUujKpSBu+4z5Z+m8XIA==
X-CSE-MsgGUID: zTsBmnUlTeOT8t1EKQ69Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="18904684"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800";
   d="scan'208";a="18904684"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 02:24:00 -0700
X-CSE-ConnectionGUID: btHmrq/RT1GLjpvjYTiB5A==
X-CSE-MsgGUID: Sp5IePCDTBe01Y3f8uw6og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800";
   d="scan'208";a="51898994"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 02:23:59 -0700
Message-ID: <e3f3b4fd-92f3-4162-bd09-78aecb6d5193@linux.intel.com>
Date: Mon, 22 Jul 2024 11:23:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 01/xx] ALSA: add snd_stream_is_playback/capture() macro
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>
References: <87zfqel1g7.wl-kuninori.morimoto.gx@renesas.com>
 <87y15yl1fa.wl-kuninori.morimoto.gx@renesas.com>
 <9d0a16c8-5539-4977-9ac0-9bbf3df56676@linux.intel.com>
 <87a5iab8gc.wl-kuninori.morimoto.gx@renesas.com>
 <87wmle9dda.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87wmle9dda.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PS3SNXXVU7JMLHBIGIOTK4F57BQFLFB7
X-Message-ID-Hash: PS3SNXXVU7JMLHBIGIOTK4F57BQFLFB7
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PS3SNXXVU7JMLHBIGIOTK4F57BQFLFB7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/22/2024 7:58 AM, Kuninori Morimoto wrote:
> 
> Hi Amadeusz, Takashi
> 
>>> Perhaps you could use generics here, so you could have one caller for
>>> both cases?
>>>
>>> Something like:
>>> #define snd_pcm_is_playback(x) _Generic((x),                   \
>>>          int :         (x == SNDRV_PCM_STREAM_PLAYBACK), \
>>>          struct snd_pcm_substream *substream * : (x->stream ==
>>> SNDRV_PCM_STREAM_PLAYBACK))(x)
>>> or just call the above functions in it?
> 
> Hmm... I couldn't compile above inline style.
> I need to create function, and use it on _Generic().
> 
> And then, _Generic() is very picky for variable sytle.
> This means I need to create function for "int" / "const int",
> "unsigned int", "const unsigned int"
> 
> static inline int snd_pcm_stream_is_playback_(const int stream)
> {
> 	return stream == SNDRV_PCM_STREAM_PLAYBACK;
> }
> 
> static inline int snd_pcm_stream_is_playback(int stream)
> {
> 	return stream == SNDRV_PCM_STREAM_PLAYBACK;
> }
> 
> static inline int snd_pcm_stream_is_playback_u(const unsigned int stream)
> {
> 	return stream == SNDRV_PCM_STREAM_PLAYBACK;
> }
> 
> static inline int snd_pcm_stream_is_playbacku(unsigned int stream)
> {
> 	return stream == SNDRV_PCM_STREAM_PLAYBACK;
> }
> 
> static inline int snd_pcm_substream_is_playback_(const struct snd_pcm_substream *substream)
> {
> 	return snd_pcm_stream_is_playback(substream->stream);
> }
> 
> static inline int snd_pcm_substream_is_playback(struct snd_pcm_substream *substream)
> {
> 	return snd_pcm_stream_is_playback(substream->stream);
> }
> 
> #define snd_pcm_is_playback(x) _Generic((x), \
> 	const int : snd_pcm_stream_is_playback_, \
> 	      int : snd_pcm_stream_is_playback, \
> 	const unsigned int : snd_pcm_stream_is_playback_u, \
> 	      unsigned int : snd_pcm_stream_is_playbacku, \
> 	const struct snd_pcm_substream * : snd_pcm_substream_is_playback_, \
> 	      struct snd_pcm_substream * : snd_pcm_substream_is_playback)(x)
> 
> And I'm not sure how to handle "bit field" by _Generic.
> 
> 	${LINUX}/sound/pci/ac97/ac97_pcm.c:153:13: note: in expansion of macro 'snd_pcm_is_playback'
> 	  153 |         if (snd_pcm_is_playback(pcm->stream))
> 	      |             ^~~~~~~~~~~~~~~~~~~
> 	${LINUX}/sound/pci/ac97/ac97_pcm.c: In function 'snd_ac97_pcm_assign':
> 	${LINUX}/include/sound/pcm.h:544:41: error: '_Generic' selector of type 'unsigned char:1' is not compatible with any association
> 	  544 | #define snd_pcm_is_playback(x) _Generic((x), \
> 
> Not using _Generic() is easy, "const int" version can handle everything
> (= "int", "const int", "unsigned int", "const unsigned int", "short",
> "const short", "bit field", etc).
> 
> If there is better _Generic() grammar, I can follow it.
> If there wasn't, unfortunately let's give up this conversion...
> 
> Thank you for your help !!
> 

My mistake in example, I've used function syntax, notice (x) at the end, 
if you remove it, it seems to build without need to call inline functions:

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 210096f124eed..e914fea59445e 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -496,6 +496,10 @@ struct snd_pcm_substream {

  #define SUBSTREAM_BUSY(substream) ((substream)->ref_count > 0)

+#define snd_pcm_is_playback(x) _Generic((x), 
                \
+       int :                           (x == 
SNDRV_PCM_STREAM_PLAYBACK),               \
+       struct snd_pcm_substream * :    (x->stream == 
SNDRV_PCM_STREAM_PLAYBACK))
+

  struct snd_pcm_str {
         int stream;                             /* stream (direction) */
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 68aa8de2b0c4e..7e9f0ac6a5bc6 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -351,7 +351,7 @@ static int avs_dai_hda_be_hw_free(struct 
snd_pcm_substream *substream, struct sn
         data->path = NULL;

         /* clear link <-> stream mapping */
-       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+       if (snd_pcm_is_playback(substream))
                 snd_hdac_ext_bus_link_clear_stream_id(data->link,
 
hdac_stream(link_stream)->stream_tag);

@@ -383,7 +383,7 @@ static int avs_dai_hda_be_prepare(struct 
snd_pcm_substream *substream, struct sn
         snd_hdac_ext_stream_reset(link_stream);
         snd_hdac_ext_stream_setup(link_stream, format_val);

-       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+       if (snd_pcm_is_playback(substream))
                 snd_hdac_ext_bus_link_set_stream_id(data->link,
 
hdac_stream(link_stream)->stream_tag);


I've test compiled the above fine.

As for ac97, seems like _Generic is impossible on bitfields, so perhaps 
just move it out of bitfield, to int?

Thanks,
Amadeusz
