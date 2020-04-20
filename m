Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 386EE1B0425
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 10:17:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6EDB1672;
	Mon, 20 Apr 2020 10:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6EDB1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587370621;
	bh=lcag6KEH3cWnkQrerBf97Iun089rQdmB+Tl33zPBS1k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eXd5g4SokFh4fjYGpQ/JYhVExzHnFvnTQBjvnaj6lFLz2n7RGxvRLuNmO9kDOSeHb
	 CIfPREBe02iXzytdItIgJUs0DvyLOkEeye/gIxA6v3xzPbfocK5Kh4diJahTY9hoZX
	 izvOmXRliZQyxodSR9+qTpoZ2/QFpHI/NWbsm7jI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 362D4F80292;
	Mon, 20 Apr 2020 10:13:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2822CF801D9; Mon, 20 Apr 2020 09:49:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F3BDF800C8
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 09:49:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F3BDF800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ETqClMEa"
Received: by mail-ot1-x32e.google.com with SMTP id i22so7262700otp.12
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 00:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kupX88peHj7z03pMK+BIy6RR5VeQ/oEo17K/fUIVFI8=;
 b=ETqClMEaRQGsBDrkRvZOpIv+A/gJTJp/ISa0kGwXW8Es0ItmXWBa12avReKrR4hKlh
 4PAwRHLeOLNTVbMmefdF99Kwbz9KCcCyAAH8kg/P9ejwtdGUElVUV53Rr24PIQWpOnWM
 SJAxV8BlZUXbD7rQDIjBAImGQTqEAWI27yfP1bOlxACW+P4neiWM4gaZy8hYF9A5LMx3
 R2DRv89Zy5V9AisuFyWm/JWUkXa8gMybuupP2K9VCV291csLjFmGWqNqsZQVj+bAaSf0
 N124XD9BzIsKVivCgIwEPrdm78hZpAYPD8I+hsZ27xoU4qd4OVHkx7aKrmqPGsMHgR0z
 +/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kupX88peHj7z03pMK+BIy6RR5VeQ/oEo17K/fUIVFI8=;
 b=Me3P69sGsaT8jvhuj32k+Q02lgiev/Nbn1bs638GwxiIMC4zkE5ZNa5cevF/V9nwXk
 gO80ZZP+Zhe3/V9Xn/9M3egjItMhc5vODlaBoP7EVKL9Y+0+7b+jYMJJhwaAsOOpltm0
 q85AI28PUMDYMwiybZq8QSLchdXP4tZARSjV4PRSqIPXyuTg+TzS5iGD+7aOSrRYB7Qt
 cyjBZlL4T8v4HXoD41Af5oyR8lom5ttE6YAdH1gHA1KRKkJ4ymuxHHRlS/oD9FxlKE0x
 V/zCNLkwM1JU0ykqtv0pynVdMOhDtjAlHwQsnhKu+6IYIM7Y/t6vKM8A1A2Y9qBeFU9p
 koqg==
X-Gm-Message-State: AGi0PuaF+fB9WQQiiaZeTMING/rIFjAVfcSLolXJw5IfDKI44tqAok0I
 XdhS2E3BwpimOmE43innDSRfpfgskFh/KK53NRo=
X-Google-Smtp-Source: APiQypIYgLJ4p85nuk+m8qbyCQDui2Fan3kA5AKYexSlb6eiFzikHLe6x10TeUTfMOcjwgPK6FZbC6iT6teI6wEmmfI=
X-Received: by 2002:a05:6830:3150:: with SMTP id
 c16mr8097421ots.251.1587368956872; 
 Mon, 20 Apr 2020 00:49:16 -0700 (PDT)
MIME-Version: 1.0
References: <CANTwqXB+Lq1fq0dXUjToL9JhjcfSFwtqPpiFoRcFZeJC3o0s-g@mail.gmail.com>
 <s5hftcy7gr8.wl-tiwai@suse.de>
In-Reply-To: <s5hftcy7gr8.wl-tiwai@suse.de>
From: =?UTF-8?B?5Lq/5LiA?= <teroincn@gmail.com>
Date: Mon, 20 Apr 2020 15:49:06 +0800
Message-ID: <CANTwqXD41wbSV_44AQZU6MmGNGChjjKzL_4VCYVBzZYwjVauDQ@mail.gmail.com>
Subject: Re: sound: usb: usx2y: is it a null pointer deference in function
 usX2Y_rate_set?
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 20 Apr 2020 10:13:37 +0200
Cc: alsa-devel@alsa-project.org, tiwai@suse.com
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

you can patch it and add a Reported by  Lin Yi <teroincn@gmail.com>
if  pleasure.~

thanks,

Lin Yi

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2020=E5=B9=B44=E6=9C=8820=E6=97=A5=E5=
=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=883:34=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, 20 Apr 2020 09:22:11 +0200,
> =E4=BA=BF=E4=B8=80 wrote:
> >
> > Hi, all:
> >     when reviewing function usX2Y_rate_set, here may exist a NULL
> > pointer deference if kmalloc_array failed or usb_alloc_urb failed,
> > in cleanup,  we should judge whether us->urb[i] is NULL first.
>
> Right, that's a missing check.  Would you submit the fix patch, or
> shall I write quickly?
>
>
> thanks,
>
> Takashi
