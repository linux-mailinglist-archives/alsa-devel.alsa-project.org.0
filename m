Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 055FC1F5B57
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jun 2020 20:38:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96D911666;
	Wed, 10 Jun 2020 20:37:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96D911666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591814311;
	bh=ZswDCT1QII3klTp9IZFmUg2uX0kUHDENG4Zk5TjXd5Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CGeDBblElcor7efTow9+HlsO4Y9iC+ygRgbvgncPMjO3YSKH7H5fPCPGIauNkuC+S
	 SPGxqXnSAtD1EQS/j+nMryk9PupPc7rZoaBVtAvgswT98ZQCIdeBnT7QVeFZB3IolJ
	 5xNGZHiCpw/mVKip/SW8EXszfLu8Bi9P//8sVM04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA0E8F8021E;
	Wed, 10 Jun 2020 20:36:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94FFDF8021C; Wed, 10 Jun 2020 20:36:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E32E9F80058
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 20:36:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E32E9F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NOE0YlfB"
Received: by mail-pg1-x542.google.com with SMTP id s10so1362356pgm.0
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 11:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yw3q9eI6lwTKHkfbX8g8ks9O/Eo9T2Je00bLzcJ2GYc=;
 b=NOE0YlfB0mY/JBt1JlVH902N0/uUPHd7L9Kahu8HrCsJ9M2i7PnznTAA3N78Oif8tk
 axxD9WhHeKXlpUIEILYwj69M74f0/48wJl4fqEB/f+bsGLV7D4Og5MohtjSlmnzURMxN
 ONq4eO27y2e5oJqz+WjB8h5yBSe5Mcp4tyA5TUgT525dxI3IqvgFer5AwVZX2U/hlLur
 Axs6ej3TVkd2M8JHVIG57jgn+4gaElz0Eq/R4qSMuib8Z9Kv8mhHDAuQgIJ5vTj1+Ax8
 pWgWLin/eyXmmCMdh6rQsrjP9QCVviX42skFA18m000+M0UU3YSKJlm/syX0sQBHHH7/
 oRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yw3q9eI6lwTKHkfbX8g8ks9O/Eo9T2Je00bLzcJ2GYc=;
 b=mjNZkyk+1Bmmh7BBTk4TNcQvESoIkrjfqwftak+jQOJ2zoQ/YMQx1fakKPZXFGAWrV
 RLG7kFmYTi7i3C7qjGiEML9Ba+Aavg4UcPZT/8XbYG0f+XrKrfptNXPzoLeWp3UMWZz6
 aLH6twHWyZR+ifNji8oT0iSTtE8dIPzj9Ryx1Bx+w2yBvMnq1L/NK3/YFvAgxVlguO4x
 gfsG8TPVECqkamg7YpDpnMmp639EHWQ975UMiu2lDwwJKgyFXqf3J4AfDBl8soDfCKBR
 yjc8xjm+rTub0mcGNA+D8xwEu33IUqINdz4BYD8QqxwzV48kHMl5+EltYuihqNwIsI1n
 WcKA==
X-Gm-Message-State: AOAM5322PIY5O8ZAIL/W4fUfn3wMdEm2b9e340se+oBKArl/EMe+VS32
 hjBQmt5XYtW2cv8G24m2AyY=
X-Google-Smtp-Source: ABdhPJx9yBS3TpsCYB0M2k/HUJCqFbrfJDrQFqu6V3G1g3niXzTVJlGN/tj/FlKmZYYb2YwY0BjsVg==
X-Received: by 2002:a63:c04b:: with SMTP id z11mr3760360pgi.215.1591814200411; 
 Wed, 10 Jun 2020 11:36:40 -0700 (PDT)
Received: from gmail.com ([192.55.54.40])
 by smtp.gmail.com with ESMTPSA id p31sm483529pgb.46.2020.06.10.11.36.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jun 2020 11:36:39 -0700 (PDT)
Date: Thu, 11 Jun 2020 00:06:32 +0530
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2 4/6] staging: greybus: audio: Resolve compilation
 error in topology parser
Message-ID: <20200610183630.GA26807@gmail.com>
References: <cover.1591802243.git.vaibhav.sr@gmail.com>
 <7cbb81585474e895faa842e2af05ec3fb2079386.1591802243.git.vaibhav.sr@gmail.com>
 <20200610174535.GB4151@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200610174535.GB4151@kadam>
User-Agent: Mutt/1.10.1+3 (f9293d646485) (2018-09-22)
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alex Elder <elder@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 greybus-dev@lists.linaro.org, Mark Brown <broonie@kernel.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org
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

On Wed, Jun 10, 2020 at 08:45:35PM +0300, Dan Carpenter wrote:
> On Wed, Jun 10, 2020 at 10:58:28PM +0530, Vaibhav Agarwal wrote:
> > @@ -437,11 +433,12 @@ static int gbcodec_mixer_dapm_ctl_put(struct snd_kcontrol *kcontrol,
> >  	struct gbaudio_module_info *module;
> >  	struct snd_soc_dapm_widget_list *wlist = snd_kcontrol_chip(kcontrol);
> >  	struct snd_soc_dapm_widget *widget = wlist->widgets[0];
> > -	struct snd_soc_codec *codec = widget->codec;
> > -	struct gbaudio_codec_info *gb = snd_soc_codec_get_drvdata(codec);
> > +	struct device *codec_dev = widget->dapm->dev;
> > +	struct gbaudio_codec_info *gb = dev_get_drvdata(codec_dev);
> > +	struct snd_soc_dapm_update *update = NULL;
>                                     ^^^^^^^^^^^^^
> 
> >  	struct gb_bundle *bundle;
> >  
> > -	dev_dbg(codec->dev, "Entered %s:%s\n", __func__, kcontrol->id.name);
> > +	dev_dbg(codec_dev, "Entered %s:%s\n", __func__, kcontrol->id.name);
> >  	module = find_gb_module(gb, kcontrol->id.name);
> >  	if (!module)
> >  		return -EINVAL;
> > @@ -458,17 +455,13 @@ static int gbcodec_mixer_dapm_ctl_put(struct snd_kcontrol *kcontrol,
> >  	max = le32_to_cpu(info->value.integer.max);
> >  	mask = (1 << fls(max)) - 1;
> >  	val = ucontrol->value.integer.value[0] & mask;
> > -	connect = !!val;
> >  
> >  	/* update ucontrol */
> >  	if (gbvalue.value.integer_value[0] != val) {
> >  		for (wi = 0; wi < wlist->num_widgets; wi++) {
> >  			widget = wlist->widgets[wi];
> > -
> > -			widget->value = val;
> > -			widget->dapm->update = NULL;
> > -			snd_soc_dapm_mixer_update_power(widget, kcontrol,
> > -							connect);
> > +			snd_soc_dapm_mixer_update_power(widget->dapm, kcontrol,
> > +							val, update);
>                                                              ^^^^^^
> Always NULL.  Just delete the update variable.

Aah, my bad! Thanks Dan for sharing your comments. I'll fix this while 
sharing next patchset.

--
Regards,
Vaibhav

> 
> regards,
> dan carpenter
> 
> 
