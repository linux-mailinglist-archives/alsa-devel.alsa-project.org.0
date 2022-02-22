Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDA84BF79D
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 13:01:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72FE717A9;
	Tue, 22 Feb 2022 13:00:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72FE717A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645531301;
	bh=XsL/NfxgqRxXwPZzGD+TCJ9xCkBs342qsO2Jyu5ntrg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qj/DzI82IIscUfRJVZ8BpQHPcWhj00YTG+oCAhyn0TFoiFs42GJWEG8K9eEKVUK7y
	 Ot78a33mwERTJT4w9x5z0kecylFl+MgqPRw2peKWC7OTqmKVJzVPxhnTZ/6euQutSX
	 0piJ6eobtS4NT+wdL3anRbO6EP6+eRd0w0hzCIXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A409DF80516;
	Tue, 22 Feb 2022 13:00:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A237DF80511; Tue, 22 Feb 2022 12:59:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E958F801EC
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 12:59:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E958F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="S6zirMZa"
Received: by mail-wr1-x430.google.com with SMTP id j22so6640573wrb.13
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 03:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8LObSTXu1qlvqbb+LZZSTBp/s15WbJsY+tJE4L4+0TQ=;
 b=S6zirMZaeJTYUQYI2jWpRibl0LEcLY97o0F/lBgr4W2yeXj8NN1Pi/kAwyhdS2ZcaP
 3DLiquqKlXA331x2wqCsuUiFrBZ9rLzfPEdj7mQEN6h4KzbrQMVoNikBVqrz0544PFdc
 5qkFQ2t5VR0T3qvV06OeHSVvAzK5ST26dUdgbspj1CLxCWCAXDBb5zZpjXhpjMaZ0zdY
 5Wz+ibvKKAaikmbQ1jouCJeai0JpQwQgk5VKkVMlNcUrFgAoU04o77KA+mrBbPzAbq/r
 n+DYzAB47J1mBABZqg7toakfxHLVtDb/Lc6L5sHtU0JSARf/mImQZLqp5dmPvwySKgd3
 +pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8LObSTXu1qlvqbb+LZZSTBp/s15WbJsY+tJE4L4+0TQ=;
 b=Ez2kSkU8PfApvDPMdbC4ecSXEkUUxpVq7Zp24uitPyZWwsOF7jKUZY4QzDRbfkRDm0
 7Jb7HiEbWOYEnmCRbRW3BGM3CZIt5ySZ5eeeKEFDsBxNUv7IXI5UnnneWgSezMA9gsFN
 pepdfkEhllZFQcm0SiQZZYVmLBGWizGi1m+EZKnSfO3QguP/KQGT0/W/i2G2kjq5184b
 u1cY640WBOVcM/5N0z60z8rXZGZ0GnzmbjuGh0kdTsx2zM2Px+/wILz9SEnxN5u+0cZ+
 8bHNlXQf+yJ3scHkZIVqqDaNr40tz0U18m5W7Z3zz6+qjTjlCcoWJQx+dec4rHk5LLSK
 Xjnw==
X-Gm-Message-State: AOAM533kw1L/9b4t8T3iuCA7s/9HtA6Bqj23MQzUEl025xEs4XK6WOg7
 PT+msqmR44NHqjBR6tNkFy5SbQ==
X-Google-Smtp-Source: ABdhPJz1Enfc0BgEL2zeXIbO97OxrujoZTbIOpVYZlAuLV7/llYGqgTXIg4Ba/LIcakGF4OQzNs9WQ==
X-Received: by 2002:a5d:5986:0:b0:1ea:75c6:3d0a with SMTP id
 n6-20020a5d5986000000b001ea75c63d0amr4633484wri.166.1645531186102; 
 Tue, 22 Feb 2022 03:59:46 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id a18sm50014661wrg.13.2022.02.22.03.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 03:59:45 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 00/16] ASoC: codecs: qcom fix validation failures
Date: Tue, 22 Feb 2022 11:59:17 +0000
Message-Id: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
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

Thanks for pointing out to mixer kselftest and VALIDATION Kconfig.

This patchset addresses some of the issues in Qualcomm codecs that are
discovered with recent mixer kselftest and validations added to ASoC.

Mostly these are under
1. accessing integer value type for enum controls, which is clearly an array out of bounds access.
2. Fix incorrect ranges.
3. Fix incorrect min max for tlv controls. (I can see that other codecs also suffer same issue)
4. Fix return values for put functions.

thanks,
srini

Srinivas Kandagatla (9):
  ASoC: codecs: rx-macro: fix accessing compander for aux
  ASoC: codecs: rx-macro: fix accessing array out of bounds for enum
    type
  ASoC: codecs: tx-macro: fix accessing array out of bounds for enum
    type
  ASoC: codecs: va-macro: fix accessing array out of bounds for enum
    type
  ASoC: codecs: wsa-macro: fix accessing array out of bounds for enum
    type
  ASoC: codecs: wc938x: fix accessing array out of bounds for enum type
  ASoC: codecs: wcd938x: fix kcontrol max values
  ASoC: codecs: wcd934x: fix kcontrol max values
  ASoC: codecs: wcd934x: fix return value of wcd934x_rx_hph_mode_put
  ASoC: codecs: rx-macro: fix tlv min max range
  ASoC: codecs: tx-macro: fix tlv min max range
  ASoC: codecs: va-macro: fix tlv min max range
  ASoC: codecs: wsa-macro: fix tlv min max range
  ASoC: codecs: wcd938x: fix tlv min max range
  ASoC: codecs: wcd9335: fix tlv min max range
  ASoC: codecs: msm8916-wcd-digital: fix tlv min max range

 sound/soc/codecs/lpass-rx-macro.c      | 40 ++++++++-------
 sound/soc/codecs/lpass-tx-macro.c      | 24 ++++-----
 sound/soc/codecs/lpass-va-macro.c      | 12 ++---
 sound/soc/codecs/lpass-wsa-macro.c     | 14 +++---
 sound/soc/codecs/msm8916-wcd-digital.c | 14 +++---
 sound/soc/codecs/wcd9335.c             | 36 ++++++-------
 sound/soc/codecs/wcd934x.c             | 70 +++++++++++++-------------
 sound/soc/codecs/wcd938x.c             | 10 ++--
 8 files changed, 112 insertions(+), 108 deletions(-)

-- 
2.21.0

