Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6A02E2F2C
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Dec 2020 22:39:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9709117D0;
	Sat, 26 Dec 2020 22:38:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9709117D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609018753;
	bh=/oV/aLaP+XKy3csQx5bzW39yF1Yw6gpzcXbZuzKmZ/4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GoslZOx5We6cicjFG4Ltu5SxAG4QQy0jtcExjobUjOSPLQxDIqYXdxm3EV/1t/3r3
	 lI0AMRc5R66y8hDj/3puh1GO5JdhiKvvOV3TZSiJC0J+q7KfFbaX/VhrHsXZGCCCoZ
	 W9XsfodW4V76CT3lauG31Bac69G1h6aqlOeENhY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D7A4F80128;
	Sat, 26 Dec 2020 22:36:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE472F800C8; Sat, 26 Dec 2020 22:36:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7EADF8021D
 for <alsa-devel@alsa-project.org>; Sat, 26 Dec 2020 22:36:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7EADF8021D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="al5Jz13K"
Received: by mail-pj1-x1034.google.com with SMTP id b5so4387303pjl.0
 for <alsa-devel@alsa-project.org>; Sat, 26 Dec 2020 13:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G56ZDzgOT1ni0Po4A/IH2ndoD3TEINMsanasrB2rOGw=;
 b=al5Jz13KNOn0RayOhT+ebAx2BVXnNnsF0hZ/7FsdgWWcq6Em5/q5lbmQJlgARiIkWI
 LzExwT5vm6Ex+oQWC2+nfRq6qxgnCFf1ChZx4uU0ROT+JVf0nP1Zq4m9O0SThyekATeq
 Iy41D95x/H9BS056wQusVV8z8lQ/Tqxo4RhWbm72Y0iWor+7FX9tuVSXqH29xD4DRkvu
 3oYOmJfJd0sVU9ZvlEka7JZpaZzbDDzLRXpDNPt3euy7FTm+T8dcgCSDqCnYZ0QMkdP0
 9d0+z514EN36aG3Eu2hPCoJ91+u8YU3P8ot9eobIEcDN2fzSfP/SOzfl1eXokjLa32yb
 Fs8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G56ZDzgOT1ni0Po4A/IH2ndoD3TEINMsanasrB2rOGw=;
 b=VGUyiU5ToCVfYg7mC+5j+0tcByR2zKrrflU0AFEpo8087amYCblgR/L+54T0JAdmHK
 LFR+ueIbxQRJJ0JovVFsphEXKta4Q/brg/ZX/L+RxXQLwbe+WmAXr3dhKZSTBlETbdR3
 x6k111IWKarklhlOAh0Rpo8NDPaaazETsE66B81+aRQBL04nhalwRBk1UNoKby4HeqME
 Hl5bzXfiZYvdwGDQWv/k7UF7+ZMZo4hjl4i/jUiVYuxx0XiSPM5I87TtMK/rU5faW2+x
 sNy4BBYVeFzuBYJGdo80+QYq/tP4cvwxbHg1/g2t6LBsf8UTixTEumiijcvmYhgRDnVr
 +qlg==
X-Gm-Message-State: AOAM533ZIjpBRK6MyQbB43DVuA9e9AEeLke+BqwhDJpEWDydCw6bU8E1
 Ryakyyt0I4+M3MWR/oRN3WMKguYW/B4B+A==
X-Google-Smtp-Source: ABdhPJzlJAjcDH5RfqZ07CU+IBPa88gvZFE4WdtXZNor4pEqR31joUOSJSlKIBPP1lJkcBk0Wr//3A==
X-Received: by 2002:a17:902:9043:b029:dc:299b:b9bb with SMTP id
 w3-20020a1709029043b02900dc299bb9bbmr38879794plz.66.1609018589403; 
 Sat, 26 Dec 2020 13:36:29 -0800 (PST)
Received: from viper.bn-i.net ([2001:470:b:65c:b92f:8d47:b3dd:6388])
 by smtp.gmail.com with ESMTPSA id b12sm30990560pft.114.2020.12.26.13.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Dec 2020 13:36:28 -0800 (PST)
From: Alex Henrie <alexhenrie24@gmail.com>
To: alsa-devel@alsa-project.org,
	perex@perex.cz,
	tiwai@suse.de
Subject: [PATCH 3/9] rawmidi: fix memory leak in snd_rawmidi_virtual_open
Date: Sat, 26 Dec 2020 14:35:41 -0700
Message-Id: <20201226213547.175071-4-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.29.2.368.ge46b91665e.dirty
In-Reply-To: <20201226213547.175071-1-alexhenrie24@gmail.com>
References: <20201226213547.175071-1-alexhenrie24@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alex Henrie <alexhenrie24@gmail.com>
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

Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 src/rawmidi/rawmidi_virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/src/rawmidi/rawmidi_virt.c b/src/rawmidi/rawmidi_virt.c
index 2c4c27f5..884b8ff8 100644
--- a/src/rawmidi/rawmidi_virt.c
+++ b/src/rawmidi/rawmidi_virt.c
@@ -315,7 +315,7 @@ int snd_rawmidi_virtual_open(snd_rawmidi_t **inputp, snd_rawmidi_t **outputp,
 			     int merge, int mode)
 {
 	int err;
-	snd_rawmidi_t *rmidi;
+	snd_rawmidi_t *rmidi = NULL;
 	snd_rawmidi_virtual_t *virt = NULL;
 	struct pollfd pfd;
 
@@ -392,6 +392,7 @@ int snd_rawmidi_virtual_open(snd_rawmidi_t **inputp, snd_rawmidi_t **outputp,
 		free(*inputp);
 	if (outputp)
 		free(*outputp);
+	free(rmidi);
 	return err;
 }
 
-- 
2.29.2.368.ge46b91665e.dirty

