Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2582A1A0999
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Apr 2020 10:54:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFF841682;
	Tue,  7 Apr 2020 10:54:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFF841682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586249696;
	bh=/1l92P60JbDeAjh6kyXI41t73UJGIQm2o13kYvnI+H8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TvTuzxeL1FYYfi0DxzUNN9KDMRaUuAnqhOBIypw227iISJs3B8SZOw3YD2WNWAJ1y
	 0/gDGPtl7CDOk7CKFeg/RWFM5WgSCqdBQpLMopv8a5/K935P8DwtbJat0tt2r13z+L
	 n3KhG7BgzASqvUv1vW3KLt9MG+30HdZY5474MIpk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF7D9F8028F;
	Tue,  7 Apr 2020 10:51:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8D98F80213; Tue,  7 Apr 2020 10:31:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F0F5F8011B
 for <alsa-devel@alsa-project.org>; Tue,  7 Apr 2020 10:31:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F0F5F8011B
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4864AD2BEFE15CE959A8;
 Tue,  7 Apr 2020 16:31:05 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Tue, 7 Apr 2020
 16:30:57 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alsa-devel@alsa-project.org>
Subject: [PATCH 0/4] ASoC: fix some compile warnings
Date: Tue, 7 Apr 2020 16:29:28 +0800
Message-ID: <20200407082932.41511-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 07 Apr 2020 10:51:32 +0200
Cc: Jason Yan <yanaijie@huawei.com>
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

Remove some defined but not used symbols to fix the gcc warnings.

Jason Yan (4):
  ASoC: wm8994: remove wm1811_snd_controls and mixin_boost_tlv
  ASoC: wm8991: remove defined but not used
    'wm8991_dapm_rxvoice_controls'
  ASoC: wm8990: remove some defined but unused symbols
  ASoC: wm8900: remove some defined but not used symbols

 sound/soc/codecs/wm8900.c |  6 ---
 sound/soc/codecs/wm8990.c | 98 ---------------------------------------
 sound/soc/codecs/wm8991.c |  8 ----
 sound/soc/codecs/wm8994.c |  8 ----
 4 files changed, 120 deletions(-)

-- 
2.17.2

