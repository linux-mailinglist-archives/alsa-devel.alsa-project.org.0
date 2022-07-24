Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D3657F95B
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 08:26:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFF3F1F4;
	Mon, 25 Jul 2022 08:26:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFF3F1F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658730411;
	bh=bo3HTBJtaOj71+AiB4+0yTyUudm/x829645uigsYDIs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vKYHWlNWu2O2EQlpqIbdeB02uL8+2bCqJ7PoizPs+yyp/22PMT6ZZ/F15nr4Zj7+o
	 i83fFSJ2An2zuIiZ1AnHsj9Gr6T2YIpNg7QtWAzXGheJeCRK50DG6gdlE1kFkOhMPs
	 +mFRahy33lSaP89O6al7KK+mJlXaAHzKq7YSmI3A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CC03F80088;
	Mon, 25 Jul 2022 08:25:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1331EF8016A; Sun, 24 Jul 2022 09:07:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=KHOP_HELO_FCRDNS, RDNS_DYNAMIC,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtpbg.qq.com (biz-43-154-54-12.mail.qq.com [43.154.54.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2C03F8012B
 for <alsa-devel@alsa-project.org>; Sun, 24 Jul 2022 09:07:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2C03F8012B
X-QQ-mid: bizesmtp84t1658646464tvo35g03
Received: from localhost.localdomain ( [125.70.163.183])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 24 Jul 2022 15:07:42 +0800 (CST)
X-QQ-SSF: 01000000002000007000B00A0000000
X-QQ-FEAT: Y5/s5IBMBZKyIROfgtPjanP2EtS6sNh99EoxSLr08yk8ftkXPyGnSwaAMtyi8
 /qAoEtHxB3DhA6Nt8kou+UVeYRNMvVxU4Yu3FCxk5eqng7nt+gktyOLtozYIlxepklUBZVO
 GKSge38owMgussSFcxdJHPoFCvvZ3dySUBfj5+siHZAT9fhGuMUOl8pXV3WPSArx3SvQYi+
 UD9deJWmPUQwUgxIUfx3MTLbRKgKLa64U085pUhAZjW1Ve3TQtXRRo4P3YD1hAM+D+XD591
 PvC+IaXq5QJn0QzJj65WCIx9r0CM6qm0PGEmO9gDCcUiJChmclBYXOOHkIhdXZJKA2uaKZ1
 xIcx8SSXEhWWO4uaqOT16ByFQ25KxUKdrASIsGriSby3ibQcjg=
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] pci/emu10k1: fix repeated words in comments
Date: Sun, 24 Jul 2022 15:07:36 +0800
Message-Id: <20220724070736.8624-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
X-Mailman-Approved-At: Mon, 25 Jul 2022 08:25:50 +0200
Cc: wangjianli <wangjianli@cdjrlc.com>, alsa-devel@alsa-project.org,
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

 Delete the redundant word 'in'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 sound/pci/emu10k1/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/emu10k1/memory.c b/sound/pci/emu10k1/memory.c
index 9d26535f3fa3..edb3f1763719 100644
--- a/sound/pci/emu10k1/memory.c
+++ b/sound/pci/emu10k1/memory.c
@@ -324,7 +324,7 @@ snd_emu10k1_alloc_pages(struct snd_emu10k1 *emu, struct snd_pcm_substream *subst
 		return NULL;
 	}
 	/* fill buffer addresses but pointers are not stored so that
-	 * snd_free_pci_page() is not called in in synth_free()
+	 * snd_free_pci_page() is not called in synth_free()
 	 */
 	idx = 0;
 	for (page = blk->first_page; page <= blk->last_page; page++, idx++) {
-- 
2.36.1

