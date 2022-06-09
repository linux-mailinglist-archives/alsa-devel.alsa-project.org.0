Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B53545C66
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 08:39:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 650421F88;
	Fri, 10 Jun 2022 08:39:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 650421F88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654843195;
	bh=E5G0b5JqpczNa+irtJpC08PrAcij0AQ80cinkYVRmwU=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E1/7TJfKKyTQi/1R0ei5vCEWAoJwmM7PihoJB+wy35xpEZT3y1CIblhyTLm3XUd4P
	 RPSxkBzFWvd1B4E7FiAtGG5ql7ajiUsOlwU9hD0mGIgPI1rGIaQQk1f+MlLz9Osnpj
	 spE5HUmMtGDerJEPX7mwgKhDXN1RFUxBWOredu6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E244F80536;
	Fri, 10 Jun 2022 08:37:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C8F1F801F5; Fri, 10 Jun 2022 00:18:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, SPF_HELO_NONE, SPF_NONE, T_SCC_BODY_TEXT_LINE,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F7CCF800C7
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 00:18:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F7CCF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Kr2RYZFW"
Received: by mail-pl1-x64a.google.com with SMTP id
 s10-20020a170902a50a00b00162359521c9so13421493plq.23
 for <alsa-devel@alsa-project.org>; Thu, 09 Jun 2022 15:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=SFFjvyZvefpU9NrWWzQ0TAmvQ8SzfCLTau1AjR7El54=;
 b=Kr2RYZFWYOeNjzG0DXVZ1PIX9XZMzBF03Z569egSujYX+SETM8BM22isVSs7ZYg0je
 vtmIi51QjRTMj1fwLrkgjqNVlwKBP1pP5HLG5JFnMd4QeQYx2K01nU1Ejrc/H0elX0dB
 xVMAEAznym96CzfG/aOkwGNw3H9g+blFPI7HqqKYy6VdsppoXnWpV0WmljI7FHufbK83
 ON+xFi3394AkXlTQEdIEaihpVBJQ8PGsd812EFScZ5x0FGwt1QmokUw/eccZEX97Itvg
 V6YGaLMc68zBNDG7tvYESM8uNaTijhm4Fewwwm5H2YtyjsN07CoVm9f4qHoqAerZAXZJ
 XTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=SFFjvyZvefpU9NrWWzQ0TAmvQ8SzfCLTau1AjR7El54=;
 b=F95OlfraaV/0IwaMETaRm9vjdGRFDrhr3YbGAmh+tHKrugG5BuOftnK5La9q8jCGn6
 3SBUyyCXoehA73za/eBuB6n4XcIz5q6DBK8up0447REe0N0xJFRmCkdTJZqFrxu0c57V
 kL3hfKsaNDZZhQPIvOx3Em4tYiXMZW0SrXF/30uMrIX/rKbZ+vv1cDJFbnn5pie3Rl0H
 JfP9lMrFevQdX7oo9fxIJsX/IiKNIa9MYJWWKiiAS2CcKJB4E/bLLx94xzF9otMCJUf0
 /YzFkrHzxBg4Ybc1MKbgzO9goMh8R3g7d3xw2z4xb+XQwaNZOIqQFQWLPy3qG6ckb8KL
 MdXg==
X-Gm-Message-State: AOAM532wPGVu3dLgYQ/8Bg9HjfeKblF8i1x3CWl5+S9dKUnNrD1UlSIt
 wlGQohAYkQhpVX3bWVeBSztjtoQ1
X-Google-Smtp-Source: ABdhPJweUcyR1bJf/XiwDrAaJ+hZ/VGm1qzwS+oRhWzjXi1BAcLnFDZIdAsYxk3A8uUCFP+evw6wWgyl2Q==
X-Received: from fawn.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5795])
 (user=morbo job=sendgmr) by 2002:a63:35ce:0:b0:3fd:fb5a:a1c3 with
 SMTP id
 c197-20020a6335ce000000b003fdfb5aa1c3mr15000208pga.85.1654813082090; Thu, 09
 Jun 2022 15:18:02 -0700 (PDT)
Date: Thu,  9 Jun 2022 22:16:21 +0000
In-Reply-To: <20220609221702.347522-1-morbo@google.com>
Message-Id: <20220609221702.347522-3-morbo@google.com>
Mime-Version: 1.0
References: <20220609221702.347522-1-morbo@google.com>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH 02/12] x86/CPU/AMD: use correct format characters
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

arch/x86/kernel/cpu/mce/amd.c:1119:67: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
        err = kobject_init_and_add(&b->kobj, &threshold_ktype, tb->kobj, get_name(cpu, bank, b));
                                                                         ^~~~~~~~~~~~~~~~~~~~~~
arch/x86/kernel/cpu/mce/amd.c:1151:47: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
        err = kobject_add(&b->blocks->kobj, b->kobj, b->blocks->kobj.name);
                                                     ^~~~~~~~~~~~~~~~~~~~
arch/x86/kernel/cpu/mce/amd.c:1157:42: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
                err = kobject_add(&pos->kobj, b->kobj, pos->kobj.name);
                                                       ^~~~~~~~~~~~~~
arch/x86/kernel/cpu/mce/amd.c:1187:43: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
                        err = kobject_add(b->kobj, &dev->kobj, name);
                                                               ^~~~
                                                               "%s",

Use a string literal for the format string.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Bill Wendling <isanbard@gmail.com>
---
 arch/x86/kernel/cpu/mce/amd.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/amd.c b/arch/x86/kernel/cpu/mce/amd.c
index 1c87501e0fa3..d19bf0eb0abe 100644
--- a/arch/x86/kernel/cpu/mce/amd.c
+++ b/arch/x86/kernel/cpu/mce/amd.c
@@ -1116,7 +1116,8 @@ static int allocate_threshold_blocks(unsigned int cpu, struct threshold_bank *tb
 	else
 		tb->blocks = b;
 
-	err = kobject_init_and_add(&b->kobj, &threshold_ktype, tb->kobj, get_name(cpu, bank, b));
+	err = kobject_init_and_add(&b->kobj, &threshold_ktype, tb->kobj, "%s",
+				   get_name(cpu, bank, b));
 	if (err)
 		goto out_free;
 recurse:
@@ -1148,13 +1149,13 @@ static int __threshold_add_blocks(struct threshold_bank *b)
 	struct threshold_block *tmp = NULL;
 	int err = 0;
 
-	err = kobject_add(&b->blocks->kobj, b->kobj, b->blocks->kobj.name);
+	err = kobject_add(&b->blocks->kobj, b->kobj, "%s", b->blocks->kobj.name);
 	if (err)
 		return err;
 
 	list_for_each_entry_safe(pos, tmp, head, miscj) {
 
-		err = kobject_add(&pos->kobj, b->kobj, pos->kobj.name);
+		err = kobject_add(&pos->kobj, b->kobj, "%s", pos->kobj.name);
 		if (err) {
 			list_for_each_entry_safe_reverse(pos, tmp, head, miscj)
 				kobject_del(&pos->kobj);
@@ -1184,7 +1185,7 @@ static int threshold_create_bank(struct threshold_bank **bp, unsigned int cpu,
 		if (nb && nb->bank4) {
 			/* yes, use it */
 			b = nb->bank4;
-			err = kobject_add(b->kobj, &dev->kobj, name);
+			err = kobject_add(b->kobj, &dev->kobj, "%s", name);
 			if (err)
 				goto out;
 
-- 
2.36.1.255.ge46751e96f-goog

