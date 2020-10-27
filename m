Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2C329ACB0
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 14:03:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 449FB169E;
	Tue, 27 Oct 2020 14:02:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 449FB169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603803800;
	bh=DYiGl+DcHFfQefsJNOAjURrVwZw9ET3cNJmqeZskTDU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LitrVE0nzTs+5K8gPyWJkKZDiCPyCT7brJjj2CQAmfEUORDzCA4OOty51MNuvtP9A
	 FW4pNVHMtwpNvlK2bKoUDbf3bf/G/mH7vutEw8+KZy/gRPSGbDqfOVCENbiXVFCpNe
	 O2PZnoUrlClenORiryNG7UCxhGe9vQ8M7Mb+upmc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DDAAF8028B;
	Tue, 27 Oct 2020 14:01:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01B0BF80274; Tue, 27 Oct 2020 14:01:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C07FCF80274
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 14:01:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C07FCF80274
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1kXOar-0007iw-OK; Tue, 27 Oct 2020 13:00:54 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com
Subject: [PATCH v3 3/3] ALSA: hda: Reinstate runtime_allow() for all hda
 controllers
Date: Tue, 27 Oct 2020 21:00:38 +0800
Message-Id: <20201027130038.16463-4-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201027130038.16463-1-kai.heng.feng@canonical.com>
References: <20201027130038.16463-1-kai.heng.feng@canonical.com>
Cc: alsa-devel@alsa-project.org, mwolf@adiumentum.com,
 kai.vehmanen@linux.intel.com, linux-kernel@vger.kernel.org,
 hui.wang@canonical.com, Kai-Heng Feng <kai.heng.feng@canonical.com>
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
v3:
 - No change.

v2:
 - No change.

 sound/pci/hda/hda_intel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index be83f1747c5f..d539f52009a1 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2362,6 +2362,7 @@ static int azx_probe_continue(struct azx *chip)
 
 	if (azx_has_pm_runtime(chip)) {
 		pm_runtime_use_autosuspend(&pci->dev);
+		pm_runtime_allow(&pci->dev);
 		pm_runtime_put_autosuspend(&pci->dev);
 	}
 
-- 
2.17.1

