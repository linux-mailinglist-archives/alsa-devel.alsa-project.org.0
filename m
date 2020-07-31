Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCBC234C11
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 22:18:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0D2F1687;
	Fri, 31 Jul 2020 22:17:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0D2F1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596226719;
	bh=w289uh70u7ajEvTz/pDzSqb6CeSG3D3M8kJyB1PPhWA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ltmlZ6tTFxl/dldjHSKwrP4Ox5j2XMnvfC5hmMOTnD7g2BYR+G/7vi6fsGpocjtF5
	 Xb0P84B9pvipunkWAz2emSfzIZMMOqbmxJL8zF39m5em0piFFlUb59kRKKPK2sUIzJ
	 MfJkLd3FF/QlxfcRQiIJmejR6+r4dafQHDZh1KwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 140C7F80161;
	Fri, 31 Jul 2020 22:16:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B298F80171; Fri, 31 Jul 2020 22:16:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86C99F8011C
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 22:16:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86C99F8011C
X-IronPort-AV: E=Sophos;i="5.75,419,1589234400"; d="scan'208";a="462075490"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/AES256-SHA256;
 31 Jul 2020 22:16:49 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] ALSA: docs: fix typo
Date: Fri, 31 Jul 2020 21:35:29 +0200
Message-Id: <1596224129-7699-1-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
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

GFP_KRENEL -> GFP_KERNEL

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 Documentation/sound/kernel-api/writing-an-alsa-driver.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index fa49688..aa9d5ab 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -3579,7 +3579,7 @@ dependent on the bus. For normal devices, pass the device pointer
 ``SNDRV_DMA_TYPE_DEV`` type. For the continuous buffer unrelated to the
 bus can be pre-allocated with ``SNDRV_DMA_TYPE_CONTINUOUS`` type.
 You can pass NULL to the device pointer in that case, which is the
-default mode implying to allocate with ``GFP_KRENEL`` flag.
+default mode implying to allocate with ``GFP_KERNEL`` flag.
 If you need a different GFP flag, you can pass it by encoding the flag
 into the device pointer via a special macro
 :c:func:`snd_dma_continuous_data()`.

