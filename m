Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8A0E9CAC
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 14:52:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFA85209A;
	Wed, 30 Oct 2019 14:51:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFA85209A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572443526;
	bh=V+5rm9+vcdAn6bqhKfVULBxHLzeK3vf4f/zBd/ZRxZ0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VohhsL/CtFa5FvcaLAyRYDLsU6xj062T/tY2oS2/XvK1hTvMqmJWHVLjAFL2Aogdx
	 acR0bxKHQk8tbSdHLs81OEZRzev7CWqcgNTWMmY6KiLuGW1wV6HF5y0PJhvgvR5ym+
	 5rqPXppVu2cQegfTlpZGaAkkA6eZKxKfr64FcgD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 029D0F8044A;
	Wed, 30 Oct 2019 14:50:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F632F80361; Wed, 30 Oct 2019 14:50:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4EF7F802A1
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 14:50:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4EF7F802A1
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Oct 2019 06:50:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,247,1569308400"; d="scan'208";a="198682225"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 30 Oct 2019 06:50:10 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 30 Oct 2019 15:50:09 +0200
Date: Wed, 30 Oct 2019 15:50:09 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191030135009.GJ1208@intel.com>
References: <20191029191050.GF1208@intel.com>
 <s5himo7i89i.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5himo7i89i.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, intel-gfx@lists.freedesktop.org
Subject: Re: [alsa-devel] pcm_lock deadlock
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Oct 29, 2019 at 09:52:57PM +0100, Takashi Iwai wrote:
> On Tue, 29 Oct 2019 20:10:50 +0100,
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] ALSA: hda - Fix mutex deadlock in HDMI codec driver
> =

> The commit ade49db337a9 ("ALSA: hda/hdmi - Allow audio component for
> AMD/ATI and Nvidia HDMI") introduced the spec->pcm_lock mutex lock to
> the whole generic_hdmi_init() function for avoiding the race with the
> audio component registration.  However, this caused a dead lock when
> the unsolicited event is handled without the audio component, as the
> codec gets runtime-resumed in hdmi_present_sense() which is already
> inside the spec->pcm_lock in its caller.
> =

> For avoiding this deadlock, add a new mutex only for the audio
> component binding that is used in both generic_hdmi_init() and the
> audio notifier registration where the jack callbacks are handled /
> re-registered.
> =

> Fixes: ade49db337a9 ("ALSA: hda/hdmi - Allow audio component for AMD/ATI =
and Nvidia HDMI")
> Reported-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/pci/hda/patch_hdmi.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> =

> diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
> index 795cbda32cbb..d9b5ba361409 100644
> --- a/sound/pci/hda/patch_hdmi.c
> +++ b/sound/pci/hda/patch_hdmi.c
> @@ -145,6 +145,7 @@ struct hdmi_spec {
>  	struct snd_array pins; /* struct hdmi_spec_per_pin */
>  	struct hdmi_pcm pcm_rec[16];
>  	struct mutex pcm_lock;
> +	struct mutex bind_lock; /* for audio component binding */

Missing mutex_init() for this guy.

Tested-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

>  	/* pcm_bitmap means which pcms have been assigned to pins*/
>  	unsigned long pcm_bitmap;
>  	int pcm_used;	/* counter of pcm_rec[] */
> @@ -2258,7 +2259,7 @@ static int generic_hdmi_init(struct hda_codec *code=
c)
>  	struct hdmi_spec *spec =3D codec->spec;
>  	int pin_idx;
>  =

> -	mutex_lock(&spec->pcm_lock);
> +	mutex_lock(&spec->bind_lock);
>  	spec->use_jack_detect =3D !codec->jackpoll_interval;
>  	for (pin_idx =3D 0; pin_idx < spec->num_pins; pin_idx++) {
>  		struct hdmi_spec_per_pin *per_pin =3D get_pin(spec, pin_idx);
> @@ -2275,7 +2276,7 @@ static int generic_hdmi_init(struct hda_codec *code=
c)
>  			snd_hda_jack_detect_enable_callback(codec, pin_nid,
>  							    jack_callback);
>  	}
> -	mutex_unlock(&spec->pcm_lock);
> +	mutex_unlock(&spec->bind_lock);
>  	return 0;
>  }
>  =

> @@ -2451,7 +2452,7 @@ static void generic_acomp_notifier_set(struct drm_a=
udio_component *acomp,
>  	int i;
>  =

>  	spec =3D container_of(acomp->audio_ops, struct hdmi_spec, drm_audio_ops=
);
> -	mutex_lock(&spec->pcm_lock);
> +	mutex_lock(&spec->bind_lock);
>  	spec->use_acomp_notifier =3D use_acomp;
>  	spec->codec->relaxed_resume =3D use_acomp;
>  	/* reprogram each jack detection logic depending on the notifier */
> @@ -2461,7 +2462,7 @@ static void generic_acomp_notifier_set(struct drm_a=
udio_component *acomp,
>  					      get_pin(spec, i)->pin_nid,
>  					      use_acomp);
>  	}
> -	mutex_unlock(&spec->pcm_lock);
> +	mutex_unlock(&spec->bind_lock);
>  }
>  =

>  /* enable / disable the notifier via master bind / unbind */
> -- =

> 2.16.4

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
