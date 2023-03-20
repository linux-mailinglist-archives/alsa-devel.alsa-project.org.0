Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DD06C22E9
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 21:37:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8564C1DD;
	Mon, 20 Mar 2023 21:36:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8564C1DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679344645;
	bh=InYQgdpge/dbR4Re0sZSGzLb+2FQvnDHCp4OaMBC+ys=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nrRNPJ4k1PPEiKMrLsBwLDUPZlU7HAX9x/3z50fQggKn8FAki8HgSUdH8qStyopwq
	 LRUpebKdvBPMuqTHj96Tdnyaxx7IkTXfTjJk7wYX7VVO3HlWNGG3HbOB4zRC9KnPtL
	 G4VFf1Kp+Z9KEsUUR/M/q4qVMqbRMB6Tn2sgjVOs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6E8FF8052D;
	Mon, 20 Mar 2023 21:35:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CB64F80520; Mon, 20 Mar 2023 21:35:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.mutex.one (mail.mutex.one [62.77.152.124])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86F4BF80254
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 21:35:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86F4BF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mutex.one header.i=@mutex.one header.a=rsa-sha256
 header.s=default header.b=QOc1/SZG
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mutex.one (Postfix) with ESMTP id 2350C16C004F;
	Mon, 20 Mar 2023 22:35:27 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
	by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EtRulhLEt9cx; Mon, 20 Mar 2023 22:35:25 +0200 (EET)
From: Marian Postevca <posteuca@mutex.one>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
	t=1679344525; bh=InYQgdpge/dbR4Re0sZSGzLb+2FQvnDHCp4OaMBC+ys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QOc1/SZGenka+FTPOx96+ywGP8ItKBLxq0rLHiGeCxo/MNXZYrO5XoIfrb4TM7Nqm
	 gw0HRsZ19InUSBTsyn/ayHnq1oFewCpU5z2UjjIHonx69+4UFp5Ca5OXgwH6MvwJCv
	 /YlbivPQe5CdrpzGteWoHkgEWtRhz4uJyl3ySmNo=
To: Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 2/4] ASoC: amd: acp: Add support for splitting the codec
 specific code from the ACP driver
Date: Mon, 20 Mar 2023 22:35:17 +0200
Message-Id: <20230320203519.20137-3-posteuca@mutex.one>
In-Reply-To: <20230320203519.20137-1-posteuca@mutex.one>
References: <20230320203519.20137-1-posteuca@mutex.one>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 34Q3YMLRQHLK4XBEOKS7PNMZSOZWBG3T
X-Message-ID-Hash: 34Q3YMLRQHLK4XBEOKS7PNMZSOZWBG3T
X-MailFrom: posteuca@mutex.one
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Marian Postevca <posteuca@mutex.one>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/34Q3YMLRQHLK4XBEOKS7PNMZSOZWBG3T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This commit adds support for splitting more complicated machine drivers,
that need special handling, from the generic ACP code.

By adding support for callbacks to configure and handle codec specific
implementation details, we can split them in separate files that don't
clutter the ACP code.

Signed-off-by: Marian Postevca <posteuca@mutex.one>
---
 sound/soc/amd/acp/acp-mach.h | 65 ++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/sound/soc/amd/acp/acp-mach.h b/sound/soc/amd/acp/acp-mach.h
index 165f407697c0..2cade68e6cc3 100644
--- a/sound/soc/amd/acp/acp-mach.h
+++ b/sound/soc/amd/acp/acp-mach.h
@@ -20,6 +20,10 @@
 
 #define TDM_CHANNELS	8
 
+#define ACP_OPS(priv, cb)	((priv)->ops.cb)
+
+#define acp_get_drvdata(card) ((struct acp_card_drvdata *)(card)->drvdata)
+
 enum be_id {
 	HEADSET_BE_ID = 0,
 	AMP_BE_ID,
@@ -48,6 +52,14 @@ enum platform_end_point {
 	REMBRANDT,
 };
 
+struct acp_mach_ops {
+	int (*probe)(struct snd_soc_card *card);
+	int (*configure_link)(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
+	int (*configure_widgets)(struct snd_soc_card *card);
+	int (*suspend_pre)(struct snd_soc_card *card);
+	int (*resume_post)(struct snd_soc_card *card);
+};
+
 struct acp_card_drvdata {
 	unsigned int hs_cpu_id;
 	unsigned int amp_cpu_id;
@@ -59,6 +71,8 @@ struct acp_card_drvdata {
 	unsigned int platform;
 	struct clk *wclk;
 	struct clk *bclk;
+	struct acp_mach_ops ops;
+	void *mach_priv;
 	bool soc_mclk;
 	bool tdm_mode;
 };
@@ -67,4 +81,55 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card);
 int acp_legacy_dai_links_create(struct snd_soc_card *card);
 extern const struct dmi_system_id acp_quirk_table[];
 
+static inline int acp_ops_probe(struct snd_soc_card *card)
+{
+	int ret = 1;
+	struct acp_card_drvdata *priv = acp_get_drvdata(card);
+
+	if (ACP_OPS(priv, probe))
+		ret = ACP_OPS(priv, probe)(card);
+	return ret;
+}
+
+static inline int acp_ops_configure_link(struct snd_soc_card *card,
+					 struct snd_soc_dai_link *dai_link)
+{
+	int ret = 1;
+	struct acp_card_drvdata *priv = acp_get_drvdata(card);
+
+	if (ACP_OPS(priv, configure_link))
+		ret = ACP_OPS(priv, configure_link)(card, dai_link);
+	return ret;
+}
+
+static inline int acp_ops_configure_widgets(struct snd_soc_card *card)
+{
+	int ret = 1;
+	struct acp_card_drvdata *priv = acp_get_drvdata(card);
+
+	if (ACP_OPS(priv, configure_widgets))
+		ret = ACP_OPS(priv, configure_widgets)(card);
+	return ret;
+}
+
+static inline int acp_ops_suspend_pre(struct snd_soc_card *card)
+{
+	int ret = 1;
+	struct acp_card_drvdata *priv = acp_get_drvdata(card);
+
+	if (ACP_OPS(priv, suspend_pre))
+		ret = ACP_OPS(priv, suspend_pre)(card);
+	return ret;
+}
+
+static inline int acp_ops_resume_post(struct snd_soc_card *card)
+{
+	int ret = 1;
+	struct acp_card_drvdata *priv = acp_get_drvdata(card);
+
+	if (ACP_OPS(priv, resume_post))
+		ret = ACP_OPS(priv, resume_post)(card);
+	return ret;
+}
+
 #endif
-- 
2.39.1

