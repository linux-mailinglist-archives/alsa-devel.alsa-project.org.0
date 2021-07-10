Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0703C2E76
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jul 2021 04:27:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A46A1670;
	Sat, 10 Jul 2021 04:26:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A46A1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625884058;
	bh=PFPsC1bwNfkre24GbZAloHDyURgIzkgS9yrhCz7qWhA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IRUV+bGbFC2/u2cqMRoP0Y2k2thrMUPEZwJMkwKHpszul1JUJ8Ei/QwxkL5cNeJo0
	 HHAt6yjZHwcYx5kPXMuqb5/wb3HSwNTX1bZlupL8XNlO6SMlHFn7915NYFNOceBmfe
	 3XRp2jNCDMwNnGjWczo+2OXWBIfeT0mzlGXqEUr8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54C9FF80507;
	Sat, 10 Jul 2021 04:22:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE95EF804FB; Sat, 10 Jul 2021 04:22:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B3AEF804F1
 for <alsa-devel@alsa-project.org>; Sat, 10 Jul 2021 04:22:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B3AEF804F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jEr88u5a"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 831CB613D4;
 Sat, 10 Jul 2021 02:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625883743;
 bh=PFPsC1bwNfkre24GbZAloHDyURgIzkgS9yrhCz7qWhA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jEr88u5ah6PhPpvwkppDrjMJXC0WIU2lgX/aytilOmfnlB49PSJnllrKwuOvWdDXj
 WMXAdNFindvS9y8I4L/dlKMiz5UzjB6F+g+xOFkLTY/4f8XCB4n0cSl55vNSTMVWlg
 1+yqYITee7Ze0IqJNcnG6suImm9SwYh2jbAsF6M8+7tJOh1GOq2ALKUp6XsnZnMRiG
 NU+x6yiIR2rZkZQAauyJ+cVgt2GM91026wx0u/BOnN1omvcF6/8fzBhLoHW71+sWH5
 OZF4v1Ygb5dwmmr5rEIydfq1uRAgUE0D09NNxlDEPS8EIUxp6zc7lGzr6YkvSB0/0q
 D7ZUXt9NuVR2Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 020/104] ALSA: usx2y: Don't call
 free_pages_exact() with NULL address
Date: Fri,  9 Jul 2021 22:20:32 -0400
Message-Id: <20210710022156.3168825-20-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710022156.3168825-1-sashal@kernel.org>
References: <20210710022156.3168825-1-sashal@kernel.org>
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

