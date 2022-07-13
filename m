Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8471573497
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 12:50:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 958881704;
	Wed, 13 Jul 2022 12:49:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 958881704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657709412;
	bh=IM8qdXi+I/9rIPcR3tJXcX6bshwB3fsP1DPEi58Aaps=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hTXe6BFAfuQPFwWawOyonfHetYvVQavWOE3pzbdsaWB9t4VAoPmeK4BXgnQMiB3O8
	 aBs9btgYR2UeA+WrC4iBzyO9pX7mjiHzK7T+uG3dnykaWmx76eeMLzFrBe9MC2hrNy
	 3gQlHvNeJFKMl1eHxNqU6Rc/kEtwWv3CqV/ck8vU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19857F80557;
	Wed, 13 Jul 2022 12:48:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCEBAF80549; Wed, 13 Jul 2022 12:48:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83A12F80310
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 12:48:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83A12F80310
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="ieHGlOqR"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="VXpk5chO"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2844C1FF8B;
 Wed, 13 Jul 2022 10:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657709287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VL8P53bpeYgADq7XC2L6nh0MeXQ4UCFPQdJ4rmkm/HA=;
 b=ieHGlOqRyOgcYnubkEVIxYlzIQIMMiWNw40IR2ROeUAIx3InCMz5h1Ml+S1VCDwTMwC72C
 L6y3XDL5TFlXsTL65u3Q5subwL2fQfWMYMEfm3xra72VXRTptm1ne4G9aovwguYFdnInkJ
 w2rzAJMaTokpJ7ZsTwWwUEjikRsjI88=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657709287;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VL8P53bpeYgADq7XC2L6nh0MeXQ4UCFPQdJ4rmkm/HA=;
 b=VXpk5chO2PuUktLeagTev3zclJUfqNLhBmw44M9o9/fsGEqflu9jGbkN9V+uuUOUksCpwz
 gqhyvQxSGVNaxODA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0EF5A13AC7;
 Wed, 13 Jul 2022 10:48:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wBv5AueizmLceAAAMHmgww
 (envelope-from <tiwai@suse.de>); Wed, 13 Jul 2022 10:48:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 7/7] ALSA: core: Fix missing return value comments for kernel
 docs
Date: Wed, 13 Jul 2022 12:47:59 +0200
Message-Id: <20220713104759.4365-8-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220713104759.4365-1-tiwai@suse.de>
References: <20220713104759.4365-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Each kernel doc comment expects the definition of the return value in
a proper format.  This patch adds or fixes the missing entries for the
remaining ALSA core API functions.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/device.c  |  2 ++
 sound/core/info.c    |  2 ++
 sound/core/init.c    | 10 ++++++++++
 sound/core/isadma.c  |  3 ++-
 sound/core/vmaster.c |  3 ++-
 5 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/sound/core/device.c b/sound/core/device.c
index bf0b04a7ee79..b57d80a17052 100644
--- a/sound/core/device.c
+++ b/sound/core/device.c
@@ -247,6 +247,8 @@ void snd_device_free_all(struct snd_card *card)
  * device, either @SNDRV_DEV_BUILD, @SNDRV_DEV_REGISTERED or
  * @SNDRV_DEV_DISCONNECTED is returned.
  * Or for a non-existing device, -1 is returned as an error.
+ *
+ * Return: the current state, or -1 if not found
  */
 int snd_device_get_state(struct snd_card *card, void *device_data)
 {
diff --git a/sound/core/info.c b/sound/core/info.c
index 782fba87cc04..b8058b341178 100644
--- a/sound/core/info.c
+++ b/sound/core/info.c
@@ -868,6 +868,8 @@ EXPORT_SYMBOL(snd_info_register);
  *
  * This proc file entry will be registered via snd_card_register() call, and
  * it will be removed automatically at the card removal, too.
+ *
+ * Return: zero if successful, or a negative error code
  */
 int snd_card_rw_proc_new(struct snd_card *card, const char *name,
 			 void *private_data,
diff --git a/sound/core/init.c b/sound/core/init.c
index 1870aee7b64f..3ac95c66a4b5 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -215,6 +215,8 @@ static void __snd_card_release(struct device *dev, void *data)
  * via snd_card_free() call in the error; otherwise it may lead to UAF due to
  * devres call orders.  You can use snd_card_free_on_error() helper for
  * handling it more easily.
+ *
+ * Return: zero if successful, or a negative error code
  */
 int snd_devm_card_new(struct device *parent, int idx, const char *xid,
 		      struct module *module, size_t extra_size,
@@ -249,6 +251,8 @@ EXPORT_SYMBOL_GPL(snd_devm_card_new);
  * This function handles the explicit snd_card_free() call at the error from
  * the probe callback.  It's just a small helper for simplifying the error
  * handling with the managed devices.
+ *
+ * Return: zero if successful, or a negative error code
  */
 int snd_card_free_on_error(struct device *dev, int ret)
 {
@@ -370,6 +374,8 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
  *
  * Returns a card object corresponding to the given index or NULL if not found.
  * Release the object via snd_card_unref().
+ *
+ * Return: a card object or NULL
  */
 struct snd_card *snd_card_ref(int idx)
 {
@@ -608,6 +614,8 @@ static int snd_card_do_free(struct snd_card *card)
  * resource immediately, but tries to disconnect at first.  When the card
  * is still in use, the function returns before freeing the resources.
  * The card resources will be freed when the refcount gets to zero.
+ *
+ * Return: zero if successful, or a negative error code
  */
 int snd_card_free_when_closed(struct snd_card *card)
 {
@@ -833,6 +841,8 @@ static const struct attribute_group card_dev_attr_group = {
  * snd_card_add_dev_attr - Append a new sysfs attribute group to card
  * @card: card instance
  * @group: attribute group to append
+ *
+ * Return: zero if successful, or a negative error code
  */
 int snd_card_add_dev_attr(struct snd_card *card,
 			  const struct attribute_group *group)
diff --git a/sound/core/isadma.c b/sound/core/isadma.c
index 1f45ede023b4..2602246bd5a0 100644
--- a/sound/core/isadma.c
+++ b/sound/core/isadma.c
@@ -116,8 +116,9 @@ static void __snd_release_dma(struct device *dev, void *data)
  * @dma: the dma number
  * @name: the name string of the requester
  *
- * Returns zero on success, or a negative error code.
  * The requested DMA will be automatically released at unbinding via devres.
+ *
+ * Return: zero on success, or a negative error code
  */
 int snd_devm_request_dma(struct device *dev, int dma, const char *name)
 {
diff --git a/sound/core/vmaster.c b/sound/core/vmaster.c
index ab36f9898711..d0f11f37889b 100644
--- a/sound/core/vmaster.c
+++ b/sound/core/vmaster.c
@@ -494,7 +494,8 @@ EXPORT_SYMBOL_GPL(snd_ctl_sync_vmaster);
  * @arg: optional function argument
  *
  * Apply the function @func to each follower kctl of the given vmaster kctl.
- * Returns 0 if successful, or a negative error code.
+ *
+ * Return: 0 if successful, or a negative error code
  */
 int snd_ctl_apply_vmaster_followers(struct snd_kcontrol *kctl,
 				    int (*func)(struct snd_kcontrol *vfollower,
-- 
2.35.3

