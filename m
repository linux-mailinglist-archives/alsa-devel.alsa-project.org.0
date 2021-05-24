Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1103338E4D9
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 13:08:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9447D836;
	Mon, 24 May 2021 13:07:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9447D836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621854527;
	bh=KHJ0hkIWzQmEintAvnmSF+BWoCtQWpV0wcH4ui/itcw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jvMV//n1rdy0rtLPrWSrPs4s66pu2j0ZSe8on87p993T487US3rPQjWEGVLUO1A4r
	 GEjick9aRy6jzM8hW76pSZiL2h9yrFtypMgzebK4RBwI7qc0lMbQDSEUYxLJKmLFPm
	 J8IMU5ePrnurY0Pkf6PaVuVI2373CMQLORxgz82o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46E66F8023A;
	Mon, 24 May 2021 13:07:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26BE9F8022B; Mon, 24 May 2021 13:07:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13694F800B8
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 13:07:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13694F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="To5iUCbv"
Received: by mail-wm1-x329.google.com with SMTP id
 z85-20020a1c7e580000b029017a76f3afbaso8222692wmc.2
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 04:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PeNUaTE63OPp+/pR7NHJmfmMhfGonz4QjPJgw0MkZAc=;
 b=To5iUCbvc0iB46YPV/5/JxR+nQ9JAWj9JUsjp6O0kyzHG0axIaQe8SYrkTwH3Ic4ME
 3oQ2NfgtinD2tECA3TqIAT7Pt+S6ML3VaNM00x1Zx7tAIBqbi9QVqlImudHOzRCXzxX4
 m5TH1ZmEvGuMM7Z4w/lLINBSx7pqnYxUB70EtZsNVuRA45SNK4T6OMJyrByPmdC5C+sr
 D6BMuh7/U8JYNgLKjeFZo+lOrpdzx4G6+hGL27kF9g0fJx7MhBUSkfyD12Rk0ZFA2eK7
 0etiG8NcxsIPB+qsHs0fVMYhVpZiuoA6tcsapwrgIYVQnT38l44tH/34kKFqVldPv63I
 6P6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PeNUaTE63OPp+/pR7NHJmfmMhfGonz4QjPJgw0MkZAc=;
 b=ST0mgUVPRXcBzHsmKHsjkKCHQ7iDKNPXikNoQR6UBBfw7gNcfNBO6opcrkLG1aTC0P
 dI5Ym/qhP2DSDmHsitiShlAVJw993978dNSpYkVd93HIcktKicAIlMqeQlrLePMmyzaU
 n50rUBY1S+Ao9M5ZYlG0b39conjYmlJaZMnJCnZDiEb55BXMLRWLJZc2/Nvk3F799tEX
 z7I2WZ3NAfG34lQmQGFHg299Cd5lk8g8vhJdi77OK+vb5/jm928WGvxbyioRmgunvFAN
 900WKEKz5Qsrd+Xfx7PHwNCUBLRByzofO1bLfVjVdEzJh4vFQyoH7oJ7rFG9G2D+GRwr
 KC5Q==
X-Gm-Message-State: AOAM531ZC+WZrweIJ1PlEVLQcr/mcR4y3HaJmq4s+1fG97PfLCwzYT3e
 s8BuvjWrg/dwqCqV5i3nvkr+AA==
X-Google-Smtp-Source: ABdhPJybdhcDmR3vk8QtWydP3CWuM3+mky3U8jM/MPQ90E6wddjNJZXuyX7EmzrsCXWxMhnaJphFNg==
X-Received: by 2002:a05:600c:2f17:: with SMTP id
 r23mr18652643wmn.94.1621854432855; 
 Mon, 24 May 2021 04:07:12 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id x4sm7590978wmj.17.2021.05.24.04.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 04:07:12 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 0/4] ASoC: codecs: wcd934x: add Headset and button
 detection support
Date: Mon, 24 May 2021 12:06:56 +0100
Message-Id: <20210524110700.27077-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

This patchset adds support to MBHC(Multi Button Headset Control) block found in
Qualcomm WCD codecs. MBHC support headset type detection, both Mechanical and
electrical insert/removal detection along with 8 buttons detection,
Over current interrupts on HPHL/R, Impedance Measurements on HPHL/R.

Eventhough MBHC block supports things like OverCurrent detection, Currently its
reported as a kernel debug message. Should this be reported as an uevent to
userspace? like the way USB reports? 
Any suggestions?

First patch adds a common mbhc driver and the second one wcd934x specific driver
changes along with sdm845 soundcard related changes.

Common wcd-mbhc-v2 driver should be reusable across multiple codecs like
WCD9335, WCD934x, WCD937x and WCD938x.

Most of the work is derived from downstream Qualcomm kernels.
Credits to various Qualcomm authors from Patrick Lai's team who have
contributed to this code.

This patchset

thanks,
srini

Changes since v1:
	- updated buttons-vthreshold bindings from review comments for wcd938x

Srinivas Kandagatla (4):
  ASoC: dt-bindings: wcd934x: add bindings for Headset Button detection
  ASoC: codecs: wcd: add multi button Headset detection support
  ASoC: codecs: wcd934x: add mbhc support
  ASoC: qcom: sdm845: add jack support for WCD934x

 .../bindings/sound/qcom,wcd934x.yaml          |   30 +
 include/linux/mfd/wcd934x/registers.h         |   57 +
 sound/soc/codecs/Kconfig                      |    4 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wcd-mbhc-v2.c                | 1468 +++++++++++++++++
 sound/soc/codecs/wcd-mbhc-v2.h                |  340 ++++
 sound/soc/codecs/wcd934x.c                    |  884 +++++++++-
 sound/soc/qcom/sdm845.c                       |    8 +
 8 files changed, 2778 insertions(+), 15 deletions(-)
 create mode 100644 sound/soc/codecs/wcd-mbhc-v2.c
 create mode 100644 sound/soc/codecs/wcd-mbhc-v2.h

-- 
2.21.0

