Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E89788DCE
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 19:27:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E03D84A;
	Fri, 25 Aug 2023 19:26:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E03D84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692984423;
	bh=6lIAsjfzQ31TGPmRwzbj9mEehySlk7glxjS1fp/ikjk=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aiVmtqi4Gtk4uJOQgK4wZqEuK3FUqBf7f3enKNqCdAzRw54PGpC8mzKEM21Du358P
	 34HH80eQpTH3GNVTfpLy0uMcnv8uLLcEV80jEGsRoK1xpXKSRUTxxrIUYtAhDK5geD
	 yIXYoSbWdSTAWHNz1CjFTIeQf91+NfoggR7QJVUA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92968F80158; Fri, 25 Aug 2023 19:25:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C5EAF800D1;
	Fri, 25 Aug 2023 19:25:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EA05F80158; Fri, 25 Aug 2023 19:23:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AFC3CF800D1
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 19:23:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFC3CF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=L6Fqf83e
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2bcc331f942so14651311fa.0
        for <alsa-devel@alsa-project.org>;
 Fri, 25 Aug 2023 10:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692984200; x=1693589000;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r+IbZPjvkKJyHb1t49FSi3dEugB3CnJDHGvd+okiiCs=;
        b=L6Fqf83e7W5LtDR+x18E59//1P2tJRk15WBcSKAB9RqKpy0FI6/zxZK44xfcvY226t
         3q0OgysfbKZMyiFhlfcAidNIk7MyJp0uNO1bk23xTDjvLum69uOT9ASPZKL3Ps28XMOZ
         fD0IskR25QygVbt0lWRChtt2U6Ei3UbhIEqj0E5IEAQKczz1FK3ER5oNqugYYHBxQ6YZ
         Hrj6Zi1RJ//A8LSZgK/P18Jix1acNjrNTVw4bK9ZChnm9TXeJqN0OxG+oy7P3PDHfq45
         DDMBdVrQCI0+no9eDWdTuhUgfa+XyFpRnME4EALFI2SI1UTrz7w4U+iF5v6Jjjpc5X5g
         DfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692984200; x=1693589000;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+IbZPjvkKJyHb1t49FSi3dEugB3CnJDHGvd+okiiCs=;
        b=Do7+ztuaq/7UgDg85AhOF7E8WA/1KN/W/jX3Tk5RKN7mSyEd1IURncdityehaEz9Gq
         EeRKxIpLY911maUZuC4D5SVCMYFEgbQlCC/PC5lUyo093jAJCOv+UrAWxz9qyBnhgijJ
         z7KrXWdU9HpOZp1VZPGxI3JhwIQ5gcXara3+amlyOSKN7ORbKW8hG770nJ1uYzn8uXBA
         R65yE8H0r3iK2Dpa2t1xCii7UIV3xlxZnkKLSrEjZqG1wOgDbEH23BqPgiSCJnrPG5ko
         yCH3BAI8sOOPWJuYqV/OovG8cU7z2K3CsPhOTr5AsKI46Sk3ifmIEqo6cajD3USqoJ5Q
         oxdg==
X-Gm-Message-State: AOJu0Yxr+FdxAs8jVmZDKyyXQYAuXBPrviKril5tbgEZy6dRKqhMAGoh
	Tf9tnM6iXG9CT34J5bsTfHs0ZA==
X-Google-Smtp-Source: 
 AGHT+IFz74chb8GNV0TvbPeKiDYOfdvYxFbfaLudKM3TO2LC00g7saucA952LOvNyDlPCmD+YEaArQ==
X-Received: by 2002:a2e:8e75:0:b0:2bc:d3b1:d6c1 with SMTP id
 t21-20020a2e8e75000000b002bcd3b1d6c1mr3922260ljk.9.1692984200023;
        Fri, 25 Aug 2023 10:23:20 -0700 (PDT)
Received: from [192.168.1.101] (abxh59.neoplus.adsl.tpnet.pl. [83.9.1.59])
        by smtp.gmail.com with ESMTPSA id
 n11-20020a2e904b000000b002bcb1e1322asm407647ljg.63.2023.08.25.10.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 10:23:19 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] SM6115 TX Macro
Date: Fri, 25 Aug 2023 19:23:11 +0200
Message-Id: <20230825-topic-6115tx-v1-0-ebed201ad54b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH/j6GQC/x2NQQqDMBAAvyJ7diHZEKl+RTwkca0LEiWxRRD/3
 qXHGRjmhspFuMLQ3FD4K1X2rGDbBtIa8ptRZmUgQ868yOO5H5Kws9afF0ZPLhgyfed60CSGyhh
 LyGnVKH+2TeVReJHr/xin5/kBQbU9P3MAAAA=
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692984198; l=733;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=6lIAsjfzQ31TGPmRwzbj9mEehySlk7glxjS1fp/ikjk=;
 b=95YZjoDqhfV8cGN0KBrCUDtJnXEOnqGCQEDqlozHGrWV3GbSNhrb33HP9DBfPL4rahhYhRC1E
 ljV9+8EF/L5CUQ40uPHOJqDbueF3gRSLJ5JkXAgwEm/uv2EzWNBmKF7
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Message-ID-Hash: AHPPWWT57N75K6AQHC2MTNX2PT6L4QTC
X-Message-ID-Hash: AHPPWWT57N75K6AQHC2MTNX2PT6L4QTC
X-MailFrom: konrad.dybcio@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AHPPWWT57N75K6AQHC2MTNX2PT6L4QTC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Like most Qualcomm SoCs, SM6115 has a TX Macro.

Only some minor changes were required.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      ASoC: dt-bindings: qcom,lpass-tx-macro: Add SM6115
      ASoC: codecs: lpass-tx-macro: Add SM6115 support

 .../bindings/sound/qcom,lpass-tx-macro.yaml        | 18 ++++++++++++++++++
 sound/soc/codecs/lpass-macro-common.h              |  2 ++
 sound/soc/codecs/lpass-tx-macro.c                  | 22 +++++++++++++++-------
 3 files changed, 35 insertions(+), 7 deletions(-)
---
base-commit: 6269320850097903b30be8f07a5c61d9f7592393
change-id: 20230825-topic-6115tx-b523a0209639

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

