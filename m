Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 494BB217414
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 18:38:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD5749F6;
	Tue,  7 Jul 2020 18:37:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD5749F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594139927;
	bh=pTQOsCVaGdw0VyCeU79ze1Jh99TaAMXGI5SjW+OCbYs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mkoqCjSU0sjcCK+uko4UGp6RLFguEN6nb/MEI6Q3rFQBu3xRkNn8PZtrlT1oH6Wl3
	 aOuEAWdeAKAAoTNK8AIy64l8CC8LRrE88NfJ0jvCE6E5ddY/VMXN2U45DX2dvhGcYM
	 rPz+tHsT8vYEOeruVEQdbUNsq2VMfTjjOQjll1GY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D00C9F802BC;
	Tue,  7 Jul 2020 18:37:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3A6DF8027C; Tue,  7 Jul 2020 18:37:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 124CBF80216
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 18:36:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 124CBF80216
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ceObNRJb"
Received: by mail-wm1-x344.google.com with SMTP id l17so43994495wmj.0
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 09:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AUDtaZGuLvv+SLoR7KU3Z891RyQPf3cxC2Vk4Ft9m9A=;
 b=ceObNRJb7swhmuIvVvg3ZWrMgV+06yjHovtpaDEvq4C3mCvWuWv+/xTa0cFjalWvb0
 DkiDYsAW+KY+MufpoNp8ltf2iXAvP2ivhQ/eTvxOtu2Dwa7ZQSoER3vk+bBwrXO9siZ6
 BfPqBqVmp4nDCnIA0gJQNrIXMjoAq8CZBPfpawF2hCp6x69YekTK/MSWoLa1a+Hg9+9k
 neMSXdGgCUmyDrUxBvrtTnfYdHo+0w0wbZN+jG07dxZ9x+oaRwJc0MCZndbsta3LNw+7
 yIbnD/2BxgAALz314G6NQD/xkZaONSuA1VH+KgTN5eR+2bFZek3ybcNA433micyY7kDx
 z7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AUDtaZGuLvv+SLoR7KU3Z891RyQPf3cxC2Vk4Ft9m9A=;
 b=L5PNBKvFqrySn8VIkVkyktpKejrLuzhxLysUE8FvWDkjMddRKa/cyMNfU+GDfhNP90
 H5sB3M6K6dHLSr46R1I3kMx5odr3XpX/48AGwaJ2Z+FjN3ssVSfpylBMyZZg+YjMj7py
 tqubHrC6zDs5P12SRSHL7yeUzYa8zPnfapGtz90VWS25AF2teN5LcXhpVKIqczL0fUgG
 kh973LAYXeNVNJq6ixLGJQD9tVBbF3VzmhzTbrv4tOw1Zx5opjKzYdjBntYHtH6zaJCi
 XrYRz/9kgDdJj0lslIlbJft6zEIWI1H1mQxp/tnpl3ypFoHb0riidJ1+YAxQXQea4mpv
 jw1Q==
X-Gm-Message-State: AOAM532/PSta83go7jjmT/co8YGCyoBwJZRn0d5S/LdFO0/jj9iynur+
 JzdeGcfbJq2bG1l6nQsBaCKbFQ==
X-Google-Smtp-Source: ABdhPJz0MNARkMW88PzV5/chhJFzWYfOvc0ROqTGi8ma2hnlG9QS9GYEPrqvZOnoNhLS0UuMXlyHeg==
X-Received: by 2002:a7b:c218:: with SMTP id x24mr4863263wmi.109.1594139809531; 
 Tue, 07 Jul 2020 09:36:49 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id p14sm1925874wrj.14.2020.07.07.09.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 09:36:48 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 00/11] ASoC: qdsp6: add gapless compressed audio support
Date: Tue,  7 Jul 2020 17:36:30 +0100
Message-Id: <20200707163641.17113-1-srinivas.kandagatla@linaro.org>
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
Gapless on q6asm is implemented using 2 streams in a single asm session.

First few patches are enhacements done to q6asm interface to allow
stream id per each command, gapless flags and silence meta data.
Along with this there are few trivial changes which I thought are necessary!
Last patch implements copy callback to allow finer control over buffer offsets,
specially in partial drain cases.

This patchset is tested on RB3 aka DB845c platform.

Thanks,
srini


Srinivas Kandagatla (11):
  ASoC: q6asm: add command opcode to timeout error report
  ASoC: q6asm: rename misleading session id variable
  ASoC: q6asm: make commands specific to streams
  ASoC: q6asm: use flags directly from asm-dai
  ASoC: q6asm: add length to write command token
  ASoC: q6asm: add support to remove intial and trailing silence
  ASoC: q6asm: add support to gapless flag in asm open
  ASoC: q6asm-dai: add next track metadata support
  ASoC: qdsp6: use dev_err instead of pr_err
  ASoC: qdsp6-dai: add gapless support
  ASoC: q6asm-dai: add support to copy callback

 sound/soc/qcom/qdsp6/q6asm-dai.c | 397 +++++++++++++++++++++++--------
 sound/soc/qcom/qdsp6/q6asm.c     | 173 +++++++++-----
 sound/soc/qcom/qdsp6/q6asm.h     |  48 ++--
 3 files changed, 458 insertions(+), 160 deletions(-)

-- 
2.21.0

