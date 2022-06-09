Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA64545C72
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 08:42:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD4711E84;
	Fri, 10 Jun 2022 08:41:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD4711E84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654843353;
	bh=YmnQmx0dlzflXivlNhp/Ycmw6waFmKpktyHcN3MNZb0=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NRshJ7Uzj5exTYq95CQbw5E0sYhQx4lK7x3Fc97ZWftAXAJ/ywaj459xeNfEIyZk/
	 mOv/FMxcg69FCB75kQLXYeR3vE0kKt7udS1XpRCI5KdutRO1GBTyv8wE/XiO24M+S2
	 HTbE/an2Y+c780nlpBwvtSxspbBfhOoywG9Nbxw8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1630F80589;
	Fri, 10 Jun 2022 08:37:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC587F801F5; Fri, 10 Jun 2022 00:21:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, SPF_HELO_NONE, SPF_NONE, T_SCC_BODY_TEXT_LINE,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1ED90F800E9
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 00:21:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ED90F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="E9tSuZ6h"
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-30974094b5cso213546767b3.20
 for <alsa-devel@alsa-project.org>; Thu, 09 Jun 2022 15:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=yboyFArx2lHvBt01l8NpldAEI3xLVVvkRY3YCO31PQs=;
 b=E9tSuZ6hKkd5R9UrAClvzMvLuSapw21MRvFh9K5m/Q4W/Ne6NP2WMWfSPzasz8wKZX
 Mng11d6Obxtbq83lWoSaFsdBiVCu3gb6X9dNoHMi3E7qOKWwZUm9cJAU6WOY5s+S4WcD
 k0KWGk2jmTkZOAqD94Ix96O/6kgOmQ/r+QpHomefwKvJ5cV0MNofmxceF2lXxoFWF6gg
 j5Cs7IkuMhKv2Pf+5++JwO5hcoMx6SP3if8FmA4NjIla9U/uK2//v1BfU0Tfe7AV8KrT
 Ey/sE8DleSJieRPHEDBL1hPn4naIWW02H/aWpnYArbukY4zZLmv4GV2t/e5g12dM+Qzj
 ZcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=yboyFArx2lHvBt01l8NpldAEI3xLVVvkRY3YCO31PQs=;
 b=pm/9H/+F7ULV1gwZ19BHi4HIhb8MXVDXjyOkkY1L+OfvlFl7m9CACOt/PHzDB2kbf1
 sgT67ehF8jAortSv1ZxF96LVQxqekqjcKirpe+tBSaYPhVrTSD0MJYONhNlsek2pmHu/
 dsKAMP8k9Jx/nd5A4XfEeV4iN0L7awCAjWlSjFpmde+EKg+29XZVRJS0Qf8Nua/yf2TS
 u9x9n+VdoiJkv1jZd/VqooBshnOK0anJGmX7aD7IjZWp5E15Xd29niDurBc1vBhaiQt1
 xnRmi+dYUqSmeqcZVk60wLTwVw0BwKvI4G6WAyDmgAP2clWT+oc7cOB44xvHx4f7p3C6
 PkPQ==
X-Gm-Message-State: AOAM532WR/U+9Ye/UWQm9kfycH/UGUBcy84yCDmiiQlniLxoIOOPktuL
 WWg/RTOK7P5SqyTixR65F+95V7DH
X-Google-Smtp-Source: ABdhPJzx/fiV7355Fpicwsezz0b2tB8XbCEkcbb8KPwyuPviI/0AOw7BwG+AXnNZJgmFqRPAiS2WX3p4fQ==
X-Received: from fawn.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5795])
 (user=morbo job=sendgmr) by 2002:a81:c248:0:b0:313:3c2c:89cd with
 SMTP id
 t8-20020a81c248000000b003133c2c89cdmr17003210ywg.175.1654813309307; Thu, 09
 Jun 2022 15:21:49 -0700 (PDT)
Date: Thu,  9 Jun 2022 22:16:31 +0000
In-Reply-To: <20220609221702.347522-1-morbo@google.com>
Message-Id: <20220609221702.347522-13-morbo@google.com>
Mime-Version: 1.0
References: <20220609221702.347522-1-morbo@google.com>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH 12/12] netfilter: conntrack: use correct format characters
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

net/netfilter/nf_conntrack_helper.c:168:18: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
                request_module(mod_name);
                               ^~~~~~~~

Use a string literal for the format string.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Bill Wendling <isanbard@gmail.com>
---
 net/netfilter/nf_conntrack_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netfilter/nf_conntrack_helper.c b/net/netfilter/nf_conntrack_helper.c
index c12a87ebc3ee..1e0424d37abc 100644
--- a/net/netfilter/nf_conntrack_helper.c
+++ b/net/netfilter/nf_conntrack_helper.c
@@ -165,7 +165,7 @@ nf_nat_helper_try_module_get(const char *name, u16 l3num, u8 protonum)
 	if (!nat) {
 		snprintf(mod_name, sizeof(mod_name), "%s", h->nat_mod_name);
 		rcu_read_unlock();
-		request_module(mod_name);
+		request_module("%s", mod_name);
 
 		rcu_read_lock();
 		nat = nf_conntrack_nat_helper_find(mod_name);
-- 
2.36.1.255.ge46751e96f-goog

