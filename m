Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CD03635D8
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Apr 2021 16:13:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4F2B167A;
	Sun, 18 Apr 2021 16:13:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4F2B167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618755232;
	bh=SIOhdNzhyY6jxF2xwthoO2KBioM3UiaM7Q0uDnnKTPI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PcpjlN51PRhbL38xCyHaYyp2EPX5399iOdUeCxgQq8vo4Z4egHUfceE2wtgL4DScI
	 rpX6Eik4rtgCP7twILzIv4p7Nhp8go3XgbNu7MlXsXA7jqq4pGrsIORCnI3RQKxfmh
	 2qYxHE2PXVp8/9IwfiY+HsKYD+Jkqs2xn6xphSgM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C414F800F2;
	Sun, 18 Apr 2021 16:12:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64C95F80253; Sun, 18 Apr 2021 16:12:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODY_60,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F321F80164
 for <alsa-devel@alsa-project.org>; Sun, 18 Apr 2021 16:12:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F321F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rVISKaAU"
Received: by mail-qk1-x72c.google.com with SMTP id v7so5432054qkj.13
 for <alsa-devel@alsa-project.org>; Sun, 18 Apr 2021 07:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pT4GMKGjVZmm0HGFbGf6rHOaxjNKLB6t8LQndnyJu5c=;
 b=rVISKaAUK6/MKC+krdUfegzgZgM4aCXV5VxgkdfrQabLka9YkBUPeZL+SA7ufvYzRB
 VqyejNU9qxal9dlzhl29tzt9QEAj2ymrPv0KvNg2IKw56EvSZ/pJcsLXxMxfr8S69Yvq
 Mr1zjKUIlOm1MW+/9zUrIjBxv/1M2cadpcgeJ9FiXhsuRIdFtYA+p75WVAKmdnobtBt4
 FfaIt7tekUkI9tik0625kN8X6X3SF8rFKnYD6NS7JRo/yNq9Ihsq39Yv63DrGhTPrHM1
 CCj6gq0803VECGi1+CQzPlPwvqytORCsZfSZ2OUsP49seXWahDz5D2dMYYXlpd52hAKM
 lXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pT4GMKGjVZmm0HGFbGf6rHOaxjNKLB6t8LQndnyJu5c=;
 b=PEeZR/NkYov6L0VjJ6EXkA4sZ35nvtbDTsSXmjWWDJaSXmU+UaSv6M2BSBUJcu29hx
 eQAiSFe3+52oolj84BG8KDxRgt01LDaOPEkZktg/HWnNTgT5vNOCoxwP2Nt5XTE5p8g4
 2L+dAlm4L9b6rhy0GNz2g81vBZMkQj3MPRPQjBCWxQNYw6LuN59H18yBj344bVHeImPm
 LwaECr8lOlT7o0XYZIX1eLNQpxXShkmyDVmJBBMDbjFV3xnO7KTj041ANyuhLgWdMi5Q
 l8G3P1hvNWZQMAv7nIT1/AB2b4Mcr8nv4yicQLNHWeH6p/TtdXwH9ULAxX348jW2BoAO
 94OA==
X-Gm-Message-State: AOAM532eJ324IPe2IDL5Po+g6AfGVxRmv/2MSeeTYQvMGLuyg5uRHdu6
 gaPHJCvo0Snt21SgNIDNMUv8Ms4Buo0MOh1xD2s=
X-Google-Smtp-Source: ABdhPJw/vUhwmFePfPPl9VKO99xrYDm+KGpi5FgkqhD8zmdUld2A3avK6K9dWHMhZWVcLJpBF+ShYOnobGIMEX6MpxA=
X-Received: by 2002:a05:620a:13ce:: with SMTP id
 g14mr5819547qkl.226.1618755132847; 
 Sun, 18 Apr 2021 07:12:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAEsQvcs9LcciAYjoB64Kt_VaSww4EAW4-qN0ED5jDA0GeeTtDg@mail.gmail.com>
 <20210409110745.kbr5z2jinsaur2ac@base.nu> <s5ha6pygqfz.wl-tiwai@suse.de>
 <20210417222630.dpqju7bowvks5nnq@base.nu> <s5hpmysf374.wl-tiwai@suse.de>
 <20210418124301.scwvjqxwanlarko6@base.nu>
In-Reply-To: <20210418124301.scwvjqxwanlarko6@base.nu>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Sun, 18 Apr 2021 11:16:56 -0300
Message-ID: <CAEsQvctoF1MeGLyUiPZpfRC50kMY+8nnQ12OphPO8NvMUFj_hQ@mail.gmail.com>
Subject: Re: [PATCH v2] Pioneer devices: engage implicit feedback sync for
 playback
To: Olivia Mackintosh <livvy@base.nu>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

Em Dom, 18 de abr de 2021 09:45, Olivia Mackintosh <livvy@base.nu> escreveu:

> > As a blind shot: might the stall be avoided by passing the recently
> > introduced chip->playback_first flag?  The revised patch is below.
>
> This appears to fix the issue, thank you! I am curious as to why this is
> not required for Geraldo's DDJ-SR2.
>

Heh, sometimes I think Takashi Iwai is psychic ;-)

Just kidding, he's "just" very talented and very experienced. Anyway, the
DDJ-SR2 is originally a Serato controller. It still requires two MIDI SysEx
messages to unmute the RCA inputs - engaging "Serato Mode" in
marketing-speak.

My point is that Pioneer may be a little more compliant / a little less
deviant from the UAC2 standard when designing gear for use with third-party
software.


> My initial thought was that certain devices that restrict capture unless
> regular SysEx/Control URBs are sent may mean that Playback first support
> is required (e.g. 750, 850, 450). Please correct me if this intuition is
> incorrect.


> Olivia
>
