Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC70E44B784
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Nov 2021 23:32:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4912A16C6;
	Tue,  9 Nov 2021 23:31:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4912A16C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636497163;
	bh=nj1FTzjwkeR7B4FSSl63i4tJKlVTSuNv7GNf3Bc4GDw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YjVyBGgf06ApPYwuaaIVh5uta4TPkqflJVaKQZR0gX9VwgyfYjyxDgagPyHBHimHl
	 Qrj7X8Lzi9TwSCvojbTqZ6f+hKxJUEBZSJvov59YvxM3TipUUufou1QmxYj70Y/Sfj
	 4tDtc9z3ICkvNeYSWQnXNE/03fKsqz3WfJI0TMS0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD24AF8053D;
	Tue,  9 Nov 2021 23:24:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 117B9F8053D; Tue,  9 Nov 2021 23:24:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1729DF804FB
 for <alsa-devel@alsa-project.org>; Tue,  9 Nov 2021 23:24:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1729DF804FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rtobM8GH"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6EF5261B49;
 Tue,  9 Nov 2021 22:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636496663;
 bh=nj1FTzjwkeR7B4FSSl63i4tJKlVTSuNv7GNf3Bc4GDw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rtobM8GHF3oqHe3uBE6Ca8ad3zkvs8hF1JgrU3ZTOwFIWLHluXJCK/OjlcwD8ynir
 fyH7xiODXJo+Kr/E+AH8u5A0twLx3mrp/7/gjF6cwiPSQ02XUNJt7F9bTthQi8GwOk
 OxqmhYV4VdFKuEbPCQVfPu6WfVFzz99iOHA9gC4coyUOHhDrXB1AG/itTfz/a4xERS
 KAFGVMe59Cn9fbn2lBFvhNMLbztABzE8zCOhlcta9cCTXRTAe50qKw7bR04o8UB/CZ
 5jTNVfF7p7wBMmR/srjy/IWx8xZReBnwhhvbSEMAHf+F5qvv8A+b3kRY1zFa2uniTS
 Q4r/rAry8LQ4g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 12/13] ALSA: gus: fix null pointer dereference on
 pointer block
Date: Tue,  9 Nov 2021 17:24:03 -0500
Message-Id: <20211109222405.1236040-12-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211109222405.1236040-1-sashal@kernel.org>
References: <20211109222405.1236040-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, tiwai@suse.com,
 Chengfeng Ye <cyeaa@connect.ust.hk>
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

From: Chengfeng Ye <cyeaa@connect.ust.hk>

[ Upstream commit a0d21bb3279476c777434c40d969ea88ca64f9aa ]

The pointer block return from snd_gf1_dma_next_block could be
null, so there is a potential null pointer dereference issue.
Fix this by adding a null check before dereference.

Signed-off-by: Chengfeng Ye <cyeaa@connect.ust.hk>
Link: https://lore.kernel.org/r/20211024104611.9919-1-cyeaa@connect.ust.hk
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/isa/gus/gus_dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/isa/gus/gus_dma.c b/sound/isa/gus/gus_dma.c
index 36c27c8323601..2e27cd3427c87 100644
--- a/sound/isa/gus/gus_dma.c
+++ b/sound/isa/gus/gus_dma.c
@@ -141,6 +141,8 @@ static void snd_gf1_dma_interrupt(struct snd_gus_card * gus)
 	}
 	block = snd_gf1_dma_next_block(gus);
 	spin_unlock(&gus->dma_lock);
+	if (!block)
+		return;
 	snd_gf1_dma_program(gus, block->addr, block->buf_addr, block->count, (unsigned short) block->cmd);
 	kfree(block);
 #if 0
-- 
2.33.0

