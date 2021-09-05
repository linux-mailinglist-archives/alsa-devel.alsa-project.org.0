Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCD0400E98
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Sep 2021 09:44:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C6C8186C;
	Sun,  5 Sep 2021 09:43:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C6C8186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630827886;
	bh=B5ndkoWSCNQXyJtV5esvMKTQhGRbacUUVPBqfEuTtKs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i98U0ORo17fx6w2mGQJFdTE9FWfIUkcWFfqJjZW/5cDm0l0tzEV3/nPLyw+g0BZ/x
	 Ie5VVMV2XbfNYkiIlsKC7NHlerhJ1rQzLodH/ETj7ocUApvFELaKjCArP6vdIuhmct
	 0RBzrr6ZZy2uaASWFn6TgVyDVOKK/eOl7+wj/8s8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7EBBF8011C;
	Sun,  5 Sep 2021 09:43:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45E60F80253; Sun,  5 Sep 2021 09:43:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0588F800D0
 for <alsa-devel@alsa-project.org>; Sun,  5 Sep 2021 09:43:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0588F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bAQz0LfA"
Received: by mail-qv1-xf34.google.com with SMTP id p17so2303113qvo.8
 for <alsa-devel@alsa-project.org>; Sun, 05 Sep 2021 00:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5opesWK9zYtMzojWQh36J6PDCuHdc4NjGKka+0Th8pU=;
 b=bAQz0LfAUNmbQPlFi0vSRIBJ14DI6mBo5/+PItOule6jmCzEYF/opolw59xay5HIrs
 QStjXHw9wElG0l+CCkpNgTcGOWYKgy6tUfCulLPmQBYSczLJDDXkXXC29h7rOeN5KKl/
 1JmoNL2szKcaRDL1AG3A4FDVFqiGXhk3GNx8R9tvzQHycErtv37kWoe9cUWsnLPERUEp
 ZplsIxGO/f4G6WW6cJZtlWSLm0MrMwjcA4HFJZ9v4cmsFy68x9NWSBil5YeGNxkKsKzG
 1BTMb2iEjGDC/QUjm8iQhfPuTPjaqHEP0YkZNtw2AWjxdhYytWwJ9taxQRrfKs3cMiJS
 +E/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5opesWK9zYtMzojWQh36J6PDCuHdc4NjGKka+0Th8pU=;
 b=myM20QbgS+Ua9OTrp8/46ouoTldMBpT2+OKvfa939TpOp+WAD8hnHoa59PmMPE5m9/
 hgaALziAhh/Z5saI1SOpZT3vlrzy9wT2YBvANciXNZ3PDweucREKdVL7W/3gHJg4rnib
 iUcZIJ5mF2AnKfe6cQnCoT2Zrgezf3G1fVBdJZ8wj76TThZeeqo+ikn415eNlZNusP33
 h35jMOBg6lnbcJ0cb1GcRGIkdIinI5Ma9z2LYt7bkU/gIuwECaBEZ4fvDrTyi2Px8aLe
 wYT3oOUqu6YepH3DWwYUWwsQ/mMjLOZR6qEkibiuiZNxtYfxUsFhvNREy+8o5mbAQfBB
 KsAg==
X-Gm-Message-State: AOAM5333VfoIdS6PUD1puTLdcyFG5uyb3kl8tAAvLSl4XioUTTXkpj2j
 giiBd6dt11v5agzdpu/TTlC3MEKDhI8I7H1fzZo=
X-Google-Smtp-Source: ABdhPJzvMpW2Bh+zCRmzHFF5yKxPUIiVrya7enov8XhH5XzswrUMnXrVKVfMD4v6CWRO8lwWl01vgIB8yoMFIx+0Wx8=
X-Received: by 2002:a0c:d6cd:: with SMTP id l13mr6865252qvi.24.1630827794967; 
 Sun, 05 Sep 2021 00:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <AocgHmB2Ef4GBJ23rjESzap7qD-DEoZebCYfPBi6khX9i8EdCi2r2Grku-4IY3YBSOD2Bc1HeZFxI-lujMMGKlgW88wh1uwjLbdlXpfd96U=@protonmail.com>
In-Reply-To: <AocgHmB2Ef4GBJ23rjESzap7qD-DEoZebCYfPBi6khX9i8EdCi2r2Grku-4IY3YBSOD2Bc1HeZFxI-lujMMGKlgW88wh1uwjLbdlXpfd96U=@protonmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Sun, 5 Sep 2021 04:47:26 -0300
Message-ID: <CAEsQvcsM1cxP9r6tS=zp80++dca6UB7N_8khVeXRtN6vMhuPLQ@mail.gmail.com>
Subject: Re: Asus Xonar SE front-panel audio support quirks snd_usb_audio
To: smesgr <smesgr@protonmail.com>
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

Em Qua, 1 de set de 2021 13:24, smesgr <smesgr@protonmail.com> escreveu:

> Greetings,
>
> I have bourght a Asus Xonar SE (90YA00T0-M0UA00) which is only working
> partially. While the rear connectors seems to work the front header is not.
> I found some reports scattered around the internet with the same issue but
> without a solution.
>
> It is a PCIe card with an pcie-to-usb interface. Thus the card is reported
> as a usb device:
> ID 0b05:189d ASUSTek Computer, Inc. Xonar SoundCard
>
> The card has several audio Endpoints EP 5 to EP 9 and an additonal HID EP
> 4. All the rear connectors seems to work. Can't test the SPDIF but found a
> SE specfic quirk in the alsa USB configuration for the SDPIF PCM thus
> assume this issue was already fixed.
> EP 5 -> Audio Out
> EP 6 -> SDPIF
> EP 8 -> Line In
> The rear connector don't have a plug-in-detector, the front-panel has and
> is working:
> node hw:1, #16 (0,0,0,Headphone - Output Jack,0) VALUE
> node hw:1, #31 (0,0,0,Mic - Input Jack,1) VALUE
>
> In stereo configuration the card has "headphones" and "speaker". The Front
> Panel input nor output is working. If headphones is selected the rear is
> disabled but the front header is not working. Side note the default
> Microsoft driver has the same issue so I assume the card usb configuration
> is faulty.
> I installed the ASUS driver and tracked the USB messages with wireshark in
> a Windows VM. I noticed the Asus driver uses those additional posts
> EP 7 -> Front Audio Out
> EP 9 -> Front Audio In
>
> Neither the default Windows, nor alsa use those EP. Is there a way to
> force the alsa driver to use EP7/9 to further analyse this issue?
>
> Best Regards
> Smesgr
>
> Sent with ProtonMail Secure Email.


Hi Smesgr,

In my humble opinion I think there's a high probability this will not be
standard UAC compliant code that can help you much, specially since you
mention the Microsoft driver has the same issue.

In any case it may be just needing a snd-usb-audio "quirk" but I don't
think it would be so easy.

Unfortunately the best chance of making this work is reversing the ASUS
protocol either by capturing USB pass-through to a Windows VM with the
proprietary driver loaded or native Windows USB capture with USBPcap.

Either way you seem to have a sniff already. So the hard part is figuring
out what the alien protocols does, how it does so, and then reimplement C
kernel code for it.

Not the easiest of tasks but hopefully you will get the taste for it.

Good luck,
Geraldo Nascimento
