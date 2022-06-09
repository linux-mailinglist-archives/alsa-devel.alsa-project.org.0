Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBA2545C69
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 08:40:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D5A71ED8;
	Fri, 10 Jun 2022 08:39:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D5A71ED8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654843214;
	bh=GMIbDw7ECDh7wtlEofA5kOvZi2NuKs8TvgQ3APi5CHQ=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ojlmCrPGoR9MXMi0eaGA3tHNNfOV4v4A8oKo7PypiF6Me2T2sUpud9r2wf2ctXzUv
	 xzZPfRALJFMHS0DXtKo7JnN4TyCD7n7XEeVVRsJ8u7PekMjXzhWSrFv1jaj4hHDOMT
	 ctW6e/pkZiAIomCgW8s786CdkpqmNuCbeNye/jaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D68CFF8053A;
	Fri, 10 Jun 2022 08:37:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63BE6F800E9; Fri, 10 Jun 2022 00:18:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, SPF_HELO_NONE, SPF_NONE, T_SCC_BODY_TEXT_LINE,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAD01F800C7
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 00:18:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAD01F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="QJYSL92E"
Received: by mail-pl1-x64a.google.com with SMTP id
 x1-20020a170902ec8100b0016634ff72a4so12509433plg.15
 for <alsa-devel@alsa-project.org>; Thu, 09 Jun 2022 15:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=zQ6igRU/lPsPPjITd4pdT0XeOfhGOx4hu6xL7AAJoM8=;
 b=QJYSL92EGHv0Glqefsz+fZAyuHXsVDJ+MxqtY38p/rJWyzN9tqq38im0/nAHSSrAcw
 XMQ6nAGoVVakkYRIOxtqwHJW03YmZH40gkW7E/YkdAEWc9hWN2V7ngXOGdkLxNXXFPVz
 MM6SoDd9zGDwN7h4y2Zv5sUmYXsKm79QEart8XywqgYgGMlR5uKSmr2M8zPPYELNG0fC
 sjbVW5cOWu2CabVPyhNOvTWLIe4OkL9eosbWQbgqXLmWmjLl4VHTPCfxGjF9R4eBYA8S
 SWfDBEXFQ0GXfeXiQjFQ4xktd6Mieq2x7asfEjehSXBFdpIoHP2WaOku4Aej/pIaybf5
 FCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=zQ6igRU/lPsPPjITd4pdT0XeOfhGOx4hu6xL7AAJoM8=;
 b=1pg2p8yca/zYxpAgpbnXSA0qkfxU8F/xzPP7Uhda0GUk5qzLtSUO9pQVG+XXapfC6b
 qRZs5JPKHN9zAtTi6zl7KNCjK3V44d37hpqBVm0nQcpEcJALvUFJndgKEFMkoHpsmi4h
 SRDSf0RuQ0NIIw9VefoiQakxQ9ivwHEMzNzMCm7iS28y0dZGv6TzUk0iqWOY6ptlXu81
 TQ/iTkdxTEmBuBzHkaN5UdJdCA/rylIDEHmxtsYK90UdRmvqHgn7HP4PstlX5plpAh/+
 j8MAgN0A/MYgEuXs5+dLMo9bCOdO7Psxr9n/8stHdmahjNi/uDqyuuNISiAg/3YH9a5c
 hzSQ==
X-Gm-Message-State: AOAM530GoU6BBFUGsALdI79f9EV5f/Cue82mBhrO55sWC592bs99wj61
 Jl1XRU/FUFvBLrWr7pOP03qYUb66
X-Google-Smtp-Source: ABdhPJwaaQIFrsaGRD2eHE0bL/iy5r4Z+mF9XLusw0L85/0I2ggYu7uuJziQ3x377wlgzuNlbfNxKB4Iyw==
X-Received: from fawn.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5795])
 (user=morbo job=sendgmr) by 2002:a17:90a:249:b0:1e0:a8a3:3c6c with
 SMTP id
 t9-20020a17090a024900b001e0a8a33c6cmr114285pje.0.1654813104885; Thu, 09 Jun
 2022 15:18:24 -0700 (PDT)
Date: Thu,  9 Jun 2022 22:16:22 +0000
In-Reply-To: <20220609221702.347522-1-morbo@google.com>
Message-Id: <20220609221702.347522-4-morbo@google.com>
Mime-Version: 1.0
References: <20220609221702.347522-1-morbo@google.com>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH 03/12] x86/e820: use correct format characters
From: Bill Wendling <morbo@google.com>
To: isanbard@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 10 Jun 2022 08:37:37 +0200
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

From: Bill Wendling <isanbard@gmail.com>

When compiling with -Wformat, clang emits the following warnings:

arch/x86/kernel/e820.c:877:15: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
        early_printk(msg);
                     ^~~
arch/x86/kernel/e820.c:878:8: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
        panic(msg);
              ^~~

Use a string literal for the format string.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Bill Wendling <isanbard@gmail.com>
---
 arch/x86/kernel/e820.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index f267205f2d5a..ca4634a0bdb5 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -874,8 +874,8 @@ unsigned long __init e820__end_of_low_ram_pfn(void)
 
 static void __init early_panic(char *msg)
 {
-	early_printk(msg);
-	panic(msg);
+	early_printk("%s", msg);
+	panic("%s", msg);
 }
 
 static int userdef __initdata;
-- 
2.36.1.255.ge46751e96f-goog

