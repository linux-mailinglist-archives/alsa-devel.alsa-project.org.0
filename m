Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BB78DFBA
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 23:27:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50E481671;
	Wed, 14 Aug 2019 23:26:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50E481671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565818039;
	bh=5ITS7mjEhmLS/JYxmA36EIG1hknXKlYrGWHHFARCUHI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c2+4+HtdchwzGM1jn4UxBNq7BFDJ3rrh/pnu/52ITHfZv+LWpXk4wvyjVoH5nrt6B
	 rBSvmh0/n44Ol6Zret/hepBHIEGMwhhOHssm9qIvniFAeDSkr4HLdJ5JAf++0M6LdY
	 bfbDP7IQrG5PTECD3DDnZirJjtjNNpFoso9Ob1ag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80680F80213;
	Wed, 14 Aug 2019 23:25:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EF62F80214; Wed, 14 Aug 2019 23:25:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A1FAF8015B
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 23:25:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A1FAF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ZRIrVOzi"
Received: by mail-lf1-x142.google.com with SMTP id s19so286925lfb.9
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 14:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8D89IWNr6qXpuixdGVVUE6VSgb0w4/jTs7n+NxKGTQI=;
 b=ZRIrVOzivpdKfYfpO4YDO8X88QRGUOGe5dIuUkevHahNUy3aoAbOFC7h5876K+nFs0
 fFQXHF9kMQ9KLa/ZmDSUnCo2dX3Xt99U0UOPjIImMdS/kFDA2rUtu1BptT/qXv+KWoyQ
 iBLdXNzF7W9oFFQwx4zEWFPl2oaRB7KVWIXOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8D89IWNr6qXpuixdGVVUE6VSgb0w4/jTs7n+NxKGTQI=;
 b=jNrpSi5D0tdGS0EeWwEwzSYiKP2Lm79UepFw8cHjKKingU6dwb0Q1f9HPOKPcyV6Jc
 A38r0a7FnsyaNyvQsUGa+0qyntBqPhpr1LIKuiN4xMUAgj8GIEBW8trxiv0fIDQ1n9nA
 txw5XVuPy+NSWKfZGltvCjiDDgbNm0fb7hSV4yLk6BD+KvL8evMNyJGEW2Qfl9gEib6W
 fKndlBhpSJ3fm5SCE1t5NMnTcMHN23C/cKHVh6SXwQXXo7SlnFvzEN3e0Jv1WrJ+p8fF
 kZMYLhU7E1Mxlc9t8VbnPEbUf9f3BsofooOz9+VFNF9Qm/9ncrksPVjrGgvF4mXuD1jF
 8p0w==
X-Gm-Message-State: APjAAAWns47/jqKsQNChrk+iTplvplpZZbEawcBaE62xw5TzLjU5dlT7
 OupM3biyPGC79yNHIYeaddES/e1Gr8k=
X-Google-Smtp-Source: APXvYqyw4mLUIy0vVDJuDXonXaEYjOTKdMYdJqhGu3rO/6dnMssnlp/r8axcVWxKAbkyHgR3dXJY6w==
X-Received: by 2002:a19:7006:: with SMTP id h6mr728506lfc.5.1565817927888;
 Wed, 14 Aug 2019 14:25:27 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50])
 by smtp.gmail.com with ESMTPSA id c17sm111432lfj.65.2019.08.14.14.25.27
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2019 14:25:27 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id v16so280572lfg.11
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 14:25:27 -0700 (PDT)
X-Received: by 2002:a19:4349:: with SMTP id m9mr762602lfj.64.1565817926757;
 Wed, 14 Aug 2019 14:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <CACJJ=pxPm7dRUE534hDWy2tN3dGYDyrgU8JKqett=wOQx+nWCQ@mail.gmail.com>
 <39533fe5-c060-7a07-c910-74b83eee53c4@linux.intel.com>
 <ac7bcb42e40ac12d9924fd65c3e2c68b9b11b093.camel@linux.intel.com>
 <37ede7ea-e760-eac9-a1d5-0eb8e3bff3cb@linux.intel.com>
 <CACJJ=pyb==xWqKMB-gAzW7-FCFgEU7Rm+b-CL-ANO-eorDKy=A@mail.gmail.com>
 <356b3f4eacb43f23c40c4cd8e3c54ae9514a34c6.camel@linux.intel.com>
 <7e08e45d-7cec-9fdd-36c5-5e82632968f8@linux.intel.com>
 <CACJJ=pzcMCaOvHMVhmYKKL2Z45-XdrBB9FT8VjSzX_obVtKzyw@mail.gmail.com>
 <d80c2f4d-b5f4-5bbe-9529-36b9859ab8be@linux.intel.com>
In-Reply-To: <d80c2f4d-b5f4-5bbe-9529-36b9859ab8be@linux.intel.com>
From: Jon Flatley <jflat@chromium.org>
Date: Wed, 14 Aug 2019 14:25:15 -0700
X-Gmail-Original-Message-ID: <CACJJ=pxokT5z+U=nM9QcUVxCk84998ugM5J89U28k=CVGMjG=w@mail.gmail.com>
Message-ID: <CACJJ=pxokT5z+U=nM9QcUVxCk84998ugM5J89U28k=CVGMjG=w@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Jie Yang <yang.jie@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, benzh@chromium.org,
 Jon Flatley <jflat@chromium.org>, cujomalainey@chromium.org
Subject: Re: [alsa-devel] [BUG] bdw-rt5650 DSP boot timeout
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

On Wed, Aug 14, 2019 at 1:51 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
> > There seems to be an issue when suspending the ALC5650. I think the
> > nondeterministic behavior I was seeing just had to do with whether or
> > not the DSP had yet suspended.
> >
> > I reverted commit 0d2135ecadb0 ("ASoC: Intel: Work around to fix HW D3
> > potential crash issue") and things started working, including
> > suspend/resume of the DSP. Any ideas for why this may be? I would like
> > to resolve this so I can finish upstreaming the bdw-rt5650 machine
> > driver.
>
> Copying Keyon in case he remembers the context.
>
> Reverting a 5yr-old commit with all sorts of clock/power-related fixes
> looks brave, and it's not clear why this would work with the rt5677 and
> not with 5650.

No idea, I was just diffing the register writes looking for sources of
discrepancy. The Chromium OS 3.14 kernel tree that Buddy uses doesn't
have this patch, so I figured what's the worst that could happen?

>
> Are you using the latest upstream firmware btw? Or the one which shipped
> with the initial device (which could be an issue if the protocol changed).

The firmware I'm loading is: `FW info: type 01, - version: 00.00,
build 77, source commit id: 876ac6906f31a43b6772b23c7c983ce9dcb18a1`.
Hashes the same as the upstream binary.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
