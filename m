Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3373963DAAE
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Nov 2022 17:31:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF85416E1;
	Wed, 30 Nov 2022 17:30:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF85416E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669825868;
	bh=fWR7ZhQQr5ar1fWGLk9Z4Z/KnsEAhZyZVnGAD/1s2QE=;
	h=Subject:From:Date:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CUxYJMWF1JZxqZbyUkjElBROHkAi7OTIjAjBwhF4a/Z22edVXI4vOwx/xkAHTp/Is
	 rXWz26y0PBrjiBsPdpM5i9vwzb6YmotDNOZpTgFGzlNzJlxmJLMQ2iqaFEbQBYQA4O
	 exVslEAwtuTP4Ta5Iq6un40z4EKU23kKNNVZJR4w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BDEFF80558;
	Wed, 30 Nov 2022 17:29:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32AFBF803DD; Wed, 30 Nov 2022 17:29:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3CF5F804E6
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 17:29:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3CF5F804E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Kk+o2yEg"
Received: by mail-ej1-x62a.google.com with SMTP id ud5so42662743ejc.4
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 08:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
 :subject:from:to:cc:subject:date:message-id:reply-to;
 bh=Pw5kShSF3E0E3sfHSq2rS1swDqNHSyrtWf4koh3J7SU=;
 b=Kk+o2yEg5yzW1D+dnF/cIcgc8Gk9rEgcTR8uPovDjDPf1PkKrRWq/BDqdOQ2U4PJof
 ZYGyAjHsFgdoX7pMpAU4oGFrUDqQMiu5dEU45Q/vOO5Tz9XhHc2ar79+I0QgPDAmMc8x
 s4z36cBy3fIOu4yKj4AB0btoe+F32/JxNjF18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
 :subject:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pw5kShSF3E0E3sfHSq2rS1swDqNHSyrtWf4koh3J7SU=;
 b=jUVxzO7Cr9JdDgypssNbqyR3I7dWx3MrwHv755lWPhH4C0XSHM5NNPRSec0V9JKFev
 0Z8UMxiVrSTiCS4q4Cgr0e5HzI41NF7VUjRHiQ2LauJohtlCZqU4LG6jX2FMLEalr9ON
 mPL4+Bq2bau4/xWA44nszggfui11lLQknG9CUyLHUoBtcHK/OUZ7+kToWxgUo2ax8nRA
 F6WRb2f1ltKP7ow6V2eBcJ/JcYjgjfKp0iwLzfY/d1OzyuOPdrbLCT6LjxNu6v8vFEw3
 gz8okt/EsUspmDChZn1VQRfWBgpq07/40tj92Jmx9LEnumxr5xX21up9qJE5X5zXapY2
 a1eA==
X-Gm-Message-State: ANoB5pljMbcQWRI7bR+vKF5KYCvfHLSuwzqrgDbSW+VoKGcEuubeu0mT
 LkkFSOB35PBlROvt3cjqPD/WBw==
X-Google-Smtp-Source: AA0mqf5Uqj/CD0/FukZXXIc0vRyTLddNiAbe2JXdXsEHuMwbmXDMwhTREvJcq30MxLXV+1w0b73ssg==
X-Received: by 2002:a17:906:2302:b0:7b9:de77:f0ef with SMTP id
 l2-20020a170906230200b007b9de77f0efmr31418299eja.5.1669825782653; 
 Wed, 30 Nov 2022 08:29:42 -0800 (PST)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk.
 [80.71.134.83]) by smtp.gmail.com with ESMTPSA id
 cz15-20020a0564021caf00b004589da5e5cesm786114edb.41.2022.11.30.08.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 08:29:42 -0800 (PST)
Subject: [PATCH v7 0/2] ASoC: SOF: Fix deadlock when shutdown a frozen
 userspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN+Eh2MC/3XOzWrDMAwH8FcpPs/Dlr/SnvYeYwfZVhpDm4C9Br
 aSd5+247DRQfwFP0lP0agWauJyeopKe2llWzmEl5NIC65XkiVzFqAAtIYg25rlXIm+SWoibQ3AZM
 ALBhEbyVhxTQuT9XG78XAp7XOrX38Hds3tvbtr11JJF6zXaLynBG9pqdu9PO6vW72KD960w1gD6z
 yhBUd49t50tBlrwxqBMgajE2rb0Xas7e/n7LyNYQaMHe3G2rG2lLmimiKqjvZj7VkbOivnzOwtun
 /6OI4f1ZmnceIBAAA=
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 30 Nov 2022 17:29:19 +0100
Message-Id: <20221127-snd-freeze-v7-0-127c582f1ca4@chromium.org>
To: Steven Rostedt <rostedt@goodmis.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Chromeos Kdump <chromeos-kdump@google.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=2556; i=ribalda@chromium.org; 
 h=from:subject:message-id;
 bh=fWR7ZhQQr5ar1fWGLk9Z4Z/KnsEAhZyZVnGAD/1s2QE=; 
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjh4Tj1YJB5e2N7FcWhOjD8LaBqVFgwZ6IzdIM0xvp
 aiGFuduJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4eE4wAKCRDRN9E+zzrEiCKbD/
 9ABaeeu+udLacBhMTu+U8I0v2fMtTFzWs53fP+KTDnJE63jhi466UEK2Eu6YjLxuiFFGwoA1H9rm2F
 K2d3T8RyD7FP9KkvaYEU3hdCAqEoYCWqTpseaJwBD1p0TGN2KlklISkClKwEecScrguxuDnBpNc0AO
 IguSucJL9GHuRLPh2bmPzfqk9fXTmWHuXvMQSEbTFm08p7/8tnXD6c4DrF8y2kEkP8UOMYwRvlL3IL
 jQClmEBBVFU9iGyCJlDnZufqBXd2FKl0G/Lle5yT9G4Aa8mXz0vTp7S4ESFrFPTVuZ6cr9a4BeDxF1
 j/q77JY7hvMgmblwDTVpIZPgjoMeNhRvryvPDahtEaj1ysEwkwVR75y7sOPJipu/zHaL/G+c2hL8sf
 efcLlAxITUlGn+K0htYH8F5Rwc3rgK+wmpd/KyshA1HS0vjx9os/T4qJXAoPcLo5v7rXB4nJs/udeN
 NcI98QsNdnRVKpAjwvU8n+jhscLK4Mjf6WXo6ho5aWnkGpRU/bBcaw9IprIt8saDDtjAElFH7/nEL/
 nAx/38CAt8kk5W9Ps6ixILZQLU0QpH9FGz9idFMKpPOQBQaCxbAGub5JOXKA971+4QARa0ecT9mNoh
 HunOaLUT93bmfokQX9++oCdDrS1PKPCPc5SCFGB0AR0a2iI5fzOf3jzWj4Sg==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
Cc: alsa-devel@alsa-project.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Ricardo Ribalda <ribalda@chromium.org>, sound-open-firmware@alsa-project.org
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

Since: 83bfc7e793b5 ("ASoC: SOF: core: unregister clients and machine drivers in .shutdown")
we wait for all the workloads to be completed during shutdown. This was done to 
avoid a stall once the device is started again.

Unfortunately this has the side effect of stalling kexec(), if the userspace
is frozen. Let's handle that case.

To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Eric Biederman <ebiederm@xmission.com>
To: Chromeos Kdump <chromeos-kdump@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: stable@vger.kernel.org
Cc: sound-open-firmware@alsa-project.org
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v7:
- Fix commit message (Thanks Pierre-Louis).
- Link to v6: https://lore.kernel.org/r/20221127-snd-freeze-v6-0-3e90553f64a5@chromium.org

Changes in v6:
- Check if we are in kexec with the userspace frozen.
- Link to v5: https://lore.kernel.org/r/20221127-snd-freeze-v5-0-4ededeb08ba0@chromium.org

Changes in v5:
- Edit subject prefix.
- Link to v4: https://lore.kernel.org/r/20221127-snd-freeze-v4-0-51ca64b7f2ab@chromium.org

Changes in v4:
- Do not call snd_sof_machine_unregister from shutdown.
- Link to v3: https://lore.kernel.org/r/20221127-snd-freeze-v3-0-a2eda731ca14@chromium.org

Changes in v3:
- Wrap pm_freezing in a function.
- Link to v2: https://lore.kernel.org/r/20221127-snd-freeze-v2-0-d8a425ea9663@chromium.org

Changes in v2:
- Only use pm_freezing if CONFIG_FREEZER .
- Link to v1: https://lore.kernel.org/r/20221127-snd-freeze-v1-0-57461a366ec2@chromium.org

---
Ricardo Ribalda (2):
      kexec: Introduce kexec_with_frozen_processes
      ASoC: SOF: Fix deadlock when shutdown a frozen userspace

 include/linux/kexec.h | 3 +++
 kernel/kexec_core.c   | 5 +++++
 sound/soc/sof/core.c  | 4 +++-
 3 files changed, 11 insertions(+), 1 deletion(-)
---
base-commit: 4312098baf37ee17a8350725e6e0d0e8590252d4
change-id: 20221127-snd-freeze-1ee143228326

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>
