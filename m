Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEB65984FD
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 15:59:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C251B820;
	Thu, 18 Aug 2022 15:58:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C251B820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660831173;
	bh=iwZ3Agz3TfSOlmpWqZsyNE/aUnAAaJjjCUVVwT2svnw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l7v8jMQUw5tziHbKVudSt4DNK3JG5ti/+MiyTmqevv9l4y0cULubg2Mbi3glvefHs
	 Di270j6O5AfxXLxkIe1qRPdVl7siOzUJU3b5R/bhE1OYGADKwnQ5Me+5GV5ZIQGnhD
	 tiM20TTG7wpN40Ho2P9hfq7j/ksI7Q8iY61s3Io4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36636F80495;
	Thu, 18 Aug 2022 15:58:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8ED9FF800E9; Thu, 18 Aug 2022 15:58:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C002F800E9
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 15:58:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C002F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="n7fh4Wb0"
Received: by mail-wm1-x331.google.com with SMTP id j26so886433wms.0
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 06:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=o9Ay2vEp02yCz7wtoapfe+JbYqIRcJhSEcb1z+0LYVA=;
 b=n7fh4Wb0yRW3KJURFLMocGfucbu0vFwY1MdMv/WAVHNRMs+YiFSTYRkDe5EZ3nBuci
 797g12ZiwLhBQ4R5nKrv2WpDF8fPENnhXu+Ep7L7VPXRLhM12k7CoHj26V12dWPkSH5Z
 fnQqYTf/+LpQLUuQnb++12zB02auXV/sI8jojV54zb8q0aK5pAW9fVo1fq3e2pIY7Cj6
 tYWpnjFjE72aELypeq92ItC5N4y695ce3Ylk0T3qioaM6g7DTihaGxVqnqdNDLLYm9SG
 QcjrGtrWlo7eReWvgAz1NH5XPRm8CsookvJ/gWwaOzfBQcJIM6+SU6vkB6NiDEu8oEWF
 AufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=o9Ay2vEp02yCz7wtoapfe+JbYqIRcJhSEcb1z+0LYVA=;
 b=bID/5sOSP9cyDoOrnJJ3grB8eF00YR0mafQabPx6TsSqHbLTJQ7ZZQ0m4UNT+Sk4UZ
 3qLSJS9r1As5EndzQg0i8OL22zA0R0IJxdWcYWzohuNzKtkjY3GKrdS29zA+6Y4CU4dd
 yZIx9GMyxxOgEljuEG1nkEvvgAmYdqEMOvTazNiMELVx+/TYz+o7se+GBwGGlov5n/6U
 MVklUoIrmBARs/5tXhvD5WyId6yy4PlFiCSbPp5uPkfib4FtUJnoPujEhyJrCdJegGQy
 HpIN5zf1hyaCmAvVM/f6Xdr5Kt47F7okMgtUgIsDcHUw/3QEzMnFSgI8zqCF7Mrru8Jc
 gcQA==
X-Gm-Message-State: ACgBeo0Umat+MKO5I8gzHXgs7iamlNhnM8snVrwJ6nRQDw3upfALe+hB
 2T0Akq1phLJggXWPqfnoY1gR1w==
X-Google-Smtp-Source: AA6agR5x3XYSteyGAwK5Qw85QEMJ/Q0oUaeWSFRKKd6fh1okhbFxUgsKVpK/fY5E3H1oaGjbTyMgiQ==
X-Received: by 2002:a05:600c:4e8d:b0:3a5:f7ed:873 with SMTP id
 f13-20020a05600c4e8d00b003a5f7ed0873mr5343453wmq.170.1660831109242; 
 Thu, 18 Aug 2022 06:58:29 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a1c7918000000b003a5ca627333sm5335937wme.8.2022.08.18.06.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 06:58:28 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 0/6] ASoC: qcom: add support for sc8280xp machine
Date: Thu, 18 Aug 2022 14:58:14 +0100
Message-Id: <20220818135817.10142-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org
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

THis patchset adds support for SC8280XP SoC machine driver.

First patch moves some of the commonly used code to common from sm8250 machine driver
and the follow on code adds minimal support for sc8280xp.

Currently this driver is only tested with SmartSpeakers and Headset
on Lenovo Thinkpad X13s.

Support for sm8450 is tested and I will post the patches soon.

Thanks,
Srini

Srinivas Kandagatla (3):
  ASoC: dt-bindings: qcom,sm8250: add compatibles for sm8450 and sm8250
  ASoC: qcom: sm8250: move some code to common
  ASoC: qcom: add machine driver for sc8280xp

 .../bindings/sound/qcom,sm8250.yaml           |   2 +
 sound/soc/qcom/Kconfig                        |  11 ++
 sound/soc/qcom/Makefile                       |   2 +
 sound/soc/qcom/common.c                       | 169 ++++++++++++++++++
 sound/soc/qcom/common.h                       |  12 ++
 sound/soc/qcom/sc8280xp.c                     | 157 ++++++++++++++++
 sound/soc/qcom/sm8250.c                       | 152 +---------------
 7 files changed, 360 insertions(+), 145 deletions(-)
 create mode 100644 sound/soc/qcom/sc8280xp.c

-- 
2.21.0

