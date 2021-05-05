Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B0337433A
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 19:01:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E38B81778;
	Wed,  5 May 2021 19:00:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E38B81778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620234063;
	bh=akPnMkQUtdqx/NTYhnCpKZVLF2poA7uwvBLVWZJLPLk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cgm6cSRYzWoySnQr8KP7+/+cZJA3bliwzxpGPI9bB7xRAN7py4tl2ABQlkL4Xy0Ku
	 97iMUESaZqTzHxBoRsCvm/gC1Tm1EaGImkT6SowIEYYTNF4TNPzxPLHrlRkIlyHW6U
	 M77wV50N5k6LDH0r/pen7ijQz8hN4yKgROT0712g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3526FF8052F;
	Wed,  5 May 2021 18:41:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB1E1F8067D; Wed,  5 May 2021 18:41:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DF5BF804C1
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 18:41:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DF5BF804C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kmXtcLZE"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9079A6157E;
 Wed,  5 May 2021 16:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232858;
 bh=akPnMkQUtdqx/NTYhnCpKZVLF2poA7uwvBLVWZJLPLk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kmXtcLZEcQjrVggLolU6OisrVO5Wge8IibnSKXEieERy9JzlcK2F36mkIocHc4lA6
 +eM3X5qMl/VcjD4vMdRR3qj1LjV9Tgw3FeFecCzb2KuJeoe5gAG0qw0GfNPPWxRquM
 AaOqqLQZIZjW1Fk4Lev9LYOQTxGJ9ySoa2FSJbR7YARHxiW27YHYYHCCynxcuOWvlv
 RbCXoojhe3l0luP8G2fGmQopS+43XbL92V4TlvUw2cII2XWXHwF9Eqj54QBrrYyxc2
 Nwz8NeMS8kF3U06Xv3ARS2AJYf9D19Gag+15RhsE66O6uc/wHY7XXMbR1Pm4hZiQcR
 3w0Cf+JFyJr1Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 04/25] ALSA: hdsp: don't disable if not enabled
Date: Wed,  5 May 2021 12:40:30 -0400
Message-Id: <20210505164051.3464020-4-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505164051.3464020-1-sashal@kernel.org>
References: <20210505164051.3464020-1-sashal@kernel.org>
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
index e41bb4100306..edd359772f1f 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -5343,7 +5343,8 @@ static int snd_hdsp_free(struct hdsp *hdsp)
 	if (hdsp->port)
 		pci_release_regions(hdsp->pci);
 
-	pci_disable_device(hdsp->pci);
+	if (pci_is_enabled(hdsp->pci))
+		pci_disable_device(hdsp->pci);
 	return 0;
 }
 
-- 
2.30.2

