Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 128383FFF12
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 13:23:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ADFD1825;
	Fri,  3 Sep 2021 13:22:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ADFD1825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630668204;
	bh=44aoSWCoXXlp1ad0inKls+dOOE4I/o2Kz/DYwEITAB0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aWrs/PFrOofymUuJ2aC7mbymqVxq2qIMFoGtfNhi4XQpESQn/xXhhLs9JqSUR0br3
	 FOyQGR4XzoyJ5JYHjoX62CITFp/BB5FJyfAffOzOvVsEx2rdDFtRcjVFT53+7eWrkt
	 4LpxCO+7x8Z0MQYCKsYccw1DoXTNpREaY1hQIRZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA581F804E3;
	Fri,  3 Sep 2021 13:21:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EA6FF8032B; Fri,  3 Sep 2021 13:21:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 391F9F80088
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 13:21:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 391F9F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="yVeoksPl"
Received: by mail-wr1-x42f.google.com with SMTP id z4so7726264wrr.6
 for <alsa-devel@alsa-project.org>; Fri, 03 Sep 2021 04:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rhw/D3IqBN1hsJk+EJlULPqW12y1oz+eUkv320uK0aw=;
 b=yVeoksPlImr5oQjW+RkW7IZ0rCFXQyMt3hePw1UlG5xZRAbjI/ieHdc3gGVsUhI5SQ
 FMJmreyq1ZpYHwVFvK4Hf6SRu1+SM5VRVuxnrO7SdabrEiQT2CoSUW4A75Lp2vW570ws
 bW1Vfnil7+24r1VMVuRa30E4JOhNrIqw4M2P2GOcIMpUvisb8MvHdO0vRdroiAvpD9mn
 8JWWAixlddUJoJzB23+bBi7mN+1Gu6dOJIG6JvR7APCR3N3PNDxBCqGd4cD5JfTx8aEa
 Q6pxaXEZSOy8ORt4dbB07VYAWDUIdD2BPaWZbNyjUjPTDT74P04lDmYCJn/I48znVelj
 VHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rhw/D3IqBN1hsJk+EJlULPqW12y1oz+eUkv320uK0aw=;
 b=jrVCCEQtRW+Oe1jTYglf1Gc1ngmUwI8/FbWOcph4ii0alS+W3n04xI7X4KRDmvu1db
 mQzrx5xilmwvarbkRo+bQQWrkYzCDD5LJ4gAzlqtUtIjis7nciyqi4uw+RcpYKa6h4sZ
 tvECOfU9pyohcmCmcIYJGdf7PaRVnY6Zl6HedOFr3lKANqiEWqsLuo/yhybK5x7qQKQf
 ltasQU3gNi4mJU51B8rRwXJl/1/f0k3Gu1raJy+lKXVccZ/5pYOgnWzH+rgA0LlBvmxq
 UmGg0LqCs7nMOGKn3O3gM78Hun0peR66Uubaji63nLp0yxdOnQPcSQIZaHEb9CsCq5G+
 26mg==
X-Gm-Message-State: AOAM530SwHSlQT6xN7aDYUzFmnOu99bSYMLH7D5XIvaqSGKqX1ON/bWE
 Zf041p1WRMPcRNZBIlMhv4HONg==
X-Google-Smtp-Source: ABdhPJw8byIkNH9xbGBB3HhDeWPSKKLwf2pupEZkM+etfXOrgVgMjfTwEGMwtgtqS8VakiREpPUQiw==
X-Received: by 2002:adf:82b1:: with SMTP id 46mr3399951wrc.217.1630668090918; 
 Fri, 03 Sep 2021 04:21:30 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id f20sm3881877wmb.32.2021.09.03.04.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:21:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v5 00/21] ASoC: qcom: Add AudioReach support
Date: Fri,  3 Sep 2021 12:20:11 +0100
Message-Id: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
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

Many thanks for reviewing v4. This version addresses all the comments
raised as part of v4 review.

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

Thanks,
srini

Changes since v4: only apr dt-binding changes.
- deprecated qcom,apr-domain dt-bindings to make it more reusable
- added more protection-domain list that have been missed during yaml conversion.
- remove "qcom,apr" compatible that was added by mistake during yaml conversion.

Srinivas Kandagatla (21):
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
  ASoC: qdsp6: audioreach: add topology support
  ASoC: qdsp6: audioreach: add q6apm-dai support
  ASoC: qdsp6: audioreach: add q6apm lpass dai support
  ASoC: qdsp6: audioreach: add q6prm support
  ASoC: qdsp6: audioreach: add support for q6prm-clocks

 .../devicetree/bindings/soc/qcom/qcom,apr.txt |  134 --
 .../bindings/soc/qcom/qcom,apr.yaml           |  169 +++
 .../devicetree/bindings/sound/qcom,q6afe.txt  |  181 ---
 .../bindings/sound/qcom,q6apm-dai.yaml        |   50 +
 .../sound/qcom,q6dsp-lpass-clocks.yaml        |   74 ++
 .../sound/qcom,q6dsp-lpass-ports.yaml         |  202 +++
 drivers/soc/qcom/Kconfig                      |    8 +
 drivers/soc/qcom/apr.c                        |  289 +++-
 include/dt-bindings/soc/qcom,gpr.h            |   18 +
 include/dt-bindings/sound/qcom,q6afe.h        |  203 +--
 .../sound/qcom,q6dsp-lpass-ports.h            |  208 +++
 include/linux/soc/qcom/apr.h                  |   70 +-
 include/uapi/sound/snd_ar_tokens.h            |  203 +++
 sound/soc/qcom/Kconfig                        |   22 +
 sound/soc/qcom/qdsp6/Makefile                 |   11 +-
 sound/soc/qcom/qdsp6/audioreach.c             | 1170 +++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h             |  692 ++++++++++
 sound/soc/qcom/qdsp6/q6afe-clocks.c           |  187 +--
 sound/soc/qcom/qdsp6/q6afe-dai.c              |  687 +---------
 sound/soc/qcom/qdsp6/q6apm-dai.c              |  504 +++++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       |  266 ++++
 sound/soc/qcom/qdsp6/q6apm.c                  |  916 +++++++++++++
 sound/soc/qcom/qdsp6/q6apm.h                  |  154 +++
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c     |  186 +++
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.h     |   30 +
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      |  627 +++++++++
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.h      |   22 +
 sound/soc/qcom/qdsp6/q6prm-clocks.c           |   85 ++
 sound/soc/qcom/qdsp6/q6prm.c                  |  256 ++++
 sound/soc/qcom/qdsp6/q6prm.h                  |   78 ++
 sound/soc/qcom/qdsp6/topology.c               | 1118 ++++++++++++++++
 31 files changed, 7406 insertions(+), 1414 deletions(-)
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

