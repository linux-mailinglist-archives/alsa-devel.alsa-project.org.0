Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D47202C617A
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 10:19:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A2E6182F;
	Fri, 27 Nov 2020 10:18:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A2E6182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606468744;
	bh=Y5RE7zZV2jjrPPQ4IBhKuQck4SPvY/FM282Ww0Vp9ZQ=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YFFNBY/PH6Or8G6knkHYfT5iifSa70KUVn7Oj0oN+GgzF5ehUyu0jEl+92mBc9kbk
	 YDM3nWeQaYpKv23XG5fTsfiTPgzkhBg3tLwMdBZ1XY0HrufTBiydyahunINgn2JGWP
	 Cbynm/F45DVn50loGq7dKtRrGfhpZKYSUQyVKh4E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C90C4F80218;
	Fri, 27 Nov 2020 10:17:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2957F8019D; Fri, 27 Nov 2020 10:17:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6619AF800EA
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 10:17:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6619AF800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="QoES5wNi"
Received: by mail-ej1-x643.google.com with SMTP id mc24so6611372ejb.6
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 01:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=D/EXTNTMfN5B7tL8MT7b2+zO4/P2kqYnphLlP24ip1c=;
 b=QoES5wNiq1UCHnjKIX/Cq/gNxLcqDTfwFk3k9E2ONkE5qT3okJxVCixxCAHGgF0kVY
 lTTtjuRNLi8LGWKqRANvHC7en05lhEl2AGfLB0Ht3gC5Hwvu3zWCbVq6zCRsn4M1yuBu
 TdR10xCHvy7Q1qNgDJs3z9QHhPRM+paJwlbAwx8cqRW+bsivcDvKDzEedP6GYHIKn+XY
 tUib8bgGpL8LFCA33l4hgtnmYD4vSzFbf+TMT124m+H2M/XYWv+KdVSJZRhRGmt6j3kS
 GiUi8qobeBknYd9/uPwy0g07Oii+Db4Esi0EplN+wX5tO7xClNXYInRSTpOlyDa6cm1q
 MQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=D/EXTNTMfN5B7tL8MT7b2+zO4/P2kqYnphLlP24ip1c=;
 b=kbnZgHpxgy2lErlbQXcX+SCy4e01ICdJCk4RzQ7O1yfhUW1IvyKQo9QgUeZIIv6TtM
 /1qDDPhjAIpnAdRCLNAfgfZGwE6dA5NbctCqeVLl1tetmcpK5A/Qw0fveuQmaJG31J0p
 HB6noAOjWjI4rmSrSbr/oiPk7XtecGoI167JFyOlNZ0qkLC1SXELPGKEwi+PQ2P03sbO
 o17yMnDsZD49C0U1macFSj2vSyHiUYxzwdXhC4V7GR3JQKZ+jDjFP33QY0zE/eHesMn+
 aGYfpGK+VDhPxGu77w9R/K0dMMqv1fQF/Kzeh0NAIy0lFkjf/detcjog4qKQIY74676w
 9dyA==
X-Gm-Message-State: AOAM530YODq8Ffx04dgOMAhplsk33vP6ok2tC4fQqP3HeV3XmxM3FS8c
 MaUMK73amuvoi6SO2BLfKRXi+Q==
X-Google-Smtp-Source: ABdhPJzI9yAuUIWhsoAeAK91Pgwuqy2Ip3AdoyuUl8Bn6Ga4h1zVJtSS9qXhU9GQO56SOyLGxYSa2Q==
X-Received: by 2002:a17:906:4104:: with SMTP id
 j4mr6758825ejk.439.1606468637345; 
 Fri, 27 Nov 2020 01:17:17 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
 by smtp.gmail.com with ESMTPSA id u5sm4605633edp.5.2020.11.27.01.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 01:17:16 -0800 (PST)
References: <1605220482-28487-1-git-send-email-ruslan.bilovol@gmail.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ruslan Bilovol <ruslan.bilovol@gmail.com>, perex@perex.cz
Subject: Re: [PATCH] [RFC] alsaloop: add feedback frequency control support
 for UAC2 gadgets
In-reply-to: <1605220482-28487-1-git-send-email-ruslan.bilovol@gmail.com>
Message-ID: <1j360vyx9h.fsf@starbuckisacylon.baylibre.com>
Date: Fri, 27 Nov 2020 10:17:14 +0100
MIME-Version: 1.0
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 gschmottlach@gmail.com
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


On Thu 12 Nov 2020 at 23:34, Ruslan Bilovol <ruslan.bilovol@gmail.com> wrote:

> Add support of special "PCM Feedback Frequency Hz"
> UAC2 Gadget mixer control that is designed to notify
> host about real sampling frequency of the gadget so
> it can adjust number of samples that hosts sends to
> the gadget.
>
> This is useful if both host and gadget has its own
> internal freerunning clock, so host can adjust
> number of samples sent, preventing overrun/underrun
> conditions.
>
> This patch reuses logic of the "PCM Rate Shift 100000"
> control used in case of in-kernel ALSA loopback
> driver. The only difference is alsaloop reports not
> rate shift but frequency in Hz
>
> Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> ---
>  alsaloop/alsaloop.h |  1 +
>  alsaloop/pcmjob.c   | 35 +++++++++++++++++++++++++----------
>  2 files changed, 26 insertions(+), 10 deletions(-)
>
> diff --git a/alsaloop/alsaloop.h b/alsaloop/alsaloop.h
> index c4aa618..9a50a42 100644
> --- a/alsaloop/alsaloop.h
> +++ b/alsaloop/alsaloop.h
> @@ -122,6 +122,7 @@ struct loopback_handle {
>  	unsigned int ctl_pollfd_count;
>  	snd_ctl_elem_value_t *ctl_notify;
>  	snd_ctl_elem_value_t *ctl_rate_shift;
> +	snd_ctl_elem_value_t *ctl_fback_freq;
>  	snd_ctl_elem_value_t *ctl_active;
>  	snd_ctl_elem_value_t *ctl_format;
>  	snd_ctl_elem_value_t *ctl_rate;
> diff --git a/alsaloop/pcmjob.c b/alsaloop/pcmjob.c
> index 6a9aff4..b3802a8 100644
> --- a/alsaloop/pcmjob.c
> +++ b/alsaloop/pcmjob.c
> @@ -1058,15 +1058,22 @@ static int set_notify(struct loopback_handle *lhandle, int enable)
>  
>  static int set_rate_shift(struct loopback_handle *lhandle, double pitch)
>  {
> -	int err;
> +	int err = 0;
>  
> -	if (lhandle->ctl_rate_shift == NULL)
> -		return 0;
> -	snd_ctl_elem_value_set_integer(lhandle->ctl_rate_shift, 0, pitch * 100000);
> -	err = snd_ctl_elem_write(lhandle->ctl, lhandle->ctl_rate_shift);
> -	if (err < 0) {
> -		logit(LOG_CRIT, "Cannot set PCM Rate Shift element for %s: %s\n", lhandle->id, snd_strerror(err));
> -		return err;
> +	if (lhandle->ctl_rate_shift) {
> +		snd_ctl_elem_value_set_integer(lhandle->ctl_rate_shift, 0, pitch * 100000);
> +		err = snd_ctl_elem_write(lhandle->ctl, lhandle->ctl_rate_shift);
> +		if (err < 0) {
> +			logit(LOG_CRIT, "Cannot set PCM Rate Shift element for %s: %s\n", lhandle->id, snd_strerror(err));
> +			return err;
> +		}
> +	} else if (lhandle->ctl_fback_freq) {
> +		snd_ctl_elem_value_set_integer(lhandle->ctl_fback_freq, 0, lhandle->rate * (2.0 - pitch));
> +		err = snd_ctl_elem_write(lhandle->ctl, lhandle->ctl_fback_freq);
> +		if (err < 0) {
> +			logit(LOG_CRIT, "Cannot set PCM Feedback Frequency element for %s: %s\n", lhandle->id, snd_strerror(err));
> +			return err;
> +		}

Hi Ruslan,

I wonder why bother adding a control of another type for the audio
gadget ? Why not give the gadget a "Rate Shift" control, instead "Feedback
Frequency" and let the driver deal with shift as necessary ?

It would be easier for the applications to re-use the same logic.

>  	}
>  	return 0;
>  }
> @@ -1195,6 +1202,7 @@ static int openctl(struct loopback_handle *lhandle, int device, int subdevice)
>  	int err;
>  
>  	lhandle->ctl_rate_shift = NULL;
> +	lhandle->ctl_fback_freq = NULL;
>  	if (lhandle->loopback->play == lhandle) {
>  		if (lhandle->loopback->controls)
>  			goto __events;
> @@ -1204,6 +1212,8 @@ static int openctl(struct loopback_handle *lhandle, int device, int subdevice)
>  			&lhandle->ctl_notify);
>  	openctl_elem(lhandle, device, subdevice, "PCM Rate Shift 100000",
>  			&lhandle->ctl_rate_shift);
> +	openctl_elem(lhandle, device, subdevice, "PCM Feedback Frequency Hz",
> +			&lhandle->ctl_fback_freq);
>  	set_rate_shift(lhandle, 1);
>  	openctl_elem(lhandle, device, subdevice, "PCM Slave Active",
>  			&lhandle->ctl_active);
> @@ -1289,6 +1299,9 @@ static int closeit(struct loopback_handle *lhandle)
>  	if (lhandle->ctl_rate_shift)
>  		snd_ctl_elem_value_free(lhandle->ctl_rate_shift);
>  	lhandle->ctl_rate_shift = NULL;
> +	if (lhandle->ctl_fback_freq)
> +		snd_ctl_elem_value_free(lhandle->ctl_fback_freq);
> +	lhandle->ctl_fback_freq = NULL;
>  	if (lhandle->ctl)
>  		err = snd_ctl_close(lhandle->ctl);
>  	lhandle->ctl = NULL;
> @@ -1334,9 +1347,11 @@ int pcmjob_init(struct loopback *loop)
>  	snprintf(id, sizeof(id), "%s/%s", loop->play->id, loop->capt->id);
>  	id[sizeof(id)-1] = '\0';
>  	loop->id = strdup(id);
> -	if (loop->sync == SYNC_TYPE_AUTO && loop->capt->ctl_rate_shift)
> +	if (loop->sync == SYNC_TYPE_AUTO && (loop->capt->ctl_rate_shift ||
> +			loop->capt->ctl_fback_freq))
>  		loop->sync = SYNC_TYPE_CAPTRATESHIFT;
> -	if (loop->sync == SYNC_TYPE_AUTO && loop->play->ctl_rate_shift)
> +	if (loop->sync == SYNC_TYPE_AUTO && (loop->play->ctl_rate_shift ||
> +			loop->play->ctl_fback_freq))
>  		loop->sync = SYNC_TYPE_PLAYRATESHIFT;
>  #ifdef USE_SAMPLERATE
>  	if (loop->sync == SYNC_TYPE_AUTO && loop->src_enable)

