Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0B253EE77
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 21:21:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F10D81B25;
	Mon,  6 Jun 2022 21:20:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F10D81B25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654543300;
	bh=ZLlVuUsf9NJ3E9/ByA8HcG0CO1p8rpDegPX/Wip1aSY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NkisfAsz7w6bdWj4SYUY26Siwe2Ren+fx6ru4Ou77Wo00qDAJX9SkCw4TeEV2jjbp
	 YX4WBJD0Uq/pFkdsfRB8uur0/Kg/J2yMLMj+rLiqu8D4SOm2KLL0a9ZEzg5RwPkfH+
	 jxK0QbQjE8riO5b2JnyPE2r7VEXR1JYd4rvE4ol4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B216F8052D;
	Mon,  6 Jun 2022 21:20:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 166F5F80526; Mon,  6 Jun 2022 21:20:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53E61F80109
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 21:19:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53E61F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="pCqAUtR5"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1654543194; bh=QRlMmTx37FIKTUzJOBJewRJ+ymrpkMI9OoQilWk1xqQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=pCqAUtR5QapOooJvOBPYyu6davbskVeHkuQPoBRndcKKCB1ayMa43zPdunPZ8BdEz
 hqwIFeXKXSAzIiaJloXlHVS4XBW2OiJcYOcvxEpGzXL3TILws63LPcNosFqrqNnF5h
 BDeut6J0fhsCyD1wCOIaeQ88CR2aUEVF2Yedmjs8=
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [RFC PATCH v2 4/5] ASoC: Introduce 'fixup_controls' card method
Date: Mon,  6 Jun 2022 21:19:09 +0200
Message-Id: <20220606191910.16580-5-povik+lin@cutebit.org>
In-Reply-To: <20220606191910.16580-1-povik+lin@cutebit.org>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 Mark Kettenis <kettenis@openbsd.org>,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
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

The new method is called just before the card is registered, providing
an opportune time for machine-level drivers to do some final controls
amending: deactivating individual controls or obtaining control
references for later use.

Some controls can be created by DAPM after 'late_probe' has been called,
hence the need for this new method.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 include/sound/soc-card.h | 1 +
 include/sound/soc.h      | 1 +
 sound/soc/soc-card.c     | 6 ++++++
 sound/soc/soc-core.c     | 1 +
 4 files changed, 9 insertions(+)

diff --git a/include/sound/soc-card.h b/include/sound/soc-card.h
index 4f2cc4fb56b7..fd8a6bd2bb4c 100644
--- a/include/sound/soc-card.h
+++ b/include/sound/soc-card.h
@@ -26,6 +26,7 @@ int snd_soc_card_resume_post(struct snd_soc_card *card);
 
 int snd_soc_card_probe(struct snd_soc_card *card);
 int snd_soc_card_late_probe(struct snd_soc_card *card);
+void snd_soc_card_fixup_controls(struct snd_soc_card *card);
 int snd_soc_card_remove(struct snd_soc_card *card);
 
 int snd_soc_card_set_bias_level(struct snd_soc_card *card,
diff --git a/include/sound/soc.h b/include/sound/soc.h
index d3d3a26e8867..8be0258c74e9 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -895,6 +895,7 @@ struct snd_soc_card {
 
 	int (*probe)(struct snd_soc_card *card);
 	int (*late_probe)(struct snd_soc_card *card);
+	void (*fixup_controls)(struct snd_soc_card *card);
 	int (*remove)(struct snd_soc_card *card);
 
 	/* the pre and post PM functions are used to do any PM work before and
diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 41c586b86dc3..377e4f9eda91 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -167,6 +167,12 @@ int snd_soc_card_late_probe(struct snd_soc_card *card)
 	return 0;
 }
 
+void snd_soc_card_fixup_controls(struct snd_soc_card *card)
+{
+	if (card->fixup_controls)
+		card->fixup_controls(card);
+}
+
 int snd_soc_card_remove(struct snd_soc_card *card)
 {
 	int ret = 0;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index aa687fd126db..ef4d9cb67bb2 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2074,6 +2074,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 		goto probe_end;
 
 	snd_soc_dapm_new_widgets(card);
+	snd_soc_card_fixup_controls(card);
 
 	ret = snd_card_register(card->snd_card);
 	if (ret < 0) {
-- 
2.33.0

