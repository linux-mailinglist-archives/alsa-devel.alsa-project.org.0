Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E40463D9D7
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Nov 2022 16:48:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35A8416DF;
	Wed, 30 Nov 2022 16:48:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35A8416DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669823330;
	bh=0IpYWvaM1nSCLes2AAhkL8u1zUltWsSBA7Q7jAHaGa0=;
	h=Subject:From:Date:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OaTNrsXGgr8mrX+n9JywBbh0x6wTyW9Ao3GvqIf3cfGhqG9xSWQBj/wWKy3JcPrkV
	 AZRJmW7Gg3bgLQEzLlaaKWqU2TQSSY/vLNG8oQG1Qv0daRHE2qva11ywnSA7oOyMsA
	 7FQueZeJ5w8rot0MBcagFYEJCIj1YB6XWFcSOy80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 206C3F80507;
	Wed, 30 Nov 2022 16:47:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3190F80510; Wed, 30 Nov 2022 16:47:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B01DCF80118
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 16:47:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B01DCF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="HkNQp9YU"
Received: by mail-ej1-x634.google.com with SMTP id ud5so42354141ejc.4
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 07:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
 :subject:from:to:cc:subject:date:message-id:reply-to;
 bh=EcYtt4TvCK6BJCf6X9l4DaZy+QVb6a2ZN0d4hYVvO5M=;
 b=HkNQp9YU/g8x0KR+AJ4lyzhOvHqTcw8p0Lo+9qzPNb+bGgbOIGX+8QfYWOekwN10Y0
 j5Xy7dXUm2URn1NLg0LZ+uYuMwWrc7VWPI/adrLJ5KwaDGbDpK0KQDmECZYZLoC/ibPU
 qCk/dypWPhNOBgEQKAtUPvJGOv5/zvkocjG4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
 :subject:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EcYtt4TvCK6BJCf6X9l4DaZy+QVb6a2ZN0d4hYVvO5M=;
 b=XYJO6YsI79YgwQpNY/6raDqe5W6DyfWId8DIp5I0rE0QhPzRsBp4Vl1eZ9bcjd3Hby
 yzzhuOLxs9xkvk+7wqn7IVxr2nGGGuvfZs6shySJqZZxgCy6c9tREBspFpIzQpmT7TnY
 mdBtYXqoR9sMnWB0CJ3sV8hH23wVSShrqMKhusJen6ESiQ67tCnzzychfSytx76uFFQw
 qhQ5r3XJuq2P61S/oYzARPx/ASkdCp18FdFZP6LIgo/M6Xh+jBOE0M91V/CYe4TDlMJf
 xIGc1FukwjanvsIR9/uwwAL98QLOLdt3WRKYJP8/zFNJF90pk/PcLVPPVSk9olEyRSPQ
 X0Pw==
X-Gm-Message-State: ANoB5pm+ZxQr6f4xzeR60SbbR9Ul1V6s6/HH4LUGCl/oRfPyV2/Ozf5L
 8ruFK6/sCQvgW383juoqxVHTTQ==
X-Google-Smtp-Source: AA0mqf6Z1je942r9oeXVz/mlwkUzKcyf4WjxIsYxEuWQeNcO0op0aSlw6z0KssbOi2JnutK+MAi57Q==
X-Received: by 2002:a17:907:9190:b0:78a:52bb:d904 with SMTP id
 bp16-20020a170907919000b0078a52bbd904mr35398243ejb.630.1669823263729; 
 Wed, 30 Nov 2022 07:47:43 -0800 (PST)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:5b33:e3f2:6a0b:dcdd])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a17090623e900b007bf24b8f80csm775075ejg.63.2022.11.30.07.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 07:47:43 -0800 (PST)
Subject: [PATCH v6 0/2] ASoC: SOF: Fix deadlock when shutdown a frozen
 userspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAJ7h2MC/3XO0arCMAwG4FeRXltZ0q6bXvkeci7SNrqCdtC6wT
 mydz/RS9nIRfgDX5KXqlwSV3XavVThOdU0Zgluv1NhoHxjnaJkhQ0iAHa65qivhfmPNTCDNYi9Qa
 cEeKqsfaEcBiF5ut9lOKT6HMvv58AM0i6ru2bQjW4764CMcxzwHIYyPtL0OIzlpn5k04zbGkXHni
 y2TEfnzIo229qIJuRInYFAYFe03db2/bk4Z313RfIrut3WrWjLUco3vafmSy/L8g/3tjM2pAEAAA
 ==
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 30 Nov 2022 16:47:14 +0100
Message-Id: <20221127-snd-freeze-v6-0-3e90553f64a5@chromium.org>
To: Chromeos Kdump <chromeos-kdump@google.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Eric Biederman <ebiederm@xmission.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Steven Rostedt <rostedt@goodmis.org>
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=2401; i=ribalda@chromium.org; 
 h=from:subject:message-id;
 bh=0IpYWvaM1nSCLes2AAhkL8u1zUltWsSBA7Q7jAHaGa0=; 
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjh3sRb5TNdySmknidfqXIO/9uwnM15fXaAOYH1a7B
 CsZYzoyJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4d7EQAKCRDRN9E+zzrEiHMJD/
 wOyrlwuTrdzgZKh/vpQf1F1krDwjjxFuxAWO6DF7eyp/O92Lm0IMo6CSCttg4VXQz1Dh33wT1nsAbz
 OtCKyiQx+Uxj9D2fv4V1pxus4Bt4eaG1Q7rUMDaFOf/6+w/XOmcZCsSRc3T8b6fYlzqHi5y1pafgb8
 0J3nsBlYFU8LwiWXkVJ3FR9Q2vqc8ft/ttb9p7S9NWL96g6MxuviygZN7+SUVvLzh18h0pMXyo0u4k
 bXZJdZgj743SD5Jgq1dAC+EDo7SzwSfeMqdPv9pmTHiWLcPkAmlTCDBaG1921XxGfAwdRh9D0BArwR
 kcMFumuoEBMYPnkCcdmGpcPfoJKJ9nFV6mz2dri01o+cCf0YbCWYZRITxOVlOZgoq0hXhaK/PeAeaZ
 NmeA2bYOe/HTSDUyCqfGurAQf7WC7OFqwvd5YCQkHXBDfdEIThvDWtCqz/iE/4a/BX6zwkhBuPAnTR
 I81RRoUr6wNJ1JNAqsgDlEXsGvhalrV/EZkkIQN4PZeXedA/nm0Vxmwcv4HLy/q4O4S5uAbBBWChOv
 PiZwAjkYcVc1TZm8+yGlWkYaXA3E72DdKdi6g4fsRKXSNcX7wh3Rvtjr+3PprsuFOSbMZbqJafyvCh
 JHhakZZOqmtBsIsR4TrkSzSw9TosMuXQZxnGgsNl562FPWAnz7D2Yk+c7Ulg==
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
