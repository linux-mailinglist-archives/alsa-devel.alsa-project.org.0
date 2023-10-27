Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4B07D95CE
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 12:59:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4E57AE8;
	Fri, 27 Oct 2023 12:58:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4E57AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698404344;
	bh=zAvaV06YJ2/SQ05Fz7vKEq7Ah090FwIuCHI0H64w4oU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=V3tspL8wTYXOy+ESplLc/qh7XrA+BqR3FO7pB7wwmFbHRRup9IUbDIwBw7cWF1iLB
	 I6qvNoC0RrUm6v++NYofWB7Vh3A898loccykYnS23spNt5VP8MJ2s80a5YfBe/oXjP
	 jJKtnSGdisDE7NvU6IsiJ5SD3bTRsUYgkDA5pCWo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFE1AF8024E; Fri, 27 Oct 2023 12:58:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6552AF80165;
	Fri, 27 Oct 2023 12:58:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89228F8020D; Fri, 27 Oct 2023 12:58:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 181D1F8012B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 12:58:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 181D1F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=W6O35PmN
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4079ed65582so14150275e9.1
        for <alsa-devel@alsa-project.org>;
 Fri, 27 Oct 2023 03:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698404285; x=1699009085;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RBxCYwkgwqvXS64i1/f9pn1wIDxm2mMEk8PWmVP+ZkI=;
        b=W6O35PmNp/KkexX2d9BrpxRukOnqose/uOCAmTUY0hZ/CTIETrjTJSx2pLsLuYLX7o
         I7fTAYtr+0k8R04fkV4499t3EWiRQy4k2CahcC/PaMVg/GyrcBrT+fNlkQcql1HxhkyG
         3Ezc4UqMcVvNk1XN7I3+qFrqNr3CPqyq4VgDiE194UFS0DaCXUOtCiYUOzISJODna9/X
         D2tvVAn5N4qv1R/l55GibF1D7TbeknBfI8Fo7obnQkYz5VLGR7nqUAICIaMkGKo+KANB
         cTZMWKH3LbyX4//WWAaHrwTk99ymtoMDcMI05mn23a9QjSZ48+n+l0PP7zDofsGbU+0R
         qjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698404285; x=1699009085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RBxCYwkgwqvXS64i1/f9pn1wIDxm2mMEk8PWmVP+ZkI=;
        b=Kx1iweehsgBHxJ42SArWop2hhWBerie9hcsKtVi65FkgvuzV3cxB5laTiwd4xbyXiw
         9k5LI/+LIRjJHkxqcw0W+OahPju51f7/T4eRqL3hG6n6Z2lrIxx1h+Ey9YKNLYoDyihQ
         ZPP0en+oHtikcTItsL0GZPhvQW0Wnjn8/RhLH+nfkCYWNKf3DsDTmNuuWmqzUPXwbkAR
         CEvCqy9/E0UKfXGfrgJij6BbVM8Kf4kGh3IxJTStqaOkU06STgMTY39VxIPQevG0oOqe
         zy09g8EN2NikL2hedEIXUmm01PVrqrhhtXTcRpx8ywuL5oxesWaEOUqoQORzgHquvAVt
         BqLg==
X-Gm-Message-State: AOJu0YwtiVrxeM0Q4PkmNyYC+4hkcB+g6zCRIkYctdJmQNOtenf4jlA0
	ZvrU2qklJ5BO/rHnJv03ohcraw==
X-Google-Smtp-Source: 
 AGHT+IGZYEf8c+/lua8h+SnSoJB5LjGPN4HkF+8ldxt9U7atl2DIxT1TcVgudaTiKc5lMJP/26iErg==
X-Received: by 2002:a05:600c:1546:b0:3fe:4cbc:c345 with SMTP id
 f6-20020a05600c154600b003fe4cbcc345mr2034089wmg.41.1698404285012;
        Fri, 27 Oct 2023 03:58:05 -0700 (PDT)
Received: from srini-hackbox.lan ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 ay32-20020a05600c1e2000b004065daba6casm4819626wmb.46.2023.10.27.03.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 03:58:04 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Cc: johan@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RFC PATCH 0/2] ASoC: soc-dai: add flag to mute and unmute stream
 during trigger.
Date: Fri, 27 Oct 2023 11:57:45 +0100
Message-Id: <20231027105747.32450-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LBC474LOHALII6DS6IGYG5NSA6PRT2ZL
X-Message-ID-Hash: LBC474LOHALII6DS6IGYG5NSA6PRT2ZL
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LBC474LOHALII6DS6IGYG5NSA6PRT2ZL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Click/Pop Noise was a long pending issue with WSA Codecs which are prone
to accumlate DC when ports are active but without any data streams.
There are multiple places in the current setup, where this could happen
in both startup as well as shutdown path.

This patchset adds a new flag mute_unmute_on_trigger to dai_ops to let
generic code do the mute/unmute on trigger.

This patches help fix those issues by making sure the PA is Muted/Unmuted
inline with the stream start/stop events.


Srinivas Kandagatla (2):
  ASoC: soc-dai: add flag to mute and unmute stream during trigger
  ASoC: codecs: wsa883x: make use of new mute_unmute_on_trigger flag

 include/sound/soc-dai.h    |  1 +
 sound/soc/codecs/wsa883x.c |  7 +------
 sound/soc/soc-dai.c        |  7 +++++++
 sound/soc/soc-pcm.c        | 12 ++++++++----
 4 files changed, 17 insertions(+), 10 deletions(-)

-- 
2.21.0

