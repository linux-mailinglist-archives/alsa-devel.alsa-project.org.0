Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6623F708FCA
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 08:21:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3EFA826;
	Fri, 19 May 2023 08:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3EFA826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684477275;
	bh=UtJNXG/5n+FfQpI/dyVNYU6DpzRT/EpOcfgeHFLYTIc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sreGjuDHOMRyzBnGBg9KDwUD7xgGpCnJzXze08hgNPdVM0kstHpWFNNNXRCTUrNg2
	 I/13QVoCaIMRmAVjuimFISpJtkBzRShbgj+53Y8xdYj4nuH4YOUJCNwVTy8poT/vYP
	 doudBIGvi6bzTGYCtH+j86PqFrOk27u7oIektTPI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D888FF805BD; Fri, 19 May 2023 08:18:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87EDBF805B4;
	Fri, 19 May 2023 08:18:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 373B2F80272; Wed, 17 May 2023 00:37:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2541F8024E
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 00:37:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2541F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=ska/yoAS
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-52c6f8ba7e3so13605813a12.3
        for <alsa-devel@alsa-project.org>;
 Tue, 16 May 2023 15:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684276627; x=1686868627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MJGpY/NrMrg0JPSvmjgjr2tdaUCxwO0LhI4q74mpwfE=;
        b=ska/yoAStgLqoC6IkwvPhKPiq7vXwb59GUYHSaIf8DtpCSLlwOU2aYHAo0+P+Re1AN
         XdEGGSOwLUK9aJJ/qgqkhxfk/cCLHHy7RUBItrWoWClEskoawObzfeLdKUN5Ac8lE/74
         oTUOI8oscxXl8UCiwBmd0lVKStdoA3jxLWruQWGw3hmlT5YuNOKTVVQsIs1EIJZtMAIE
         su0MNU7RgNu5h4ImCfRd5HyTfFfr9jHslAQH9PFLzLN66JbAPR7PvWbJqodEwo6jm/5X
         p0YETctd9o3jsJTE5IEk9C9Qsvx1JcAM6GX8NYjDQn+/Zka0fAk+xtBRLGRqHv0NAm1i
         ndTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684276627; x=1686868627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJGpY/NrMrg0JPSvmjgjr2tdaUCxwO0LhI4q74mpwfE=;
        b=W17ICtMFSdHRa8JtYJLEMX6xVH90a97A+tPvPhDDOBnzOjXuwjvLe/5jmNvNejRLKn
         eKyuD2rqeHMelVySCIJLpYQRJraFm5HOhrIVK71kEDVTSiN7iayFmavXM4de/REALbHq
         A15Ow9hVod68c+tM2j7egKe1USzosEfIh9qlwheyT+xnE5mwcPyCaSh8FDi6D/RUoaLq
         NEDlLVFNdRyf+cWXmck9f5XWdtJSWFBI/cwxcau1gmobz0CsIryb7yaiZI1SpKjudRx1
         h0hKCQuU31AbzZcvMhOkgo2rbwClsAxOt56beeZyIQsPd44vRRJVCqUVXygHExxVh8A4
         IR5w==
X-Gm-Message-State: AC+VfDz5ALfqhxIIUU5CKRfNj7WZspppqUWIM+2qWEkH5LFKBbUVfND2
	XooPvlpy6hysAqkgHtOugxY=
X-Google-Smtp-Source: 
 ACHHUZ4UgpIFYQ3VqL6Zs6iIB+uR3kp7qBDoMHFkDx/rQyJ5l2jMSu8mNXq5xOPBWr7JyPCo88kaVA==
X-Received: by 2002:a05:6a20:7f9d:b0:105:66a1:5d05 with SMTP id
 d29-20020a056a207f9d00b0010566a15d05mr15148395pzj.55.1684276627209;
        Tue, 16 May 2023 15:37:07 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-97-28.dynamic-ip.hinet.net.
 [36.228.97.28])
        by smtp.gmail.com with ESMTPSA id
 b20-20020aa78714000000b0062dbafced27sm11961983pfo.27.2023.05.16.15.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 15:37:06 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Min-Hua Chen <minhuadotchen@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: tegra: tegra210_adx: fix snd_pcm_format_t type
Date: Wed, 17 May 2023 06:36:59 +0800
Message-Id: <20230516223700.185569-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: minhuadotchen@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5LFRQ7TBBTCJESECO5ADLKFS2YINR7X6
X-Message-ID-Hash: 5LFRQ7TBBTCJESECO5ADLKFS2YINR7X6
X-Mailman-Approved-At: Fri, 19 May 2023 06:16:22 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5LFRQ7TBBTCJESECO5ADLKFS2YINR7X6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

use snd_pcm_format_t instead of unsigned int to fix
the following sparse warnings:

sound/soc/tegra/tegra210_adx.c:125:14: sparse: warning: restricted snd_pcm_format_t degrades to integer
sound/soc/tegra/tegra210_adx.c:128:14: sparse: warning: restricted snd_pcm_format_t degrades to integer
sound/soc/tegra/tegra210_adx.c:131:14: sparse: warning: restricted snd_pcm_format_t degrades to integer

Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
---
 sound/soc/tegra/tegra210_adx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index 41117c1d61fb..bd0b10c70c4c 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -109,7 +109,7 @@ static int __maybe_unused tegra210_adx_runtime_resume(struct device *dev)
 
 static int tegra210_adx_set_audio_cif(struct snd_soc_dai *dai,
 				      unsigned int channels,
-				      unsigned int format,
+				      snd_pcm_format_t format,
 				      unsigned int reg)
 {
 	struct tegra210_adx *adx = snd_soc_dai_get_drvdata(dai);
-- 
2.34.1

