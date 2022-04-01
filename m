Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 085CD4EECCE
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Apr 2022 14:04:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C1081A96;
	Fri,  1 Apr 2022 14:03:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C1081A96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648814671;
	bh=V3YojHJ4DWu84JPOUeY8mI9OsmqDQFACcrT4QTa4Kcc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OK8C3LPoXfqAvPUqNq2AEEsOMBsjSTgKuzVoYIV8LMtp9nO/H4zQnQMSt9AeisC5G
	 uxmIHG5qASM9dQbUjtsfVZj0AL4WADPbX4/AmfBORWLAZCKO8kqvt0Hmc+VBO7NYr8
	 qADbLlqllsFb5HeOvP+IyZ+CmJOl+tuGuQ27eP/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC772F80529;
	Fri,  1 Apr 2022 14:02:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 821F7F80526; Fri,  1 Apr 2022 14:02:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADC10F80519
 for <alsa-devel@alsa-project.org>; Fri,  1 Apr 2022 14:02:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADC10F80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TN2s/0b9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648814543; x=1680350543;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V3YojHJ4DWu84JPOUeY8mI9OsmqDQFACcrT4QTa4Kcc=;
 b=TN2s/0b9cLq7uA7KzeOmjV0bqAi5AdbpRqJkIxRZA1uvwf7Jth7Xyzxk
 MUmQ71obVa5RJgGyO1FitPcMIAkk9La67qWgKru3e1o9GIM038MtSKG0r
 RgGdxDgh8BtT0n0GmUxPE0yoxg2UuK2CqiC1x0phMk+9Do5G3hbbjH387
 A++KZ1eRpcUcl+7sSeLU3kAK3N3o86PjfofA0gKLt7XZHrFigGxzgMHH5
 VCjSRjfTug79FPDtIH7gM2v0FBM/lWjMN3rlvsC7aHh3sb8l+7Neqk8KS
 wspg0q3taplQ9d+dpNRgxGVa6Baen+ccM7l4Z2dBAU/NuBtmBiXPuOWRX A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="258945874"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="258945874"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 05:02:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="567432042"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga008.jf.intel.com with ESMTP; 01 Apr 2022 05:02:14 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 4/6] ASoC: topology: Rename SOC_TPLG_PASS_MIXER to _CONTROL
Date: Fri,  1 Apr 2022 14:01:58 +0200
Message-Id: <20220401120200.4047867-5-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220401120200.4047867-1-amadeuszx.slawinski@linux.intel.com>
References: <20220401120200.4047867-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

Name of SOC_TPLG_PASS_MIXER pass is bit confusing, suggesting that it
may only apply to mixers. As it is used for all control types, change
name to SOC_TPLG_PASS_CONTROL.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index f8e482d616fb..4e7dabcd69a4 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -40,7 +40,7 @@
  */
 #define SOC_TPLG_PASS_MANIFEST		0
 #define SOC_TPLG_PASS_VENDOR		1
-#define SOC_TPLG_PASS_MIXER		2
+#define SOC_TPLG_PASS_CONTROL		2
 #define SOC_TPLG_PASS_WIDGET		3
 #define SOC_TPLG_PASS_PCM_DAI		4
 #define SOC_TPLG_PASS_GRAPH		5
@@ -360,7 +360,7 @@ static void remove_mixer(struct snd_soc_component *comp,
 {
 	struct snd_card *card = comp->card->snd_card;
 
-	if (pass != SOC_TPLG_PASS_MIXER)
+	if (pass != SOC_TPLG_PASS_CONTROL)
 		return;
 
 	if (dobj->ops && dobj->ops->control_unload)
@@ -376,7 +376,7 @@ static void remove_enum(struct snd_soc_component *comp,
 {
 	struct snd_card *card = comp->card->snd_card;
 
-	if (pass != SOC_TPLG_PASS_MIXER)
+	if (pass != SOC_TPLG_PASS_CONTROL)
 		return;
 
 	if (dobj->ops && dobj->ops->control_unload)
@@ -392,7 +392,7 @@ static void remove_bytes(struct snd_soc_component *comp,
 {
 	struct snd_card *card = comp->card->snd_card;
 
-	if (pass != SOC_TPLG_PASS_MIXER)
+	if (pass != SOC_TPLG_PASS_CONTROL)
 		return;
 
 	if (dobj->ops && dobj->ops->control_unload)
@@ -2467,7 +2467,7 @@ static int soc_tplg_load_header(struct soc_tplg *tplg,
 	case SND_SOC_TPLG_TYPE_MIXER:
 	case SND_SOC_TPLG_TYPE_ENUM:
 	case SND_SOC_TPLG_TYPE_BYTES:
-		hdr_pass = SOC_TPLG_PASS_MIXER;
+		hdr_pass = SOC_TPLG_PASS_CONTROL;
 		elem_load = soc_tplg_kcontrol_elems_load;
 		break;
 	case SND_SOC_TPLG_TYPE_DAPM_GRAPH:
-- 
2.25.1

