Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2039357C81
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 08:22:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 682F91688;
	Thu,  8 Apr 2021 08:21:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 682F91688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617862943;
	bh=2VJloWMPrSOKSQudZ1kfjXSHkmeJXrjpviyls7kF08I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IxVqV0Vhlypl+nG+pPAPLEjE5aQrx08kUGIcAod65CqS6HDCmtXj5NA6LX/D5cLKu
	 XXjS/YUImAypWlqj2j/pk+ZGBMCEuGzHwV2xwutAmjCMLc3k1Pl/u73HdZvMlG4CvK
	 bNMAQczS6IWzZVx7Iu2CJ6KMZo+3mSJ2HhqbMH80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13C7CF804E0;
	Thu,  8 Apr 2021 08:18:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEF9DF80482; Thu,  8 Apr 2021 08:18:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E9C0F80249
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 08:18:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E9C0F80249
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FG9x76b11zPnxZ;
 Thu,  8 Apr 2021 14:15:39 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.498.0; Thu, 8 Apr 2021
 14:18:19 +0800
From: Ye Bin <yebin10@huawei.com>
To: <yebin10@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Dan Murphy <dmurphy@ti.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Alexander A.
 Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH -next] ASoC: tas2770: Constify static struct snd_soc_dai_ops
Date: Thu, 8 Apr 2021 14:26:46 +0800
Message-ID: <20210408062646.803053-1-yebin10@huawei.com>
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
 sound/soc/codecs/tas2770.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 781bf9cc4faa..172e79cbe0da 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -464,7 +464,7 @@ static int tas2770_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 
-static struct snd_soc_dai_ops tas2770_dai_ops = {
+static const struct snd_soc_dai_ops tas2770_dai_ops = {
 	.mute_stream = tas2770_mute,
 	.hw_params  = tas2770_hw_params,
 	.set_fmt    = tas2770_set_fmt,

