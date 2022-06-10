Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE73B545C89
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 08:45:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FCBD21A0;
	Fri, 10 Jun 2022 08:44:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FCBD21A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654843529;
	bh=2yFCZugsiNQZN0gkgMSO/PLnnK4cDobzksJyDLjp9Ts=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ObWqSyxp6sUth+sq8HZ40rOz9SNhqWQ7jk5XGaJvHAhmqOdxoeDIc8Ub8HEyQ9jXT
	 FGWSC4tYwgtaGvut3klFgklfQsHo4BXEEJofg58EFHttns5s+RlYiS779Wn6vE5yR9
	 EROCMZO4kXVtQbKV/L1Tb8Kf10YaCdMmPPMfU6b0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9EBCF805E3;
	Fri, 10 Jun 2022 08:37:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 930FDF800C7; Fri, 10 Jun 2022 07:19:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3A18F800C7
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 07:19:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3A18F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="rh1PySG6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6BFB161E24;
 Fri, 10 Jun 2022 05:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C60CC34114;
 Fri, 10 Jun 2022 05:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1654838336;
 bh=2yFCZugsiNQZN0gkgMSO/PLnnK4cDobzksJyDLjp9Ts=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rh1PySG6mRmieZPY8cY0A1hPrIcbkuP807V49e98ihkLxbZ06HxYRwIuVMf+wTLDn
 X/yCYKI3C60vy05a003Jfa/l8d0up/cE/3SCBy/NuCOYNPxYpirlNBYrpXNy/Wd9yS
 jlJr0CyMDaP1q3f/tt8/VcfJ3YUsM+y3ifSXc9V4=
Date: Fri, 10 Jun 2022 07:18:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bill Wendling <morbo@google.com>
Subject: Re: [PATCH 07/12] driver/char: use correct format characters
Message-ID: <YqLUORmZQgG1D6lc@kroah.com>
References: <20220609221702.347522-1-morbo@google.com>
 <20220609221702.347522-8-morbo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609221702.347522-8-morbo@google.com>
X-Mailman-Approved-At: Fri, 10 Jun 2022 08:37:38 +0200
Cc: alsa-devel@alsa-project.org, x86@kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Phillip Potter <phil@philpotter.co.uk>, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, "H. Peter Anvin" <hpa@zytor.com>,
 isanbard@gmail.com, Daniel Kiper <daniel.kiper@oracle.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, linux-acpi@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Tom Rix <trix@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, llvm@lists.linux.dev,
 coreteam@netfilter.org, Arnd Bergmann <arnd@arndb.de>,
 Ross Philipson <ross.philipson@oracle.com>,
 Nathan Chancellor <nathan@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, netdev@vger.kernel.org,
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

On Thu, Jun 09, 2022 at 10:16:26PM +0000, Bill Wendling wrote:
> From: Bill Wendling <isanbard@gmail.com>

Why isn't that matching your From: line in the email?

> 
> When compiling with -Wformat, clang emits the following warnings:

Is that ever a default build option for the kernel?

> 
> drivers/char/mem.c:775:16: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
>                               NULL, devlist[minor].name);
>                                     ^~~~~~~~~~~~~~~~~~~
> 
> Use a string literal for the format string.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/378
> Signed-off-by: Bill Wendling <isanbard@gmail.com>
> ---
>  drivers/char/mem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/mem.c b/drivers/char/mem.c
> index 84ca98ed1dad..32d821ba9e4d 100644
> --- a/drivers/char/mem.c
> +++ b/drivers/char/mem.c
> @@ -772,7 +772,7 @@ static int __init chr_dev_init(void)
>  			continue;
>  
>  		device_create(mem_class, NULL, MKDEV(MEM_MAJOR, minor),
> -			      NULL, devlist[minor].name);
> +			      NULL, "%s", devlist[minor].name);

Please explain how this static string can ever be user controlled.

thanks,

greg k-h
