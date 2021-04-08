Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F09F7357C94
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 08:25:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DFAD16E3;
	Thu,  8 Apr 2021 08:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DFAD16E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617863116;
	bh=6/37HwBkYC6gaNbmQf3AcppWTtbJVg6FWHFuBGSFhfo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QDor/uoZMJJJLxF0bSxuvBwf+sT442gwbBXvDbbYBhhQO0IakCFCcGpRgISwfEpzb
	 CMLSEJNJkuRrB8dqqx7D6z7HYU4gP/6vyet0QuuRUtzbUXfrIItmmXp8456nyU3d+k
	 D1dHuc4BzBjOBP3epy+YSYgS9JFXg4iIQbmpxcW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15529F8051A;
	Thu,  8 Apr 2021 08:19:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FE75F804E7; Thu,  8 Apr 2021 08:18:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0902F80246
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 08:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0902F80246
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FG9yX307qzkjRZ;
 Thu,  8 Apr 2021 14:16:52 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.498.0; Thu, 8 Apr 2021
 14:18:29 +0800
From: Ye Bin <yebin10@huawei.com>
To: <yebin10@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH -next] ASoC: cx2072x: constify static struct snd_soc_dai_ops
Date: Thu, 8 Apr 2021 14:26:56 +0800
Message-ID: <20210408062656.803606-1-yebin10@huawei.com>
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
 sound/soc/codecs/cx2072x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index d924e3528029..1f5c57fab1d8 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -1532,7 +1532,7 @@ static const struct snd_soc_component_driver soc_codec_driver_cx2072x = {
 /*
  * DAI ops
  */
-static struct snd_soc_dai_ops cx2072x_dai_ops = {
+static const struct snd_soc_dai_ops cx2072x_dai_ops = {
 	.set_sysclk = cx2072x_set_dai_sysclk,
 	.set_fmt = cx2072x_set_dai_fmt,
 	.hw_params = cx2072x_hw_params,

