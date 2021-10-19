Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58078435098
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 18:49:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD5AA168A;
	Wed, 20 Oct 2021 18:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD5AA168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634748564;
	bh=8X4CEBaMvHnZ/ykUsrBW1TzXfkP1+KQl98ZuA92lrkQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kdfDrfnYSiXrRCBa4jHuLFsj+vGNuNh7oV3IITXNtJBnYY4XOA5elPFWSabtREfiG
	 sXFNjd0hwX97Fr5t23tKjYsA8rI1DnYp93TKJh+xXOY05KsLaZS/cLiR7wUdwBljNo
	 425ZirNKzKsolemd7LVVq1mvgCvHbnVZO5EZvsWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24ACEF80224;
	Wed, 20 Oct 2021 18:48:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E046F80240; Tue, 19 Oct 2021 17:03:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from forward400p.mail.yandex.net (forward400p.mail.yandex.net
 [77.88.28.105])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10E12F80111
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 17:03:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10E12F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxt.ru header.i=@nxt.ru header.b="LuYqnK6k"
Received: from sas1-35b601a382d3.qloud-c.yandex.net
 (sas1-35b601a382d3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:c505:0:640:35b6:1a3])
 by forward400p.mail.yandex.net (Yandex) with ESMTP id B3FDE642286;
 Tue, 19 Oct 2021 18:03:09 +0300 (MSK)
Received: from 2a02:6b8:c08:ff10:0:640:4fe1:bb3c
 (2a02:6b8:c08:ff10:0:640:4fe1:bb3c [2a02:6b8:c08:ff10:0:640:4fe1:bb3c])
 by sas1-35b601a382d3.qloud-c.yandex.net (mxback/Yandex) with HTTP id
 73eMvu1D8uQ1-38DSiAdb; Tue, 19 Oct 2021 18:03:08 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxt.ru; s=mail;
 t=1634655788; bh=RySuvpUFF5Z2mnwc3pWWlYjRFA8psdGb79jKB96dvSo=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=LuYqnK6keNdYKAST6FSAFHNtkE91MS1PB7lj3MqEcXkvoNy6ClnCbKgYv1ioDICqU
 vJECXjXXppNR75wJDFwcufKKOiUm3Od2aAUbM5z4/QApjhIPttIo8zYAUUHULa3l3i
 PsrTqbm5gNTJLZpfRsEoLG6QpsCpvLyaA1Jlscrs=
Authentication-Results: sas1-35b601a382d3.qloud-c.yandex.net;
 dkim=pass header.i=@nxt.ru
Received: by sas2-4fe1bb3c0a49.qloud-c.yandex.net with HTTP;
 Tue, 19 Oct 2021 18:03:08 +0300
From: sanekf@nxt.ru
To: Takashi Iwai <tiwai@suse.com>
Subject: WC vs UC mappings in snd_dma_sg_alloc()
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 19 Oct 2021 18:03:08 +0300
Message-Id: <493661634654791@mail.yandex.ru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 20 Oct 2021 18:48:06 +0200
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
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

Hi

I've stumbled across this code in sound/core/sgbuf.c:

66 static void *snd_dma_sg_alloc(struct snd_dma_buffer *dmab, size_t size)
67 {
< ... >
80 	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG) {
81 		type = SNDRV_DMA_TYPE_DEV_WC;
82 #ifdef pgprot_noncached
83 		prot = pgprot_noncached(PAGE_KERNEL);
84 #endif
85 	}
< ... >
131 	area = vmap(sgbuf->page_table, sgbuf->pages, VM_MAP, prot);

Does not this violate x86 rules about using the same memory mapping type for all mappings? It seems that the following patch should fix it (only compile tested - my x86 PCs are either without Linux or without sound, and probably in practice this might not trigger any problems since both WC and UC-minus are incoherent types):

-----------------------------

ALSA: memalloc: duly use pgprot_writecombine() for WC mapping

x86 has strict rules about not having memory type aliasing (Documentation/x86/pat.rst). snd_dma_sg_alloc() violates them by mapping first as WC (with set_memory_wc()) and then as UC- (with pgprot_noncached() + vmap()). Switching to pgprot_writecombine() should fix this.

Signed-off-by: Aleksandr Fedorov <halcien@gmail.com>
diff --git a/sound/core/sgbuf.c b/sound/core/sgbuf.c
index 8352a5cdb19f..670b30c3b6e5 100644
--- a/sound/core/sgbuf.c
+++ b/sound/core/sgbuf.c
@@ -79,9 +79,7 @@ static void *snd_dma_sg_alloc(struct snd_dma_buffer *dmab, size_t size)
 		return NULL;
 	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG) {
 		type = SNDRV_DMA_TYPE_DEV_WC;
-#ifdef pgprot_noncached
-		prot = pgprot_noncached(PAGE_KERNEL);
-#endif
+		prot = pgprot_writecombine(PAGE_KERNEL);
 	}
 	sgbuf->dev = dmab->dev.dev;
 	pages = snd_sgbuf_aligned_pages(size);
