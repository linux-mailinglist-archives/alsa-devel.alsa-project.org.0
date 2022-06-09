Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3B3545C78
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 08:43:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACCDF201A;
	Fri, 10 Jun 2022 08:42:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACCDF201A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654843418;
	bh=8DPG20VCczCvHexMZwkQ1zY5Py8+AevTKqQ6qMOe6VU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MrjLi20lEL20md6KnhdG1xcKUVYgYWo0FHBHa0mJpj2HdJTRHEVcSNoNlm7WDkiRT
	 UwHdGqkagCCIy4LhOD+HDISjG3PAt1/Hm/lrwCuqYIZcG5YyXDsT1sCMbdoVdA82mS
	 snjKzGYUdsZ8oO9TejurhGZSJHTmGRyS8Hgq4gIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F0F9F805B3;
	Fri, 10 Jun 2022 08:37:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24ADAF800E9; Fri, 10 Jun 2022 00:25:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEFA8F800E9
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 00:25:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEFA8F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linux-foundation.org
 header.i=@linux-foundation.org header.b="v1isGaFZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A447061F3D;
 Thu,  9 Jun 2022 22:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9ABFC34114;
 Thu,  9 Jun 2022 22:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1654813530;
 bh=8DPG20VCczCvHexMZwkQ1zY5Py8+AevTKqQ6qMOe6VU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=v1isGaFZcOTd3hQSFwhJjKIptScdtzZdYTbChS0lD05tHMRSy7BT4ZgRXBgnC0WDM
 KgLV/3LJHT5eYoc434PB9zA81twQJVarz5OWwe6dzijmGQzObvdi2M2MX6KmWex0Ff
 UOZ65DWa7jodmuE8mcxI6Xnz3KDxzgQuDp9E63LI=
Date: Thu, 9 Jun 2022 15:25:27 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Bill Wendling <morbo@google.com>
Subject: Re: [PATCH 00/12] Clang -Wformat warning fixes
Message-Id: <20220609152527.4ad7862d4126e276e6f76315@linux-foundation.org>
In-Reply-To: <20220609221702.347522-1-morbo@google.com>
References: <20220609221702.347522-1-morbo@google.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 10 Jun 2022 08:37:38 +0200
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
 Jan Kara <jack@suse.com>, "David S. Miller" <davem@davemloft.net>
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

On Thu,  9 Jun 2022 22:16:19 +0000 Bill Wendling <morbo@google.com> wrote:

> This patch set fixes some clang warnings when -Wformat is enabled.
> 

tldr:

-	printk(msg);
+	printk("%s", msg);

the only reason to make this change is where `msg' could contain a `%'.
Generally, it came from userspace.  Otherwise these changes are a
useless consumer of runtime resources.

I think it would be better to quieten clang in some fashion.
