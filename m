Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4AD708FCC
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 08:22:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FF8D857;
	Fri, 19 May 2023 08:21:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FF8D857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684477321;
	bh=9RuE1fzvVGsaV5FWGQsRCwRyfh5hUPhdIKeWyGuIrUc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HQrjtdFCFfNpsgp8cvFrosj+8Ji477bcQcJg1rFd9sgKUfgo/To1SZzou0+CI4XvI
	 NWaoB7+l/4QMRNwPYwbwHocOKYWD3pW2X3xfYE7NAevJTW0w62t5QR8uVb6905e2Xl
	 lHigzAy/TWWzwr8wTCv+UAPsQ0OgKFYC55xTEFEw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7410F805E4; Fri, 19 May 2023 08:18:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1080CF805BF;
	Fri, 19 May 2023 08:18:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6FA1F80272; Wed, 17 May 2023 00:38:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB158F8016D
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 00:38:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB158F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=YDivJEGL
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1ae4e264e03so2116985ad.2
        for <alsa-devel@alsa-project.org>;
 Tue, 16 May 2023 15:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684276690; x=1686868690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vbJEV48J4NMFZNK/dI2UJhC6ykl0UhPDNLnBVnRsU/w=;
        b=YDivJEGLYVwP1jtDneM3aG9yzIVFsayF8eGOctNxhTXvUoqCcpjHyoAk4jJn6Ltznl
         JlN8qt0k9abFnf1qzJ7NaunmNxststR5Y0oaBCCwpU9RG+ZISekmSNsrvwuH71MXqL+A
         7aW+i7BQS6IwG2WVZJ1eAZaH2JmGAO367r6c3H7qBgHQqhiYhZ4Kxf06Fjc2JDQN8sjl
         73xHnK+QAK6KPCQ6ihEDPWEupcG2xzY/4TjNaQ64j41hoV/CN+FZ8sUrRMAOA9ND/DTO
         NX39ZOhVd0Lxf32oSRyc+rquKVXBO5nQgI/qIhGNGIdGC0pWdwaSb0Lds/80AIO/46Zx
         /UBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684276690; x=1686868690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbJEV48J4NMFZNK/dI2UJhC6ykl0UhPDNLnBVnRsU/w=;
        b=YRvf7aWj89BjQz3H383EJtQbfmdTQ4OJrUWWjZosK2r0hE9X9Zn059Jcrn8hCchJOA
         0xAwW0Sl3n+tEVtrNmENHuKymKGcmV3VzmkAz5PRooBs26lcV07IAe0D8L1vSzk9G84m
         Rnc20CTcRHYDRjmsnPO+oeK0PGwh/dPW/DkYyrVkgENUEemrpdbgyl1Cck0zCQU4BJP5
         oDoc7X0CPAsJtA8dpibPdT+FIooWfXE6l8bJ6WMcVAFGmT3RJuVEzaivi0fQBjxP3igJ
         Pm9A8EYwYOqZdMwvHql+kQi/zE8VAa9EXIKcO0r/j2+39skZQPHn0Dz33rjzq/lgmJwq
         whLA==
X-Gm-Message-State: AC+VfDy/u/63H6eUeSPmQidZYkLmyHGfnGFR7HQoEBsx5gYnV/le6lr+
	Znr2eIVqjyTzATns+ylTEN4=
X-Google-Smtp-Source: 
 ACHHUZ5iTa5QxKGz1//jWtHL7A7T+K6xZL1AnrItvgmJyd/LtFNyVTWVse9MTf6JP4ubEdqQtoaViw==
X-Received: by 2002:a17:902:7b8f:b0:1ae:6a3:d058 with SMTP id
 w15-20020a1709027b8f00b001ae06a3d058mr10887119pll.36.1684276690111;
        Tue, 16 May 2023 15:38:10 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-97-28.dynamic-ip.hinet.net.
 [36.228.97.28])
        by smtp.gmail.com with ESMTPSA id
 ij22-20020a170902ab5600b001ae46ccd19esm1029787plb.63.2023.05.16.15.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 15:38:09 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Min-Hua Chen <minhuadotchen@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: compat_ioctl: use correct snd_ctl_elem_type_t type
Date: Wed, 17 May 2023 06:38:05 +0800
Message-Id: <20230516223806.185683-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: minhuadotchen@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AXVNHJ562J2OJIVEARY2CNL2KGWDROIJ
X-Message-ID-Hash: AXVNHJ562J2OJIVEARY2CNL2KGWDROIJ
X-Mailman-Approved-At: Fri, 19 May 2023 06:16:22 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AXVNHJ562J2OJIVEARY2CNL2KGWDROIJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SNDRV_CTL_ELEM_TYPE_* are type of snd_ctl_elem_type_t, we
have to __force cast them to int when comparing them with int
to fix the following sparse warnings.

sound/core/control_compat.c:203:14: sparse: warning: restricted snd_ctl_elem_type_t degrades to integer
sound/core/control_compat.c:205:14: sparse: warning: restricted snd_ctl_elem_type_t degrades to integer
sound/core/control_compat.c:207:14: sparse: warning: restricted snd_ctl_elem_type_t degrades to integer
sound/core/control_compat.c:209:14: sparse: warning: restricted snd_ctl_elem_type_t degrades to integer
sound/core/control_compat.c:237:21: sparse: warning: restricted snd_ctl_elem_type_t degrades to integer
sound/core/control_compat.c:238:21: sparse: warning: restricted snd_ctl_elem_type_t degrades to integer
sound/core/control_compat.c:270:21: sparse: warning: restricted snd_ctl_elem_type_t degrades to integer
sound/core/control_compat.c:271:21: sparse: warning: restricted snd_ctl_elem_type_t degrades to integer

Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
---
 sound/core/control_compat.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
index d8a86d1a99d6..9cae5d74335c 100644
--- a/sound/core/control_compat.c
+++ b/sound/core/control_compat.c
@@ -197,7 +197,7 @@ static int get_ctl_type(struct snd_card *card, struct snd_ctl_elem_id *id,
 	return err;
 }
 
-static int get_elem_size(int type, int count)
+static int get_elem_size(snd_ctl_elem_type_t type, int count)
 {
 	switch (type) {
 	case SNDRV_CTL_ELEM_TYPE_INTEGER64:
@@ -234,8 +234,8 @@ static int copy_ctl_value_from_user(struct snd_card *card,
 	if (type < 0)
 		return type;
 
-	if (type == SNDRV_CTL_ELEM_TYPE_BOOLEAN ||
-	    type == SNDRV_CTL_ELEM_TYPE_INTEGER) {
+	if (type == (__force int)SNDRV_CTL_ELEM_TYPE_BOOLEAN ||
+	    type == (__force int)SNDRV_CTL_ELEM_TYPE_INTEGER) {
 		for (i = 0; i < count; i++) {
 			s32 __user *intp = valuep;
 			int val;
@@ -244,7 +244,7 @@ static int copy_ctl_value_from_user(struct snd_card *card,
 			data->value.integer.value[i] = val;
 		}
 	} else {
-		size = get_elem_size(type, count);
+		size = get_elem_size((__force snd_ctl_elem_type_t)type, count);
 		if (size < 0) {
 			dev_err(card->dev, "snd_ioctl32_ctl_elem_value: unknown type %d\n", type);
 			return -EINVAL;
@@ -267,8 +267,8 @@ static int copy_ctl_value_to_user(void __user *userdata,
 	struct snd_ctl_elem_value32 __user *data32 = userdata;
 	int i, size;
 
-	if (type == SNDRV_CTL_ELEM_TYPE_BOOLEAN ||
-	    type == SNDRV_CTL_ELEM_TYPE_INTEGER) {
+	if (type == (__force int)SNDRV_CTL_ELEM_TYPE_BOOLEAN ||
+	    type == (__force int)SNDRV_CTL_ELEM_TYPE_INTEGER) {
 		for (i = 0; i < count; i++) {
 			s32 __user *intp = valuep;
 			int val;
@@ -277,7 +277,7 @@ static int copy_ctl_value_to_user(void __user *userdata,
 				return -EFAULT;
 		}
 	} else {
-		size = get_elem_size(type, count);
+		size = get_elem_size((__force snd_ctl_elem_type_t)type, count);
 		if (copy_to_user(valuep, data->value.bytes.data, size))
 			return -EFAULT;
 	}
-- 
2.34.1

