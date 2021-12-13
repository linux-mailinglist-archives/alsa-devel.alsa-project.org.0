Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 809C047221E
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 09:08:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B4D71883;
	Mon, 13 Dec 2021 09:07:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B4D71883
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639382917;
	bh=onkSok+0NXlydsvTvzc2xVIIBLSEttQHQ2/Yj9Ri1Yo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BZQd56hmP9wbfOc5krLYiSDpYn9wkRk+unJNYyvj9+OMku5LDH+45gZR35EmFriOS
	 OUsW4HReVJp52y0+5ZSvgvagChqnZ5GQBy4u1VPGxK9+GVergH9y84eQvt8qYcUJQL
	 5g9dGKGTgrLtoeyp1UfAY0K+xUXz/7KX6HJS89sw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58032F8025F;
	Mon, 13 Dec 2021 09:07:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F1A6F8025D; Mon, 13 Dec 2021 09:07:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HELO_DYNAMIC_IPADDR,PRX_BODY_94,RDNS_DYNAMIC,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out203-205-251-27.mail.qq.com (out203-205-251-27.mail.qq.com
 [203.205.251.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9801F8013C
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 09:07:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9801F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com
 header.b="UGeolYMP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1639382835;
 bh=dpszwiQZqvjXUNdTHYC3Hj9j2IbSuRh/whKWdQwGCXE=;
 h=From:To:Cc:Subject:Date;
 b=UGeolYMPYNWI/1qZo7soz6aTtPmIo0m53HgKPdc3EwOxwSR/+9Qxb99Yn5Kj2Jn+l
 lA/lU3MqCsKurBKEqjpss77JA99e/LdO+M+KqcLHVPbbWrvLFYSBlAj70/IT1ps1tD
 HlTmyawJgaRCrPJf2rrUV6EWZMJErAejrSHhMU0A=
Received: from localhost.localdomain ([218.197.153.188])
 by newxmesmtplogicsvrsza23.qq.com (NewEsmtp) with SMTP
 id 1CC880C7; Mon, 13 Dec 2021 16:07:12 +0800
X-QQ-mid: xmsmtpt1639382832tpsk5pue2
Message-ID: <tencent_62C8C2B79490FE8D4000985D724D38842809@qq.com>
X-QQ-XMAILINFO: M+SXJ71vgvoOlbkb9tPfLUTj/yyxefpbY9PXk7f1W1n+rbfnJRjzZ2Bu9MUaE3
 +O4QaojLa9nG1oue46hB1s4BFJMNFjuamDygSetje132Kj45Gw4sQzn8XqODLiaGIv01Aqkh5Yc+
 4QFSmSZmC6J00OvKFLmRmczVU3pi71eHh+HIk/hxMOXNd0Uga2GTJcEhPk7nmsl/Ud4CBgGM3/SP
 PkFpjokBcVXs903bh7gIdVBMqfdCOcYpE8PI62YgEE+ejzaoT/5nebQtCjgBD4SS2El6noD5s4WJ
 uUvxFc4YnnlBggYgyIyZtsEn1xzmW/pO5pVlnStmjVwsfE5tcaSwRYcl1Fv8XChG3L2QUVJXMHid
 pR7IqvO3vPhsMBuTnkFLKhQPEUXO/mOYy5rLJ0bQ2Ji56rXr3mS8QnLxdwYm+mvJnZRLoI00F0xW
 ygvvn7XsS1lH4VDtsLotfqIoTpkbkDf4uT1R80LOkuLDVH2KRQcNYbsrdo3+r4BqKJi9lc4VnGze
 jAnOtoLxhv/4goTluoBhc7QH5fVyD59rfSez23yO3aUc1+VjOSqcPv+C0Pgx+ETN+N4HcnVxxgto
 x3NQV0O7i6UedbimCEryXwFu/zuNtYr+bkaWlWEDEZKKkDIgoZ/Tmn3JXeouE2Cc4w4X6g4NH5j1
 LbDHZrsHEql7s/uMbwmU/4OKaPqBm6JzbFhw2Va5m8xFmiI6TevbCBblRFDHTkoobIM45OZuNy47
 vbYSKVAqL2pQf41YLexgF6l2X8IeuElSgzJkkRTOi/t7xp7MfZg7e9fECR4R9Gh3y5DPGdmPXad4
 3kfpunOOZCd5ILLwG3r9uwg3Fc0Rwli60+DsShXO709P6ndqu4PS6IjoeK5kYeWZyjYzivU+4ROV
 nYziPN+N7LLTWP7rnD3uH8BkheYSwnvp1B4ifUgwgNgMrubgdNlqj9g+O+/9I0Jb5cSMvdeVTl
From: Xiaoke Wang <xkernel.wang@foxmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: sound/isa/gus: check the return value of kstrdup()
Date: Mon, 13 Dec 2021 16:06:47 +0800
X-OQ-MSGID: <20211213080647.4359-1-xkernel.wang@foxmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Xiaoke Wang <xkernel.wang@foxmail.com>
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

Note: Compare with the last email, this one is using my full name.
kstrdup() returns NULL when some internal memory errors happen, it is
better to check the return value of it. Otherwise, we may not to be able
to catch some memory errors in time.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 sound/isa/gus/gus_mem.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/isa/gus/gus_mem.c b/sound/isa/gus/gus_mem.c
index ff9480f..f8d915f 100644
--- a/sound/isa/gus/gus_mem.c
+++ b/sound/isa/gus/gus_mem.c
@@ -199,6 +199,8 @@ struct snd_gf1_mem_block *snd_gf1_mem_alloc(struct snd_gf1_mem * alloc, int owne
 		memcpy(&block.share_id, share_id, sizeof(block.share_id));
 	block.owner = owner;
 	block.name = kstrdup(name, GFP_KERNEL);
+	if (block.name == NULL)
+		return NULL;
 	nblock = snd_gf1_mem_xalloc(alloc, &block);
 	snd_gf1_mem_lock(alloc, 1);
 	return nblock;
@@ -237,13 +239,13 @@ int snd_gf1_mem_init(struct snd_gus_card * gus)
 		block.ptr = 0;
 		block.size = 1024;
 		block.name = kstrdup("InterWave LFOs", GFP_KERNEL);
-		if (snd_gf1_mem_xalloc(alloc, &block) == NULL)
+		if (block.name == NULL || snd_gf1_mem_xalloc(alloc, &block) == NULL)
 			return -ENOMEM;
 	}
 	block.ptr = gus->gf1.default_voice_address;
 	block.size = 4;
 	block.name = kstrdup("Voice default (NULL's)", GFP_KERNEL);
-	if (snd_gf1_mem_xalloc(alloc, &block) == NULL)
+	if (block.name == NULL || snd_gf1_mem_xalloc(alloc, &block) == NULL)
 		return -ENOMEM;
 #ifdef CONFIG_SND_DEBUG
 	snd_card_ro_proc_new(gus->card, "gusmem", gus, snd_gf1_mem_info_read);
-- 
