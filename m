Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEFA44C964
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Nov 2021 20:47:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AE411666;
	Wed, 10 Nov 2021 20:46:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AE411666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636573655;
	bh=zYxXQ4gPS3PZOAsT05llFQjefpQh6gb+3mf/m06OPIo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FYn1Zd+7cnqas4IzrYEFfW1sz98munB4uAXT6BAkTz0qnOojU2OKIuliWORcmXp6F
	 /Q1uMNVChDq5gpR5cI7vmpoSao67f47MAfdjXBNaTf9uPBD7bOGnfroceIfo078lFS
	 zKeoRz/aAGcQmC+Xjim5cLWKjp8myV/lzvqML0kc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D68B4F804B3;
	Wed, 10 Nov 2021 20:46:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD5ABF8049E; Wed, 10 Nov 2021 20:46:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42740F80054
 for <alsa-devel@alsa-project.org>; Wed, 10 Nov 2021 20:46:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42740F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="qFutnmgA"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="RihmIk+6"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 5DF9021B1D;
 Wed, 10 Nov 2021 19:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636573597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=F+eId7cCoGs4KMN5PogD1RpBVyzby2bFXwAoL314FXk=;
 b=qFutnmgAjT+Bjk+KRkz7ACTKkczesebmBvZOAsPdxGdwXtKWZ3J45YQspZmX5s6wKszx4W
 S54HyR+tNV3JpKJM4KhJe+dxCPZXn2vPT8RqeEaM0Csm808eFzKG8cDyhi9jzVNW1kuqg5
 Qu3agXC6tEIUhVeLVuPlbH7XDN6fqmY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636573597;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=F+eId7cCoGs4KMN5PogD1RpBVyzby2bFXwAoL314FXk=;
 b=RihmIk+6mtPDMvEgf3Cw2H0TJMPI5GmaP8kCvY1eaHmmusX7epwhGmYemZbjhx9KDGoqFE
 5B4Po8DQpO9NhoCw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 56488A3B83;
 Wed, 10 Nov 2021 19:46:37 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: Free card instance properly at probe errors
Date: Wed, 10 Nov 2021 20:46:33 +0100
Message-Id: <20211110194633.19098-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Scott Branden <scott.branden@broadcom.com>
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

The recent change in hda-intel driver to allow repeated probes
surfaced a problem that has been hidden until; the probe process in
the work calls azx_free() at the error path, and this skips the card
free process that eventually releases codec instances.  As a result,
we get a kernel WARNING like:

  snd_hda_intel 0000:00:1f.3: Cannot probe codecs, giving up
  ------------[ cut here ]------------
  WARNING: CPU: 14 PID: 186 at sound/hda/hdac_bus.c:73
  ....

For fixing this, we need to call snd_card_free() instead of
azx_free().  Additionally, the device drvdata has to be cleared, as
the driver binding itself is still active.  Then the PM and other
driver callbacks will ignore the procedure.

Fixes: c0f1886de7e1 ("ALSA: hda: intel: Allow repeatedly probing on codec configuration errors")
Reported-and-tested-by: Scott Branden <scott.branden@broadcom.com>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/063e2397-7edb-5f48-7b0d-618b938d9dd8@broadcom.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 7762718cf429..90e9263ac0bd 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2327,7 +2327,8 @@ static int azx_probe_continue(struct azx *chip)
 
 out_free:
 	if (err < 0) {
-		azx_free(chip);
+		pci_set_drvdata(pci, NULL);
+		snd_card_free(chip->card);
 		return err;
 	}
 
-- 
2.26.2

