Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A2360F516
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 12:28:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8C113109;
	Thu, 27 Oct 2022 12:27:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8C113109
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666866519;
	bh=DgrwPbWMswbN1Y/9nBD8F4gk0wRBaMfj14Lmzw0eKRI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=syMOxM04ocgfNKHMW8Zxv1TMrD5fMDRNnwRZNTMtzJl+KT8RLzFBt7wNL2xU1Q1m+
	 QhKdTV03UWeS8j4bp5LF/ak8bgyq7zd/6ikCC1uLcBZGLzY+OH6GmrxTTbkDOWzaoQ
	 VCDP5UhXh+PWSrZfM+2LOzuwolDTciVnMUy4Oluo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23DA8F80496;
	Thu, 27 Oct 2022 12:27:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3452F80095; Thu, 27 Oct 2022 12:27:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C020F80095
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 12:27:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C020F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="fVIZxf6l"
Received: by mail-wm1-x32e.google.com with SMTP id
 bh7-20020a05600c3d0700b003c6fb3b2052so818274wmb.2
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 03:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c10Qe+zVZwwhBmGpXr4d44up0IldqesvWFfpeof/vkk=;
 b=fVIZxf6ldVYp8IBSoyM4y0u487MzBl4hyvzk2dmHbQ6cAjTw/gb3hGHq/fNXIAIknO
 wUkpKa9NXUqqXGvKs6y5a8aP8ah7+k+Rb+Fvm6NiM4U8TfDVENUquvVTE3jaiCy3hY5b
 PyEu71SuL7hVubSIhG1CUe5OAhkqivw5IieTuSkvBgKBZyQ2LASo4CAZrhvbf6HwsxmX
 YceOtRHXKz8Uos6/HkcbfK/Z7fEruPIQTFalW53j55EMLMzkkGWeVx+CpYvAPT2Oj++D
 D0Y3hoD5NuErKKUQoZ345ja+k0N3bPc3JTmNUfacDfh/JEqMEvIXu2mYNShWqmRm7ojv
 zR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c10Qe+zVZwwhBmGpXr4d44up0IldqesvWFfpeof/vkk=;
 b=dXQUYYG6rx94fcHLbHNxV5hOQ6+jlmNEkWi82rBngPMy7GFOigNeGOIAbKCjKaH3t1
 u7poVlGJI/ZeSDMZOzqjO5vGNbTfAT7wI4sd0aw1qKq+8LD0rcw8H3P4vjK4PsCxMo1f
 ySviLbM26kI/8EqQ+8ps/5h3/UvyGoK1zDLMYdhGZ4LCI3khWPbLQad7/YSl1aWpHLR9
 Kkm742zCSv54Q3sZIGKuG5GKohK0/qmqpAIbOsGBSqQJfFfTDrgBXNf3RBQI0LWxaTnU
 rey2jwq0x/4LflBytTkOorMnQKyrCdBbJDBN0Z/oqBf5SOxy2wTfvLYpRvkh1aeL5GhP
 JISQ==
X-Gm-Message-State: ACrzQf3Vl+V/FkL6BMyDcCmkmV3gUolUeUAvw4+RrraoJxsmo08vV/re
 q8D3ejth7GY1VXsTELE6BliykQ==
X-Google-Smtp-Source: AMsMyM5XkM9qBJkZHViwAVqTaVREs+du9SVmS5VfkwGNbmlgN1NNuWvkGYxmgCXT5+ZG1v56r31oVA==
X-Received: by 2002:a1c:7405:0:b0:3cf:55ea:6520 with SMTP id
 p5-20020a1c7405000000b003cf55ea6520mr436038wmc.46.1666866459346; 
 Thu, 27 Oct 2022 03:27:39 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 fc7-20020a05600c524700b003b505d26776sm5088674wmb.5.2022.10.27.03.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 03:27:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 0/9] ASoC: qdsp6: audioreach: add multi-port,
 SAL and MFC support
Date: Thu, 27 Oct 2022 11:27:01 +0100
Message-Id: <20221027102710.21407-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bgoswami@quicinc.com, linux-kernel@vger.kernel.org
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

This patchset adds support to multi-port connections between AudioReach Modules
which is required for sophisticated graphs like ECNS or Speaker Protection.
Also as part of ECNS testing new module support for SAL and MFC are added.


Tested on SM8450 with ECNS.

Thanks,
Srini

Changes since v2:
	Fixed two spelling mistakes in commit message
	No code changes.

Srinivas Kandagatla (9):
  ASoC: qdsp6: audioreach: topology use idr_alloc_u32
  ASoC: qdsp6: audioreach: remove unused connection_list
  ASoC: qdsp6: audioreach: update dapm kcontrol private data
  ASoC: qdsp6: audioreach: Simplify handing FE and BE graph connections
  ASoC: qdsp6: audioreach: simplify module_list sz calculation
  ASoC: qdsp6: audioreach: add support for more port connections
  ASoC: qdsp6: audioreach: add support to enable SAL Module
  ASoC: qdsp6: audioreach: add support for MFC Module
  ASoC: qdsp6: audioreach: add support to enable module command

 include/uapi/sound/snd_ar_tokens.h |  27 +++
 sound/soc/qcom/qdsp6/audioreach.c  | 310 ++++++++++++++++++++---------
 sound/soc/qcom/qdsp6/audioreach.h  |  47 +++--
 sound/soc/qcom/qdsp6/q6apm.c       |  84 +-------
 sound/soc/qcom/qdsp6/q6apm.h       |   6 +-
 sound/soc/qcom/qdsp6/topology.c    | 243 +++++++++++++++++++---
 6 files changed, 489 insertions(+), 228 deletions(-)

-- 
2.21.0

