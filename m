Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5633DEE61
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 14:56:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B45F31788;
	Tue,  3 Aug 2021 14:55:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B45F31788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627995375;
	bh=/s/9iyFsck9zpeWnzKhtADAEWgG5tQCpS7eUiEnDWk8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CtQgdzJROQjEAOg8QU0G5C+doeaZ0e9w2hMZ3NfsrVKLLh7R0OpcLKeUGRt9buItg
	 ZTyshsQDZ/UowygqrOYUM8utAwMqMl4P1qks1EV7cgucyS8UnKdxQ6fzRuOOaaj/xu
	 w5kI4DKtZFbgQA9n0XEIJsZN8h77piXabOnr9VK4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94A2CF804E1;
	Tue,  3 Aug 2021 14:54:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C5C6F8049E; Tue,  3 Aug 2021 14:54:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D859F8014D
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 14:54:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D859F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Og4VzbMA"
Received: by mail-wm1-x32d.google.com with SMTP id m19so12438661wms.0
 for <alsa-devel@alsa-project.org>; Tue, 03 Aug 2021 05:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FCtLQeeJo5vz5G7q/2CYCwWTh0jW/eYamttlC6/2vZU=;
 b=Og4VzbMAkKB8ggjQzBC+97EL6tXAYR4zpS5jAVKb5FZabiB+JQ+GRsrk1fES2ARAwo
 B57oWFoW/awCcuxOLJQ3ifLKewJrfZhwL6IH18z5fJJAT3/c8zbVbU09FHQSV8yqLOWw
 wtcU1DYZPIKX/Pc/5KMM4yeCMyNItpiX3XrIhXxm4mByOcF5YSPuU23WBo0UNPnv7Pu8
 OR8umgHUsl/y9SPostNFBVbO77pC94Mmq604TWOJbPu+kqcvkpilYsBadWS2uXRwPLsM
 ZG09OnWEIVg+DS829RStAtFvyGhXwx+oLeKmK+nRaAwHh5oEKyqbo4sJyeHmGGgMFck4
 O6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FCtLQeeJo5vz5G7q/2CYCwWTh0jW/eYamttlC6/2vZU=;
 b=l7ErOEYliSXMIoGwytVriSLhlNmNJi5wD6tQd5T1fx4kvi55zF4Hmw8iBeZtrd3JlI
 z+VDInTVTBC+STcuLgxU8a3mMkdavcOBhCJeIZ0jWt6neO7Ped7JqLz4xokyEmEGvK/2
 juGZ4JmOgCGey/+L3o/u/zF4t0Ro326FY++JG5tbyAfULTtxg7s9CJeg4+/8bS8TCr5J
 3GRaV8Mg9hH0N8MVnRG6TmZqtNgWkQHBZdFvgIglHlNc4cdrS9T73lUhigXjR0wvdwC+
 wGStzNO8UJwB6L5gnApKvQUlOp9HVMCpszYnmrxx+HrLpa1isUOq8zWnjQQhtxE49Vc1
 rnYw==
X-Gm-Message-State: AOAM532xlnqX/yA/AwhS4qX5bLK8B1RpQ3ojCvr/l9mKmNyz+bYXtQE2
 sc/UppjBzu783aXG5jcVvgFZ4Q==
X-Google-Smtp-Source: ABdhPJwGo5WY0i1POU/NubkQN9lJFxHvxoviFMWma95Et2q4zZ6k3WfYCnGhWgBQTrp5c+NweE6W5g==
X-Received: by 2002:a1c:4b0a:: with SMTP id y10mr21328386wma.111.1627995263297; 
 Tue, 03 Aug 2021 05:54:23 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h14sm14695574wrp.55.2021.08.03.05.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 05:54:22 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v3 00/20] ASoC: qcom: Add AudioReach support
Date: Tue,  3 Aug 2021 13:53:51 +0100
Message-Id: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com
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
|  |  q6apm  |          |  q6apm  |         | q6apm   |     |
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
VA Macro and WCD938x Codec connected via TX and RX Macro and HDMI audio
via I2S.

First 10 Patches are mostly reorganization existing Old QDSP Audio
Framework code and bindings so that we could reuse them on AudioReach.

ASoC topology graphs for DragonBoard RB5 and SM8250 MTP are available at 
https://git.linaro.org/people/srinivas.kandagatla/audioreach-topology.git/

Thanks,
srini

Changes since v2:
- seperated dsp lpass ip specific bindings out of dsp bindings
- seperated audio ports and clocks code out of Q6AFE
- fixed various cppcheck warnings.
- Reuse existing code and most of the hardware specific bits
 from old drivers
- added i2s module support
- Addressed most of the comments from Pierre.
- converted most of the existing bindings to yaml format.

Srinivas Kandagatla (20):
  soc: dt-bindings: qcom: apr: convert to yaml
  soc: qcom: apr: make code more reuseable
  soc: dt-bindings: qcom: add gpr bindings
  soc: qcom: apr: Add GPR support
  ASoC: dt-bindings: replace q6afe bindings with q6dsp-audio-ports
  ASoC: dt-bindings: replace q6afe-clk with q6dsp audio clk bindings
  ASoC: dt-bindings: replace q6asm with q6dsp audio stream bindings
  ASoC: qdsp6: q6afe-dai: move lpass audio ports to common file
  ASoC: qdsp6: q6afe-clocks: move audio-clocks to common file
  ASoC: dt-bindings: q6dsp: add q6apm-dai compatible
  ASoC: dt-bindings: q6dsp: add q6apm-bedai compatible
  ASoC: dt-bindings: q6dsp-clocks: add q6prm clocks compatible
  ASoC: qdsp6: audioreach: add basic pkt alloc support
  ASoC: qdsp6: audioreach: add q6apm support
  ASoC: qdsp6: audioreach: add module configuration command helpers
  ASoC: qdsp6: audioreach: add topology support
  ASoC: qdsp6: audioreach: add q6apm-dai support
  ASoC: qdsp6: audioreach: add bedai support
  ASoC: qdsp6: audioreach: add q6prm support
  ASoC: qdsp6: audioreach: add support for q6prm-clocks

 .../devicetree/bindings/soc/qcom/qcom,apr.txt |  134 --
 .../bindings/soc/qcom/qcom,apr.yaml           |  209 +++
 .../devicetree/bindings/sound/qcom,q6afe.txt  |  201 ---
 .../devicetree/bindings/sound/qcom,q6asm.txt  |   70 -
 .../sound/qcom,q6dsp-audio-clocks.yaml        |   74 ++
 .../sound/qcom,q6dsp-audio-ports.yaml         |  202 +++
 .../sound/qcom,q6dsp-audio-stream.yaml        |  118 ++
 drivers/soc/qcom/Kconfig                      |    8 +
 drivers/soc/qcom/apr.c                        |  286 +++-
 include/dt-bindings/soc/qcom,gpr.h            |   18 +
 include/dt-bindings/sound/qcom,q6afe.h        |  204 +--
 .../sound/qcom,q6dsp-audio-ports.h            |  208 +++
 include/linux/soc/qcom/apr.h                  |   70 +-
 include/uapi/sound/snd_ar_tokens.h            |  203 +++
 sound/soc/qcom/Kconfig                        |   26 +
 sound/soc/qcom/Makefile                       |    1 +
 sound/soc/qcom/qdsp6/Makefile                 |   19 +-
 sound/soc/qcom/qdsp6/audioreach.c             | 1166 +++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h             |  690 ++++++++++
 sound/soc/qcom/qdsp6/q6afe-clocks.c           |  187 +--
 sound/soc/qcom/qdsp6/q6afe-dai.c              |  687 +---------
 sound/soc/qcom/qdsp6/q6apm-bedai.c            |  266 ++++
 sound/soc/qcom/qdsp6/q6apm-dai.c              |  504 +++++++
 sound/soc/qcom/qdsp6/q6apm.c                  |  919 +++++++++++++
 sound/soc/qcom/qdsp6/q6apm.h                  |  155 +++
 sound/soc/qcom/qdsp6/q6dsp-audio-clocks.c     |  185 +++
 sound/soc/qcom/qdsp6/q6dsp-audio-clocks.h     |   30 +
 sound/soc/qcom/qdsp6/q6dsp-audio-ports.c      |  625 +++++++++
 sound/soc/qcom/qdsp6/q6dsp-audio-ports.h      |   22 +
 sound/soc/qcom/qdsp6/q6prm-clocks.c           |   85 ++
 sound/soc/qcom/qdsp6/q6prm.c                  |  256 ++++
 sound/soc/qcom/qdsp6/q6prm.h                  |   78 ++
 sound/soc/qcom/qdsp6/topology.c               | 1114 ++++++++++++++++
 33 files changed, 7514 insertions(+), 1506 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,q6afe.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm.txt
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6dsp-audio-clocks.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6dsp-audio-ports.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6dsp-audio-stream.yaml
 create mode 100644 include/dt-bindings/soc/qcom,gpr.h
 create mode 100644 include/dt-bindings/sound/qcom,q6dsp-audio-ports.h
 create mode 100644 include/uapi/sound/snd_ar_tokens.h
 create mode 100644 sound/soc/qcom/qdsp6/audioreach.c
 create mode 100644 sound/soc/qcom/qdsp6/audioreach.h
 create mode 100644 sound/soc/qcom/qdsp6/q6apm-bedai.c
 create mode 100644 sound/soc/qcom/qdsp6/q6apm-dai.c
 create mode 100644 sound/soc/qcom/qdsp6/q6apm.c
 create mode 100644 sound/soc/qcom/qdsp6/q6apm.h
 create mode 100644 sound/soc/qcom/qdsp6/q6dsp-audio-clocks.c
 create mode 100644 sound/soc/qcom/qdsp6/q6dsp-audio-clocks.h
 create mode 100644 sound/soc/qcom/qdsp6/q6dsp-audio-ports.c
 create mode 100644 sound/soc/qcom/qdsp6/q6dsp-audio-ports.h
 create mode 100644 sound/soc/qcom/qdsp6/q6prm-clocks.c
 create mode 100644 sound/soc/qcom/qdsp6/q6prm.c
 create mode 100644 sound/soc/qcom/qdsp6/q6prm.h
 create mode 100644 sound/soc/qcom/qdsp6/topology.c

-- 
2.21.0

