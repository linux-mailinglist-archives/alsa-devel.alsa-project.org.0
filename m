Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B8F29825F
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Oct 2020 16:45:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDF4F1718;
	Sun, 25 Oct 2020 16:45:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDF4F1718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603640757;
	bh=oZHH/qhKko3Iue/4ikHxqs9t6oJTyc6U8s5vhZ5tM9c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hvCKUb0ircK3frWphrO7IqwGg99LBSxAehmjKq7QQ+qjomoAtD2qCG3j2IVWqDchE
	 7RbKbzvuYnQ1jLRsYE4VyCnVpKGqMAkj9Egpx/063IWIy6lpnWnvWytxy4R71lwFCQ
	 wfxnTTlw29KSX9lG6e+1iJbdP2l0bkeiaBgXEDmM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10922F80245;
	Sun, 25 Oct 2020 16:44:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47CCFF8019D; Sun, 25 Oct 2020 16:44:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.cccmz.de (mail.cccmz.de [IPv6:2a01:4f8:161:4283:1000::108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53637F8019D
 for <alsa-devel@alsa-project.org>; Sun, 25 Oct 2020 16:44:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53637F8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cccmz.de header.i=@cccmz.de
 header.b="IiF899oX"
Received: from tanjeffs-laptop.fritz.box (x4db3a568.dyn.telefonica.de
 [77.179.165.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: tanjeff@cccmz.de)
 by mail.cccmz.de (Postfix) with ESMTPSA id AE3D917A0D92;
 Sun, 25 Oct 2020 16:44:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cccmz.de; s=2019;
 t=1603640644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=3mNRMn38JLJw8kCIaSk1mpnHPjVEW9MFR2cuIjA6e/8=;
 b=IiF899oXtuKuIyiNCMWAGLFTDo0JRJ2GpFtqeVK5m5StFiWr2i7Ni4bXLjWWww0rSNlrOf
 NwLGMSgzzEVruTnXy4GKOl7Xx4Lk5wh1+5fWFiJLFW37umFHs+MMt3Q6qKPnTW0/DIDkjc
 7cny5xkEuuPQoU9eqo4QnP5AQ5ImHJY=
From: "Tanjeff-N. Moos" <tanjeff@cccmz.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] control: Minor documentation fixes.
Date: Sun, 25 Oct 2020 16:43:41 +0100
Message-Id: <20201025154341.15875-2-tanjeff@cccmz.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201025154341.15875-1-tanjeff@cccmz.de>
References: <20201025154341.15875-1-tanjeff@cccmz.de>
Cc: Takashi Iwai <tiwai@suse.de>, "Tanjeff-N. Moos" <tanjeff@cccmz.de>
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

Signed-off-by: Tanjeff-N. Moos <tanjeff@cccmz.de>
---
 include/control.h     | 9 +++++++--
 src/control/cards.c   | 5 ++++-
 src/control/control.c | 2 +-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/control.h b/include/control.h
index e1a0da47..40353558 100644
--- a/include/control.h
+++ b/include/control.h
@@ -155,7 +155,7 @@ typedef struct _snd_ctl_elem_list snd_ctl_elem_list_t;
 /** CTL element info container */
 typedef struct _snd_ctl_elem_info snd_ctl_elem_info_t;
 
-/** CTL element value container
+/** CTL element value container.
  *
  * Contains the value(s) (i.e. members) of a single element. All
  * values of a given element are of the same type.
@@ -167,6 +167,11 @@ typedef struct _snd_ctl_elem_info snd_ctl_elem_info_t;
  * using the latter, it must be freed again using
  * snd_ctl_elem_value_free().
  *
+ * A value object can be zeroed out using snd_ctl_elem_value_clear().
+ *
+ * A value object can be copied to another one using
+ * snd_ctl_elem_value_copy().
+ *
  * \par Identifier
  *
  * Then, the ID must be filled. It is sufficient to fill only the
@@ -614,7 +619,7 @@ size_t snd_ctl_elem_value_sizeof(void);
  * \brief Allocate an invalid #snd_ctl_elem_value_t on the stack.
  *
  * Allocate space for a value object on the stack. The allocated
- * memory need not be freed, because is on the stack.
+ * memory need not be freed, because it is on the stack.
  *
  * See snd_ctl_elem_value_t for details.
  *
diff --git a/src/control/cards.c b/src/control/cards.c
index 8226c42d..6145ebcd 100644
--- a/src/control/cards.c
+++ b/src/control/cards.c
@@ -147,6 +147,7 @@ int snd_card_get_index(const char *string)
 		return -EINVAL;
 	if ((isdigit(*string) && *(string + 1) == 0) ||
 	    (isdigit(*string) && isdigit(*(string + 1)) && *(string + 2) == 0)) {
+		/* We got an index */
 		if (sscanf(string, "%i", &card) != 1)
 			return -EINVAL;
 		if (card < 0 || card >= SND_MAX_CARDS)
@@ -156,8 +157,10 @@ int snd_card_get_index(const char *string)
 			return card;
 		return err;
 	}
-	if (string[0] == '/')	/* device name */
+	if (string[0] == '/')
+		/* We got a device name */
 		return snd_card_load2(string);
+	/* We got in ID */
 	for (card = 0; card < SND_MAX_CARDS; card++) {
 #ifdef SUPPORT_ALOAD
 		if (! snd_card_load(card))
diff --git a/src/control/control.c b/src/control/control.c
index 7abf8ee3..66eabda5 100644
--- a/src/control/control.c
+++ b/src/control/control.c
@@ -2985,7 +2985,7 @@ size_t snd_ctl_elem_value_sizeof()
 /**
  * \brief Allocate an invalid #snd_ctl_elem_value_t on the heap.
  *
- * Allocate space for a value object on the head. The allocated memory
+ * Allocate space for a value object on the heap. The allocated memory
  * must be freed using snd_ctl_elem_value_free().
  *
  * See snd_ctl_elem_value_t for details.
-- 
2.17.1

