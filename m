Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FE759B823
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 05:52:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC96D84C;
	Mon, 22 Aug 2022 05:51:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC96D84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661140369;
	bh=j8OvgWmcrFibsG0XIQWAcCzkX1S0PPb3wSI80VCRg10=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QRS02axDl4sWwyEiRITijwA8ZKHI+EXcNZNqhaSesMq2uUpAoMVMxZ6QTuc73jAw8
	 d1TRA7ii/9dzj10c6NeWrJVeeToi5LBNix5r0gFww0tm4fYycakfqnEVy1pz8doi01
	 JC2TN+uwLG9RjQkJ5t8CAN5H1Gakxa789qsk99eU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EC32F8026D;
	Mon, 22 Aug 2022 05:51:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82FB1F8026A; Mon, 22 Aug 2022 05:51:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D0CAF800ED
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 05:51:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D0CAF800ED
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4M9yy01ctMzlWGb;
 Mon, 22 Aug 2022 11:48:24 +0800 (CST)
Received: from dggphis33418.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 22 Aug 2022 11:51:34 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <cezary.rojewski@intel.com>, <pierre-louis.bossart@linux.intel.com>,
 <liam.r.girdwood@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
 <yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
 <kai.vehmanen@linux.intel.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <cuigaosheng1@huawei.com>
Subject: [PATCH -next] ASoC: Intel: fix unused-variable warning in probe_codec
Date: Mon, 22 Aug 2022 11:51:33 +0800
Message-ID: <20220822035133.2147381-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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

In configurations with CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC=n,
gcc warns about an unused variable:

sound/soc/intel/skylake/skl.c: In function ‘probe_codec’:
sound/soc/intel/skylake/skl.c:729:18: error: unused variable ‘skl’ [-Werror=unused-variable]
  struct skl_dev *skl = bus_to_skl(bus);
                  ^~~
cc1: all warnings being treated as errors

Fixes: 3fd63658caed9 ("ASoC: Intel: Drop hdac_ext usage for codec device creation")
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 sound/soc/intel/skylake/skl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index c7c1cad2a753..52a041d6144c 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -726,8 +726,8 @@ static int probe_codec(struct hdac_bus *bus, int addr)
 	unsigned int cmd = (addr << 28) | (AC_NODE_ROOT << 20) |
 		(AC_VERB_PARAMETERS << 8) | AC_PAR_VENDOR_ID;
 	unsigned int res = -1;
-	struct skl_dev *skl = bus_to_skl(bus);
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC)
+	struct skl_dev *skl = bus_to_skl(bus);
 	struct hdac_hda_priv *hda_codec;
 #endif
 	struct hda_codec *codec;
-- 
2.25.1

