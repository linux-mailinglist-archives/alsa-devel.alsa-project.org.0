Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC113F8B54
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 17:49:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 718D416C9;
	Thu, 26 Aug 2021 17:48:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 718D416C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629992961;
	bh=apaijxHjxFGKfCIfMAgEsvbXgCy7f/44zVA9yFtftZ0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a0kgZSBndWtNCC186eUwNy0fqAStL2+JAzS4tvsiijIaTi2Ygac6Yy13gfma1M2Wu
	 T9E2CPmn+17/pAjLAnjZZdARcWvvkEAklQloiyQpf3/mur5Nx31PMSyiNgwohzt2yK
	 IEyMawFQGvWpAIfwSC0oVQ0VnBA1uuacgrGP8UnA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D30CDF80054;
	Thu, 26 Aug 2021 17:48:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABF14F801D8; Thu, 26 Aug 2021 17:48:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03961F80054
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 17:47:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03961F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="OGe/rvVY"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="WsNTCSoC"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 7157D1FE6F;
 Thu, 26 Aug 2021 15:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629992874; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ysjxHmHwmHx4mlagSSuyI1CodEkdGmk9oZaW2rJjDPk=;
 b=OGe/rvVY/wiKLLs3MdEqGI64ByagKi7q72x/sH4DqwTmsoCNflPigYcJ6UPNIHhEIHA5ng
 iEBesBXErOPV6t+iUdGOtRAPfbyrMsTTsC2BQe/ug1TKJxwcv+yw1inw5sleXiLdevwVRS
 OrNlHf+QVumFysNaICgRnJuxBhf2S3g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629992874;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ysjxHmHwmHx4mlagSSuyI1CodEkdGmk9oZaW2rJjDPk=;
 b=WsNTCSoC/kwukFb8IvlBQiR0/7OQ8fjWYf/c/y45AFk+DGDzngYGNMpKvgYYNv4746e1/N
 DEWhmKtSc7R7XnAQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 6A0FEA3B8B;
 Thu, 26 Aug 2021 15:47:54 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: Disable runtime resume at shutdown
Date: Thu, 26 Aug 2021 17:47:52 +0200
Message-Id: <20210826154752.25674-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
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

Although we modified the codec shutdown callback to perform
runtime-suspend, it's still not fully effective, as this may be
resumed again at any time later.

For fixing such an unwanted resume, this patch replaces
pm_runtime_suspend() with pm_runtime_force_suspend(), and call
pm_runtime_disable() afterward.  It assures to keep the device
suspended.

Also for code simplification, we apply the code unconditionally; when
it's been already suspended, nothing would happen by calls of
snd_pcm_suspend_all() and pm_runtime_force_suspend(), just proceed to
pm_runtime_disable().

Fixes: b98444ed597d ("ALSA: hda: Suspend codec at shutdown")
Reported-and-tested-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_codec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 2c91c92c9ab2..a9ebefd60cf6 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -2986,13 +2986,11 @@ void snd_hda_codec_shutdown(struct hda_codec *codec)
 {
 	struct hda_pcm *cpcm;
 
-	if (pm_runtime_suspended(hda_codec_dev(codec)))
-		return;
-
 	list_for_each_entry(cpcm, &codec->pcm_list_head, list)
 		snd_pcm_suspend_all(cpcm->pcm);
 
-	pm_runtime_suspend(hda_codec_dev(codec));
+	pm_runtime_force_suspend(hda_codec_dev(codec));
+	pm_runtime_disable(hda_codec_dev(codec));
 }
 
 /*
-- 
2.31.1

