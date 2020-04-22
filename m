Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B1D1B3914
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 09:38:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CBF916D8;
	Wed, 22 Apr 2020 09:37:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CBF916D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587541109;
	bh=HVQrKtkpadfP4OnKJHfVTyxStAg6KK7fALjXIvRoj3o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RCJSbVO5cRqipIHaNYSrOx0dgACHSLTNvl9SjCBW0rBPtOrCEd9X8fDEFt5e1CEZ1
	 kMw+79p3GoN44hcN99QYO0sNV0Y9BFX6Trm2LNoCyKJjL339GHd8d5+Qofl0NwiHAW
	 6lwT4jV74jQYvcE+5JoiuXAyJjOV/YDviv9CoYMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABCA1F8020C;
	Wed, 22 Apr 2020 09:36:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AB2BF801D9; Wed, 22 Apr 2020 09:36:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E64DDF800F2
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 09:36:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E64DDF800F2
IronPort-SDR: 8yP2a760FFd4+fRB9pp3hvAkRB+MX8w91Gb1On38nLEjn1wkaaeSDvxlnMMZA9WQDm6H815wCN
 tpzfLpDP9jhQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 00:36:37 -0700
IronPort-SDR: +Df1GZqIX6BzgTnln2lNtwlmSbZGLpqIynJLSUWBSCXlbUf0gTW+Fsivufie4VbI/TnnDhQkhw
 WCmBL7Ull+1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,412,1580803200"; d="scan'208";a="456407390"
Received: from shao2-debian.sh.intel.com (HELO localhost) ([10.239.13.3])
 by fmsmga005.fm.intel.com with ESMTP; 22 Apr 2020 00:36:34 -0700
From: Rong Chen <rong.a.chen@intel.com>
To: Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: soc-compress: avoid false-positive Wuninitialized
 warning
Date: Wed, 22 Apr 2020 15:35:43 +0800
Message-Id: <20200422073543.1671-1-rong.a.chen@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <202004201540.vYPhhYMs%lkp@intel.com>
References: <202004201540.vYPhhYMs%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: kbuild test robot <lkp@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rong Chen <rong.a.chen@intel.com>
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

gcc-6.5 and earlier show a new warning:

sound/soc/soc-compress.c: In function ‘soc_compr_open’:
sound/soc/soc-compress.c:75:28: warning: ‘component’ is used uninitialized in this function [-Wuninitialized]
  struct snd_soc_component *component, *save = NULL;
                              ^~~~~~~~~

Simplest fix is to initialize it to avoid the warning.

Reported-by: kbuild test robot <lkp@intel.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/lkml/202004201540.vYPhhYMs%25lkp@intel.com
Signed-off-by: Rong Chen <rong.a.chen@intel.com>
---
 sound/soc/soc-compress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 50062eb79adb..e7bd80ed7f2e 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -72,7 +72,7 @@ static int soc_compr_components_free(struct snd_compr_stream *cstream,
 static int soc_compr_open(struct snd_compr_stream *cstream)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	struct snd_soc_component *component, *save = NULL;
+	struct snd_soc_component *component = NULL, *save = NULL;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	int ret, i;
 
-- 
2.20.1

