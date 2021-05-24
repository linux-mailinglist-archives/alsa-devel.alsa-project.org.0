Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 623E638E9C0
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 16:49:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E74B51671;
	Mon, 24 May 2021 16:48:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E74B51671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621867753;
	bh=YMUIRBqPsKnP1v3cJ/Dw9pNi02k97cYZ5bin7a9UhRc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aIAlMZ+4Ai4xxRfYf7mAhvRR8/aOgzXkv0Dr0qhpZ6BuMWGcb+6cTZNB8+5W5fqz6
	 kuOpo8bjRo9oHDFxSK/2wNqzlcEt9Mm4dk5TpB5JF8ldc659mnzqCtW4vUWs+UWQ2a
	 QuPPvEDdqTO+tS04eQTzwL8py6jw0qLmPhz2YeOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E2F6F80430;
	Mon, 24 May 2021 16:46:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE2EFF80424; Mon, 24 May 2021 16:46:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8396F8022B
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 16:46:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8396F8022B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZImiOv+t"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F396613D2;
 Mon, 24 May 2021 14:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621867604;
 bh=YMUIRBqPsKnP1v3cJ/Dw9pNi02k97cYZ5bin7a9UhRc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZImiOv+tFeIadWBbbxQwzqi+GbXJTIS+nHzhXZIxVfWS6XJ7AJgo35EG1g/3cT0As
 xUnvqL4fevuJFZYa7SZRi9Q0jHhWAZ5DfP1xDCOVY/NmO4HAKbs+jpNNIhh9rwPsnp
 DbZrq6co2d0GmD4TbjteK74goXnpjPi5G3Y8B3zeeJlOAF7btAy+c+PdVOgXIllSUR
 aD5qtz9JA4w7bE5Y7wzM/kNJyddEdElzeuZfpyaL6R4WC7iVBbAINDz/15rR4kDx//
 +/WcfiofpwZ+5MShSke2KhOPP9U/D6u1tkQBRd/b1a9BM4cpppIERYjgfAUMWyi4X6
 Oo0GH9+XUzGLg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 18/63] Revert "ALSA: usx2y: Fix potential NULL
 pointer dereference"
Date: Mon, 24 May 2021 10:45:35 -0400
Message-Id: <20210524144620.2497249-18-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210524144620.2497249-1-sashal@kernel.org>
References: <20210524144620.2497249-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alsa-devel@alsa-project.org,
 Sasha Levin <sashal@kernel.org>, Aditya Pakki <pakki001@umn.edu>
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

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

[ Upstream commit 4667a6fc1777ce071504bab570d3599107f4790f ]

This reverts commit a2c6433ee5a35a8de6d563f6512a26f87835ea0f.

Because of recent interactions with developers from @umn.edu, all
commits from them have been recently re-reviewed to ensure if they were
correct or not.

Upon review, this commit was found to be incorrect for the reasons
below, so it must be reverted.  It will be fixed up "correctly" in a
later kernel change.

The original patch was incorrect, and would leak memory if the error
path the patch added was hit.

Cc: Aditya Pakki <pakki001@umn.edu>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20210503115736.2104747-37-gregkh@linuxfoundation.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/usx2y/usb_stream.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/usb/usx2y/usb_stream.c b/sound/usb/usx2y/usb_stream.c
index 091c071b270a..6bba17bf689a 100644
--- a/sound/usb/usx2y/usb_stream.c
+++ b/sound/usb/usx2y/usb_stream.c
@@ -91,12 +91,7 @@ static int init_urbs(struct usb_stream_kernel *sk, unsigned use_packsize,
 
 	for (u = 0; u < USB_STREAM_NURBS; ++u) {
 		sk->inurb[u] = usb_alloc_urb(sk->n_o_ps, GFP_KERNEL);
-		if (!sk->inurb[u])
-			return -ENOMEM;
-
 		sk->outurb[u] = usb_alloc_urb(sk->n_o_ps, GFP_KERNEL);
-		if (!sk->outurb[u])
-			return -ENOMEM;
 	}
 
 	if (init_pipe_urbs(sk, use_packsize, sk->inurb, indata, dev, in_pipe) ||
-- 
2.30.2

