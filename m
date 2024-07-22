Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0A4938B84
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 10:52:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 349E4E69;
	Mon, 22 Jul 2024 10:52:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 349E4E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721638364;
	bh=2ATN9ew732H9kBGbNuFRFwOK3CtyVbMw27G227MrWVc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EIWFMYVsr8nRN5UAnl1ihmn+jK1CU2Z7OpoXCqtZsZal260zhBWE8mwNTtTXZy6wl
	 gZBAEAMw2VVEeT5tuKWOjU1iblI3HPCFsuX9i3gGzp+2BzWbDC2vRIfBNsLrDEzWjz
	 qLKi0wWJFI2gOufFx+9JRAZ3uzR9oJvUjvYzaRe4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12BF1F805B2; Mon, 22 Jul 2024 10:52:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF512F805B1;
	Mon, 22 Jul 2024 10:52:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA7F4F801F5; Mon, 22 Jul 2024 10:48:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D39FEF8013D
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 10:47:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D39FEF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HGEPEJae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721638073; x=1753174073;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2ATN9ew732H9kBGbNuFRFwOK3CtyVbMw27G227MrWVc=;
  b=HGEPEJaemgb5bGPYdkICZwPRhmNb90UgHwjWE6MJOJ/UxqTi7719DJ2E
   QD4rD01xiX+Xey3ljxfj4HIO56RrYVJrj7pH4igX83Xega1kvz3slh2ap
   T+LmVbnz35zRIYVDzD9dnw6K/dbBa3DF5mR8dCf7wwapQBjE4oBBeaZoa
   Js8RT5/B1RZoSFYV8TZl6SzhwumuZiFdQPEqcb77zZIhWrxivOdF+Z6x0
   kTOhlyKgLNuYc4EoVPrgEKs/lAlHWUvQgRxGVoANDrvoEpZ77/4TnmU1Z
   0nKLyp/JW4hcyFD1hZ7L3C3A+in+kupQMXOKrvr2RSxyVXzJ6gSsX7KW8
   g==;
X-CSE-ConnectionGUID: ue7eDbycSiuxT9vJGbSFuA==
X-CSE-MsgGUID: 9nZH5i1fRmK3meBlo0/4TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="30621033"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800";
   d="scan'208";a="30621033"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 01:47:35 -0700
X-CSE-ConnectionGUID: QUnNz8CDR12VMDK2S7znuA==
X-CSE-MsgGUID: S3q7ekPdRiaCoLgOh+JDYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800";
   d="scan'208";a="51472069"
Received: from ettammin-desk.ger.corp.intel.com (HELO [10.245.246.242])
 ([10.245.246.242])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 01:47:33 -0700
Message-ID: <85450b77-d68f-45e2-bef1-6082bc56fa59@linux.intel.com>
Date: Mon, 22 Jul 2024 10:47:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 01/xx] ALSA: add snd_stream_is_playback/capture() macro
To: Takashi Iwai <tiwai@suse.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>
References: <87zfqel1g7.wl-kuninori.morimoto.gx@renesas.com>
 <87y15yl1fa.wl-kuninori.morimoto.gx@renesas.com>
 <9d0a16c8-5539-4977-9ac0-9bbf3df56676@linux.intel.com>
 <87a5iab8gc.wl-kuninori.morimoto.gx@renesas.com>
 <87wmle9dda.wl-kuninori.morimoto.gx@renesas.com>
 <87v80xq1td.wl-tiwai@suse.de>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87v80xq1td.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RQU3OPHKAJGGQCFUATELLVKUC7POEXIZ
X-Message-ID-Hash: RQU3OPHKAJGGQCFUATELLVKUC7POEXIZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RQU3OPHKAJGGQCFUATELLVKUC7POEXIZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/22/24 10:16, Takashi Iwai wrote:
> On Mon, 22 Jul 2024 07:58:41 +0200,
> Kuninori Morimoto wrote:
>>
>>
>> Hi Amadeusz, Takashi
>>
>>>> Perhaps you could use generics here, so you could have one caller for
>>>> both cases?
>>>>
>>>> Something like:
>>>> #define snd_pcm_is_playback(x) _Generic((x),                   \
>>>>         int :         (x == SNDRV_PCM_STREAM_PLAYBACK), \
>>>>         struct snd_pcm_substream *substream * : (x->stream ==
>>>> SNDRV_PCM_STREAM_PLAYBACK))(x)
>>>> or just call the above functions in it?
>>
>> Hmm... I couldn't compile above inline style.
>> I need to create function, and use it on _Generic().
>>
>> And then, _Generic() is very picky for variable sytle.
>> This means I need to create function for "int" / "const int",
>> "unsigned int", "const unsigned int"
>>
>> static inline int snd_pcm_stream_is_playback_(const int stream)
>> {
>> 	return stream == SNDRV_PCM_STREAM_PLAYBACK;
>> }
>>
>> static inline int snd_pcm_stream_is_playback(int stream)
>> {
>> 	return stream == SNDRV_PCM_STREAM_PLAYBACK;
>> }
>>
>> static inline int snd_pcm_stream_is_playback_u(const unsigned int stream)
>> {
>> 	return stream == SNDRV_PCM_STREAM_PLAYBACK;
>> }
>>
>> static inline int snd_pcm_stream_is_playbacku(unsigned int stream)
>> {
>> 	return stream == SNDRV_PCM_STREAM_PLAYBACK;
>> }
> 
> I really don't see any merit of those inline.  If this simplifies the
> code, I'd agree, but that's adding just more code...
> 
>>
>> static inline int snd_pcm_substream_is_playback_(const struct snd_pcm_substream *substream)
>> {
>> 	return snd_pcm_stream_is_playback(substream->stream);
>> }
>>
>> static inline int snd_pcm_substream_is_playback(struct snd_pcm_substream *substream)
>> {
>> 	return snd_pcm_stream_is_playback(substream->stream);
>> }
>>
>> #define snd_pcm_is_playback(x) _Generic((x), \
>> 	const int : snd_pcm_stream_is_playback_, \
>> 	      int : snd_pcm_stream_is_playback, \
>> 	const unsigned int : snd_pcm_stream_is_playback_u, \
>> 	      unsigned int : snd_pcm_stream_is_playbacku, \
>> 	const struct snd_pcm_substream * : snd_pcm_substream_is_playback_, \
>> 	      struct snd_pcm_substream * : snd_pcm_substream_is_playback)(x)
>>
>> And I'm not sure how to handle "bit field" by _Generic.
>>
>> 	${LINUX}/sound/pci/ac97/ac97_pcm.c:153:13: note: in expansion of macro 'snd_pcm_is_playback'
>> 	  153 |         if (snd_pcm_is_playback(pcm->stream))
>> 	      |             ^~~~~~~~~~~~~~~~~~~
>> 	${LINUX}/sound/pci/ac97/ac97_pcm.c: In function 'snd_ac97_pcm_assign':
>> 	${LINUX}/include/sound/pcm.h:544:41: error: '_Generic' selector of type 'unsigned char:1' is not compatible with any association
>> 	  544 | #define snd_pcm_is_playback(x) _Generic((x), \
>>
>> Not using _Generic() is easy, "const int" version can handle everything
>> (= "int", "const int", "unsigned int", "const unsigned int", "short",
>> "const short", "bit field", etc).
>>
>> If there is better _Generic() grammar, I can follow it.
>> If there wasn't, unfortunately let's give up this conversion...
> 
> IMO, if the retrieval of the stream direction and its evaluation are
> done separately, there is little use of the inline functions like the
> above.  It doesn't give a better readability nor code safety.
> 
> That said, as of now, I'm not much convinced to go further.
> OTOH, I'm not strongly against taking this kind of change -- if other
> people do find it absolutely better, I'm ready to be convinced :)
The main issue I have with this patch is the continued confusion in
variable naming between 'stream' and 'direction'. It's problematic on
multiple platforms where a stream is typically identified by a DMA
channel or ID of some sort. There's also the SoundWire 'stream' which
has nothing to do with PCM devices. In the end people end-up drowning in
too many 'streams', no one knows if the code refers to the data flow or
the data direction.
