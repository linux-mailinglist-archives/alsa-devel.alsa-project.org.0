Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDECE8F25C
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:36:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91E1816D2;
	Thu, 15 Aug 2019 19:35:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91E1816D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565890605;
	bh=Mcu1m1w5sldl+KFFRvZc/dRXeeeklOK4oM2Lzvekcy8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kCSO9toxQDu8T4eGwnug2zoIdC6bnirnhRPVJTypDVeYug8blRRT6dYuKmj8BSgVQ
	 EcTsUOrrJtca+5af5LY10SayAnjgCFd1WeYNZ6qQEQ6jz4HwXaCqa2/fJfXEEaHVUf
	 tgshHGdDOBLqrNoZG3hhcwWVbih50GCRRLuRupAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A760F805A0;
	Thu, 15 Aug 2019 19:19:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45C38F8049A; Thu, 15 Aug 2019 19:19:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AFB0F80290
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:19:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AFB0F80290
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="b69La8LW"
Received: by mail-ot1-x342.google.com with SMTP id r20so7142849ota.5
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3t5KAwxqvB3F0EYGJyI/WioA3AfLQz3YV3tbAHkT53Q=;
 b=b69La8LWuHdx6dmlEpTKQaYsNkXDdVB6Vu+0nJ4VVyYmV0MZx8GqMayUq1knU2C98n
 E1o4UtVKsOoYAyjjGYahSRwxrDSmW9VXnzyX9s7836ija+kkvXe7QIC52End9GykV2Pj
 cnLHHhikorTP4d18s2j0WdlFstmvez38yEfnjWrsL8MdA7pytAABTWaVC58VyUti1r4y
 gC2AOlXQVYWS1io4KbxgWiEOOyR8ebLvDqhdybOZOEnh5U3cECkUvzFZWBtBLVOMaNq8
 RwDToOjKquiMXceeNqTNwW+WbPofbzAob/Js0MXCD0OSMbhvPOYlBhD813/A6IvgV3+N
 5Wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3t5KAwxqvB3F0EYGJyI/WioA3AfLQz3YV3tbAHkT53Q=;
 b=tCIwtsnWblSoefCpFWxwq9qRmvB+Rl4hfUbPCEOUvWsd1Nhu0/osuACVVq+Dpz5ulo
 WRkcyDWP+9Hu5EkSHeTY57TrdNqA2Jsi2X27U0+7I/3paD6Bb3VNNVuBmzCzpKaBtdBS
 DK0i/NtSATj3NTdvycn9n4BDHgU9uUwbQOk52s2bdRTfGIM5EzA+ptfQo7QJCdWH1hsC
 oqjzlxIwGd3F/gts93ELw9GOWBjY5lNRPXhVMKVWiNQLZXUwlq8f5RfOds0jfWrXuL5r
 o5v1Np2XZ8jZbeE0IQmB7faw4wdYfATt8aixItT07PvanyV4alV12qzlFXvc6Tpvo52D
 AcOQ==
X-Gm-Message-State: APjAAAV0sQgSHbMxGu4eTJIMp2ltF4fXGoVb9CyH4ois6yhlX+bOn/5P
 gMToEle0zkmjZNsimu2m8gM2MOZ3jFWw/gat2gw=
X-Google-Smtp-Source: APXvYqwANE84VD2mEyfkvmonNMDigTR3O5rlOu+eaQIrj1gWuit4tat36+yKoaD0buVgo5AQqhGbZ9bQ9cEY0nSrvww=
X-Received: by 2002:a9d:6b96:: with SMTP id b22mr4496345otq.363.1565889561030; 
 Thu, 15 Aug 2019 10:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190815043554.16623-1-benquike@gmail.com>
 <s5htvaj9cre.wl-tiwai@suse.de> <s5hk1beapab.wl-tiwai@suse.de>
In-Reply-To: <s5hk1beapab.wl-tiwai@suse.de>
From: Hui Peng <benquike@gmail.com>
Date: Thu, 15 Aug 2019 13:19:10 -0400
Message-ID: <CAKpmkkWCaLOctG44fD=arD-=oogRVCSxe5rz2UNUAms5q=2pYw@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Mathias Payer <mathias.payer@nebelwelt.net>, security@kernel.org,
 Wenwen Wang <wang6495@umn.edu>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 alsa-devel@alsa-project.org, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>
Subject: Re: [alsa-devel] [PATCH] Fix a stack buffer overflow bug
	check_input_term
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

Hi, Takashi:

One point I want to be clear: if an endless recursive loop is detected,
should we return 0, or a negative error code?

On Thu, Aug 15, 2019 at 2:58 AM Takashi Iwai <tiwai@suse.de> wrote:

> On Thu, 15 Aug 2019 08:13:57 +0200,
> Takashi Iwai wrote:
> >
> > On Thu, 15 Aug 2019 06:35:49 +0200,
> > Hui Peng wrote:
> > >
> > > `check_input_term` recursively calls itself with input
> > > from device side (e.g., uac_input_terminal_descriptor.bCSourceID)
> > > as argument (id). In `check_input_term`, if `check_input_term`
> > > is called with the same `id` argument as the caller, it triggers
> > > endless recursive call, resulting kernel space stack overflow.
> > >
> > > This patch fixes the bug by adding a bitmap to `struct mixer_build`
> > > to keep track of the checked ids by `check_input_term` and stop
> > > the execution if some id has been checked (similar to how
> > > parse_audio_unit handles unitid argument).
> > >
> > > Reported-by: Hui Peng <benquike@gmail.com>
> > > Reported-by: Mathias Payer <mathias.payer@nebelwelt.net>
> > > Signed-off-by: Hui Peng <benquike@gmail.com>
> >
> > The fix looks almost good, but we need to be careful about the
> > bitmap check.  In theory, it's possible that multiple nodes point to
> > the same input terminal, and your patch would break that scenario.
> > For fixing that, we need to zero-clear the termbitmap at each first
> > invocation of check_input_term(), something like below.
> >
> > Could you check whether this works?
>
> Thinking of this further, there is another possible infinite loop.
> Namely, when the feature unit in the input terminal chain points to
> itself as the source, it'll loop endlessly without the stack
> overflow.
>
> So the check of the termbitmap should be inside the loop.
> The revised patch is below.
>
>
> thanks,
>
> Takashi
>
> -- 8< --
> From: Hui Peng <benquike@gmail.com>
> Subject: [PATCH] ALSA: usb-audio: Fix a stack buffer overflow bug
>  check_input_term
>
> `check_input_term` recursively calls itself with input
> from device side (e.g., uac_input_terminal_descriptor.bCSourceID)
> as argument (id). In `check_input_term`, if `check_input_term`
> is called with the same `id` argument as the caller, it triggers
> endless recursive call, resulting kernel space stack overflow.
>
> This patch fixes the bug by adding a bitmap to `struct mixer_build`
> to keep track of the checked ids by `check_input_term` and stop
> the execution if some id has been checked (similar to how
> parse_audio_unit handles unitid argument).
>
> [ The termbitmap needs to be cleared at each first check of the input
>   terminal, so the function got split now.  Also, for catching another
>   endless loop in the input terminal chain -- where the feature unit
>   points to itself as its source -- the termbitmap check is moved
>   inside the parser loop. -- tiwai ]
>
> Reported-by: Hui Peng <benquike@gmail.com>
> Reported-by: Mathias Payer <mathias.payer@nebelwelt.net>
> Signed-off-by: Hui Peng <benquike@gmail.com>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/usb/mixer.c | 36 ++++++++++++++++++++++++++----------
>  1 file changed, 26 insertions(+), 10 deletions(-)
>
> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> index ea487378be17..aa8b046aa91f 100644
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
> @@ -68,6 +68,7 @@ struct mixer_build {
>         unsigned char *buffer;
>         unsigned int buflen;
>         DECLARE_BITMAP(unitbitmap, MAX_ID_ELEMS);
> +       DECLARE_BITMAP(termbitmap, MAX_ID_ELEMS);
>         struct usb_audio_term oterm;
>         const struct usbmix_name_map *map;
>         const struct usbmix_selector_map *selector_map;
> @@ -775,16 +776,23 @@ static int uac_mixer_unit_get_channels(struct
> mixer_build *state,
>   * parse the source unit recursively until it reaches to a terminal
>   * or a branched unit.
>   */
> -static int check_input_term(struct mixer_build *state, int id,
> -                           struct usb_audio_term *term)
> +static int __check_input_term(struct mixer_build *state, int id,
> +                             struct usb_audio_term *term)
>  {
>         int protocol = state->mixer->protocol;
>         int err;
>         void *p1;
> +       unsigned char *hdr;
>
> -       memset(term, 0, sizeof(*term));
> -       while ((p1 = find_audio_control_unit(state, id)) != NULL) {
> -               unsigned char *hdr = p1;
> +       for (;;) {
> +               /* a loop in the terminal chain? */
> +               if (test_and_set_bit(id, state->termbitmap))
> +                       break;
> +
> +               p1 = find_audio_control_unit(state, id);
> +               if (!p1)
> +                       break;
> +               hdr = p1;
>                 term->id = id;
>
>                 if (protocol == UAC_VERSION_1 || protocol ==
> UAC_VERSION_2) {
> @@ -802,7 +810,7 @@ static int check_input_term(struct mixer_build *state,
> int id,
>
>                                         /* call recursively to verify that
> the
>                                          * referenced clock entity is
> valid */
> -                                       err = check_input_term(state,
> d->bCSourceID, term);
> +                                       err = __check_input_term(state,
> d->bCSourceID, term);
>                                         if (err < 0)
>                                                 return err;
>
> @@ -836,7 +844,7 @@ static int check_input_term(struct mixer_build *state,
> int id,
>                         case UAC2_CLOCK_SELECTOR: {
>                                 struct uac_selector_unit_descriptor *d =
> p1;
>                                 /* call recursively to retrieve the
> channel info */
> -                               err = check_input_term(state,
> d->baSourceID[0], term);
> +                               err = __check_input_term(state,
> d->baSourceID[0], term);
>                                 if (err < 0)
>                                         return err;
>                                 term->type = UAC3_SELECTOR_UNIT << 16; /*
> virtual type */
> @@ -899,7 +907,7 @@ static int check_input_term(struct mixer_build *state,
> int id,
>
>                                 /* call recursively to verify that the
>                                  * referenced clock entity is valid */
> -                               err = check_input_term(state,
> d->bCSourceID, term);
> +                               err = __check_input_term(state,
> d->bCSourceID, term);
>                                 if (err < 0)
>                                         return err;
>
> @@ -950,7 +958,7 @@ static int check_input_term(struct mixer_build *state,
> int id,
>                         case UAC3_CLOCK_SELECTOR: {
>                                 struct uac_selector_unit_descriptor *d =
> p1;
>                                 /* call recursively to retrieve the
> channel info */
> -                               err = check_input_term(state,
> d->baSourceID[0], term);
> +                               err = __check_input_term(state,
> d->baSourceID[0], term);
>                                 if (err < 0)
>                                         return err;
>                                 term->type = UAC3_SELECTOR_UNIT << 16; /*
> virtual type */
> @@ -966,7 +974,7 @@ static int check_input_term(struct mixer_build *state,
> int id,
>                                         return -EINVAL;
>
>                                 /* call recursively to retrieve the
> channel info */
> -                               err = check_input_term(state,
> d->baSourceID[0], term);
> +                               err = __check_input_term(state,
> d->baSourceID[0], term);
>                                 if (err < 0)
>                                         return err;
>
> @@ -984,6 +992,14 @@ static int check_input_term(struct mixer_build
> *state, int id,
>         return -ENODEV;
>  }
>
> +static int check_input_term(struct mixer_build *state, int id,
> +                           struct usb_audio_term *term)
> +{
> +       memset(term, 0, sizeof(*term));
> +       memset(state->termbitmap, 0, sizeof(state->termbitmap));
> +       return __check_input_term(state, id, term);
> +}
> +
>  /*
>   * Feature Unit
>   */
> --
> 2.16.4
>
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
