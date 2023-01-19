Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F145673E52
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 17:13:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 382D4817D;
	Thu, 19 Jan 2023 17:12:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 382D4817D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674144809;
	bh=nkI46CduYGgkHcW5PKJDXzVMHGeoT5VbUHuoddDIIs8=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XHZNJUxuj1GOwIAhrOltgYWprTkOJ2LxwIUwk5qVrDjVsT9VQa6nH7fpY56rG3NvE
	 c3eZOXRlfuFRg9evbLz2NZLk9waueilCgWwhmHWcUOW6yhyr9OtaEhYSIZUlZi4FEa
	 AZTF47vyMYHeNdm/nQaEWwQZVEDEbUERVi4TWpMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF299F800F0;
	Thu, 19 Jan 2023 17:12:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4091F8047B; Thu, 19 Jan 2023 17:12:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEFA6F8024D
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 17:12:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEFA6F8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=J80F8KTk
Received: by mail-ot1-x32f.google.com with SMTP id
 n24-20020a0568301e9800b006865671a9d5so1472741otr.6
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 08:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=ix0HYju2644lJeEFjn0uwm9YLx3O/+NSlZGnG+d6HAI=;
 b=J80F8KTkDzqm+ERJgwDg2VP8YqIf0xf2GTLAIjbhbBP7vFDIT5pJJC4tLhIkwflqeO
 JoSsfNUGTzH8Se2d8d0yFlcwavRc5nqdqiH/Tys3gKk+4KJp32Y+u7xRp8zQkeOqYVCM
 0gEluAdrique81bzfZ3hab82l2kbV+MvARzknCNLy2PG44P86yzIJT5d45aDoXAzmbG/
 GbQRZbANaFLUFUEUDZ51LtVHSlE2O85k6wlX4Br7T6edq+AcmxyNRlNdg+B+MbT8HH2F
 /Y24pJv4B4ANoyIpJQHest8buU1OKZajlWzcjzNN36iklc8+WOUAdAVDRDIJuOAjAoXB
 x0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ix0HYju2644lJeEFjn0uwm9YLx3O/+NSlZGnG+d6HAI=;
 b=OcmS/XZaM81LH94t9n2LJfAzBPMX3sJqccoC4l4ruE1wnuO4YDE+TSuI2pOAZdVwV+
 03M+Yb5abutrOWYR+dAgqjnDviJLl8s/TRbUQdqsGdwgabZp0DCWDE3MEj0NTZzHV0Iw
 C2/LvTR5BFisgS/T3RFyRMSC7Pkw0sCyKDT9VlJFoykStzB4+d96kt1QazrSrkCSZabn
 rVtyFUC17/mUofp0+CG2YQmEN0o3CdkmmlxU/VJjs+UUYog6uMZfhsCvtLHHqTw4Ad4M
 rDbgh33wNeyzaWRv+pwc3MVuCS+bmvMr8al7G1uW3hQvsB2aZS4NbspGAdxHlui5PoRL
 eA/A==
X-Gm-Message-State: AFqh2kpYi6YItpTCSEQUJlsXH2K0JdW7/qZ1ALr36PVB5E64SJqBEzO5
 3tCC5YpHxxBW4xJ7kN0hBEQ=
X-Google-Smtp-Source: AMrXdXvBCxTcVurfiTvWquGMP3Q6SipQnVDQvr34r79lPOxYpgvH8yAJg0rKi3OAm0MHfCIGMs1dXQ==
X-Received: by 2002:a9d:7849:0:b0:670:a19c:211f with SMTP id
 c9-20020a9d7849000000b00670a19c211fmr5980826otm.2.1674144743497; 
 Thu, 19 Jan 2023 08:12:23 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a9d590b000000b00677714a440fsm19978688oth.81.2023.01.19.08.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 08:12:22 -0800 (PST)
Date: Thu, 19 Jan 2023 08:12:21 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: David Rau <david.rau.zg@renesas.com>
Subject: Re: [PATCH] ASoC: da7219: Fix pole orientation detection on OMTP
 headsets when playing music
Message-ID: <20230119161221.GA981953@roeck-us.net>
References: <20221121050744.2278-1-david.rau.zg@renesas.com>
 <20230117195645.GA83401@roeck-us.net>
 <OS3PR01MB66416CEF9F6E5AE62D194BACCDC49@OS3PR01MB6641.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS3PR01MB66416CEF9F6E5AE62D194BACCDC49@OS3PR01MB6641.jpnprd01.prod.outlook.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>, David Rau <we730128@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Jan 19, 2023 at 11:02:25AM +0000, David Rau wrote:
> Would you please provide me the related error messages when hung task crashes in da7219_aad_irq_thread()?
> BTW, "gnd_switch_delay = 256" is an unusual use case of the longer jack detection latency. 
> 

Here is a typical traceback.

<3>[ 246.919057] INFO: task irq/105-da7219-:2854 blocked for more than 122 seconds.
<3>[ 246.919065] Not tainted 5.10.159-20927-g317f62e2494d #1
<3>[ 246.919068] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
<6>[ $PHONE_NUMBER] task:irq/105-da7219- state:D stack: 0 pid: 2854 ppid: 2 flags:0x00004080
<6>[ 246.919075] Call Trace:
<6>[ 246.919084] __schedule+0x3b0/0xdaf
<6>[ 246.919090] schedule+0x44/0xa8
<6>[ 246.919093] schedule_timeout+0xb6/0x290
<6>[ 246.919098] ? run_local_timers+0x4e/0x4e
<6>[ 246.919102] msleep+0x2c/0x38
<6>[ 246.919108] da7219_aad_irq_thread+0x66/0x2b0 [snd_soc_da7219 cd5a76eef6e777074216b9d61f7918f7561bf7ec]
<6>[ 246.919113] ? irq_forced_thread_fn+0x5f/0x5f
<6>[ 246.919116] irq_thread_fn+0x22/0x4d
<6>[ 246.919120] irq_thread+0x120/0x19d
<6>[ 246.919123] ? irq_thread_fn+0x4d/0x4d
<6>[ 246.919128] kthread+0x142/0x153
<6>[ 246.919132] ? irq_forced_secondary_handler+0x21/0x21
<6>[ 246.919135] ? kthread_blkcg+0x31/0x31
<6>[ 246.919139] ret_from_fork+0x1f/0x30

The underlying question is if it really appropriate to have an
msleep() of any kind in an interrupt handler. If this is about
debouncing a signal, it should be handled with a delayed timer.

Guenter

> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Wednesday, January 18, 2023 03:57
> To: David Rau <we730128@gmail.com>
> Cc: perex@perex.cz; lgirdwood@gmail.com; broonie@kernel.org; tiwai@suse.com; support.opensource@diasemi.com; alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org; David Rau <david.rau.zg@renesas.com>
> Subject: Re: [PATCH] ASoC: da7219: Fix pole orientation detection on OMTP headsets when playing music
> 
> On Mon, Nov 21, 2022 at 05:07:44AM +0000, David Rau wrote:
> > The OMTP pin define headsets can be mis-detected as line out instead 
> > of OMTP, causing obvious issues with audio quality.
> > This patch is to put increased resistances within the device at a 
> > suitable point.
> > 
> > To solve this issue better, the new mechanism setup ground switches 
> > with conditional delay control and these allow for more stabile 
> > detection process to operate as intended. This conditional delay 
> > control will not impact the hardware process but use extra system 
> > resource.
> > 
> > This commit improves control of ground switches in the AAD logic.
> > 
> > Signed-off-by: David Rau <david.rau.zg@renesas.com>
> > ---
> >  sound/soc/codecs/da7219-aad.c | 42 
> > ++++++++++++++++++++++++++++++-----
> >  sound/soc/codecs/da7219-aad.h |  1 +
> >  2 files changed, 37 insertions(+), 6 deletions(-)
> > 
> > diff --git a/sound/soc/codecs/da7219-aad.c 
> > b/sound/soc/codecs/da7219-aad.c index bba73c44c219..08200ec259f9 
> > 100644
> > --- a/sound/soc/codecs/da7219-aad.c
> > +++ b/sound/soc/codecs/da7219-aad.c
> > @@ -352,9 +352,14 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
> >  	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
> >  	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
> >  	u8 events[DA7219_AAD_IRQ_REG_MAX];
> > -	u8 statusa;
> > +	u8 statusa, srm_st;
> >  	int i, report = 0, mask = 0;
> >  
> > +	srm_st = snd_soc_component_read(component, DA7219_PLL_SRM_STS) & DA7219_PLL_SRM_STS_MCLK;
> > +	msleep(da7219_aad->gnd_switch_delay * ((srm_st == 0x0) ? 2 : 1) - 
> > +4);
> 
> Ever since this patch was applied to ChromeOS, we have observed hung task crashes in da7219_aad_irq_thread().
> 
> Is it really appropriate to sleep up to (256 * 2) - 4 = 508 ms in an interrupt handler ?
> 
> Thanks,
> Guenter
> 
> > +	/* Enable ground switch */
> > +	snd_soc_component_update_bits(component, 0xFB, 0x01, 0x01);
> > +
> >  	/* Read current IRQ events */
> >  	regmap_bulk_read(da7219->regmap, DA7219_ACCDET_IRQ_EVENT_A,
> >  			 events, DA7219_AAD_IRQ_REG_MAX);
> > @@ -454,8 +459,8 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
> >  			snd_soc_dapm_disable_pin(dapm, "Mic Bias");
> >  			snd_soc_dapm_sync(dapm);
> >  
> > -			/* Enable ground switch */
> > -			snd_soc_component_update_bits(component, 0xFB, 0x01, 0x01);
> > +			/* Disable ground switch */
> > +			snd_soc_component_update_bits(component, 0xFB, 0x01, 0x00);
> >  		}
> >  	}
> >  
> > @@ -831,6 +836,32 @@ static void da7219_aad_handle_pdata(struct snd_soc_component *component)
> >  	}
> >  }
> >  
> > +static void da7219_aad_handle_gnd_switch_time(struct 
> > +snd_soc_component *component) {
> > +	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
> > +	struct da7219_aad_priv *da7219_aad = da7219->aad;
> > +	u8 jack_det;
> > +
> > +	jack_det = snd_soc_component_read(component, DA7219_ACCDET_CONFIG_2)
> > +		& DA7219_JACK_DETECT_RATE_MASK;
> > +	switch (jack_det) {
> > +	case 0x00:
> > +		da7219_aad->gnd_switch_delay = 32;
> > +		break;
> > +	case 0x10:
> > +		da7219_aad->gnd_switch_delay = 64;
> > +		break;
> > +	case 0x20:
> > +		da7219_aad->gnd_switch_delay = 128;
> > +		break;
> > +	case 0x30:
> > +		da7219_aad->gnd_switch_delay = 256;
> > +		break;
> > +	default:
> > +		da7219_aad->gnd_switch_delay = 32;
> > +		break;
> > +	}
> > +}
> >  
> >  /*
> >   * Suspend/Resume
> > @@ -908,9 +939,6 @@ int da7219_aad_init(struct snd_soc_component *component)
> >  	snd_soc_component_update_bits(component, DA7219_ACCDET_CONFIG_1,
> >  			    DA7219_BUTTON_CONFIG_MASK, 0);
> >  
> > -	/* Enable ground switch */
> > -	snd_soc_component_update_bits(component, 0xFB, 0x01, 0x01);
> > -
> >  	INIT_WORK(&da7219_aad->btn_det_work, da7219_aad_btn_det_work);
> >  	INIT_WORK(&da7219_aad->hptest_work, da7219_aad_hptest_work);
> >  
> > @@ -928,6 +956,8 @@ int da7219_aad_init(struct snd_soc_component *component)
> >  	regmap_bulk_write(da7219->regmap, DA7219_ACCDET_IRQ_MASK_A,
> >  			  &mask, DA7219_AAD_IRQ_REG_MAX);
> >  
> > +	da7219_aad_handle_gnd_switch_time(component);
> > +
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL_GPL(da7219_aad_init);
> > diff --git a/sound/soc/codecs/da7219-aad.h 
> > b/sound/soc/codecs/da7219-aad.h index f48a12012ef3..21fdf53095cc 
> > 100644
> > --- a/sound/soc/codecs/da7219-aad.h
> > +++ b/sound/soc/codecs/da7219-aad.h
> > @@ -187,6 +187,7 @@ enum da7219_aad_event_regs {  struct 
> > da7219_aad_priv {
> >  	struct snd_soc_component *component;
> >  	int irq;
> > +	int gnd_switch_delay;
> >  
> >  	u8 micbias_pulse_lvl;
> >  	u32 micbias_pulse_time;
> > --
> > 2.17.1
> > 
