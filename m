Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 146DD6E4B2F
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 16:16:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D286DF5;
	Mon, 17 Apr 2023 16:16:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D286DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681741010;
	bh=ft0SiYRyQvLooirrWYeXmQFGpIOdf5+zsXqG908/Fe0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qSgYPPpvsxEyJcPF++FjTMMJ3kB8IbhSxqfgw1hCid5j4q3Dszt/RZn0glkTlyXth
	 JYXHLF1FfPq7c49LO84qM1KEgwhyG16PR6xSilKOsz0jIZC4dkWiZdCTfc1emCVpu8
	 PP0W3AQnd7i03vtZRB7OTBhNfzman8nXu/nGTjy0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB37BF80524;
	Mon, 17 Apr 2023 16:15:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F0D7F8049C; Mon, 17 Apr 2023 16:15:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 957E6F8025D
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 16:15:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 957E6F8025D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YATFDIf1
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5067736607fso3080458a12.0
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Apr 2023 07:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681740899; x=1684332899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQmIdP3RJKa4pxnl8xRRCwok/HaLYslpm8yDZiO67M8=;
        b=YATFDIf1tAx0aaKR/kVjChTDSUWOUhhDgFiTENafwW1rgezl7ILWfZWDw7oLDEc87Z
         WAeF8koTDqiRrZERt0r5ffbpmiST9jLq98jNACPzcNl8xc9i1n6uTg9yHpYkniMzqqOb
         aD+QzPlJ8NBVDHP02Frk2E6BEEKg2xV+qMvhMbWghNmVHZyfRwU4g23CMLjuDATcepUT
         oOLNzDjPSi0ISjl6KGii894jUlFkCB/i10NRV2OYEUh90uc7zKQb+cGedzuwuJ9ExXrj
         dlFdJzyayYN8rsX0TE55PsClsyyjgAHlMZx98V9EM2F2IC6D4G5Su4RsT0QStuq0wxfI
         WGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681740899; x=1684332899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQmIdP3RJKa4pxnl8xRRCwok/HaLYslpm8yDZiO67M8=;
        b=KkU0REG++ku3pppKtnouub6XYQHDPQkjpALToGibg0jUX0lO3RHGPrWTHRVxbJ2LfH
         EQ3mriCnSSFESXh4qdxCI/DoSpedcc95SYsduwhgO2/795aKXhMopc/mRSOmlB1yjpCD
         Y0WSGXGTCYkKipu73Semu51zshB1oeaPNQpGv0yEhSJzUOnFXSpSRmdxowAA5n//k/C3
         piilbrk11BBV24clm72EsuVTb5RCJYYM9TtUW/leEeo2OYo0xHrPAE3Wgv4Be0GpGqrz
         YXM8jsOhagya2WdNy9P0vGO+n511h9LflsqXjQGeZvpy3Pg9ubZejTQvYSQUj1kjJWho
         MLmw==
X-Gm-Message-State: AAQBX9fAUWBjKZi9dZFu+T0lwEniR1rfC7IRxsv+s1YQTu1ccMYhB4+M
	KAgIaGh1tm5EY6fNJ1lIHf5WVw==
X-Google-Smtp-Source: 
 AKy350bRPznj0J6IQHjCFui2MZsj2ItlqRKRcsBx6mlmVaNEguH3nVSNRhQE5soAROe85/63hO39ow==
X-Received: by 2002:aa7:c90b:0:b0:506:7385:9653 with SMTP id
 b11-20020aa7c90b000000b0050673859653mr13444306edt.39.1681740898824;
        Mon, 17 Apr 2023 07:14:58 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:96aa:60eb:e021:6511])
        by smtp.gmail.com with ESMTPSA id
 q6-20020a056402040600b004f9e6495f94sm5832034edv.50.2023.04.17.07.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 07:14:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] ASoC: codecs: wcd934x: Simplify &pdev->dev in probe
Date: Mon, 17 Apr 2023 16:14:52 +0200
Message-Id: <20230417141453.919158-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230417141453.919158-1-krzysztof.kozlowski@linaro.org>
References: <20230417141453.919158-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PHGS5CWLL66NIQZGLBWSXUO6FEQVANQT
X-Message-ID-Hash: PHGS5CWLL66NIQZGLBWSXUO6FEQVANQT
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PHGS5CWLL66NIQZGLBWSXUO6FEQVANQT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The probe already stores pointer to &pdev->dev, so use it to make the
code a bit easier to read.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 56487ad2f048..c0d1fa36d841 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -5892,12 +5892,12 @@ static int wcd934x_codec_parse_data(struct wcd934x_codec *wcd)
 
 static int wcd934x_codec_probe(struct platform_device *pdev)
 {
-	struct wcd934x_ddata *data = dev_get_drvdata(pdev->dev.parent);
-	struct wcd934x_codec *wcd;
 	struct device *dev = &pdev->dev;
+	struct wcd934x_ddata *data = dev_get_drvdata(dev->parent);
+	struct wcd934x_codec *wcd;
 	int ret, irq;
 
-	wcd = devm_kzalloc(&pdev->dev, sizeof(*wcd), GFP_KERNEL);
+	wcd = devm_kzalloc(dev, sizeof(*wcd), GFP_KERNEL);
 	if (!wcd)
 		return -ENOMEM;
 
-- 
2.34.1

