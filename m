Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B87F555FB5A
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 11:09:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62B881660;
	Wed, 29 Jun 2022 11:08:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62B881660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656493771;
	bh=UoCqL+RdCwVF/yh9RLapwMYgeTIrYwG67tj6HspYVWk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=urUNqr8z74pBg8iocDBiQAaUoF+jiV3UnhjASO2CSkTfSbr9iNkdb3ZW4LeJi/6oA
	 J8hobiy1KQYzSGhDt5pz52cS46GtUar61rGL8bJouJScXtipIGcT8ze8pmHXV1jT7M
	 s7/Do9NmMO3IgL8yaNNSn0TN8bQAaWMU7/n1iWf8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D239F80543;
	Wed, 29 Jun 2022 11:07:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01965F80542; Wed, 29 Jun 2022 11:07:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98A1DF804E6
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 11:07:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98A1DF804E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cN3diKYf"
Received: by mail-wr1-x434.google.com with SMTP id v9so5805909wrp.7
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 02:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XhVaynt23RZRT72OSOPmlLkNv8BfKDn8DPYKDlNl7mo=;
 b=cN3diKYfDOCVK1xYzkybVDRxCRDWEl8dMbv3Yj2mH1/7LycshrX5t7yvg9Nqv4CvNw
 Per/DCaLPXJGkIc2u4jt50Cx5s7SUGjt+PkMzsfhBidJHdxUPZDOKNI7GNvJgjq4RNFP
 M8rrhHumc6+LjSFsEwlrtCMDyP2roUBPdF43EQK3nzS/7w7gomqtHFZd/4wbCG7hpSc/
 BfpjJMUqCblNJYjMlrguPhEEALp1nt6BYwyBCCKAfqn+Gb2KLc8Sb9tuUEPtEvn7WWPY
 GUsoBNUMqfZeknWhFNfZjCIFTQF+0wOQ8DYzez67V5chh/iJgZRmAazf1M9HfvdF1Lnl
 fH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XhVaynt23RZRT72OSOPmlLkNv8BfKDn8DPYKDlNl7mo=;
 b=bARTcpEDYHuv55WCFfSDrfGwQWOzgVcZiLoI4UWLtrfCNGum5x2csZQAS8FF0Uoegd
 O3SrUiEORgtykGhcx0xH5jtBBeeXARf77+5g6HGLPtSs1FjtN0Z8kgoFcFpoSvuDZ0yP
 EzF5OZfzIrChWRKqj8DQH09Z4pCH+zikvJsD4yM49c+SUQDH5RpZPWloRyeXSmbnKv6o
 ns8SA+M8Wtn3UemB5n9FzU4iYH3FKAdHt7tfstuuomYnGiSgeWCy5L5sPvz8hUaUeYfY
 pU+1MizuLIbd4wGuFzcvHlqkaEfV8U/DNS25FO26hYAWz+95VxzB6KL/IBDaGC2fDtuf
 Nbpg==
X-Gm-Message-State: AJIora8OUmBRyWZV7+9WnR0sIEEuvc+5zxJnd5BISrC9l2WV1gxPsjc0
 8wDqtP+sY+2MJdZ5iW55aHi3gw==
X-Google-Smtp-Source: AGRyM1t/1AaRCniJIXjV+UbMmrXdTt54J5swO771KzJyBE+o4ZTbf1SC9VwQ929xbiGztSbq+J2AWg==
X-Received: by 2002:adf:fb46:0:b0:210:2316:dd02 with SMTP id
 c6-20020adffb46000000b002102316dd02mr2024995wrs.557.1656493629137; 
 Wed, 29 Jun 2022 02:07:09 -0700 (PDT)
Received: from srini-hackbase.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a5d530c000000b002185d79dc7fsm15993341wrv.75.2022.06.29.02.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 02:07:08 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 4/4] MAINTAINERS: add ASoC Qualcomm codecs
Date: Wed, 29 Jun 2022 10:06:44 +0100
Message-Id: <20220629090644.67982-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220629090644.67982-1-srinivas.kandagatla@linaro.org>
References: <20220629090644.67982-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Add missing Qualcomm codes to the list.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 171fa3160696..c4648e86dc14 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16250,6 +16250,8 @@ M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 M:	Banajit Goswami <bgoswami@quicinc.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
+F:	sound/soc/codecs/lpass-rx-macro.*
+F:	sound/soc/codecs/lpass-tx-macro.*
 F:	sound/soc/codecs/lpass-va-macro.c
 F:	sound/soc/codecs/lpass-wsa-macro.*
 F:	sound/soc/codecs/msm8916-wcd-analog.c
@@ -16257,7 +16259,9 @@ F:	sound/soc/codecs/msm8916-wcd-digital.c
 F:	sound/soc/codecs/wcd9335.*
 F:	sound/soc/codecs/wcd934x.c
 F:	sound/soc/codecs/wcd-clsh-v2.*
+F:	sound/soc/codecs/wcd-mbhc-v2.*
 F:	sound/soc/codecs/wsa881x.c
+F:	sound/soc/codecs/wsa883x.c
 F:	sound/soc/qcom/
 
 QCOM EMBEDDED USB DEBUGGER (EUD)
-- 
2.25.1

