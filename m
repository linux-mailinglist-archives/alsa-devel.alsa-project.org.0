Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E208472E71
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 15:04:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9447817AF;
	Mon, 13 Dec 2021 15:03:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9447817AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639404243;
	bh=zHCyhJmrgRGO9v3Wld8kOR5qPIddTD6zh1RIcKkwsgU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g6OGf3x2A0oysGI5UOZiNmuupVn+oC3bSjN78RKvVQMNxJ6mK/moUvPnhLnW51+P9
	 vxhJS9rBSO6z+EU8QI7w4OMs58nsDX/Afvq0739sJui5biDsk3pdRDYukwFXAdaGI+
	 eSDa1fYq2tqYB3HAi1F67Sr7odCaT8UGVNIRLxho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3103DF8013C;
	Mon, 13 Dec 2021 15:02:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58AF0F8025D; Mon, 13 Dec 2021 15:02:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42310F80161
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 15:02:49 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A9E61A0040;
 Mon, 13 Dec 2021 15:02:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A9E61A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1639404168; bh=SxpSdKy5kX9mHyZTi+Lr4PtR/9M87ZOYydkMTQzqCR4=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=LmZ9JvZxEktJkETfd6sZl5G9KGgMF9wcpxcoWhg9Nba86VEUg5rXdIUGFnSxT8SkK
 dulWjnNj9rKYqgzasV0IKfQnXmaL4EpuMTVxA71k21GugQ/HxQS57u5r0xaBu+fpAW
 OTQ+za5pablnuN6G4ANVgr8QLvWeSR52hEwaUKKM=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 13 Dec 2021 15:02:46 +0100 (CET)
Message-ID: <cec12243-783d-830b-e568-da525396b061@perex.cz>
Date: Mon, 13 Dec 2021 15:02:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/2] ALSA: gus: Fix memory leaks at error paths in memory
 allocations
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20211213132444.22385-1-tiwai@suse.de>
 <20211213132444.22385-2-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20211213132444.22385-2-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>
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

On 13. 12. 21 14:24, Takashi Iwai wrote:
> When snd_gf1_mem_xalloc() returns NULL, the current code still leaves
> the formerly allocated block.name string but returns an error
> immediately.  This patch covers the all callers to deal with the
> release of leftover name strings in the error paths.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

It may be easier to pass the name to snd_gf1_mem_xalloc() - the code flow is more readable:

diff --git a/sound/isa/gus/gus_mem.c b/sound/isa/gus/gus_mem.c
index ff9480f249fe..cd087267b3ea 100644
--- a/sound/isa/gus/gus_mem.c
+++ b/sound/isa/gus/gus_mem.c
@@ -25,14 +25,22 @@ void snd_gf1_mem_lock(struct snd_gf1_mem * alloc, int xup)
  }
  
  static struct snd_gf1_mem_block *snd_gf1_mem_xalloc(struct snd_gf1_mem * alloc,
-					       struct snd_gf1_mem_block * block)
+					       struct snd_gf1_mem_block * block,
+					       const char * _name)
  {
  	struct snd_gf1_mem_block *pblock, *nblock;
+	char *name;
  
+	name = kstrdup(_name, GFP_KERNEL);
+	if (name == NULL)
+		return NULL
  	nblock = kmalloc(sizeof(struct snd_gf1_mem_block), GFP_KERNEL);
-	if (nblock == NULL)
+	if (nblock == NULL) {
+		kfree(name);
  		return NULL;
+	}
  	*nblock = *block;
+	nblock->name = name;
  	pblock = alloc->first;
  	while (pblock) {
  		if (pblock->ptr > nblock->ptr) {
@@ -198,8 +206,7 @@ struct snd_gf1_mem_block *snd_gf1_mem_alloc(struct snd_gf1_mem * alloc, int owne
  	if (share_id != NULL)
  		memcpy(&block.share_id, share_id, sizeof(block.share_id));
  	block.owner = owner;
-	block.name = kstrdup(name, GFP_KERNEL);
-	nblock = snd_gf1_mem_xalloc(alloc, &block);
+	nblock = snd_gf1_mem_xalloc(alloc, &block, name);
  	snd_gf1_mem_lock(alloc, 1);
  	return nblock;
  }
@@ -236,14 +243,12 @@ int snd_gf1_mem_init(struct snd_gus_card * gus)
  	if (gus->gf1.enh_mode) {
  		block.ptr = 0;
  		block.size = 1024;
-		block.name = kstrdup("InterWave LFOs", GFP_KERNEL);
-		if (snd_gf1_mem_xalloc(alloc, &block) == NULL)
+		if (snd_gf1_mem_xalloc(alloc, &block, "InterWave LFOs") == NULL)
  			return -ENOMEM;
  	}
  	block.ptr = gus->gf1.default_voice_address;
  	block.size = 4;
-	block.name = kstrdup("Voice default (NULL's)", GFP_KERNEL);
-	if (snd_gf1_mem_xalloc(alloc, &block) == NULL)
+	if (snd_gf1_mem_xalloc(alloc, &block, "Voice default (NULL's)") == NULL)
  		return -ENOMEM;
  #ifdef CONFIG_SND_DEBUG
  	snd_card_ro_proc_new(gus->card, "gusmem", gus, snd_gf1_mem_info_read);

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
