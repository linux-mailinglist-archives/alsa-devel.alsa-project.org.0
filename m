Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2859DBB8
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 04:45:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B89E51669;
	Tue, 27 Aug 2019 04:44:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B89E51669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566873944;
	bh=UiKARIQyfuLSOajxi1/P7CWNvKTQq1mpvjGEMh3lnOw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a0Q3wBjaeTy9bMp1Xnpk5wf9U7VrYouN3ChHwpLx277hxKaKZG4xbqaWMYNapIDB7
	 gQ00VPqGR954YOBfCRCwuSrSNbk/u8+EP9jc729n8F3eo5ZRvB+7uNjrr0wCJJiOSG
	 OQXKQRZLX9vVv/apVAoNzgQrodxpq+4KCOCSMfC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FDEDF80273;
	Tue, 27 Aug 2019 04:44:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CEBEF80274; Tue, 27 Aug 2019 04:43:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7BFBF80142
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 04:43:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7BFBF80142
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="m9mHgQGp"
Received: by mail-qk1-x744.google.com with SMTP id p13so15817325qkg.13
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 19:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fyWVDk7bFBlJ/NL+rydCcVoJAqq5cfsq7OYmzr+x3iQ=;
 b=m9mHgQGpaNW+maa12v8RwzA/5XG6LlQ0VVl6UlyZz4RG61exO6Erx/vSUKtTy0Dttn
 6Vbr9AVwx5+QtvHekx96s7VgF5kyhWDaRnWRuJt4Sg4R+nnxkTp7R7wWkqxI3K3sFJ1Z
 c5rEedG5fOxGFsQtFif0MZzJKu1L2wH28dq47rvB+8tvAdKpWICZHTXBiY+7IFoZ50bN
 SZAmB3kASHWSPFJ50I71fjNISlR9EVU6p5xs/n46Z8jdHpyRohHewDxWSNrK4op4s/so
 f66TeRB3QNjMS/fr0WxXt8zicX+P9Q9x6Kdxs+/KBN17P4fBM0YsGME8XHfqVOGIjl+T
 LrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fyWVDk7bFBlJ/NL+rydCcVoJAqq5cfsq7OYmzr+x3iQ=;
 b=BQM5QwFaCbN+bAYH6Tdk5GPoOKWdmmoHWNc4gnXMx1JUm6/0/4w6UsdGIgM1mZI+B2
 QNppzVUoIz/o67rNntr9OiKNxvM9j1S9LxeRHlTuSuN9Bo82S1jRhZYwqUEbYk2M+WFX
 II7fIswtGJnSW4aT70kvjPKjO0VuOfpSbb0e4VHmlp9uXbaqMxkmnK4KLPQ8I0lezOEk
 sirWBxUgNGWXpgzyuhIzwe6b+QJ0BRbefambUIMwou4gu7HgVDpvs4ZcYcZj2voF6AzZ
 Ssaf9W9YLV9XJhgyRUPf17Dnm2ikRoQYL6Xh/YOg6vC8dioR+Rh2jyuSCZh7P0BmX8X8
 q5/Q==
X-Gm-Message-State: APjAAAUw5M6ldq4I1NCxbjqlHMsejzhnQ4fvJu6Z0ErxJjmic0YFz1/P
 Z+qFm+xxROL1n5SE2kR94fVVJlyq3vRwGwRReBZ7mg==
X-Google-Smtp-Source: APXvYqyPwg0XQDxbbABhyaEAR2ykYQIPflmmWURv2tGLureTrKZCN2gKDtgubaZOm7797x6dUFdLUak1raAhC0SSmhA=
X-Received: by 2002:a37:4ed3:: with SMTP id
 c202mr19634969qkb.457.1566873829431; 
 Mon, 26 Aug 2019 19:43:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190826153900.25969-1-katsuhiro@katsuster.net>
 <20190826153900.25969-2-katsuhiro@katsuster.net>
In-Reply-To: <20190826153900.25969-2-katsuhiro@katsuster.net>
From: Daniel Drake <drake@endlessm.com>
Date: Tue, 27 Aug 2019 10:43:38 +0800
Message-ID: <CAD8Lp45zqUsTJKV4QCF59AkDX4qh3HZ7=Ympxm2HD7VV0WCLrA@mail.gmail.com>
To: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>,
 David Yang <yangxiaohua@everest-semi.com>
Subject: Re: [alsa-devel] [PATCH v2 2/2] ASoC: es8316: fix inverted L/R of
	headphone mixer volume
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

On Mon, Aug 26, 2019 at 11:39 PM Katsuhiro Suzuki
<katsuhiro@katsuster.net> wrote:
>
> This patch fixes inverted Left-Right channel of headphone mixer
> volume by wrong shift_left, shift_right values.
>
> Signed-off-by: Katsuhiro Suzuki <katsuhiro@katsuster.net>

Agrees with the spec

Reviewed-by: Daniel Drake <drake@endlessm.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
