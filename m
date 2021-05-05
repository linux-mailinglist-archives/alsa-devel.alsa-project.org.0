Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF35374325
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 18:55:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B52F817AA;
	Wed,  5 May 2021 18:54:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B52F817AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620233748;
	bh=0FEt7kcMQl4vrY4tnLxDRxMhoglO1LkLLEobny08FD4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FjfEbZc7I+IqPRuJd0chxLio7UIp7YF9ejc1gI9ut6Nq2Tg6L1C1JkiUCRVGuQHL8
	 uMQi/19vg7Lh3oM7fmPeN4rrMxLDZNgid1EsIEZRUWSh8ZOlIgb/Ddk0GSM/R+qfh9
	 7FU7yPYJ4hVLAf5lIq9DiJyXbxycE8It3MukWaqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF7AAF80621;
	Wed,  5 May 2021 18:39:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40B26F80622; Wed,  5 May 2021 18:39:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEB1BF80518
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 18:39:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEB1BF80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VGWqb3wT"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D04B6199B;
 Wed,  5 May 2021 16:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232747;
 bh=0FEt7kcMQl4vrY4tnLxDRxMhoglO1LkLLEobny08FD4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VGWqb3wTCiay4qlpdr/MMoqn6xiFPDuo5VLll5IIGdRQ6vw50l48zmoN8VCKqStUW
 G0HTJlzTrtoJgKqqfCZK8L+Qt844706PfX3bgansqnx9IY1RAPHn6jWTf85aII+Fe+
 W4MyMdq3enaKH6uWdXoGcdG1RVUoz72C/ykILD636sbnJ038Md6bPUslG1+AZYY+Cb
 99lW1fqijSwjX7Tbi/0gvBlhUjZd/rU387VQzDGMJuKP8Khpdg5Ca162ZYq3Bh7jgs
 Aa9DSB89wP7QLWu29voe1np9OgE8wHlEp31IxWuyKBJGdjynrAH66tjgEHnnSA+hUU
 gCvD9jSrnruvA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 07/46] ALSA: hdsp: don't disable if not enabled
Date: Wed,  5 May 2021 12:38:17 -0400
Message-Id: <20210505163856.3463279-7-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163856.3463279-1-sashal@kernel.org>
References: <20210505163856.3463279-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Tong Zhang <ztong0001@gmail.com>,
 alsa-devel@alsa-project.org, Sasha Levin <sashal@kernel.org>
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

From: Tong Zhang <ztong0001@gmail.com>

[ Upstream commit 507cdb9adba006a7798c358456426e1aea3d9c4f ]

hdsp wants to disable a not enabled pci device, which makes kernel
throw a warning. Make sure the device is enabled before calling disable.

[    1.758292] snd_hdsp 0000:00:03.0: disabling already-disabled device
[    1.758327] WARNING: CPU: 0 PID: 180 at drivers/pci/pci.c:2146 pci_disable_device+0x91/0xb0
[    1.766985] Call Trace:
[    1.767121]  snd_hdsp_card_free+0x94/0xf0 [snd_hdsp]
[    1.767388]  release_card_device+0x4b/0x80 [snd]
[    1.767639]  device_release+0x3b/0xa0
[    1.767838]  kobject_put+0x94/0x1b0
[    1.768027]  put_device+0x13/0x20
[    1.768207]  snd_card_free+0x61/0x90 [snd]
[    1.768430]  snd_hdsp_probe+0x524/0x5e0 [snd_hdsp]

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Tong Zhang <ztong0001@gmail.com>
Link: https://lore.kernel.org/r/20210321153840.378226-2-ztong0001@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/rme9652/hdsp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 5cbdc9be9c7e..c7b3e76ea2d2 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -5326,7 +5326,8 @@ static int snd_hdsp_free(struct hdsp *hdsp)
 	if (hdsp->port)
 		pci_release_regions(hdsp->pci);
 
-	pci_disable_device(hdsp->pci);
+	if (pci_is_enabled(hdsp->pci))
+		pci_disable_device(hdsp->pci);
 	return 0;
 }
 
-- 
2.30.2

