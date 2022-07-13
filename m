Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6587657349C
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 12:51:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 068ED1720;
	Wed, 13 Jul 2022 12:50:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 068ED1720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657709463;
	bh=ORlfA7Qxv1mvUgnVnYRGgp8R/rtD/Nqc2/10WFWQdMY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m1ka3Y4pNEP/dqPT8t9c2U+jNe2NWfp9M0s5d6nLENciLzWfSUL7Prn5SU7RFhwAg
	 /iSKP1Fq7zA/jMDQzRKnWfZ32ptcvURuGVsp9jr0ExrKs411ohSj8RTwDod2QPj4qO
	 9Z8MNLMMdq5CujphhIauGcyXjv3a6YVCLpoRnMUQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 389C5F80567;
	Wed, 13 Jul 2022 12:48:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87316F80564; Wed, 13 Jul 2022 12:48:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2020BF80254
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 12:48:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2020BF80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="WcQKDUmb"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="aWgB2vh1"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E47CB33B10;
 Wed, 13 Jul 2022 10:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657709286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T8nj2UK25HmfdK2hIqNMkRX/HHeFFhimMnviZsUyyBA=;
 b=WcQKDUmbldhLWuZ+6v3nwSDgbZn1FKgypLJcu2gsRxxxBmtjHRZR/O9RcV0Dfn9B0FXjEe
 d0TeiphG4Yn3fJ4UtqqqPa0KtWC8lDXtQso674eMq3ZOfzIO6zK8nxzO8MOTXCdbwVzmyD
 HUAueW680b6wRSYwhuMzxlNY9PX8En4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657709286;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T8nj2UK25HmfdK2hIqNMkRX/HHeFFhimMnviZsUyyBA=;
 b=aWgB2vh1dnxF+DxIjE+017SgdRkpX5aAXYvSazjwbXk6Dze7h7riSmxhrCkCgOC4c/3fJW
 UQ13Vj9R4jM/JEAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C973D13AC7;
 Wed, 13 Jul 2022 10:48:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uMh2MOaizmLceAAAMHmgww
 (envelope-from <tiwai@suse.de>); Wed, 13 Jul 2022 10:48:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/7] ALSA: control: Fix missing return value comments for
 kernel docs
Date: Wed, 13 Jul 2022 12:47:57 +0200
Message-Id: <20220713104759.4365-6-tiwai@suse.de>
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
proper format.  This patch adds or fixes the missing entries for
control API.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index fa04a9233155..4dba3a342458 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -2054,6 +2054,8 @@ static int _snd_ctl_register_ioctl(snd_kctl_ioctl_func_t fcn, struct list_head *
  * @fcn: ioctl callback function
  *
  * called from each device manager like pcm.c, hwdep.c, etc.
+ *
+ * Return: zero if successful, or a negative error code
  */
 int snd_ctl_register_ioctl(snd_kctl_ioctl_func_t fcn)
 {
@@ -2066,6 +2068,8 @@ EXPORT_SYMBOL(snd_ctl_register_ioctl);
  * snd_ctl_register_ioctl_compat - register the device-specific 32bit compat
  * control-ioctls
  * @fcn: ioctl callback function
+ *
+ * Return: zero if successful, or a negative error code
  */
 int snd_ctl_register_ioctl_compat(snd_kctl_ioctl_func_t fcn)
 {
@@ -2101,6 +2105,8 @@ static int _snd_ctl_unregister_ioctl(snd_kctl_ioctl_func_t fcn,
 /**
  * snd_ctl_unregister_ioctl - de-register the device-specific control-ioctls
  * @fcn: ioctl callback function to unregister
+ *
+ * Return: zero if successful, or a negative error code
  */
 int snd_ctl_unregister_ioctl(snd_kctl_ioctl_func_t fcn)
 {
@@ -2113,6 +2119,8 @@ EXPORT_SYMBOL(snd_ctl_unregister_ioctl);
  * snd_ctl_unregister_ioctl_compat - de-register the device-specific compat
  * 32bit control-ioctls
  * @fcn: ioctl callback function to unregister
+ *
+ * Return: zero if successful, or a negative error code
  */
 int snd_ctl_unregister_ioctl_compat(snd_kctl_ioctl_func_t fcn)
 {
@@ -2168,7 +2176,7 @@ EXPORT_SYMBOL_GPL(snd_ctl_get_preferred_subdevice);
  * snd_ctl_request_layer - request to use the layer
  * @module_name: Name of the kernel module (NULL == build-in)
  *
- * Return an error code when the module cannot be loaded.
+ * Return: zero if successful, or an error code when the module cannot be loaded
  */
 int snd_ctl_request_layer(const char *module_name)
 {
@@ -2370,6 +2378,8 @@ int snd_ctl_create(struct snd_card *card)
  *
  * This is a function that can be used as info callback for a standard
  * boolean control with a single mono channel.
+ *
+ * Return: Zero (always successful)
  */
 int snd_ctl_boolean_mono_info(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_info *uinfo)
@@ -2390,6 +2400,8 @@ EXPORT_SYMBOL(snd_ctl_boolean_mono_info);
  *
  * This is a function that can be used as info callback for a standard
  * boolean control with stereo two channels.
+ *
+ * Return: Zero (always successful)
  */
 int snd_ctl_boolean_stereo_info(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_info *uinfo)
@@ -2413,7 +2425,7 @@ EXPORT_SYMBOL(snd_ctl_boolean_stereo_info);
  * If the control's accessibility is not the default (readable and writable),
  * the caller has to fill @info->access.
  *
- * Return: Zero.
+ * Return: Zero (always successful)
  */
 int snd_ctl_enum_info(struct snd_ctl_elem_info *info, unsigned int channels,
 		      unsigned int items, const char *const names[])
-- 
2.35.3

