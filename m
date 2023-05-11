Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4781F6FF9B2
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 20:57:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DDD911C;
	Thu, 11 May 2023 20:56:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DDD911C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683831459;
	bh=DkitLX5tL4D4rIAR1mvc5FQJv/aacb25zLCPOng3ciU=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W1CaZbNSCSZtUZCnbhX3ixnpAByZys2d6g0tIo8EoWIb+25ROiUBkvYxyDrzWQVQC
	 hrbtYm3RyTipDdwNlNUZ3b+OWE9oH4Zu8biqGwTVHAFuguVZgyVYes+IxfSbVYMCqR
	 o00FCOhwO7ohYM1tzTmCkn3Cj8HkkWMoUDplCDUM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3D26F805D2; Thu, 11 May 2023 20:54:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E439F805C9;
	Thu, 11 May 2023 20:54:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1315F8032D; Thu, 11 May 2023 14:10:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69D59F80217
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 14:09:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69D59F80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=Fm3IUSrI
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-b9a6f15287eso16715117276.1
        for <alsa-devel@alsa-project.org>;
 Thu, 11 May 2023 05:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683806960; x=1686398960;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t2dsf61YMVY92FH7C3AkmJ5nwGxSUh4djoxlEJxPoZg=;
        b=Fm3IUSrIO6dioGkB92APGdJb1osx2Ot5x0wCO0UEqBQxCBUdYRoNP0KTWyt0fb70Z0
         0GZSXmqWDxptjteEYn/qpcdE3yJHtilD+khIiE1vi4zw/AqIe479LJ4+t3TRLfs0Hdrv
         qbcjIG5lSktyPDi9KHlTeqCOUH7pHWTNq5r4ShzUSGY7NaUgc2zZwhMJSkbgwMMxOJSC
         DqRXkK8qmW3F9pIsE4iFTRoojuExst1QgA6FCVanvZ9KBnCHcCJUbqqcmSE2bqSlddut
         hxMPdslmmdXESjFTPjiGZ4FC5RgqE65456Ln6uVnae+wXDl01twwgL5I6yU553ow6I9w
         eCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683806960; x=1686398960;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t2dsf61YMVY92FH7C3AkmJ5nwGxSUh4djoxlEJxPoZg=;
        b=Lc2NH7n5zxlcGMWwjBxRLaIihgBRXBujtkJ/ehKr7VjHUJ0AzsHtWwOVyFEzpfZgho
         TW9yjtuAYdxv0dikvjM8DQEQRlACXMdSObd2XnecDNn4eNsugiNagEE9oz+haam5fWmZ
         3anfevIyrS6hurBSjIMoGDM5alcJsyOFNaXFzmttTFUrB9iwJr4H1MXWiXmcoz29Abjx
         oZn39ZdQMQohRWwTX1EnBJnN/XbPbqdUkOt6PNzXUJpwKkavIonOd7JI63uY/VeATdmi
         My11AGhFnr4Dx/XGILcNd/8/sbt27yC79zLdNvLmEHu5U86Mb6pLYeQ5UWmXzIScevkP
         zE6Q==
X-Gm-Message-State: AC+VfDzPG46w3Wi4646gBJKm4YoOryOMUuFY+ZxcQjT79pKx8sN8JiCy
	7jZRWd1TQYc1Rw9oFFOIF0CUZ02yGjCXqZlNjA==
X-Google-Smtp-Source: 
 ACHHUZ6MK+BdZXJuYQp0xdPqOukDcGy3FtdWiMye4msSsyxhUqmlwxjZSZ+VYlg2JzBOa89RPQhW3k2qNI+UA5zS7w==
X-Received: from yixuanjiang.ntc.corp.google.com
 ([2401:fa00:fc:202:6c9a:64c9:7e44:6b1d])
 (user=yixuanjiang job=sendgmr) by 2002:a05:6902:d2:b0:b9e:6fce:4f6d with SMTP
 id i18-20020a05690200d200b00b9e6fce4f6dmr13046837ybs.2.1683806960728; Thu, 11
 May 2023 05:09:20 -0700 (PDT)
Date: Thu, 11 May 2023 20:08:37 +0800
In-Reply-To: <20230511120841.2096524-1-yixuanjiang@google.com>
Mime-Version: 1.0
References: <20230511120841.2096524-1-yixuanjiang@google.com>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
Message-ID: <20230511120841.2096524-3-yixuanjiang@google.com>
Subject: [PATCH 2/6] ASoC: soc-pcm: align BE 'atomicity' with that of the FE
From: yixuanjiang <yixuanjiang@google.com>
To: tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Yixuan Jiang <yixuanjiang@google.com>,
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: 
 38NpcZAsKCkM3n2zfsonfsllttlqj.htrfqxf-ij0jqfqxf-uwtojhy.twl@flex--yixuanjiang.bounces.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YY6IRHZQBLUD624ZFMXJMW3EP6U4WM6Y
X-Message-ID-Hash: YY6IRHZQBLUD624ZFMXJMW3EP6U4WM6Y
X-Mailman-Approved-At: Thu, 11 May 2023 18:54:31 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YY6IRHZQBLUD624ZFMXJMW3EP6U4WM6Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit bbf7d3b1c4f40eb02dd1dffb500ba00b0bff0303 ]

Since the flow for DPCM is based on taking a lock for the FE first, we
need to make sure during the connection between a BE and an FE that
they both use the same 'atomicity', otherwise we may sleep in atomic
context.

If the FE is nonatomic, this patch forces the BE to be nonatomic as
well. That should have no negative impact since the BE 'inherits' the
FE properties.

However, if the FE is atomic and the BE is not, then the configuration
is flagged as invalid.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
[ removed FE stream lock by tiwai ]
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/20211207173745.15850-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Fixes: aa9ff6a4955f ("ASoC: soc-compress: Reposition and add pcm_mutex")
Signed-off-by: Yixuan Jiang <yixuanjiang@google.com>
Cc: stable@vger.kernel.org # 5.15+
---
 sound/soc/soc-pcm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index cffae9b7c2548..373f20bd14301 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1123,6 +1123,8 @@ static snd_pcm_uframes_t soc_pcm_pointer(struct snd_pcm_substream *substream)
 static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
 		struct snd_soc_pcm_runtime *be, int stream)
 {
+	struct snd_pcm_substream *fe_substream;
+	struct snd_pcm_substream *be_substream;
 	struct snd_soc_dpcm *dpcm;
 	unsigned long flags;
 
@@ -1132,6 +1134,20 @@ static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
 			return 0;
 	}
 
+	fe_substream = snd_soc_dpcm_get_substream(fe, stream);
+	be_substream = snd_soc_dpcm_get_substream(be, stream);
+
+	if (!fe_substream->pcm->nonatomic && be_substream->pcm->nonatomic) {
+		dev_err(be->dev, "%s: FE is atomic but BE is nonatomic, invalid configuration\n",
+			__func__);
+		return -EINVAL;
+	}
+	if (fe_substream->pcm->nonatomic && !be_substream->pcm->nonatomic) {
+		dev_warn(be->dev, "%s: FE is nonatomic but BE is not, forcing BE as nonatomic\n",
+			 __func__);
+		be_substream->pcm->nonatomic = 1;
+	}
+
 	dpcm = kzalloc(sizeof(struct snd_soc_dpcm), GFP_ATOMIC);
 	if (!dpcm)
 		return -ENOMEM;
-- 
2.40.1.521.gf1e218fcd8-goog

