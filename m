Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41536545C7A
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 08:44:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D338F2098;
	Fri, 10 Jun 2022 08:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D338F2098
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654843449;
	bh=3jEdPTaH5c8P3N+yTFND+rjwznan3Zm6SBMdnw+HlZ0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nRIsyqytEvctyL9vP4kExEXOT2bZBlxWxJpKfLdipWjntK6+MeXCsj0EJOTOQIc20
	 kxrP0GYZf5PQSsgg0SGaYBXuZavyJk06uGMzHoIk1dGfZll0zR3c/CYk6k9uNWydQg
	 APuNRwIZzuwg96QIc81ZLB9MdgWPNFCXhXrXCh/4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D92F7F805BF;
	Fri, 10 Jun 2022 08:37:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4809F801F5; Fri, 10 Jun 2022 01:16:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6971CF800E9
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 01:16:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6971CF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="i3qj63Wr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=s6f6JLtoaOli3gEhHTppp4fmxuJwb8QIU15eBakfOJU=; b=i3qj63WrYUNY43MsN7ARPnlv0w
 uhTtBf8MplRqkVMB/I9jOTstcPT6ZK+6y7m82ty5GKfMfhF92mGMAti1AG/OXZYAPUeJttdRU6UwF
 Y5O3WPbkmENJgFLqmh6wbK2eOgNf6Enb7sqWTh7i4qUab45mlSpZ3LVw826gFmWwhHquxIngcAy8S
 Gm8k4+KVgF6yTPW8u5Ayl956vcUcvRax5+ZOTb0FvlddSrT+XQb2bhvUgG55iQaUkRdpB7qxlpwLW
 520dbhk/1P/Z6KN3O1BKt3GiFEJmhyjtSTMfCkQyd2PCnjNlHiclShan1cErMRn8vtPbnPCEOiBYt
 TO7/TPBA==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nzRMu-00DvXN-9e; Thu, 09 Jun 2022 23:15:12 +0000
Message-ID: <3a773edf-f850-e83d-828d-19f91a373384@infradead.org>
Date: Thu, 9 Jun 2022 16:14:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 01/12] x86/mce: use correct format characters
Content-Language: en-US
To: Bill Wendling <morbo@google.com>, isanbard@gmail.com
References: <20220609221702.347522-1-morbo@google.com>
 <20220609221702.347522-2-morbo@google.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220609221702.347522-2-morbo@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 10 Jun 2022 08:37:38 +0200
Cc: alsa-devel@alsa-project.org, x86@kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Phillip Potter <phil@philpotter.co.uk>, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Daniel Kiper <daniel.kiper@oracle.com>,
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



On 6/9/22 15:16, Bill Wendling wrote:
> From: Bill Wendling <isanbard@gmail.com>
> 
> When compiling with -Wformat, clang emits the following warnings:
> 
> arch/x86/kernel/cpu/mce/core.c:295:9: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
>                 panic(msg);
>                       ^~~
> 
> Use a string literal for the format string.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/378
> Signed-off-by: Bill Wendling <isanbard@gmail.com>
> ---
>  arch/x86/kernel/cpu/mce/core.c | 2 +-
>  scripts/Makefile.extrawarn     | 4 ++--

Where is the scripts/ change?

>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
> index 2c8ec5c71712..3d411b7c85ad 100644
> --- a/arch/x86/kernel/cpu/mce/core.c
> +++ b/arch/x86/kernel/cpu/mce/core.c
> @@ -292,7 +292,7 @@ static noinstr void mce_panic(const char *msg, struct mce *final, char *exp)
>  	if (!fake_panic) {
>  		if (panic_timeout == 0)
>  			panic_timeout = mca_cfg.panic_timeout;
> -		panic(msg);
> +		panic("%s", msg);
>  	} else
>  		pr_emerg(HW_ERR "Fake kernel panic: %s\n", msg);
>  

-- 
~Randy
