Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD30A3FFC
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 23:52:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90254822;
	Fri, 30 Aug 2019 23:51:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90254822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567201968;
	bh=i8nRiwYj9RwsWTL/eNvdB7pn7NRuzW9RqeeXDf27ofA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZgMaN//Bpnd5C0OoBo2bwBDPj/+MPpLYmuifopyMQ4n6Gb34AEwM3zHXbUjIKdqX7
	 nEdFYNiGKNevu1pbhTS5c7HQhP8itjHRH2HEPwr6pnLsMwsjLbRoY3gtj27s8CWdda
	 hV0MQYW55KpFRdgh37aL3UfP2geXRuzwjrNClkaI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCCF8F8038F;
	Fri, 30 Aug 2019 23:51:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F144F8036C; Fri, 30 Aug 2019 23:51:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0ECD4F800D1
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 23:51:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0ECD4F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Q7+WLGvv"
Received: by mail-oi1-x243.google.com with SMTP id t24so6451882oij.13
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 14:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EYVJ7MzUyR9L8mnD6x6xfhJt9xUFwuiD7b/zQt4J8WQ=;
 b=Q7+WLGvv04v/KICX5xUFXDOLtByK/lZQo/5I2vz39BPJ2fvZtQRmuDPAk4VX08bepd
 Kqnjt4DZgcxXerN0lVGgS6ADGLd44TDPrCtopimhUeZnelWaEcgtio10JYTpr4XnNIFn
 cbSGG6seH45mkfI4igDgjnp/74IaoPta74akCYZeoHNwYfkmnMCMtZ0i1peIlrgmLbNx
 iR1Rg0RyUixyqVrL//96ezh3jEHZx7yA5DjeenHR7NwsRP/YZRRN8TbJsB4qZlV9XH77
 9EGRQC3kzV9iqk6i2MpRMjMum0ogB7c+qWEHngH1PTNkqZvVmfMstNmYbY1ZEjpLNbGg
 gDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EYVJ7MzUyR9L8mnD6x6xfhJt9xUFwuiD7b/zQt4J8WQ=;
 b=XCcr1SruQqg65jab7OZEhLUbLpUZLZuwhdvhCb54mnVv+kRI764yTmL/UBbW5fbLNT
 y06Xyr+FzxII3OahVz+huVDxafHCqkR1t1WyG0pLKU/PV/LRYMkITsh/QQzQ/LIJoi5C
 23+O+iX/QeRH1yetPfpOcVPe7b+uHW55Rea2iYalmsB+j7epIBxNgcphI17NCVVKzlME
 u9aFdPO85Q1xpk4KaQX+BRYooAkxG3HQefmzlMnEAlVRZL1AgqRu2ZEhS/DLBThIC6kw
 i/5saNMGxuIzocBvKCmL8bMKzDSnTspX6+1KWcx6cJpiAj0qMruMM7Y/6irBHFIVLYt+
 Z+9A==
X-Gm-Message-State: APjAAAXDMEed08ezGDHopo4VlF9HRFDkOpMK0WrRAS/caL+gZlRc6PEL
 CxX2hgWPQxaCeRDMJFkDtWIf0sWyyQ8n/Zcr9g4=
X-Google-Smtp-Source: APXvYqxF8xTQHnXcu6cO47D0huh4Dq7d9Ur9eR3xC8GfmPSmN1JdmobuREz1pe7xjAKLA5B/M3xErknKC3rMtGV+TdE=
X-Received: by 2002:a54:448e:: with SMTP id v14mr11808792oiv.60.1567201888984; 
 Fri, 30 Aug 2019 14:51:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190830214730.27842-1-benquike@gmail.com>
In-Reply-To: <20190830214730.27842-1-benquike@gmail.com>
From: Hui Peng <benquike@gmail.com>
Date: Fri, 30 Aug 2019 17:51:17 -0400
Message-ID: <CAKpmkkWv2cjrJCkVhGmEMnLG2_kCNxdbt29dZ8j-UM8Cf3quGQ@mail.gmail.com>
To: stable@vger.kernel.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Mathias Payer <mathias.payer@nebelwelt.net>, alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wenwen Wang <wang6495@umn.edu>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 2/2] Fix a stack buffer overflow bug in
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

This is the backported patch for the following fix to v4.4.x and v4.14.x:
19bce474c45b ("ALSA: usb-audio: Fix a stack buffer overflow bug in
check_input_term")

On Fri, Aug 30, 2019 at 5:47 PM Hui Peng <benquike@gmail.com> wrote:

> `check_input_term` recursively calls itself with input from
> device side (e.g., uac_input_terminal_descriptor.bCSourceID)
> as argument (id). In `check_input_term`, if `check_input_term`
> is called with the same `id` argument as the caller, it triggers
> endless recursive call, resulting kernel space stack overflow.
>
> This patch fixes the bug by adding a bitmap to `struct mixer_build`
> to keep track of the checked ids and stop the execution if some id
> has been checked (similar to how parse_audio_unit handles unitid
> argument).
>
> CVE: CVE-2018-15118
>
> Reported-by: Hui Peng <benquike@gmail.com>
> Reported-by: Mathias Payer <mathias.payer@nebelwelt.net>
> Signed-off-by: Hui Peng <benquike@gmail.com>
> ---
>  sound/usb/mixer.c | 29 ++++++++++++++++++++++++-----
>  1 file changed, 24 insertions(+), 5 deletions(-)
>
> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> index 10ddec76f906..e24572fd6e30 100644
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
> @@ -81,6 +81,7 @@ struct mixer_build {
>         unsigned char *buffer;
>         unsigned int buflen;
>         DECLARE_BITMAP(unitbitmap, MAX_ID_ELEMS);
> +       DECLARE_BITMAP(termbitmap, MAX_ID_ELEMS);
>         struct usb_audio_term oterm;
>         const struct usbmix_name_map *map;
>         const struct usbmix_selector_map *selector_map;
> @@ -709,15 +710,24 @@ static int get_term_name(struct mixer_build *state,
> struct usb_audio_term *iterm
>   * parse the source unit recursively until it reaches to a terminal
>   * or a branched unit.
>   */
> -static int check_input_term(struct mixer_build *state, int id,
> +static int __check_input_term(struct mixer_build *state, int id,
>                             struct usb_audio_term *term)
>  {
>         int err;
>         void *p1;
> +       unsigned char *hdr;
>
>         memset(term, 0, sizeof(*term));
> -       while ((p1 = find_audio_control_unit(state, id)) != NULL) {
> -               unsigned char *hdr = p1;
> +       for (;;) {
> +               /* a loop in the terminal chain? */
> +               if (test_and_set_bit(id, state->termbitmap))
> +                       return -EINVAL;
> +
> +               p1 = find_audio_control_unit(state, id);
> +               if (!p1)
> +                       break;
> +
> +               hdr = p1;
>                 term->id = id;
>                 switch (hdr[2]) {
>                 case UAC_INPUT_TERMINAL:
> @@ -732,7 +742,7 @@ static int check_input_term(struct mixer_build *state,
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
> @@ -764,7 +774,7 @@ static int check_input_term(struct mixer_build *state,
> int id,
>                 case UAC2_CLOCK_SELECTOR: {
>                         struct uac_selector_unit_descriptor *d = p1;
>                         /* call recursively to retrieve the channel info */
> -                       err = check_input_term(state, d->baSourceID[0],
> term);
> +                       err = __check_input_term(state, d->baSourceID[0],
> term);
>                         if (err < 0)
>                                 return err;
>                         term->type = d->bDescriptorSubtype << 16; /*
> virtual type */
> @@ -811,6 +821,15 @@ static int check_input_term(struct mixer_build
> *state, int id,
>         return -ENODEV;
>  }
>
> +
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
> 2.17.1
>
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
