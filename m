Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDD337CB0
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 20:52:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 316E315E2;
	Thu,  6 Jun 2019 20:51:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 316E315E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559847136;
	bh=QVdUUp5mcKVzZfMs4l8XYpCjctAmd/gz0WEIQbRku+A=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FqhT2lvUpoq0/AnjlO1SSFmKWy8d6tFHk78uhfmPGoJyY9/Q8gRkHllNfIEFB1OW5
	 zdO9ccC5HAyVF1GA66eqr47SkoLeQplPIebxhkd5eNQVG7wyzzx19aZ1A59OG11ayn
	 UoEyR62wVad+4FCGNb8spsvEjxsQRCc5KVGMibEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BDC4F896FE;
	Thu,  6 Jun 2019 20:50:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A614F896F7; Thu,  6 Jun 2019 20:50:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_MED,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47C19F8072A
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 20:50:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47C19F8072A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="OLd0Rm33"
Received: by mail-pg1-x543.google.com with SMTP id s27so1861318pgl.2
 for <alsa-devel@alsa-project.org>; Thu, 06 Jun 2019 11:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3Bnwpy6cjzfBrajWkrs7wHMOESAxVWwnH8hnTtDte0U=;
 b=OLd0Rm33yAfl3TLExw0ekB2qn1paxAdhV4VDB8wnSqif91RFuDfuCA5tjaNvDRofFO
 lZ4YsmYWYWZSCjgsqULVqL/HPuCpsBud/F08K35cILFVIZp7N+ottB/wjxYA74au0Dj/
 auCI94TAm4MWNiHWmyOhgqAAnUWG3FzrAu/q4WoDk+z9mOl2QBaBQPqJSNdlz3NJsEea
 LeIOQOUx9pB3yELO9rSRom3kzFEQhSZXiPpS0hi/1Oju61CuIfaRgfyt1IRe2MyZfQjP
 6lEQaOaKi2VPpGQzW+ZW22x/6us4+BiyyG4Dy2qcLH+1GeMLdsqQNPPrI+o3YIeEHJL6
 xQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Bnwpy6cjzfBrajWkrs7wHMOESAxVWwnH8hnTtDte0U=;
 b=p1htg4MGByjXKyACPjCkJZ9r6uI0gBsJqb+i4JrXI9kwz8HdcTbjFsyoWwpxWrz5Hq
 Fos5grEza5+gjAjTK+PtUKOvIxV3y3DjHHQ9ntve4zUcE+0lQRZlL5vr3mGkev592gx6
 8dxOtPWUt5ZVlP8W7qfE+pBcPPX46+OG/5NCwAK5vew6Ctl9VIF65ZSpdQ59xf+IxX2v
 E/bbC9VMigKhZ28HCHWXjsI/NYcuComClrK0zQTsPEHKp7+TKdUMa7M1g4x04VGwL3UX
 lflvONciLMR4oXfwnM0mGRdkrSbrqykkqDsvWRgq6FLOFF6BVEd/8mgHtQu9ECe4mMVz
 OB9w==
X-Gm-Message-State: APjAAAWv+HtbFjxuUD8cFxrOxiCSRmIevGQDRoueM/yJBavDtN2HHFMF
 ZZf0Pmttq5Ncruy5kEZYkeQsobVoT4fuiQsptLcB0w==
X-Google-Smtp-Source: APXvYqzdCLWgxj960/YUfQPhcpvzx0x+9Dh/oSxDWTDDNRlN23xXNdcpcn7jogMNWxlL1xvQwoCq4LGl2oezajjRk1g=
X-Received: by 2002:a17:90a:bf02:: with SMTP id
 c2mr1283296pjs.73.1559847021932; 
 Thu, 06 Jun 2019 11:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190606051227.90944-1-natechancellor@gmail.com>
In-Reply-To: <20190606051227.90944-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 6 Jun 2019 11:50:10 -0700
Message-ID: <CAKwvOdnswiifrvSrBcAnc4Br8nhxJRUAL0yNM6T6=4xScHXf5g@mail.gmail.com>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Mark Brown <broonie@kernel.org>, Shuming Fan <shumingf@realtek.com>,
 Bard Liao <bardliao@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt1011: Mark format integer literals
	as unsigned
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

On Wed, Jun 5, 2019 at 10:13 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Clang warns:
>
> sound/soc/codecs/rt1011.c:1291:12: warning: integer literal is too large
> to be represented in type 'long', interpreting as 'unsigned long' per
> C89; this literal will have type 'long long' in C99 onwards
> [-Wc99-compat]
>                 format = 2147483648; /* 2^24 * 128 */

This number's bitpattern is a leading one followed by 31 zeros.
`format` is declared as `unsigned int`, and literals in C are signed
unless suffixed, so this patch LGTM.  Maybe a macro declaring such a
bitpattern would improve readability over the existing magic constant
and comment?
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>                          ^
> sound/soc/codecs/rt1011.c:2123:13: warning: integer literal is too large
> to be represented in type 'long', interpreting as 'unsigned long' per
> C89; this literal will have type 'long long' in C99 onwards
> [-Wc99-compat]
>                         format = 2147483648; /* 2^24 * 128 */
>                                  ^
> 2 warnings generated.
>
> Mark the integer literals as unsigned explicitly so that if the kernel
> does ever bump the C standard it uses, the behavior is consitent.

s/consitent/consistent/

:set spell

:P
-- 
Thanks,
~Nick Desaulniers
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
