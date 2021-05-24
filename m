Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB1138EA1B
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 16:52:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 721991675;
	Mon, 24 May 2021 16:51:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 721991675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621867956;
	bh=YMUIRBqPsKnP1v3cJ/Dw9pNi02k97cYZ5bin7a9UhRc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RjHlTOQ6X3SH5NeHBgDQvJWrK+0zNZ1QId8dcGETOkrzvXk17tmn1Qhi9n7trN8qa
	 /V+nQ2a8ecQGx5iY2WmFULUljPjrX2PmvrIPAiNU0g86ZexmJZ4WQTBgh9HFJKCOun
	 9JdlCI5zN8Ltwpj82G0wkrJx21CifsSDU1PM3Tb8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97547F804E7;
	Mon, 24 May 2021 16:48:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33EB6F804F3; Mon, 24 May 2021 16:48:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C31AF804E7
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 16:48:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C31AF804E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ibRtWlLy"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 849256140E;
 Mon, 24 May 2021 14:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621867686;
 bh=YMUIRBqPsKnP1v3cJ/Dw9pNi02k97cYZ5bin7a9UhRc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ibRtWlLyF2+9hZer6U46cMD6URd4cCaO07NPd2uHxWp4/2jEzeSTtbR+MJX4Ay6vN
 ne92e/vtaOw2RvEmf6vS6JeryUBmkAjbJ+GPoKq/LNcTYnDOOvNB4Ok98c4SJfeFMH
 0WghiGzVv7a+vwKbHBBCHP1BxG68h9FsGot01X5D1S+2EXO9cm1lWQmOSJuwsjgs+C
 vMn1fRBsd4VMR33OqDrXmF+e97gYxj2aGKBFSjB5b1sBxl2GBl80FXZFK4QefblsX0
 nNBzcu+o92mOs53NDgvu22P/xt6k9XeW9pjcI27JX0/3ypriL/FsrHzT8sotPhXxyS
 r41FfN3NUlM6w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 18/62] Revert "ALSA: usx2y: Fix potential NULL
 pointer dereference"
Date: Mon, 24 May 2021 10:46:59 -0400
Message-Id: <20210524144744.2497894-18-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210524144744.2497894-1-sashal@kernel.org>
References: <20210524144744.2497894-1-sashal@kernel.org>
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

