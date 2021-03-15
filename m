Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A90A33C301
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 18:00:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C185217C8;
	Mon, 15 Mar 2021 17:59:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C185217C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615827614;
	bh=WsyddECY/ig3fmh4gx95w33X31B1azZeE3meFc7uWSI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uRcxAXHzPQixtGSzABWO+MDNVdeKz8Aq/iSrVzV5gbPcd9oZTKdhLuJILVLELAoz/
	 1+hfGtKNZ+v3H0NNW772CRV/7TdClQufy7qEvV86J+s7pYkINgl/nz5M+Ox5R6dgmA
	 GgM6lHC0D/fR0BlOyMUEwHVjXouJ7qvGQstY/Cls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0A77F80431;
	Mon, 15 Mar 2021 17:57:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 421F8F8032B; Mon, 15 Mar 2021 17:57:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA9A7F801F7
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 17:56:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA9A7F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="SVyyby+b"
Received: by mail-wm1-x32f.google.com with SMTP id
 r15-20020a05600c35cfb029010e639ca09eso20718619wmq.1
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 09:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QSH4pySW1EvgNL2eE6g+1Sm6NzHPVilyMhDhmhbVIH0=;
 b=SVyyby+bHXxIuDsogvieAo0CsmMkNY9hM33D/7luLD96ikvJsPAqx8bKP3CrM6P69X
 yMGK07F988/svrnbPuNYnq1/LgVEi22erA7KJD/xZYF+wiPpiyXqUkGnWAMRlucTHH+l
 lL8eRLcp+N6UaeKp590f9rO1OCqWG23lL50H5FULys4fqRXQpI4FQ5muFTNlBlrEciL9
 tyZHPTVrBQtnkIe+6xxN3BP/H0E+KeMLGZ4xrqGd2H2MuajZVqc+6U9HS2kpPgFJSvmE
 BEPeQyqe1aq5f6OHrDU9bCA6TS26Jfa8pQWTz2XqJEUm3DbdvieAtr7TkiZejZL/8wVV
 Ui/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QSH4pySW1EvgNL2eE6g+1Sm6NzHPVilyMhDhmhbVIH0=;
 b=RfiTGJL/ad1zqeud+TPm255vn2qfCgPkbHNBrkVeLEzH6hIba84Wpol+0vGVQnvsyy
 6jRkxO31Zy67aW7bHUyEFk1US2XuQHxdCcEL1YTm/y4Cm7V+OpEN1xCwsyU4ZbSxV81n
 zEYb3mTdpo5IypgKtTJzIYnH5wWVnnuSQ+/yfBIrlCg0tQ9IYF+1rFnrK2yQncNc3xfc
 ga3b6RKoc6g+76ZBGrvZhmMHyPbFizAX35dmxIWotdbKu/dMKyCPQsbYNkIimVOgoPvx
 W9Xtzx45bdIf/tRg7tqaN+DXrS/cg5FVZ62sf/GZhnV1A6Typo1Bc+HoYEMFJd412tGK
 IZTg==
X-Gm-Message-State: AOAM531ahFmiy/wbbYPj1nTCzceP/5wOSrHVggC6uMha5AqVu6zJ97AR
 JGuZqFtnbbn/eixpdi7RtHDQ6A==
X-Google-Smtp-Source: ABdhPJzbkeheDpbuU0MOGJO7aRF1AZGUsw2EODbvMTKa5b8Mn9wpcFrA3ltQBzRmOZvwburCgfR0fQ==
X-Received: by 2002:a05:600c:1553:: with SMTP id
 f19mr587720wmg.33.1615827413909; 
 Mon, 15 Mar 2021 09:56:53 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id o2sm227656wmc.23.2021.03.15.09.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 09:56:53 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Subject: [PATCH v4 0/5] soundwire: add static port map support
Date: Mon, 15 Mar 2021 16:56:45 +0000
Message-Id: <20210315165650.13392-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
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

In some cases, SoundWire device ports are statically mapped to Controller
ports during design, however there is no way to expose this information
to the controller. Controllers like Qualcomm ones use this info to setup
static bandwidth parameters for those ports.

A generic port allocation is not possible in this cases!
This patch adds a new member m_port_map to SoundWire device so that
it can populate the static master port map and share it with controller
to be able to setup correct bandwidth parameters.

As a user of this feature this patchset also adds new bindings for
wsa881x smart speaker which has 4 ports which are statically mapped
to the 3 output and 1 input port of the controller.

Tested it on DB845c and SM8250 MTP.

thanks,
srini

Changes since v3:
	- updated kernel doc for more clarity on m_port_map

Srinivas Kandagatla (5):
  soundwire: add static port mapping support
  soundwire: qcom: update port map allocation bit mask
  soundwire: qcom: add static port map support
  ASoC: dt-bindings: wsa881x: add bindings for port mapping
  ASoC: codecs: wsa881x: add static port map support

 .../bindings/sound/qcom,wsa881x.yaml          |  9 ++++++
 drivers/soundwire/qcom.c                      | 31 +++++++++++++++----
 include/linux/soundwire/sdw.h                 |  2 ++
 sound/soc/codecs/wsa881x.c                    |  7 +++++
 4 files changed, 43 insertions(+), 6 deletions(-)

-- 
2.21.0

