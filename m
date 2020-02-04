Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF571518C9
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Feb 2020 11:26:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A10D8168E;
	Tue,  4 Feb 2020 11:25:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A10D8168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580811990;
	bh=8+HpeCNyoh1MSeB8RXZnMQutlODCZFcBWO4WHAdsvz4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gMqdYp73jQ+qo4QzlkQdJpKGuJNIPb4kKG0DvxcbcUHWqBMzOZxkwFlr/7Z73IgGo
	 M6/yD9saGKvnF0g7b6YtMcLtwAWrM+njbxqwlqZF3LgKlZbEvwZqURkwh1BoAFibKa
	 zLhtDcTc+AfERefIOaXdtULVglmtViQMuL8NMri8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE333F801DB;
	Tue,  4 Feb 2020 11:24:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09418F80162; Tue,  4 Feb 2020 11:24:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0779F800F4
 for <alsa-devel@alsa-project.org>; Tue,  4 Feb 2020 11:24:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0779F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="e/8fpH8c"
Received: by mail-wm1-x341.google.com with SMTP id q9so2585457wmj.5
 for <alsa-devel@alsa-project.org>; Tue, 04 Feb 2020 02:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HcMMJQIo94sDORwN3NPMMwEJv40Fu1AswMuILXzE1Po=;
 b=e/8fpH8ceuC4QoxlYq1ClcUtM2PODeUMfpJQVju6Mlfe8tnwBG3nua1c7vvNfJkFfN
 da+Mtu98/b2qv6F7NTaVmM2grfa8zYx/ceaeIFzBIYBcDErELlJjFA8wn+FERBGM2MND
 XW/aP3jrLK3ZP/39W0crG1IqpoRkvC43ukJr9tOD983vIxCy12cAeFvAiA19OmBVyxbw
 9oxGO3bcEXwyTwOOEBipHBU+F/+Y7cCSx+gJ8GEkc6Cskba4rp2yqoCKcwtoLHrgGVpZ
 z9a49nzX3ww7wtvkr1yJL2He1Gpqwkqc5jewKSkwY1wcqeyR9MxB3veKpheScwA9FqMF
 8ePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HcMMJQIo94sDORwN3NPMMwEJv40Fu1AswMuILXzE1Po=;
 b=X0gFEQz41GjlExlin5+SlsqWZJGfd3ngvYDDUtx8b9H/zl8knP2K+PuDQVDJ2pZn4h
 iT1gElwIriyarOnpIhfv0jk3rqxh0NV4qSLOocdaSzyUzcRvlx/TRvEoo2COBldkRfCc
 +uAQdojCTi9BsvPTj15wFTTZbZeJsbaDFakmraRBIpO8dqPVwZ8ZgERAtKlfZnr//qPr
 q4BWCe2fTsC0yyjdUCTST70lAOOJXccpNwMelIF/M7ikxgmezXxqGifUab5rFDLU9d0J
 ZmG9Y6nehEgjEkPCCDPW8yJHcyK3s3kg0E0o7K3FgvsJ+OcQNDg8n2Uu3FdHfukMltbs
 aNTA==
X-Gm-Message-State: APjAAAWpCh6rDwj7EiuP5LCmaHly/sJPVmy8wdfU70pRFGl1XJSTgDg0
 0RMO7HxkuYIKifUM6TcV0lv80A==
X-Google-Smtp-Source: APXvYqxDK+9e46ZWTzRKuIJLw0hzd2ajwQLTt6vfG5+a3lenp3SiWluj5c+iJSQ2CDghW6bOiOtIaw==
X-Received: by 2002:a1c:a9c3:: with SMTP id s186mr4825881wme.64.1580811878171; 
 Tue, 04 Feb 2020 02:24:38 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id b18sm29558987wru.50.2020.02.04.02.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 02:24:37 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Date: Tue,  4 Feb 2020 10:24:28 +0000
Message-Id: <20200204102428.26021-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, sfr@canb.auug.org.au,
 alsa-devel@alsa-project.org, lee.jones@linaro.org,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: wcd934x: Add missing COMMON_CLK
	dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Looks like some platforms are not yet using COMMON CLK.

PowerPC allyesconfig failed with below error in next

ld: sound/soc/codecs/wcd934x.o:(.toc+0x0):
	 undefined reference to `of_clk_src_simple_get'
ld: sound/soc/codecs/wcd934x.o: in function `.wcd934x_codec_probe':
wcd934x.c:(.text.wcd934x_codec_probe+0x3d4):
	 undefined reference to `.__clk_get_name'
ld: wcd934x.c:(.text.wcd934x_codec_probe+0x438):
	 undefined reference to `.clk_hw_register'
ld: wcd934x.c:(.text.wcd934x_codec_probe+0x474):
	 undefined reference to `.of_clk_add_provider'

Add the missing COMMON_CLK dependency to fix this errors.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 4d5b0d5a73d3..3e2396ee727f 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1280,6 +1280,7 @@ config SND_SOC_WCD9335
 config SND_SOC_WCD934X
 	tristate "WCD9340/WCD9341 Codec"
 	depends on SLIMBUS
+	depends on COMMON_CLK
 	select REGMAP_SLIMBUS
 	select REGMAP_IRQ
 	help
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
