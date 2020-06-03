Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C93791EC80E
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 05:53:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 744C3167D;
	Wed,  3 Jun 2020 05:52:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 744C3167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591156428;
	bh=510Aet9W3d+VExnUCtDHBKtRWr9rmHDgxOfHNdKLduA=;
	h=From:To:Subject:Date:In-Reply-To:References:In-Reply-To:
	 References:Cc:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From;
	b=TOepa4hOH+Ilg8G/69TvxG3LQdiMLkbmwlKq2xMx6sC1EdlyAus6gkJub+EJwDOZy
	 nb9DQdE2pBOLj+Mes5moxNt91rQmUTkflT7SzoOhZFz/xfqh+nWwXHwT7G5UjQSQ75
	 YdgxY4Qu2qogfIpeZESJGHi3VQrxkak2Sotz+dKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C083F802BC;
	Wed,  3 Jun 2020 05:50:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FB79F801F5; Wed,  3 Jun 2020 05:50:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5050EF801F5
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 05:50:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5050EF801F5
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F3CCF1A0054;
 Wed,  3 Jun 2020 05:50:16 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7304E1A0F20;
 Wed,  3 Jun 2020 05:50:12 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 9461840323;
 Wed,  3 Jun 2020 11:50:06 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 3/3] ASoC: fsl_easrc: Fix "Function parameter not described"
 warnings
Date: Wed,  3 Jun 2020 11:39:41 +0800
Message-Id: <d166b868e6d294de47a89857be03758ec82a0a61.1591155860.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1591155860.git.shengjiu.wang@nxp.com>
References: <cover.1591155860.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1591155860.git.shengjiu.wang@nxp.com>
References: <cover.1591155860.git.shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

Obtained with:
$ make W=1

sound/soc/fsl/fsl_easrc.c:403: warning: Function parameter or member 'easrc' not described in 'fsl_easrc_normalize_filter'
sound/soc/fsl/fsl_easrc.c:403: warning: Function parameter or member 'infilter' not described in 'fsl_easrc_normalize_filter'
sound/soc/fsl/fsl_easrc.c:403: warning: Function parameter or member 'outfilter' not described in 'fsl_easrc_normalize_filter'
sound/soc/fsl/fsl_easrc.c:403: warning: Function parameter or member 'shift' not described in 'fsl_easrc_normalize_filter'

Fixes: 955ac624058f ("ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reported-by: kbuild test robot <lkp@intel.com>
---
 sound/soc/fsl/fsl_easrc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index 7d8bf9d47842..2f6b3d8bfcfc 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -389,11 +389,11 @@ static int fsl_easrc_resampler_config(struct fsl_asrc *easrc)
  *  For input int[16, 24, 32] -> output float32
  *      scale it by multiplying filter coefficients by 2^-15, 2^-23, 2^-31
  *  input:
- *      asrc:  Structure pointer of fsl_asrc
- *      infilter : Pointer to non-scaled input filter
- *      shift:  The multiply factor
+ *      @easrc:  Structure pointer of fsl_asrc
+ *      @infilter : Pointer to non-scaled input filter
+ *      @shift:  The multiply factor
  *  output:
- *      outfilter: scaled filter
+ *      @outfilter: scaled filter
  */
 static int fsl_easrc_normalize_filter(struct fsl_asrc *easrc,
 				      u64 *infilter,
-- 
2.21.0

