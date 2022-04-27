Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4025111CC
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 08:56:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CAB417C6;
	Wed, 27 Apr 2022 08:55:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CAB417C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651042590;
	bh=VeTMeAnQEqV6fQ1FFHVy6c3cu7Gb8b0iiU6QU+llVuU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ql/nQPC3/qBX/pI9YNEiJtVJP/4KmFYnwZ8UePAdAa4Avtlrc0vj5caKwViqKbAbM
	 weqVbB0a/ryMpJZUJwC03/RRhLRFFzdDk61+vhHwu/2LcD6YPV7vIwgeWSA6Ulniy3
	 t+44kqIH3NP+BrWGnVAHL01YfIgZG56L6IjX+jN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFE8CF80253;
	Wed, 27 Apr 2022 08:55:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63262F80152; Wed, 27 Apr 2022 08:55:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84586F80152
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 08:55:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84586F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Swzf4xKj"
Received: by mail-pg1-x533.google.com with SMTP id 15so745010pgf.4
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 23:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/H/dr1bU3IWO2Zz3V0TPFg82hzHtg38B7AemVKe2A0M=;
 b=Swzf4xKjfP1XA2e+DubAp3b10kwTb8AthU76bMCJuIkF5WelHZd8ki7PyrmZBVV73h
 7V0jsT/TNILRELnOmATKXQELGQt181VCk812Hg2n6tfah6g6r7R2L/PSsTy2SWXPPtYc
 VLmH7wlBiSjVx2ZkoP8BNPMn9iXWfbmvOKFZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/H/dr1bU3IWO2Zz3V0TPFg82hzHtg38B7AemVKe2A0M=;
 b=z6nJsgmsAEfCMZpyocmyeIh5Fpmb4PRj1eYx2ldd3JX/R5gYdJL1kEbYqtmeDK0Omx
 pWRxuhLt6X421Ubuk9xnlIX2ZJn4M2qygKGdTu5CPT0B/NbE1VLwPHji9LEl5dnO7JoP
 A6jYUBhlD8CO0G2MZFUKScRtvCCl/NBIDIL6bLmmVEJeUkzN2gqedgzchyv5M9kvZJbF
 fcNbKWBI7qxoRivUeC5erwq4DSuGYcLLYlh1Lfe5GxHUFXedRivK7fQNgcNVKLcalue6
 ZE6tS9Vo9J6lzQj0MUYH+Uw3RJdzaYocp0gtl3m8UihiNI2NRYcsao7HJUWbrIFK1Xbb
 YNDA==
X-Gm-Message-State: AOAM533NYGF6Ec+azwItesuIGGlFloYTESO9hyrF9yiSY41PX2a71kMo
 w8RFkV/F7NGEoSwZ3Bqg1eRTUA==
X-Google-Smtp-Source: ABdhPJxAbcUOPHGpu19WyFlEpx1bs/thLds4ctz1Fli9HAULfa6p4OeS6pNFkws8wrL4iVVeIVrnCw==
X-Received: by 2002:a63:df18:0:b0:3ab:938b:e6c5 with SMTP id
 u24-20020a63df18000000b003ab938be6c5mr5157870pgg.165.1651042522409; 
 Tue, 26 Apr 2022 23:55:22 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:8e2d:263:26e7:c039])
 by smtp.gmail.com with ESMTPSA id
 7-20020a17090a000700b001da3920d985sm1276416pja.12.2022.04.26.23.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 23:55:21 -0700 (PDT)
Date: Wed, 27 Apr 2022 15:55:17 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: out-of-bounds access in sound/soc/sof/topology.c
Message-ID: <Ymjo1aHD4V6bNHz7@google.com>
References: <Ylk5o3EC/hyX5UQ0@google.com>
 <8eeb08ec-4836-cf7d-2285-8ed74ccfc1cb@linux.intel.com>
 <8986a1c6-b546-7a66-a778-048487624c95@linux.intel.com>
 <e31ff7c4-7cdc-fdaf-b12c-fc1e51798a1b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e31ff7c4-7cdc-fdaf-b12c-fc1e51798a1b@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Mark Brown <broonie@kernel.org>,
 Ricardo Ribalda <ribalda@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Jaska Uimonen <jaska.uimonen@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

On (22/04/19 08:07), Pierre-Louis Bossart wrote:
> > Your analyzes are spot on, unfortunately. But...
> > 
> > As of today, the sof_get_control_data() is in the call path of
> > (ipc3-topology.c):
> > 
> > sof_widget_update_ipc_comp_process() -> sof_process_load() ->
> > sof_get_control_data()
> > 
> > sof_widget_update_ipc_comp_process() is the ipc_setup callback for
> > snd_soc_dapm_effect. If I'm not mistaken these only carries bin payload
> > and never MIXER/ENUM/SWITCH/VOLUME.
> > This means that the sof_get_control_data() is only called with
> > SND_SOC_TPLG_TYPE_BYTES and for that the allocated data area is correct.
> > 
> > This can explain why we have not seen any issues so far. This does not
> > renders the code right, as how it is written atm is wrong.
> 
> 
> Sergey's results with KASAN show that there's a real-life problem though. I also don't understand how that might happen.
> 
> Could it be that these results are with a specific topology where our assumptions are incorrect?

Is there anything I can do to help?
