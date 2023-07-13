Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F778751ACE
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 10:08:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7ED0207;
	Thu, 13 Jul 2023 10:07:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7ED0207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689235689;
	bh=u8/1Ke69uTiV1kx6vnwfL57G/ak/cvE+6M63Jr4+byY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=E6o7dTu8T8qpYR2+edf5mqAbua8RHtgpGJ/UUeCFxzIm++1DyOylTTqSfW9Ju/io1
	 cSBo6teIkCaFsoJQbc5egCW7yWxQ1Oyk98atLGQANdV4i1LZRoS89/DUSQjfhg9yoz
	 j8a9Z34ENGu26vZRtQk1jIwGtwZBFxK5oNgTqp1M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36417F80558; Thu, 13 Jul 2023 10:06:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B77E8F800E4;
	Thu, 13 Jul 2023 10:06:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6757F8024E; Thu, 13 Jul 2023 10:00:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 143E3F80153
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 10:00:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 143E3F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=ZPCjuNgz
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fb7bbbfa95so133173e87.0
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Jul 2023 01:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689235205; x=1689840005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f23IFSdAOOx9PAA+0aLReuK2qCBP8wxWyzhLV70mA1Y=;
        b=ZPCjuNgzjHKy2ukXiMpF5+1SaokuO4SFHcj6+qof6IjynhPZbDizhhjdWOE0RpuNPR
         NhghNqr7XvvXoxL9KbOnd9NKm+a3waju4+jxeXmyICV7qkn5Hay6z5+3dHFDtwmG5flN
         wLa4R3ocItGUmtWTw7j2PCiF9lzuxFIuJFRVCA54nmFogl5IGt51PPsNZWIxWOT/2Ggo
         4jHKcLNDQxYzqViUb52biOOzzXZZyI5fkkUX2K9xc9xB166kLY/tJzbtDQzdWRStlF1m
         t8qapuor1wm5GWV5FFM/bjDXG4tLmpmQoxzihdCdls6rnKiy0zyjSCvlxUp6FPnzpwIt
         pouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689235205; x=1689840005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f23IFSdAOOx9PAA+0aLReuK2qCBP8wxWyzhLV70mA1Y=;
        b=g1Dgi9wSw+Fk4p9/ZLwtG1V2i/DZA/z/WhdM+rmJg3Dgua5TwSVTKVfcr3gBHjKhmb
         qIx+xw81B19wjH2iRfYPmAGohrO8IhRefMBUr3smuvqlgcZmcUR+0EV79CFINhj4QXfH
         dHqG1nEaue6JGxH8JSxpsvYLr0Q+L7SefVXC9+IKkPcP5m7ru7tEIKB9Rllqp5X9QB/f
         MUSlyAkNvwCHr/yU51gYjjfXR4e6Fr2mVT9Eci5gAWu0QARWN9/F4cy/DRkvG4XUNVm7
         3fPzwQhheg4hFDnRwH8P9+Nv9BLnt5kkXjfYa4IhYKwa80w/Az0rAZOnGflC4XUJoQiT
         QZpQ==
X-Gm-Message-State: ABy/qLYnfNZCdqZ8OdDZKCmp+nUouk2/Ndk0A13Wea1W2EvpFieIr63m
	lip7yXrP+oEMpiL0Nzuaq7I=
X-Google-Smtp-Source: 
 APBJJlGtg3kc9cR2gS2y8xggbKx8I5ncgNvVW0HhONStlpTat/Dts17uh0AzUS7JnmEXKghRuez/yw==
X-Received: by 2002:ac2:53ad:0:b0:4fa:73ea:aa2d with SMTP id
 j13-20020ac253ad000000b004fa73eaaa2dmr487312lfh.4.1689235204577;
        Thu, 13 Jul 2023 01:00:04 -0700 (PDT)
Received: from ivan-HLYL-WXX9.. ([178.160.196.94])
        by smtp.gmail.com with ESMTPSA id
 q8-20020ac25288000000b004fb8c0f247fsm1011385lfm.129.2023.07.13.01.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 01:00:04 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] ALSA: pcmtest: Add 'open' PCM callback error injection
Date: Thu, 13 Jul 2023 11:59:52 +0400
Message-Id: <20230713075953.13692-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SUI3LVY447PK6K3QFBMHK5WRCGMDPHLN
X-Message-ID-Hash: SUI3LVY447PK6K3QFBMHK5WRCGMDPHLN
X-Mailman-Approved-At: Thu, 13 Jul 2023 08:06:23 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SUI3LVY447PK6K3QFBMHK5WRCGMDPHLN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Extend 'pcmtest' virtual driver with 'open' callback error injection
functionality, as it already can inject errors into other PCM callbacks.
Add module parameter which enables EBUSY error injection in the 'open'
PCM callback.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
V1 -> V2:
- Split changes in the patch into two different patches

 sound/drivers/pcmtest.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 291e7fe47893..e74c523e49eb 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -65,6 +65,7 @@ static int inject_delay;
 static bool inject_hwpars_err;
 static bool inject_prepare_err;
 static bool inject_trigger_err;
+static bool inject_open_err;
 
 static short fill_mode = FILL_MODE_PAT;
 
@@ -88,6 +89,9 @@ module_param(inject_prepare_err, bool, 0600);
 MODULE_PARM_DESC(inject_prepare_err, "Inject EINVAL error in the 'prepare' callback");
 module_param(inject_trigger_err, bool, 0600);
 MODULE_PARM_DESC(inject_trigger_err, "Inject EINVAL error in the 'trigger' callback");
+module_param(inject_open_err, bool, 0600);
+MODULE_PARM_DESC(inject_open_err, "Inject EBUSY error in the 'open' callback");
+
 
 struct pcmtst {
 	struct snd_pcm *pcm;
@@ -364,6 +368,9 @@ static int snd_pcmtst_pcm_open(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct pcmtst_buf_iter *v_iter;
 
+	if (inject_open_err)
+		return -EBUSY;
+
 	v_iter = kzalloc(sizeof(*v_iter), GFP_KERNEL);
 	if (!v_iter)
 		return -ENOMEM;
-- 
2.34.1

