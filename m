Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2659F429263
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 16:43:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDE80167D;
	Mon, 11 Oct 2021 16:42:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDE80167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633963401;
	bh=Dxu26iWJ/ezkEAnM1vwaWngmgn0QbO18+CTfEae6TTY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TNvzG3wHBhUyohjf9Rv8b7pIA2rgYySQ5WKiULjCBo2NHiDBy36J2DIZjae1dy/Y2
	 FRWwMa5r/zsre0M06YSgVeZMrqky1EqrMaJM0vlDNHd0N2LpTdBY9cpJ27lYHWq+Xc
	 gtWJgzs0TXLb18jJsnKRm+y9xdknJZ4IOa7ePOtU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B15AF8028D;
	Mon, 11 Oct 2021 16:42:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BAB8F80269; Mon, 11 Oct 2021 16:42:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFC82F800C0
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 16:41:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFC82F800C0
X-IronPort-AV: E=McAfee;i="6200,9189,10133"; a="313089377"
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="313089377"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 07:41:35 -0700
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="490504133"
Received: from acleivam-mobl1.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.40.144])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 07:41:33 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org, jack.yu@realtek.com,
 oder_chiou@realtek.com
Subject: [PATCH v2] ASoC: rt1011: Fix 'I2S Reference' enum control caused error
Date: Mon, 11 Oct 2021 17:41:43 +0300
Message-Id: <20211011144143.1662-1-peter.ujfalusi@linux.intel.com>
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
Hi,

Changes since v1:
- Correct the ENUM declaration as well

Regards,
Peter

 sound/soc/codecs/rt1011.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index 508597866dff..bdfcbb81fa19 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -1311,12 +1311,11 @@ static int rt1011_r0_load_info(struct snd_kcontrol *kcontrol,
 	.put = rt1011_r0_load_mode_put \
 }
 
-static const char * const rt1011_i2s_ref[] = {
+static const char * const rt1011_i2s_ref_texts[] = {
 	"None", "Left Channel", "Right Channel"
 };
 
-static SOC_ENUM_SINGLE_DECL(rt1011_i2s_ref_enum, 0, 0,
-	rt1011_i2s_ref);
+static SOC_ENUM_SINGLE_EXT_DECL(rt1011_i2s_ref_enum, rt1011_i2s_ref_texts);
 
 static int rt1011_i2s_ref_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
@@ -1325,7 +1324,7 @@ static int rt1011_i2s_ref_put(struct snd_kcontrol *kcontrol,
 		snd_soc_kcontrol_component(kcontrol);
 	struct rt1011_priv *rt1011 =
 		snd_soc_component_get_drvdata(component);
-	int i2s_ref_ch = ucontrol->value.integer.value[0];
+	int i2s_ref_ch = ucontrol->value.enumerated.item[0];
 
 	switch (i2s_ref_ch) {
 	case RT1011_I2S_REF_LEFT_CH:
@@ -1344,7 +1343,7 @@ static int rt1011_i2s_ref_put(struct snd_kcontrol *kcontrol,
 		dev_info(component->dev, "I2S Reference: Do nothing\n");
 	}
 
-	rt1011->i2s_ref = ucontrol->value.integer.value[0];
+	rt1011->i2s_ref = ucontrol->value.enumerated.item[0];
 
 	return 0;
 }
@@ -1357,7 +1356,7 @@ static int rt1011_i2s_ref_get(struct snd_kcontrol *kcontrol,
 	struct rt1011_priv *rt1011 =
 		snd_soc_component_get_drvdata(component);
 
-	ucontrol->value.integer.value[0] = rt1011->i2s_ref;
+	ucontrol->value.enumerated.item[0] = rt1011->i2s_ref;
 
 	return 0;
 }
-- 
2.33.0

