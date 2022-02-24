Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3912B4C2AAD
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 12:18:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B45CF17DC;
	Thu, 24 Feb 2022 12:17:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B45CF17DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645701514;
	bh=afyngRYl59QJn7j8oWB+Z6+O6LaXN21Nj6Vfsu4nqz4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U8rGYpxhDQ99B7tvr1Q/crS8pwY7+8EydFnlwbg40oylxEwhrWestr2Ilod+pOlxY
	 j6HVZZQnXK4+F2Xa+5EkNZGxJZx68ACuvybYFkWLBsa+n+9NPWfZ1rwV/ih09lfXYO
	 8Tx6al/3NhcMFTHcheZpX5okgyDzQYHtKrdVXNVg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2173DF804D9;
	Thu, 24 Feb 2022 12:17:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2514F800B6; Thu, 24 Feb 2022 12:17:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0567DF800B6
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 12:17:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0567DF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="hE3EJFfF"
Received: by mail-wr1-x431.google.com with SMTP id x15so2431346wrg.8
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 03:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+4LwzA+Ef31mwQpA9bTjYO5hYFfgu0fC7ELpcssYOSE=;
 b=hE3EJFfF6VzcfLrzRn5aJCbjjAMiK533zNKHRj+C3WitaLtKo4kAlfYrk3riLzLF/X
 O3FCI0qXc1eCJmTgeLBa9ydwwy46/9cz8N+duqK6PqUh/Hc41TnP8x+DfWejCQx+/oTi
 eMSBQaNsKND69ZrEdBH+IWCU5g/EQQymQ8DMfKh1yE8cxk7jrCbFl7YPt7lGW2ezebEI
 2u2KifVkg5ruCjwzLrzB55IhraI7vWYXI6mE1QVfg6MIoS8CArYN8Ah2jGs86e1g0MdA
 XiW/POUR4ArEHj1Fgwjw8FYL+tylHcXFXiD0RJgyjVaT8aUHGUTx/5ATwiGxOMKj2MVS
 TbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+4LwzA+Ef31mwQpA9bTjYO5hYFfgu0fC7ELpcssYOSE=;
 b=lq8BIqnjIA86VXENqFr+VDbSoR1v28XJS5ui4w+nB0EapyoCFZDh3zEaVIfczsYtU+
 rRipVuEdMqPzQA9y075MtYlffP5Xe7dbPbW9NNpHPNEgvLnzZcpqnqaXKArHTyYWU7KY
 Or0E1fn+u4jRtN1zTS5cEH4qM3tCHfRwykrjxS3vViClght/V1zSlvkWdmOQydkllGM0
 YY/U0Oj+ut3yo8F5Ga8YFslr9fbHIvf0jB1Ta4N1kfwBnuKTkeNvWHBnUanSnHU7++gu
 FcYxYNVp8Cim1ZKHQJ8+COCgxbtU4ykPGxm48qTptChBNr+daggKtl/10lwVDnHo4zjv
 iWAw==
X-Gm-Message-State: AOAM530PYzCb2uNs98aYD7BAC0p8gOvXjSqWkWyboOC4yo514Ey17Yyb
 p6aT4gXxUzAbLMV3CIFmVNKdBw==
X-Google-Smtp-Source: ABdhPJyAbKc8qelEnGbGx3dKGDG6VY7tTOq4g66Wk0gJVAM/zAwvRq07CUkhz2V8B9X8kywSZOmwWA==
X-Received: by 2002:a5d:5850:0:b0:1ea:7d9c:4397 with SMTP id
 i16-20020a5d5850000000b001ea7d9c4397mr1843934wrf.225.1645701442070; 
 Thu, 24 Feb 2022 03:17:22 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id t4sm2245737wmj.10.2022.02.24.03.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 03:17:21 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 00/16] ASoC: codecs: add pm runtime support for Qualcomm
 codecs
Date: Thu, 24 Feb 2022 11:17:02 +0000
Message-Id: <20220224111718.6264-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
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

This patchset adds support for runtime pm on tx/rx/wsa/wcd lpass macro, wsa881x
and wcd938x codecs that are wired up on SoundWire bus.
During pm testing it was also found that soundwire clks enabled by lpass macros
are not enabling all the required clocks correctly, so last 3 patches corrects them.

Tested this on SM8250 MTP along SoundWire In band Headset Button wakeup interrupts.

Changes since v1:
- move to handing clks individually from clk bluk apis
- tidy up the clk provider side code by using devm variants
- added error handling.

Srinivas Kandagatla (16):
  ASoC: codecs: va-macro: move to individual clks from bulk
  ASoC: codecs: rx-macro: move clk provider to managed variants
  ASoC: codecs: tx-macro: move clk provider to managed variants
  ASoC: codecs: rx-macro: move to individual clks from bulk
  ASoC: codecs: tx-macro: move to individual clks from bulk
  ASoC: codecs: wsa-macro: move to individual clks from bulk
  ASoC: codecs: wsa-macro: setup soundwire clks correctly
  ASoC: codecs: tx-macro: setup soundwire clks correctly
  ASoC: codecs: rx-macro: setup soundwire clks correctly
  ASoC: codecs: va-macro: add runtime pm support
  ASoC: codecs: wsa-macro: add runtime pm support
  ASoC: codecs: rx-macro: add runtime pm support
  ASoC: codecs: tx-macro: add runtime pm support
  ASoC: codecs: wsa881x: add runtime pm support
  ASoC: codecs: wcd938x: add simple clk stop support
  ASoC: codecs: wcd-mbhc: add runtime pm support

 sound/soc/codecs/lpass-rx-macro.c  | 168 +++++++++++++++++++++++-----
 sound/soc/codecs/lpass-tx-macro.c  | 169 ++++++++++++++++++++++++-----
 sound/soc/codecs/lpass-va-macro.c  | 106 ++++++++++++++----
 sound/soc/codecs/lpass-wsa-macro.c | 157 +++++++++++++++++++++++----
 sound/soc/codecs/wcd-mbhc-v2.c     |  26 +++++
 sound/soc/codecs/wcd938x-sdw.c     |   1 +
 sound/soc/codecs/wsa881x.c         |  54 +++++++++
 7 files changed, 580 insertions(+), 101 deletions(-)

-- 
2.21.0

