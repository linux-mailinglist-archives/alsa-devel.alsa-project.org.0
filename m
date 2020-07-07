Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBFA2169EE
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:20:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C575B9F6;
	Tue,  7 Jul 2020 12:19:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C575B9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594117205;
	bh=bB/EsNMT3r4QSVJf/UJcZsfcfVuUyBDo8aqPvM5R5ZA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GQxXXtwDNvj8fQedRCsO0QZutoZ27MOCqvlfQWS6ou/5R/i9EP732OG+8VdEAHhGp
	 S5nThyq05/knvv8w0E96hT+26lrtrXJgOxgkUwWVuUrxdfc/E5j4faOYjuQiVZZ1WQ
	 bEtKQ2Tsy3I0rQBnsF2z2i8P9R1jDd9tyr/4LPIM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9381AF802E9;
	Tue,  7 Jul 2020 12:17:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EE52F802E0; Tue,  7 Jul 2020 12:17:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0108BF8025A
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:16:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0108BF8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="eKf7OQbj"
Received: by mail-wr1-x441.google.com with SMTP id z2so22274612wrp.2
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 03:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Ojcexqfn/ZS3noXIMdqlD9+JbA+cGF+iBmDVVcfGM0=;
 b=eKf7OQbj/SAKIuqAfQubX24p12bDVbV98ZLiLwXpicE8+hlGHR2Lwqg2oTYcLwu/qD
 Bn5Gn1gBc/1gGzBGsmqTb+Q+gUH+21qv7MFJY6nOjy++f7nMMe8Uoj5EWJRz+g+D/XLb
 lTtDXG7caO9jtnbnh02SmWHCT20SHTj18dUEk2p19o/ko5C6t0jv1EgkhiXWypF+9X83
 Yg2bkKaO/kwFRZb6VQD/FOiRIyeNO8bncKjdrWxHfp/Q3nQSOfaHxzzXXVE8YKEnUc15
 o/LFftlJi1GnXMqcbZ9j6KBshO9S1Arc8MHEO5MopHLhfQ3irAsVv5y6Ee972eCGsmtq
 8Nyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Ojcexqfn/ZS3noXIMdqlD9+JbA+cGF+iBmDVVcfGM0=;
 b=h7BxOzgJFljBPOsRxKMN1aOWdfsFr11POoeZkcvAXIVkCHzmIiOCsCu6250hM3GGWC
 barMLfOH5dmPlCCAXub5OXSpvPMSUeFLviTH6E8Hj67FPRHH/bx0l+QCK01+dl2cygZH
 iAHgrI98ZAV723CfVgYvc5wacHk8BuZb46KcwuPKEXeMbs2riq+pRR+A/Lnb1gUDNLwB
 r9dyhtLFu9VCcvqsA6YV9Vcs1v6vFFcLBjgidSmni717xYHLWqIiygDdMlYJrGwzhAYT
 QANqVLJ2SJoAUsvUQsU59yRust4MGmTpEhlCrnIkdluqg+13Q6oKs3HKaGYH7VFDO1rX
 LSMg==
X-Gm-Message-State: AOAM532x+0C/+sXuNCMZCBeFbMjb8YF/qMPxDOCconMyhqo4BVBxWrtE
 v4Bc/d5E+DLaVRLC1HVLl1IY7A==
X-Google-Smtp-Source: ABdhPJxXHqSXuvC/N6FMDoHvlD9BJG1LNiYAOWrAD6I4lg3PAZdm04pKuSFnfS9ZIM3N4PgczWCONg==
X-Received: by 2002:a5d:474f:: with SMTP id o15mr50415169wrs.306.1594117009607; 
 Tue, 07 Jul 2020 03:16:49 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id z8sm469409wmg.39.2020.07.07.03.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:16:48 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 02/28] ASoC: atmel: atmel_ssc_dai: Demote function header
 which is clearly not kerneldoc
Date: Tue,  7 Jul 2020 11:16:16 +0100
Message-Id: <20200707101642.1747944-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707101642.1747944-1-lee.jones@linaro.org>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Sedji Gaouaou <sedji.gaouaou@atmel.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Frank Mandarino <fmandarino@endrelia.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
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

No attempt has been made to document the demoted function here.

Fixes the following W=1 kernel build warning(s):

 sound/soc/atmel/atmel_ssc_dai.c:892: warning: Function parameter or member 'ssc_id' not described in 'atmel_ssc_set_audio'

Cc: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Sedji Gaouaou <sedji.gaouaou@atmel.com>
Cc: Frank Mandarino <fmandarino@endrelia.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/atmel/atmel_ssc_dai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
index 0f18dfb85bfed..3a0335864034a 100644
--- a/sound/soc/atmel/atmel_ssc_dai.c
+++ b/sound/soc/atmel/atmel_ssc_dai.c
@@ -885,7 +885,7 @@ static int asoc_ssc_init(struct device *dev)
 	return 0;
 }
 
-/**
+/*
  * atmel_ssc_set_audio - Allocate the specified SSC for audio use.
  */
 int atmel_ssc_set_audio(int ssc_id)
-- 
2.25.1

