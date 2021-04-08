Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA35B357C88
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 08:23:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A99F169C;
	Thu,  8 Apr 2021 08:22:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A99F169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617863026;
	bh=NxtNwuNg9lkl1rdmrbn1aw/FiK4B2u1WdAGaqp80P2o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Jz+qEbiEQgxrQ+GoiJ7584eAVedfuegEwrPT4fN6zS3NkvnL0esVEjSeJmRGn2FlB
	 dlILTrQN2xBunAbMb0ycxzKOq8XSK1l8xjvaf/8IXmi0SsTGJcWjusLo0oJnBzhIXX
	 TjvkGasbMcZkYk7UaHIxmzIM5lIib9Q5GtWDpxj8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBCDFF804EC;
	Thu,  8 Apr 2021 08:18:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E7F5F80431; Thu,  8 Apr 2021 08:18:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 769E0F8020B
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 08:18:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 769E0F8020B
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FG9xH4JxQzPp06;
 Thu,  8 Apr 2021 14:15:47 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Thu, 8 Apr 2021
 14:18:26 +0800
From: Ye Bin <yebin10@huawei.com>
To: <yebin10@huawei.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Liam Girdwood
 <liam.r.girdwood@linux.intel.com>, Jie Yang <yang.jie@linux.intel.com>,
 "Mark Brown" <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>, 
 "Sia Jee Heng" <jee.heng.sia@intel.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH -next] ASoC: Intel: KMB: Constify static struct snd_soc_dai_ops
Date: Thu, 8 Apr 2021 14:26:53 +0800
Message-ID: <20210408062653.803478-1-yebin10@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Cc: Hulk Robot <hulkci@huawei.com>, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

The snd_soc_dai_ops structures is only stored in the ops field of a
snd_soc_dai_driver structure, so make the snd_soc_dai_ops structure
const to allow the compiler to put it in read-only memory.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 sound/soc/intel/keembay/kmb_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/keembay/kmb_platform.c b/sound/soc/intel/keembay/kmb_platform.c
index 0fd1e8f62c89..ef73392f8cff 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -729,7 +729,7 @@ static int kmb_dai_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_dai_ops kmb_dai_ops = {
+static const struct snd_soc_dai_ops kmb_dai_ops = {
 	.startup	= kmb_dai_startup,
 	.trigger	= kmb_dai_trigger,
 	.hw_params	= kmb_dai_hw_params,

