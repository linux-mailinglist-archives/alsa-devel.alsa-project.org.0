Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E74F263032D
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Nov 2022 00:24:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75AC41680;
	Sat, 19 Nov 2022 00:24:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75AC41680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668813899;
	bh=LT8LvayoodyeGcJJmotl0W7abaTXyRbApRilntoVIaM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ifj4gonAtJsdJxl4V/ex2bx4EqEx6Emx8fPdlilsUuPPdbGvyeSfONVWDAzKLHJV0
	 h53GHN7aGD3c1rTYy7TTlKEeR9/QwoUiAsFDCDUQ4vt21VQuxhO4SmxtmUDTCk9kOF
	 l7x6+EaXHpeZ/sivyHN8czkSyAqQBnukzOPyL79E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E87CAF800B8;
	Sat, 19 Nov 2022 00:24:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60655F801D8; Sat, 19 Nov 2022 00:24:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D24F9F800FD
 for <alsa-devel@alsa-project.org>; Sat, 19 Nov 2022 00:23:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D24F9F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="NFSHO2ZS"
Received: by mail-pl1-x632.google.com with SMTP id j12so5857724plj.5
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 15:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iXVai3qFJ8ArPGICNTEIcWXEgGfS3utWJbObwOpoeVU=;
 b=NFSHO2ZSUb7w5MpWfNQrsU6nV0aGbmYOYqFMaJCHcOg3hTAKqC5IykbTpcmUt3u6Lv
 6eDmhrGA8AAvTeKdSzoVKbV8EbdQ6Ut0tRnph4lQ+iKQaHrc3CmGHkcgGJ3FJJP1u4ma
 r16CmGxHUb+rqEorMytkj4G5ymQJbwaIyVGgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iXVai3qFJ8ArPGICNTEIcWXEgGfS3utWJbObwOpoeVU=;
 b=gBIlLBh6qmK9ZgaSZ1sxN8Cwt2UEGSVr94ai/wSgm6obZ3Z8oXvx5HbJuGkiJTnstl
 gPqNcwGkHyxCnJpAfArw0pBSwl8WdoJ+LO2zFV63Huvp3lYCplTZCmCZ4sj6C/c2LGe2
 uBQz1QeS1zoFKeXxXFrFHF10PWPQa1M+w0gbVIQZ03XqY/cjGutEFLwYfXsoevidzSrZ
 ussZJIRGqg/p40pGGl8OvBlqidte7bDoWXoPyIVONrGJEQLid4gMJFygFDHeiulxEIz+
 c8NwgShvr5QbioYwxgJabYSQM+C8UaC/wyWgtyG8DlxkH+10N5kxm45fz4OfIrmyFWHe
 AKKA==
X-Gm-Message-State: ANoB5pnh1GfA3tMpu4kqdJNPa0pU3Vif2blilvQtM+i+FUFUI/2iYPSj
 ehgt1lnaj1drt9K6+DRzy/pQR+SrHlxP0Q==
X-Google-Smtp-Source: AA0mqf462QZsPtBpPocdQx/0dVxSHHjjHXfgSRPni9vR4Gor5GuDpiFouzua+89j8xLUx81aVbqNJw==
X-Received: by 2002:a17:90a:6547:b0:213:d08f:a483 with SMTP id
 f7-20020a17090a654700b00213d08fa483mr9914547pjs.21.1668813833817; 
 Fri, 18 Nov 2022 15:23:53 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a1709027fc800b00186c37270f6sm4294533plb.24.2022.11.18.15.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 15:23:53 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] ALSA: seq: Fix function prototype mismatch in
 snd_seq_expand_var_event
Date: Fri, 18 Nov 2022 15:23:50 -0800
Message-Id: <20221118232346.never.380-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2388; h=from:subject:message-id;
 bh=LT8LvayoodyeGcJJmotl0W7abaTXyRbApRilntoVIaM=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjeBQGxl97XSZ/V131zxWG6VCVlDXD5V6MNXIDGf3M
 dU2HgY2JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCY3gUBgAKCRCJcvTf3G3AJpNYD/
 970LXJu9T/r8J1MdqoqIR+muUaph3v/3r/JnVdIrugZjYUdZroQAGmvpKjF0NaevA5Rz+pYN8ejlBj
 QCPPFn5ld4zzw7miWLwRD05VvEonWs3fDK6yDqlRABnzMMa9TT0lLFvtxsLxoBMT5s9qf//qz59Q4C
 kJlTlPyMuRoTP6U3rbnw5ZbjkL1XWiQCUtIds/ZuIZk+lZU8qDtP0jBWfl2GpVsvXReyulyp7AkqbL
 pv+uGEb/ka/nhxaU7+4bse+EhIbJZ6d4hfuwkwjv6eAgbXjPV0cNc6D9/dKU2W7cvi6bD6bwwY9Z1F
 kHfxdJvYbQ+B+MTlG3O2mqN22daWBExivwMVg0gqOIyyUle1c4UceAT9IPZXOO5Ytvb3sHAdi3FySz
 riUxg7OnQoqX4ZuaEAiRtaeIKXp71OaAM2dSFQfZBwB0EkiG+fC5uN3Cs4g0nRt+irHwt1KKCnF/I9
 owyMxTCpvATaqHdA3h+cfpn9xjWayAWEFTkd1duwlgCx9gT72iAKCzpDSaVEY1pzHHI+Ln3obru+it
 k9bsAVVu6S6l/VCU9Ul5sP6yxcHNx/SCeproJkeKDuNgk42tk8FP0RNs9P4BNVvqwszpuwfSwHuLqM
 exJ4TGIXwDqUUOs4vVncpMokhUYJqkBaLE55d9yYRqhWomued0koClDyDE1A==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Kees Cook <keescook@chromium.org>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
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
---
 sound/core/seq/seq_memory.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/core/seq/seq_memory.c b/sound/core/seq/seq_memory.c
index b7aee23fc387..47ef6bc30c0e 100644
--- a/sound/core/seq/seq_memory.c
+++ b/sound/core/seq/seq_memory.c
@@ -113,15 +113,19 @@ EXPORT_SYMBOL(snd_seq_dump_var_event);
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
@@ -151,8 +155,7 @@ int snd_seq_expand_var_event(const struct snd_seq_event *event, int count, char
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
2.34.1

