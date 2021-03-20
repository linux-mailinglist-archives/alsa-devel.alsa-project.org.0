Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB09342FDC
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Mar 2021 23:26:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DDE085D;
	Sat, 20 Mar 2021 23:25:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DDE085D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616279175;
	bh=aAB7xj0ogiFIczN6zcsNu4n46f/F/P0r1J5LUqDBlzw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iCyWiOT8mJr9qUI84w98LJnLulgDP3G7chDRtDLNMkkDuh+D6Ui6D2PpZFWcOJolK
	 fgMu5fn/g6NNWXG0IAqOfiixCAE0eSprMQC77whGkXaLMCb6wMiiHBH0ex4VJN7hWf
	 xyHvqiJyVtW6QUOShuIGLN7YJkuz6rNCefb8qSTM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08D45F8032B;
	Sat, 20 Mar 2021 23:24:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2501BF8032B; Sat, 20 Mar 2021 23:24:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7955CF80118
 for <alsa-devel@alsa-project.org>; Sat, 20 Mar 2021 23:23:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7955CF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KXkFFVbv"
Received: by mail-qk1-x731.google.com with SMTP id g15so6830203qkl.4
 for <alsa-devel@alsa-project.org>; Sat, 20 Mar 2021 15:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vdUN2b328BItSMlcqgEcX36NLs9U//nc/tlpRzp+rh4=;
 b=KXkFFVbv47EIbYA8M9x/Sjmwf28xFI74XS7fKw8U1URuIeYjfGuajrsU/JM94MwbiZ
 xuD6cBpk8ebKNMgr8Q7ffWA6YVTnp6hntyQ4ZPAxpnMI8sTKjLHxKf9OVH/N7ZMVBkFn
 qviYmXqKa4LgCes3Qi3+nGI0TLxn2rmGckhaYQ1ThHF14+KBx3aDhcpP+3E0UH3T72Gb
 iBhDFoLrOl/qTDDvByyuRFFqSxFEuTIdQXJb9cfpNCHbrDquXE5s1LNoxvETUaCMzpRX
 WbPdXqlzzemq0T4A9pgdQCsnQfiGnWBkEUYGaSbffSOwOqK0pHqAbr7p81vX9KQGDHHH
 tw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vdUN2b328BItSMlcqgEcX36NLs9U//nc/tlpRzp+rh4=;
 b=OccTpwpOYwHRPc04v/teMFZ9aTvKf+jmA99eDDuVrw70JxOjrpeqmt75Xq2i/EVtNY
 J3d5aZ6OKIyTC1NHRmEu6iYxee3agOCwe1ruBMTrJgRBShSuCEYII6DoB1QFPtbRVmT3
 L4dKw/0s+X+MSPCwCWmHfXfN7BXl66oaJn/FyldCd4Rf00B0/8Qvm+zDASiTvEuBDzpE
 8Rri/mjt5I3cd2azxmGWlLs4moQ9HRpSST7TSj11HA8DMPmLT1/hYJfpKAgtZVNEjdyn
 tiLr2aOLrzDNTAvELazEgu6mtkWsDV9IDIsnl9Re6LgpBcu1HGD+BgIr2K/MuGenLWt+
 bG3g==
X-Gm-Message-State: AOAM531CMVR0QLTkaCrIjoH/EiqCKRvTZuwmsGub2jbTwvw8l/1LvZZ1
 YZmu1ndGJiLpw4roldT5VmSKmhIyrMjL+g==
X-Google-Smtp-Source: ABdhPJwIP8NEZjxbS95UPE9RkobVkAx7dNVTMrKz6G9W6bi8hQMQvMMH2xT3NmAOBed4gSB/oeNt7Q==
X-Received: by 2002:a37:9a07:: with SMTP id c7mr4669713qke.352.1616279036105; 
 Sat, 20 Mar 2021 15:23:56 -0700 (PDT)
Received: from tong-desktop.local ([2601:5c0:c200:27c6:f925:bb4b:54d2:533])
 by smtp.googlemail.com with ESMTPSA id i6sm7570213qkk.31.2021.03.20.15.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 15:23:55 -0700 (PDT)
From: Tong Zhang <ztong0001@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Romain Perier <romain.perier@gmail.com>, Allen Pais <allen.lkml@gmail.com>,
 Leon Romanovsky <leon@kernel.org>, Jasmin Fazlic <superfassl@gmail.com>,
 Tong Zhang <ztong0001@gmail.com>, Mark Brown <broonie@kernel.org>,
 Joe Perches <joe@perches.com>, Tom Rix <trix@redhat.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Naoki Hayama <naoki.hayama@lineo.co.jp>
Subject: [PATCH v2 2/3] ALSA: hdspm: don't disable if not enabled
Date: Sat, 20 Mar 2021 18:23:35 -0400
Message-Id: <20210320222337.243368-3-ztong0001@gmail.com>
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

hdspm wants to disable a not enabled pci device, which makes kernel
throw a warning. Make sure the device is enabled before calling disable.

[    1.786391] snd_hdspm 0000:00:03.0: disabling already-disabled device
[    1.786400] WARNING: CPU: 0 PID: 182 at drivers/pci/pci.c:2146 pci_disable_device+0x91/0xb0
[    1.795181] Call Trace:
[    1.795320]  snd_hdspm_card_free+0x58/0xa0 [snd_hdspm]
[    1.795595]  release_card_device+0x4b/0x80 [snd]
[    1.795860]  device_release+0x3b/0xa0
[    1.796072]  kobject_put+0x94/0x1b0
[    1.796260]  put_device+0x13/0x20
[    1.796438]  snd_card_free+0x61/0x90 [snd]
[    1.796659]  snd_hdspm_probe+0x97b/0x1440 [snd_hdspm]

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 sound/pci/rme9652/hdspm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index 8d900c132f0f..af3898c88bba 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -6582,8 +6582,10 @@ static int snd_hdspm_create(struct snd_card *card,
 	pci_set_master(hdspm->pci);
 
 	err = pci_request_regions(pci, "hdspm");
-	if (err < 0)
+	if (err < 0) {
+		pci_disable_device(pci);
 		return err;
+	}
 
 	hdspm->port = pci_resource_start(pci, 0);
 	io_extent = pci_resource_len(pci, 0);
@@ -6880,10 +6882,10 @@ static int snd_hdspm_free(struct hdspm * hdspm)
 	kfree(hdspm->mixer);
 	iounmap(hdspm->iobase);
 
-	if (hdspm->port)
+	if (hdspm->port) {
 		pci_release_regions(hdspm->pci);
-
-	pci_disable_device(hdspm->pci);
+		pci_disable_device(hdspm->pci);
+	}
 	return 0;
 }
 
-- 
2.25.1

