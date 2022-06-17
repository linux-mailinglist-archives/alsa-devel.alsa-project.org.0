Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B447551FC3
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:08:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AFDD1883;
	Mon, 20 Jun 2022 17:07:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AFDD1883
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655737705;
	bh=xMcVlqEKoln59Tw0K+SgAUR7q5EyW+F8tkX/RILBiKU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lm/o1pe5dDHvpVbk5Ot0R7i3uJvty8+Nkwh5CLmkZw4xHGJfdtd7NdO7EwekwqifS
	 AreSRjTEgdxMwMWljYMry6Qk9TWBCWhGDHxyVtq7RVONBL9+JHctiPzU1CyvIWxYhH
	 Ay7AwBN47J96VusCNM7iOPdxbtUq3Qu/GYFjmKF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24FBBF804EB;
	Mon, 20 Jun 2022 17:06:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B38BBF80527; Fri, 17 Jun 2022 13:07:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 250CAF8028B
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 13:07:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 250CAF8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="IRA3BGiT"
Received: by mail-ej1-x634.google.com with SMTP id h23so8072782ejj.12
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 04:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oEwaem/xAtfULgaR3mIiQRybksdoP4gsjfxUSl3M7Wg=;
 b=IRA3BGiTIVjH8IMjsPrY2AaWkXWzLbXVe3yTtmFYtKgF42jKNMXXn1TkJwxJOmK6mi
 ql0r/Q/gFkBMxAeRmRDqF0sSl17OK6fLQ44mpQ5acpuXVp2zVQgs5aWUAxlrRiF76yf4
 0U9yJ0sJKYFs+O97pzF0ofgOSq9xCM6RwyRCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oEwaem/xAtfULgaR3mIiQRybksdoP4gsjfxUSl3M7Wg=;
 b=xUVJIQ0DRvFaZmvZ2fu3JmpMYKOzGxwWV0tb8SpSCK9DA0nbBvAGbSiMk3oRoWmOaC
 4JnTYAyAp77KUnAMJZGDm7KrVHjZF2s8dA8FY0PIbMWPYdqos/Oapm44ZyeuP492m4jD
 39xELqqxvuQb7dIK+Y0OGvlhjO7jDRma5y4t3srNgT3maYbcBPNVXY0GOVZwgaqPrMiG
 Jobc32gAzklZvkrXdde3tETGsMypTc5IDYweItGD6q6umEZTfv2TFSE8XyqHXEzimYVS
 +ZILh+1ax8rpy2A/Ci+cuq1Cnm+md+v1jHENjnHkzVue1c2koKCw8ldnfGnZAJHyvj9e
 Hrug==
X-Gm-Message-State: AJIora8/dFfhvDLA9XZZ2QYFTPNp5u+Gtcf2b1z9ghln1XI52MevYBVG
 e9BEr2fEllapMaIHoAgrhdQiVhRFziUI1g==
X-Google-Smtp-Source: AGRyM1vn2jjbhlIm11xAguteDZUN2LbxP4Qiy6drReL1BgJAyqVQYPMtVp88E8N9r6iKVdY55LYVxg==
X-Received: by 2002:a17:907:a422:b0:705:e944:fd3e with SMTP id
 sg34-20020a170907a42200b00705e944fd3emr8497678ejc.309.1655464068010; 
 Fri, 17 Jun 2022 04:07:48 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 10-20020a170906218a00b006fee98045cdsm2072041eju.10.2022.06.17.04.07.46
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 04:07:47 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id
 x6-20020a1c7c06000000b003972dfca96cso2216747wmc.4
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 04:07:46 -0700 (PDT)
X-Received: by 2002:a05:600c:2215:b0:39c:55a0:9531 with SMTP id
 z21-20020a05600c221500b0039c55a09531mr9687808wml.29.1655464066586; Fri, 17
 Jun 2022 04:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220617100632.1447811-1-fshao@chromium.org>
 <YqxauLOp2sWOU/uc@sirena.org.uk>
In-Reply-To: <YqxauLOp2sWOU/uc@sirena.org.uk>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 17 Jun 2022 19:07:09 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhVSMfebqv9Kr-bkHdF9HcDMQVU-sTUzRch1d6bZO54Ug@mail.gmail.com>
Message-ID: <CAC=S1nhVSMfebqv9Kr-bkHdF9HcDMQVU-sTUzRch1d6bZO54Ug@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Fix mutex double unlock in GPIO
 request
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 20 Jun 2022 17:06:44 +0200
Cc: alsa-devel@alsa-project.org, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Fri, Jun 17, 2022 at 6:43 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Jun 17, 2022 at 06:06:33PM +0800, Fei Shao wrote:
> > The lockdep mechanism reveals an unbalanced unlocking on MT8186:
> >
> >   [    2.993966] WARNING: bad unlock balance detected!
> >   [    2.993971] 5.15.46-421fef3b44d7-lockdep #16 Not tainted
> >   [    2.993978] -------------------------------------
> >   [    2.993983] kworker/u16:1/10 is trying to release lock (gpio_request_mutex) at:
> >   [    2.993994] [<ffffffdcd9adebf8>] mt8186_afe_gpio_request+0xf8/0x210
> >   [    2.994012] but there are no more locks to release!
> >   [    2.994017]
> >   [    2.994017] other info that might help us debug this:
>
> Please think hard before including complete backtraces in upstream
> reports, they are very large and contain almost no useful information
> relative to their size so often obscure the relevant content in your
> message. If part of the backtrace is usefully illustrative (it often is
> for search engines if nothing else) then it's usually better to pull out
> the relevant sections.

Agreed, I'll resend the patch. Thank you for the feedback.

Regards,
Fei
