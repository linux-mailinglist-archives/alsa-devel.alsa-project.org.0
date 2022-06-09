Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD02545C64
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 08:39:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FBDD1B4E;
	Fri, 10 Jun 2022 08:38:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FBDD1B4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654843163;
	bh=DV1QExRq3jdAAr+dplhfJijzMZXCsXB9YpcOt4WzuXo=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Otho7SHJXS0nj2dDbE8fAk8mouuqCqR1i7X+IjJa558ygSPuY0lmwLxTEFKnA3RSA
	 xWEY9I+K4/dNxGYsnBpeFlRNlqHgxFHuSmhjweK9Rv9OJr0lff5LadU7nKARsU9n9j
	 c4yB/1me4T+ia2Q58H6lxWPjjQDuM5jKvK3Y1JG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 888D7F80528;
	Fri, 10 Jun 2022 08:37:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F136F80240; Fri, 10 Jun 2022 00:17:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, SPF_HELO_NONE, SPF_NONE, T_SCC_BODY_TEXT_LINE,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42185F800C7
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 00:17:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42185F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="V05U+x4L"
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-30047b94aa8so213749397b3.1
 for <alsa-devel@alsa-project.org>; Thu, 09 Jun 2022 15:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=ig5mQ0gyC0oce1d/Zy8bEsqqFhtDY79w4cUoB0YUJhk=;
 b=V05U+x4LNh+To0zL8TXuNjeoTipGUWzS4C+mJRGY7QgduElSX56iUMHvUvLMhzjI09
 E+x7NCxoYFqVyFXI1TlmbTkoG0K6EXcMKlrYySH1QuvGlP37jlNn3/LNPCdiYeEd0GEX
 LIv1t4Su+H6fvGFvlkkmP2vDMIKlG+WobBu9nm/V5Y5/3H69sLKj+5cEln+2znKR6SCR
 fC2/3m/sX6SBfZ7eQ1UCfi6CIHJU4yas6UeLgZ+2cIhzSthWxwnpXo5pPTasAbA9B0Xs
 rfxKIB3w7yzCPfuUTDB83U0KP/M39tuXj5LkDncm21ZIAnPkSh3VMh/A84ECTFd7kj87
 IbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=ig5mQ0gyC0oce1d/Zy8bEsqqFhtDY79w4cUoB0YUJhk=;
 b=cOrQ/NkrOUOYvaBdFAT+ZUkZnSQakbjfUKEhBJ9GmnXN3w7FJBuek/0JGCm10wu4AL
 Uuc1sbRMzyaa9AZkGRKspYQwy68+DTaJKz358l/R95yKIuBJ4PAkumJe/Da6DE1Rw6jq
 xhVJ7+NlMxs2lHp0CujPRrhqaugDT8fNDT0aDRIfBG/GRmfKoG6H2/fxfHrXAgBDGVOV
 LGrZtfsZ+mF+uKXkaW5QXioEuigRaRqSitlOv6IGHxg0B/DUX78QUSk+2Cc4J253au/J
 vrzxzT1xXj4Zscv6V2r8GRCs51+mRO0JxF09qBa/LEelGxEjQZjAUtIOwJ5lnjoY/qCl
 PKGA==
X-Gm-Message-State: AOAM531NsRthOOMC7ioBYQ8s6S2yGJAe8RJ8008fn0o1xTKtzL4Shks9
 v9XyNKcvQhYspVd+w1Els2G4wdcM
X-Google-Smtp-Source: ABdhPJzwx5X0ZE/nM+u+DgO5va7z203Jwou06sjKdU0c0pt2CnSBxfb1v768IuoKgsISspKmOdai1Wxx4w==
X-Received: from fawn.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5795])
 (user=morbo job=sendgmr) by 2002:a25:2985:0:b0:663:ec6a:4ff2 with
 SMTP id
 p127-20020a252985000000b00663ec6a4ff2mr14049602ybp.166.1654813036265; Thu, 09
 Jun 2022 15:17:16 -0700 (PDT)
Date: Thu,  9 Jun 2022 22:16:19 +0000
Message-Id: <20220609221702.347522-1-morbo@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH 00/12] Clang -Wformat warning fixes
From: Bill Wendling <morbo@google.com>
To: isanbard@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 10 Jun 2022 08:37:37 +0200
Cc: alsa-devel@alsa-project.org, x86@kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Phillip Potter <phil@philpotter.co.uk>, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Bill Wendling <morbo@google.com>, "H. Peter Anvin" <hpa@zytor.com>,
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

This patch set fixes some clang warnings when -Wformat is enabled.

Bill Wendling (12):
  x86/mce: use correct format characters
  x86/CPU/AMD: use correct format characters
  x86/e820: use correct format characters
  blk-cgroup: use correct format characters
  fs: quota: use correct format characters
  PNP: use correct format characters
  driver/char: use correct format characters
  cdrom: use correct format characters
  ALSA: seq: use correct format characters
  ALSA: seq: use correct format characters
  ALSA: control: use correct format characters
  netfilter: conntrack: use correct format characters

 arch/x86/kernel/cpu/mce/amd.c       | 9 +++++----
 arch/x86/kernel/cpu/mce/core.c      | 2 +-
 arch/x86/kernel/e820.c              | 4 ++--
 drivers/cdrom/cdrom.c               | 2 +-
 drivers/char/mem.c                  | 2 +-
 drivers/pnp/interface.c             | 2 +-
 fs/quota/dquot.c                    | 2 +-
 mm/backing-dev.c                    | 2 +-
 net/netfilter/nf_conntrack_helper.c | 2 +-
 scripts/Makefile.extrawarn          | 4 ++--
 sound/core/control.c                | 2 +-
 sound/core/seq/seq_clientmgr.c      | 2 +-
 sound/core/sound.c                  | 2 +-
 13 files changed, 19 insertions(+), 18 deletions(-)

-- 
2.36.1.255.ge46751e96f-goog

