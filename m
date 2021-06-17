Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3E93AAEEC
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 10:39:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A8D916C3;
	Thu, 17 Jun 2021 10:38:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A8D916C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623919145;
	bh=9Yd0MQuirll8jLdBosxWdFRI67s7OG52Cq6xl9anZTc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d4J0G+OU5WWuFPrySZpGk+ysZoaz4/4/5/XDhRCxA/MzNLLT5F8nzSJCt4+YgUVpu
	 +t6fAxPdaJ8ZefgdBm6PTNfqiddfsj9V03zdm/SoNtEiPj2n1cTe91BtDO85W+h6zv
	 kFrIY4MdOC7Qrhw/bggJ7Pol+6u55YiZQ8wEbUkg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D849F8049E;
	Thu, 17 Jun 2021 10:37:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EA09F802A9; Thu, 17 Jun 2021 10:37:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.cccmz.de (mail.cccmz.de [IPv6:2a01:4f8:161:4283:1000::108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12170F80088
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 10:37:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12170F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cccmz.de header.i=@cccmz.de
 header.b="liG+y+/n"
Received: from tanjeffs-laptop.fritz.box (x4dbd90a7.dyn.telefonica.de
 [77.189.144.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: tanjeff@cccmz.de)
 by mail.cccmz.de (Postfix) with ESMTPSA id E3DB717A311E;
 Thu, 17 Jun 2021 10:37:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cccmz.de; s=2019;
 t=1623919045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SGO9FwIzCDcoO2onpp7GdpJx5gDEARXUX8oI0lqYO2o=;
 b=liG+y+/nQT0KiCdrgmv4RVZ03C20Wa2tywbhwbRRsNscjGZ4caZSykxr+FznjZBr52UBBD
 sblEYlrIvGzVRWHU2NusgFvKWMlwDBUDZwxYah/nSBDEyNk2qzNaG3NUrKqTDHUZLMyPJi
 Zv3dL6rMzXOv3z772z/coSEVCnNVb6U=
From: "Tanjeff-N. Moos" <tanjeff@cccmz.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] control: Minor documentation fixes.
Date: Thu, 17 Jun 2021 10:36:39 +0200
Message-Id: <20210617083639.155781-2-tanjeff@cccmz.de>
In-Reply-To: <20210617083639.155781-1-tanjeff@cccmz.de>
References: <20210617083639.155781-1-tanjeff@cccmz.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index 9ebb4905..e386ecec 100644
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
@@ -621,7 +626,7 @@ size_t snd_ctl_elem_value_sizeof(void);
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
index 7cf4decb..91415b51 100644
--- a/src/control/control.c
+++ b/src/control/control.c
@@ -3127,7 +3127,7 @@ size_t snd_ctl_elem_value_sizeof()
 /**
  * \brief Allocate an invalid #snd_ctl_elem_value_t on the heap.
  *
- * Allocate space for a value object on the head. The allocated memory
+ * Allocate space for a value object on the heap. The allocated memory
  * must be freed using snd_ctl_elem_value_free().
  *
  * See snd_ctl_elem_value_t for details.
-- 
2.25.1

