Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D61E1607CDC
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 18:54:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5733A8D11;
	Fri, 21 Oct 2022 18:53:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5733A8D11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666371243;
	bh=Z0L1fGHwb8zUnRPkjlQ2iJ/2PY5z6AuejuRAOGT48Bk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=usZgnTJJRsr13sRNpnIrzLSQA+0FJt1KqH/eJ1CQqkh+arrlrSc7JTfoZCUWsAxdU
	 h97pHAVAWRz9PbjggWZHO98bDR1zSDGlRvxhg4cdv4zYGZDE4Z+kCwdKt7p9bp25+m
	 T1IJL41DUc81FwK0gNty7DT1DkTCwc1uLS5hdlBI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0CD6F8032B;
	Fri, 21 Oct 2022 18:53:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD2E7F800B5; Fri, 21 Oct 2022 18:53:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C604F800B5
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 18:53:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C604F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="H6yqD+bC"
Received: by mail-wr1-x42a.google.com with SMTP id v1so5847976wrt.11
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 09:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x9OiCeTYd5uwtgxnfokq334VISJqPFOEG4jCoBXmUcQ=;
 b=H6yqD+bCUnAKFwa4WuP5unnQpoopWMDnHs8K1A07/c9lDLBtLdzHe8NWGiO5lstJlb
 nVBZrpavBodHSeQL9ZniCsWcLYadN6wDTqM9MR9TTksZNNC4WgEwAEDaTfnUuBj8A9Qd
 3XA2l8Js5uUI3r8emrqWttrx62/rCSAkM21InLKAeWafOAlFEleo24qBCKWVMszeDxmU
 hTEGvQC7BrQR69IVt6TWtlKCtRWY6kMTtaFJcgn4uawgYisv+2vkJRpGt3rI8irSdoVq
 Coq2dNYrP1sv+jwnaJtrl39a8YCuxqgKvUBJ7TfDW9ZTJrMAsIEzv7VhQmwGZ3Zyvkqr
 J/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x9OiCeTYd5uwtgxnfokq334VISJqPFOEG4jCoBXmUcQ=;
 b=eOzj/Ph3XgTC42732Yp6hR8sv/ztw5KeU1L1GOC346aqRpHafbQrSns8K27dxc1sNP
 DY36+4CBKss8ra8Qf8Ra6Bz6Z3+DJSz7dwpGwfWZbaAHCpUTAsWjgC5ANwI86/qqEG69
 DjHdYz2odxwK0niBvyYshfZih7N3K2mvwuez3rxhtTjf184A4AOmdHqKEQnLNfqvuqMo
 Zx17o6UHY8fy0d6kXuozp6EAsJ/6pP1GqWwjhYmo88wdZ8gZUVpUPxXG0vhURlO/IBx9
 ShimpIlX5CFEJ0kBU1qL0bpuiSrxtTs97nnfj9Xv9JDOjzYC/6tEbvRHtWLqJZp4P20b
 qt2g==
X-Gm-Message-State: ACrzQf2jdqMYmygV7Cr2dvmb3txTIC6FBzohiEc9/qVDgDfsj1H1BKt+
 EGqTIArM1RvAzHoLYqlbAWBRNQ==
X-Google-Smtp-Source: AMsMyM5FcvSGOMyUgALVBEmrf1/MUzL3CxMm1g5sP2aXKScMYiHdIUV1O8xZ3U1kX8oVSXHmIO9aqg==
X-Received: by 2002:a5d:6d89:0:b0:22e:4af7:84a5 with SMTP id
 l9-20020a5d6d89000000b0022e4af784a5mr13232081wrs.4.1666371182045; 
 Fri, 21 Oct 2022 09:53:02 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a5d400e000000b0022ae401e9e0sm19541773wrp.78.2022.10.21.09.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 09:53:01 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 0/9] ASoC: qdsp6: audioreach: add multi-port,
 SAL and MFC support
Date: Fri, 21 Oct 2022 17:51:58 +0100
Message-Id: <20221021165207.13220-1-srinivas.kandagatla@linaro.org>
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

Changes since v1:
	Fixed two warnings on unused and unintialized variable.

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

