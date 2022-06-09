Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 742B8545C65
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 08:39:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 170C61F4F;
	Fri, 10 Jun 2022 08:38:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 170C61F4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654843179;
	bh=E2xsu3xBe57plVvxtEQOAT37pQoIXchR0Y5CWeytKzQ=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MZydDf8oEwvlTvDLK8v7Y29NXEQA/goQs36cKxUCXB1C5px2ZU1Z85ONm6+bM4/WD
	 pe/XPz8k0zis8hivW57oHGo+p8sW8aCed18BeigST63+lg1Ieon+vS1Rds64kySw3l
	 rZxwpjIi1G1pQm6tVr0h12dQy1rK0iq9f3UgD8p8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D85EF8052F;
	Fri, 10 Jun 2022 08:37:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FECCF801F5; Fri, 10 Jun 2022 00:17:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, SPF_HELO_NONE, SPF_NONE, T_SCC_BODY_TEXT_LINE,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E47DEF800E9
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 00:17:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E47DEF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="RBpkYSjE"
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-30cb80ee75cso213625727b3.15
 for <alsa-devel@alsa-project.org>; Thu, 09 Jun 2022 15:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=3yOhmb5LLQ31qT6YeyEoaX0jjcoMdHElvVNlhTaaJU0=;
 b=RBpkYSjEyD64s1FKNQbtXE7AfdgJKfYmd5PMKe66FHnMYYo7vB0Ncyw1KRR50CoJoo
 aoycDWjxbUREKPl/jCi5J+ZmN745Yr3i1ib/+VcJJf8M0JMLiwl79xnz8rJSR7GD/eD1
 lW/QxkZdjk6n9mbnb49kc1QuGbm9WiR5bRhdOxYxvavs/N1vvPSKHy30utzBB/gyWoTU
 CgiL6ug+u8f1QpKo/0EMJTNBBIk/eilNKeOEcwDZBOTEwWg6fyCqMv4cdogePUE+xetI
 whOzeQ9ub81nWd36wnDnSka41WjIxLP4QO+2B8XH0LL13vJc0ad+W0zJV+BD/RIy1FOR
 5kSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=3yOhmb5LLQ31qT6YeyEoaX0jjcoMdHElvVNlhTaaJU0=;
 b=eE5Hz8vJCXU9Wlzgl3Cdvv5r0Apl887fO+Gd7GErgQNgV1IFLYREymmpFR2wlXVzu4
 +ZMiFxQjWiKFegoprybrLfecrirDfEsMHsHMYLLUE+TYuSH2rKkZZ5aGo0Hq+yvloHAL
 6MKj9j5VYoz8UHa/hF+uWiekS4RWHK+ygLZ28k7oa/MBhkIz0XEVhG9EYF7gWMe9Aalj
 TLOfOL+QnKpkA69eK+W2trjatnHV/NoPUpDxBE4ql5lodkmNa0zYD6WMBVSJAGNyoWoo
 fxmnVQsQZ8j9S25d1IpAXm5atDITb3lHaba7V0UnaW9uEFKwaUkqwOZ0h7v9PvzXdJ8J
 Tclw==
X-Gm-Message-State: AOAM5304kIeTrOXqt2NFOF9l2lN6Y/8v+9lDGepLRzBkE1RM5cR9s+I4
 BOyYPhxTGqB5rOf/e+hsXiaalR1R
X-Google-Smtp-Source: ABdhPJzTMnxRPuV6ZGJzvW5l0mMjxHOaj61kW/6XxvKjUl64lqYEHjJSEX/Dfo2Nrwl6bkVAjyNEv78Ldw==
X-Received: from fawn.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5795])
 (user=morbo job=sendgmr) by 2002:a25:fe0d:0:b0:64d:915f:e73e with
 SMTP id
 k13-20020a25fe0d000000b0064d915fe73emr42473933ybe.447.1654813059372; Thu, 09
 Jun 2022 15:17:39 -0700 (PDT)
Date: Thu,  9 Jun 2022 22:16:20 +0000
In-Reply-To: <20220609221702.347522-1-morbo@google.com>
Message-Id: <20220609221702.347522-2-morbo@google.com>
Mime-Version: 1.0
References: <20220609221702.347522-1-morbo@google.com>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH 01/12] x86/mce: use correct format characters
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

arch/x86/kernel/cpu/mce/core.c:295:9: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
                panic(msg);
                      ^~~

Use a string literal for the format string.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Bill Wendling <isanbard@gmail.com>
---
 arch/x86/kernel/cpu/mce/core.c | 2 +-
 scripts/Makefile.extrawarn     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 2c8ec5c71712..3d411b7c85ad 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -292,7 +292,7 @@ static noinstr void mce_panic(const char *msg, struct mce *final, char *exp)
 	if (!fake_panic) {
 		if (panic_timeout == 0)
 			panic_timeout = mca_cfg.panic_timeout;
-		panic(msg);
+		panic("%s", msg);
 	} else
 		pr_emerg(HW_ERR "Fake kernel panic: %s\n", msg);
 
-- 
2.36.1.255.ge46751e96f-goog

