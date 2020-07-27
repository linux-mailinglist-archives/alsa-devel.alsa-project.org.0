Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 836A822E93A
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 11:40:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 147241694;
	Mon, 27 Jul 2020 11:39:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 147241694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595842801;
	bh=0NkIR35ag3QzgQa21oYJ06YR6KMQCmHe/5jU+OPbC5s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jKPHsCwe7sUEw14/nz4mzyl0fkEXhGfdfrO2qwsHiXmGL3l9+b7pL9/+sS+TLYo9k
	 aEIWRmU1HsSTfpfebwjoXsX1fMBtXfFrPd+lYiV+BtnokXRP1LbS/ipsBNiW3WxyVY
	 WiThFUdnRsOTIgOi4gQQBqlozdZFXekZ/reYsFkc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C815F801EB;
	Mon, 27 Jul 2020 11:38:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06311F801D9; Mon, 27 Jul 2020 11:38:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 176F2F8013C
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 11:38:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 176F2F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="lnCjxacw"
Received: by mail-wr1-x436.google.com with SMTP id a5so4173818wrm.6
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 02:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qC3CDVB7kR9rDCfdJZLYs8Kg8/UF5PfbuV6G/eCKZfg=;
 b=lnCjxacwzAHt2R2k9vsjrdHuJnI9NhyZHxDnyjUtKw3U3MmDCQItie9CkfkDYGGHP4
 XeIJSyMymz5IBuuDlALyaYlWVolg41q8s0BMs5KnJSgEC+z12CqdbFFDfIGpb4Og423o
 E6nI+IaFvBgExDGodgtOz0Tz29Asee8YhO4Ki2rz96JlHwJq3mpulS+TTbtHes6lz6mm
 agVrRM7NEvOHEJ3eos3/a8VYbO7GGmY4ORLWoiUOi90zOpNzf0mNcd+YnzCifx4dSJRk
 NPfTLC1SQmXjvNVyRsoLvKWt987ynlEeq2R9Wvk2HMScrHBtax0Ufx8i0LwyLQ1WH6Sn
 +Aew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qC3CDVB7kR9rDCfdJZLYs8Kg8/UF5PfbuV6G/eCKZfg=;
 b=V8uSByo10nU/Nm5qTgRIJvLYcA5UA8ejtvlR1oeve2SyoeJTv0gFaVEpvuInPnrhj8
 DPKrOTlwIYNAqt6i8WKinD4gsOOqWU/NRM9KAusDExYKMdfsfxU2XWz7vL1015VR8eFI
 jrkyronkJgkvtsdpzuJBD6D7ZYl/9CYIeeocmVO6UIhEtZcSWkefAk6VSatgfOjZZGT7
 CVlLu1S7iE0SjsFH0u7v8JFn7qzzAT62MS21u2OyQ1udaVwqJC/SgUXQaEy2QIS6uD9X
 esQgZBkAhZmO4+aW6MyT0Vfvc3kPAs3NEKmw2d4VcQ5O1D8G4pZKKo3JosICohAh/NHc
 3MWw==
X-Gm-Message-State: AOAM533J+7OISMJ/xCbTvwCf0qbp45M9kDrlAJhhN5YIm0FiFN8/yRA8
 9lXaWbZtIUpTknt4hnS/kFbRJA==
X-Google-Smtp-Source: ABdhPJxkg+f3gXXkXPzVNhCME4nqb/wHXSFJO1dBNFDBKMoDQ8HkFPldWS7rLgHDBWRBxPareMatjg==
X-Received: by 2002:adf:ded0:: with SMTP id i16mr19318452wrn.389.1595842693413; 
 Mon, 27 Jul 2020 02:38:13 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id y189sm20566099wmd.27.2020.07.27.02.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 02:38:12 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 00/10] ASoC: qdsp6: add gapless compressed audio support
Date: Mon, 27 Jul 2020 10:37:56 +0100
Message-Id: <20200727093806.17089-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org,
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


Changes since v2:(mostly suggested by Pierre)
- removed unnessary kernel style comments,
- moved TIMESTAMP flag to respective patch.
- move preparatory code from gapless support patch to new one.
- fix subject prefix of one patch.
- add comments to clarify valid stream_ids

Srinivas Kandagatla (10):
  ASoC: q6asm: rename misleading session id variable
  ASoC: q6asm: make commands specific to streams
  ASoC: q6asm: use flags directly from q6asm-dai
  ASoC: q6asm: add length to write command token
  ASoC: q6asm: add support to remove intial and trailing silence
  ASoC: q6asm: add support to gapless flag in q6asm open
  ASoC: q6asm-dai: add next track metadata support
  ASoC: q6asm-dai: prepare set params to accept profile change
  ASoC: q6asm-dai: add gapless support
  ASoC: q6asm-dai: add support to copy callback

 sound/soc/qcom/qdsp6/q6asm-dai.c | 414 +++++++++++++++++++++++--------
 sound/soc/qcom/qdsp6/q6asm.c     | 169 +++++++++----
 sound/soc/qcom/qdsp6/q6asm.h     |  49 ++--
 3 files changed, 469 insertions(+), 163 deletions(-)

-- 
2.21.0

