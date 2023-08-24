Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC037879DA
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 23:04:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4202844;
	Thu, 24 Aug 2023 23:03:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4202844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692911039;
	bh=8PTrXsqkL0UNlPVGEVRU0vTAbW7pki9umfY6TrlE7rM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oVYwZ9d8J1M1D3i8NVcJpqQX+kjxy1Zh0P4oYpVtgmPQ8zELvY9icbmJzTkVYXaYE
	 ysZmnCEFvDU/5mXKj3OGWq19oRx88Jd62VGbCEklMnrIfwMeLg3ZMZ2lO0F5luthsK
	 3xHUuXJouu0SN8IOwDRbel4VY1tyjfwSVbx8O35Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E3BBF80587; Thu, 24 Aug 2023 23:02:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A008F80564;
	Thu, 24 Aug 2023 23:02:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF0B6F80567; Thu, 24 Aug 2023 23:02:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.mutex.one (mail.mutex.one [62.77.152.124])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AEB81F800BF
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 23:01:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEB81F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mutex.one header.i=@mutex.one header.a=rsa-sha256
 header.s=default header.b=XsjxURkv
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mutex.one (Postfix) with ESMTP id C806416C0048;
	Fri, 25 Aug 2023 00:01:43 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
	by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5CX7HXT9j10U; Fri, 25 Aug 2023 00:01:41 +0300 (EEST)
From: Marian Postevca <posteuca@mutex.one>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
	t=1692910901; bh=8PTrXsqkL0UNlPVGEVRU0vTAbW7pki9umfY6TrlE7rM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XsjxURkv7BAH88nQTsbx+qKsY4taPx0e9iItwBt4+BL2O+Y3CD0aMu0h9xn+kOhZ3
	 htWOlY958/6rDSS7yPM0sAFxnOtarQ5KT9lheMUOxKj1NUzIWnySunL55jNp1/IgdZ
	 sqwdIFWhbvj3aNgwsLqtX419zkJnQNHwpD45EYyQ=
To: Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Marian Postevca <posteuca@mutex.one>
Subject: [PATCH v2 3/4] ASoC: amd: acp: Add support for splitting the codec
 specific code from the ACP driver
Date: Fri, 25 Aug 2023 00:01:34 +0300
Message-ID: <20230824210135.19303-4-posteuca@mutex.one>
In-Reply-To: <20230824210135.19303-1-posteuca@mutex.one>
References: <20230824210135.19303-1-posteuca@mutex.one>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EU4WZAS5UOFV74S6WIOJYHIQ7FDSAYQP
X-Message-ID-Hash: EU4WZAS5UOFV74S6WIOJYHIQ7FDSAYQP
X-MailFrom: posteuca@mutex.one
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EU4WZAS5UOFV74S6WIOJYHIQ7FDSAYQP/>
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
index 2b3ec6594023..31f38ec4b1d1 100644
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
@@ -50,6 +54,14 @@ enum platform_end_point {
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
@@ -61,6 +73,8 @@ struct acp_card_drvdata {
 	unsigned int platform;
 	struct clk *wclk;
 	struct clk *bclk;
+	struct acp_mach_ops ops;
+	void *mach_priv;
 	bool soc_mclk;
 	bool tdm_mode;
 };
@@ -69,4 +83,55 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card);
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
2.41.0

