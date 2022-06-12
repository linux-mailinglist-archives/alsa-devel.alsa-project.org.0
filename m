Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 435C854A8F3
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 07:56:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D843A18A0;
	Tue, 14 Jun 2022 07:55:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D843A18A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655186204;
	bh=rI/OyLq3H5gAxKdSlJNiXqvwTd+9VnlyZm9qnk9yCy8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZmAwqC7DPQ3CE5U+bu2WEzYzuDOQzWWVevdSfr3JgtCxyQMpljcQI3OtYdZ2elRJe
	 RpfmhJMUaj027O4JovzwZTDWTKmOjN0gdJpzUAMziSt3lEbrUmQI6nNLbIYAddu0mH
	 bCk0UklaMPwy8GVM/bbFxRTltgDb/Sk0uz5EPTyY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E239F8053A;
	Tue, 14 Jun 2022 07:54:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C056F800BD; Sun, 12 Jun 2022 18:23:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3F57F800BD
 for <alsa-devel@alsa-project.org>; Sun, 12 Jun 2022 18:23:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3F57F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=philpotter-co-uk.20210112.gappssmtp.com
 header.i=@philpotter-co-uk.20210112.gappssmtp.com header.b="R/sEjCaZ"
Received: by mail-wm1-x32e.google.com with SMTP id
 m32-20020a05600c3b2000b0039756bb41f2so1893313wms.3
 for <alsa-devel@alsa-project.org>; Sun, 12 Jun 2022 09:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Bp1t0MAX0vF2MFrixDjLhlmP3KLo6hgWxyC3M+usaE8=;
 b=R/sEjCaZtQEnfPFaK+UnnTh0wg4bRV6svzZB+oS2hfNNJzpfcRRfcZmCJOP8EySmQd
 g+xcBgfqADhJshLEY78CKFvKjnbnDQTiZlNPaYQ4krJN4DIZr0DcF9zio2w2kHV8Sq+E
 bLM/i/SzIos3D8gnl2FjBUdtUwk4BOXJ/p4Gz7UFvasXpv6HXMR+5PupsiPSPR0TnZya
 F4NsEqC4DRhyBo+zGRqyKs6C3D88H2ZM6iKWsmgHMRXInXx2VY+xkqjwHyZXLhqJ9DIi
 GLX8O48hgFb+6agiYOXIOISy12Ll9TGb3KH9UckWOW5W3iIlklqwzjxaxwQD5RPR2Sdf
 1JcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Bp1t0MAX0vF2MFrixDjLhlmP3KLo6hgWxyC3M+usaE8=;
 b=aFYMFSbG1nu+JOgsyP29Xq/3PFv/stsVFkkUYJwnjUYLsmLRf/Apubl5cmo2zU3hBW
 zqy7blhy78eCp2D+MP0NFWi0AV+bKj8HECw5QVVmYBsg6JikbcKBON+l5F9cKKDlPhKo
 6BtMs6cowjiYZW+Apr1g/U5GQ1ZDsZvpKq3aD3gu4v0ZcMNWrXyYuLgQHPIYJ9qPdoPQ
 AZNLIWTgQaRzw0m7ZZetl/vKKcqnYxwDvgGhKoI1rOLwwEssnMBF+rfxA0xwW+ruAQBj
 SndGblGaxHMxzxiMdpX8qZIMJ+E6roE7l3hqJZoijj6MZ5HRFz8k954iMEa5aTUbJ1u2
 OwHA==
X-Gm-Message-State: AOAM530eLYtBRCLEUP0BeJcTq/iRXA0DoSaYftY6EqUfhisvkJhBQ9qO
 jtJ07vfDrimHKqCv8DdU5zD0UA==
X-Google-Smtp-Source: ABdhPJyPL0K+xAMvnRb2ONEX1jWjnGDkkA7zHOBZU3POgTFS7NF7cqaibZCvN8D1E1ysUwm9U4xflg==
X-Received: by 2002:a05:600c:2682:b0:39c:8ec6:57d9 with SMTP id
 2-20020a05600c268200b0039c8ec657d9mr3559545wmt.99.1655051032703; 
 Sun, 12 Jun 2022 09:23:52 -0700 (PDT)
Received: from equinox
 (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:dfde:e1a0::2]) by smtp.gmail.com with ESMTPSA id
 bh8-20020a05600c3d0800b003942a244ee6sm6005715wmb.43.2022.06.12.09.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 09:23:51 -0700 (PDT)
Date: Sun, 12 Jun 2022 17:23:47 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Bill Wendling <morbo@google.com>
Subject: Re: [PATCH 08/12] cdrom: use correct format characters
Message-ID: <YqYTExy0IpVbunBL@equinox>
References: <20220609221702.347522-1-morbo@google.com>
 <20220609221702.347522-9-morbo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609221702.347522-9-morbo@google.com>
X-Mailman-Approved-At: Tue, 14 Jun 2022 07:54:10 +0200
Cc: alsa-devel@alsa-project.org, x86@kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Phillip Potter <phil@philpotter.co.uk>, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, isanbard@gmail.com,
 Daniel Kiper <daniel.kiper@oracle.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, linux-acpi@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Tom Rix <trix@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, llvm@lists.linux.dev,
 coreteam@netfilter.org, Arnd Bergmann <arnd@arndb.de>,
 Ross Philipson <ross.philipson@oracle.com>,
 Nathan Chancellor <nathan@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Westphal <fw@strlen.de>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 Jan Kara <jack@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
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

On Thu, Jun 09, 2022 at 10:16:27PM +0000, Bill Wendling wrote:
> From: Bill Wendling <isanbard@gmail.com>
> 
> When compiling with -Wformat, clang emits the following warnings:
> 
> drivers/cdrom/cdrom.c:3454:48: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
>         ret = scnprintf(info + *pos, max_size - *pos, header);
>                                                       ^~~~~~
> 
> Use a string literal for the format string.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/378
> Signed-off-by: Bill Wendling <isanbard@gmail.com>
> ---
>  drivers/cdrom/cdrom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
> index 416f723a2dbb..52b40120c76e 100644
> --- a/drivers/cdrom/cdrom.c
> +++ b/drivers/cdrom/cdrom.c
> @@ -3451,7 +3451,7 @@ static int cdrom_print_info(const char *header, int val, char *info,
>  	struct cdrom_device_info *cdi;
>  	int ret;
>  
> -	ret = scnprintf(info + *pos, max_size - *pos, header);
> +	ret = scnprintf(info + *pos, max_size - *pos, "%s", header);
>  	if (!ret)
>  		return 1;
>  
> -- 
> 2.36.1.255.ge46751e96f-goog
> 

Hi Bill,

Thank you for the patch, much appreciated.

Looking at this though, all callers of cdrom_print_info() provide 'header'
as a string literal defined within the driver, when making the call.
Therefore, I'm not convinced this change is necessary for cdrom.c -
that said, in this particular use case I don't think it would hurt
either.

I've followed the other responses on parts of this series, so I
understand that a different solution is potentially in the works.
Thought I'd respond anyway though out of courtesy.

All the best,
Phil (Uniform CDROM Maintainer)
