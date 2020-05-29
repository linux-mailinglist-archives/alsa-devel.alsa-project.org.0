Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF851E7D40
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 14:31:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A74516BC;
	Fri, 29 May 2020 14:30:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A74516BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590755480;
	bh=vXKgcKQ3VbOwPAiItOzLM2wwZpavU6Lj2xH1O7qNplY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DdFDljtl3E26Qjtk6vDItwVCXszgLTKxv/LpLd3Ia5ApVlibcqEnY3+1zp2MLqfo8
	 XCBkrLCgENtSdctXiPfCePSB581GTwG9zKPeG9czt4yAC9eaM+LboKuypXhe7XwvR4
	 0APvXpLm9hAPrD5wZH7ayukRfIB84DqvxJEKhOvI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FE0BF80290;
	Fri, 29 May 2020 14:28:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4842F80227; Fri, 29 May 2020 14:28:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8297F80107
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 14:28:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8297F80107
IronPort-SDR: sw6bmpwyIN2IVAIzp8fiqOThEBAmGLj73NptzkWZ8YDplXnsOC43F7FMXFP+cq7Bh4cuu/j2PT
 RvCKDACWaKYw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 05:28:25 -0700
IronPort-SDR: KbxoTM9RwstSf7PN/RfQ0ujhgeAIpproeH86Vz/uo9vODa6vAvAvPzQiAA7GMYxtinyPPdY3CN
 nZGz2kx+a0JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,448,1583222400"; d="scan'208";a="469491468"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga006.fm.intel.com with ESMTP; 29 May 2020 05:28:24 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	perex@perex.cz
Subject: [PATCH 2/2] pcm: fix spelling in documentation for -EBADFD
Date: Fri, 29 May 2020 15:28:17 +0300
Message-Id: <20200529122817.1198-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200529122817.1198-1-kai.vehmanen@linux.intel.com>
References: <20200529122817.1198-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com
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

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 src/pcm/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/pcm/pcm.c b/src/pcm/pcm.c
index 488a8dd0493d..79322b4eab0d 100644
--- a/src/pcm/pcm.c
+++ b/src/pcm/pcm.c
@@ -284,7 +284,7 @@ supports resume and the snd_pcm_prepare() call can be ommited.
 \par -EBADFD
 
 This error means that the device is in a bad state. It means that
-the handskahe between application and alsa-lib is corrupted.
+the handshake between application and alsa-lib is corrupted.
 
 \par -ENOTTY, -ENODEV
 
-- 
2.26.2

