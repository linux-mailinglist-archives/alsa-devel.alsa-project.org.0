Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D655545C6A
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 08:40:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 070B01EFC;
	Fri, 10 Jun 2022 08:39:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 070B01EFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654843226;
	bh=KAdpbiM/KIgX5LXmerh/Cot0KHKjuFxYvYHzVXSXlyA=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=exE/iAxPb2kA6N66AhCOVxRCmmHg243ySv7xLoSMNbhbF0WhBqqvr3HHnjWA9Z6m5
	 c8d4DrKK3EmYz8X7bMqg+/LPjkYsQYTpxfOYRGmiAEBeR9bbR+/bZakXgNfiF08KEI
	 Rcut5JVmrKenPinF5UvJa6NkRMGHL+SIjlpcQik8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 607BDF8053B;
	Fri, 10 Jun 2022 08:37:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E2E8F801F5; Fri, 10 Jun 2022 00:18:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, SPF_HELO_NONE, SPF_NONE, T_SCC_BODY_TEXT_LINE,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F094BF800E9
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 00:18:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F094BF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="qNUPK/S5"
Received: by mail-pg1-x549.google.com with SMTP id
 78-20020a630051000000b003fe25580679so3660912pga.9
 for <alsa-devel@alsa-project.org>; Thu, 09 Jun 2022 15:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=HlrKEzC+OauxSUT5xZtPYeK0f3N3z3B8pf9PvEyK7vc=;
 b=qNUPK/S5iHdXgPK57Bkixsq++QOQQMHfyV6r2MtPs7v9I3SUg8azHVdlWi+Vmpdk0V
 e9swXJWEpf/dXShWMQkD9tdieecIjQpQiuIyNIyGp6c4DhP+OHtn6lVN3Jb0aUWnt0zX
 6WRDoSX5skQyQJy1DXGgbB1frbSREBbKFeP8ovCXNP1nwpzQihNeuZDVsxzVVQEW/FTO
 oasKzV38q06qXK4hlfrcDIvuu6az9YMh+LOMOYwAEM/GaKPtPsyF6cfogObTYmCvxbsF
 HDhlFK8BOzg5MG7pql3z3B69jG4uxkigcwMhH0FMhZG9+AiHWiMvxTL/b/XFzI/yrt60
 XE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=HlrKEzC+OauxSUT5xZtPYeK0f3N3z3B8pf9PvEyK7vc=;
 b=hNQyOgDGSFW20dfZQl34ehvRguj6Ak2GpHNDx4vZjJzRRvFIHbBwvW7IoLEORZHZgK
 Fp/c9xlHjmjOVfpmC09aIr3PDwBuGoUKJ1BtNMNBtDQcxon8eksz6ZVLJAFY9BN/7x9p
 RXGRvoHHY9yMgwRpCda7GIx0NI6v+nw24DLAekrRxEUPR5rZr3ce7jufofBtwa4EEFZY
 nnbfIihnH/DOcVjXFRV4mJBy88wym5QptihjIwLG91xQVSIvVqFqaG3ZMNww7WB3hAli
 7A+QeeCQtSb8q1bEhVIyg+gR4fc9ABJ6xNt1S1WTaAyHU1OhFxlhHPA7LaVJpZ5KwzL6
 FMjw==
X-Gm-Message-State: AOAM533fXnMRrfPQP8GtomTN6j9aWRTfjyn1CKtH3H6ge840u0q9U+ja
 HQ95MPXfS228rTFIcSzZMi/ghfhs
X-Google-Smtp-Source: ABdhPJxktSZZjGsZMg+ncs7oCo7UsGcqz2MItXnZVpN7aAWxKCb/sSBN71lrVJLJ6nxui+334t4TDARu1w==
X-Received: from fawn.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5795])
 (user=morbo job=sendgmr) by 2002:a63:5924:0:b0:3fb:a75e:9e8a with
 SMTP id
 n36-20020a635924000000b003fba75e9e8amr36694755pgb.394.1654813127925; Thu, 09
 Jun 2022 15:18:47 -0700 (PDT)
Date: Thu,  9 Jun 2022 22:16:23 +0000
In-Reply-To: <20220609221702.347522-1-morbo@google.com>
Message-Id: <20220609221702.347522-5-morbo@google.com>
Mime-Version: 1.0
References: <20220609221702.347522-1-morbo@google.com>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH 04/12] blk-cgroup: use correct format characters
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

mm/backing-dev.c:880:57: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
        dev = device_create(bdi_class, NULL, MKDEV(0, 0), bdi, bdi->dev_name);
                                                               ^~~~~~~~~~~~~

Use a string literal for the format string.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Bill Wendling <isanbard@gmail.com>
---
 mm/backing-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index ff60bd7d74e0..7b7786dceff3 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -877,7 +877,7 @@ int bdi_register_va(struct backing_dev_info *bdi, const char *fmt, va_list args)
 		return 0;
 
 	vsnprintf(bdi->dev_name, sizeof(bdi->dev_name), fmt, args);
-	dev = device_create(bdi_class, NULL, MKDEV(0, 0), bdi, bdi->dev_name);
+	dev = device_create(bdi_class, NULL, MKDEV(0, 0), bdi, "%s", bdi->dev_name);
 	if (IS_ERR(dev))
 		return PTR_ERR(dev);
 
-- 
2.36.1.255.ge46751e96f-goog

