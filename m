Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9BB545C6F
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 08:41:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 202CB1F8B;
	Fri, 10 Jun 2022 08:40:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 202CB1F8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654843306;
	bh=hCMtL+HgTQHC6tfTZNCcHAj64WiLtRw7+ba0x7aSBmU=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mvyx27ON5vir96K5si8C5g3O5W3F2nPhuOeYgICbO/mF3TAfjRW+PLkBHabjs2l0C
	 zKHGQVj7Z0KwoDcjRwATnM3G9hdfWys2R+3Wd4HfMtRcamrNYsSWZUr+Cor5gHBWLc
	 ffG6UqbIJfdOEpV11U7MGxwtlu3La65TJKnEZ0FU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C85E8F80568;
	Fri, 10 Jun 2022 08:37:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42826F801F5; Fri, 10 Jun 2022 00:20:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, SPF_HELO_NONE, SPF_NONE, T_SCC_BODY_TEXT_LINE,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1F7FF800E9
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 00:20:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1F7FF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="oZfJo/SX"
Received: by mail-pf1-x44a.google.com with SMTP id
 p123-20020a625b81000000b0051c31cc75dfso5136609pfb.5
 for <alsa-devel@alsa-project.org>; Thu, 09 Jun 2022 15:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=25alQ5NbvDA/tAT/crdGxszOxkEet+uV+RiKp6teCtQ=;
 b=oZfJo/SXd3Qwc4Nv44GXKhWDAFTO95PgXKfM9e9BiPA93gnZilAa51s/ZcMgeZyQDX
 bdQWpsU2Iq0YRK8nhoojrl6Ovztg/h1fX8YAfPzB2dwLHljaWKbdC8Mk4yXY/4KToKYJ
 ovK2hyHWLN7o69TaNinVFAZmPIf4qo8PHxZBtzNCHZvyhMz5aDyGPm8IzfmTRY3xhkY5
 HV52VK6dmyAZeje85nLNYwU1K6dOCF/suK14Mfn4D1Y16vY/jjL7/9lAyFEiDPQ1QSGP
 J6zMvdrdFc5DFPuif5nPyA2QWjOTwZ7NUnTVPFwq/IivldY6hoaIhzn4fUtrg8kNe7N/
 zK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=25alQ5NbvDA/tAT/crdGxszOxkEet+uV+RiKp6teCtQ=;
 b=67+rs6jMRdLCtGVZNYb9ZRxj/BwZjmpKTyzv3P6DYif+GHK9xc/f9t3zN7ECQIbPtB
 LGK+wX38FZGwJTQb5x3V/eneCflL4GwoZStPTZVkFEQnEjfmdGYzI+X60rOiCP7opirZ
 qrF3XBvUzvCHeSnN06ioSABOSZNjiSqHAn+s5x6YjNcy89ExkFotHLsUHocEoDXJOHZv
 oRJ3resDhGWXb3vHiy/Njq62BNfJdrnW8aJEk5o5sEq1smTfsQ+SA873gGV6+++4uCwA
 ZTDkiWVZ8dR0Z+nKrpQWD/fTsfS1CmbwHMRt/TFPhR/4TmXYCk3Rh+AT9a9b50gKSuUV
 Kv7Q==
X-Gm-Message-State: AOAM5339EZEgSnl0ZDF1ZA4Dvan89EVpmlSvLA+Or12tOJCkJ7ERcBGY
 LPY9ZnVpCD1VvI3cpH0uzCDhAgVK
X-Google-Smtp-Source: ABdhPJw9W1H1jWw/58e5xPpEUFA37qKciU2RFZ0YGfr9UAt18WH9PywE6TBxCqfkRuUXpq4m2jNc2xi7ug==
X-Received: from fawn.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5795])
 (user=morbo job=sendgmr) by 2002:a17:902:cf06:b0:161:53b6:474d
 with SMTP id
 i6-20020a170902cf0600b0016153b6474dmr41957402plg.63.1654813240658; Thu, 09
 Jun 2022 15:20:40 -0700 (PDT)
Date: Thu,  9 Jun 2022 22:16:28 +0000
In-Reply-To: <20220609221702.347522-1-morbo@google.com>
Message-Id: <20220609221702.347522-10-morbo@google.com>
Mime-Version: 1.0
References: <20220609221702.347522-1-morbo@google.com>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH 09/12] ALSA: seq: use correct format characters
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

sound/core/seq/seq_clientmgr.c:2414:22: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
        snd_iprintf(buffer, msg);
                            ^~~

Use a string literal for the format string.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Bill Wendling <isanbard@gmail.com>
---
 sound/core/seq/seq_clientmgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 2e9d695d336c..2340f3e14eeb 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -2411,7 +2411,7 @@ static void snd_seq_info_dump_subscribers(struct snd_info_buffer *buffer,
 		up_read(&group->list_mutex);
 		return;
 	}
-	snd_iprintf(buffer, msg);
+	snd_iprintf(buffer, "%s", msg);
 	list_for_each(p, &group->list_head) {
 		if (is_src)
 			s = list_entry(p, struct snd_seq_subscribers, src_list);
-- 
2.36.1.255.ge46751e96f-goog

