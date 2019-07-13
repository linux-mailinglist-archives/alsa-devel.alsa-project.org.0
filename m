Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2878D67804
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Jul 2019 05:50:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87EFF166B;
	Sat, 13 Jul 2019 05:49:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87EFF166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562989817;
	bh=Uluj1wyxRwpOp5uvIv5cjpvZnqnQd+w1c0Zbd+5VXTo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bv7qPrkT5zqm9Sgcho5MsyMreP4GiX1QRLxLPtSWyBffhqRhwN+W0hsInIKlJXWxp
	 8Kphnt3LjgOgiFstLDdmR3iVULSj+dIE0n8GkXwX9PY/b4MhjFjCGc5A/ZRLRn8dBh
	 JkRAQYrQxnWCt0qsNinsLcLMzpD9Ryb1ayPlTu4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC1B5F80271;
	Sat, 13 Jul 2019 05:48:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 239E1F802E0; Sat, 13 Jul 2019 05:48:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mxct.zte.com.cn (mx7.zte.com.cn [202.103.147.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 849C3F80271
 for <alsa-devel@alsa-project.org>; Sat, 13 Jul 2019 05:48:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 849C3F80271
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
 by Forcepoint Email with ESMTPS id 96F1C5590DB330C4950E;
 Sat, 13 Jul 2019 11:48:23 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
 by mse-fl2.zte.com.cn with ESMTP id x6D3m9H7088082;
 Sat, 13 Jul 2019 11:48:09 +0800 (GMT-8)
 (envelope-from wen.yang99@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2019071311485168-2322079 ;
 Sat, 13 Jul 2019 11:48:51 +0800 
From: Wen Yang <wen.yang99@zte.com.cn>
To: krzk@kernel.org
Date: Sat, 13 Jul 2019 11:46:13 +0800
Message-Id: <1562989575-33785-1-git-send-email-wen.yang99@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2019-07-13 11:48:51,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-07-13 11:48:15, Serialize complete at 2019-07-13 11:48:15
X-MAIL: mse-fl2.zte.com.cn x6D3m9H7088082
Cc: wang.yi59@zte.com.cn, alsa-devel@alsa-project.org, xue.zhihong@zte.com.cn,
 sbkim73@samsung.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, s.nawrocki@samsung.com,
 cheng.shengyu@zte.com.cn, Wen Yang <wen.yang99@zte.com.cn>
Subject: [alsa-devel] [PATCH 0/2] ASoC: samsung: odroid: fix err handling of
	odroid_audio_probe
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

We developed a coccinelle SmPL to detect sound/soc/samsung/odroid.c and
found some use-after-free problems.
This patch series fixes those problems.

Wen Yang (2):
  ASoC: samsung: odroid: fix an use-after-free issue for codec
  ASoC: samsung: odroid: fix a double-free issue for cpu_dai

 sound/soc/samsung/odroid.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org

-- 
2.9.5

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
