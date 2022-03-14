Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3709D4D8D64
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 20:52:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB07B174A;
	Mon, 14 Mar 2022 20:51:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB07B174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647287526;
	bh=pyw+uUsWl3RVdP8v6qowJOWyQJdm2VaPP/Bj2TK1ByM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vkp9B7zMwn/Oa47ywSFwhepev9k33LRIxP1ilslj+twxtiylzRy0+sBqi/un8LkuH
	 Si6JTpV7OYdTw1n6PWMWJNipVeRKPm5qdDXhRtkoXx4v/iAj7onLHQ/8HwR2G33pXj
	 OSPHNGRSFFLkBaEVX9bJYAZYTuiTaFpz27InWHB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97F78F80095;
	Mon, 14 Mar 2022 20:50:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17854F804E4; Mon, 14 Mar 2022 20:50:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E60D0F8012C
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 20:50:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E60D0F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V35xPzC0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5105C6116D;
 Mon, 14 Mar 2022 19:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF52C340EE;
 Mon, 14 Mar 2022 19:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647287421;
 bh=pyw+uUsWl3RVdP8v6qowJOWyQJdm2VaPP/Bj2TK1ByM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V35xPzC0SANL4OOpntptnxwfH3nLIYI5VEaA9BrwfwAu8bvPOHyAqVUw21vYwVrAk
 BE5/t7c15HReRasVusQQv81fElEBG3vFWSvir6e8NJI0FHrAmInGhKkxkr64Ge2tSt
 3Y5mzD6EWbBR2HGUd2PvFkmH64XSZ6Ije2djTBcdzpvhRp/Y+bGCgBRz4Q0WVx9TqW
 O4H6xttVahB95D7TRtPhoEdwKcjVctFHjWNYaQazpf9nZQlppkShxTpdFuo2PA2xNb
 FmQWRJtWbFVp4Pz8M8/ZiWhPityGzRb61SWCJO6KTXLpHDReAXGSpmLEadGt/jWb01
 VkyTxadUGALpQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	x86@kernel.org
Subject: [PATCH 2/2] x86/Kconfig: Do not allow CONFIG_X86_X32_ABI=y with
 llvm-objcopy
Date: Mon, 14 Mar 2022 12:48:42 -0700
Message-Id: <20220314194842.3452-3-nathan@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314194842.3452-1-nathan@kernel.org>
References: <20220314194842.3452-1-nathan@kernel.org>
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

There are two outstanding issues with CONFIG_X86_X32_ABI and
llvm-objcopy, with similar root causes:

1. llvm-objcopy does not properly convert .note.gnu.property when going
   from x86_64 to x86_x32, resulting in a corrupted section when
   linking:

   https://github.com/ClangBuiltLinux/linux/issues/1141

2. llvm-objcopy produces corrupted compressed debug sections when going
   from x86_64 to x86_x32, also resulting in an error when linking:

   https://github.com/ClangBuiltLinux/linux/issues/514

After commit 41c5ef31ad71 ("x86/ibt: Base IBT bits"), the
.note.gnu.property section is always generated when
CONFIG_X86_KERNEL_IBT is enabled, which causes the first issue to become
visible with an allmodconfig build:

  ld.lld: error: arch/x86/entry/vdso/vclock_gettime-x32.o:(.note.gnu.property+0x1c): program property is too short

To avoid this error, do not allow CONFIG_X86_X32_ABI to be selected when
using llvm-objcopy. If the two issues ever get fixed in llvm-objcopy,
this can be turned into a feature check.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/x86/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index b903bfcd713c..0f0672d2c816 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2864,6 +2864,11 @@ config IA32_AOUT
 config X86_X32_ABI
 	bool "x32 ABI for 64-bit mode"
 	depends on X86_64
+	# llvm-objcopy does not convert x86_64 .note.gnu.property or
+	# compressed debug sections to x86_x32 properly:
+	# https://github.com/ClangBuiltLinux/linux/issues/514
+	# https://github.com/ClangBuiltLinux/linux/issues/1141
+	depends on $(success,$(OBJCOPY) --version | head -n1 | grep -qv llvm)
 	help
 	  Include code to run binaries for the x32 native 32-bit ABI
 	  for 64-bit processors.  An x32 process gets access to the
-- 
2.35.1

