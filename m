Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9793342FD6
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Mar 2021 23:18:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1F6983E;
	Sat, 20 Mar 2021 23:17:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1F6983E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616278707;
	bh=WThy46y05IMN3kwEKDzuMtpW35OgqrDGx6DoolEj8oU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ibvuwud1iTdQplCCcXx44b4SY/qAk4a9WT8QvxoNGoB33/mORWM4T2I1lpAHtgT1+
	 LfwFQCRZ/BhpsbLGgP6Tc9NutE4+hbzUVc+7mzJstadWYECcUU83pBYPHZhetBwzAY
	 QVEB2QFt0ncQIMDMlzDxCXDd6WvgruhLS42iDPfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE45FF8023B;
	Sat, 20 Mar 2021 23:16:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0C9EF800BB; Sat, 20 Mar 2021 23:16:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D16FF800BB
 for <alsa-devel@alsa-project.org>; Sat, 20 Mar 2021 23:16:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D16FF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="izv0gFXZ"
Received: by mail-qk1-x72d.google.com with SMTP id o5so6794047qkb.0
 for <alsa-devel@alsa-project.org>; Sat, 20 Mar 2021 15:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Hd04KDAsAoVDrVE+uWlazOzKpC3XA/RFKS+Mgm3wpmw=;
 b=izv0gFXZvAk9Q6CSBkzd0kTxnkTa76rhfqectkbkVjOrXbA9Ara4WSg2dyjA2/cXmt
 jbqLKnobebnskosV166Uvt/y4Io4Sobxj7MCKwsueEeiDWHteennFOFwj/JzdYX7d0Bu
 o6djyWLHDD6Y73bHe+vhutUJIZCuycVDMNC6mkElDTsWEMTkll0NmhNlXqtGFiVGrR0T
 SsV/uZr7OVAzzyz4fB35n0yrMmjfOVQlMCQ6FjgWlcxGOmHv2hGX+1prjAcnBkDPA1Uv
 Z8l3Ut7Yk6m3WVWOLRamvfzurPcvCdLWpBi22g9R1Bf3QAc4uHDKdu3p8bSuS78xOgX5
 C3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hd04KDAsAoVDrVE+uWlazOzKpC3XA/RFKS+Mgm3wpmw=;
 b=qpE1SrkgJARchCfAIw+EhijY9mtkPGmPvc9U+cfxEq0EEM6nIaa8YPtIHmStGIubbY
 Bd3js90BwM8S7ATZX0lhd2CBKeBUz8Dv+aG/TauoQc//FuDLnj/UJVFHHl5MItG0/a1F
 9se7El/CnY8Xig2j3Pyrk6nqDqXtxMDmdj5oNkNd9EyyiD6jG10lP6omh9SVeOTp6np4
 vr3qGW+82pd0hbKvPFYsBUPH28mN/qAFJYk3iFME7ORaHB9WLVHeQTradNKEKRjQVNW/
 TjA6jMxD/RbE7dRa+lxt040L/AbQTx4BS2UTLDksT0W4Gy1r2PuDRmAlabqi2WjA1LzS
 QAlQ==
X-Gm-Message-State: AOAM531X8pMEdWayb6nU3Y7e4E05zLe+u340WZiwFjsP/Hq4JlKd6McU
 MLJfzodRaLunhnc4F4nbAMM=
X-Google-Smtp-Source: ABdhPJzNmsPAw5Npetn7lsEU78C2q/sjYkDviZYWTzSSfpksjjzxKC/WtEssLP+SHsRTJWlAbkkpNQ==
X-Received: by 2002:a37:ef14:: with SMTP id j20mr4740946qkk.471.1616278595941; 
 Sat, 20 Mar 2021 15:16:35 -0700 (PDT)
Received: from tong-desktop.local ([2601:5c0:c200:27c6:f925:bb4b:54d2:533])
 by smtp.googlemail.com with ESMTPSA id x1sm6223973qtr.97.2021.03.20.15.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 15:16:35 -0700 (PDT)
From: Tong Zhang <ztong0001@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jasmin Fazlic <superfassl@gmail.com>, Leon Romanovsky <leon@kernel.org>,
 Tong Zhang <ztong0001@gmail.com>, Allen Pais <allen.lkml@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Naoki Hayama <naoki.hayama@lineo.co.jp>, Tom Rix <trix@redhat.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Joe Perches <joe@perches.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Romain Perier <romain.perier@gmail.com>
Subject: [PATCH 1/2] ALSA: hdsp: don't disable if not enabled
Date: Sat, 20 Mar 2021 18:16:19 -0400
Message-Id: <20210320221620.226155-2-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210320221620.226155-1-ztong0001@gmail.com>
References: <20210320221620.226155-1-ztong0001@gmail.com>
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

hdsp wants to disable a not enabled pci device, which makes kernel
throw a warning. Make sure the device is enabled before calling disable.

[    1.758292] snd_hdsp 0000:00:03.0: disabling already-disabled device
[    1.758327] WARNING: CPU: 0 PID: 180 at drivers/pci/pci.c:2146 pci_disable_device+0x91/0xb0
[    1.766985] Call Trace:
[    1.767121]  snd_hdsp_card_free+0x94/0xf0 [snd_hdsp]
[    1.767388]  release_card_device+0x4b/0x80 [snd]
[    1.767639]  device_release+0x3b/0xa0
[    1.767838]  kobject_put+0x94/0x1b0
[    1.768027]  put_device+0x13/0x20
[    1.768207]  snd_card_free+0x61/0x90 [snd]
[    1.768430]  snd_hdsp_probe+0x524/0x5e0 [snd_hdsp]

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 sound/pci/rme9652/hdsp.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 4cf879c42dc4..d9879a5bd60e 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -5285,8 +5285,10 @@ static int snd_hdsp_create(struct snd_card *card,
 
 	pci_set_master(hdsp->pci);
 
-	if ((err = pci_request_regions(pci, "hdsp")) < 0)
+	if ((err = pci_request_regions(pci, "hdsp")) < 0) {
+		pci_disable_device(pci);
 		return err;
+	}
 	hdsp->port = pci_resource_start(pci, 0);
 	if ((hdsp->iobase = ioremap(hdsp->port, HDSP_IO_EXTENT)) == NULL) {
 		dev_err(hdsp->card->dev, "unable to remap region 0x%lx-0x%lx\n",
@@ -5387,10 +5389,10 @@ static int snd_hdsp_free(struct hdsp *hdsp)
 	vfree(hdsp->fw_uploaded);
 	iounmap(hdsp->iobase);
 
-	if (hdsp->port)
+	if (hdsp->port) {
 		pci_release_regions(hdsp->pci);
-
-	pci_disable_device(hdsp->pci);
+		pci_disable_device(hdsp->pci);
+	}
 	return 0;
 }
 
-- 
2.25.1

