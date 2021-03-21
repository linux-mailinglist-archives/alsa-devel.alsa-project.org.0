Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3980E343339
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Mar 2021 16:40:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B8CD1657;
	Sun, 21 Mar 2021 16:39:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B8CD1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616341247;
	bh=vG502NOEITAF4sLR/aA74x9Yz+lfbJB7vWZf0ilCI40=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V6zE8f4I7EbAHkiLqSrPYKuCqAtP9nWlPPJyYpZE02NcNGXgTJ5IpWQ76SojQ+KSO
	 x3yQrxm3mFq09+o8td2QfY1BsD8SzbHRsoAUQQ6yAt2cb7i8KluQiLeyYiuxV+bMYe
	 1ftaEdXwTxQngdmBHGaAgBe+/ztY/bLtsC+Zwsrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A87CEF80155;
	Sun, 21 Mar 2021 16:39:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91B7BF8028D; Sun, 21 Mar 2021 16:39:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9767F80155
 for <alsa-devel@alsa-project.org>; Sun, 21 Mar 2021 16:39:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9767F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pmg0I30u"
Received: by mail-qv1-xf36.google.com with SMTP id cx5so7481505qvb.10
 for <alsa-devel@alsa-project.org>; Sun, 21 Mar 2021 08:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9X8ygzOx9WKWx65WNAliSyrIPfjbfUTPnDnLRdoTlWY=;
 b=pmg0I30uPqhgzXbDwLZhm8U5Vzi67HhzPN4tWIQzDP0BxYcbSXwdsPIjF6PiEhxmr8
 IFVd2uQvX+pCNcO8UkMMrasfH6cu/2Ldr9XV4AXXnPpyWd/KFHZnBtws3V/dY4WYhfHL
 m994GbBQHoRhOeP/ejyZ65RaZAt/F8nNxN0E6QZ2i5m/hlNjO4JZK9mE+PEqcwhSlh4z
 iJLV47sMMqA9ltWHFLGlyGiAtTzgHpIInndQM1drPps4omK6WQJj8pZiaA8kIfSFD/tR
 fiSD0qMESSaFgAbN9c225jcmb2TsWUxWDtlncm8F34EdaZqtyKf3I0OA9ppaE8o+0B3q
 HGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9X8ygzOx9WKWx65WNAliSyrIPfjbfUTPnDnLRdoTlWY=;
 b=PLRW1UNs+qVN4+tTW0VMop0ajI5FuZstdFoX1YUnh/U3/h6rdNjutQJ4m0WOXOonnD
 vScFVN0gC5tLf6u5Ry5E3RERg3tO45fOabvaYmjoe/fZn2VAVjBV2SX+5CSNldsbSq5C
 ZCpXUAwvHtMHg/c4ZsuokP+KuRIX/YqnxFdS6w1QFLsvZLpWVzMNl9pRJe0S1au6qY8M
 3PTBImiGOiUIjKsT7iZVBhuxwBCMDDt0moce3p+QcEA0R7lAvfAcWaHFX8zBoWGKw9eg
 R/lXzA/N+3oygrhwQ8RZFS6MP8Yj7YtQDXwGuiyQNQKN1OuF/iflvtLQzfRM1Yfki0Mf
 2RFg==
X-Gm-Message-State: AOAM533Nuc7bLjOMckSPeKhgPAnEv2STUsr4UUqsgYmi7UMZenohntW5
 X0o+K4kByP1L9brtuilr+1Y=
X-Google-Smtp-Source: ABdhPJw3ztG1UkVxmuLPpK6gzFcH8cTDa6W3nAykc9B9JtywQEHO/5nMZvZX6mjujE6gbFcdjTRD1Q==
X-Received: by 2002:a05:6214:1085:: with SMTP id
 o5mr17702351qvr.5.1616341139235; 
 Sun, 21 Mar 2021 08:38:59 -0700 (PDT)
Received: from tong-desktop.local ([2601:5c0:c200:27c6:f925:bb4b:54d2:533])
 by smtp.googlemail.com with ESMTPSA id y19sm8976317qky.111.2021.03.21.08.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Mar 2021 08:38:58 -0700 (PDT)
From: Tong Zhang <ztong0001@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Tong Zhang <ztong0001@gmail.com>, Jasmin Fazlic <superfassl@gmail.com>,
 Leon Romanovsky <leon@kernel.org>, Romain Perier <romain.perier@gmail.com>,
 Allen Pais <allen.lkml@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Naoki Hayama <naoki.hayama@lineo.co.jp>, Tom Rix <trix@redhat.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Joe Perches <joe@perches.com>
Subject: [PATCH v3 1/3] ALSA: hdsp: don't disable if not enabled
Date: Sun, 21 Mar 2021 11:38:38 -0400
Message-Id: <20210321153840.378226-2-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <s5htup4exbl.wl-tiwai@suse.de>
References: <s5htup4exbl.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>
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

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 sound/pci/rme9652/hdsp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 4cf879c42dc4..720297cbdf87 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -5390,7 +5390,8 @@ static int snd_hdsp_free(struct hdsp *hdsp)
 	if (hdsp->port)
 		pci_release_regions(hdsp->pci);
 
-	pci_disable_device(hdsp->pci);
+	if (pci_is_enabled(hdsp->pci))
+		pci_disable_device(hdsp->pci);
 	return 0;
 }
 
-- 
2.25.1

