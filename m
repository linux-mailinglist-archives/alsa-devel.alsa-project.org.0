Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BB729A445
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 06:42:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D816C16BD;
	Tue, 27 Oct 2020 06:42:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D816C16BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603777375;
	bh=DHX+kZFJYiy5AO9WJGG+34aE8DUTlzvoBkcRs1DvDP8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cb0TGUt5o6nO1PHuVVHbaKpXuJHOvVgWxFgMDxiUJQESzGr45ALcBkcXgkROv50hM
	 3mAGbaTfekx4fLH2oqgoQu3SZZXujEeskIf1l8aoG1sL1udPyd1FJ5xFmvJzCzMUvt
	 X/0O25yIC/YC49Ked8lR0KphY6zQoHy3cOWrSKGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 273A1F804B4;
	Tue, 27 Oct 2020 06:40:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E8E4F804BC; Tue, 27 Oct 2020 06:40:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3E93F804B3
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 06:40:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3E93F804B3
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1kXHib-0002eA-1D; Tue, 27 Oct 2020 05:40:25 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com
Subject: [PATCH v2 4/4] ALSA: hda: Reinstate runtime_allow() for all hda
 controllers
Date: Tue, 27 Oct 2020 13:40:01 +0800
Message-Id: <20201027054001.1800-5-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201027054001.1800-1-kai.heng.feng@canonical.com>
References: <20201027054001.1800-1-kai.heng.feng@canonical.com>
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 linux-kernel@vger.kernel.org, hui.wang@canonical.com,
 Kai-Heng Feng <kai.heng.feng@canonical.com>
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

The broken jack detection should be fixed by commit a6e7d0a4bdb0 ("ALSA:
hda: fix jack detection with Realtek codecs when in D3"), let's try
enabling runtime PM by default again.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v2:
 - No change.

 sound/pci/hda/hda_intel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 4cf90e4602c7..573250d2c6c9 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2350,6 +2350,7 @@ static int azx_probe_continue(struct azx *chip)
 
 	if (azx_has_pm_runtime(chip)) {
 		pm_runtime_use_autosuspend(&pci->dev);
+		pm_runtime_allow(&pci->dev);
 		pm_runtime_put_autosuspend(&pci->dev);
 	}
 
-- 
2.17.1

