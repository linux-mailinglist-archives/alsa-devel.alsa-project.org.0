Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0395B2E8B
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 08:12:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 982AA166A;
	Fri,  9 Sep 2022 08:11:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 982AA166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662703957;
	bh=FsLiXpk4irEOiV5Vexi2L/0vbAqUpSS39Or6fubbOA8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Egri1CLBIoEF8bd2B50EV5vah6spcueL3/zYJrNclNNZsccgOmM/bjAlgVsWYonpt
	 Yi4w/9i8Aa4T79Oj5jCdF1HrASeyAA6NeqdUV8y90FJE2YXPVAard+E6imT/NKnhJ/
	 2d1ueQA5/VNpq7GmILXPS4FmBPS3OhtrD8QMB9Lc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE984F80105;
	Fri,  9 Sep 2022 08:11:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5467AF8023A; Fri,  9 Sep 2022 08:11:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D030F80105
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 08:11:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D030F80105
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MP5BY3gM6zmVLx;
 Fri,  9 Sep 2022 14:07:49 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 9 Sep 2022 14:11:26 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <rdunlap@infradead.org>,
 <bunk@kernel.org>, <bunk@stusta.de>, <cuigaosheng1@huawei.com>
Subject: [PATCH] sound: oss: dmasound: remove software_input_volume declaration
Date: Fri, 9 Sep 2022 14:11:26 +0800
Message-ID: <20220909061126.1129585-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

expand_read_bal has been removed since commit fc37449f7959 ("The
next round of scheduled OSS code removal").

software_input_volume has been removed since
commit 0a1b42db4bf9 ("sound: sound/oss/dmasound/: cleanups").

so remove the declare for them from header file.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 sound/oss/dmasound/dmasound.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/oss/dmasound/dmasound.h b/sound/oss/dmasound/dmasound.h
index ad8ce6a1c25c..f065840c0efb 100644
--- a/sound/oss/dmasound/dmasound.h
+++ b/sound/oss/dmasound/dmasound.h
@@ -250,7 +250,4 @@ extern int dmasound_catchRadius;
 #define SW_INPUT_VOLUME_SCALE	4
 #define SW_INPUT_VOLUME_DEFAULT	(128 / SW_INPUT_VOLUME_SCALE)
 
-extern int expand_read_bal;	/* Balance factor for reading */
-extern uint software_input_volume; /* software implemented recording volume! */
-
 #endif /* _dmasound_h_ */
-- 
2.25.1

