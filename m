Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A49481F166A
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jun 2020 12:09:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2C5C166E;
	Mon,  8 Jun 2020 12:08:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2C5C166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591610951;
	bh=ToQ1Q88h9KXOgWqvqinbc9ShsgjvDBLo4uhp3BUbUok=;
	h=Date:In-Reply-To:References:From:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZfUR4cdESuCbMrAsk+YsNUctOfNELmhrHlfrWsY5QChY66leOZ+nR+2dHO1cgyoLa
	 RsT6Tj2XMubg0KGCHEOGPuU+zSAV3DdqEh8Onmg40T344jjbfQmhQcJtwTXNr+XCYE
	 retf+GDM9aGvH/o81eO9FlQaSS236k0/yJz41oiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE19BF8028A;
	Mon,  8 Jun 2020 12:06:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D7DEF8021E; Mon,  8 Jun 2020 12:06:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77019F80124
 for <alsa-devel@alsa-project.org>; Mon,  8 Jun 2020 12:06:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77019F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="FviN4T+s"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 49gTRr5KF3zBn;
 Mon,  8 Jun 2020 12:06:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1591610792; bh=ToQ1Q88h9KXOgWqvqinbc9ShsgjvDBLo4uhp3BUbUok=;
 h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
 b=FviN4T+s+yA3w3snpTxygawbBpqGW9kQuai95bbFPZtF/V3SwxE8KUQ4aFlTUTN57
 MgFwOs674/5wWjejhCK43e7pfnq2KTu/5DwuKqpaQwKN1IVb1+J8lM+z0Bh/rnndMT
 GYPYF/3zwWrdTYXh60e2w3MhrCmn+uK4dvL1oJI10MB2g9KrQJsx8QT819d81oYSXX
 5hfB2d2qrq+hthA1N3n2hiD6mscCAKXbTV7IXrGBBBDNHB39iZbXu0WFsXwiste72/
 gKGsfUR4X55jYIRBPgPqnxXPauRp58xCTu5rf6zL5E9RaLVAqaN+Jnlf82YHb3C7Tn
 PMOZjLI8j5w5Q==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date: Mon, 08 Jun 2020 12:06:32 +0200
Message-Id: <dc38ec162b8c83e53cf48cc8dc4dbac78667e394.1591610330.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1591610329.git.mirq-linux@rere.qmqm.pl>
References: <cover.1591610329.git.mirq-linux@rere.qmqm.pl>
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH 1/2] ALSA: pcm: disallow linking stream to itself
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Prevent SNDRV_PCM_IOCTL_LINK linking stream to itself - the code
can't handle it. Fixed commit is not where bug was introduced, but
changes the context significantly.

Cc: stable@vger.kernel.org
Fixes: 0888c321de70 ("pcm_native: switch to fdget()/fdput()")
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 sound/core/pcm_native.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index aef860256278..3ad399cb6f30 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2166,6 +2166,12 @@ static int snd_pcm_link(struct snd_pcm_substream *substream, int fd)
 	}
 	pcm_file = f.file->private_data;
 	substream1 = pcm_file->substream;
+
+	if (substream == substream1) {
+		res = -EDEADLK;
+		goto _badf;
+	}
+
 	group = kzalloc(sizeof(*group), GFP_KERNEL);
 	if (!group) {
 		res = -ENOMEM;
-- 
2.20.1

