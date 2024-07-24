Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E9893AB9C
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2024 05:39:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D38C4EB1;
	Wed, 24 Jul 2024 05:39:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D38C4EB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721792357;
	bh=qOjBav7vFLWXcW3yLTo9v3md2hnzk0OKQkYCc6S6WCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ty0vg93pSEOIE3Ph4BnTvQ7r22WraOa7vtdyaC0AKUFGvLB0a2KO8SihLD8eOnd7E
	 lQahbLP2qAytVzmUEW74BcDvgn989QynbU5NPEFUOCMz5MbrvN+v3RBQQk/URirS11
	 4ga02js0/l71dCD++v80Ye2b78lfyOqkOsQqYpDE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB481F8007E; Wed, 24 Jul 2024 05:38:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3AB1F805AE;
	Wed, 24 Jul 2024 05:38:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 285B5F801F5; Wed, 24 Jul 2024 05:28:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com
 [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2235F8007E
	for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2024 05:23:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2235F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm3 header.b=mtOowZIh;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=pAAlVQSn
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 3585D1380292;
	Tue, 23 Jul 2024 23:23:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 23 Jul 2024 23:23:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1721791396; x=
	1721877796; bh=uxK5ZpvUj2Xhvhm2UU/kpjfxHSrLVmzX5dBMOTWCqBU=; b=m
	tOowZIhRA8Al/pMPPTjQamowPtiWG0ophQC9ijScpcQRfJ/91PUNvwtm165VWAyq
	VGc2S1HahC6otnLcyTwlI0Dc3Usw0fXXMvBWqWVtC+ePSZt78qDjeqEFvdFwWTas
	S0eD5N3/lej6PQHhPb2oj8S4lJR1DSIHO6C3XrWeyJiHRU/G5kLHNK/s2wbw7Z0Q
	m8eyMB4p5TZB2ysplQeb8h7FSXYf1qpuWoOpiWU9kNKmNC5Xlyk6AjcY7wGbYcse
	Wl3B7FYSgTyRVu9MbhnHrHps76y+miFhw+/s+u9LMog4a/6s5tk4o8lI0Cey3ovx
	EREf/zXSSW6v9u+Q5ubtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1721791396; x=1721877796; bh=uxK5ZpvUj2Xhvhm2UU/kpjfxHSrL
	VmzX5dBMOTWCqBU=; b=pAAlVQSn7oCZVyouKwHIJm+B2C6na9YnsEuiaSGaeNPv
	Ed9YVSQhwGB793fk4YCJj9X0jpFiPpspTSij2NCmN0gVvk6XQUOfbZ2kggt43VYg
	ihyziZfL4lnUh6t0T7stwMqurLQ3+BMcRyTaLClJ/cro2EJ3E7T3yW1mpN0WbqCH
	Fk2xvsA6iXeF7BuTqEFukSbfY3ZSUwwfvRp/hNQNcPPCTnmITbMuYVvre275tcPr
	79i5fn7keBzgpjCBkssYGi3ewifdsVObzsn5Aga0TVYoGW3nh71BeVXVnGanAflY
	6s9KhV+tL95XV/gTs8b9CgafpyocaDd0EJ55jP39jQ==
X-ME-Sender: <xms:o3OgZkdCOsgzoGOdefGxZ3sTyLs5g_oFmPzYtcgetY_bIp6wvqSPtQ>
    <xme:o3OgZmMexIs0T8Ux4HeGHdlaqwh_XWGSuiZ6XfJCUgGrbIbpoR6vLAQVH9MxZZMBf
    nXxSo8du7JhUwgRwTo>
X-ME-Received: 
 <xmr:o3OgZlg6coruTpXODYbtNcXV1gNwn3FrqHi3m8REDdt-10VQ20e-EVwgYSDUYqPAdmHfF3zhHUzj9j3S3V1IQz0QaNoQvNdZUJg>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgeeftddriedtgdejudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
    hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
    hpqeenucggtffrrghtthgvrhhnpeehhffhteetgfekvdeiueffveevueeftdelhfejieei
    tedvleeftdfgfeeuudekueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhppdhnsggp
    rhgtphhtthhopedt
X-ME-Proxy: <xmx:o3OgZp9TEfEd73r2i5unDfEgZr0VAOWvakpkaGr2pHhldfAH_TvZ8w>
    <xmx:o3OgZgs5WWqiylOyiXIZ3ql47TAsiC1Gc8W2cKh2kQz0BFR35v89gw>
    <xmx:o3OgZgHIRxIbHFgpmw0ahnw3ccqQW-Zvorq4PI4kH0o4q7B0BcXJGA>
    <xmx:o3OgZvOfyvdlTDPCmuoGlWNTCwT1So9MWHmKVfCOFzVTqEUA41W6bQ>
    <xmx:pHOgZkjH6J4JTLGbnMZjWU-SK-dCRwqyXqttH9U_sGZaga-PJO8uMPXW>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Jul 2024 23:23:13 -0400 (EDT)
Date: Wed, 24 Jul 2024 12:23:10 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 001/112] ALSA: add snd_pcm_is_playback/capture() macro
Message-ID: <20240724032310.GA35513@workstation.local>
Mail-Followup-To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <87plr3ft3q.wl-kuninori.morimoto.gx@renesas.com>
 <87o76nft2o.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o76nft2o.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: LFDN24Z5J4NMLUM3PZF56O4GPGHYFP54
X-Message-ID-Hash: LFDN24Z5J4NMLUM3PZF56O4GPGHYFP54
X-MailFrom: o-takashi@sakamocchi.jp
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LFDN24Z5J4NMLUM3PZF56O4GPGHYFP54/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Wed, Jul 24, 2024 at 01:59:48AM +0000, Kuninori Morimoto wrote:
> Many drivers are using below code to know the direction.
> 
> 	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
> 
> Add snd_pcm_is_playback/capture() macro to handle it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/pcm.h | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/include/sound/pcm.h b/include/sound/pcm.h
> index 3edd7a7346daa..b3d4a928e41a4 100644
> --- a/include/sound/pcm.h
> +++ b/include/sound/pcm.h
> @@ -501,6 +501,41 @@ struct snd_pcm_substream {
>  
>  #define SUBSTREAM_BUSY(substream) ((substream)->ref_count > 0)
>  
> +static inline int snd_pcm_direction_is_playback(const int stream)
> +{
> +	return stream == SNDRV_PCM_STREAM_PLAYBACK;
> +}
> +
> +static inline int snd_pcm_direction_is_capture(const int stream)
> +{
> +	return stream == SNDRV_PCM_STREAM_CAPTURE;
> +}
> +
> +static inline int snd_pcm_substream_is_playback(const struct snd_pcm_substream *substream)
> +{
> +	return snd_pcm_direction_is_playback(substream->stream);
> +}
> +
> +static inline int snd_pcm_substream_is_capture(const struct snd_pcm_substream *substream)
> +{
> +	return snd_pcm_direction_is_capture(substream->stream);
> +}
> +
> +#define snd_pcm_is_playback(x) _Generic((x), \
> +		 int			: snd_pcm_direction_is_playback, \
> +	unsigned int			: snd_pcm_direction_is_playback, \
> +	unsigned char			: snd_pcm_direction_is_playback, \
> +	unsigned short			: snd_pcm_direction_is_playback, \
> +	      struct snd_pcm_substream *: snd_pcm_substream_is_playback, \
> +	const struct snd_pcm_substream *: snd_pcm_substream_is_playback)(x)
> +
> +#define snd_pcm_is_capture(x) _Generic((x),				\
> +		 int			: snd_pcm_direction_is_capture, \
> +	unsigned int			: snd_pcm_direction_is_capture, \
> +	unsigned char			: snd_pcm_direction_is_capture, \
> +	unsigned short			: snd_pcm_direction_is_capture, \
> +	      struct snd_pcm_substream *: snd_pcm_substream_is_capture, \
> +	const struct snd_pcm_substream *: snd_pcm_substream_is_capture)(x)
>  
>  struct snd_pcm_str {
>  	int stream;				/* stream (direction) */
> -- 
> 2.43.0

In my opinion, it is not so important to distinguish some types which can
be converted to integer implicitly/explicitly in the above case. The
'default' association is available in such case, like:

+#define snd_pcm_is_playback(x) _Generic((x), \
+	      struct snd_pcm_substream *: snd_pcm_substream_is_playback, \
+	const struct snd_pcm_substream *: snd_pcm_substream_is_playback, \
+	                         default: snd_pcm_direction_is_playback)(x)

The association would match [u|i][8|16|32|64] and f[32|64] types, and would
not match to any type of pointers. However, it depends on your preference.


Regards

Takashi Sakamoto
