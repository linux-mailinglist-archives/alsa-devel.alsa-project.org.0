Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 528382A3AB1
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 03:55:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEFC71743;
	Tue,  3 Nov 2020 03:54:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEFC71743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604372143;
	bh=1heWOxX45caqxqta4L8VaEJrC9lsVKW3q3CgUfOAEkk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I7bW/gdtFK6ZX1Vg9Rz/DsOxjyjZT9QIIP2xhcIYUAVVUZ7DDOXN5z3P9Q8hyw964
	 9lSMU2dysEjwXOuO8/5gEjWfIzM79IY49e6pEr5Sdc6chgC9+dHLhbiEwgGKbGzqwA
	 gzui765lg6vjkqj95fdJotcA3l0y3mqguz92tBDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4920CF80272;
	Tue,  3 Nov 2020 03:54:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC4E5F80171; Tue,  3 Nov 2020 03:54:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0EF2F80108
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 03:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0EF2F80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="h3//92rp"
Received: by mail-pl1-x62e.google.com with SMTP id z1so7842839plo.12
 for <alsa-devel@alsa-project.org>; Mon, 02 Nov 2020 18:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gqs+1TnFEGdD9FcDOYfC91qpqXfct7hE2tf3ECPoBSs=;
 b=h3//92rpvD3iQ/zyByZAkFZ0BcjqX4Qh4TZ04zul6pRXuCGJp0XP6iG2eb+QPXZJR1
 XdpSkDIMU5SAQOv3YMwCT6nO7shM5yIuxEJrsr7QvxqjrJAmYvOpEmAApFJEGXDo/bjM
 PeUjA73o8WqXAUjuXo8YW3FnYIv0Y2qd0mfI6WWEo0XKjAK700F6op3TGjSb+7OXgB9/
 0c67pawv5YMb6LBKecao9lO9U1U4j8kQ4k4OAiTRl7kiKSxzOfgnPs4m6TLp+Xqvhr+A
 W2Yu2+pCvAg0CQlwpnuLYREU2+Na6oipsN9HlgWdZjpbaV0vRYR3Sd8a/JBUXghp8ZOX
 MNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gqs+1TnFEGdD9FcDOYfC91qpqXfct7hE2tf3ECPoBSs=;
 b=ELXk9fmTO5wnpwq2PDOqRLVU7PZaaw5scZNW/QAxf0nh9NTSuQVAN9gH4pdmnjNB3f
 N3Xre3c0a8Nli13j7EakSsoLlnzyXz+xeqm9XhV6zqlR0SMtV2OttbaGkgdf8EbYOpxk
 nGE22EsP8+FhMG/FzQVAOyChv9qhCtrCUL3qboOJH4ePvwceFwmfE0V6w+BCZsP+7giO
 ncA7wUKkLbaxnOukKVRzg+QlbzT0bL36WhoQ8ge2Q+r36Foc6EiVugemJkZmvJA5hZOs
 mo/FwXm1vtAsy/AntfjnKQ/pO6PhYhFHo8L0xmlQQBvTjHLxDLrRALchODBWv+UZFRAR
 y+ug==
X-Gm-Message-State: AOAM532FFm3rS3ZDfuWDwWLprImRzpD7GCA/Z0mn8DaZGq/K00e1BSoB
 ZLqazuX4IojB7S5UhR8GGuw=
X-Google-Smtp-Source: ABdhPJzu5XHybPXfvvmK+2kjYSsHvClT7MzkEy+gcpckiXpa1Cg6UrXC6bbxPS0EIU1BkvkV/2Ek9g==
X-Received: by 2002:a17:902:bb8c:b029:d2:2503:e458 with SMTP id
 m12-20020a170902bb8cb02900d22503e458mr23372102pls.18.1604372038547; 
 Mon, 02 Nov 2020 18:53:58 -0800 (PST)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
 by smtp.gmail.com with ESMTPSA id cv4sm886145pjb.1.2020.11.02.18.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 18:53:57 -0800 (PST)
From: Ajye Huang <ajye.huang@gmail.com>
X-Google-Original-From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] Modify documentation and machine driver for SC7180
 sound card
Date: Tue,  3 Nov 2020 10:53:45 +0800
Message-Id: <20201103025347.510940-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dianders@chromium.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, tzungbi@chromium.org,
 srinivas.kandagatla@linaro.org, linux-arm-kernel@lists.infradead.org,
 cychiang@chromium.org
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
- The patch is made by the collaboration of
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>
 Cheng-Yi Chiang <cychiang@chromium.org>

Changes from v1 to v2:
- Ducumentation: Modify the dimc-gpios property description and examples.
- Machine driver: 
  - Remove "qcom,sc7180-sndcard-rt5682-m98357-2mic" compatible
  - See gpio property and use anadditional control.

Changes from v2 to v3:
- Machine driver: Addressed suggestions from Tzung-Bi.
  - move variables "dmic_switch" and "dmic_sel" into struct sc7180_snd_data.
  - Remove redundant judgments in dmic_set().

Changes from v3 to v4:
- Machine driver: Addressed suggestions from Tzung-Bi.
  - Remove redundant judgments in dmic_set() and dmic_get().
  - Remove 1 level indent of judgment of IS_ERR(data->dmic_sel).
  
Thanks for the review!

Ajye Huang (2):
  ASoC: google: dt-bindings: modify machine bindings for two MICs case
  ASoC: qcom: sc7180: Modify machine driver for 2mic

 .../bindings/sound/google,sc7180-trogdor.yaml | 58 ++++++++++++++++++
 sound/soc/qcom/sc7180.c                       | 61 +++++++++++++++++++
 2 files changed, 119 insertions(+)

-- 
2.25.1

