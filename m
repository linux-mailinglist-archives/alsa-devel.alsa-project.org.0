Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C438140C5F0
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 15:08:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B31B1838;
	Wed, 15 Sep 2021 15:07:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B31B1838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631711305;
	bh=KPdYR/bHOOIzK6RJhd9RgnCsidhx6fXHOAayGK3Wa3c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YfWTBYF0pytWmGyl2NSVqMGxaku0ONGHIjNK0V6rMEqeOiLLevcK24WWWghMIEVFC
	 iETJivqP5VSYlJ5Cs08yMOPacux0Gkp3Y9gTgSxmr7EFhBkeYsixYILONitv16JeO4
	 saGmH4Akq6nfSqQ1GFVhW5vxbr6h7Po9f7bmZ6zI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B463CF800EF;
	Wed, 15 Sep 2021 15:07:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDBBAF8027C; Wed, 15 Sep 2021 15:07:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78A8DF80117
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 15:06:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78A8DF80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ieikhPOL"
Received: by mail-qk1-x72e.google.com with SMTP id w78so3305272qkb.4
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 06:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=32c2/eWi4XEySS0Effxr65ps+yL26xf+kXEeZSUq4E4=;
 b=ieikhPOLKuGfjvhUDX7bUSfDx9DR/SxnBz+f1l11c+7yMCK+Z/VFDVokh59QzjVncv
 LhcUM5K/oSG7OV939xQP1eRZpEMGHg9HbfP+a5M1kjg3jTaGNhegkpSA5wuJVgCT/lp6
 /YAjdnpwdU/kKYLn2K/nfJXLnj1Xh4vb6oG3t66CSY8oBNhct7gz0yLvzzQghLdugS0p
 ERPBWniFk5myGTSkS4UdBntSpIfVRTkJPoGVsdV1AWvSXEonKZUlh/UClsQQAcEPxenN
 4XbvzT6DHz7wiagpwzMwob2X+3l+Nd6GrVhrSngBA3VNLBnuNgX2CaGCwbmGbGNJqfSf
 1KpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=32c2/eWi4XEySS0Effxr65ps+yL26xf+kXEeZSUq4E4=;
 b=Wke6m7bJaSHQ+CES9kuTbjDD3/QvsrxXWsRVe/31ydxVwyXlytJB7wH3c01K7z/YeJ
 pzPQDjWpLPJj/132eMXl9Jxny0JhK3mXM5BDXE2eLt6J7JeChUqu5uD3mZR6A7oXKwzw
 16lJRsul9+myhkCf5hK69cIcmdBS0EUIUcY1YymeP0lx/qjlmBMvbsLEDTBdWP+76eiK
 DJpYVViCYTvM2fW3t+rJ2T56tXQh/SvYAXYQ/MKzTO7H0I7UaqwbNsBHWC1nvof+AX53
 u7PYgDrE9EaIidJ9j/7mwb+1bMxe5YG/AWZ5no6icO4Un7cbSV3OdonmAJ9Zodny0fvH
 SxTA==
X-Gm-Message-State: AOAM533DCTD+wUcKxnduYJQY/EJjGd0xCpP2xiAFEQIQ/viMMGR2hj9i
 Go19onliCxCgnjy5xl3to1zBGMPswicd4Cp2bxE=
X-Google-Smtp-Source: ABdhPJweDw6dvGO2evay2zfpY3QruRMUyWp/CVAmvl44GbqcGczTYvTWnPRhJjjpmc15ziiPCPnH5hTqNQ3M171mUPU=
X-Received: by 2002:a37:8387:: with SMTP id f129mr9766217qkd.79.1631711209954; 
 Wed, 15 Sep 2021 06:06:49 -0700 (PDT)
MIME-Version: 1.0
References: <F8QtqhEtr7zd-TLTxx_4bX0GAXvq-griyYIyEpXrRybmRihHHpwt5nZUCn97mDEbJSW9TTesUMmwmFUukYEjWnGsCYi70LZhg6BA6iF9BMQ=@protonmail.com>
In-Reply-To: <F8QtqhEtr7zd-TLTxx_4bX0GAXvq-griyYIyEpXrRybmRihHHpwt5nZUCn97mDEbJSW9TTesUMmwmFUukYEjWnGsCYi70LZhg6BA6iF9BMQ=@protonmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Wed, 15 Sep 2021 10:11:03 -0300
Message-ID: <CAEsQvcuzPwkBWXfnJPe-xFGYHvvk-MiKijeXTUZ0KhBLtgR5sA@mail.gmail.com>
Subject: Re: Location Of _snd_ctl_ops Definitions
To: Ryan McClue <re.mcclue@protonmail.com>
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

Hi, Ryan!

Em Qua, 15 de set de 2021 05:45, Ryan McClue <re.mcclue@protonmail.com>
escreveu:

> The struct _snd_ctl_ops contains a number of function pointers.
> Where are these functions defined in the alsa-lib source tree, e.g int
> (*subscribe_events)(snd_ctl_t *handle, int subscribe)
>

Perhaps you are looking for src/control/control_hw.c specifically at line
341?

Thanks,
Geraldo Nascimento


> --
> Ryan McClue, Sydney
