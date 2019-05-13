Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C3F1F4F4
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2019 15:02:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5066C16C1;
	Wed, 15 May 2019 15:02:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5066C16C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557925376;
	bh=j7NmOt7wt7xryQc+J040Grq1TXwsmmMstf2MRTLYYzI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lOcxS9aF+eYEjgmSS8ne4kFURVNgUaPLbcPJ8g9gR2UZph/9AdX3hx7a85LfQI4aC
	 BVnH3xxywmdRGMP4yaua4avCJXwiWJoiYeaEwhm/5uEASFIdj6lF23MffaRaawtkoF
	 /6i6EfJ/yDAk1Yr4JvX7G/VM3241yn+AUZ/Q9MQM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD405F896B8;
	Wed, 15 May 2019 15:01:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB900F89684; Mon, 13 May 2019 22:30:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73D41F8072A
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 22:30:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73D41F8072A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="S5QBRMRX"
Received: by mail-ua1-x944.google.com with SMTP id n7so5323252uap.12
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 13:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SJi5lC96vbQ5kIDUFpwE/Nznn3R+YuYl3oTaGEijmGo=;
 b=S5QBRMRX4vmrvpFOpauCjHSowRBDI2/0TAffVvirzFa/nPY24bqEHrREytwdPcvSYN
 o+qQYHgehn8maKl4MddbHnstr3QvNheBiQGW0FxJLIamFX5e4GZmNAzmSEAjiUi/cBqn
 zuolDQMJwm6UZwRAvbc5S6soxCDYxAf87EUPMV+a0IHNiRmAGgsUZAzpPkhdODdIo1x7
 FhR1pMxwwP0sYyhwIlidp5farRaisKDmattJtPtPFKLmlojODZT+la/GZPTMba9fJBMK
 UmqG3y6PtpLCCjnZRcY+TIlU+XIwSe7Yt6XTZjjd+wxGPvFnZDYldTPnpHErwGMRM5du
 YV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SJi5lC96vbQ5kIDUFpwE/Nznn3R+YuYl3oTaGEijmGo=;
 b=pnYJMtP8rvyTqb3LBsvYmXA5N4P08l7lE1/6vpT9qrUlMErJvt0ehIQ3x9gZ8Hc1e+
 FZx9J/5ecfg69hNDW8/sc3rSNeGk+c3Wzaa+LhKI0Ybu5J7PsjRw3MYDCMQGXE5czqdi
 ATQZTPy6eZ36XPRR57LlYWRU37NX1gFFa1l9YRA/6UNiYolbx/H83OyN4XVmYNPBjitK
 RTlHUWDz6ItRRRQ1+6iNixNkdmiA9fGfXqiOkh0i1tGmlhhp/kHs17pLa8tCNuttjaZI
 YigqsbQ12ObG8661tX8C/0hKJKDb+uTcss42qQOT2+wqdK9H0ZlOAGTi0e+ZV0VH0qru
 b8sA==
X-Gm-Message-State: APjAAAW6+vDe+TxLNIFT3kPSfngN1PeP8ovxhxEdjblNMnskR4QcZptP
 tjyMaOWaHnek8EHCMTXZEQ==
X-Google-Smtp-Source: APXvYqxvp+g2jLmI6bVnZkxN8U7wCgP69Ut4cq3E97D7jH4E16GiHN1oRAPx1KXUw3b992Gn8RKZTg==
X-Received: by 2002:ab0:6783:: with SMTP id v3mr14845341uar.8.1557779422261;
 Mon, 13 May 2019 13:30:22 -0700 (PDT)
Received: from localhost.localdomain ([2601:902:c200:6512:37bd:d695:3a39:ceb9])
 by smtp.gmail.com with ESMTPSA id 143sm1285120vkj.44.2019.05.13.13.30.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 13 May 2019 13:30:21 -0700 (PDT)
From: Ayman Bagabas <ayman.bagabas@gmail.com>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kailang Yang <kailang@realtek.com>, Jian-Hong Pan <jian-hong@endlessm.com>,
 Daniel Drake <drake@endlessm.com>, Chris Chiu <chiu@endlessm.com>,
 Hui Wang <hui.wang@canonical.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Date: Mon, 13 May 2019 16:30:04 -0400
Message-Id: <20190513203009.28686-1-ayman.bagabas@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 May 2019 15:01:10 +0200
Cc: ayman.bagabas@gmail.com
Subject: [alsa-devel] [PATCH v1 0/2] Huawei WMI laptop extras driver
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Using the WMI BIOS management interface found on Huawei laptops, extra features
such as micmute LED, charging thresholds, and fn-lock can be controlled.

A platform driver has been implemented along with the existing WMI driver. The
platform driver controls the LED, battery charging thresholds, and fn-lock.

We enable sound micmute hooks to platform driver on Huawei laptops to get the
LED to work.

Ayman Bagabas (2):
  platform/x86: Huawei WMI laptop extras driver update
  sound: Enable micmute led for Huawei laptops

 drivers/platform/x86/Kconfig      |   8 +-
 drivers/platform/x86/huawei-wmi.c | 578 +++++++++++++++++++++++++-----
 sound/pci/hda/patch_realtek.c     |   9 +-
 3 files changed, 504 insertions(+), 91 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
