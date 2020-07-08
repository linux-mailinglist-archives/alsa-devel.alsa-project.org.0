Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 502AA2184D1
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 12:20:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6F1C1675;
	Wed,  8 Jul 2020 12:20:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6F1C1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594203653;
	bh=FC99/WFD8ZUmXhJeyNoFxnVBVzyoKbVLMTirzteEXiE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QL/5nEJbLnsBZdJRntfQSkHcpi5IUBXcJ277I6G05HkKqNeCqBQGriT9Em/ahwqLh
	 c6AWvnMITj97ZVbaDRViPSBmqdKvSpudB9r0pKT22oelBWaLtZjbD13hzOqt0quKfZ
	 JfKchfoy2sKz06WpUT9Nlx/gXn4boGiWCZY9a3g8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F31AF8015C;
	Wed,  8 Jul 2020 12:19:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69056F802BD; Wed,  8 Jul 2020 12:19:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 947BEF8015C
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 12:18:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 947BEF8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="KzpVVIcQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:
 Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sPd/5mS+9ReK0t094NvzAo3atIxzy2bNU5BMQ3kT/pU=; b=KzpVVIcQssB5A/GQQ4oUl5kldC
 OJOeaHnEfyYu6bcMBQcunPzFumQ5Fsc4VGAYPpZLb7xOMafAruihKgisPKZ9ATtbwQhnUFkkUxHfu
 a53vGxVh1al8S0C5C03+Ep6gR9b5254NBpMyNav6Bz3XfuVE/aMKAESe7nTqmJQdzCWUdji3AcJ9Z
 O91UpuG787WRkZHdxmwSOJvdrWOmc/lyk+6cIt7C26SzN295mt1ICwWNyooyYozZshbOBQpu/A5ms
 yOI8MxgpmAHNAs+LnM3pcGZYljPHxAZfpkoLInBmyLepeV+xlFSy8lnx+PZ4yxBbYZV+5IQMY2aRS
 79r1GKbQ==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jt7A8-0002Q0-Ee; Wed, 08 Jul 2020 11:18:48 +0100
Received: from mark by stax.localdomain with local (Exim 4.84)
 (envelope-from <mark@stax.localdomain>)
 id 1jt7A8-0000ub-4o; Wed, 08 Jul 2020 11:18:48 +0100
From: Mark Hills <mark@xwax.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 4/5] echoaudio: Prevent some noise on unloading the module
Date: Wed,  8 Jul 2020 11:18:47 +0100
Message-Id: <20200708101848.3457-4-mark@xwax.org>
X-Mailer: git-send-email 2.17.5
In-Reply-To: <2007081115280.3085@stax.localdomain>
References: <2007081115280.3085@stax.localdomain>
Cc: alsa-devel@alsa-project.org
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

These are valid conditions in normal circumstances, so do not "warn" but
make them for debugging.

Signed-off-by: Mark Hills <mark@xwax.org>
---
 sound/pci/echoaudio/echoaudio_dsp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/echoaudio/echoaudio_dsp.c b/sound/pci/echoaudio/echoaudio_dsp.c
index f02f5b1568de..d10d0e460f0b 100644
--- a/sound/pci/echoaudio/echoaudio_dsp.c
+++ b/sound/pci/echoaudio/echoaudio_dsp.c
@@ -898,7 +898,7 @@ static int pause_transport(struct echoaudio *chip, u32 channel_mask)
 		return 0;
 	}
 
-	dev_warn(chip->card->dev, "pause_transport: No pipes to stop!\n");
+	dev_dbg(chip->card->dev, "pause_transport: No pipes to stop!\n");
 	return 0;
 }
 
@@ -924,7 +924,7 @@ static int stop_transport(struct echoaudio *chip, u32 channel_mask)
 		return 0;
 	}
 
-	dev_warn(chip->card->dev, "stop_transport: No pipes to stop!\n");
+	dev_dbg(chip->card->dev, "stop_transport: No pipes to stop!\n");
 	return 0;
 }
 
-- 
2.17.5

