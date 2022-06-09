Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1A2545C71
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 08:42:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 134E91F8E;
	Fri, 10 Jun 2022 08:41:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 134E91F8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654843339;
	bh=hC1rLhkHeCTCuDIYo33WVQJymSeOhItLSB3n5+EaIbg=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sAlMAQ8+nVVMdTQ/w71hhnLVPYvjLD8re0dk9Aj3X3caNv49Gw6CB5WoE+VYChJUK
	 W7B/XevebM7pzMwy7o1qDHffbYF8KwFOpslOza5njU65Nu9GtN9SDLeqYtumqpkn64
	 ujP4ZiKUzeMFYSfBb9Vk//DoNboHMnOJ4+Bt333U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 389BDF80579;
	Fri, 10 Jun 2022 08:37:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58C2AF801F5; Fri, 10 Jun 2022 00:21:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, SPF_HELO_NONE, SPF_NONE, T_SCC_BODY_TEXT_LINE,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19C75F800C7
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 00:21:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19C75F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="i42901GY"
Received: by mail-pl1-x64a.google.com with SMTP id
 p2-20020a170902e74200b00164081f682cso13401558plf.16
 for <alsa-devel@alsa-project.org>; Thu, 09 Jun 2022 15:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=+JW2n6LLjgkLeZpu0VrK7uVIniA8Omo9w9YQRrZ1ImQ=;
 b=i42901GYNhaxsHQ0DOGoOky9iCPlDaMMKrye+1S6wrdYfiDoHAZcC7HTQX/ufq8JDc
 FtLJH8ibG+4hcwJncrABH5MINqNlaiBQcg6AiUjnTwqlf664IuYPp0tvgNpDNS6s/GjQ
 Wjh2TOa/isNuXc04yhOdZrj9wIAtXkGMKkDBH370v2doh3glFP/6lvE9gZpbXECpN/zv
 UStKebGupQmmTtj2yMjnHwJiwJi/peKu25pYf9NTE11Ch6upWSa6FAa3CkIKEN5+Emo5
 3UDTgqdqaohZKI3Gp3XYmJjjv1YwnDPf8AUi3y1kFAWlFzS3PLERdXTH2sKpk0ltR6ij
 /vAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=+JW2n6LLjgkLeZpu0VrK7uVIniA8Omo9w9YQRrZ1ImQ=;
 b=ojNlP0UpC75I8Sw5ST2+D1/7SByCguyZXWn+hRFyGKcrdMURkqImNWv0WPbvhXb9Du
 f2xp0iw8LbqQ/OjXfbbWHkRgDbJidzIQiTnLKUsRHDCbj3pK7VQy5xTkEyJ1ldWb01wF
 UswoFASbVlvCVHm0hcQUOyuUMCC78FDhTHrcxu3i5+47MfNxJmloVNw5TnB8T5rS5ZNr
 xnvuAAXJtG1oieyr7dNQbPCQsyKuZkI5ByaZAi9BMuqqRMAptt9kFUhRPT1scDhtKko2
 Iq4xCvEIeoefRNmgTBKLOKz3GDwaWQhThU+5w+0NVk6VUlYP295/YZd+CGWPlbVSaqyj
 pDMg==
X-Gm-Message-State: AOAM533r/jzU5TaFPhWNROa7etRQ4FiRBxt7X7ThC7U5dMbfgHGmXiUl
 qBg1ys76pDMiNCOcgRiQHHBn7M6x
X-Google-Smtp-Source: ABdhPJxwIiVK0GwVN12g3ZMNH56OyPQzBgCjPEweYrbMYHqEsJdgXTONzisCGHUJLebHzTiLq5Vb6Q5FXg==
X-Received: from fawn.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5795])
 (user=morbo job=sendgmr) by 2002:a63:409:0:b0:3fd:77f0:9a75 with
 SMTP id
 9-20020a630409000000b003fd77f09a75mr25262295pge.149.1654813287223; Thu, 09
 Jun 2022 15:21:27 -0700 (PDT)
Date: Thu,  9 Jun 2022 22:16:30 +0000
In-Reply-To: <20220609221702.347522-1-morbo@google.com>
Message-Id: <20220609221702.347522-12-morbo@google.com>
Mime-Version: 1.0
References: <20220609221702.347522-1-morbo@google.com>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH 11/12] ALSA: control: use correct format characters
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

sound/core/control.c:2062:24: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
        return request_module(module_name);
                              ^~~~~~~~~~~

Use a string literal for the format string.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Bill Wendling <isanbard@gmail.com>
---
 sound/core/control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index a25c0d64d104..a1778137147d 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -2059,7 +2059,7 @@ int snd_ctl_request_layer(const char *module_name)
 	up_read(&snd_ctl_layer_rwsem);
 	if (lops)
 		return 0;
-	return request_module(module_name);
+	return request_module("%s", module_name);
 }
 EXPORT_SYMBOL_GPL(snd_ctl_request_layer);
 
-- 
2.36.1.255.ge46751e96f-goog

