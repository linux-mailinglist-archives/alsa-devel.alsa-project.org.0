Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C31322286AE
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 19:03:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D2A915E2;
	Tue, 21 Jul 2020 19:02:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D2A915E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595351022;
	bh=zHtjEMOkxtUP/lYNqNvvBlSCRoRZRejH3l9nj0Gk1dU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mEM8xprqprUD1E5C9Hm/6ocJn64bY7OJLRx5ju/5Mu/Z0vWAKllL9yopyUn6eoEFA
	 OMLqwIub8NPKYWhyp/4zmbdWPh4YHHhZdRgXS1ICQFRj++kZXtrgQHTX93/nju6G2f
	 6p3UiKyAg3jzydyk+NIJmTCT52FfTTyQTCUt7AZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80B69F802DC;
	Tue, 21 Jul 2020 19:00:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08564F802D2; Tue, 21 Jul 2020 19:00:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05CA4F80274
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 19:00:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05CA4F80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="PVIhzoPM"
Received: by mail-wm1-x333.google.com with SMTP id w3so3586282wmi.4
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 10:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3xJrlFMWKxatZWph59ICW46ox2+7HmmvvIn3EeO3FeI=;
 b=PVIhzoPM3gEKKNEvTDPU2WIGtUhV/u/A5vb8GkfStZQGTn5fcZQkHF6bSvbbjOFuHE
 PNG8+7cf3SGbqoCPqe/L8csJj60z6FNPKmFUdUwcrqda34gCifbx293ULH1RaGg9ckO4
 Eu60QSn4tK2vo6FgCVTTnenXJbXQfJ65WcIAC0yGHxPc0FNte+6/QtoFx9rQj33rZhMO
 hiz1AFhtgOSevd/zk7EZopgPPPMW16xbfBtwwUXW4ehgOHzRqLHcnfauSatP+DALT6Vj
 RHSSmYa+I43Xew+DutleOWZYfiNZqnpDUecTJ9nAz+VAlBB/770ICyBDps78iz5cstTF
 /swA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3xJrlFMWKxatZWph59ICW46ox2+7HmmvvIn3EeO3FeI=;
 b=BfO/gDtaIYfcd44amhWCYqqXbLRvNO1U8uDGdE7F2z80VPE7CyPyw7CjsX/adCdBc1
 Y4sc9/gU5Df7dkSuYgna/pcyx+9vBZg5Z6fhuPkFOJP/2vc3mwWGRbsuZ09dvMIm6lim
 5BbkyK1+u99xnQ6u1zSCLkyLUDk4ngDAii9o2vxxJFjydnHQbCN2jBnRY51UPDLp37G0
 MPiLRN907b8dhzHJOKOq1rD3ujTLEohO7/P+DfPRBSQuY04U23hidWRjedDuVBR/S1ZD
 e7L+xz27j1iJ9IjlC3F/f+oH3GSk2kdcpfcyeQ1vOPvGQn7ECVIwau3/IXIGE0ZTK8mP
 Zovw==
X-Gm-Message-State: AOAM531XGfQX+bENnJApKZZKtAAQNze7QAbh5apGNGQ2EgNteTseGf1+
 AkucJVdKM9YgmefP/Q64dVjD9Q==
X-Google-Smtp-Source: ABdhPJyYZBuQBKApyeCyxRx1114Gjkuf5aLBbKXX19WAtdt2tYwrr6tlGYAxkvYG3bw+HoqMbUAAAQ==
X-Received: by 2002:a1c:7311:: with SMTP id d17mr4798367wmb.60.1595350812765; 
 Tue, 21 Jul 2020 10:00:12 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id h11sm15526327wrb.68.2020.07.21.10.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 10:00:11 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [RFC PATCH v2 0/6] ALSA: compress: add support to change codec
 profile in gapless playback
Date: Tue, 21 Jul 2020 18:00:01 +0100
Message-Id: <20200721170007.4554-1-srinivas.kandagatla@linaro.org>
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

For gapless playback it is possible that each track can have different
codec profile with same decoder, for example we have WMA album,
we may have different tracks as WMA v9, WMA v10 and so on
Or if DSP's like QDSP have abililty to switch decoders on single stream
for each track, then this call could be used to set new codec parameters.

Existing code does not allow to change this profile while doing gapless
playback.

This patchset adds new SNDRV_COMPRESS_SET_CODEC_PARAMS IOCTL along with
flags in capablity structure to allow userspace to set this new
parameters required which switching codec profile, either for gapless
or cross fade usecase.

thanks,
srini


Changes since v1:
- split patch into smaller chuncks,
- bump up the version
- added flags in compress capablity structure 
- added user for this new functionality.
- add this new call in Documentation.


Srinivas Kandagatla (6):
  ALSA: compress: move codec parameter check to a function
  ALSA: compress: add new ioctl for setting codec parameters
  ALSA: compress: add flags to snd_compr_caps to expose dsp caps
  ASoC: compress: add snd_soc_dai_compr_set_codec_params()
  ALSA: compress: bump the version
  ASoC: q6asm-dai: add support to set_codec_params

 .../sound/designs/compress-offload.rst        |  6 ++
 include/sound/compress_driver.h               |  5 ++
 include/sound/soc-component.h                 |  3 +
 include/sound/soc-dai.h                       |  5 ++
 include/uapi/sound/compress_offload.h         | 10 ++-
 sound/core/compress_offload.c                 | 72 +++++++++++++++++--
 sound/soc/qcom/qdsp6/q6asm-dai.c              | 33 +++++++++
 sound/soc/soc-compress.c                      | 30 ++++++++
 sound/soc/soc-dai.c                           | 14 ++++
 9 files changed, 170 insertions(+), 8 deletions(-)

-- 
2.21.0

