Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F559757411
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 08:27:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C2D1DED;
	Tue, 18 Jul 2023 08:26:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C2D1DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689661623;
	bh=lRAf8pvgVJE37sbYG4AkQgI1mkzEm8ZxZlvvn5AiZxs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UVnAT+TIjQ3nBdXN+Xsax90rYg0IP9ca94tkX42rCZcWq/RrWK0QFj5y6yMV+KPLF
	 539P6bKv9wx7XxPaYHEiqfl8NTURoJkV30a3KiGybF9RVHsaLq+/K402JFRFG07s7j
	 yka5ReDiQ022LLTSATvUSRY7PkfEKO/S8UJFMUR8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97D19F80580; Tue, 18 Jul 2023 08:25:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E28EF80578;
	Tue, 18 Jul 2023 08:25:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 863EDF8032D; Tue, 18 Jul 2023 03:02:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RDNS_NONE,SPF_HELO_FAIL,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD2C2F80153
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 03:02:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD2C2F80153
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org
 header.a=rsa-sha256 header.s=dkim header.b=CJh2plWW
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4R4gdw57XyzBQsl6
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 09:02:12 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1689642131; x=1692234132; bh=lRAf8pvgVJE37sbYG4AkQgI1mkz
	Em8ZxZlvvn5AiZxs=; b=CJh2plWWnXG1MKV0UKNjkuHRJ0wLe6z6hFnwFQQStU7
	49O9PtNtbw42uTTAVyQtwY4aEmzsEcz9Ix6czkui+hE47HWfM7f4ls44TCnojvNl
	YEKamI8gehhEefX5af6rKJ16qwF68Rve/TjGOy3GKErh1rA6GmvM62x9cPiHmkB8
	PLvi2gtCRd0LeO+vIROMxkIs9wkrTS09w6FptD481u53gwrfZUAMHvP6F62SmqdJ
	LMH9hA/o8WiLhFAWbW786EfddrtdNzBGcDZQJsHG2AKdyfCrxnCy/7t+iAc/cq88
	L+0QMFaC8szF1CnUyumvx5/O1eg8WYszJdJlIpI2BQA==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id oC0XdwHLBgHn for <alsa-devel@alsa-project.org>;
	Tue, 18 Jul 2023 09:02:11 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4R4gdv4YTZzBQsl1;
	Tue, 18 Jul 2023 09:02:11 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 18 Jul 2023 09:02:11 +0800
From: shijie001@208suo.com
To: perex@perex.cz, tiwai@suse.com
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: gus: Fix errors in gus_mem.c
In-Reply-To: <tencent_A8FDB76658AA971B46D1614E4FE8F214FE08@qq.com>
References: <tencent_A8FDB76658AA971B46D1614E4FE8F214FE08@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <49700e1a2452104bb89fcdca291fd429@208suo.com>
X-Sender: shijie001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: shijie001@208suo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TRYQBXTOR7GLUWDDLZFYUAKOMUREVP4V
X-Message-ID-Hash: TRYQBXTOR7GLUWDDLZFYUAKOMUREVP4V
X-Mailman-Approved-At: Tue, 18 Jul 2023 06:23:17 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TRYQBXTOR7GLUWDDLZFYUAKOMUREVP4V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following checkpatch errors are removed:
ERROR: trailing whitespace
ERROR: "foo * bar" should be "foo *bar"

Signed-off-by: Jie Shi <shijie001@208suo.com>
---
  sound/isa/gus/gus_mem.c | 24 ++++++++++++------------
  1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/isa/gus/gus_mem.c b/sound/isa/gus/gus_mem.c
index 3e56c01c4544..00c73c0b068f 100644
--- a/sound/isa/gus/gus_mem.c
+++ b/sound/isa/gus/gus_mem.c
@@ -11,11 +11,11 @@
  #include <sound/info.h>

  #ifdef CONFIG_SND_DEBUG
-static void snd_gf1_mem_info_read(struct snd_info_entry *entry,
+static void snd_gf1_mem_info_read(struct snd_info_entry *entry,
                    struct snd_info_buffer *buffer);
  #endif

-void snd_gf1_mem_lock(struct snd_gf1_mem * alloc, int xup)
+void snd_gf1_mem_lock(struct snd_gf1_mem *alloc, int xup)
  {
      if (!xup) {
          mutex_lock(&alloc->memory_mutex);
@@ -67,7 +67,7 @@ snd_gf1_mem_xalloc(struct snd_gf1_mem *alloc, struct 
snd_gf1_mem_block *block,
      return nblock;
  }

-int snd_gf1_mem_xfree(struct snd_gf1_mem * alloc, struct 
snd_gf1_mem_block * block)
+int snd_gf1_mem_xfree(struct snd_gf1_mem *alloc, struct 
snd_gf1_mem_block *block)
  {
      if (block->share) {    /* ok.. shared block */
          block->share--;
@@ -97,7 +97,7 @@ int snd_gf1_mem_xfree(struct snd_gf1_mem * alloc, 
struct snd_gf1_mem_block * blo
      return 0;
  }

-static struct snd_gf1_mem_block *snd_gf1_mem_look(struct snd_gf1_mem * 
alloc,
+static struct snd_gf1_mem_block *snd_gf1_mem_look(struct snd_gf1_mem 
*alloc,
                           unsigned int address)
  {
      struct snd_gf1_mem_block *block;
@@ -110,7 +110,7 @@ static struct snd_gf1_mem_block 
*snd_gf1_mem_look(struct snd_gf1_mem * alloc,
      return NULL;
  }

-static struct snd_gf1_mem_block *snd_gf1_mem_share(struct snd_gf1_mem * 
alloc,
+static struct snd_gf1_mem_block *snd_gf1_mem_share(struct snd_gf1_mem 
*alloc,
                            unsigned int *share_id)
  {
      struct snd_gf1_mem_block *block;
@@ -125,8 +125,8 @@ static struct snd_gf1_mem_block 
*snd_gf1_mem_share(struct snd_gf1_mem * alloc,
      return NULL;
  }

-static int snd_gf1_mem_find(struct snd_gf1_mem * alloc,
-                struct snd_gf1_mem_block * block,
+static int snd_gf1_mem_find(struct snd_gf1_mem *alloc,
+                struct snd_gf1_mem_block *block,
                  unsigned int size, int w_16, int align)
  {
      struct snd_gf1_bank_info *info = w_16 ? alloc->banks_16 : 
alloc->banks_8;
@@ -177,7 +177,7 @@ static int snd_gf1_mem_find(struct snd_gf1_mem * 
alloc,
      return -ENOMEM;
  }

-struct snd_gf1_mem_block *snd_gf1_mem_alloc(struct snd_gf1_mem * alloc, 
int owner,
+struct snd_gf1_mem_block *snd_gf1_mem_alloc(struct snd_gf1_mem *alloc, 
int owner,
                         char *name, int size, int w_16, int align,
                         unsigned int *share_id)
  {
@@ -210,7 +210,7 @@ struct snd_gf1_mem_block *snd_gf1_mem_alloc(struct 
snd_gf1_mem * alloc, int owne
      return nblock;
  }

-int snd_gf1_mem_free(struct snd_gf1_mem * alloc, unsigned int address)
+int snd_gf1_mem_free(struct snd_gf1_mem *alloc, unsigned int address)
  {
      int result;
      struct snd_gf1_mem_block *block;
@@ -226,7 +226,7 @@ int snd_gf1_mem_free(struct snd_gf1_mem * alloc, 
unsigned int address)
      return -EINVAL;
  }

-int snd_gf1_mem_init(struct snd_gus_card * gus)
+int snd_gf1_mem_init(struct snd_gus_card *gus)
  {
      struct snd_gf1_mem *alloc;
      struct snd_gf1_mem_block block;
@@ -255,7 +255,7 @@ int snd_gf1_mem_init(struct snd_gus_card * gus)
      return 0;
  }

-int snd_gf1_mem_done(struct snd_gus_card * gus)
+int snd_gf1_mem_done(struct snd_gus_card *gus)
  {
      struct snd_gf1_mem *alloc;
      struct snd_gf1_mem_block *block, *nblock;
@@ -271,7 +271,7 @@ int snd_gf1_mem_done(struct snd_gus_card * gus)
  }

  #ifdef CONFIG_SND_DEBUG
-static void snd_gf1_mem_info_read(struct snd_info_entry *entry,
+static void snd_gf1_mem_info_read(struct snd_info_entry *entry,
                    struct snd_info_buffer *buffer)
  {
      struct snd_gus_card *gus;
