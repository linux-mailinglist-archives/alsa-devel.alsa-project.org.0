Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E9C228680
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 18:55:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 196AD165E;
	Tue, 21 Jul 2020 18:54:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 196AD165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595350512;
	bh=zRMq7hp+qACe7iQnu5zLODNU7BJXm/9o5VFtQ5PNuNI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rdf54dYR9TDKnMZ4I7b6wVL/yGuLx67B19b+aLLYexPcCk3v/SOirMrk7bfu2XSKm
	 d/gkDdsM5eBk046aGOx2ZRMBSPoQlhZQBrE7OagsXQinrvAprGTuD/ch6PR4pQMGt0
	 CtIqxb6tBjWNgkA2XoH/zSNLlNCVFa47ZYF4b3J4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BA8CF80278;
	Tue, 21 Jul 2020 18:53:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EF4DF80274; Tue, 21 Jul 2020 18:53:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A173F800CE
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 18:53:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A173F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ij2fML/x"
Received: by mail-wm1-x341.google.com with SMTP id q15so3511307wmj.2
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 09:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I60PP0ifqqtbneTVUmcsZVsjqNfLovgwkXHnDS7nrmk=;
 b=ij2fML/xrvdwayy7tlfqTSJBbPRk4/3pp6IQuyAMGsZp9ggQ4e/HMdp4J/FicdrwN1
 auVNr8uB0hCDNuc5zk2Z2IoH4CSvY33ge24xAR0qbe7DMdHb/c/r0LJZ42y4tajv4VAQ
 wkdojyVlybnEUoGH8xPUOiPbISxC2z0RrO8TXnelslgxUSpvR3EuUVLYT914t5S/yzGo
 t6aULZY9c9ZFC7IvntXK0MvvQ7ptUsySjbwdLivyyJarLlsL9tYFEcg2w+m6KIWGbUxj
 WpOTkypthgfJ0lS3T/FW6rKnm3KQuG6Hx+lV5kaUkPcukHIRRVQ2kYBhbl8MZwzY6ajv
 4tYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I60PP0ifqqtbneTVUmcsZVsjqNfLovgwkXHnDS7nrmk=;
 b=Dtx+wzZ4Wj5ChJiGHZ62cqc8JHctlmkfIlUD2GTC1sNXZHIfPA9z5E5XzCjG51NSNR
 dPp9xuG5fUSx+1KquZkYUt0u2rhjA/OZy06yog+hDARIyeV463/PH47kT81RRMG2dIGD
 PPF0y9LCtbASIGHZopluG6YOcU95+VWunJ0uwE9ojrzSzypF7SHMttFXyUtpxvpRHJ3d
 t6jDsgYjFvTpgnVAhjU3TBtul+xhJBwGbLITUhwLC1lIGouIuL7PICL6veoBi0Zr25qo
 YrDSBTqT54Xh9yX1rjV4pylGu3c8IMDT9jQJg9/FBkmwFRuerKMqTgw0eNmFHWLoV3vE
 Embw==
X-Gm-Message-State: AOAM531NhL5cHJLtH+Xg+75kPaAQ8ctSMU+wNIb4nkPnFgY6PpQhotT3
 Luv7KdtBYWfvMwhoisQvGuGogw==
X-Google-Smtp-Source: ABdhPJzTkiFMaTdH7eNy9LidpiVvIUWAUG2bl+BAYbak8+IUSPqGsVHH0YlWUZ7ELzgu/tXPkqVNPA==
X-Received: by 2002:a1c:3954:: with SMTP id g81mr4834946wma.73.1595350400843; 
 Tue, 21 Jul 2020 09:53:20 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id c25sm4058648wml.18.2020.07.21.09.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 09:53:20 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 0/9] ASoC: qdsp6: add gapless compressed audio support
Date: Tue, 21 Jul 2020 17:52:57 +0100
Message-Id: <20200721165306.29082-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, vkoul@kernel.org,
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

This patchset adds gapless compressed audio support on q6asm.
Gapless on q6asm is implemented using 2 streams in a single q6asm session.

First few patches such as stream id per each command, gapless flags
and silence meta data are for preparedness for adding gapless support.
Last patch implements copy callback to allow finer control over buffer offsets,
specially in partial drain cases.

This patchset is tested on RB3 aka DB845c platform.

This patchset as it is will support gapless however QDSP can also
support switching decoders on a single stream. Patches to support such feature
are send in different patchset which involves adding generic interfaces.

Thanks,
srini

Changes since v1:
 - Fixed all the comments to use "q6asm" wording correctly.
 - dropped patches that are already applied

Srinivas Kandagatla (9):
  ASoC: q6asm: rename misleading session id variable
  ASoC: q6asm: make commands specific to streams
  ASoC: q6asm: use flags directly from q6asm-dai
  ASoC: q6asm: add length to write command token
  ASoC: q6asm: add support to remove intial and trailing silence
  ASoC: q6asm: add support to gapless flag in q6asm open
  ASoC: q6asm-dai: add next track metadata support
  ASoC: qdsp6-dai: add gapless support
  ASoC: q6asm-dai: add support to copy callback

 sound/soc/qcom/qdsp6/q6asm-dai.c | 413 +++++++++++++++++++++++--------
 sound/soc/qcom/qdsp6/q6asm.c     | 169 +++++++++----
 sound/soc/qcom/qdsp6/q6asm.h     |  48 ++--
 3 files changed, 467 insertions(+), 163 deletions(-)

-- 
2.21.0

