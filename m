Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E90D3505BF
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 19:51:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 002151614;
	Wed, 31 Mar 2021 19:50:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 002151614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617213063;
	bh=/lUp2eV93TnkAkLISZMsTBeCC0/nrVGaqYQOEl3xGKw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bbfzg9aRfnD73Rj3ee3UpYCSY31/io4+H8EMwQMubJYmjY3pgf1+INZpCTWApiBEK
	 opoj5L1hkdqmAn+aQI6I3QSjPIGbo0q78kx2JQ6LCI5l+m6TIoQEPnoTTaHgYjQDas
	 Uy7ltJ97bLyfz7RLf2M/jYFjs0Yh0pxK//g4YEts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 495E1F8016E;
	Wed, 31 Mar 2021 19:49:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB090F80166; Wed, 31 Mar 2021 19:49:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D93BF8013F
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 19:49:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D93BF8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Lm2Vep24"
Received: by mail-ej1-x635.google.com with SMTP id kt15so31304664ejb.12
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 10:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uXLbaIrl2zDsEafC82IMdUg2Vdbjwwvm+kRTZ6woEAo=;
 b=Lm2Vep24XTDfYyfvicgBOQM8VSxdD6KXgHsUFoIQBMbiML3HP1W2JS4pD+sFRknIFE
 EkYYMekQCnlPfilY/p9RmEfvZ7ZKquJOnhEjF+67ucFekoV8Z2OfVvtdNsSojhYvQiTQ
 swtnEm9gxVJ3BNVS+OxuK1qo/0FMf8mz+X7R8PzSf8zS4NnoBzIdwBLQWebcl11ttWCk
 tDKxZgaFYULcuU9k9aI9ACIFLqZdfrSPnA0tq3UbQmmAbq050jquao27QRqOFkEFXLkt
 wJzYUGVGzn0fEyBFeM1KSUz83mg4OkycNdfpjAtyrfFP0Fc6D6CMHPSw9nys58loubet
 rQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uXLbaIrl2zDsEafC82IMdUg2Vdbjwwvm+kRTZ6woEAo=;
 b=MJ2+qugADTkQkuP1YZg49alN5vIkpO3wTMGLxHMBN8Tb0x05xJBtvtIcKZjLlRVJqF
 l7gZm16Yvd7dCvXz1hxwNChg9UZMsOsNdmvjUhP3p9SJt6JLDBvS4zNkrQg3l4pydUP0
 DaqFB3qZK2FcAVa/Vd9xB3jxZN71xhsJymdxLi/d+fQ5fYMWxcIuf6F+mbp4yhIDIP1y
 xKCTzawVsl+YyOnwf+hAgnzTIhHrjgyrgxzb3Cn7Ke3z0D2MzTN0SjgNkRb5PU2ARUVg
 t8VEhpNqCt4tuAsWkArvzqYxtOOQI3+K1ciUkv93/NpbzZYLNQ8T1GMuRoLlhq8N2/H6
 GqDg==
X-Gm-Message-State: AOAM532pm2nQ2Q4K8e+2GCqYwHT/SScmItfuV2CqN+YwWp9M5YbEy+mS
 LX8B5AmMJz3z5vDGeEFwXo37QbxfuE0GtObeWy0=
X-Google-Smtp-Source: ABdhPJw6C4TJRcAaTGXv3GmFR+ipN19UP5ywln7WzlT16qr89z7BXh/thWmlgmJpPtEx2o5xjJnLKaiILskee3bZXZY=
X-Received: by 2002:a17:907:1c05:: with SMTP id
 nc5mr5073266ejc.320.1617212970535; 
 Wed, 31 Mar 2021 10:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAOsVg8oCOSHrqx_7rU_KAYugOaYxmJ1vLvrS_wAah0VKFVZ05w@mail.gmail.com>
 <CAEsQvcuTb_3meXw-X08v1MduNpCA3xA6SXq-ezuJrcC7tP+faw@mail.gmail.com>
In-Reply-To: <CAEsQvcuTb_3meXw-X08v1MduNpCA3xA6SXq-ezuJrcC7tP+faw@mail.gmail.com>
From: Lucas <jaffa225man@gmail.com>
Date: Wed, 31 Mar 2021 12:49:19 -0500
Message-ID: <CAOsVg8rE8772qnGAHwFuK4+A9QA-AcDqAH4PkLJJf2GH3tmiVQ@mail.gmail.com>
Subject: Re: [PATCH] Fixing most Roland-related devices' USB audio
To: Geraldo <geraldogabriel@gmail.com>
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

Thanks Geraldo, I'll consider that.  I am fairly certain that this patch
won't make matters worse for anyone, because applying it to the VG-99
(which apparently doesn't need it), proved that it works fine with or
without the patch.  Then, again, there may be similar code for the VG-99
always in use, specific to just it.  I could try it with my UA-4FX to see
if it continues working...  Thanks for the pointers!

On Wed, Mar 31, 2021 at 11:45 AM Geraldo <geraldogabriel@gmail.com> wrote:

> Lucas, you can always email the maintainers if you're 100% sure this patch
> will work for everybody etc., just be sure to read
> /usr/src/linux/MAINTAINERS first.
>
