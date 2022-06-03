Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4432D53CE36
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 19:40:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFA33189C;
	Fri,  3 Jun 2022 19:39:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFA33189C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654278013;
	bh=tp9ZtmdVW4CD0P2cjmigE1YM2WsHXHj4SITdSBascJE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P4s0ajgWV7CzSWZnJBUjUmsStY8UHxPbDgQtGrXYJOjE3U8iHNrfpX0iK+9NGfxHX
	 vqG5D8a54lNvpKXYiYS2VDSlwJfsheyEjc/Q3QsLCqALgaEn8N9EpUKqOe9qv9S78B
	 XHg4ZbLeuhraumGXI7DNsElfsCdvQiaSYiK0mykE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D415F804FC;
	Fri,  3 Jun 2022 19:39:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8357F804D6; Fri,  3 Jun 2022 19:39:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_70,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84A2CF80124
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 19:39:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84A2CF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="mjI3DEyV"
Received: by mail-ej1-x636.google.com with SMTP id h23so6204231ejj.12
 for <alsa-devel@alsa-project.org>; Fri, 03 Jun 2022 10:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XEg7Hpw+Jpq/rzejZX9iWRaNBTCs2pDmIANavE+z+gg=;
 b=mjI3DEyVYpNFSnlUOp06c0LbtusTb29BFSEIipEiASJ6viUj3r45oWXJApS3lS2zBP
 d6GTbjlsW55UqeA8HCFWwncbnp0mVEkz5V2aKLnwiNK9Yv6ll86rvfC2ZHLZRtBHaf4W
 wVp48gef6b17f4hEQnWjdFf02KpKpT2M3twSWV9N9iL4TsWViEAmBwjXs94wWYkCG8ZV
 HrfuqWpD1TX+pYPVh76sS1PPa2RO55fIyVBhM9orq0if3vcdrGX1BWjZzy6cMUa4rc4a
 rdJOTmK07y0b6+1Or2gbqfdX1Q4Y3gwDayYkOMpb9O4pc19LmLLQrhvOYHVFp7hYRGH4
 uJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XEg7Hpw+Jpq/rzejZX9iWRaNBTCs2pDmIANavE+z+gg=;
 b=DQutdAujylMnsAa7dqsbjgOCmPMwrb5yVHEZoiRfC21KozlWYyBTVXrbbsc2JR3/12
 uM8aqSAf/iktpEB7StS+YWOGuPJqNvafQ1LCZil9aqQdAAhEowW8FmXYSv/HqiaWsGVT
 mJHPZShQNOIjvnQs9Dj2Qi+S+3gH+x9I0+3+ptdVLTv2CSqhnyWp1felsn4jV2MIwXdv
 YAzbDhKAP9g7jI9MlsChQoft9M825AnmgkKW9eQ+0wZWWTpSiNGduI4xx7H3V49BYyQZ
 I8uTW0xOe+kX5ZBaP+RNQXjbw8Hq+f3VGUIPNwu6yFD7HloZ79oyaq3OOxh5xPrcbuNa
 wxFA==
X-Gm-Message-State: AOAM53385cfdrazVK3RllQM96Iek6vEKMjFx6+HwhfyikE9qHxRbZdao
 PT02rDXmGimg2kZXWo0ePa28mkuoAkzT8UJ007s4ww==
X-Google-Smtp-Source: ABdhPJymom1EUlNjZdILx6yzZuvNnAtK9QCWTvjhGUlcXV3rFee1zuJSSZv+GqXhBpLJV+E7XZTDUOnEaIjrPIiPsTI=
X-Received: by 2002:a17:906:3702:b0:70c:f656:106 with SMTP id
 d2-20020a170906370200b0070cf6560106mr5453812ejc.215.1654277942725; Fri, 03
 Jun 2022 10:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <d8b21eb11013b6dd1e90e425bd808951@der-he.de>
 <fe472e98-82b8-bba4-364a-930d8616b4e2@perex.cz>
 <31258284cefb38127e84b2d098f8e2aa@der-he.de>
 <cb35ce57-7696-3edb-459a-d2e8557a4748@perex.cz>
 <571618d8-fdd8-eaab-a8e8-c26857e97580@linux.intel.com>
 <838d6161-5b17-1fd7-d864-9e0f13bf2ef5@perex.cz>
In-Reply-To: <838d6161-5b17-1fd7-d864-9e0f13bf2ef5@perex.cz>
From: Curtis Malainey <cujomalainey@google.com>
Date: Fri, 3 Jun 2022 10:38:53 -0700
Message-ID: <CAOReqxgvu_pLQZm5Vyp=rkDNYMVaCQFrxZFBp88NzcQtswDddQ@mail.gmail.com>
Subject: Re: [Sound-open-firmware] jack detection via input/event on linux
To: Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"
Cc: hede <alsa426@der-he.de>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Sound Open Firmware <sound-open-firmware@alsa-project.org>
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

Jaroslav, would it help if we made our UCMs closer to upstream so we
could just send them directly so pulse could test them easier? (this
is a goal I have, it just unfortunately really low priority)

Curtis Malainey | Chrome OS Audio Senior Software Engineer |
cujomalainey@google.com | We're Hiring!

Curtis Malainey | Chrome OS Audio Senior Software Engineer |
cujomalainey@google.com | We're Hiring!


On Fri, Jun 3, 2022 at 8:58 AM Jaroslav Kysela <perex@perex.cz> wrote:
>
> On 03. 06. 22 17:48, Pierre-Louis Bossart wrote:
> > [Adding alsa-devel, Mark and Takashi to this thread]
> >
> > On 6/3/22 08:33, Jaroslav Kysela wrote:
> >> On 03. 06. 22 13:17, hede wrote:
> >>> Am 03.06.2022 11:34, schrieb Jaroslav Kysela:
> >>>> PA/PW use only ALSA controls at the moment - thus you should define
> >>>> JackControl as defined in use-case.h. But it seems that the driver
> >>>> does not create or publish the ALSA jack control (I see only
> >>>> "iface=CARD,name='HDMI/DP,pcm=2 Jack'" jack controls for HDMI).
> >>>>
> >>>>                      Jaroslav
> >>>
> >>> Ah, thank you Jaroslav. That's the hint I was searching for atm.
> >>> JackDev vs. JackControl. I had a vague guess on this but now you made it
> >>> certain.
> >>>
> >>> Maybe I should take a look into the driver directly.
> >>
> >> It seems that many ASoC drivers do not create kctls - the argument pins
> >> is zero in the snd_soc_card_jack_new() call. The SND_JACK_HEADSET should
> >> be remapped to kctl in sound/soc/intel/boards/sof_rt5682.c, too.
> >
> > Did you mean something like the patch below Jaroslav? If yes, most of
> > the Chromebook machine drivers are missing this remapping. That would
> > also explain why the jack detection didn't work on my GLK test device,
> > despite a UCM file that looked good...
>
> Yes, it looks like a way to go. It seems that the drivers were tested only
> with the CRAS audio server. Note that pulseaudio can be run with the user
> permissions only - thus the input devices may not be reachable.
>
>                                 Thanks,
>                                         Jaroslav
>
> --
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
> _______________________________________________
> Sound-open-firmware mailing list
> Sound-open-firmware@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/sound-open-firmware
