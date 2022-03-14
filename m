Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B9D4D8D5D
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 20:51:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91CE21740;
	Mon, 14 Mar 2022 20:50:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91CE21740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647287492;
	bh=kMPXQdSDTqPZw7TxTqFO8+ozgcvhKk61vNuNGq6NqZ4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bdvIQJnT7kzi6CQ4cni0kfTXozs8Z94B8c+k9j1k99XEXeCZWWyTor/7iyyLBFMVd
	 uC1LkFgOq4/tZwVDq00jdI5CeGiwEugWKjQsgeo1oCgWPttMqYBEb0PIb/hwpkgDpK
	 tmQScmZxZpvL8UztosDfCjNKZADYiQ6lP16wp20U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F28EBF80139;
	Mon, 14 Mar 2022 20:50:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC22BF80139; Mon, 14 Mar 2022 20:50:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 384E0F80095
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 20:50:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 384E0F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aBYW5qr3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E279B611DC;
 Mon, 14 Mar 2022 19:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0768CC340E9;
 Mon, 14 Mar 2022 19:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647287417;
 bh=kMPXQdSDTqPZw7TxTqFO8+ozgcvhKk61vNuNGq6NqZ4=;
 h=From:To:Cc:Subject:Date:From;
 b=aBYW5qr3K6D3J3laM6P3okKIixNitcz6eBEnEBls1QbCSU3MFvseZZdwZWbWqzmPZ
 T1xfXLDSYrcnDo3BO1UPC9Apfgj6XXgSHSdI+/fEImHikC2tXcSd6mK2gPVFvHZjSE
 ejnPBgt4ksCpDHJuo2kfZTRRuUltdiLxmObD5soPqUtzC5wglgwm9SqpwzlwWtB80K
 UKokgPWfw8A0jf/rK0SQMW9LTSQ7Qr34QOqFuPbN4MFfRAcMAARgCgSUuctH384LSm
 z/FTZFxvo1dXxy9MW9Q+Kn1E/rBwfk9A5DQ8XDyPQVJJyyAa6voZsrCOY4AIxI7eE4
 p/ZVemtnuIHvg==
From: Nathan Chancellor <nathan@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	x86@kernel.org
Subject: [PATCH 0/2] x86: Avoid CONFIG_X86_X32_ABI=y with llvm-objcopy
Date: Mon, 14 Mar 2022 12:48:40 -0700
Message-Id: <20220314194842.3452-1-nathan@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Nathan Chancellor <nathan@kernel.org>, alsa-devel@alsa-project.org,
 Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-fsdevel@vger.kernel.org
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

This series disables CONFIG_X86_X32_ABI=y with llvm-objcopy, which has
had two outstanding issues, which are further outlined in the second
patch:

https://github.com/ClangBuiltLinux/linux/issues/514
https://github.com/ClangBuiltLinux/linux/issues/1141

The first patch is from Masahiro, which moves the CONFIG_X86_X32_ABI
back into Kconfig proper. It was initially pushed as an RFC:

https://lore.kernel.org/r/20210227183910.221873-1-masahiroy@kernel.org/

The conclusion of that thread was that the check was still needed
because of the two issues above. However, with the introduction of
IBT, specifically commit 41c5ef31ad71 ("x86/ibt: Base IBT bits"), the
second issue linked above becomes visible with allmodconfig, which
heavily impacts automated testing.

The second patch builds on the first by just universally disabling
CONFIG_X86_X32_ABI when using llvm-objcopy at configuration time so that
neither issue is visible.

While it is unlikely that these issues will be fixed in LLVM, this could
eventually become a version check.

This is based on -tip x86/core and I would like for both patches to go
with the IBT changes so that there is no build breakage.

Masahiro Yamada (1):
  x86: Remove toolchain check for X32 ABI capability

Nathan Chancellor (1):
  x86/Kconfig: Do not allow CONFIG_X86_X32_ABI=y with llvm-objcopy

 arch/x86/Kconfig                       | 13 +++++++------
 arch/x86/Makefile                      | 16 ----------------
 arch/x86/entry/syscalls/Makefile       |  2 +-
 arch/x86/include/asm/syscall_wrapper.h |  6 +++---
 arch/x86/include/asm/vdso.h            |  2 +-
 arch/x86/kernel/process_64.c           |  2 +-
 fs/fuse/ioctl.c                        |  2 +-
 fs/xfs/xfs_ioctl32.c                   |  2 +-
 sound/core/control_compat.c            | 16 ++++++++--------
 sound/core/pcm_compat.c                | 20 ++++++++++----------
 10 files changed, 33 insertions(+), 48 deletions(-)


base-commit: f8afc9d88e65d189653f363eacc1f3131216ef7c
-- 
2.35.1

