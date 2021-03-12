Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A45B338CAA
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 13:25:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA3841706;
	Fri, 12 Mar 2021 13:24:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA3841706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615551931;
	bh=i/1oqDbFIS+6NuiPKhN7dmvS9ilBTnwdAV/I2E1ErpU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hjo614fyzJp3icLTSXKa0C5Gf4KcgRzrjS3pU9P6ENYHT64H6WY3MWstbukrQwCGB
	 FxvUZaplOB7mDmemuIH7lJThdK8yk+gjcL2UHAZijnXT/mtUQvZznCPMEErbUADmVr
	 JzAqDGBwGAMkuvq9Ex0M/EHy8OPF9Xo8qQWBrXww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 184C0F8032B;
	Fri, 12 Mar 2021 13:23:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92551F8016C; Fri, 12 Mar 2021 13:23:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87368F8016C
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 13:22:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87368F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cuOnInoC"
Received: by mail-wm1-x32f.google.com with SMTP id l19so3690840wmh.1
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 04:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gw1EmCEru4mg3+UNq5mxUL127uGPwQQa9UFbvGW5NTI=;
 b=cuOnInoCzbYXcB1KE5fz2yZHLtqWBz9qh7UG3lXJMeCj+zARTGww+hTmqo5PhiXx97
 UY4064YuVsrxrXIb+OcMhjPO/NY2dmV7Pray+0LDDZ+JulCWwdW86mPXw9W41mxeExYU
 LCCSxP+raDM2LLVKnLFvyhqLxmrVlfjNCy/LAdRao99I7O+X5AHfkcf8gY6minxejmkO
 TtlESx6ZWGcsbiJieSPRPItF2SZ/ZQUIX9iywILHy1Ugs1fNo3mKWhTheBDKMwSfxIQj
 AG4Yp8fis64UejdHnk4rWcFONt3iMHy+BsaLAbC/nw1j3v4GZ4HBbO1s3jBr0urATl/m
 qHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gw1EmCEru4mg3+UNq5mxUL127uGPwQQa9UFbvGW5NTI=;
 b=K+3r0nt05AnkGjeAzijs0vjHpnpBqk0I5uq22kFbajmtInxPMDT4o6pMGldjis7dkR
 1XpVbaL7yPCO386HvjH/dlFFfV9xS5ClDwsRCt0OLyM5TiYXq5W7hin1FlEg1eLAaSk7
 O103/gNsiYhKXieTz8jl8QO6qM3Wf+FH+mXGctlECXWRCKdTM0TD2oBZr691DQdDyTMQ
 vRHRwReFgW6z3XbZmW5+0AOgyD78N3x+I08aabLVdhpOmbU368mhiMWV+nBJFeFgpuQt
 28PiRKozvoQrqqt7ys727q4KGJOhsBCukN+CMCSp41mNaTWuxv2z2DS2M2TAPH/t4fcX
 SKpA==
X-Gm-Message-State: AOAM531VciDtX8qYJiMq36qmzNzCXoA9fR6+pYvB4JfVyGjLoSEQQwIS
 l1/9CdWS8x43SuUZW5tDryaOlA==
X-Google-Smtp-Source: ABdhPJww7SBBR/wgNWOgTTUZXlxZnzs/4W5fSEWQ/e3ed5u/QFiShUj+guiVKTkM7YlwR7o26udojg==
X-Received: by 2002:a7b:c3c1:: with SMTP id t1mr12734679wmj.47.1615551778173; 
 Fri, 12 Mar 2021 04:22:58 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id 3sm8804329wry.72.2021.03.12.04.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 04:22:57 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Subject: [RESEND PATCH v3 0/5] soundwire: add static port map support
Date: Fri, 12 Mar 2021 12:22:50 +0000
Message-Id: <20210312122255.3143-1-srinivas.kandagatla@linaro.org>
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

Resending this as I realized that alsa-devel list was missing in cc!

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

Changes since v2:
	- fixed dt_binding_check error and kernel test robot reported errors
	- updated comments as suggested by Pierre
	- updated wsa881x to populate m_ports from valid index.

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

