Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB5B3C87A9
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 17:32:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B2891690;
	Wed, 14 Jul 2021 17:31:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B2891690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626276750;
	bh=b1+HBVmL7dYa1uwYdYu4J84Z9v63hdDSz3P0bjnyfFk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XRDw8rAmw8xCS1p4zqMjscpuYf159vezql4pRa+1kj5dM6ZBRL+SU1zGeU33D8WoB
	 udQhfi7e1OSMiTLNwB/+6SsK1ypInkBXsyW0exGmKEUNTWuC3ZigzjsDJoSXIZjS/m
	 DLmZUqtSWcxhicOz/+yfLYLDmWKqjrOQX4mYM6dA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B7B5F8026D;
	Wed, 14 Jul 2021 17:31:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59021F8026D; Wed, 14 Jul 2021 17:31:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71EA5F800D3
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 17:30:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71EA5F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="iz3m3LhP"
Received: by mail-wr1-x435.google.com with SMTP id d2so3810971wrn.0
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 08:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uOmwEo5oUejr01qAQWMT2LxoWt7+2pJPvIbe1Gy7yOc=;
 b=iz3m3LhPwfhlqRbvBVl+FtHrRkQrfCOvyd/ITsmXwpyBTnkYtvjZ1bUHrsOXBwPKPx
 jvkmAHUwJy7nBtsvi3ZNu6cyFwHLukv0rHvRw/NOK4H/UJtCTJeRwGOFYi/f/MSeYzB0
 XUTYZ5/ww0P+VQ0ETiSiDnb3BLdNxBZ+WZuWYYaNnXLm3n5ixOOBHpmEU1vi6My/kY0W
 yrMVhoN2GIHBRd0C6mUFBTxsVmV/mV/MlvZbHed8xpWan9V7JrpvahZOS4qQHPelPqlv
 6RlfXIaTy8JZNaJtkHoqoIulHijJbJGr5x/h57DIyWj6JXnE1M2Z7JsucHw7r/0ITxF1
 1YdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uOmwEo5oUejr01qAQWMT2LxoWt7+2pJPvIbe1Gy7yOc=;
 b=Cxf5vLd+XysnKDRTRyIQDOBKtRqaaAlESOB9uDhzulDf8DYQ2q98ljxwi3rrSkz0Sg
 jcn7W//RduI2iQIZBbVkmM+vqp1YHpEs1882t2Tbr2z7Un4NpJQ/hhkwSsBhXlfLIv4J
 07TER0U8mycBrhBE5WgWVSxJovpHVlbKPsVM2TKMs8LLRPfzh1zClnVGY1eCW2HRxJga
 MWxirXDERQUShY9l70hb04hkEadrx5QYinaBqGNZN3+/+WbAkhp4TZpgFcBZF7d8h/BL
 kARZz0ib/mjh/OIo3mNTB526DpBosRJY/2KCf6dBE1rPRRan+JgoNTnnJ3NJnhQUc+0N
 oXfA==
X-Gm-Message-State: AOAM530i9TKR/bkvIejsSnIQL1ApzQiMrAgXG46g3ujIFmaiD2rPoOSA
 DoyHP0Ctv3jS0e2QtAOjxo/zTA==
X-Google-Smtp-Source: ABdhPJwoazfakKvKUpbSEshE1+1zVuY3kIecRJZhAmC7LiZvjwgBphdFM7WaAEOPCQ/eGIV8qpWgtA==
X-Received: by 2002:a5d:4392:: with SMTP id i18mr13725569wrq.231.1626276654138; 
 Wed, 14 Jul 2021 08:30:54 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id y6sm2465174wma.48.2021.07.14.08.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:30:53 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v2 00/16] ASoC: qcom: Add AudioReach support
Date: Wed, 14 Jul 2021 16:30:23 +0100
Message-Id: <20210714153039.28373-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, tiwai@suse.de,
 plai@codeaurora.org, linux-kernel@vger.kernel.org
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

This patchset adds ASoC driver support to configure signal processing
framework ("AudioReach") which is integral part of Qualcomm next
generation audio SDK and will be deployed on upcoming Qualcomm chipsets.
It makes use of ASoC Topology to load graphs on to the DSP which is then
managed by APM (Audio Processing Manager) service to prepare/start/stop.

Here is simpified high-level block diagram of AudioReach:

 ___________________________________________________________
|                 CPU (Application Processor)               |
|  +---------+          +---------+         +---------+     |
|  |  q6apm  |          |  q6apm  |         | q6afe   |     |
|  |   dais  | <------> |         | <-----> | bedais  |     |
|  +---------+          +---------+         +---------+     |
|                            ^  ^                           |
|                            |  |           +---------+     |
|  +---------+               v  +---------->|topology |     |
|  | q6prm   |          +---------+         |         |     |
|  |         |<-------->|   GPR   |         +---------+     |
|  +---------+          +---------+                         |
|                            ^                              |
|____________________________|______________________________|
                             |  
                             | RPMSG (IPC over GLINK)              
 ____________________________|______________________________
|                            |                              |
|    +-----------------------+                              |
|    |                       |                              |
|    v                       v              q6 (Audio DSP)  |
|+-----+    +----------------------------------+            |
|| PRM |    | APM (Audio Processing Manager)   |            |
|+-----+    |  . Graph Management              |            |  
|           |  . Command Handing               |            |  
|           |  . Event Management              |            |  
|           |  ...                             |            |  
|           +----------------------------------+            |  
|                            ^                              |
|____________________________|______________________________|
                             |  
                             |   LPASS AIF
 ____________________________|______________________________
|                            |            Audio I/O         |
|                            v                              |
|   +--------------------------------------------------+    |
|    |                Audio devices                     |   |
|    | CODEC | HDMI-TX | PCM  | SLIMBUS | I2S |MI2S |...|   |
|    |                                                  |   |
|    +--------------------------------------------------+   |
|___________________________________________________________|

AudioReach has constructs of sub-graph, container and modules.
Each sub-graph can have N containers and each Container can have N Modules
and connections between them can be linear or non-linear.
An audio function can be realized with one or many connected
sub-graphs. There are also control/event paths between modules that can
be wired up while building graph to achieve various control mechanism
between modules. These concepts of Sub-Graph, Containers and Modules
are represented in ASoC topology.

Here is simple I2S graph with a Write Shared Memory and a
Volume control module within a single Subgraph (1) with one Container (1)
and 5 modules.

  ____________________________________________________________
 |                        Sub-Graph [1]                       |
 |  _______________________________________________________   |
 | |                       Container [1]                   |  |
 | | [WR_SH] -> [PCM DEC] -> [PCM CONV] -> [VOL]-> [I2S-EP]|  |
 | |_______________________________________________________|  |
 |____________________________________________________________|

For now this graph is split into two subgraphs to achieve dpcm like below:
 ________________________________________________    _________________
|                Sub-Graph [1]                   |  |  Sub-Graph [2]  |
|  ____________________________________________  |  |  _____________  |
| |              Container [1]                 | |  | |Container [2]| |
| | [WR_SH] -> [PCM DEC] -> [PCM CONV] -> [VOL]| |  | |   [I2S-EP]  | |
| |____________________________________________| |  | |_____________| |
|________________________________________________|  |_________________|

                                                      _________________
                                                    |  Sub-Graph [3]  |
                                                    |  _____________  |
                                                    | |Container [3]| |
                                                    | |  [DMA-EP]   | |
                                                    | |_____________| |
                                                    |_________________|


This patchset adds very minimal support for AudioReach which includes
supporting sub-graphs containing CODEC DMA ports and simple PCM
Decoder/Encoder and Logger Modules. Additional capabilities will
be built over time to expose features offered by AudioReach. 

This patchset is Tested on SM8250 SoC based Qualcomm Robotics Platform RB5
and SM9250 MTP with WSA881X Smart Speaker Amplifiers, DMICs connected via
VA Macro and WCD938x Codec connected via TX and RX Macro.

Sample WIP ASoC graphs are available at 
https://git.linaro.org/people/srinivas.kandagatla/audioreach-topology.git/

Thanks,
srini

Changes since RFC:
	- moved GPR support into APR driver to avoid code duplication.
	- Fixed various dt-bindings-check warnings and errors.
	- Moved include/dt-bindings headers to dt-bindings patch.
	- added PGA widget support
	- Fixed few ordering issues while testing with ASoC Topology 2.0
	- Removed duplicate defines in various headers

Srinivas Kandagatla (16):
  soc: dt-bindings: qcom: add gpr bindings
  soc: qcom: apr: make code more reuseable
  soc: qcom: apr: Add GPR support
  ASoC: qcom: dt-bindings: add bindings Audio Processing manager
  ASoC: qcom: audioreach: add basic pkt alloc support
  ASoC: qcom: audioreach: add q6apm support
  ASoC: qcom: audioreach: add module configuration command helpers
  ASoC: qcom: audioreach: add topology support
  ASoC: qcom: audioreach: add q6apm-dai support
  ASoC: qcom: audioreach: add bedai support
  ASoC: qcom: dt-bindings: add bindings for Proxy Resource Manager
  ASoC: qcom: audioreach: add q6prm support
  ASoC: qcom: dt-bindings: add audioreach soundcard compatibles
  ASoC: qcom: audioreach: add volume ctrl module support
  ASoC: qcom: audioreach: topology add dapm pga support
  ASoC: qcom: sm8250: Add audioreach support

 .../bindings/soc/qcom/qcom,gpr.yaml           |   83 ++
 .../devicetree/bindings/sound/qcom,q6apm.yaml |   87 ++
 .../devicetree/bindings/sound/qcom,q6prm.yaml |   43 +
 .../bindings/sound/qcom,sm8250.yaml           |   43 +
 drivers/soc/qcom/Kconfig                      |    8 +
 drivers/soc/qcom/apr.c                        |  270 +++-
 include/dt-bindings/soc/qcom,gpr.h            |   18 +
 include/dt-bindings/sound/qcom,q6apm.h        |    8 +
 include/linux/soc/qcom/apr.h                  |   69 +-
 include/uapi/sound/snd_ar_tokens.h            |  198 +++
 sound/soc/qcom/Kconfig                        |   19 +
 sound/soc/qcom/Makefile                       |    1 +
 sound/soc/qcom/audioreach/Makefile            |   12 +
 sound/soc/qcom/audioreach/audioreach.c        | 1162 +++++++++++++++++
 sound/soc/qcom/audioreach/audioreach.h        |  676 ++++++++++
 sound/soc/qcom/audioreach/q6apm-bedai.c       |  323 +++++
 sound/soc/qcom/audioreach/q6apm-dai.c         |  494 +++++++
 sound/soc/qcom/audioreach/q6apm.c             |  963 ++++++++++++++
 sound/soc/qcom/audioreach/q6apm.h             |  174 +++
 sound/soc/qcom/audioreach/q6prm.c             |  414 ++++++
 sound/soc/qcom/audioreach/topology.c          | 1075 +++++++++++++++
 sound/soc/qcom/sm8250.c                       |  144 +-
 22 files changed, 6236 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,gpr.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6prm.yaml
 create mode 100644 include/dt-bindings/soc/qcom,gpr.h
 create mode 100644 include/dt-bindings/sound/qcom,q6apm.h
 create mode 100644 include/uapi/sound/snd_ar_tokens.h
 create mode 100644 sound/soc/qcom/audioreach/Makefile
 create mode 100644 sound/soc/qcom/audioreach/audioreach.c
 create mode 100644 sound/soc/qcom/audioreach/audioreach.h
 create mode 100644 sound/soc/qcom/audioreach/q6apm-bedai.c
 create mode 100644 sound/soc/qcom/audioreach/q6apm-dai.c
 create mode 100644 sound/soc/qcom/audioreach/q6apm.c
 create mode 100644 sound/soc/qcom/audioreach/q6apm.h
 create mode 100644 sound/soc/qcom/audioreach/q6prm.c
 create mode 100644 sound/soc/qcom/audioreach/topology.c

-- 
2.21.0

