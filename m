Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA36545C6B
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 08:40:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DF861FCA;
	Fri, 10 Jun 2022 08:39:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DF861FCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654843244;
	bh=Mnt36jkfXgDUdv2ot/N5rCM03Tzx1r9gqDGK1noT5r8=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j/Ra2RJAEo8kYBMjqmBPxvY+6om22lvWoj+ybY9NeNlKrYQijwz0Y0kDux9e6p3sf
	 0mDTaRb1gdPrzfhLdF0DlSZQADZR9q7/mtYkNVtwjAw3IGI+UdFQR9n4aO/wnU+5ZP
	 y9rN06JKqOBhQLTb8PmXYKnpTGBFKIAqZj1ZoTFM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E440CF80548;
	Fri, 10 Jun 2022 08:37:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CEDCF800C7; Fri, 10 Jun 2022 00:19:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, SPF_HELO_NONE, SPF_NONE, T_SCC_BODY_TEXT_LINE,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA949F800C7
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 00:19:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA949F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="ezNDouTk"
Received: by mail-pf1-x449.google.com with SMTP id
 i19-20020aa79093000000b0050d44b83506so12975292pfa.22
 for <alsa-devel@alsa-project.org>; Thu, 09 Jun 2022 15:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=fWdTUxWRVXkKLWYheGOI11e0mL2XAHFKbZxg8ksMoZM=;
 b=ezNDouTkewW/awvW/cRvKC6jHhcMBl4eQkJi6sdP+X2J6iJMkd00jA2jaRJhpFY7aw
 yxivdcEq++4iV1GgB2ziv1ayV3oP8FWg/GB0Zo4bN9LSRrIbKMWW4pYYedFNqaZbtBdq
 LI7orAiKEXNDUMTMRTz+eYmtPr0ihFSVRZhCMEgns7LQjXXffU9ysRs8Jm7/xp/mkHV8
 hqJ/WTn4IigfYhYdyyonY3s//N3eKAKkW8RZYgrVC9YsY682gIJn1c0bZa76vTplgKaA
 3OGnJiqbOGhiGk4PrcLnGinCbRAB3xGsfKwPwyZscTB2mgetoP8/LmB/5HB6hMrHCgU0
 s7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=fWdTUxWRVXkKLWYheGOI11e0mL2XAHFKbZxg8ksMoZM=;
 b=KppA96a90bOhceE6SKEIpfcJ4sVEHiwgIHYKkq27VX3Qo09R3yGUqYxsKrgQA1e3GR
 f+j0HlXd9trsCkvTyJSYK3Fe7OrwcirOTbVzp9amqFfbSuz6myvxHxxMJIUWNbdrzTgI
 oFJAbfLmIVjMLgSw4s8SzUL0SHECBhAkw7yJUXuob62drhW3kDmZ/vNAowdAkgqgz/PM
 VzxXHg8TMXbCEP54jk7B0HeUVAA2OsQRm91MCFEXOqHfXHXBW7G0nrzE/WMWzr91zCiT
 JKn0nU5+Mp5ACapKXgWaT7dgzeju4zPPhnTqr0vH+BG52/J6JV4JyDWpZqnD8TmBlOW7
 vYMQ==
X-Gm-Message-State: AOAM530r57Qknd0vj3eqRIXAmxzEoWTEoVwqYuRMevmmhkhlyM/8bI9H
 vdfSsGHE1hyc01EbWon+zoK0coRd
X-Google-Smtp-Source: ABdhPJymRh8XdI6qUr+0U3jn9BPA1WS3MroiwqAq54XxkobNI9HSYvmGC6qhWN+ZtdS8zin/gyNAdfGHUw==
X-Received: from fawn.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5795])
 (user=morbo job=sendgmr) by 2002:a63:c5:0:b0:3fe:26a0:7abe with
 SMTP id
 188-20020a6300c5000000b003fe26a07abemr10973746pga.152.1654813150612; Thu, 09
 Jun 2022 15:19:10 -0700 (PDT)
Date: Thu,  9 Jun 2022 22:16:24 +0000
In-Reply-To: <20220609221702.347522-1-morbo@google.com>
Message-Id: <20220609221702.347522-6-morbo@google.com>
Mime-Version: 1.0
References: <20220609221702.347522-1-morbo@google.com>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH 05/12] fs: quota: use correct format characters
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

fs/quota/dquot.c:206:22: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
                    request_module(module_names[qm].qm_mod_name))
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use a string literal for the format string.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Bill Wendling <isanbard@gmail.com>
---
 fs/quota/dquot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/quota/dquot.c b/fs/quota/dquot.c
index a74aef99bd3d..3b613de3b371 100644
--- a/fs/quota/dquot.c
+++ b/fs/quota/dquot.c
@@ -203,7 +203,7 @@ static struct quota_format_type *find_quota_format(int id)
 			     module_names[qm].qm_fmt_id != id; qm++)
 			;
 		if (!module_names[qm].qm_fmt_id ||
-		    request_module(module_names[qm].qm_mod_name))
+		    request_module("%s", module_names[qm].qm_mod_name))
 			return NULL;
 
 		spin_lock(&dq_list_lock);
-- 
2.36.1.255.ge46751e96f-goog

