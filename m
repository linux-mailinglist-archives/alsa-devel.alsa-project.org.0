Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 812DCE6D4D
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 08:36:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F30531B13;
	Mon, 28 Oct 2019 08:35:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F30531B13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572248198;
	bh=AXV3IzEz4Z20SY2mPRLDRC+6XIMahHgkVJTmtIWkwls=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ldYlxPCyYOVgfeEPKSgMVYdxxdxsPAY6vYnAsWk4WOOcVenjRvnIQNOKGnDDOkcja
	 Tu+GO2dDUCGXE65RJLOBzJ7Rr7UGyD4TEUuHZefxrZhwIk2UrjQvd5iyqzN2JoM9dn
	 83R0xKBfKyWId/rsXjaRIkTUEItDQx15jETdKnwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50A5CF805FE;
	Mon, 28 Oct 2019 08:33:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0162F80392; Sun, 27 Oct 2019 20:12:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7499CF80145
 for <alsa-devel@alsa-project.org>; Sun, 27 Oct 2019 20:12:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7499CF80145
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nTJ9eeMn"
Received: by mail-io1-xd41.google.com with SMTP id p6so8048185iod.7
 for <alsa-devel@alsa-project.org>; Sun, 27 Oct 2019 12:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=FuOLoqKuBv55/BgOb7/WblKZiW3GWx52B3jkkZBZ3Zs=;
 b=nTJ9eeMnKQvuN/UQW8tRL0yhN3rANkRe5hNsbWMqNk9nIG9WaWhKLLMyoYYLV0BAtP
 Ve/D0M93iqhs4/+YjKesD+qfSNRQfOBA9BPuRVXYGOukMnmuZdgL7X81PQFsjSbbFlDA
 ITK/Z/3VHDF4l+c96mIXAJLkfgQwcbet32M1HP6kJjtJDpdmOnt+ajOrE/nGF0qGPg5k
 MkZBDj1Fx54Eu9Ww6CqZyTFnYvNBCRtRN/v6hNId2IsKJBiAhYzRmcmEs/IVbCBNJwZj
 SXk9/XI8hF00fY9BY5B3SP9hkIVEIQLuAFiaNMqjX/yjAlC17yyo62Bgd5Ke1v+i7ydy
 Ll6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FuOLoqKuBv55/BgOb7/WblKZiW3GWx52B3jkkZBZ3Zs=;
 b=K9za3VaBde3ZGVQl0sOVLoTruQoWa1rBkHaUPuQ/n6u2VTD1iBSPrWoNHtwADRSRN9
 +17WU/QMiwXPh6RKTtZp5y7t38HBWQOhGulb1egtQKJXZzfHH3PrG0T/0+SafHUKqB1y
 SLGekdD7dN09YWyZ2HsnnOVzNKOB976UfRDRaoqHdhmKqIxJTBH1xJ5aOD7vcZuUksTw
 EelYD0nyPfwBNaTW87vsMQVX1F1061Z7k49Gn2FVLllAEOn4Jr8hjYt0yRQVhtng370Z
 +yo+iiibIGZfSnelcqDlKaN4iflPkNz0vkYFBJs7YlE7Vw0bVelKxAI6rucG2cdbEqF6
 Ka9w==
X-Gm-Message-State: APjAAAXi19DGd+BsK1k0rnbD0ZG9Xlh/EddUKcJF/i8T9EaHoNybdrSn
 uodF9Fpi63lS8oY9dFsgvW0=
X-Google-Smtp-Source: APXvYqwJazqg1e7f41IHEhAXNxGf0z9vaXl6FfV1BoS/lcf+kRJXX3wQR5O5boZMMgc9oIxNrE3pdA==
X-Received: by 2002:a5e:d90c:: with SMTP id n12mr6934565iop.140.1572203539173; 
 Sun, 27 Oct 2019 12:12:19 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id v14sm745920iob.59.2019.10.27.12.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2019 12:12:18 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: 
Date: Sun, 27 Oct 2019 14:12:04 -0500
Message-Id: <20191027191206.30820-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:33:18 +0100
Cc: alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kjlu@umn.edu,
 Takashi Iwai <tiwai@suse.com>, Richard Fontana <rfontana@redhat.com>,
 emamd001@umn.edu, smccaman@umn.edu, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org, Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: [alsa-devel] [PATCH] ALSA: pci: Fix memory leak in
	snd_korg1212_create
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

In the implementation of snd_korg1212_create() the allocated memory for
korg1212 is leaked in cases of error. Release korg1212 via
snd_korg1212_free() if either of these calls fail:
snd_korg1212_downloadDSPCode(), snd_pcm_new(), or snd_ctl_add().

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 sound/pci/korg1212/korg1212.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index 0d81eac0a478..e976e857d915 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -2367,8 +2367,10 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci,
 
 	mdelay(CARD_BOOT_DELAY_IN_MS);
 
-        if (snd_korg1212_downloadDSPCode(korg1212))
+	if (snd_korg1212_downloadDSPCode(korg1212)) {
+		snd_korg1212_free(korg1212);
         	return -EBUSY;
+	}
 
         K1212_DEBUG_PRINTK("korg1212: dspMemPhy = %08x U[%08x], "
                "PlayDataPhy = %08x L[%08x]\n"
@@ -2383,8 +2385,11 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci,
                korg1212->RoutingTablePhy, LowerWordSwap(korg1212->RoutingTablePhy),
                korg1212->AdatTimeCodePhy, LowerWordSwap(korg1212->AdatTimeCodePhy));
 
-        if ((err = snd_pcm_new(korg1212->card, "korg1212", 0, 1, 1, &korg1212->pcm)) < 0)
+	err = snd_pcm_new(korg1212->card, "korg1212", 0, 1, 1, &korg1212->pcm);
+	if (err < 0) {
+		snd_korg1212_free(korg1212);
                 return err;
+	}
 
 	korg1212->pcm->private_data = korg1212;
         korg1212->pcm->private_free = snd_korg1212_free_pcm;
@@ -2398,8 +2403,10 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci,
 
         for (i = 0; i < ARRAY_SIZE(snd_korg1212_controls); i++) {
                 err = snd_ctl_add(korg1212->card, snd_ctl_new1(&snd_korg1212_controls[i], korg1212));
-                if (err < 0)
+		if (err < 0) {
+			snd_korg1212_free(korg1212);
                         return err;
+		}
         }
 
         snd_korg1212_proc_init(korg1212);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
