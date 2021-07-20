Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D3E3D04C8
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jul 2021 00:50:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7796E16BC;
	Wed, 21 Jul 2021 00:49:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7796E16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626821443;
	bh=Bj8et9UQsq6R22nWQ4O0jY4BUXwrYcr+6IjG1KXdDjg=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rkV6IB1EMfoP8uWOgWNbkwNF/y0VpSstdmFbomWU5jmcMEgkyMCOWQC3jcTNgoNqr
	 fHcMNg/uZPdHFDzJey8LvYYQbrzwFpWyyrLAFSXa1A19i8JTd/FMQm+hnIjjTPWXaG
	 RP/PmCrZh2Rhbh0mYybm1+Slna96b189WhUD46Bc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E75B2F80227;
	Wed, 21 Jul 2021 00:49:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED052F80218; Wed, 21 Jul 2021 00:49:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4912AF80104
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 00:49:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4912AF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="RPi7Fbiq"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="qbuGAPAK"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 947AA202FF
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 22:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626821343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZBROrd9ivuw8VAnghVpJky5WPl+ezp01SWW7YnWZM5M=;
 b=RPi7Fbiqyy0q2FcdX9YVJI/vBnqxFct63rZVh+mKLH+5dOkWDnXntk2Gdu0bHIDUx/e0pB
 1bSpPdJlkxbjdPqP4XPPamNFhXc31OG8qYExaDlXSYzkEGTZNOcZXYoly43YBYIpYq4XBL
 LpPHXAqYfUAP7D1GyC13quxlezKmQsg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626821343;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZBROrd9ivuw8VAnghVpJky5WPl+ezp01SWW7YnWZM5M=;
 b=qbuGAPAKtuaIPbOiRySpIGc6TnA6E+SnMrmUDvG9cFpX0QVDL/rjfuJWhxiUr7DPhRxYo7
 ODA9jjsFneBRREBQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 84EC2A3B89;
 Tue, 20 Jul 2021 22:49:03 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: sc6000: Use explicit cast for __iomem pointer
Date: Wed, 21 Jul 2021 00:49:02 +0200
Message-Id: <20210720224902.7169-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
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

The recent optimization to store an iomem pointer in card's
private_data field caused sparse warnings.  Although they are
practically harmless, add the explicit cast for avoiding the spurious
warnings.

Fixes: 9b7843d1e125 ("ALSA: sc6000: Assign vport directly on card's private_data")
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/r/202107210511.SnFqlZMa-lkp@intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sc6000.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/isa/sc6000.c b/sound/isa/sc6000.c
index d92e56cb0490..26ab7ff80768 100644
--- a/sound/isa/sc6000.c
+++ b/sound/isa/sc6000.c
@@ -531,7 +531,7 @@ static int snd_sc6000_match(struct device *devptr, unsigned int dev)
 
 static void snd_sc6000_free(struct snd_card *card)
 {
-	char __iomem *vport = card->private_data;
+	char __iomem *vport = (char __force __iomem *)card->private_data;
 
 	if (vport)
 		sc6000_setup_board(vport, 0);
@@ -582,7 +582,7 @@ static int snd_sc6000_probe(struct device *devptr, unsigned int dev)
 			   "I/O port cannot be iomapped.\n");
 		return -EBUSY;
 	}
-	card->private_data = vport;
+	card->private_data = (void __force *)vport;
 
 	/* to make it marked as used */
 	if (!devm_request_region(devptr, mss_port[dev], 4, DRV_NAME)) {
-- 
2.26.2

