Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B018A3B5599
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Jun 2021 00:38:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3714E1695;
	Mon, 28 Jun 2021 00:37:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3714E1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624833502;
	bh=K4P1X92wXEL1jCJObsXD+oQNks9oW67bWBom4mPhtjI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W3poO285e/tdpH0i488Pn08jx97kLA6G2SIk+VgGVspvk0Xgr3qlyj1ZDhLnisbeN
	 hg1Dty9QNqJElGwaTYWZI1NIM+DK/2v8EwQm4JRi+V6+2NiV8FT1bw+SiH3D9T2P3s
	 Tv/uRe0bJIBX8XVMMWUm7Ukn3f949sCGIStGL9gM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94721F8025D;
	Mon, 28 Jun 2021 00:36:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74865F80259; Mon, 28 Jun 2021 00:36:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FILL_THIS_FORM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFC62F80117
 for <alsa-devel@alsa-project.org>; Mon, 28 Jun 2021 00:36:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFC62F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mforney-org.20150623.gappssmtp.com
 header.i=@mforney-org.20150623.gappssmtp.com header.b="OybirHS6"
Received: by mail-pj1-x102e.google.com with SMTP id
 cs1-20020a17090af501b0290170856e1a8aso1027370pjb.3
 for <alsa-devel@alsa-project.org>; Sun, 27 Jun 2021 15:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mforney-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VwHY8lai9+jPfUjc2eHc0t+2Wk3UH+raooM9xMncH8c=;
 b=OybirHS67vRLWHBxirf5JyxOXclaW8fDMpMxczjxzStFuXoB87VWGKORWZCaDbbQH1
 9/WK3cspLpt5NGhBtSUCWSDbIEFp6Wl2tEbQRxijn191gRgSdy6aBZQG108iI//8fFP6
 FTXFK0N5ciPtEYzu4arhdOolo/+VKRpRerKkQw6qbQ6iLG9u7mukj9HP+eCL0K6Px4Da
 XJvb2TcDbnvjyHe+M4G4hMREKAJzTJZsSUrEs1j9Xuxd0Mkz+o8kSH/l3m1fZkyZycvn
 nQwYPZINP/vrsTZtx3N7+fQ2n89ijLd+ClQRpZJgNzzfZZrcWQ6bsnAl+L+sk6tmqtiH
 zfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VwHY8lai9+jPfUjc2eHc0t+2Wk3UH+raooM9xMncH8c=;
 b=XVEhSWyUbp71iFDUy2UZE/ViOX2OM/tHRA94sEi69XUZZ0HvSGcHPf3zyuPAg1LVDH
 o0ykmCgzhxHMamNZImODAufOFwRItAWx66emNNFAcUQyDpGK92l3I+kl09mC2rFC0IZO
 LU6oq3vx4DdQvx0fj5zfkwPSVHhFWNWDThKJ+0ND7G5+zgqucQTz1fF3sHa1ltpG6usU
 DOeDeydLjonLoULNyKQy01IoPH3XRkNIyZZ080gjVJMwDon4hovpenkMAw1rmWUqjHh5
 7bYovRcxhbnkudbeLaDO26u6WjUrGoFpWpm4DurEMISnnzbpQkktNjZ3CC+9mRnccj8W
 8STA==
X-Gm-Message-State: AOAM533JWKRvHRBUDAIU9cNkcaASsFBeAwOUWrUoMdlYzIxm6LPByNxc
 2kJ7Gc52yWcJ2xGZWZbfqca5CFIiVJ2Vr/8T
X-Google-Smtp-Source: ABdhPJwYdY45FFRaWYleBXWU2Co7RDcI8vywbDYDmIsTblcND4e28FcYFEkg2LlNbQx83H15I0ieTw==
X-Received: by 2002:a17:902:9006:b029:107:394a:387 with SMTP id
 a6-20020a1709029006b0290107394a0387mr19712570plp.35.1624833402043; 
 Sun, 27 Jun 2021 15:36:42 -0700 (PDT)
Received: from localhost ([2601:647:5180:4570:16dd:a9ff:fee7:6b79])
 by smtp.gmail.com with ESMTPSA id i18sm333571pfa.37.2021.06.27.15.36.41
 for <alsa-devel@alsa-project.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 27 Jun 2021 15:36:41 -0700 (PDT)
From: Michael Forney <mforney@mforney.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib] Fix build with --disable-ucm
Date: Sun, 27 Jun 2021 15:35:27 -0700
Message-Id: <20210627223527.10725-1-mforney@mforney.org>
X-Mailer: git-send-email 2.31.1
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

A recent change introduced a dependency on ucm to several of the
other components, but this was not made conditional on whether
BUILD_UCM is enabled.

Signed-off-by: Michael Forney <mforney@mforney.org>
---
 src/control/control.c | 5 ++++-
 src/pcm/pcm.c         | 5 ++++-
 src/rawmidi/rawmidi.c | 5 ++++-
 src/seq/seq.c         | 5 ++++-
 src/timer/timer.c     | 5 ++++-
 5 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/src/control/control.c b/src/control/control.c
index 91415b51..ca302df6 100644
--- a/src/control/control.c
+++ b/src/control/control.c
@@ -1569,11 +1569,14 @@ int snd_ctl_open(snd_ctl_t **ctlp, const char *name, int mode)
 	int err;
 
 	assert(ctlp && name);
+#ifdef BUILD_UCM
 	if (_snd_is_ucm_device(name)) {
 		name = uc_mgr_alibcfg_by_device(&top, name);
 		if (name == NULL)
 			return -ENODEV;
-	} else {
+	} else
+#endif
+	{
 		err = snd_config_update_ref(&top);
 		if (err < 0)
 			return err;
diff --git a/src/pcm/pcm.c b/src/pcm/pcm.c
index 892abf98..67912794 100644
--- a/src/pcm/pcm.c
+++ b/src/pcm/pcm.c
@@ -2686,11 +2686,14 @@ int snd_pcm_open(snd_pcm_t **pcmp, const char *name,
 	int err;
 
 	assert(pcmp && name);
+#ifdef BUILD_UCM
 	if (_snd_is_ucm_device(name)) {
 		name = uc_mgr_alibcfg_by_device(&top, name);
 		if (name == NULL)
 			return -ENODEV;
-	} else {
+	} else
+#endif
+	{
 		err = snd_config_update_ref(&top);
 		if (err < 0)
 			return err;
diff --git a/src/rawmidi/rawmidi.c b/src/rawmidi/rawmidi.c
index 55f44821..f6a60611 100644
--- a/src/rawmidi/rawmidi.c
+++ b/src/rawmidi/rawmidi.c
@@ -304,11 +304,14 @@ int snd_rawmidi_open(snd_rawmidi_t **inputp, snd_rawmidi_t **outputp,
 	int err;
 
 	assert((inputp || outputp) && name);
+#ifdef BUILD_UCM
 	if (_snd_is_ucm_device(name)) {
 		name = uc_mgr_alibcfg_by_device(&top, name);
 		if (name == NULL)
 			return -ENODEV;
-	} else {
+	} else
+#endif
+	{
 		err = snd_config_update_ref(&top);
 		if (err < 0)
 			return err;
diff --git a/src/seq/seq.c b/src/seq/seq.c
index f051426f..3330e770 100644
--- a/src/seq/seq.c
+++ b/src/seq/seq.c
@@ -978,11 +978,14 @@ int snd_seq_open(snd_seq_t **seqp, const char *name,
 	int err;
 
 	assert(seqp && name);
+#if BUILD_UCM
 	if (_snd_is_ucm_device(name)) {
 		name = uc_mgr_alibcfg_by_device(&top, name);
 		if (name == NULL)
 			return -ENODEV;
-	} else {
+	} else
+#endif
+	{
 		err = snd_config_update_ref(&top);
 		if (err < 0)
 			return err;
diff --git a/src/timer/timer.c b/src/timer/timer.c
index 6fc710b9..52400058 100644
--- a/src/timer/timer.c
+++ b/src/timer/timer.c
@@ -205,11 +205,14 @@ int snd_timer_open(snd_timer_t **timer, const char *name, int mode)
 	int err;
 
 	assert(timer && name);
+#ifdef BUILD_UCM
 	if (_snd_is_ucm_device(name)) {
 		name = uc_mgr_alibcfg_by_device(&top, name);
 		if (name == NULL)
 			return -ENODEV;
-	} else {
+	} else
+#endif
+	{
 		err = snd_config_update_ref(&top);
 		if (err < 0)
 			return err;
-- 
2.32.0

