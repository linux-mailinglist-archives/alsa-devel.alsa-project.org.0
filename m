Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B11D6342FE1
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Mar 2021 23:26:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 481591663;
	Sat, 20 Mar 2021 23:25:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 481591663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616279191;
	bh=c8CrpfxAGSk3c+suVSx+ve7g6VljnoyAEItyhfaHBeg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oRHw4gC7SgUNeQvkoc5Arkxlod32R/drKpJgbLNKiIWa1JgNWJZgMrUHFWEEPuZzZ
	 DJeC0m5/Geb5KuqfUkrQG2g9d7wkMd/j5E/ihNTOG54Z5RpOz4+fWNoT0ir8hYt0Nb
	 GImwyizsx0fpW/qFhMF3OcR12YSRmTFpuXmZqoQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8BCCF80430;
	Sat, 20 Mar 2021 23:24:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB656F8032C; Sat, 20 Mar 2021 23:24:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8BDAF8025E
 for <alsa-devel@alsa-project.org>; Sat, 20 Mar 2021 23:24:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8BDAF8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EbwO3UZ+"
Received: by mail-qk1-x734.google.com with SMTP id c3so6814235qkc.5
 for <alsa-devel@alsa-project.org>; Sat, 20 Mar 2021 15:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lzvC2v5LGnA+1DrgzVaX9z+VhLej+ZuhAR4hTFoaCjg=;
 b=EbwO3UZ+ZMpbnifPmvpHv2T7G9/OSymNWUU8GZAJqC0FJjpbRfy9WfQW4l4+1FtJdi
 LLkyivvfAgkkvYN5N4qxYx7FO0OHZR2CZvqg9BdCVfk56mjwvsuk59bfjsON3Mxrg2zs
 M+gR+wO/cswAC8SW/Yj3XLT5TUnMzr6tPKQOmBRgEaTp8NvYOKp9Qxs69v4BiqWcSb2o
 e74YQT8PvMHxVvB94eDXHovJUftAcx52jNDvn9cn7PqOjElqfoxjdK7tJ1msJyc9OMBn
 3EwN0sTeu16hSQrFOT/do7KfUjO8Db86/70fdnd8AGbUDZ+NX9BQ8mAyTbK9dE7Qx4D1
 Ishg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lzvC2v5LGnA+1DrgzVaX9z+VhLej+ZuhAR4hTFoaCjg=;
 b=DLhNdk0sJn+b6i0lDes5/B28FnF3iKEOSNvWwVDwfC+zXIFtr9m1X0ZZV3m50Fp2Pa
 MWBX8WKgijy846leFwn8/rOJ4gsgj0I1lB6OMNyFGhNmP+fjfwjOAYcnKBn5OUJV6DXj
 Rw6AxaDgRYyTofkLa6XqkoG+B/YHXpCaSxcmNJ2HTpbSfLvDgPEjXXSHr+PjB+EhTtRe
 M41e8TC1V4q5izKoNcLTocEjIdPIdIxEPPc0vJM/1tL4JpXjGaDZCTc2qmUfv4NO2ImX
 AAKL7lj7Sc8Gj+H/nlKHhcAwH+WlkPVQU/x3Vov/Nrk0893qr2mkthvPMyf+GEbSfvvY
 d7+g==
X-Gm-Message-State: AOAM5310MzFGmk/1tEHrv/YpdBxfBkf6UaKWRYmg/er9sjIFBxTFeZgg
 cOWQq97uFiOVS4cOo7UoFJg=
X-Google-Smtp-Source: ABdhPJwehBLVzN3tr+XdSIF59VbuqPFEsJEnSPk7kTU2JWURSpTatst/TTAJV/9Sv+inkRksUq33Zw==
X-Received: by 2002:a37:a404:: with SMTP id n4mr4593388qke.439.1616279039041; 
 Sat, 20 Mar 2021 15:23:59 -0700 (PDT)
Received: from tong-desktop.local ([2601:5c0:c200:27c6:f925:bb4b:54d2:533])
 by smtp.googlemail.com with ESMTPSA id i6sm7570213qkk.31.2021.03.20.15.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 15:23:58 -0700 (PDT)
From: Tong Zhang <ztong0001@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Romain Perier <romain.perier@gmail.com>, Allen Pais <allen.lkml@gmail.com>,
 Leon Romanovsky <leon@kernel.org>, Jasmin Fazlic <superfassl@gmail.com>,
 Tong Zhang <ztong0001@gmail.com>, Mark Brown <broonie@kernel.org>,
 Joe Perches <joe@perches.com>, Tom Rix <trix@redhat.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Naoki Hayama <naoki.hayama@lineo.co.jp>
Subject: [PATCH v2 3/3] ALSA: rme9652: don't disable if not enabled
Date: Sat, 20 Mar 2021 18:23:36 -0400
Message-Id: <20210320222337.243368-4-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210320222337.243368-1-ztong0001@gmail.com>
References: <20210320222337.243368-1-ztong0001@gmail.com>
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

rme9652 wants to disable a not enabled pci device, which makes kernel
throw a warning. Make sure the device is enabled before calling disable.

[    1.751595] snd_rme9652 0000:00:03.0: disabling already-disabled device
[    1.751605] WARNING: CPU: 0 PID: 174 at drivers/pci/pci.c:2146 pci_disable_device+0x91/0xb0
[    1.759968] Call Trace:
[    1.760145]  snd_rme9652_card_free+0x76/0xa0 [snd_rme9652]
[    1.760434]  release_card_device+0x4b/0x80 [snd]
[    1.760679]  device_release+0x3b/0xa0
[    1.760874]  kobject_put+0x94/0x1b0
[    1.761059]  put_device+0x13/0x20
[    1.761235]  snd_card_free+0x61/0x90 [snd]
[    1.761454]  snd_rme9652_probe+0x3be/0x700 [snd_rme9652]

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 sound/pci/rme9652/rme9652.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/pci/rme9652/rme9652.c b/sound/pci/rme9652/rme9652.c
index 4df992e846f2..f9c9b8a80797 100644
--- a/sound/pci/rme9652/rme9652.c
+++ b/sound/pci/rme9652/rme9652.c
@@ -1728,10 +1728,10 @@ static int snd_rme9652_free(struct snd_rme9652 *rme9652)
 	if (rme9652->irq >= 0)
 		free_irq(rme9652->irq, (void *)rme9652);
 	iounmap(rme9652->iobase);
-	if (rme9652->port)
+	if (rme9652->port) {
 		pci_release_regions(rme9652->pci);
-
-	pci_disable_device(rme9652->pci);
+		pci_disable_device(rme9652->pci);
+  }
 	return 0;
 }
 
@@ -2454,8 +2454,10 @@ static int snd_rme9652_create(struct snd_card *card,
 
 	spin_lock_init(&rme9652->lock);
 
-	if ((err = pci_request_regions(pci, "rme9652")) < 0)
+	if ((err = pci_request_regions(pci, "rme9652")) < 0) {
+		pci_disable_device(pci);
 		return err;
+	}
 	rme9652->port = pci_resource_start(pci, 0);
 	rme9652->iobase = ioremap(rme9652->port, RME9652_IO_EXTENT);
 	if (rme9652->iobase == NULL) {
-- 
2.25.1

