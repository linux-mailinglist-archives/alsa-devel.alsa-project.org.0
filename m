Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7A263AFC2
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 18:45:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 666DF1741;
	Mon, 28 Nov 2022 18:44:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 666DF1741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669657516;
	bh=erx4mekDg9iblF1wO5yq7GtbKAKHxTvYsT67M7AkDa8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hcfvwyGbMMkF2IFyQToLbN1Ghdi8nmdD5Tg0uWWzOfEYkOVw9G3Yp22g2St4P9tQl
	 TKHWpWOZXfEotmEp1VFa2Q2S9fLm3Am+r9/LI4T5JU5BVnXNUx4wAt9k6OYMA68X/m
	 nt9H/ck+j8TC1XYyVEV4F2AXvgOyVYoVW6JxLl60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 800FCF8057C;
	Mon, 28 Nov 2022 18:43:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C9D3F8057D; Mon, 28 Nov 2022 18:43:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3B5EF80579
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 18:43:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3B5EF80579
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cC+rb2w3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4FEBDB80E9D;
 Mon, 28 Nov 2022 17:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC30C433D6;
 Mon, 28 Nov 2022 17:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669657413;
 bh=erx4mekDg9iblF1wO5yq7GtbKAKHxTvYsT67M7AkDa8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cC+rb2w3koIgfZfu/VmpBcn++db5XWc6D6PSv6aJRnq6N3ZHlgEB5WaYJOOKOj8BT
 8ONrwW0sGCcCsShOkg7GR7uyQ8owHqkUt4RFI1TXQIdsCg/6REA6BbMH/mDOrMOgEB
 174CDxVpKEBVT1vgtKQk27dx/ZHswN9Nx5X1MFd3osgSW+YAWsxXuYvAYeURLML45u
 0y4h4vAcJ2AuBXtdWy/eMSbMWUOyUMvyqY1yX3dsQIB8eKR9kAps36YqVhs/3gj23C
 BUdinbmouuAi/d/lmqefItzAt57ozpbV9Sf7q1KZvTqmjJdu8LI3SpZq4ECOle6pU0
 MxcikUMGIWZYA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 4/5] ALSA: seq: Fix function prototype mismatch in
 snd_seq_expand_var_event
Date: Mon, 28 Nov 2022 12:43:22 -0500
Message-Id: <20221128174324.1443132-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221128174324.1443132-1-sashal@kernel.org>
References: <20221128174324.1443132-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Kees Cook <keescook@chromium.org>, Takashi Iwai <tiwai@suse.de>,
 llvm@lists.linux.dev, ndesaulniers@google.com,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 nathan@kernel.org, kernel test robot <lkp@intel.com>
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

From: Kees Cook <keescook@chromium.org>

[ Upstream commit 05530ef7cf7c7d700f6753f058999b1b5099a026 ]

With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
indirect call targets are validated against the expected function
pointer prototype to make sure the call target is valid to help mitigate
ROP attacks. If they are not identical, there is a failure at run time,
which manifests as either a kernel panic or thread getting killed.

seq_copy_in_user() and seq_copy_in_kernel() did not have prototypes
matching snd_seq_dump_func_t. Adjust this and remove the casts. There
are not resulting binary output differences.

This was found as a result of Clang's new -Wcast-function-type-strict
flag, which is more sensitive than the simpler -Wcast-function-type,
which only checks for type width mismatches.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/lkml/202211041527.HD8TLSE1-lkp@intel.com
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Kees Cook <keescook@chromium.org>
Link: https://lore.kernel.org/r/20221118232346.never.380-kees@kernel.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/core/seq/seq_memory.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/core/seq/seq_memory.c b/sound/core/seq/seq_memory.c
index 4c8cbcd89887..42f4aa841051 100644
--- a/sound/core/seq/seq_memory.c
+++ b/sound/core/seq/seq_memory.c
@@ -126,15 +126,19 @@ EXPORT_SYMBOL(snd_seq_dump_var_event);
  * expand the variable length event to linear buffer space.
  */
 
-static int seq_copy_in_kernel(char **bufptr, const void *src, int size)
+static int seq_copy_in_kernel(void *ptr, void *src, int size)
 {
+	char **bufptr = ptr;
+
 	memcpy(*bufptr, src, size);
 	*bufptr += size;
 	return 0;
 }
 
-static int seq_copy_in_user(char __user **bufptr, const void *src, int size)
+static int seq_copy_in_user(void *ptr, void *src, int size)
 {
+	char __user **bufptr = ptr;
+
 	if (copy_to_user(*bufptr, src, size))
 		return -EFAULT;
 	*bufptr += size;
@@ -163,8 +167,7 @@ int snd_seq_expand_var_event(const struct snd_seq_event *event, int count, char
 		return newlen;
 	}
 	err = snd_seq_dump_var_event(event,
-				     in_kernel ? (snd_seq_dump_func_t)seq_copy_in_kernel :
-				     (snd_seq_dump_func_t)seq_copy_in_user,
+				     in_kernel ? seq_copy_in_kernel : seq_copy_in_user,
 				     &buf);
 	return err < 0 ? err : newlen;
 }
-- 
2.35.1

