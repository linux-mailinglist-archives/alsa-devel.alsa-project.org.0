Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 966E247CB4B
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Dec 2021 03:12:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DC06179C;
	Wed, 22 Dec 2021 03:11:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DC06179C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640139151;
	bh=l4q5emREBpkHjWRlAYtg7cUXF1z/GzcXmEP05i5MvYE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VFV4cxa//aLAzvydPsTZk1gpyvkpD+2CC0kQ9vypfqOi2trUXCM+QD3IBS7+jGeBc
	 ls3YOtln72ly6hJFAXzCgnhqEdskvlfJ8pSYUGAX5VNlUF/HqLKmzrNMF34FCX+R1Q
	 kt28kk8QrOUR5IZC910sA29RqirD3RnXTm+C1R7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65A72F80125;
	Wed, 22 Dec 2021 03:11:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EA7FF80118; Wed, 22 Dec 2021 03:11:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8706F800B5
 for <alsa-devel@alsa-project.org>; Wed, 22 Dec 2021 03:11:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8706F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="TRLllojd"
Received: by mail-ot1-x329.google.com with SMTP id
 45-20020a9d0a30000000b0058f1a6df088so896634otg.4
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 18:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l4q5emREBpkHjWRlAYtg7cUXF1z/GzcXmEP05i5MvYE=;
 b=TRLllojdHVLsgW7MZKujGqQuIIRYplYu5kyNtNpmyG4/qHUmimhl9X47k1g7e2WzK+
 K7baIFw2oTE0r3LBJhcck5jGXikTjSf2UacDdmZyQX+gS2OKMekd4xwLyogBt9aDAA6H
 9BKgp2qEhQf4U362fekAAWEnTc3RRFwnEkflVXK2/3zDA6z9ePx60a8415zn16JdxcI2
 LJsWIL5eZiRmDQZZWS4g+yH6n8VKW6YPbLkwQz0taFTXhmYkQIf8r3A+qbR0p5luaf3u
 wGqp0A0MPLHwvwYhNQnc6G5j7/QBF02r1ORDNjYjQfRQmxoYlqey14jRqQjyDornN7fc
 pjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l4q5emREBpkHjWRlAYtg7cUXF1z/GzcXmEP05i5MvYE=;
 b=PV7NQfTo96R1RShCBLpV9xmwVNGPUvUjMWzKTc1+7OaG2XD6RiB0OS66hWWIGnwV9J
 73xF9tlqIv01zLqyVsF1cqe3T78UhcV1FCFWM+cWeoOhOOEamgMq1Y5xD8NByD9Z16JH
 iPchEwYke44ldY8/iaIxC3SgeYZNbBPI0//zNXugFGElrWSV96oX6wxn4RcgSCcViaRC
 vO/s48YR7NT6qysm2Vj1jyBv7nQ9GTEblGt1jtJ2a+FCcnbu/HX7PR5pihU8fklZfaIF
 P58K27TtAsxUC3DD2xkx0WgySgCSzWXMY65sRWQxTYYTHIeJ/XKzZLzVQp2Dy0lFFNec
 T0pQ==
X-Gm-Message-State: AOAM531f/kbOiE9Xpg0cJOjP7H+jo+3Tb8U0Op3X/+y1miZp/rvXsz0P
 nHEEV47QgUAnxHusLcC2pIAJeSXVNyLVmjdsPXZmKw==
X-Google-Smtp-Source: ABdhPJypdJNBEKk+OSsTACvzXarOOCBDL3wVWI+BM2Czbk+zy/DrvPRZ36NvkSRqlqPpBmlUyeD6RtBPgfIWcEpeapw=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr752044otj.35.1640139067056;
 Tue, 21 Dec 2021 18:11:07 -0800 (PST)
MIME-Version: 1.0
References: <20211216151227.58687-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211216151227.58687-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 22 Dec 2021 03:10:54 +0100
Message-ID: <CACRpkdYe5FHpzvey_hHMLxpYpX0ad9eu0JsaNk_zUkj-1qtQTw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] pinctrl: Propagate firmware node from a parent
 device
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Support Opensource <support.opensource@diasemi.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>
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

On Thu, Dec 16, 2021 at 4:12 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> When creating MFD platform devices the firmware node is left unset.
> This, in particular, prevents GPIO library to use it for different
> purposes. Propagate firmware node from the parent device and let
> GPIO library do the right thing.
>
> While at it, slightly modify the headers to reflect the usage of APIs.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: fixed more compilation errors brought by header reshuffling (LKP)

Patch applied! Thanks Andy.

Yours,
Linus Walleij
