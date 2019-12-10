Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F86118A79
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 15:10:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41C7016A1;
	Tue, 10 Dec 2019 15:09:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41C7016A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575987013;
	bh=W7DzF0xxwOqxIzhmorEgHBkRDq9KALuQ4uOAwAMQ0q8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mx9CmfcLvmns41sp6UJIB2MpcRvtM9stzBYefDL4Ctv5IMBn9gUnnB81FGZnnJb2i
	 6XEjGI8oNsXcfJNzFNBEk7SQK/hIjWmqyIlyT4MHdb+6Zn+uAsM6Ly1hAMpcbHIRJ5
	 KtEQJTeFkxwM78hTaUNWVgMfjmzRhaO19aTPZRTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 101DDF80307;
	Tue, 10 Dec 2019 14:59:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD827F8027B; Tue, 10 Dec 2019 14:59:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54882F80259
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 14:59:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54882F80259
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 41898B1B2;
 Tue, 10 Dec 2019 13:59:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: linux-media@vger.kernel.org
Date: Tue, 10 Dec 2019 14:58:49 +0100
Message-Id: <20191210135849.15607-15-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210135849.15607-1-tiwai@suse.de>
References: <20191210135849.15607-1-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Anton Sviridenko <anton@corp.bluecherry.net>,
 Takashi Iwai <tiwai@suse.de>, Andrey Utkin <andrey.utkin@corp.bluecherry.net>,
 Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Ismael Luceno <ismael@iodev.co.uk>
Subject: [alsa-devel] [PATCH for-5.6 14/14] media: Drop superfluous ioctl
	PCM ops
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

PCM core deals the empty ioctl field now as default.
Let's kill the redundant lines.

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Bluecherry Maintainers <maintainers@bluecherrydvr.com>
Cc: Anton Sviridenko <anton@corp.bluecherry.net>
Cc: Andrey Utkin <andrey.utkin@corp.bluecherry.net>
Cc: Ismael Luceno <ismael@iodev.co.uk>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/media/pci/cx23885/cx23885-alsa.c   | 1 -
 drivers/media/pci/cx25821/cx25821-alsa.c   | 1 -
 drivers/media/pci/cx88/cx88-alsa.c         | 1 -
 drivers/media/pci/saa7134/saa7134-alsa.c   | 1 -
 drivers/media/pci/solo6x10/solo6x10-g723.c | 1 -
 drivers/media/pci/tw686x/tw686x-audio.c    | 1 -
 drivers/media/usb/cx231xx/cx231xx-audio.c  | 1 -
 drivers/media/usb/em28xx/em28xx-audio.c    | 1 -
 drivers/media/usb/go7007/snd-go7007.c      | 1 -
 drivers/media/usb/tm6000/tm6000-alsa.c     | 1 -
 drivers/media/usb/usbtv/usbtv-audio.c      | 1 -
 11 files changed, 11 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-alsa.c b/drivers/media/pci/cx23885/cx23885-alsa.c
index a8e980c6dacb..df44ed7393a0 100644
--- a/drivers/media/pci/cx23885/cx23885-alsa.c
+++ b/drivers/media/pci/cx23885/cx23885-alsa.c
@@ -495,7 +495,6 @@ static struct page *snd_cx23885_page(struct snd_pcm_substream *substream,
 static const struct snd_pcm_ops snd_cx23885_pcm_ops = {
 	.open = snd_cx23885_pcm_open,
 	.close = snd_cx23885_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.hw_params = snd_cx23885_hw_params,
 	.hw_free = snd_cx23885_hw_free,
 	.prepare = snd_cx23885_prepare,
diff --git a/drivers/media/pci/cx25821/cx25821-alsa.c b/drivers/media/pci/cx25821/cx25821-alsa.c
index c2f2d7c782c7..301616426d8a 100644
--- a/drivers/media/pci/cx25821/cx25821-alsa.c
+++ b/drivers/media/pci/cx25821/cx25821-alsa.c
@@ -639,7 +639,6 @@ static struct page *snd_cx25821_page(struct snd_pcm_substream *substream,
 static const struct snd_pcm_ops snd_cx25821_pcm_ops = {
 	.open = snd_cx25821_pcm_open,
 	.close = snd_cx25821_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.hw_params = snd_cx25821_hw_params,
 	.hw_free = snd_cx25821_hw_free,
 	.prepare = snd_cx25821_prepare,
diff --git a/drivers/media/pci/cx88/cx88-alsa.c b/drivers/media/pci/cx88/cx88-alsa.c
index e1e71ae293ed..7d7aceecc985 100644
--- a/drivers/media/pci/cx88/cx88-alsa.c
+++ b/drivers/media/pci/cx88/cx88-alsa.c
@@ -585,7 +585,6 @@ static struct page *snd_cx88_page(struct snd_pcm_substream *substream,
 static const struct snd_pcm_ops snd_cx88_pcm_ops = {
 	.open = snd_cx88_pcm_open,
 	.close = snd_cx88_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.hw_params = snd_cx88_hw_params,
 	.hw_free = snd_cx88_hw_free,
 	.prepare = snd_cx88_prepare,
diff --git a/drivers/media/pci/saa7134/saa7134-alsa.c b/drivers/media/pci/saa7134/saa7134-alsa.c
index 0385127dd7ff..544ca57eee75 100644
--- a/drivers/media/pci/saa7134/saa7134-alsa.c
+++ b/drivers/media/pci/saa7134/saa7134-alsa.c
@@ -865,7 +865,6 @@ static struct page *snd_card_saa7134_page(struct snd_pcm_substream *substream,
 static const struct snd_pcm_ops snd_card_saa7134_capture_ops = {
 	.open =			snd_card_saa7134_capture_open,
 	.close =		snd_card_saa7134_capture_close,
-	.ioctl =		snd_pcm_lib_ioctl,
 	.hw_params =		snd_card_saa7134_hw_params,
 	.hw_free =		snd_card_saa7134_hw_free,
 	.prepare =		snd_card_saa7134_capture_prepare,
diff --git a/drivers/media/pci/solo6x10/solo6x10-g723.c b/drivers/media/pci/solo6x10/solo6x10-g723.c
index ca349d447610..d6d16e8fd997 100644
--- a/drivers/media/pci/solo6x10/solo6x10-g723.c
+++ b/drivers/media/pci/solo6x10/solo6x10-g723.c
@@ -259,7 +259,6 @@ static int snd_solo_pcm_copy_kernel(struct snd_pcm_substream *ss, int channel,
 static const struct snd_pcm_ops snd_solo_pcm_ops = {
 	.open = snd_solo_pcm_open,
 	.close = snd_solo_pcm_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.prepare = snd_solo_pcm_prepare,
 	.trigger = snd_solo_pcm_trigger,
 	.pointer = snd_solo_pcm_pointer,
diff --git a/drivers/media/pci/tw686x/tw686x-audio.c b/drivers/media/pci/tw686x/tw686x-audio.c
index f5065c72bb28..54144e23a487 100644
--- a/drivers/media/pci/tw686x/tw686x-audio.c
+++ b/drivers/media/pci/tw686x/tw686x-audio.c
@@ -258,7 +258,6 @@ static snd_pcm_uframes_t tw686x_pcm_pointer(struct snd_pcm_substream *ss)
 static const struct snd_pcm_ops tw686x_pcm_ops = {
 	.open = tw686x_pcm_open,
 	.close = tw686x_pcm_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.prepare = tw686x_pcm_prepare,
 	.trigger = tw686x_pcm_trigger,
 	.pointer = tw686x_pcm_pointer,
diff --git a/drivers/media/usb/cx231xx/cx231xx-audio.c b/drivers/media/usb/cx231xx/cx231xx-audio.c
index d46efea53370..de42db6f6ad1 100644
--- a/drivers/media/usb/cx231xx/cx231xx-audio.c
+++ b/drivers/media/usb/cx231xx/cx231xx-audio.c
@@ -551,7 +551,6 @@ static snd_pcm_uframes_t snd_cx231xx_capture_pointer(struct snd_pcm_substream
 static const struct snd_pcm_ops snd_cx231xx_pcm_capture = {
 	.open = snd_cx231xx_capture_open,
 	.close = snd_cx231xx_pcm_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.prepare = snd_cx231xx_prepare,
 	.trigger = snd_cx231xx_capture_trigger,
 	.pointer = snd_cx231xx_capture_pointer,
diff --git a/drivers/media/usb/em28xx/em28xx-audio.c b/drivers/media/usb/em28xx/em28xx-audio.c
index a5215fb1d36a..6833b5bfe293 100644
--- a/drivers/media/usb/em28xx/em28xx-audio.c
+++ b/drivers/media/usb/em28xx/em28xx-audio.c
@@ -626,7 +626,6 @@ static int em28xx_cvol_new(struct snd_card *card, struct em28xx *dev,
 static const struct snd_pcm_ops snd_em28xx_pcm_capture = {
 	.open      = snd_em28xx_capture_open,
 	.close     = snd_em28xx_pcm_close,
-	.ioctl     = snd_pcm_lib_ioctl,
 	.prepare   = snd_em28xx_prepare,
 	.trigger   = snd_em28xx_capture_trigger,
 	.pointer   = snd_em28xx_capture_pointer,
diff --git a/drivers/media/usb/go7007/snd-go7007.c b/drivers/media/usb/go7007/snd-go7007.c
index 40dbf081ef6b..ae27e988e578 100644
--- a/drivers/media/usb/go7007/snd-go7007.c
+++ b/drivers/media/usb/go7007/snd-go7007.c
@@ -175,7 +175,6 @@ static snd_pcm_uframes_t go7007_snd_pcm_pointer(struct snd_pcm_substream *substr
 static const struct snd_pcm_ops go7007_snd_capture_ops = {
 	.open		= go7007_snd_capture_open,
 	.close		= go7007_snd_capture_close,
-	.ioctl		= snd_pcm_lib_ioctl,
 	.hw_params	= go7007_snd_hw_params,
 	.hw_free	= go7007_snd_hw_free,
 	.prepare	= go7007_snd_pcm_prepare,
diff --git a/drivers/media/usb/tm6000/tm6000-alsa.c b/drivers/media/usb/tm6000/tm6000-alsa.c
index 2bfa5abc1b49..c26a0ff60a64 100644
--- a/drivers/media/usb/tm6000/tm6000-alsa.c
+++ b/drivers/media/usb/tm6000/tm6000-alsa.c
@@ -306,7 +306,6 @@ static snd_pcm_uframes_t snd_tm6000_pointer(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_tm6000_pcm_ops = {
 	.open = snd_tm6000_pcm_open,
 	.close = snd_tm6000_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.prepare = snd_tm6000_prepare,
 	.trigger = snd_tm6000_card_trigger,
 	.pointer = snd_tm6000_pointer,
diff --git a/drivers/media/usb/usbtv/usbtv-audio.c b/drivers/media/usb/usbtv/usbtv-audio.c
index b27009875758..b57e94fb1977 100644
--- a/drivers/media/usb/usbtv/usbtv-audio.c
+++ b/drivers/media/usb/usbtv/usbtv-audio.c
@@ -312,7 +312,6 @@ static snd_pcm_uframes_t snd_usbtv_pointer(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_usbtv_pcm_ops = {
 	.open = snd_usbtv_pcm_open,
 	.close = snd_usbtv_pcm_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.prepare = snd_usbtv_prepare,
 	.trigger = snd_usbtv_card_trigger,
 	.pointer = snd_usbtv_pointer,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
