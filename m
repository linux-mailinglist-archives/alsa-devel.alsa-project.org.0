Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 623A642917D
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 16:17:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4842167D;
	Mon, 11 Oct 2021 16:16:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4842167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633961841;
	bh=kYQ+M4tCOriuizacYQJyc9qfuHn+Tq2r/F1x/+k3/HQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BBKexM+mNTb5Uyd6q+7J5C+tXNOsNTb6RBS4nJc/+BsRIcULFy6nlSP6TBGjuGQFN
	 AEArqpKgosC1ngGEfcyoHxa08s2jz8Gc8QbHhcFqbSgrA3hYEE55k+0By2whcehiMc
	 4OsMZmNUJAdfkU1EWVet8mapxXgt4OU/8Dz18VGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36A0CF8028D;
	Mon, 11 Oct 2021 16:16:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16969F80269; Mon, 11 Oct 2021 16:16:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FDF9F80104
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 16:15:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FDF9F80104
X-IronPort-AV: E=McAfee;i="6200,9189,10133"; a="206998721"
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="206998721"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 07:15:36 -0700
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="490493230"
Received: from acleivam-mobl1.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.40.144])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 07:15:33 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org, jack.yu@realtek.com,
 oder_chiou@realtek.com
Subject: [PATCH] ASoC: rt1011: Fix 'I2S Reference' enum control caused error
Date: Mon, 11 Oct 2021 17:15:43 +0300
Message-Id: <20211011141543.31030-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 seppo.ingalsuo@linux.intel.com
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

Access to 'Is@ Reference' enum causes alsamixer to fail to load:
$ alsamixer
cannot load mixer controls: Invalid argument

cml_rt1011_rt5682 cml_rt1011_rt5682: control 2:0:0:TL I2S Reference:0: access overflow

The reason is that the original patch adding the code was using
ucontrol->value.integer.value[0]
instead the correct
ucontrol->value.enumerated.item[0]

for an ENUM control.

Fixes: 87f40af26c262 ("ASoC: rt1011: add i2s reference control for rt1011")
Reported-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/codecs/rt1011.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index 508597866dff..3adaff6f0141 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -1325,7 +1325,7 @@ static int rt1011_i2s_ref_put(struct snd_kcontrol *kcontrol,
 		snd_soc_kcontrol_component(kcontrol);
 	struct rt1011_priv *rt1011 =
 		snd_soc_component_get_drvdata(component);
-	int i2s_ref_ch = ucontrol->value.integer.value[0];
+	int i2s_ref_ch = ucontrol->value.enumerated.item[0];
 
 	switch (i2s_ref_ch) {
 	case RT1011_I2S_REF_LEFT_CH:
@@ -1344,7 +1344,7 @@ static int rt1011_i2s_ref_put(struct snd_kcontrol *kcontrol,
 		dev_info(component->dev, "I2S Reference: Do nothing\n");
 	}
 
-	rt1011->i2s_ref = ucontrol->value.integer.value[0];
+	rt1011->i2s_ref = ucontrol->value.enumerated.item[0];
 
 	return 0;
 }
@@ -1357,7 +1357,7 @@ static int rt1011_i2s_ref_get(struct snd_kcontrol *kcontrol,
 	struct rt1011_priv *rt1011 =
 		snd_soc_component_get_drvdata(component);
 
-	ucontrol->value.integer.value[0] = rt1011->i2s_ref;
+	ucontrol->value.enumerated.item[0] = rt1011->i2s_ref;
 
 	return 0;
 }
-- 
2.33.0

