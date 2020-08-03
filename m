Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7F4239DFF
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 06:03:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 188281660;
	Mon,  3 Aug 2020 06:02:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 188281660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596427410;
	bh=YB2kxZgLwBwG5gisKXUnjsObbxSPjwKlhwE2R2dpqQ8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qMLua9ylv/3gL16IM5x6KUElRXXFT0dHZgWh7sW+/B/I7NkP3I1x/XKetAaNoTRmO
	 P0k4/UFiQ2eQ95pRWP4FFnxlW4rA+dB5cArAee6qWjGmnNQ/r+wUQFMHK5e20SZk7J
	 B520U1FG6BytJ2WOHLcqYoi8L1gA3TfLR5WlZjTA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EF9BF80218;
	Mon,  3 Aug 2020 06:01:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A3C9F80218; Mon,  3 Aug 2020 06:01:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2569AF800BD
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 06:01:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2569AF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="XG70c2Dz"
Received: by mail-pg1-x544.google.com with SMTP id p8so3066447pgn.13
 for <alsa-devel@alsa-project.org>; Sun, 02 Aug 2020 21:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yUG9PDflOauUKzeZLQPLk7LHLARUNdO3mRXIHJ6GORg=;
 b=XG70c2DzrXSTp1PgC2bTrPGff/xoNe8pEiCz7UiDz9MjZ7Y/JT47wKDfmfgEUueSkL
 qwMeZhxghrcqQIHtk34wJDKqi8XNeEX3B+7D7x6fwzEE/WEqk/1lVJK6/K+rGCNbzqhI
 6XIpXpR2j5TlclO8OuWLugFNhNGwqg45eVJ50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yUG9PDflOauUKzeZLQPLk7LHLARUNdO3mRXIHJ6GORg=;
 b=iB3AMmBFS9obaaEZFGlksrVanKCpOEiXpsweu33HKv3mJ/d9MoKDXyQL0f5+ORSDD1
 X7HA798Ae3E024zfRflg0hLMCf0Je398HnjEuDhAHGZoUdckZbXuTdLiukcMH2Eyjvzp
 qVFr52fGndIWLUTrTR7GgzMtKrgWsn+X6zRevqERGpmhQb5kdng2zQK4lZqZ6BZTJxEL
 trfMPb/oSLOZ+EzVCFjEkJlCPXUomDWyYvVfVh/XgWGDkoGC1b2GMq6Fbu4/AEHPUBc0
 UvY1yYevqZLAHxPz9MpNwO/kX2BJkj0pq8Ir40d3l/4YDDk5086pRMMGQkN9MvZubLDg
 3KOg==
X-Gm-Message-State: AOAM5301baezL/i0a0XYckpMeIg5k5AFysP5kn5kha5zrI7scoxhje8m
 yk77dzYaiHjqoHVm6hV4OXvK4A==
X-Google-Smtp-Source: ABdhPJxP+lh6ND1hcM+YIlREZCHSyt0Q+gl1D1E1/uP+/wpTAUIj2z3wimskpD5Puv5muq8X44ygHw==
X-Received: by 2002:a63:1116:: with SMTP id g22mr5535601pgl.257.1596427291773; 
 Sun, 02 Aug 2020 21:01:31 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:de4a:3eff:fe7d:d39c])
 by smtp.gmail.com with ESMTPSA id r6sm10440146pjd.1.2020.08.02.21.01.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Aug 2020 21:01:30 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] Add documentation and machine driver for SC7180 sound
 card
Date: Mon,  3 Aug 2020 12:01:20 +0800
Message-Id: <20200803040122.2063634-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
 tzungbi@chromium.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, alsa-devel@alsa-project.org,
 Andy Gross <agross@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 Mark Brown <broonie@kernel.org>, dianders@chromium.org,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, dgreid@chromium.org,
 linux-arm-kernel@lists.infradead.org, Cheng-Yi Chiang <cychiang@chromium.org>
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

Note:
- The machine driver patch depends on LPASS patch series so it is not ready to be merged now.
  ASoC: qcom: Add support for SC7180 lpass variant https://patchwork.kernel.org/cover/11678133/
- The machine driver patch is made by the collaboration of
  Cheng-Yi Chiang <cychiang@chromium.org>
  Rohit kumar <rohitkr@codeaurora.org>
  Ajit Pandey <ajitp@codeaurora.org>
  But Ajit has left codeaurora.

Changes from v1 to v2:
- Ducumentation: Addressed all suggestions from Doug.
- Machine driver:
  - Fix comment style for license.
  - Sort includes.
  - Remove sc7180_snd_hw_params.
  - Remove sc7180_dai_init and use aux device instead for headset jack registration.
  - Statically define format for Primary MI2S.
  - Atomic is not a concern because there is mutex in card to make sure
    startup and shutdown happen sequentially.
  - Fix missing return -EINVAL in startup.
  - Use static sound card.
  - Use devm_kzalloc to avoid kfree.

Changes from v2 to v3:
- Ducumentation: Addressed suggestions from Srini.
- Machine driver:
  - Reuse qcom_snd_parse_of to parse properties.
  - Remove playback-only and capture-only.
  - Misc fixes to address comments.

Changes from v3 to v4:
- Ducumentation: Addressed suggestions from Rob.
 - Remove definition of dai.
 - Use 'sound-dai: true' for sound-dai schema.
 - Add reg property to pass 'make dt_binding_check' check although reg is not used in the driver.
- Machine driver:
 - Add Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

Ajit Pandey (1):
  ASoC: qcom: sc7180: Add machine driver for sound card registration

Cheng-Yi Chiang (1):
  ASoC: qcom: dt-bindings: Add sc7180 machine bindings

 .../bindings/sound/qcom,sc7180.yaml           | 113 ++++++++
 sound/soc/qcom/Kconfig                        |  12 +
 sound/soc/qcom/Makefile                       |   2 +
 sound/soc/qcom/sc7180.c                       | 244 ++++++++++++++++++
 4 files changed, 371 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
 create mode 100644 sound/soc/qcom/sc7180.c

-- 
2.28.0.163.g6104cc2f0b6-goog

