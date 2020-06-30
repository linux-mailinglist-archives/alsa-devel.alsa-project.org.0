Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 843F9210004
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 00:24:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25CDA1614;
	Wed,  1 Jul 2020 00:23:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25CDA1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593555871;
	bh=tLQScyH3DkTRMoOo7z4ZDKGZgpJVuuj0dCkLOX2a9iE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JnnflfuRgG/4/CoFFAUO1+xLzVzlIiWYYzALhnPtMRrdyyid3HVaSTLmmEJlK9W4K
	 bbwyYevuVqf+ihOa91HaPV2joC6hVg9ggwU97of/6pIqPPmxZAmwdp8W/tPPzIvpvf
	 TYReBwYyskSpOlLPN5/uFiwLQabyTsKakOn0pTjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C615F8013E;
	Wed,  1 Jul 2020 00:22:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DB27F801F2; Wed,  1 Jul 2020 00:22:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE14AF8013E
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 00:22:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE14AF8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="d9za7jNT"
Received: by mail-pl1-x641.google.com with SMTP id o1so2490620plk.1
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 15:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LQqg1+PZ05kIBpTL59xr7DfetEZhJfx8+ch9+gI56hE=;
 b=d9za7jNTCujMATufanAoR3E/dGN4JlmvT8hTxlO3BqAzmpkcLMzyenbVFNE04cO5Eq
 V3DgKPCKI5KwKtKe/Lm6L4L/ke5Q1Y/bNin6Ta4aYPvb9AaDyLgHaKCQ7/bhBAiCY10J
 9Qtuq+KjVh4r1/3OeWVh3VEZtFTmImFJLF8MdDLDnxQcdIDSfkzSD2QUF1q5FRBXynKF
 chtp2UHDgw7EWxu56qD6JK+Wh1bOkY5o1Jz+mh76bbPcfik3Bh6qpYuwVzpDL+A70zpI
 0X2X1Agp2iaiaf2DoXiqE+EKqkqHPYLKjJw2dd7rDpioCCC36NnjhlW+gvz+y3oK0sju
 4qnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LQqg1+PZ05kIBpTL59xr7DfetEZhJfx8+ch9+gI56hE=;
 b=bGUlQG9fgx1Qz2YJNVOC1ch0zkbLCUNnWaPAyWlmwdFCaom5c+HGzYPWuVDprxRLae
 gVAn34YbiyCNvYP6cKPl5DdmlA67GNjkuvZagg+m3io1DgS3a23o7sKY7JIuSYn5foa5
 R8sa5caETOtVOLPvlTU7yWJVHaRmB1H1Qzq3HsElafVfl/zdZ9sLOzoEj2IGm8ltA3Xd
 yQ7NYUgRn4f1j37e/Lbk8lUL1ytLFxWHmqg+mvkmYPvSKcgszFKbvtx0StmlYx5cQbR2
 r1Nok3L33r/L5ehPzgvrnnywaVldrml99aLTjKuktmi0JTt7S83HoIQwd0WfricFncub
 3BBw==
X-Gm-Message-State: AOAM531i7KIhj6HttwiTFnGp8JTjMef2Trp4KnOGEP2TkC4asMpTVQfI
 NXszU5qoeizXKXiyKtaLhidGPeqVSDaCyNv+YzKGFcuG
X-Google-Smtp-Source: ABdhPJxCBS34d/ACfckTMdJK3GubMe09aLA2YT2TUi4myE/v1ISodfMaY3nIq1O/4bK4VRpBoPPYs9LPzxwrE6TH1wo=
X-Received: by 2002:a17:90a:1e:: with SMTP id 30mr23028159pja.25.1593555757877; 
 Tue, 30 Jun 2020 15:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200617010232.23222-1-natechancellor@gmail.com>
In-Reply-To: <20200617010232.23222-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 30 Jun 2020 15:22:25 -0700
Message-ID: <CAKwvOdkXfW0vncswB_OjLfVu4-dAqZXaotw44y6TZSVEezWW0Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: KeemBay: Fix header guard
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>,
 Sia Jee Heng <jee.heng.sia@intel.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Mark Brown <broonie@kernel.org>, Nathan Chancellor <natechancellor@gmail.com>
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

On Tue, Jun 16, 2020 at 6:02 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Clang warns:
>
>  In file included from sound/soc/intel/keembay/kmb_platform.c:14:
>  sound/soc/intel/keembay/kmb_platform.h:9:9: warning: 'KMB_PLATFORM_H_'
>  is used as a header guard here, followed by #define of a different
>  macro [-Wheader-guard]
>  #ifndef KMB_PLATFORM_H_
>          ^~~~~~~~~~~~~~~
>  sound/soc/intel/keembay/kmb_platform.h:10:9: note: 'KMB_PLATFORMP_H_'
>  is defined here; did you mean 'KMB_PLATFORM_H_'?
>  #define KMB_PLATFORMP_H_
>          ^~~~~~~~~~~~~~~~
>          KMB_PLATFORM_H_
>  1 warning generated.
>
> Fix the typo so that the header guard works as intended.
>
> Fixes: c5477e966728 ("ASoC: Intel: Add KeemBay platform driver")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1053
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  sound/soc/intel/keembay/kmb_platform.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/intel/keembay/kmb_platform.h b/sound/soc/intel/keembay/kmb_platform.h
> index 29600652d8f4..6bf221aa8fff 100644
> --- a/sound/soc/intel/keembay/kmb_platform.h
> +++ b/sound/soc/intel/keembay/kmb_platform.h
> @@ -7,7 +7,7 @@
>   */
>
>  #ifndef KMB_PLATFORM_H_
> -#define KMB_PLATFORMP_H_
> +#define KMB_PLATFORM_H_
>
>  #include <linux/bits.h>
>  #include <linux/bitfield.h>
>
> base-commit: 27f70ec4fa0e0f419031f1b8d61b1a788244e313
> --
> 2.27.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200617010232.23222-1-natechancellor%40gmail.com.



-- 
Thanks,
~Nick Desaulniers
