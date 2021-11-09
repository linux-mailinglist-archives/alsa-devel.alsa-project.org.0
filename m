Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C76044B76F
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Nov 2021 23:32:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E280F16A8;
	Tue,  9 Nov 2021 23:31:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E280F16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636497146;
	bh=nj1FTzjwkeR7B4FSSl63i4tJKlVTSuNv7GNf3Bc4GDw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bA1b5BHUk6Y2ZgS/URuKopyjyLrb1RwXgTYVRzhCD7oxbcGPh9C2tdLN5B56KWT3i
	 8V3x4wGQ5ohtCnJFq0RZjuOaqhu7F6iyunxF7jYhHgh4SwfY1f0edPHsfQaUXIWfi0
	 vurZ9MpSiw0Xr6CSLHiBB/TdFAHWEIZjkx06kpH0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F31CEF805C2;
	Tue,  9 Nov 2021 23:24:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED782F80544; Tue,  9 Nov 2021 23:24:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B59CDF80516
 for <alsa-devel@alsa-project.org>; Tue,  9 Nov 2021 23:24:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B59CDF80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WmK4i1FL"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E56E61B3A;
 Tue,  9 Nov 2021 22:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636496642;
 bh=nj1FTzjwkeR7B4FSSl63i4tJKlVTSuNv7GNf3Bc4GDw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WmK4i1FLquzk5fkIcjNa6BrLaw5ihyfpXllTl301E9/bGKSuKq+u0jF7f8QbTUXJj
 O2TGJx3K9ajYlpzACeXILCdTEAEw8bErMuxX/NF+21+WpD8KJjS3tiUPXGMsYApwuY
 R7yXNiPsff/1Tlp4k4PdVhplbxW5QhX1ABGZ+8Y3Hoypxj0zte/MiOmgrguCMeMLom
 TIdXGLFl2t0Zu80AmkdsL8PRs4oXdGLT5s9lvft9sL4foskLou6muakxlhz6ZhxPEI
 IR/EIC1YTKp//0IH5uFE36qqLdtkmS8dxlyY8wn67tAcgOSArAQvxuyfUxbG5XKOCi
 VXMLUbE6ZlGcA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 13/14] ALSA: gus: fix null pointer dereference on
 pointer block
Date: Tue,  9 Nov 2021 17:23:42 -0500
Message-Id: <20211109222343.1235902-13-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211109222343.1235902-1-sashal@kernel.org>
References: <20211109222343.1235902-1-sashal@kernel.org>
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

