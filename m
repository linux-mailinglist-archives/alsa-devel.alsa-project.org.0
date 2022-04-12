Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8494FD7C0
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 12:30:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6775418B2;
	Tue, 12 Apr 2022 12:29:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6775418B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649759446;
	bh=JSFV2SpXRbzWgeObP66fU8qa68VU5atl8sCmozSxEwI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aBq83jTztZT9HLeEybxD17bOwRLboBOZFZdnBvi86baKBQ87lvadIPkxtWeu/mvf1
	 esCu5E3Z3+2oE4b01sXeB2ZNFyJBzsMCAD6Khs1gmUvp4x3LJryM/mHzDsIiAphdG6
	 CGlnFJ+q4ddQDvaXVvS3WIQIGQlFeABW1vgM6fc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2170FF8057C;
	Tue, 12 Apr 2022 12:27:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36457F80570; Tue, 12 Apr 2022 12:27:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 918F9F804FA
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 12:26:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 918F9F804FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="OncZ5Rp4"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="U5G+ze1+"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 41F08210E3
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649759204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GXd+obmk+Uj+MUcS/d+rMx14+WSBkHNjMqA+mb14fHM=;
 b=OncZ5Rp4R5SYCD8xW+Bhq1PJD9YP6qXdbJRnCayjPlqgjq+MJDJdpd998VbukZYGhs+bwQ
 ssTGpqFhORATcCQskVni8Vr3tSPWBpicTeMdSV46x0KgmWAAsvf0DkGFfuAN7naihkhMk5
 7z13wOsUeZTCAOT9cu7APU5sgeEd+aU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649759204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GXd+obmk+Uj+MUcS/d+rMx14+WSBkHNjMqA+mb14fHM=;
 b=U5G+ze1+SflTf8q0DuMVyA6k6XsYAk/T9OfG756owgH7kMwy+M3u+5dSKWA3DCvF9SUzyS
 C++ZN1+bdc0rQVBQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 3C8ACA3B83;
 Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/39] ALSA: galaxy: Fix the missing snd_card_free() call at
 probe error
Date: Tue, 12 Apr 2022 12:25:58 +0200
Message-Id: <20220412102636.16000-2-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220412102636.16000-1-tiwai@suse.de>
References: <20220412102636.16000-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The previous cleanup with devres may lead to the incorrect release
orders at the probe error handling due to the devres's nature.  Until
we register the card, snd_card_free() has to be called at first for
releasing the stuff properly when the driver tries to manage and
release the stuff via card->private_free().

This patch fixes it by calling snd_card_free() on the error from the
probe callback using a new helper function.

Fixes: 35a245ec0619 ("ALSA: galaxy: Allocate resources with device-managed APIs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/galaxy/galaxy.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/isa/galaxy/galaxy.c b/sound/isa/galaxy/galaxy.c
index ea001c80149d..3164eb8510fa 100644
--- a/sound/isa/galaxy/galaxy.c
+++ b/sound/isa/galaxy/galaxy.c
@@ -478,7 +478,7 @@ static void snd_galaxy_free(struct snd_card *card)
 		galaxy_set_config(galaxy, galaxy->config);
 }
 
-static int snd_galaxy_probe(struct device *dev, unsigned int n)
+static int __snd_galaxy_probe(struct device *dev, unsigned int n)
 {
 	struct snd_galaxy *galaxy;
 	struct snd_wss *chip;
@@ -598,6 +598,11 @@ static int snd_galaxy_probe(struct device *dev, unsigned int n)
 	return 0;
 }
 
+static int snd_galaxy_probe(struct device *dev, unsigned int n)
+{
+	return snd_card_free_on_error(dev, __snd_galaxy_probe(dev, n));
+}
+
 static struct isa_driver snd_galaxy_driver = {
 	.match		= snd_galaxy_match,
 	.probe		= snd_galaxy_probe,
-- 
2.31.1

