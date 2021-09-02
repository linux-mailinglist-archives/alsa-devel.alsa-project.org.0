Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C72553FF3DC
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Sep 2021 21:07:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5713517CE;
	Thu,  2 Sep 2021 21:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5713517CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630609670;
	bh=eY3+vrlwzAT39D31hRfuvWUkZADTbolAO6Y5r7q+UgM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kgUej1dHinfOoT3rs2dLZ1Z/s/hxBuoH+zrBHrv+1zHT7LR9I9tvyJpjy5mj5lCuF
	 56k1Q3JLLp8BXK1CCvmEmbOAW5sZTSaijWSLcfXJDvBhYRPZprVBq+Ep/y4bNUofY8
	 WJ6vqhSTvZY4reAVhTpw6NWSWw3XxuMUeVYRIRn4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABA7DF8028D;
	Thu,  2 Sep 2021 21:06:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F26EF80269; Thu,  2 Sep 2021 21:06:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A125F8020D
 for <alsa-devel@alsa-project.org>; Thu,  2 Sep 2021 21:06:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A125F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PxGPkWz2"
Received: by mail-qt1-x835.google.com with SMTP id g11so2523229qtk.5
 for <alsa-devel@alsa-project.org>; Thu, 02 Sep 2021 12:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TIcAtljHfedriNpW7YZ/qXtjFD4xkkkqOii1mLfDZo8=;
 b=PxGPkWz2KWi8Jm9uh2gtVUEOnMxFSGEGtPCfvOKHDeMBl6hYcbbJcPIOzh2xcm+D2K
 CYvX0C25Pvnd0YNzU/3uUxTlbqxymI+7CxJjIQdD4lsZdhtHNAsWzN9dlfp0JuFnDISG
 jXWqsjYKpPB34TTeQebXYypim/3ZxGvDHWeijvpbs/bRQymiv4zrXlnC/NdHHBxCIEk1
 6PlvukBwY8Lg6662/H03mKjQXzknd3dAuuEHnOsss8DI2xm47g365QBcFHexjBf9lBBk
 jSBvW86dLK2DhwYC3KAkPnwXKp82cAgzEfaw5SMscFHZszMBCYKnh/HCRfJabZg0wUGY
 TByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TIcAtljHfedriNpW7YZ/qXtjFD4xkkkqOii1mLfDZo8=;
 b=QHEZR3N9qhGh2IFqVLFzhptNMYkQy2WUj5FtptGNPcq0CX81W7B4xhgepegoVkjC62
 hjxpIy6PyD52yFJPGgp/DtxAYYe+kj0uSe23b27AKBk0l5pPOV5xn2K7L6hv09TxykZn
 9ov/3xB3BIYHgc7x9pviTVgzLMNU56KHcE8PAfMzxbUYhrlodfeXpGYFliGq2d5fLOo7
 iw+sExnQENxDxeYJ9dZ1+iejqfBbrsgATPzZclhQAYO0UjZdetk70FiMYKaxAODoNmgZ
 hvn77uwNiFoE49LwnWykmnhDmaXVP9MOXN80J/mgXBW9+4aAQri8SRSKK1GnX5JgN48W
 DFow==
X-Gm-Message-State: AOAM531gk7ErFiZ4YOD5PhyXuEgFKcGsXxF2LfJWlNh+vPLOCxYz9+l1
 1smt8NQA4BiDlUYo0w2zoEa+9gUvFj6n7QAVcbo=
X-Google-Smtp-Source: ABdhPJx5J16iTV7+6D6+UyTST6OG7HbaMmjJ81mRbVrqwiioDZhMgTpjnIiNeCavxE2dOggqLrepZBLKfDRD8/oIyFA=
X-Received: by 2002:ac8:6786:: with SMTP id b6mr4640763qtp.201.1630609581704; 
 Thu, 02 Sep 2021 12:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <333881630574354@mail.yandex.ru>
In-Reply-To: <333881630574354@mail.yandex.ru>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Thu, 2 Sep 2021 16:10:32 -0300
Message-ID: <CAEsQvcuqkff--CgGDa8j0=GWgqMAx09ooo3zRCmGK8drxXGpMA@mail.gmail.com>
Subject: Re: No sound after kernel 5.8.15-301
To: =?UTF-8?B?0KHRg9GA0LrQvtCyINCf0LDQstC10Ls=?= <surpaul@yandex.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi, Pavel,

Standard advice is to try aplay ALSA command while suspending
PulseAudio/PipeWire.

Also please check your dmesg log for anything strange.

Thank you,
Geraldo Nascimento

Em Qui, 2 de set de 2021 12:23, =D0=A1=D1=83=D1=80=D0=BA=D0=BE=D0=B2 =D0=9F=
=D0=B0=D0=B2=D0=B5=D0=BB <surpaul@yandex.ru> escreveu:

>    Hello!
>
>    =C3=82
>
>    I lost sound from laptop speakers after updating the kernel. Sound via
>    HDMI, AUX or Bluetooth works. Details on the links:
>    [1]https://bbs.archlinux.org/viewtopic.php?id=3D269301
>    [2]https://ask.fedoraproject.org/t/no-sound-after-kernel-5-8-15-301/16=
4
>    41
>    =C3=82
>    Help me please.
>
>    --=C3=82
>
>    Pavel Surkov
>
>    =C3=82
>
> References
>
>    1. https://bbs.archlinux.org/viewtopic.php?id=3D269301
>    2.
> https://ask.fedoraproject.org/t/no-sound-after-kernel-5-8-15-301/16441
>
