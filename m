Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B9B3C2FDF
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jul 2021 04:36:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 599ED1737;
	Sat, 10 Jul 2021 04:35:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 599ED1737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625884566;
	bh=PFPsC1bwNfkre24GbZAloHDyURgIzkgS9yrhCz7qWhA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TGeJMPoMzgNkoZ16dywVhC9X1nut7yo10ryGAwUakiSfZmaMdSro9SNwXi2A438l3
	 EFPq+XlAFhWl9W92PyYIQ4Osqpnc9dJeyLHq62sXJEGvWXC1/iLTwtJemuqKTPW2LK
	 KbpZ2H/MVKWqBc0eg6UuFtoIkLYpstiMvNnLDtxI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35AD5F80542;
	Sat, 10 Jul 2021 04:25:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9158AF805E3; Sat, 10 Jul 2021 04:24:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D59DEF805DF
 for <alsa-devel@alsa-project.org>; Sat, 10 Jul 2021 04:24:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D59DEF805DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="h17jTR+0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 088C2613ED;
 Sat, 10 Jul 2021 02:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625883893;
 bh=PFPsC1bwNfkre24GbZAloHDyURgIzkgS9yrhCz7qWhA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h17jTR+0rbrLhs31i+6KgY6xnoEGFiAJr5dSjopSLnXo/UV3frhT835HIv0J/51pt
 uXbzc0d6FCbtot4XuLTlU39LMUajOp80+UDdPWGpj4rAz0j2jjDi/zP3cRV8oI2uO9
 yArw3fmhC0cz/1FtJsKK6OlBScFs7u4tSkSIwGm/lUHcIlMvv4oXd8GxnDTXgm/xCi
 NBfeXiTQua2o5YZuJAEjTlwlmETUoVWA5oYE/CMCDW6AgfYfn9S1U10iqu5cSPvp8+
 XMzpFHmff6H2l6norTzEXcmfDBfMu6PVksRJeYdMGuFIFtYOm3JQnGkzu358PWAdOC
 JzA7EDiBBON3A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 18/93] ALSA: usx2y: Don't call free_pages_exact()
 with NULL address
Date: Fri,  9 Jul 2021 22:23:12 -0400
Message-Id: <20210710022428.3169839-18-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710022428.3169839-1-sashal@kernel.org>
References: <20210710022428.3169839-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org
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

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit cae0cf651adccee2c3f376e78f30fbd788d0829f ]

Unlike some other functions, we can't pass NULL pointer to
free_pages_exact().  Add a proper NULL check for avoiding possible
Oops.

Link: https://lore.kernel.org/r/20210517131545.27252-10-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/usx2y/usb_stream.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/usb/usx2y/usb_stream.c b/sound/usb/usx2y/usb_stream.c
index 091c071b270a..cff684942c4f 100644
--- a/sound/usb/usx2y/usb_stream.c
+++ b/sound/usb/usx2y/usb_stream.c
@@ -142,8 +142,11 @@ void usb_stream_free(struct usb_stream_kernel *sk)
 	if (!s)
 		return;
 
-	free_pages_exact(sk->write_page, s->write_size);
-	sk->write_page = NULL;
+	if (sk->write_page) {
+		free_pages_exact(sk->write_page, s->write_size);
+		sk->write_page = NULL;
+	}
+
 	free_pages_exact(s, s->read_size);
 	sk->s = NULL;
 }
-- 
2.30.2

