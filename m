Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D835EF006
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 10:08:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79D37E0F;
	Thu, 29 Sep 2022 10:07:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79D37E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664438885;
	bh=QVr/gR+bbu2WdgxLdQXwDXeRGoQdBvqwCM7mfJXI2a4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m39IiyfCf8FRTDRbqj/ukl6TLdIXtHczfyp982pin3UnSnVkuWyoeQBIJfMvbtuVM
	 GNI3PfSYPv7Cs5G1gBtYwiZdXTfYMLKD2GQGOKPfK8qGp72MnXTYhCXJljDG/RgN2R
	 Bz2zIVklaDJJxMm2js+LQuC5I5a++eJKYovpVNQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7B1EF80095;
	Thu, 29 Sep 2022 10:07:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C80B7F8023A; Thu, 29 Sep 2022 10:07:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3B62F80095
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 10:07:01 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id E27C4A003F;
 Thu, 29 Sep 2022 10:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz E27C4A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1664438820; bh=OhLhfZaRvTcOUOqGtr6QRJHz2ljxwx1w/xiyldwjcU8=;
 h=From:To:Cc:Subject:Date:From;
 b=eeqceNgg0gcDZjYRtu3GmhwiMtXmTOZdtdv0B7TRFOsikzGbvXTKxJF5ZQTevNpze
 cMp/GYe2vKVEfCf8PHj/MsgjoZWG4cokWzH7FRGdbHttCAOaREq6H42p1EHMhvPYsP
 FwIyArZYPLx/fr1tvODYYsrICCzpzUj2BQPZRHd8=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 29 Sep 2022 10:06:57 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: core: clarify the driver name initialization
Date: Thu, 29 Sep 2022 10:06:54 +0200
Message-Id: <20220929080654.326311-1-perex@perex.cz>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

The driver field in the struct snd_ctl_card_info is a valid
user space identifier. Actually, many ASoC drivers do not care
and let to initialize this field using a standard wrapping method.
Unfortunately, in this way, this field becomes unusable and
unreadable for the drivers with longer card names. Also,
there is a possibility to have clashes (driver field has
only limit of 15 characters).

This change will print an error when the wrapping is used.
The developers of the affected drivers should fix the problem.

Also, it does not make sense to set the driver field to the
card name composed from DMI. This card name is longer in most
(all?) cases. Use a generic "ASoC-DMI" string here.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/soc/soc-core.c | 41 +++++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e824ff1a9fc0..fd037208c222 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1840,21 +1840,22 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
 	}
 }
 
-#define soc_setup_card_name(name, name1, name2, norm)		\
-	__soc_setup_card_name(name, sizeof(name), name1, name2, norm)
-static void __soc_setup_card_name(char *name, int len,
-				  const char *name1, const char *name2,
-				  int normalization)
+#define soc_setup_card_name(card, name, name1, name2) \
+	__soc_setup_card_name(card, name, sizeof(name), name1, name2)
+static void __soc_setup_card_name(struct snd_soc_card *card,
+				  char *name, int len,
+				  const char *name1, const char *name2)
 {
+	const char *src = name1 ? name1 : name2;
 	int i;
 
-	snprintf(name, len, "%s", name1 ? name1 : name2);
+	snprintf(name, len, "%s", src);
 
-	if (!normalization)
+	if (name != card->snd_card->driver)
 		return;
 
 	/*
-	 * Name normalization
+	 * Name normalization (driver field)
 	 *
 	 * The driver name is somewhat special, as it's used as a key for
 	 * searches in the user-space.
@@ -1874,6 +1875,14 @@ static void __soc_setup_card_name(char *name, int len,
 			break;
 		}
 	}
+
+	/*
+	 * The driver field should contain a valid string from the user view.
+	 * The wrapping usually does not work so well here. Set a smaller string
+	 * in the specific ASoC driver.
+	 */
+	if (strlen(src) > len - 1)
+		dev_err(card->dev, "ASoC: driver name too long '%s' -> '%s'\n", src, name);
 }
 
 static void soc_cleanup_card_resources(struct snd_soc_card *card)
@@ -1928,6 +1937,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_component *component;
 	struct snd_soc_dai_link *dai_link;
+	const char *fallback;
 	int ret, i;
 
 	mutex_lock(&client_mutex);
@@ -2041,12 +2051,15 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	/* try to set some sane longname if DMI is available */
 	snd_soc_set_dmi_name(card, NULL);
 
-	soc_setup_card_name(card->snd_card->shortname,
-			    card->name, NULL, 0);
-	soc_setup_card_name(card->snd_card->longname,
-			    card->long_name, card->name, 0);
-	soc_setup_card_name(card->snd_card->driver,
-			    card->driver_name, card->name, 1);
+	soc_setup_card_name(card, card->snd_card->shortname,
+			    card->name, NULL);
+	fallback = card->name;
+	soc_setup_card_name(card, card->snd_card->longname,
+			    card->long_name, fallback);
+	if (card->long_name == card->dmi_longname)
+		fallback = "ASoC-DMI";
+	soc_setup_card_name(card, card->snd_card->driver,
+			    card->driver_name, fallback);
 
 	if (card->components) {
 		/* the current implementation of snd_component_add() accepts */
-- 
2.35.3
