Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA3C34B434
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Mar 2021 05:24:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 829D7167C;
	Sat, 27 Mar 2021 05:23:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 829D7167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616819078;
	bh=Fpzkk+VtgC/dy6Zvyea93foPGoH5SzcT9fGrwuOlY6A=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kkpn+nvQdnOyDUuFWb9l3B7h3KaAbni25vfBuCz53IuB4Z+WsjF17bJzi1VMlIofp
	 GdWuJx2hSSUzJ6g+pwErRjG9wH5tt0a0n01DkBxwiH11RurwHnQowkaDF4Hx1Aw8P7
	 Y9lIIWFcQcrUcb6f6k3JVpPt+XnTZYtQkZBgEK8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2C6BF80268;
	Sat, 27 Mar 2021 05:23:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02037F8025F; Sat, 27 Mar 2021 05:23:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FC07F800B9
 for <alsa-devel@alsa-project.org>; Sat, 27 Mar 2021 05:23:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FC07F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="u5nM7z2p"
Received: by mail-ed1-x52a.google.com with SMTP id w18so8596470edc.0
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 21:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=f2uEyGsvU/zObCqIFRBKf32zYTspd6LFwyvjKHe5XTE=;
 b=u5nM7z2pmF8QvpSWNH85w6BDy6rYpxP5eaMvxngZ4eCJy42sJz/fyPUO3nf4mizaeg
 wu4V5lGbnP2aNxpKIGzkpyq9jgpxU7fmVZ1T5F95Cf39wdd+RUqsEK8n2G+rKB3OY4mB
 92Q9+SoPWKWNt9qYs/pz3ViD3/gcPIp5nJNC9gEl5hTI+oUyki6i0MSj2bQONA9EBEei
 1SEwyUamvylDKE9dmOMjDPRYRcdvpz9vmS/80CaCmQ31loxDGtCNC958NevMK1vTJwOG
 JVqBiwzaKIBwn+/oG1CEYNqmuHEyWaa0M5sGEh58xSMz0HV1hRCNOvn1SheTsHsHDtmV
 qsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=f2uEyGsvU/zObCqIFRBKf32zYTspd6LFwyvjKHe5XTE=;
 b=EbxysKou6YUzPXyznjmHCLKfaWuwV+BnXNeJtd5xdHdJukkB/6HBZCWeN/E8xfj4Cr
 SUpgR0fHSZ/n23k5CrFsrU2izz2ES2MvMZCf9FEEfBvyY2SjzjPs9Miv7jyOmXsWMtQo
 c9UJewnjpG9Nn4v7q9OXWvr51wSmoVM0JWqckYW6O5zb7bqEAV4vuha25QIwsAt0swpr
 i5sjmVkeDmotH/8i2NdKvsk7l60Gm7QvZFpd/HTgEuOyKnqhAMWfyXNXhTK5oCvwPm73
 ygi0zEPww905ksxoG5zJltZN2Abt5LyvDJFviuBqhbxXGjF4hrZtKoGikHp9+ERZwT0d
 P3ng==
X-Gm-Message-State: AOAM533yGsN0Tj+G36ttVp5tlUvtUgnA9TAuH/KnsIDCRSmMvc8oVc1c
 ajTa13OhOqaWnDT1igqi4RyujfQYuhTPfBPsTMFhLosj
X-Google-Smtp-Source: ABdhPJxmKJpoHXmpHa2GIIBy/Q+ojKlEdxbi/zRjEhm5bDg3SARgkSM8huEnzcy63ynl7++J3LewsbJ/ZAH1GUqbVRk=
X-Received: by 2002:aa7:dc0b:: with SMTP id b11mr18766755edu.124.1616818978923; 
 Fri, 26 Mar 2021 21:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAOsVg8oYg_3A70UMudHuysi3b9WYcZF++DK3uAruJSjygvgcUg@mail.gmail.com>
In-Reply-To: <CAOsVg8oYg_3A70UMudHuysi3b9WYcZF++DK3uAruJSjygvgcUg@mail.gmail.com>
From: Lucas <jaffa225man@gmail.com>
Date: Fri, 26 Mar 2021 23:22:47 -0500
Message-ID: <CAOsVg8pjPuLzdKUTVn7-33FSGPueTY7FKHpHqW7Of8m60PGQnA@mail.gmail.com>
Subject: Re: [PATCH 1/1] Adding some Roland devices' USB digital audio
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

On Fri, Mar 26, 2021 at 10:11 PM Lucas <jaffa225man@gmail.com> wrote:

> 1. The INTEGRA-7 won't output playback in any mode other than its
> "96[kHz]" setting, though capture works with all of its Sample Rate choices.
>

Sorry, I meant to say that it won't output playback in any mode other than
its "44.1 [kHz]" Sample Rate choice.  I must have been wishfully thinking,
I suppose. ;)
