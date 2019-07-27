Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 805CA77791
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jul 2019 10:11:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCAF72085;
	Sat, 27 Jul 2019 10:10:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCAF72085
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564215068;
	bh=Wz3Qw1A3l9EO0vYa1QJFsXjuVVeMg1xIxZnldorlhuc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UVvUjyhSws9zZZ5HVMGte6N7SJceos0ClPm8iV/C/AwqEHtOvOqB+eL3bXZ3I2xn7
	 AxG+sABptSGFIa3udLLXbDq9pvfzqGPxEsz72vYkqe+DIdCGOUXY62Yfnhxjlyvh+t
	 rbjpLDw7Fu1Cn4uwkAQ+IMSX6Q/vl7jDTk8k2Jrk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E77B0F80447;
	Sat, 27 Jul 2019 10:09:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8864F80394; Sat, 27 Jul 2019 10:09:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_NEUTRAL,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB969F80134
 for <alsa-devel@alsa-project.org>; Sat, 27 Jul 2019 10:09:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB969F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="wTLOTB9F"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 8CAD820EAA;
 Sat, 27 Jul 2019 04:09:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 27 Jul 2019 04:09:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=/i7wZTjtPbpCjrPVn0uozZ3178dN4cdaHPP7YaU7A
 Ho=; b=wTLOTB9F+TuuOn181Ef2NJH4KhSIEwgUYoj4LZKq5ZqzIBJAhAvlMjZbn
 BaC1AsnIXulF5GxIlEn2S/Ebr4oUh9hFZQ4F5gm/DYym2Nb69h8dzQL6//DIsQPf
 GVgJLxBDEiovAheq+biYIGWuu0pEMNpfMWlMzpUUDMnpu5pmn0GFQprk6Nzu/nlJ
 NAFaKDa+73dgCO0iz73HnXvoyKoB/Q8F2Mm2/zdrMydBam1eelNNd8hLYh++PRxN
 9aiTaJxqdKH4oTKuMbAbcQ1btWQWUmcxtstCXgLkY9KFs9YEYxw+Wa1LeHHNA0uY
 EgKCcroQHs4qwEZ1fvVK2m6sNZCMw==
X-ME-Sender: <xms:qQY8XYx7vLfBZfja2in5ulrryFQvYG-d1knkrEmZznUVwXI2F29ANQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkeeigddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefvrghnuhcu
 mfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhiqeenucfkphepudeliedrvdegge
 drudeluddrkedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtrghnuhhksehikhhirdhf
 ihenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:qQY8XbiaBgRRFQgRFIR0X0uo_fNcx1ZRUvUXqsYBcjlJBp9U6zhIPA>
 <xmx:qQY8XdIk0PGmDMtSsp8jQ-b-FNWKP5F-UdZGwQoVE8rO99LCiZ4HPw>
 <xmx:qQY8XeAwHoH9-88H45j5MaF-HbCdcXGgyxKJQAKZPmDjjUmLretEjA>
 <xmx:qgY8XVfE5gecna6LYqjCTC-9PggdRXccXcfvvkiQqGy_VoSCoxAQ9g>
Received: from laptop (unknown [196.244.191.82])
 by mail.messagingengine.com (Postfix) with ESMTPA id 94C1480059;
 Sat, 27 Jul 2019 04:09:12 -0400 (EDT)
Message-ID: <4ece142d39a3bbe8477b9eeac024df0b2dc35840.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Alexander Tsoy <alexander@tsoy.me>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>
Date: Sat, 27 Jul 2019 11:09:08 +0300
In-Reply-To: <20170810233614.3184-1-alexander@tsoy.me>
References: <20170810233614.3184-1-alexander@tsoy.me>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: fix PCM device order
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Ping? This patch never got any feedback, and yesterday another user
complained on PulseAudio bug tracker that Audinst HUD-mx2 doesn't work
out of the box, because by default hw:x,0 is used when hw:x,1 is the
pcm that works.

-- Tanu


On Fri, 2017-08-11 at 02:36 +0300, Alexander Tsoy wrote:
> Some cards have alternate setting with non-PCM format as the first
> altsetting in the interface descriptors. This confuses userspace, since
> alsa-lib uses device 0 by default. So lets parse interfaces in two steps:
>  1. Parse altsettings with PCM formats.
>  2. Parse altsettings with non-PCM formats.
> 
> This fixes at least following cards:
>  - Audinst HUD-mx2
>  - Audinst HUD-mini
> 
> Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
> ---
>  sound/usb/stream.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/usb/stream.c b/sound/usb/stream.c
> index 8e9548bc1f1a..b2ebeae91396 100644
> --- a/sound/usb/stream.c
> +++ b/sound/usb/stream.c
> @@ -477,7 +477,8 @@ static struct uac2_output_terminal_descriptor *
>  	return NULL;
>  }
>  
> -int snd_usb_parse_audio_interface(struct snd_usb_audio *chip, int iface_no)
> +static int __snd_usb_parse_audio_interface(struct snd_usb_audio *chip, int iface_no,
> +				           bool *has_non_pcm, bool non_pcm)
>  {
>  	struct usb_device *dev;
>  	struct usb_interface *iface;
> @@ -634,6 +635,10 @@ int snd_usb_parse_audio_interface(struct snd_usb_audio *chip, int iface_no)
>  				iface_no, altno);
>  			continue;
>  		}
> +		if (fmt->bFormatType != UAC_FORMAT_TYPE_I)
> +			*has_non_pcm = true;
> +		if ((fmt->bFormatType == UAC_FORMAT_TYPE_I) == non_pcm)
> +			continue;
>  		if (((protocol == UAC_VERSION_1) && (fmt->bLength < 8)) ||
>  		    ((protocol == UAC_VERSION_2) && (fmt->bLength < 6))) {
>  			dev_err(&dev->dev,
> @@ -740,3 +745,23 @@ int snd_usb_parse_audio_interface(struct snd_usb_audio *chip, int iface_no)
>  	return 0;
>  }
>  
> +int snd_usb_parse_audio_interface(struct snd_usb_audio *chip, int iface_no)
> +{
> +	int err;
> +	bool has_non_pcm = false;
> +
> +	/* parse PCM formats */
> +	err = __snd_usb_parse_audio_interface(chip, iface_no, &has_non_pcm, false);
> +	if (err < 0)
> +		return err;
> +
> +	if (has_non_pcm) {
> +		/* parse non-PCM formats */
> +		err = __snd_usb_parse_audio_interface(chip, iface_no, &has_non_pcm, true);
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
