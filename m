Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13657342FDB
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Mar 2021 23:25:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2BF210E;
	Sat, 20 Mar 2021 23:24:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2BF210E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616279140;
	bh=WThy46y05IMN3kwEKDzuMtpW35OgqrDGx6DoolEj8oU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G7L15bUJvYnH8io0RggF3LZxYCo53gLV2YFtyWpfZ3IJDyxB1E7Xge55Rq6+6i9K9
	 T9Xq1h6DHJfDh+Jz3nO5eI94nvc4XikvHzFGya4aYkfPNhGRifnjFQ1/DBuQ7EPQQa
	 57yETDucrP4OxS0NIEsvyAVBQPAqCNFbfdm8kRpA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FB07F80224;
	Sat, 20 Mar 2021 23:24:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1AEAF8023B; Sat, 20 Mar 2021 23:24:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F175EF80171
 for <alsa-devel@alsa-project.org>; Sat, 20 Mar 2021 23:23:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F175EF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kHwHrADJ"
Received: by mail-qk1-x735.google.com with SMTP id g20so6816350qkk.1
 for <alsa-devel@alsa-project.org>; Sat, 20 Mar 2021 15:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Hd04KDAsAoVDrVE+uWlazOzKpC3XA/RFKS+Mgm3wpmw=;
 b=kHwHrADJ1T8h9/lq7AZ3fi5FcBUS49ffIuFHnfIrC7p4Gxa3HhzTyWTez/FcxmKsPD
 E8rVBSu0x+av/SUccLsOzs6u0hig1OpFaOoAaE0GhFUX8TpisaumLGcYL4un5hHN0rZt
 zY00cXr7eXQ+D1WwCd/7KCTw4AICVBKTFQhnYOhelyk7IkdVdmrUH/tvTGvfLt/Or3E4
 iCUECbUg7OhW9RwAZI4BPCBncfbo7LtGOnAzLdNcNwWKqVmt/+bflYqwB/v8tgfxzhyD
 KUp8gdAgKlgmUbwGjffjMFCJZsPTzSbJmxdGHrY3M67IUDj4Q1TPcvOOHq1iHFDidU+P
 nepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hd04KDAsAoVDrVE+uWlazOzKpC3XA/RFKS+Mgm3wpmw=;
 b=ml/DDRe6ocA1UjHP+moQ4dpWYU2siX5y1fDZ4pqTD8Ahg0VoGSZSLvsfPv4AP/YHsl
 GzgTrCU0hkBez5M6unC5auozVDzY4IiUrW0Sdf5CbaKvfFi5aVQWDXEEqjq1MNm7hL0x
 +wBBKe2x36I2sGcL4xqVoJME6iN8Cb02za9jiaji3pu/zEM/5quwjz2I6d0+nzwmh3MS
 J36yYMw2VutHn5cKony7RrZR31g9ju+LhPAtmuWntoUDWBpj8ZvWzv5Q426pASiwWhHo
 REDHLcxDwZba555HwPOG1CTus6rqYigXOkeu8mdTkPdRaC4vFYxK/czjISRNQidWh44O
 igyA==
X-Gm-Message-State: AOAM533MzdgqU0ZnbRNG7O9jS1qRiNfWLlRzLu+r4Dh5Ekln7F6vCYfw
 9GZJ4xYhTDkFQKPbILgoORw=
X-Google-Smtp-Source: ABdhPJxSFtHpaAFOdOQkiJTHu8MClNtatv3LhSMMPVsWx7Gcma3AGIv4neNWLdkWfNOsKGcA44iIMg==
X-Received: by 2002:a05:620a:4152:: with SMTP id
 k18mr4652122qko.446.1616279032069; 
 Sat, 20 Mar 2021 15:23:52 -0700 (PDT)
Received: from tong-desktop.local ([2601:5c0:c200:27c6:f925:bb4b:54d2:533])
 by smtp.googlemail.com with ESMTPSA id i6sm7570213qkk.31.2021.03.20.15.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 15:23:51 -0700 (PDT)
From: Tong Zhang <ztong0001@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Romain Perier <romain.perier@gmail.com>, Allen Pais <allen.lkml@gmail.com>,
 Leon Romanovsky <leon@kernel.org>, Jasmin Fazlic <superfassl@gmail.com>,
 Tong Zhang <ztong0001@gmail.com>, Mark Brown <broonie@kernel.org>,
 Joe Perches <joe@perches.com>, Tom Rix <trix@redhat.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Naoki Hayama <naoki.hayama@lineo.co.jp>
Subject: [PATCH v2 1/3] ALSA: hdsp: don't disable if not enabled
Date: Sat, 20 Mar 2021 18:23:34 -0400
Message-Id: <20210320222337.243368-2-ztong0001@gmail.com>
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

