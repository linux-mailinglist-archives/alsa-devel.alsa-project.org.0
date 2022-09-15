Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E06755B9B0B
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 14:39:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2212C1933;
	Thu, 15 Sep 2022 14:39:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2212C1933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663245592;
	bh=JW0BDeU4Ul3qtQtdzlc42DdJNERDHpO5V1ZSUo1XKbA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JVMOClY5Esvk7RDaK4qB89yp0imQi9amZXxQzRbDR7XVwupWwgYVUUosAwrFZtE0/
	 /SuKj2wXESOEyM3YB3ILRyey3ljV6xA0kQJWWpbC4aXGc+itxCAO7zW72sEMhI7kIf
	 p7N48K3Zhtd0JQ1GVTOvcg16HCRespc4ZmlD2h1g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69A8AF8013D;
	Thu, 15 Sep 2022 14:38:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C188F80238; Thu, 15 Sep 2022 14:38:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D799F800B5
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 14:38:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D799F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="iA0FYP2u"
Received: by mail-wm1-x32b.google.com with SMTP id
 n40-20020a05600c3ba800b003b49aefc35fso4446810wms.5
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 05:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=kbiyzXIrqqVnS3Or15etF5uykJHCKO1KdtudfrmDI3U=;
 b=iA0FYP2uzJZ+HGL/O25lhf8+gT/9xEuMkiR6ptAaSuYurAgUKJoi2GlBXiQSKUAF+p
 hZzzJb2lM7JVSh4E4n9RncjJCGh/Sq3IZMRnSekPPzXm6v6A0C2V+7UoucrHUuT30oUs
 G7kqul1+r7dFC6HjbQ1fQpa4uCOwJCFgrtNemj3ne4UWjzmyLLG/bakhiqMgjI4jV6oy
 5z76jiwsRZNmrU3i0M+ollZj7mpsmtIcdC58n+Su9zer/wZouWmiuZZ+xEApDNwRh/Vq
 t7RrrX8/07LJKtAv3J72NgS21tZIMhH9FS3Au/pLQYraYGX5RK77b7bh9vwvXf64J1Sc
 x1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=kbiyzXIrqqVnS3Or15etF5uykJHCKO1KdtudfrmDI3U=;
 b=DByrPyuIJ9xuc7MJTvu7ayk6jFRw43Hlj0lF9UEN9m1dYvhhiyCM0ZdBd9+7ziuZK5
 zu+TInyDwiU9A3lthDz0me7ee9132jyKwYdeFZ6OC88XnN5AsSTYd2NQB3zLQj91MJIn
 OEzlTk13rh5m4Zaf8a7nyWdJKhnKojbyJ6qyGIqy6kAydmMS0oHj9Ht9eePkH0NRMZqU
 6fRPnO/qX01TDVrLlhCvt9qRbPUB1oVaMQthTMFFQyFjXOI1EV7CP3UMpQc9z5W8Ntim
 P0yVD5MX3jDas3TQ5iwEqLn9QeUncM6GwpvEy0Y6NK/74Ez8PfR/3Ti1XFC5ZCjJkwQI
 meGA==
X-Gm-Message-State: ACgBeo0DHQIOjCnQHf77D+ceILyp2WByVAUKSHRBTE5now/OPFcjmrO3
 qg2sbe8NSCYQd23+8qb4f6eTHA==
X-Google-Smtp-Source: AA6agR6t0LuD3GiIL8CcC5TW8J+oqLST9RZTztmt9uvAY+Da6RjXdnyIFXn4IYzPghMsYlExxPiL+w==
X-Received: by 2002:a05:600c:19cc:b0:3b4:adca:a821 with SMTP id
 u12-20020a05600c19cc00b003b4adcaa821mr1715121wmq.37.1663245528107; 
 Thu, 15 Sep 2022 05:38:48 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 bg13-20020a05600c3c8d00b003a5f4fccd4asm3112559wmb.35.2022.09.15.05.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 05:38:46 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 0/9] ASoC: qdsp6: audioreach: add multi-port,
 SAL and MFC support
Date: Thu, 15 Sep 2022 13:38:28 +0100
Message-Id: <20220915123837.11591-1-srinivas.kandagatla@linaro.org>
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
 sound/soc/qcom/qdsp6/audioreach.c  | 298 ++++++++++++++++++++---------
 sound/soc/qcom/qdsp6/audioreach.h  |  47 +++--
 sound/soc/qcom/qdsp6/q6apm.c       |  84 +-------
 sound/soc/qcom/qdsp6/q6apm.h       |   6 +-
 sound/soc/qcom/qdsp6/topology.c    | 242 +++++++++++++++++++----
 6 files changed, 480 insertions(+), 224 deletions(-)

-- 
2.21.0

