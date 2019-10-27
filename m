Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD869E6D48
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 08:35:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C7A81855;
	Mon, 28 Oct 2019 08:35:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C7A81855
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572248151;
	bh=n80mZSgy5iMIwzSYlXtspPPL6NeFdnwvUHYwgVmqCl0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XE9+CU1X5rQRqtrrsS927iacWU1p/zmb+gpCEvJ7GuwYYZrSuQbF9DLIhbNqQfQxQ
	 I4ZDALO1JBglWOkTBz3g41naHSF3ibq+YNHCIdfUrWalyoYLmUUnk0g6x8D549kK4N
	 HfywNZC1CoSMdRqfmEvUok19algt3uO+IeYrWncM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54D87F8048F;
	Mon, 28 Oct 2019 08:33:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75FFBF80392; Sun, 27 Oct 2019 19:30:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 331C5F80228
 for <alsa-devel@alsa-project.org>; Sun, 27 Oct 2019 19:30:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 331C5F80228
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uDga/ALg"
Received: by mail-io1-xd41.google.com with SMTP id z19so8007738ior.0
 for <alsa-devel@alsa-project.org>; Sun, 27 Oct 2019 11:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=GBOGICALtPwpQfkNPfkezlntgQyagNPqrbCuHz6L7Es=;
 b=uDga/ALgD7JROjJVKy/BpQ24VesfuzXc2hvMTRzeG2s2CNGOnyNWgjEoR52ffxI22q
 3oFsSqfdGbnQaVqta0BQVVHPTo+b7aV2iIFtULHr1bzP9Ikti6SsNvVwr6E8mbxkx1xk
 BxwMdjYKpC1SLryjVjglWzH6Fj7rnGT8HsJW9syE/3nEBmgJJorM0Ic1qWuagk/DIMHT
 2Smt34x7H3IOeCeszuAs6x0xLFoa7NBWqzw1YfDHGGUn4VnTSZN9MxqRMaR3w/Woq8P3
 IyqOHfGrUocJx1iSOXKGeUb73u0SUct3zmJH34rIL82roPEwkKnqEuyPdlf6PZeha/hw
 2rbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=GBOGICALtPwpQfkNPfkezlntgQyagNPqrbCuHz6L7Es=;
 b=XdTQMC/Ps7T+AUZAsnJf1fAt6jjnBvvD/7LEC6fPjCLXyUpxZA+3XopnyO5+TfPJzF
 /HsDxqwWkK4GApyrYrxo9OZgsveHfpF6BLcPpS6yjPyb2xICZhAn6ddvkyJ57g6o/ahg
 s035bjz1YNn275m+qpSj94jG0fMAT36+A/uoVCjhrBnAYSanSRbYd8GBCaJJtBcAs+Re
 DgyDlbwB42FhIM+oYT4pJpX/LbyK0FltbFbKhv5xuYEDjfyd0bLMXdh1k1ysxqeA4vRb
 LdFw6kQFCYadQ4ozglIsHi89TCCLI1owRC3F0FYv0wmMNG0nWHgURTDW4hwtMuAw1slZ
 9pCQ==
X-Gm-Message-State: APjAAAVLuaw0AUV2KQNcsFZEgWFOlVilZMlJJpozWA/gjzm5/qzTr7ik
 P75k4QKfGub49UIzaPaNUBs=
X-Google-Smtp-Source: APXvYqzvo+HqAIYoP1gTDYfnuGy2ExLr+rNsa7f56B8AJkvgCeeNu5LEoi0pNv8AOaV54aFtsiDI8Q==
X-Received: by 2002:a05:6638:20a:: with SMTP id
 e10mr14306549jaq.27.1572201040594; 
 Sun, 27 Oct 2019 11:30:40 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id o5sm1186769ilc.68.2019.10.27.11.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2019 11:30:40 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: 
Date: Sun, 27 Oct 2019 13:30:27 -0500
Message-Id: <20191027183030.12677-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:33:18 +0100
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kjlu@umn.edu,
 Takashi Iwai <tiwai@suse.com>, Richard Fontana <rfontana@redhat.com>,
 emamd001@umn.edu, smccaman@umn.edu, Thomas Gleixner <tglx@linutronix.de>,
 Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: [alsa-devel] [PATCH] ALSA: pci: Fix memory leak in snd_ali_create
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

In the implementation of snd_ali_create() the memory allocated for codec
is leaked in case of an error. Release codec if snd_ali_chip_init()
fails.

Fixes: f9ab2b1c3ab5 ("[ALSA] ali5451 - Code clean up, irq handler fix")
Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 sound/pci/ali5451/ali5451.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index 6e28e381c21a..3ed07a18be4d 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -2179,6 +2179,7 @@ static int snd_ali_create(struct snd_card *card,
 	err = snd_ali_chip_init(codec);
 	if (err < 0) {
 		dev_err(card->dev, "ali create: chip init error.\n");
+		snd_ali_free(codec);
 		return err;
 	}
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
