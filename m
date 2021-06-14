Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D1C3A5D94
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jun 2021 09:18:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E09F17B0;
	Mon, 14 Jun 2021 09:18:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E09F17B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623655136;
	bh=BkbrjUmJgVHs4GQp+xbD8zMisN63RHIv11Bs2ads8J0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r49Fx2OqdcJtNFzsdkbgq38WQvoOqzH7w+xjEegYZD9wDPGyKQpTQBKDPNudF8BcK
	 ra0Uv0mga/TaS+X4IQCVmopEGx56g4IAlHk0hUSSfBwr/2kefnmr9oLuMsNZR7bZRg
	 AaplSfdsqrumk1t2SxU5fII52v6IKHGUJnZ0ZLnY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21D02F80234;
	Mon, 14 Jun 2021 09:18:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CD2CF80273; Mon, 14 Jun 2021 09:18:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 491DBF800F7
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 09:17:56 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id E3028A003F;
 Mon, 14 Jun 2021 09:17:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz E3028A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1623655075; bh=XFMAbc3ingAh0d40kJ4nWlArt1RP++I45Xd6XRUn9LY=;
 h=From:To:Cc:Subject:Date:From;
 b=CdBHLTaGR55CR2dhmGL8Bmgg/Aos0QNUDwhFtqIpbkTxRYB++PHQSwL9cHK5Dep/U
 X00JOWs3iiNdi/w5+pcNkelar/G5Ga5tPrJeD9ePqI35ZkN/piGSBca4lJcrPS6KfN
 oQM7GrYuASCZSy8qBRPWpaNXVNKVA8SUP23MjO2s=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 14 Jun 2021 09:17:50 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: soc-pcm: fix the return value in dpcm_apply_symmetry()
Date: Mon, 14 Jun 2021 09:17:46 +0200
Message-Id: <20210614071746.1787072-1-perex@perex.cz>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

In case, where the loops are not executed for a reason, the uninitialized
variable 'err' is returned to the caller. Make code fully predictible
and assign zero in the declaration.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Cc: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 8659089a87a0..46513bb97904 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1700,7 +1700,7 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
 	struct snd_soc_dpcm *dpcm;
 	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(fe_substream);
 	struct snd_soc_dai *fe_cpu_dai;
-	int err;
+	int err = 0;
 	int i;
 
 	/* apply symmetry for FE */
-- 
2.30.2
