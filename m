Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8681F0F3C
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jun 2020 21:43:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BB541658;
	Sun,  7 Jun 2020 21:42:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BB541658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591559018;
	bh=rh/9+R2ZOhcej25khvEn8T2t1FZ3BZyGNya+WwMP1aw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dNdW82sAB5JxRq7Mx9tG9oZQvZNnklPBBsDc8Ua4Nqwiesm86er67URW0/RajtGfi
	 GOQur/54nHzwQN3fDrpkvmQnmycvdwsiPYe9r6akuJ0GrflsJ6HInfV5k37hJQc2di
	 NtX0wi/+Znx4gL6ds+F8r5+RgcfYwL4b3KorueE8=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 457B1F80291;
	Sun,  7 Jun 2020 21:41:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 044A9F8028D; Sun,  7 Jun 2020 21:41:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1B5EF800F4
 for <alsa-devel@alsa-project.org>; Sun,  7 Jun 2020 21:41:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1B5EF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="X8RRZZre"
Received: by mail-pl1-x644.google.com with SMTP id x11so5798164plv.9
 for <alsa-devel@alsa-project.org>; Sun, 07 Jun 2020 12:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=3cK1fYosIfPrB3kvS0B/W+e9ISLbvW19BtH97FK6mTQ=;
 b=X8RRZZrepSKPGbWs4t0paS12CcRWNylnaJzY+81/kEbXOmKA6yJuGvYbhRbOD2qwJ6
 qfP7/xgG0Swxsr/cygHApNFPNDVIU+Da2Za5VO/d5C18YZWsSfJz6hI1YjEHEJSyHcNw
 2S1Zu7l+mkMzPUEF/NUTyfl4smYz0XxhT+Anj63h/qb2MEdZfO56pwkwU061irPmkxk5
 uK/I+6TtKobOzP6s3e53jWdPDK3j41Xt9velGARXwuAjAo1vuHhuNyNWSPx5SdnjTMTV
 wEjOgNtRTZNsX+YKzgjpQ1omF4a5LG951rgrdgm+747kpVwXkiOEbdPruHufCFnzLSf/
 2USQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=3cK1fYosIfPrB3kvS0B/W+e9ISLbvW19BtH97FK6mTQ=;
 b=ifISWgDg0JxbcYhKHAef4tUWqUeLB07Z2Cz5ufK8nKmAtDVPla88PjfxA7C3r8UYEQ
 21sBaWBLcKGNZTUsrZFU0tSbsMQrjIm6aNapnEv9DUy9VUOhFgLBVYD0FXw96D9PDrvk
 rcS2F/1MRajKREZk8IxWULEDyHGB4jxaLutu7KBeTPTaFeAa+TL6semlkB3hPvFSMihP
 YOh7yTJmVZoCiwoMbtYQqzhukjhXk0w/KiQfB5KTr/XndrwWGOI11nsDWPcrYzXsg5GR
 w7JX5Xiey/E2MZRfE8Lg1/NPqBaWOTM6pBUBxEiGk0cnzIouoEYbMbzYtzoRvgOAqN1j
 P5pQ==
X-Gm-Message-State: AOAM533bdOuq9UB4iYuMKQikUhXkuMxN9MJeGZkG+++ZYYBJ3xQ84RhT
 bTtdMHQ1W/zk9my4SO+aEX2auA==
X-Google-Smtp-Source: ABdhPJwEe5+VTHfPmRCKkjVCwGxWSaUT/k69qSTncZ3LWWEm6HyN4P9xEWciLg6pzQ1/LotFy3oPOA==
X-Received: by 2002:a17:90a:9f81:: with SMTP id
 o1mr4020403pjp.139.1591558892709; 
 Sun, 07 Jun 2020 12:41:32 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598]
 ([2620:15c:17:3:3a5:23a7:5e32:4598])
 by smtp.gmail.com with ESMTPSA id k12sm4115264pgm.11.2020.06.07.12.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 12:41:31 -0700 (PDT)
Date: Sun, 7 Jun 2020 12:41:31 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: 82fef0ad811f "x86/mm: unencrypted non-blocking DMA allocations
 use coherent pools" was Re: next-0519 on thinkpad x60: sound related? window
 manager crash
In-Reply-To: <20200607163803.GA10303@duo.ucw.cz>
Message-ID: <alpine.DEB.2.22.394.2006071209470.84952@chino.kir.corp.google.com>
References: <20200520111136.GA3802@amd> <1591545088.74ii116nf2.none@localhost>
 <20200607163803.GA10303@duo.ucw.cz>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, x86@kernel.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, "Alex Xu \(Hello71\)" <alex_y_xu@yahoo.ca>,
 hch@infradead.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 tglx@linutronix.de, hch@lst.de
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

On Sun, 7 Jun 2020, Pavel Machek wrote:

> > I have a similar issue, caused between aaa2faab4ed8 and b170290c2836.
> > 
> > [   20.263098] BUG: unable to handle page fault for address: ffffb2b582cc2000
> > [   20.263104] #PF: supervisor write access in kernel mode
> > [   20.263105] #PF: error_code(0x000b) - reserved bit violation
> > [   20.263107] PGD 3fd03b067 P4D 3fd03b067 PUD 3fd03c067 PMD 3f8822067 PTE 8000273942ab2163
> > [   20.263113] Oops: 000b [#1] PREEMPT SMP
> > [   20.263117] CPU: 3 PID: 691 Comm: mpv Not tainted 5.7.0-11262-gb170290c2836 #1
> > [   20.263119] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./B450 Pro4, BIOS P4.10 03/05/2020
> > [   20.263125] RIP: 0010:__memset+0x24/0x30
> > [   20.263128] Code: cc cc cc cc cc cc 0f 1f 44 00 00 49 89 f9 48 89 d1 83 e2 07 48 c1 e9 03 40 0f b6 f6 48 b8 01 01 01 01 01 01 01 01 48 0f af c6 <f3> 48 ab 89 d1 f3 aa 4c 89 c8 c3 90 49 89 f9 40 88 f0 48 89 d1 f3
> > [   20.263131] RSP: 0018:ffffb2b583d07e10 EFLAGS: 00010216
> > [   20.263133] RAX: 0000000000000000 RBX: ffff8b8000102c00 RCX: 0000000000004000
> > [   20.263134] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffb2b582cc2000
> > [   20.263136] RBP: ffff8b8000101000 R08: 0000000000000000 R09: ffffb2b582cc2000
> > [   20.263137] R10: 0000000000005356 R11: ffff8b8000102c18 R12: 0000000000000000
> > [   20.263139] R13: 0000000000000000 R14: ffff8b8039944200 R15: ffffffff9794daa0
> > [   20.263141] FS:  00007f41aa4b4200(0000) GS:ffff8b803ecc0000(0000) knlGS:0000000000000000
> > [   20.263143] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   20.263144] CR2: ffffb2b582cc2000 CR3: 00000003b6731000 CR4: 00000000003406e0
> > [   20.263146] Call Trace:
> > [   20.263151]  ? snd_pcm_hw_params+0x3f3/0x47a
> > [   20.263154]  ? snd_pcm_common_ioctl+0xf2/0xf73
> > [   20.263158]  ? snd_pcm_ioctl+0x1e/0x29
> > [   20.263161]  ? ksys_ioctl+0x77/0x91
> > [   20.263163]  ? __x64_sys_ioctl+0x11/0x14
> > [   20.263166]  ? do_syscall_64+0x3d/0xf5
> > [   20.263170]  ? entry_SYSCALL_64_after_hwframe+0x44/0xa9
> > [   20.263173] Modules linked in: uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videodev snd_usb_audio videobuf2_common snd_hwdep snd_usbmidi_lib input_leds snd_rawmidi led_class
> > [   20.263182] CR2: ffffb2b582cc2000
> > [   20.263184] ---[ end trace c6b47a774b91f0a0 ]---
> > [   20.263187] RIP: 0010:__memset+0x24/0x30
> > [   20.263190] Code: cc cc cc cc cc cc 0f 1f 44 00 00 49 89 f9 48 89 d1 83 e2 07 48 c1 e9 03 40 0f b6 f6 48 b8 01 01 01 01 01 01 01 01 48 0f af c6 <f3> 48 ab 89 d1 f3 aa 4c 89 c8 c3 90 49 89 f9 40 88 f0 48 89 d1 f3
> > [   20.263192] RSP: 0018:ffffb2b583d07e10 EFLAGS: 00010216
> > [   20.263193] RAX: 0000000000000000 RBX: ffff8b8000102c00 RCX: 0000000000004000
> > [   20.263195] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffb2b582cc2000
> > [   20.263196] RBP: ffff8b8000101000 R08: 0000000000000000 R09: ffffb2b582cc2000
> > [   20.263197] R10: 0000000000005356 R11: ffff8b8000102c18 R12: 0000000000000000
> > [   20.263199] R13: 0000000000000000 R14: ffff8b8039944200 R15: ffffffff9794daa0
> > [   20.263201] FS:  00007f41aa4b4200(0000) GS:ffff8b803ecc0000(0000) knlGS:0000000000000000
> > [   20.263202] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   20.263204] CR2: ffffb2b582cc2000 CR3: 00000003b6731000 CR4: 00000000003406e0
> > 
> > I bisected this to 82fef0ad811f "x86/mm: unencrypted non-blocking DMA 
> > allocations use coherent pools". Reverting 1ee18de92927 resolves the 
> > issue.
> > 
> > Looks like Thinkpad X60 doesn't have VT-d, but could still be DMA 
> > related.
> 
> Note that newer -next releases seem to behave okay for me. The commit
> pointed out by siection is really simple:
> 
> AFAIK you could verify it is responsible by turning off
> CONFIG_AMD_MEM_ENCRYPT on latest kernel...
> 
> Best regards,
> 								Pavel
> 
> index 1d6104ea8af0..2bf2222819d3 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -1520,6 +1520,7 @@ config X86_CPA_STATISTICS
>  config AMD_MEM_ENCRYPT
>         bool "AMD Secure Memory Encryption (SME) support"
>         depends on X86_64 && CPU_SUP_AMD
> +       select DMA_COHERENT_POOL
>         select DYNAMIC_PHYSICAL_MASK
>         select ARCH_USE_MEMREMAP_PROT
>         select ARCH_HAS_FORCE_DMA_UNENCRYPTED

Thanks for the report!

Besides CONFIG_AMD_MEM_ENCRYPT, do you have CONFIG_DMA_DIRECT_REMAP 
enabled?  If so, it may be caused by the virtual address passed to the 
set_memory_{decrypted,encrypted}() functions.

And I assume you are enabling SME by using mem_encrypt=on on the kernel 
command line or CONFIG_AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT is enabled.

We likely need an atomic pool for devices that support DMA to addresses in 
sme_me_mask as well.  I can test this tomorrow, but wanted to get it out 
early to see if it helps?
---
diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
--- a/kernel/dma/pool.c
+++ b/kernel/dma/pool.c
@@ -13,6 +13,8 @@
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 
+static struct gen_pool *atomic_pool __ro_after_init;
+static unsigned long pool_size;
 static struct gen_pool *atomic_pool_dma __ro_after_init;
 static unsigned long pool_size_dma;
 static struct gen_pool *atomic_pool_dma32 __ro_after_init;
@@ -41,24 +43,37 @@ static void __init dma_atomic_pool_debugfs_init(void)
 	if (IS_ERR_OR_NULL(root))
 		return;
 
+	debugfs_create_ulong("pool_size", 0400, root, &pool_size);
 	debugfs_create_ulong("pool_size_dma", 0400, root, &pool_size_dma);
 	debugfs_create_ulong("pool_size_dma32", 0400, root, &pool_size_dma32);
 	debugfs_create_ulong("pool_size_kernel", 0400, root, &pool_size_kernel);
 }
 
-static void dma_atomic_pool_size_add(gfp_t gfp, size_t size)
+static gfp_t dma_atomic_pool_gfp(void)
 {
-	if (gfp & __GFP_DMA)
+	if (IS_ENABLED(CONFIG_ZONE_DMA))
+		return GFP_KERNEL | GFP_DMA;
+	if (IS_ENABLED(CONFIG_ZONE_DMA32))
+		return GFP_KERNEL | GFP_DMA32;
+	return GFP_KERNEL;
+}
+
+static void dma_atomic_pool_size_add(struct gen_pool *pool, size_t size)
+{
+	if (pool == atomic_pool)
+		pool_size += size;
+	else if (pool == atomic_pool_dma)
 		pool_size_dma += size;
-	else if (gfp & __GFP_DMA32)
+	else if (pool == atomic_pool_dma32)
 		pool_size_dma32 += size;
-	else
+	else if (pool == atomic_pool_kernel)
 		pool_size_kernel += size;
 }
 
 static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
 			      gfp_t gfp)
 {
+	bool decrypt = pool != atomic_pool;
 	unsigned int order;
 	struct page *page;
 	void *addr;
@@ -94,8 +109,9 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
 	 * Memory in the atomic DMA pools must be unencrypted, the pools do not
 	 * shrink so no re-encryption occurs in dma_direct_free_pages().
 	 */
-	ret = set_memory_decrypted((unsigned long)page_to_virt(page),
-				   1 << order);
+	if (decrypt)
+		ret = set_memory_decrypted((unsigned long)page_to_virt(page),
+					   1 << order);
 	if (ret)
 		goto remove_mapping;
 	ret = gen_pool_add_virt(pool, (unsigned long)addr, page_to_phys(page),
@@ -103,12 +119,13 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
 	if (ret)
 		goto encrypt_mapping;
 
-	dma_atomic_pool_size_add(gfp, pool_size);
+	dma_atomic_pool_size_add(pool, pool_size);
 	return 0;
 
 encrypt_mapping:
-	ret = set_memory_encrypted((unsigned long)page_to_virt(page),
-				   1 << order);
+	if (decrypt)
+		ret = set_memory_encrypted((unsigned long)page_to_virt(page),
+					   1 << order);
 	if (WARN_ON_ONCE(ret)) {
 		/* Decrypt succeeded but encrypt failed, purposely leak */
 		goto out;
@@ -132,6 +149,7 @@ static void atomic_pool_resize(struct gen_pool *pool, gfp_t gfp)
 
 static void atomic_pool_work_fn(struct work_struct *work)
 {
+	atomic_pool_resize(atomic_pool, dma_atomic_pool_gfp());
 	if (IS_ENABLED(CONFIG_ZONE_DMA))
 		atomic_pool_resize(atomic_pool_dma,
 				   GFP_KERNEL | GFP_DMA);
@@ -182,6 +200,10 @@ static int __init dma_atomic_pool_init(void)
 	}
 	INIT_WORK(&atomic_pool_work, atomic_pool_work_fn);
 
+	atomic_pool = __dma_atomic_pool_init(atomic_pool_size,
+					     dma_atomic_pool_gfp());
+	if (!atomic_pool)
+		ret = -ENOMEM;
 	atomic_pool_kernel = __dma_atomic_pool_init(atomic_pool_size,
 						    GFP_KERNEL);
 	if (!atomic_pool_kernel)
@@ -209,6 +231,9 @@ static inline struct gen_pool *dev_to_pool(struct device *dev)
 	u64 phys_mask;
 	gfp_t gfp;
 
+	if (!force_dma_unencrypted(dev))
+		return atomic_pool;
+
 	gfp = dma_direct_optimal_gfp_mask(dev, dev->coherent_dma_mask,
 					  &phys_mask);
 	if (IS_ENABLED(CONFIG_ZONE_DMA) && gfp == GFP_DMA)
