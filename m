Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0915D39E085
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 17:32:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 581A91692;
	Mon,  7 Jun 2021 17:31:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 581A91692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623079945;
	bh=tqlPsUUOIHKEEVPiksirtoodebg2WiTJdExh5gICAU8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QL61U+kPV2YtLtWGHapcYLem+sTjxIFqs6bA7EGZshXx+dm7I1mdu0ac+PtWv6NU5
	 K7qD1uW9bLjizrauF33sZTp4VZNP1OkGYkeRJIo8lNRr6kCo8HGIbrQGz83UODWGBp
	 qXRmKKV46kZ4SX86PPmmI/d8wSpf+oppnisv6bSo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44688F804CA;
	Mon,  7 Jun 2021 17:30:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F130FF804CB; Mon,  7 Jun 2021 17:29:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE606F800AF
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 17:29:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE606F800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="nMKso3FM"
Received: by mail-wm1-x32b.google.com with SMTP id f17so10322649wmf.2
 for <alsa-devel@alsa-project.org>; Mon, 07 Jun 2021 08:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TBonzj0wK2eMrUMd6BSIQ0dwX/RR5Bz8ilFeFxR/TGA=;
 b=nMKso3FMfmrhSU5hrDKlPqTBzag4qyRAim1CmknzGmK5CZlXJ+8ldGm4nuY0CrK/KK
 bL8JqkIY2YQGFKimMKeKOzdpOhcKrx29sAYIF7W9LnjDkIof9Y/+/U8MkuJPygjnC9a5
 MbjPoB6hGVc5YnZprRBRfT/R8p1YvMzIMUMbG6SlJ8xLFIqlJls7VaEzc4Q1AEcO5q9A
 NaScyNR0yMa7iUnhmilLklRiN75V6zgulkErXd3uHaQqQ/Lcr1eL14UWLn4jlls+Qd++
 I1dgb7vkcyYiLVLtmDzH+x9XCiPPfNDcI/QCNx3OY5zxntGDbtU0i+eV49leyXH3HSPb
 d/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TBonzj0wK2eMrUMd6BSIQ0dwX/RR5Bz8ilFeFxR/TGA=;
 b=lu0+KN3VOZ/V1bkXfNJtnZbJ/bz+C8eQ2Jc1lezs7/75F3ssDT3nbRJRQs8sJc39rU
 IWHgtq9J6dVFRprCOv50QuP+XOl234WU1p+nxbMSksGzenT27LEJ81JWi4CnGrAxBkd6
 UF2AH8qSlNiYTW/h/yVCP/dYi2+6duAJ4dbz4d46rb8zJPxas8sDRK37vfb2V7sU2gSv
 efbQVuJ556d4RRnB0SS7kTTtKO98uHCsMp8ajQToA5H7cOiylwy45Ml2HQ+3VsytzNLx
 bDWwEmHDKZ9GlhHv6PrrWC8W3NIIxIpiPMpHaFs7lVyMIGC2eu/ARl38r56yuejt4bU0
 U36w==
X-Gm-Message-State: AOAM531M9Og5ZBcYzhvKoys2pt0KNmERUyovnia/exeN12Die4AgPWSR
 zjVCUcyPnNvm+lbnjQEML+l/Aw==
X-Google-Smtp-Source: ABdhPJxelM/QH7inYspnHoMLYLDbqxeuvm6+AOcdZUrk/uvppwrSz4H2RTVphX+KnCvHPmpiUGZ3Aw==
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr17394049wmi.132.1623079738917; 
 Mon, 07 Jun 2021 08:28:58 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id q3sm16370170wrr.43.2021.06.07.08.28.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 08:28:58 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org
Subject: [RFC PATCH 00/13] ASoC: qcom: Add AudioReach support
Date: Mon,  7 Jun 2021 16:28:23 +0100
Message-Id: <20210607152836.17154-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, tiwai@suse.de, lgirdwood@gmail.com,
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

Srinivas Kandagatla (13):
  soc: dt-bindings: qcom: add gpr bindings
  soc: qcom: add gpr driver support
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
  ASoC: qcom: sm8250: Add audioreach support

 .../bindings/soc/qcom/qcom,gpr.yaml           |   74 ++
 .../devicetree/bindings/sound/qcom,q6apm.yaml |   72 ++
 .../devicetree/bindings/sound/qcom,q6prm.yaml |   43 +
 .../bindings/sound/qcom,sm8250.yaml           |   43 +
 drivers/soc/qcom/Kconfig                      |    9 +
 drivers/soc/qcom/Makefile                     |    1 +
 drivers/soc/qcom/gpr.c                        |  487 ++++++++
 include/dt-bindings/soc/qcom,gpr.h            |   18 +
 include/dt-bindings/sound/qcom,q6apm.h        |  215 ++++
 include/dt-bindings/sound/qcom,q6prm.h        |  205 ++++
 include/linux/soc/qcom/gpr.h                  |  127 ++
 include/uapi/sound/snd_ar_tokens.h            |  200 +++
 sound/soc/qcom/Kconfig                        |   20 +
 sound/soc/qcom/Makefile                       |    1 +
 sound/soc/qcom/audioreach/Makefile            |   12 +
 sound/soc/qcom/audioreach/audioreach.c        | 1082 +++++++++++++++++
 sound/soc/qcom/audioreach/audioreach.h        |  649 ++++++++++
 sound/soc/qcom/audioreach/q6apm-bedai.c       |  377 ++++++
 sound/soc/qcom/audioreach/q6apm-dai.c         |  494 ++++++++
 sound/soc/qcom/audioreach/q6apm.c             |  962 +++++++++++++++
 sound/soc/qcom/audioreach/q6apm.h             |  171 +++
 sound/soc/qcom/audioreach/q6prm.c             |  412 +++++++
 sound/soc/qcom/audioreach/topology.c          |  848 +++++++++++++
 sound/soc/qcom/sm8250.c                       |  144 ++-
 24 files changed, 6665 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,gpr.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6prm.yaml
 create mode 100644 drivers/soc/qcom/gpr.c
 create mode 100644 include/dt-bindings/soc/qcom,gpr.h
 create mode 100644 include/dt-bindings/sound/qcom,q6apm.h
 create mode 100644 include/dt-bindings/sound/qcom,q6prm.h
 create mode 100644 include/linux/soc/qcom/gpr.h
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

