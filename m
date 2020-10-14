Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B5428E163
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 15:35:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1847F16EE;
	Wed, 14 Oct 2020 15:34:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1847F16EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602682507;
	bh=3JFrOyzq7G9OgXaPqTSZV6p/WpX0iWSWjxtDiqZWHzg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mmvoevm3PFTQJD69GDcjIQGx2Vrsk7lHrsttoCZeMZ/I92gu0pqDcvf8mAHDgvDqS
	 EION+VAbLZXYD5J5ct3M+WQ6wjz36/XlU83fVD6iR5jNdgU2BWaWu3O+OeeHu75wiZ
	 pE8TPXXDStiUnyUlzmKGypwVVKwq2eBGPVuFy+pM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8517AF800F6;
	Wed, 14 Oct 2020 15:33:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 092D9F80217; Wed, 14 Oct 2020 15:33:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 474D8F800F6
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 15:33:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 474D8F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=superlative.org header.i=@superlative.org
 header.b="00/avvSb"
Received: by mail-ot1-x343.google.com with SMTP id d28so3441486ote.1
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 06:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=superlative.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GUMxDcH9c02+JwnSiudEq2EXb+vMdfz9SmUJNh2hlkA=;
 b=00/avvSb3bd/dab4zt+dDTZxJBZhlYStPCMi8fnDeF3y5Bb4FecQHawG2tFgL59VXD
 8E48WftzphrX5fXJVr97cyqVyLYM4cYj7PWEsCAVOnx1cJfEtu4LPQxSmMhdPIxi+muu
 NprzXkpqyykY77rAD9+HZWaJ4GLc0/ZbPA+jnuwxvj8wgUNHGQJFdz/2Cnlxp4KG8P8E
 qi6ps0D50KdEdBc9nkDHLd+fYCRI60to95n9L4OQw2iiAS3k6GFKO1VJNClLTSMaAHvY
 zwoM6LO5PNeKdSb4N9bVHImWC7zn8pQTPf8ugTWoTyUbqxQZ4mUeMeHMuscqFZIxLz3s
 3rag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GUMxDcH9c02+JwnSiudEq2EXb+vMdfz9SmUJNh2hlkA=;
 b=pmUmm88YS8vzeaRZ2/4qVIZUQdX/nXmIMxRZg7brETyw5JwfDlEd2SQkeJco8aSA6e
 Gt5dwLVITmz3rYL5erIl1xSxEsCfNFEtk5l7Nr19/ejfelqR7HcD9WB1/XdU32n0ml+4
 PhNnyT0PKk/lZd2P8rAu+XfvMG07XzaqaILT82Go6pxL9ZzmIfstoZWcLdJe4r2Nf1rc
 P2RewyxO3CKe5kbCEzAp4C4x45tGvj9m4qqzYwY392XXw92LRTm1uHufxTzdhdyH8juq
 RQm29J5QiarnnLrH74JrO1SfPjZudPewOvDOIjOhUq3bnEVmPB2fKVzz/HDBMNxxuuKs
 klEQ==
X-Gm-Message-State: AOAM531kbOgISvstUwrKXfVR4x3oSV63a0dk1FCygM0ZGeFCpbUTQY+B
 9A3tqfJD7HdC2AmTO3A2PSjnlHnpn53mDN/sox1luQ==
X-Google-Smtp-Source: ABdhPJzPXf/CoXFBIwfz6Oz68bQ/BBLgQ8qqQoh4SmHBBl90ozH2Z9oXMsFGwXt8CWeE/aJVavobtwmKuhfEb/ksJU8=
X-Received: by 2002:a9d:1b06:: with SMTP id l6mr3370259otl.313.1602682393888; 
 Wed, 14 Oct 2020 06:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20191011171937.8013-1-szszoke.code@gmail.com>
 <s5hftjriy1q.wl-tiwai@suse.de>
 <CAPMdQDmY7CdbrHyOwhJNFBREQ0EO1SKufRdN_YR6TG4zmJzXpA@mail.gmail.com>
 <s5hy2k9j6no.wl-tiwai@suse.de>
In-Reply-To: <s5hy2k9j6no.wl-tiwai@suse.de>
From: Mailing Lists <maillist@superlative.org>
Date: Wed, 14 Oct 2020 14:33:03 +0100
Message-ID: <CAPMdQDnDOF7a9vwuFa1GyFQmZQY4GvDKPeY_NMu2kUDQfqo7fg@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: Disable quirks for BOSS
 Katana amplifiers
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Mike Oliphant <oliphant@nostatic.org>
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

Thanks for the response Takashi,

How should this be distinguishing between Roland and BOSS? They both have
the vendor ID 0x0582.

Cheers,

Keith

On Wed, 14 Oct 2020 at 14:09, Takashi Iwai <tiwai@suse.de> wrote:

> On Wed, 14 Oct 2020 14:17:35 +0200,
> Mailing Lists wrote:
> >
> > Following up on this, it appears there are a bunch of the
> newer-generation
> > Roland/Boss devices which need similar treatment.
> >
> > So far I have tested the GT-1, the GT-001, and the BR-80, and others have
> > reported the RC-300 as working with similar modifications. I have been
> using
> > the following change to the code in pcm.c set_sync_ep_implicit_fb_quirk:
> >
> >     case USB_ID(0x0582, 0x01d8): /* BOSS Katana */
> >     case USB_ID(0x0582, 0x0130): /* BOSS Micro BR-80 */
> >     case USB_ID(0x0582, 0x0138): /* BOSS RC-300 */
> >     case USB_ID(0x0582, 0x01d6): /* BOSS GT-1 */
> >     case USB_ID(0x0582, 0x01e5): /* BOSS GT-001 */
> > /* BOSS Katana amplifiers and many other newer BOSS devices do not need
> quirks
> > */
> >
> > There's probably others too, such as the GT-100 (I believe the GT-001 and
> > GT-100 have similar hardware).
> >
> > My question is, should this just be submitted as a patch to pcm.c or
> would it
> > be better handled in quirks and, if so, how?
> >
> > Or something else?
>
> Do we really need this change at all?  I looked at the code again, and
> I noticed that basically the function should return 0 without setting
> anything else even if you don't have the explicit ID checks there.
>
> The function looks like:
>
> static int set_sync_ep_implicit_fb_quirk(struct snd_usb_substream *subs,
>                                          struct usb_device *dev,
>                                          struct usb_interface_descriptor
> *altsd,
>                                          unsigned int attr)
> {
>         ....
>         switch (subs->stream->chip->usb_id) {
>         ....
>         case USB_ID(0x0582, 0x01d8): /* BOSS Katana */
>                 /* BOSS Katana amplifiers do not need quirks */
>                 return 0;
>         }
>
>         if (attr == USB_ENDPOINT_SYNC_ASYNC &&
>             altsd->bInterfaceClass == USB_CLASS_VENDOR_SPEC &&
>             altsd->bInterfaceProtocol == 2 &&
>             altsd->bNumEndpoints == 1 &&
>             USB_ID_VENDOR(subs->stream->chip->usb_id) == 0x0582 /* Roland
> */ &&
>             search_roland_implicit_fb(dev, altsd->bInterfaceNumber + 1,
>                                       altsd->bAlternateSetting,
>                                       &alts, &ep) >= 0) {
>                 goto add_sync_ep;
>         }
>
>         /* No quirk */
>         return 0;
>
> ... and the lengthy if-conditions after the switch/case is applied
> only for Roland devices, hence it shouldn't influence on BOSS
> devices.  After that point, the immediate return with 0, which is the
> same as we do in switch/case.  So the explicit check of BOSS devices
> there looks superfluous.
>
>
> thanks,
>
> Takashi
>


-- 
-- 
Keith A Milner
