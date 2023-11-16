Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E90727EE599
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Nov 2023 17:58:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F964828;
	Thu, 16 Nov 2023 17:57:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F964828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700153915;
	bh=8TwU+1Om6lh0afb2H99nNUlGqcV9sSNIjeyBg+eWEbs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bKOZBBsArGDhEVH0/cJulkpdOHRvrjPMN0WMwVAPzRZntlWCTCLKPZHgN8wO7BGdK
	 91bCgxuayBeGe3SbjXDRMyCP9jYVTia2VxwhWH74Q5JdNn8adbPxicnLyNmmzsTUW7
	 afJ0dtdgdfu0D+NGYWWn+XZ9AXvzAUUKbQNavaY0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A3B2F802E8; Thu, 16 Nov 2023 17:57:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00B57F8016E;
	Thu, 16 Nov 2023 17:57:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6770F801D5; Thu, 16 Nov 2023 13:52:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34902F80166
	for <alsa-devel@alsa-project.org>; Thu, 16 Nov 2023 13:52:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34902F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cb+ZpAFr
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9e623356e59so111267166b.0
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Nov 2023 04:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700139139; x=1700743939;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sL10YvM1YU8R6lo2ORtfYeaqpfTntqniPVIvmwAyX5o=;
        b=cb+ZpAFrp4eH1uKczhX385eGE/c3F+vwmKgObUQYjid93ePvRaiAJbOQPqPpgCBTdk
         JO8GW93uwk8FtXHz2qdiGXTjaos7lqDEnVGHe2DPZyEOeWvtwrCtmR6Oynzax94ddEo1
         1pcHTHPt9vLQbuCMmDrSx449B441ScasL2ZH5sUTXBK/sNPq561WLjwpZUuIUbIUDc/b
         QZ2gATuqEK+BgQ0JcLCP9OXLQ6oNlY1aoupifEHVM/NmzlUPLPAclGqFkBoyS2/6EIcQ
         fhSUCkyEHTouckdU3pgmGYHiThXy4Qji6Nh8eZ8zn6ZuQqMiQb4/jOzxPT4YsZCvuAnc
         B1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700139139; x=1700743939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sL10YvM1YU8R6lo2ORtfYeaqpfTntqniPVIvmwAyX5o=;
        b=dHSUORmWzsUEfHgNnAEDUiZ/wtKv7ItJp9b3Z9tS0RnwJU96Qx0HoY7QhPML/jqngC
         NRGqp0pw0DO1Fr5PoTQB6jFKNYMOHFYpO7S8XthgYo9sNvz2dms5qOohRakmZpjzM8k3
         hOi3xLskX3Ulz0Ms+HwThUlfIsWMpSR3E13+cLQQegi3nSCWiQAkPDojdWHpdEQPHWvc
         RHVjUDRTeEV5xChj44I1ONAYHnAm2YP2RMgakXhSw9Oji8twjCPzsdpQdCISoCSOOckp
         dcLKwWvq2uOAxFeStNXzLJIzC//ZaE6IaPr8jnpXeUYtprruOiGFcI+A0oeuSvcXYE9Q
         bnqA==
X-Gm-Message-State: AOJu0YxzWL3LTkcS8wI5pLL3nHIdYpzdtNVq2AM070ZGz1BYbC8jpI3k
	Xyko2B9vHSWtVeBJWM/V0QM=
X-Google-Smtp-Source: 
 AGHT+IFUVWfNWN9IRaVZk99cLw9hffggPTg0o/XoJEFMI8KPLZveiyqq0duxoYCVGpa6E1JJTGXXFA==
X-Received: by 2002:a17:906:1919:b0:9e4:121c:b9fd with SMTP id
 a25-20020a170906191900b009e4121cb9fdmr12495678eje.12.1700139139103;
        Thu, 16 Nov 2023 04:52:19 -0800 (PST)
Received: from IFM10N30752.intra.ifm (87-206-74-243.dynamic.chello.pl.
 [87.206.74.243])
        by smtp.gmail.com with ESMTPSA id
 l26-20020a170906231a00b009e50ea0a05asm8378645eja.99.2023.11.16.04.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 04:52:18 -0800 (PST)
From: Kamil Duljas <kamil.duljas@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
	Kamil Duljas <kamil.duljas@gmail.com>
Subject: [PATCH] ASoC: Intel: Skylake: Fix mem leak in few functions
Date: Thu, 16 Nov 2023 13:51:50 +0100
Message-Id: <20231116125150.1436-1-kamil.duljas@gmail.com>
X-Mailer: git-send-email 2.35.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: kamil.duljas@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QRFDNOWWK5GBF5FY2ZJ2UF56J734QD6M
X-Message-ID-Hash: QRFDNOWWK5GBF5FY2ZJ2UF56J734QD6M
X-Mailman-Approved-At: Thu, 16 Nov 2023 16:57:40 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QRFDNOWWK5GBF5FY2ZJ2UF56J734QD6M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The resources should be freed when function return error.

Signed-off-by: Kamil Duljas <kamil.duljas@gmail.com>
---
 sound/soc/intel/skylake/skl-pcm.c     | 4 +++-
 sound/soc/intel/skylake/skl-sst-ipc.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index d0c02e8a6785..18866bc415a5 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -240,8 +240,10 @@ static int skl_pcm_open(struct snd_pcm_substream *substream,
 	snd_pcm_set_sync(substream);
 
 	mconfig = skl_tplg_fe_get_cpr_module(dai, substream->stream);
-	if (!mconfig)
+	if (!mconfig) {
+		kfree(dma_params);
 		return -EINVAL;
+	}
 
 	skl_tplg_d0i3_get(skl, mconfig->d0i3_caps);
 
diff --git a/sound/soc/intel/skylake/skl-sst-ipc.c b/sound/soc/intel/skylake/skl-sst-ipc.c
index 7a425271b08b..fd9624ad5f72 100644
--- a/sound/soc/intel/skylake/skl-sst-ipc.c
+++ b/sound/soc/intel/skylake/skl-sst-ipc.c
@@ -1003,8 +1003,10 @@ int skl_ipc_get_large_config(struct sst_generic_ipc *ipc,
 
 	reply.size = (reply.header >> 32) & IPC_DATA_OFFSET_SZ_MASK;
 	buf = krealloc(reply.data, reply.size, GFP_KERNEL);
-	if (!buf)
+	if (!buf) {
+		kfree(reply.data);
 		return -ENOMEM;
+	}
 	*payload = buf;
 	*bytes = reply.size;
 
-- 
2.35.2.windows.1

