Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B4C33D24E
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Mar 2021 12:00:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24FAA183A;
	Tue, 16 Mar 2021 11:59:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24FAA183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615892425;
	bh=H2wXRvJ/swZsyUk16iLrO2RQUAM6ZCdQk91v9E9Hsxk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e/mFfy2Pr9lQGq1u9/3etW5B4By0Dk9qi2Cx4W7hgrwINYIMKm1z3+gBwodN49XIX
	 RSINXKr8gFcD4GICXgegYk5jvXyKXcIRr8wRyEmcxHSaBT3hR3Xgp/oAD8Vabn6xsM
	 5Qc9cimlqbos952dmxXcbclgn9jFgS+5IRP1x4ZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0582F80156;
	Tue, 16 Mar 2021 11:58:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81C48F8025E; Tue, 16 Mar 2021 11:58:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05EE9F80137
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 11:58:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05EE9F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="bLShwwE2"
Received: by mail-wr1-x434.google.com with SMTP id a18so10185184wrc.13
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 03:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=24QvwXRXNZBG8P5bI9Ru0zkrD3yT3FL6QtFP4Z/IiLg=;
 b=bLShwwE2NNGgKecTuPnOEQwa/JauHpEAfqfy2ZM1Qkjybrhf7KA6DZ1eciByTBzc34
 uXddZ2OaEUUJfFfQowlOBZ8yju2NoronQ6HbS0zQFcFfrpsx+Qo/yLFH6ilPTxvXuOD6
 I/iCo8CdZpsPr+pdTPIT77rmC72aZCg3WlCTLAfZN+z9mA350isfWQe3imjRjP3+p4We
 4FBk6ucOLUKHAdZyeVh8N2+TEp298+MJrMRQ2t4sgUnAbgqtA1Jt3/ts+eeQblhc2mDK
 7SmPEbZKdYv0XO22UNG+PKwS3MmYPG9DfmOP+Ilv0x3mrDJ+yvdp4Gulv3DZW4izpBm4
 zcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=24QvwXRXNZBG8P5bI9Ru0zkrD3yT3FL6QtFP4Z/IiLg=;
 b=cu1r/fuahmCawvz3mTTGO4ZO1Ii/bcNJ7qnmO/oehh72oCufhs4nGfgcVfAoLfZbVE
 3fUfubRESHcQwWi8wUlbUvj34HvNsGwh1wBjtLYMhXu+291GWOqEiI5WdF2+/A0fWBiN
 SnXcnzvnC1CTVD9R5o/Y2uYmEZbp7UQRbKPOEhxNpzaEebQWl5b44hHJ+6cpNalK2L+4
 JoF1wzQ2tQmCZr5BcEC6zynodZ1kui57Hmxa2mdNV5fDhWi5egYs0BHixua4Llm4b+9P
 XWfK8KTBfAJO5cKJKpxPaeLs5gtONFdIFiircDaHQYSHYU9uKMgzIy6OrChUguwquf/I
 8J0w==
X-Gm-Message-State: AOAM532LLMi54nCHx3znvR/9Nh5phcXJ42fpO4EGkecCG0m2b98zEqU2
 3AFQn2+nRVdyhm7uL11a5enjMQ==
X-Google-Smtp-Source: ABdhPJxm0K26B9PRpTF/GyU9+eLdOkYWg6nG0DU3mf7ffrr63yrtk8DEOp/feUcRNxXbo7S4Ki2ZtQ==
X-Received: by 2002:a05:6000:10c5:: with SMTP id
 b5mr4148284wrx.347.1615892316414; 
 Tue, 16 Mar 2021 03:58:36 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id t8sm21465956wrr.10.2021.03.16.03.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 03:58:35 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 0/7] ASoC: codecs: add wcd938x support
Date: Tue, 16 Mar 2021 10:58:21 +0000
Message-Id: <20210316105828.16436-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
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

This patchset adds support for Qualcomm WCD938X codec.

Qualcomm WCD9380/WCD9385 Codec is a standalone Hi-Fi audio codec IC
connected over SoundWire. This device has two SoundWire devices, RX and
TX respectively supporting 4 x ADCs, ClassH, Ear, Aux PA, 2xHPH,
7 x TX diff inputs, 8 DMICs and MBHC.

Even though this device has two SoundWire devices, only tx device has
access to main codec Control/Status Registers!

This patchset along with other SoundWire patches on the list
have been tested on SM8250 MTP device.

Am planning to send support for MBHC once this driver gets accepted!

Thanks,
srini

Many thanks for reviewing v1.

Changes since v1:
	- updated PA gain to a proper TLV control
	- move various if else checks to switch case.
	- return error on check failure rather than fallback to default
	- cleaned up micbias pull up control
	- fixed all the gain tlvs correctly
	- update dt-bindings to use microvolt for button thresholds
	- removed unnecessary debug at various places.

Srinivas Kandagatla (7):
  ASoC: dt-bindings: wcd938x: add bindings for wcd938x
  ASoC: codecs: wcd-clsh: add new version support
  ASoC: codecs: wcd938x: add basic driver
  ASoC: codecs: wcd938x: add basic controls
  ASoC: codecs: wcd938x: add playback dapm widgets
  ASoC: codecs: wcd938x: add capture dapm widgets
  ASoC: codecs: wcd938x: add audio routing

 .../bindings/sound/qcom,wcd938x.yaml          |  127 +
 sound/soc/codecs/Kconfig                      |    9 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wcd-clsh-v2.c                |  350 +-
 sound/soc/codecs/wcd-clsh-v2.h                |   16 +
 sound/soc/codecs/wcd938x-sdw.c                |  291 ++
 sound/soc/codecs/wcd938x.c                    | 3623 +++++++++++++++++
 sound/soc/codecs/wcd938x.h                    |  676 +++
 8 files changed, 5084 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
 create mode 100644 sound/soc/codecs/wcd938x-sdw.c
 create mode 100644 sound/soc/codecs/wcd938x.c
 create mode 100644 sound/soc/codecs/wcd938x.h

-- 
2.21.0

