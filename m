Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0E863B676
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 01:18:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 794A51695;
	Tue, 29 Nov 2022 01:17:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 794A51695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669681083;
	bh=x5J8+kLqLXIzYjvfw1LhMuIeGhJTWDs2YXkaYMfwO6U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l5qXbIHU6VHSncQifebi+uFs6DmGHQEPGUImH/AwBJC3KKY4y61yDe9jXUR25jWR1
	 2bJfvUZbbrxtd2ktACt8ur0jk8WjaVMKz18VO2GDaResAUkeuHyIDGlhcA3nCiZSxH
	 vzWfKGNrdOgu7UwGb6o+Qp4Qogrptd9M4Ngba1N0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F13D0F8024C;
	Tue, 29 Nov 2022 01:17:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17861F8020D; Tue, 29 Nov 2022 01:17:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E198EF80166
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 01:16:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E198EF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="DQs1Hqu7"
Received: by mail-io1-xd29.google.com with SMTP id h206so8935373iof.10
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 16:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gA7jpYl6yV6P4juXicdMOmof7r1j/N5hUrukqrPzGdk=;
 b=DQs1Hqu73bNAJW0k4CHMP/GFzfmwIUvzkUhQZaJ16ASZJ+TVA84Uz1ZP4lfZD1yEpm
 KGFsQvcP4ne79puTyiCDAu2YusMevht3J9nQCgk5pWCogA/prSxN+g1dt8YrLpRHll0O
 8D3SjMY5yHIP9U9huqa3c15zkiE1NJbD9ihwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gA7jpYl6yV6P4juXicdMOmof7r1j/N5hUrukqrPzGdk=;
 b=LMYXIa1PJ93f7ddE0OW+lt9HRea0wvvrTkEXEtNVIbn3WUchRhDy3GBAGF7A0tt0pK
 9LkMZ7or20nH88BJtB802YPHVm2Bg7c/MPQFN+2Cuao3iKT8piCdD+EvqTfpIu2J6hsX
 eLXfJPDus1MDT140dY7SoyCHZLJaV9sMTmgwTmwmOAZZR5uH6dtTQDelQF0XHWbC962u
 6EXlnp1e/FMDRc2lIYx8z9XXC7oTcXYIw2bLQxjk4uz1yGv9E0DSxWekD60RK5eDhlY5
 ZD7JDxdfiRtTX6hSWcAmh0k1/cCyhaZNkBRPiY5qGg4qQZR4SMjwgVWKpyV43AJDYz1L
 DXhQ==
X-Gm-Message-State: ANoB5pn6JPw3QgkH3iIze8gUhMokepRi2MP6AnhHvgtL12ZVuWhT8YII
 ekimUrvCEh3au74PcIzpQBmbSw==
X-Google-Smtp-Source: AA0mqf5O/zpf9bI5X01LNRcc5En7D9DRQc+o4PEsnb6Zkk3bOUWAm6FvBfwZDdw+4jQexdhSlJqa/Q==
X-Received: by 2002:a05:6638:535:b0:375:b7f:daec with SMTP id
 j21-20020a056638053500b003750b7fdaecmr6888722jar.154.1669681017666; 
 Mon, 28 Nov 2022 16:16:57 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
 by smtp.gmail.com with UTF8SMTPSA id
 m12-20020a02a14c000000b003636cb862d0sm4884318jah.42.2022.11.28.16.16.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 16:16:57 -0800 (PST)
From: Matthias Kaehlcke <mka@chromium.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2] ASoC: qcom: lpass-sc7180: Delete redundant error log from
 _resume()
Date: Tue, 29 Nov 2022 00:16:54 +0000
Message-Id: <20221129001633.v2.1.I8d1993f41f0da1eac0ecba321678ac489f9c0b9b@changeid>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Judy Hsiao <judyhsiao@google.com>,
 Banajit Goswami <bgoswami@codeaurora.org>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Douglas Anderson <dianders@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

sc7180_lpass_dev_resume() logs an error if clk_bulk_prepare_enable()
fails. The clock framework already generates error logs if anything
goes wrong, so the logging in _resume() is redundant, drop it.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v2:
- removed the log in the error path (requested by Doug)
- updated subject (was "ASoC: qcom: lpass-sc7180: Return 0 instead
  of 'ret' at the end of _resume()") and commit message

 sound/soc/qcom/lpass-sc7180.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
index 6ad1c5b5f2de..db3be15cf14c 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -162,15 +162,9 @@ static int sc7180_lpass_exit(struct platform_device *pdev)
 
 static int sc7180_lpass_dev_resume(struct device *dev)
 {
-	int ret = 0;
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
 
-	ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
-	if (ret) {
-		dev_err(dev, "sc7180 clk prepare and enable failed\n");
-		return ret;
-	}
-	return ret;
+	return clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
 }
 
 static int sc7180_lpass_dev_suspend(struct device *dev)
-- 
2.38.1.584.g0f3c55d4c2-goog

