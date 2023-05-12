Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4695700807
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 14:30:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31DC91E8;
	Fri, 12 May 2023 14:29:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31DC91E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683894642;
	bh=0wUpL+xaJ+Z3CXOuHdCeOryBr69vr/ud4GcB1zJtBvE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kI5J4g7GaznO0EEYgZGDQ4te7kOHq8tno/x7ThKP5fDBBNtRPNZ6VDWKTuLgAS+RQ
	 U2Qpw8haAGKVgkpwd69rrSstKYkaPZMuWuZfeZUe0ewqzjY4XvGT7MAluivmwlkTni
	 uAf2oLq+R9NIcJckq7Hwx+n15/NCZB8Kil416m8A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06643F80570; Fri, 12 May 2023 14:29:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDE01F8055B;
	Fri, 12 May 2023 14:29:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9A0EF80551; Fri, 12 May 2023 14:28:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A533DF80087
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 14:28:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A533DF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=V8BCuMXJ
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34C5eUj7031128;
	Fri, 12 May 2023 07:28:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=xB39y6+mJBGWtyhx0qcL2eY8lyrChM7wcWHN+iiEcB4=;
 b=V8BCuMXJ5RwFoMUZRqCT3DxC+nM5xnkqeVkwEifNqk0EtjlPkiPXyFT/b4+S17sXc9hi
 ZBF8aP9ZmNv0schiX4lKkCSVYRDNO94Gn7k8J+YdVCx48vVQ6Zq9CnjXz9tTOiBEiTnB
 UGrsBUPHEhJQ76LeEn/fuQmUxoOFHIrvLE/c2b9gH/63Hw73wN7WWMaIjTFgtAmq2rFs
 hRT1ipWoIl/YhgfX9yOKqZD11nMhDxTAgTCUqYlmofziQyRMV5T/vU3gZY3bjF5/la8g
 08Ul09BJEVizlGJXjIGaCoJwWEP7ls2gGU8TmnrrlAW3FRLC2PcghHDT6InueZth/SGa Hg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qf7s46b2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 May 2023 07:28:39 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 12 May
 2023 07:28:38 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Fri, 12 May 2023 07:28:38 -0500
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 44D1915B4;
	Fri, 12 May 2023 12:28:38 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <lee@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <tglx@linutronix.de>, <maz@kernel.org>, <linus.walleij@linaro.org>,
        <vkoul@kernel.org>
CC: <lgirdwood@gmail.com>, <yung-chuan.liao@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <pierre-louis.bossart@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 02/10] ASoC: soc-component: Add notify control helper function
Date: Fri, 12 May 2023 13:28:30 +0100
Message-ID: <20230512122838.243002-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: MUbrGEwGAujydxpQ9MWY7vjI0Bv7nAZ4
X-Proofpoint-GUID: MUbrGEwGAujydxpQ9MWY7vjI0Bv7nAZ4
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: MAWH5R3RCSO64MKSRWB3BBJRTT4H4LSE
X-Message-ID-Hash: MAWH5R3RCSO64MKSRWB3BBJRTT4H4LSE
X-MailFrom: prvs=0496644b8b=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MAWH5R3RCSO64MKSRWB3BBJRTT4H4LSE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a function to allow ASoC drivers to easily notify an ALSA control
change. This function will automatically add any component naming
prefix into the control name.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-component.h |  4 ++++
 sound/soc/soc-component.c     | 22 ++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 0814ed1438640..0b47603c9db29 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -454,6 +454,10 @@ int snd_soc_component_force_enable_pin_unlocked(
 	struct snd_soc_component *component,
 	const char *pin);
 
+/* component controls */
+int snd_soc_component_notify_control(struct snd_soc_component *component,
+				     const char * const ctl);
+
 /* component driver ops */
 int snd_soc_component_open(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index ff25718ff2e88..4356cc320fea0 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -236,6 +236,28 @@ int snd_soc_component_force_enable_pin_unlocked(
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_force_enable_pin_unlocked);
 
+int snd_soc_component_notify_control(struct snd_soc_component *component,
+				     const char * const ctl)
+{
+	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
+	struct snd_kcontrol *kctl;
+
+	if (component->name_prefix)
+		snprintf(name, ARRAY_SIZE(name), "%s %s", component->name_prefix, ctl);
+	else
+		snprintf(name, ARRAY_SIZE(name), "%s", ctl);
+
+	kctl = snd_soc_card_get_kcontrol(component->card, name);
+	if (!kctl)
+		return soc_component_ret(component, -EINVAL);
+
+	snd_ctl_notify(component->card->snd_card,
+		       SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_notify_control);
+
 /**
  * snd_soc_component_set_jack - configure component jack.
  * @component: COMPONENTs
-- 
2.30.2

