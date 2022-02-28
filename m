Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BFD4C9F82
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:41:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D55D1DE2;
	Wed,  2 Mar 2022 09:40:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D55D1DE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646210467;
	bh=NxEYHFk47yATkZPekSHyZDVHZV+WoIlyB3JEfxKxBnU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ywa9UBBZW2GAZfsLVMuSufWz63xDaIkYLD6/J75FbiWfHvBo5I3aRGgG9oDHVuxRk
	 Eq6btTriLNWUOVXlFgx6uW+MXgwTp6Snt/mc/pXkwvqsIgjx69KD7BIklxlMHLPNfR
	 tBRu0ihpOC8EIsQDSzd28g+NGzmLS9iWEO9AWrfA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10AA8F805BF;
	Wed,  2 Mar 2022 09:33:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67EAAF804CA; Mon, 28 Feb 2022 12:09:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 812F7F80125
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 12:09:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 812F7F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NJzfXKcN"
Received: by mail-ej1-x630.google.com with SMTP id hw13so23947579ejc.9
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 03:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ewSqtxWpAEouzx42J3KLaoNJ3zRCYps/nc7KO/73VjI=;
 b=NJzfXKcN7hL1Nl33p4E04eSCSKXsmXm0guAXz3+luhQpanQnRU99MCp2hnFUKYaL+B
 1x361O+pkC4o39HmFVweecOA5EyrbgRoo6hBpKoe+ZK3uwuMgKcjXUUzcyKnqq4Ihz7Y
 0pE7mGFU6qwm5nlEaQI6CtIcQNt/P0yiVszOfwFWGIKlTpST4oUB8Axjb2KGdfFCf6oM
 BF7gos7RIFK+C7zFe1BBqWlnyj9ABXdIe2RTMFKfzCdWuqPXqav1BQyfcB8KfJDsFPFC
 rwx0y6HLf2zquaEOFfVg855ZoIJbHt3hF+DdFMjnEF9CZ4aqYu3RYVbCj5tslcC60Xqy
 JDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ewSqtxWpAEouzx42J3KLaoNJ3zRCYps/nc7KO/73VjI=;
 b=llgERdGnKb6xu1yU+kIYvzey62K3V0aNVeMBazlZ0PJOspSg7Ru1YhUxVwhAT/icwt
 gUeKq4HrMAi0m1QEzmB3kZotymZVYn+JobyJuYeKxgQ7twWFAsW/m+uixQUImJjKoHEX
 5sjZ611zMRIPdeY+DFA1wmlwu7NLpmau7FRfWFq1KtLqctxXS6Q4yLfitfslgWUlozXH
 g6y6pO3vvTcQnIe0g7nE9/fkueNQ1Ado9TyQIOofEQkv/wzaL21MrjofnQAhQlJsu8td
 jtf3cfioTCNWLmUfK8p4fudN2Q0YTYmiIgwF9KBe3QY9iM+tvsIfYMvpAjIdOIqs5CzY
 kR5g==
X-Gm-Message-State: AOAM5325ckKr/H85KhiEYhyz8wtR/Dp35XgI9jnv1+0Q4jk6cKq/pgr2
 9KK4kVn959MPyvxY8AZq9Jg=
X-Google-Smtp-Source: ABdhPJzNtnbGg8Nz3uHKd7Xw6L7mCtzAWYaq4yun9pZXXpwsqc9NwfSvsBrijeUqxIoEXwfdb0F3Mg==
X-Received: by 2002:a17:906:26da:b0:6d6:da2e:d338 with SMTP id
 u26-20020a17090626da00b006d6da2ed338mr451651ejc.700.1646046541112; 
 Mon, 28 Feb 2022 03:09:01 -0800 (PST)
Received: from localhost.localdomain (dhcp-077-250-038-153.chello.nl.
 [77.250.38.153]) by smtp.googlemail.com with ESMTPSA id
 z22-20020a17090655d600b006d229436793sm4209049ejp.223.2022.02.28.03.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 03:09:00 -0800 (PST)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 5/6] treewide: remove dereference of list iterator after loop
 body
Date: Mon, 28 Feb 2022 12:08:21 +0100
Message-Id: <20220228110822.491923-6-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228110822.491923-1-jakobkoschel@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:34 +0100
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx@lists.freedesktop.org, samba-technical@lists.samba.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, linux-cifs@vger.kernel.org,
 kvm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>,
 Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
 kgdb-bugreport@lists.sourceforge.net, bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-fsdevel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
 linux-block@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
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

The list iterator variable will be a bogus pointer if no break was hit.
Dereferencing it could load *any* out-of-bounds/undefined value
making it unsafe to use that in the comparision to determine if the
specific element was found.

This is fixed by using a separate list iterator variable for the loop
and only setting the original variable if a suitable element was found.
Then determing if the element was found is simply checking if the
variable is set.

Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 11 +++++++----
 drivers/scsi/wd719x.c                          | 12 ++++++++----
 fs/f2fs/segment.c                              |  9 ++++++---
 3 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
index 57199be082fd..c56cd9e59a66 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
@@ -471,20 +471,23 @@ nvkm_pstate_new(struct nvkm_clk *clk, int idx)
 static int
 nvkm_clk_ustate_update(struct nvkm_clk *clk, int req)
 {
-	struct nvkm_pstate *pstate;
+	struct nvkm_pstate *pstate = NULL;
+	struct nvkm_pstate *tmp;
 	int i = 0;

 	if (!clk->allow_reclock)
 		return -ENOSYS;

 	if (req != -1 && req != -2) {
-		list_for_each_entry(pstate, &clk->states, head) {
-			if (pstate->pstate == req)
+		list_for_each_entry(tmp, &clk->states, head) {
+			if (tmp->pstate == req) {
+				pstate = tmp;
 				break;
+			}
 			i++;
 		}

-		if (pstate->pstate != req)
+		if (!pstate)
 			return -EINVAL;
 		req = i;
 	}
diff --git a/drivers/scsi/wd719x.c b/drivers/scsi/wd719x.c
index 1a7947554581..be270ed8e00d 100644
--- a/drivers/scsi/wd719x.c
+++ b/drivers/scsi/wd719x.c
@@ -684,11 +684,15 @@ static irqreturn_t wd719x_interrupt(int irq, void *dev_id)
 	case WD719X_INT_SPIDERFAILED:
 		/* was the cmd completed a direct or SCB command? */
 		if (regs.bytes.OPC == WD719X_CMD_PROCESS_SCB) {
-			struct wd719x_scb *scb;
-			list_for_each_entry(scb, &wd->active_scbs, list)
-				if (SCB_out == scb->phys)
+			struct wd719x_scb *scb = NULL;
+			struct wd719x_scb *tmp;
+
+			list_for_each_entry(tmp, &wd->active_scbs, list)
+				if (SCB_out == tmp->phys) {
+					scb = tmp;
 					break;
-			if (SCB_out == scb->phys)
+				}
+			if (scb)
 				wd719x_interrupt_SCB(wd, regs, scb);
 			else
 				dev_err(&wd->pdev->dev, "card returned invalid SCB pointer\n");
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 1dabc8244083..a3684385e04a 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -356,16 +356,19 @@ void f2fs_drop_inmem_page(struct inode *inode, struct page *page)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct list_head *head = &fi->inmem_pages;
 	struct inmem_pages *cur = NULL;
+	struct inmem_pages *tmp;

 	f2fs_bug_on(sbi, !page_private_atomic(page));

 	mutex_lock(&fi->inmem_lock);
-	list_for_each_entry(cur, head, list) {
-		if (cur->page == page)
+	list_for_each_entry(tmp, head, list) {
+		if (tmp->page == page) {
+			cur = tmp;
 			break;
+		}
 	}

-	f2fs_bug_on(sbi, list_empty(head) || cur->page != page);
+	f2fs_bug_on(sbi, !cur);
 	list_del(&cur->list);
 	mutex_unlock(&fi->inmem_lock);

--
2.25.1

