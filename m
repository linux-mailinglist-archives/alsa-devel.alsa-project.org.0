Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF3840C61F
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 15:17:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9243181D;
	Wed, 15 Sep 2021 15:16:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9243181D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631711834;
	bh=vSC5l9KMn5+jb5vIfvWpeW8cmHAmENfcm8sK3TdtLb0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aCmkoX92cDFCddIoed3B8K5m93g9ZVf+jGDlYIzJI87NVuPyMb3cYr9hA+q+KF37u
	 QPQhfiEPQrMr6vwC4naU5Gf/Z+MNwmmdJxjE3+q/mOoXEYWxneY70G8rMKX5gUAxpn
	 fa9SX9fuWn3bk0sTy+Z+pwwEVmC8GEYO038rKN1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4678F804FE;
	Wed, 15 Sep 2021 15:15:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5644FF804E7; Wed, 15 Sep 2021 15:14:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88D2DF802E8
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 15:14:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88D2DF802E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="TwJpe6YI"
Received: by mail-wr1-x42a.google.com with SMTP id w29so3830984wra.8
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 06:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3I5WVqhybzrDntm7Ex3qvavWLqRVKe0ZUwzuB4PEAxU=;
 b=TwJpe6YIZmg1lygL40J5doEWXABYyq+U9te5sX4AWdIlNgtYrSxnXyWKQ4iqWqBHhz
 OQp68BrrDqDLfKnYvA9ZktVFeApDZTCyqj+dGxzTXlQSkwJTXldTJkWkcA3m0jPRvjHL
 GEFTk4O5qXP/VtDhIo6tStdBBQcbrUYZjNV1V2OqAqZ/bU+V6OFNNJGCH+VOchEXEXbl
 fCJZUZ2xApq7FkZfUogL0+PuJsgevjB8OTwAUIDLE8gCuID5r7snjqtuioIAHhCh5lYo
 ddnS4p68gbGv11kL+DaTqmvhU5K6pvPpUL19+UIg8QMhk0oAe5aU9bq0FIG5IXX2cRd2
 vPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3I5WVqhybzrDntm7Ex3qvavWLqRVKe0ZUwzuB4PEAxU=;
 b=js7VPp6jbfcQO8f098dl6xrPV5d9V6KUf+WORHPego7jdzmkQMiG0wDUTVm1fyKpVY
 kmKMryyKC/cYM657ctTHTnXkn+/O9FIk5QT04atzXLZsthYwyWPm6Pku7WHYDM2+hwRU
 GlH7P5mFABMwlXrQGr05evfoCf3ryYL7/pYNZ/Qy97Bm8QpbOsQ7n7zBDftdsC4bRolV
 CXQYBw+DHGu7rr6yNywg+zHEG+8EuYrsZUy5IX06xie6tCXfR7tclzM71+aA3fQQDOwa
 YJ1NE7UJ0XBzbflc8+wW+jOZrNdhEKKnBiypLWG5taMdFHliNLeI62z9dWBhVR2USmBp
 xEjQ==
X-Gm-Message-State: AOAM532XbcalkdPKfUROvLwp9kY0Ar+Q8VO6zp7IUa3jln6rmxkkloV7
 oxeL53+jAKd/YaovDOzcV109tw==
X-Google-Smtp-Source: ABdhPJxJQdK+llvbJ3yOzTvuolZqN8z2XxXncflY0I9Q0yNtuLrUHR64ZgPQWJJo/soiG5oO5geAWA==
X-Received: by 2002:adf:c550:: with SMTP id s16mr5136782wrf.25.1631711677225; 
 Wed, 15 Sep 2021 06:14:37 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id m29sm14501717wrb.89.2021.09.15.06.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 06:14:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v6 00/22] ASoC: qcom: Add AudioReach support
Date: Wed, 15 Sep 2021 14:13:11 +0100
Message-Id: <20210915131333.19047-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, tiwai@suse.de,
 plai@codeaurora.org, pierre-louis.bossart@linux.intel.com
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

Many thanks for reviewing v5. This version addresses all the comments
raised as part of v5 review.

This patchset adds ASoC driver support to configure signal processing
framework ("AudioReach") which is integral part of Qualcomm next
generation audio SDK and will be deployed on upcoming Qualcomm chipsets.
It makes use of ASoC Topology to load graphs on to the DSP which is then
managed by APM (Audio Processing Manager) service to prepare/start/stop.

Here is simplified high-level block diagram of AudioReach:

 ___________________________________________________________
|                 CPU (Application Processor)               |
|  +---------+          +---------+         +----------+    |
|  |  q6apm  |          |  q6apm  |         |  q6apm   |    |
|  |   dais  | <------> |         | <-----> |lpass-dais|    |
|  +---------+          +---------+         +----------+    |
|                            ^  ^                           |
|                            |  |           +---------+     |
|  +---------+               v  +---------->|topology |     |
|  | q6prm   |          +---------+         |         |     |
|  |         |<-------->|   GPR   |         +---------+     |
|  +---------+          +---------+                         |
|       ^                    ^                              |
|       |                    |                              |
|  +----------+              |                              |
|  |   q6prm  |              |                              |
|  |lpass-clks|              |                              |
|  +----------+              |                              |
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
and Qualcomm AudioReach DSP headers are available at:
https://source.codeaurora.org/quic/la/platform/vendor/opensource/arspf-headers

Note: There is one false positive warning in this patchset:
audioreach.c:80:45: warning: array of flexible structures

Thanks,
srini

Changes since v5:
- moved usage zero length arrays to flexible arrays as suggested by Pierre.
- updated dt-bindings as suggested by Rob.
- Fixed various style issues and typos, spotted by Pierre
- Replaced usage of spinlock with mutex, as we are mostly dealing with workqueues.
- Fixed memory leak in two places spotted by Pierre.
- added pga module gain setup into dapm event.
- Updated Kconfig with correct ordering.
- Fixed build warning for non OF cases.
- Added more comments as suggested by Pierre

Srinivas Kandagatla (22):
  soc: dt-bindings: qcom: apr: convert to yaml
  soc: dt-bindings: qcom: apr: deprecate qcom,apr-domain property
  soc: qcom: apr: make code more reuseable
  soc: dt-bindings: qcom: add gpr bindings
  soc: qcom: apr: Add GPR support
  ASoC: dt-bindings: move LPASS dai related bindings out of q6afe
  ASoC: dt-bindings: move LPASS clocks related bindings out of q6afe
  ASoC: dt-bindings: rename q6afe.h to q6dsp-lpass-ports.h
  ASoC: qdsp6: q6afe-dai: move lpass audio ports to common file
  ASoC: qdsp6: q6afe-clocks: move audio-clocks to common file
  ASoC: dt-bindings: q6dsp: add q6apm-lpass-dai compatible
  ASoC: dt-bindings: lpass-clocks: add q6prm clocks compatible
  ASoC: dt-bindings: add q6apm digital audio stream bindings
  ASoC: qdsp6: audioreach: add basic pkt alloc support
  ASoC: qdsp6: audioreach: add q6apm support
  ASoC: qdsp6: audioreach: add module configuration command helpers
  ASoC: qdsp6: audioreach: add Kconfig and Makefile
  ASoC: qdsp6: audioreach: add topology support
  ASoC: qdsp6: audioreach: add q6apm-dai support
  ASoC: qdsp6: audioreach: add q6apm lpass dai support
  ASoC: qdsp6: audioreach: add q6prm support
  ASoC: qdsp6: audioreach: add support for q6prm-clocks

 .../devicetree/bindings/soc/qcom/qcom,apr.txt |  134 --
 .../bindings/soc/qcom/qcom,apr.yaml           |  177 +++
 .../devicetree/bindings/sound/qcom,q6afe.txt  |  181 ---
 .../bindings/sound/qcom,q6apm-dai.yaml        |   53 +
 .../sound/qcom,q6dsp-lpass-clocks.yaml        |   77 ++
 .../sound/qcom,q6dsp-lpass-ports.yaml         |  205 +++
 drivers/soc/qcom/Kconfig                      |    2 +-
 drivers/soc/qcom/apr.c                        |  289 ++++-
 include/dt-bindings/soc/qcom,gpr.h            |   19 +
 include/dt-bindings/sound/qcom,q6afe.h        |  203 +--
 .../sound/qcom,q6dsp-lpass-ports.h            |  208 +++
 include/linux/soc/qcom/apr.h                  |   70 +-
 include/uapi/sound/snd_ar_tokens.h            |  208 +++
 sound/soc/qcom/Kconfig                        |   22 +
 sound/soc/qcom/qdsp6/Makefile                 |   11 +-
 sound/soc/qcom/qdsp6/audioreach.c             | 1140 +++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h             |  726 +++++++++++
 sound/soc/qcom/qdsp6/q6afe-clocks.c           |  187 +--
 sound/soc/qcom/qdsp6/q6afe-dai.c              |  687 +---------
 sound/soc/qcom/qdsp6/q6apm-dai.c              |  415 ++++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       |  260 ++++
 sound/soc/qcom/qdsp6/q6apm.c                  |  836 ++++++++++++
 sound/soc/qcom/qdsp6/q6apm.h                  |  152 +++
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c     |  186 +++
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.h     |   30 +
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      |  627 +++++++++
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.h      |   22 +
 sound/soc/qcom/qdsp6/q6prm-clocks.c           |   85 ++
 sound/soc/qcom/qdsp6/q6prm.c                  |  202 +++
 sound/soc/qcom/qdsp6/q6prm.h                  |   78 ++
 sound/soc/qcom/qdsp6/topology.c               | 1119 ++++++++++++++++
 31 files changed, 7196 insertions(+), 1415 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
 create mode 100644 include/dt-bindings/soc/qcom,gpr.h
 create mode 100644 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
 create mode 100644 include/uapi/sound/snd_ar_tokens.h
 create mode 100644 sound/soc/qcom/qdsp6/audioreach.c
 create mode 100644 sound/soc/qcom/qdsp6/audioreach.h
 create mode 100644 sound/soc/qcom/qdsp6/q6apm-dai.c
 create mode 100644 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
 create mode 100644 sound/soc/qcom/qdsp6/q6apm.c
 create mode 100644 sound/soc/qcom/qdsp6/q6apm.h
 create mode 100644 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
 create mode 100644 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.h
 create mode 100644 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
 create mode 100644 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.h
 create mode 100644 sound/soc/qcom/qdsp6/q6prm-clocks.c
 create mode 100644 sound/soc/qcom/qdsp6/q6prm.c
 create mode 100644 sound/soc/qcom/qdsp6/q6prm.h
 create mode 100644 sound/soc/qcom/qdsp6/topology.c

-- 
2.21.0

