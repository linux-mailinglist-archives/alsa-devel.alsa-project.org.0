Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 381E0357608
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Apr 2021 22:29:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC3661661;
	Wed,  7 Apr 2021 22:28:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC3661661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617827354;
	bh=FKYkwlEz55PIYqzbZIBMobBeDj9ID7JIF+pgzFpDrHA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dmrEY98vdJR4wujmU6oUR92v4JggRBiQPMMseMr+siKfBkjKsfNndim2mrptgoryD
	 4Y2bJwA9km0buTI61bs5dFDW7/U24ty2W6tMjW0ekjmsZrP8BUkz46aLMtFXV3iw+d
	 IuKXezyxezhQnddJQXMg5CwNOX8RMV77WliKfqZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAF43F80482;
	Wed,  7 Apr 2021 22:27:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABCE5F80475; Wed,  7 Apr 2021 22:27:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D231AF8016D
 for <alsa-devel@alsa-project.org>; Wed,  7 Apr 2021 22:26:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D231AF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="tCIrPCR0"
Received: by mail-yb1-xb29.google.com with SMTP id o10so102241ybb.10
 for <alsa-devel@alsa-project.org>; Wed, 07 Apr 2021 13:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rbNh7yltdw+AkuGDUGpgbkU4LoMIJDjlj1/QTFDLucs=;
 b=tCIrPCR0yX0Bpab6lwSLmmSl1B/C818maysI9HSM2aQdpCs/fK/diZJM7npD/niWDD
 wAVry7G+q9pFJxDzK6BuLmsYOQD+BDONcspFHyGdI3V1XIb6v9BM8EMKda3tHZ4P7A0v
 ICMNG9MzbOPdQVQayJCvpTEwpg9FgdpMEg25jLauPfqwdeJSW7v0DeECFrXc6PkVsD1s
 XtRu/AVLzzuVu4sKGLF16bAjQZ8bWFzeJLEILTafsLWqhfwFHlEASBRrs0uHy85W9OYm
 +fgnmYRij0STbIFI3UeHLdAHjjgY3ncTyUiV4gUX8CKIKc34YeVVpToZRbyXBozCJOiG
 mulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rbNh7yltdw+AkuGDUGpgbkU4LoMIJDjlj1/QTFDLucs=;
 b=mQrB5ERB8FmbPj6Z6v2nS6L9R5o26xKPHXSXOIEuvHwF/tS+suUqWqKEthgRi5tUEq
 XTzyAuIYIoZaU9albVk+iPnQP3qIJgSXPtGaFGiEfh8C7AiFTN0fxfrig5Bsv7IQf5Bs
 q4isMG/W2M1/zDzR6syjNZ3Qr+LqUS+1+oU6Qvgtc3VBWsKHEaajTM8N379vKaY0mSOv
 34qgVT0eDV6ZMjXufYdbBEmhbq13Fxnq0TAmDuw5KtM312wDYwJ5sMixQciSgCX8sYwf
 fVcqFbV+FOwfBU7jqJhwgXRMInE8npChz490sYaxVoNLrVBloQ0ImEASgal1QtoTfmiB
 vODQ==
X-Gm-Message-State: AOAM531Nj3unJQ0Ct6rotqK8M/YBluI/sHiSGEfMEaekbck87bZzzNRc
 SuRQNDkhyblo4AFCedx6AxjLxX5Z0wVEQOSqD5hyNQ==
X-Google-Smtp-Source: ABdhPJx+y/H5hjY4qlGZuonMCuXTi5XIOs3jYxodZUoI+nEaxv6c/HyZI2i2qToXNvraO+khicOXX+ChmOes/taV8V8=
X-Received: by 2002:a25:238c:: with SMTP id j134mr3188635ybj.160.1617827216429; 
 Wed, 07 Apr 2021 13:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAHXb3begced9GYCQ4a6qLOK2PrQR9gHeSvb3HAG29DVpZ+vwiQ@mail.gmail.com>
 <CAEsQvcu5freEXMFwBRH0aQsT9=ngvOY_SkA6dmfs_YVvMYYuJw@mail.gmail.com>
 <CAOsVg8p5vefJhR=+8XE+3HoSG0DRp_DF_f9W4zKdzGfJwmGr0w@mail.gmail.com>
 <CAHXb3bdX8=yEVHFPkeM6N51qi-fAdSmnfw5fJcPcd6oApyZXuQ@mail.gmail.com>
In-Reply-To: <CAHXb3bdX8=yEVHFPkeM6N51qi-fAdSmnfw5fJcPcd6oApyZXuQ@mail.gmail.com>
From: Mike Oliphant <oliphant@nostatic.org>
Date: Wed, 7 Apr 2021 13:26:45 -0700
Message-ID: <CAHXb3bdxEWL6SjOB23ahBSOO6SXzb_neSGbjQPkECYGUSceU_w@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: Lucas <jaffa225man@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
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

Lucas - yes, the issue that occurs is that you get sporadic small pops or
clicks in the audio stream.

Mike

On Wed, Apr 7, 2021 at 1:24 PM Mike Oliphant <oliphant@nostatic.org> wrote:

> Hi Lucas,
>
> These are the changes I have made for the GT-1. Note that I also disabled
> the capture implicit feedback since it does not seem to be needed (although
> it still works for me if it is enabled).
>
> If you think about it, it makes sense that playback is using capture for
> implicit feedback, and not vice versa.
>
> Mike
>
> ---
>
> diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
> index 102d53515..99d8b50d4 100644
> --- a/sound/usb/endpoint.c
> +++ b/sound/usb/endpoint.c
> @@ -1375,7 +1375,7 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint
> *ep)
>         if (!ep_state_update(ep, EP_STATE_STOPPED, EP_STATE_RUNNING))
>                 goto __error;
>
> -       if (snd_usb_endpoint_implicit_feedback_sink(ep)) {
> +       if (false) { //snd_usb_endpoint_implicit_feedback_sink(ep)) {
>                 for (i = 0; i < ep->nurbs; i++) {
>                         struct snd_urb_ctx *ctx = ep->urb + i;
>                         list_add_tail(&ctx->ready_list,
> &ep->ready_playback_urbs);
> diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
> index 11a85e66a..ee4243421 100644
> --- a/sound/usb/implicit.c
> +++ b/sound/usb/implicit.c
> @@ -75,7 +75,7 @@ static const struct snd_usb_implicit_fb_match
> playback_implicit_fb_quirks[] = {
>         IMPLICIT_FB_SKIP_DEV(0x0582, 0x0171),   /* BOSS RC-505 */
>         IMPLICIT_FB_SKIP_DEV(0x0582, 0x0185),   /* BOSS GP-10 */
>         IMPLICIT_FB_SKIP_DEV(0x0582, 0x0189),   /* BOSS GT-100v2 */
> -       IMPLICIT_FB_SKIP_DEV(0x0582, 0x01d6),   /* BOSS GT-1 */
> +       IMPLICIT_FB_GENERIC_DEV(0x0582, 0x01d6),        /* BOSS GT-1 */
>         IMPLICIT_FB_SKIP_DEV(0x0582, 0x01d8),   /* BOSS Katana */
>         IMPLICIT_FB_SKIP_DEV(0x0582, 0x01e5),   /* BOSS GT-001 */
>         IMPLICIT_FB_SKIP_DEV(0x0582, 0x0203),   /* BOSS AD-10 */
> @@ -89,7 +89,7 @@ static const struct snd_usb_implicit_fb_match
> capture_implicit_fb_quirks[] = {
>         IMPLICIT_FB_FIXED_DEV(0x0582, 0x0171, 0x0d, 0x01), /* BOSS RC-505
> */
>         IMPLICIT_FB_FIXED_DEV(0x0582, 0x0185, 0x0d, 0x01), /* BOSS GP-10 */
>         IMPLICIT_FB_FIXED_DEV(0x0582, 0x0189, 0x0d, 0x01), /* BOSS
> GT-100v2 */
> -       IMPLICIT_FB_FIXED_DEV(0x0582, 0x01d6, 0x0d, 0x01), /* BOSS GT-1 */
> +//     IMPLICIT_FB_FIXED_DEV(0x0582, 0x01d6, 0x0d, 0x01), /* BOSS GT-1 */
>         IMPLICIT_FB_FIXED_DEV(0x0582, 0x01d8, 0x0d, 0x01), /* BOSS Katana
> */
>         IMPLICIT_FB_FIXED_DEV(0x0582, 0x01e5, 0x0d, 0x01), /* BOSS GT-001
> */
>         IMPLICIT_FB_FIXED_DEV(0x0582, 0x0203, 0x0d, 0x01), /* BOSS AD-10 */
>
> On Wed, Apr 7, 2021 at 1:18 PM Lucas <jaffa225man@gmail.com> wrote:
>
>> I didn't notice anything wrong when I added my Roland device IDs to your
>> patch's method.  Its information can be found here, but I really doubt it
>> applies to your issue, other than Takashi Iwai's simplified
>> capture-quirk-only table patch (which Geraldo already mentioned):
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=212519
>>
>> Since I built my patch upon your previous patch, is there anything I can
>> do to test it on my devices for you?
>>
>
