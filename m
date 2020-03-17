Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0A31888D5
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 16:15:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B9DA1755;
	Tue, 17 Mar 2020 16:14:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B9DA1755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584458143;
	bh=lRFem7qQgAk+KJPqvOX4YqkMWp1hcYJxLSBbQ3Xzma0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Lx3PFLVhntsPNE2D8udQYlXHVWf/4ci2zMQ285Jii1YoSX7ezMKSkPxe13HGUA3qm
	 xoLSlrWNkWuH/F/ADB4zIBS+KMPebz8kpczO6Ovh4W9Q+gTTEnNrpOGB8NinlbWwJl
	 O1tufovbhwQoeI4W/Psn0krMiMDE59fbHrarLELg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72826F80256;
	Tue, 17 Mar 2020 16:13:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7036CF800C0; Tue, 17 Mar 2020 16:12:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8DEDF80217
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 16:12:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8DEDF80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="WmxBBoG5"
Received: by mail-wm1-x343.google.com with SMTP id 25so21880676wmk.3
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 08:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qSvV6OpvBf1rvB8ZBQIuOtC3wOEjkhtAfFvjmoSxpKM=;
 b=WmxBBoG5elQBlBCwz/IKHCH6X8PLjSl3o7xDvcMXnSYgcDH0kY8VRjtCj4hcRNV6A7
 fk8jrU2lU4vRGuUNpGtbaCAEw5Mvk/hmhCOG/Hgy0Mjn4wCpCmTgXalHUGZqaFietR4i
 CjUlos6iU1ZwxhBrMZeQipNk22v/IRLWfubb5Yro3QO0ODAntEvNngOuRTlm0O/QjLYM
 s5mDVj5YXXSU3y9GQUmUlsGfv+p+qJb8OykUFdiwyat8H+1ysUWqrw8CgOE/3NtKS357
 fPBQWxhTvv+j5ahpe5nauXfhZBCQO7sfepDmqjVpZXpz8Rd4aWEiZKb8VcCIjSRskYQf
 9OGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qSvV6OpvBf1rvB8ZBQIuOtC3wOEjkhtAfFvjmoSxpKM=;
 b=dIxxfhZM029ZhH7kXZ2FxXnT4bS+Lir5QQwndiya5+J4w9Ayk5Kh+Ca7k0cnlWxsYx
 O6qG8NKaR1dJpjw2jm1V4kh42e4DnUwCbDmE4R5OpIF3u/H2KXgSkFMhGvFZCihMsNoC
 Vtm8AV5KFpqBfPKjFDgPUO8jav83VbCCVW1XC6RonSU/dpzqjBqZnr9uuN5388z6Kat0
 Sww9cfNgfxUARx5Ynu8J1kxxmlI+geW6CWJXxerRA6bsRxoe372dVrAvH80+0V7nVVgB
 qbJgUiu3IHSC0N+c4HTBE3BqFfyEgdN4x9i4n/NcyJNAQbgO621t6PRxA8oz9a1eoKJ8
 963g==
X-Gm-Message-State: ANhLgQ09ZvowSVLZzdaL5q48Eca6QR3ABfHqWKFu5OMBQ5ZH0Iqw2Lul
 HL3Is1Egpuc53F7SWrVbuGbtpxEQA4I=
X-Google-Smtp-Source: ADFU+vtqacOkLRon1SKHEZrSi/5Duy8tSRlCpBE1YWumTSvdeh3MQP9RyTMTg8QT2IBi3zf9JuGpng==
X-Received: by 2002:a1c:8090:: with SMTP id b138mr5983445wmd.55.1584457969777; 
 Tue, 17 Mar 2020 08:12:49 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id u8sm4711089wrn.69.2020.03.17.08.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 08:12:48 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 0/2] ASoC: sdm845: fix soundwire stream handling
Date: Tue, 17 Mar 2020 15:12:31 +0000
Message-Id: <20200317151233.8763-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 vkoul@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Recent addition of SoundWire stream state-machine checks in linux-next
have shown an existing issue with handling soundwire streams in codec drivers.

In general soundwire stream prepare/enable/disable can be called from either
codec/machine/controller driver. However calling it in codec driver means
that if multiple instances(Left/Right speakers) of the same codec is
connected to the same stream then it will endup calling stream
prepare/enable/disable more than once. This will mess up the stream
state-machine checks in the soundwire core.

Moving this stream handling to machine driver would fix this issue
and also allow board/platform specfic power sequencing.

Changes since v1:
	- removed false error check while setting sruntime.

Srinivas Kandagatla (2):
  ASoC: qcom: sdm845: handle soundwire stream
  ASoC: codecs: wsa881x: remove soundwire stream handling

 sound/soc/codecs/wsa881x.c | 44 +------------------------
 sound/soc/qcom/Kconfig     |  2 +-
 sound/soc/qcom/sdm845.c    | 67 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+), 44 deletions(-)

-- 
2.21.0

