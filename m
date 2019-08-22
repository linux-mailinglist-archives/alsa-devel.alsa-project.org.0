Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2676E98D9E
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 10:29:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 935E81674;
	Thu, 22 Aug 2019 10:28:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 935E81674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566462554;
	bh=jXJ+lFaZ4LPhPeQNiKio3CJnIYUmX7cQWOHDbay46AY=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X6h+1XowVHfuEjh0ueZyeOesNV1HuKP6yJMwhen4f4V4s8pl+sUBieduVl4H0UuRu
	 F8kIeWsFlGN9N2vc3osh4ZTFck7s0T2VL0gz3XvM6m5obmnmFmNZru+la5DJZCYfcV
	 gH2S9P8lDZrnaZZyCOF16ZquxucJXs9j8+el9EW8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3117CF803D5;
	Thu, 22 Aug 2019 10:27:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97982F8036E; Thu, 22 Aug 2019 10:27:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=FROM_EXCESS_BASE64, PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 210A1F80147
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 10:27:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 210A1F80147
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 01:27:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; d="scan'208";a="262769523"
Received: from xxx.igk.intel.com (HELO xxx) ([10.237.93.170])
 by orsmga001.jf.intel.com with ESMTP; 22 Aug 2019 01:27:19 -0700
Date: Thu, 22 Aug 2019 10:31:48 +0200
From: Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190822103148.0f947980@xxx>
In-Reply-To: <20190822073207.8696-2-tiwai@suse.de>
References: <20190822073207.8696-1-tiwai@suse.de>
 <20190822073207.8696-2-tiwai@suse.de>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: Check mixer unit bitmap
 yet more strictly
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

On Thu, 22 Aug 2019 09:32:03 +0200
Takashi Iwai <tiwai@suse.de> wrote:

> The bmControls (for UAC1) or bmMixerControls (for UAC2/3) bitmap has a
> variable size depending on both input and output pins.  Its size is to
> fit with input * output bits.  The problem is that the input size
> can't be determined simply from the unit descriptor itself but it
> needs to parse the whole connected sources.  Although the
> uac_mixer_unit_get_channels() tries to check some possible overflow of
> this bitmap, it's incomplete due to the lack of the  evaluation of
> input pins.
> 
> For covering possible overflows, this patch adds the bitmap overflow
> check in the loop of input pins in parse_audio_mixer_unit().
> 
> Fixes: 0bfe5e434e66 ("ALSA: usb-audio: Check mixer unit descriptors
> more strictly") Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/usb/mixer.c | 34 ++++++++++++++++++++++++++--------
>  1 file changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> index b5927c3d5bc0..27ee68a507a2 100644
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
> @@ -739,7 +739,6 @@ static int uac_mixer_unit_get_channels(struct
> mixer_build *state, struct uac_mixer_unit_descriptor *desc)
>  {
>  	int mu_channels;
> -	void *c;
>  
>  	if (desc->bLength < sizeof(*desc))
>  		return -EINVAL;
> @@ -762,13 +761,6 @@ static int uac_mixer_unit_get_channels(struct
> mixer_build *state, break;
>  	}
>  
> -	if (!mu_channels)
> -		return 0;
> -
> -	c = uac_mixer_unit_bmControls(desc, state->mixer->protocol);
> -	if (c - (void *)desc + (mu_channels - 1) / 8 >=
> desc->bLength)
> -		return 0; /* no bmControls -> skip */
> -
>  	return mu_channels;
>  }
>  
> @@ -2009,6 +2001,29 @@ static int parse_audio_feature_unit(struct
> mixer_build *state, int unitid,
>   * Mixer Unit
>   */
>  
> +/* check whether the given in/out overflows bmMixerControls matrix */
> +static bool mixer_bitmap_overflow(struct uac_mixer_unit_descriptor
> *desc,
> +				  int protocol, int num_ins, int
> num_outs) +{
> +	u8 *hdr = (u8 *)desc;
> +	u8 *c = uac_mixer_unit_bmControls(desc, protocol);
> +	size_t rest; /* remaining bytes after bmMixerControls */
> +
> +	switch (protocol) {
> +	case UAC_VERSION_1:
> +	default:

Won't this trigger implicit fall through warning?

> +		rest = 1; /* iMixer */
> +	case UAC_VERSION_2:
> +		rest = 2; /* bmControls + iMixer */
> +	case UAC_VERSION_3:
> +		rest = 6; /* bmControls + wMixerDescrStr */
> +		break;
> +	}
> +
> +	/* overflow? */
> +	return c + (num_ins * num_outs + 7) / 8 + rest > hdr +
> hdr[0]; +}
> +
>  /*
>   * build a mixer unit control
>   *
> @@ -2137,6 +2152,9 @@ static int parse_audio_mixer_unit(struct
> mixer_build *state, int unitid, if (err < 0)
>  			return err;
>  		num_ins += iterm.channels;
> +		if (mixer_bitmap_overflow(desc,
> state->mixer->protocol,
> +					  num_ins, num_outs))
> +			break;
>  		for (; ich < num_ins; ich++) {
>  			int och, ich_has_controls = 0;
>  

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
