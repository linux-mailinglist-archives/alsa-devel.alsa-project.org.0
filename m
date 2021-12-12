Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83746471B81
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Dec 2021 17:15:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 189861AA1;
	Sun, 12 Dec 2021 17:14:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 189861AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639325719;
	bh=iFfi0z7fQMRiuFLhuAdq/ZfxOlCyOjhLxQdwEQ5pk2o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IdP75VO3PKAFHA0oAu/h291Son8+9CMHs58hvZoR0VTdlz29/nAjCBqIwtNT+47xU
	 2Didhb3qRhYfWb1wUBQS2D/IvijKrXXq5efluGuIcszcN0HDLbfuU+e3pjDQXgwfFQ
	 GjMobfw5yZOqAKqqfO6eMlV9yvuVsNXcKQ7ofYak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88D6AF80249;
	Sun, 12 Dec 2021 17:14:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 362ADF80246; Sun, 12 Dec 2021 17:14:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HELO_DYNAMIC_IPADDR,RDNS_DYNAMIC,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out203-205-251-36.mail.qq.com (out203-205-251-36.mail.qq.com
 [203.205.251.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6992F800BC
 for <alsa-devel@alsa-project.org>; Sun, 12 Dec 2021 17:14:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6992F800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com
 header.b="dGihrIEx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1639325634;
 bh=+MGgQBi4hhhEZS4kFqjecsTC/3bTE6ObWs6UftGMrWs=;
 h=From:To:Cc:Subject:Date;
 b=dGihrIExREWDAYfRSAJS2I8xSkrjv9lEg0rHjvTBn63skTzp2KTLZH8ZlW7APsI+P
 AKcHuc0Hm3E/1Q44ZpLQUvZFxqNXTZkCOf5XbWb33F6PfjQnWS7wrG8KpPpgGmnysN
 eht2hZshAu/DcrrG2Uof/Y2l9NM6h/waZq0HXvdA=
Received: from localhost.localdomain ([218.197.153.188])
 by newxmesmtplogicsvrszc9.qq.com (NewEsmtp) with SMTP
 id 373A80BB; Mon, 13 Dec 2021 00:13:51 +0800
X-QQ-mid: xmsmtpt1639325631t325okpgz
Message-ID: <tencent_FB2FE472710C51BC87E7288DFF4380EC320A@qq.com>
X-QQ-XMAILINFO: MAMW4dxoxFytHlFp/K3w5rC1cM/YYuaCgK6GW8f1bs4CY6EVtHDdwucDyZdjnD
 4gc1xLDUJQLKLpPxqsVr0b55zNxdiGMDbUgLJhlTDPO133K8EuAGIEULW0HfMM/dQd/33mN6kcDU
 9F4y1PsoH4W4ezl/XMg2c7yO5cSJPjT1aa3+UmgK+THV84+0FSJmsibnu33kY1WnklMcm8PhFd+Z
 KB9yRQcLPIIb53vFjgXGFckArk3QV6Q3gS9S9OBqKM4ojg8vdptFelnetpRndAX0rwDMNXTAuBOg
 QxF6vCxlVRlIQOjHBD189E8nUiiMyrNQ2uEnVTIHX9Tar1bvrWb/Fp982PN7E65eVxsRvYHw8ciR
 KV2I0Ppzeq3QirjJbCArDzXaMy6oBIKqaevuRnytnUOLFgOR3ygFmK5iaE+l/4pI0ThOKjsot1tC
 rvHy5qOYMfr6+sosYDocpBGW+FwuE6utKSLDznUR+W6lh/Xks5SOF8O1MmDgLEdUsqf0yT3RyTlf
 FSOf6s7347MMsfzQ3JHplNcZ8Y4SOWlEjcFLlxWLUCkYY1Dwp0SLTMSQYED1sB9AulnLmvYvHO4o
 Reh+T4CGqydizVUKVf8BNnj0eEtFkQ38QPvwKAbELTq2wRxQF+NrMpG/lZK/tMm7pB6AnFIZRych
 5MXPBIZofBG7V24ZtoJ+JVSJ4efH2HDcRYMJN3lyhNK2/s0x0r58vaaKne7fRtcHnAeM8tSmi4St
 SJLmO6dJgLmdImjEfEPQi5mmaxjLA6NtD6UH37WVoCCNmLFg7hm/FCKfgl9OIrNVIda48LoreXiG
 GCLsXoPum7/AsuURlHSDvViEekHVnBs3m1XYhsUjIK+qkU9WrpVv8RKPy1R5mMlGC/gDfGIskLHg
 ==
From: xkernel <xkernel.wang@foxmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ALSA: sound/isa/gus: check the return value of kstrdup()
Date: Mon, 13 Dec 2021 00:13:05 +0800
X-OQ-MSGID: <20211212161305.2484-1-xkernel.wang@foxmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 xkernel <xkernel.wang@foxmail.com>
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

kstrdup() returns NULL when some internal memory errors happen, it is
better to check the return value of it. Otherwise, we may not to be able
to catch some memory errors in time.

Signed-off-by: xkernel <xkernel.wang@foxmail.com>
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
