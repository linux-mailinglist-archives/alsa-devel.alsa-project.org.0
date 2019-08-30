Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 836D9A3FFB
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 23:52:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15E7686F;
	Fri, 30 Aug 2019 23:51:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15E7686F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567201922;
	bh=rEQrnX5MdIhHHO/lwqVpB/lVXxaOmijC9FyY0EyFRtg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lwDzwK1+GJq/7HEn3fY35X2phIBq27aHWj0Oi23Ryq8OLDaucagwqaRjmfQPjMg0h
	 IgqrXiYU8q9/srVyFYr4HJSz4wIr2CB9vaET0Fe9/b+c5mKmPdXobGMRH5VtwbQSsW
	 XjtRXaQW8Z/1CJV3UxZ6lVEkM9kK3bKRIHSI7DTw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2D12F80444;
	Fri, 30 Aug 2019 23:50:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 656D9F80377; Fri, 30 Aug 2019 23:50:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BFFAF800D1
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 23:50:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BFFAF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Z50QrVzD"
Received: by mail-ot1-x341.google.com with SMTP id 100so8358340otn.2
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 14:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FmrRQqXKQFXuwoIiIFMMb7HdMeI1iC4b0/0JEbNCbVg=;
 b=Z50QrVzDoq4KZSUEqwjX7UhwGL3An+t3PlnKYsZ75RyLeDvJLhW+tv2mMv7MV/mYB+
 Rms0p88CoCM2p+s4ojP+wRKoHlX2EYxREZdwIPBXrv/Xhz++z9NiLcbSGQY2xEj8ZH0S
 Ztz9Dj1yU+lNU6bXwIGgslOMvzLnt0U1fweK24jAQSF1mkLgaNLieKjY8R13hA/QRsco
 7y7ShrQzwT1n2OO6eNLI7yhSKjazGf2/kY4VzH1uTvxXRonc/nqIhOrKODTr5a4SWWmW
 0VlrLYRLrQ8KhM8dd8k9Qm+dj60ygQUEzH5IrTJr99dNZ0sgWEluy0UQJF2tU/HPorfC
 dEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FmrRQqXKQFXuwoIiIFMMb7HdMeI1iC4b0/0JEbNCbVg=;
 b=joLJGRVpHdM09mBxbzoy9lZeDDQgq+AMDoaQvAH5w+Zp7pL0ya3I4zPfGmc3cegkRU
 QA8CCmTue+DXVWXHaiYiVYN03KiB1O3oHoOj1pHVlXn7DOplXVsxxckulqXcCAMCzj0z
 CTTq2ErmS+IhDhTo+FwYWd6APebYftRn8y/YcV5pvF0vm7JrE6NeXNlCfdoFbPIyL94g
 mROyZHTa+QtoXO6gcsFXLHTlpNdeV9kOxsVTY86RiJTCGQZGLTZtc30SnEEKqLHyJqMg
 OKWh6BcDtE0SDkI1UvH+jvMRwzufBBor+pGVrY96UbX+iz0xmkkeXzbItT27s/DVvz5I
 beFA==
X-Gm-Message-State: APjAAAVrjMJvJY78peS4y3KNe10fP97YRq36BLeUOhAAxa5KcpBZMt+g
 rgRsJCHY+O5sHN9OsfhzrbJYF5LVAKCTajj8eo8=
X-Google-Smtp-Source: APXvYqzKxz+yWl39edixFxoTCZcKBwu5jpf9AmOF+lCEEbUiP+yR+9fEUJFQOYODrSRPXSbK0iIKlH0ESyXDZNjmxbg=
X-Received: by 2002:a9d:6c0e:: with SMTP id f14mr3823152otq.6.1567201810513;
 Fri, 30 Aug 2019 14:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190830214649.27761-1-benquike@gmail.com>
In-Reply-To: <20190830214649.27761-1-benquike@gmail.com>
From: Hui Peng <benquike@gmail.com>
Date: Fri, 30 Aug 2019 17:49:59 -0400
Message-ID: <CAKpmkkVQ2fbL47JrbVMrfCenPShjjwfkS9MY0Ay5MpyFjftxpg@mail.gmail.com>
To: stable@vger.kernel.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Mathias Payer <mathias.payer@nebelwelt.net>, alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wenwen Wang <wang6495@umn.edu>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 1/2] Fix an OOB bug in
	parse_audio_mixer_unit
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

This is the backported patch of the following bug to v4.4.x and v4.14.x:
daac07156b33 ("ALSA: usb-audio: Fix an OOB bug in parse_audio_mixer_unit")

On Fri, Aug 30, 2019 at 5:47 PM Hui Peng <benquike@gmail.com> wrote:

> The `uac_mixer_unit_descriptor` shown as below is read from the
> device side. In `parse_audio_mixer_unit`, `baSourceID` field is
> accessed from index 0 to `bNrInPins` - 1, the current implementation
> assumes that descriptor is always valid (the length  of descriptor
> is no shorter than 5 + `bNrInPins`). If a descriptor read from
> the device side is invalid, it may trigger out-of-bound memory
> access.
>
> ```
> struct uac_mixer_unit_descriptor {
>         __u8 bLength;
>         __u8 bDescriptorType;
>         __u8 bDescriptorSubtype;
>         __u8 bUnitID;
>         __u8 bNrInPins;
>         __u8 baSourceID[];
> }
> ```
>
> This patch fixes the bug by add a sanity check on the length of
> the descriptor.
>
> CVE: CVE-2018-15117
>
> Reported-by: Hui Peng <benquike@gmail.com>
> Reported-by: Mathias Payer <mathias.payer@nebelwelt.net>
> Signed-off-by: Hui Peng <benquike@gmail.com>
> ---
>  sound/usb/mixer.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> index 1f7eb3816cd7..10ddec76f906 100644
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
> @@ -1628,6 +1628,7 @@ static int parse_audio_mixer_unit(struct mixer_build
> *state, int unitid,
>         int pin, ich, err;
>
>         if (desc->bLength < 11 || !(input_pins = desc->bNrInPins) ||
> +           desc->bLength < sizeof(*desc) + desc->bNrInPins ||
>             !(num_outs = uac_mixer_unit_bNrChannels(desc))) {
>                 usb_audio_err(state->chip,
>                               "invalid MIXER UNIT descriptor %d\n",
> --
> 2.17.1
>
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
