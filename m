Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DA443AFC0
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 12:08:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBFE71696;
	Tue, 26 Oct 2021 12:08:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBFE71696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635242930;
	bh=gx/S9z0g/NfQeEXsVEbeTsMudnQ/CewLIMMdae9oYn4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M9DHmc5OyvAzsnlkj2Kw0bDao4f2O+oy8d6/O0SumzxmLGlkZNzvGoSceeheTSLkb
	 ktwF2BX8FW5Sa3XSPUz//B6ljUO+dOd2xIfdn+g5ZineAlvjjynDEA39n9AygrQaiR
	 1138OKHaojf6YGD4ryBDGHvbg7ivKjT6Gjh2/+iA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28A7BF80105;
	Tue, 26 Oct 2021 12:07:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00136F802C8; Tue, 26 Oct 2021 12:07:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3D38F8014D
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 12:07:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3D38F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Y8msvVFI"
Received: by mail-wr1-x42c.google.com with SMTP id e4so18162302wrc.7
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 03:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YjPP3S6hBhtyBoM4+0Amw1b69phDn7W2bgRiodBzYXQ=;
 b=Y8msvVFIU/mom+bFwxrRWBLZ6HVQnJM9uoyo/WBcAqze7RVldZan+0mAckMd501o3m
 VmKbCGT4lE1nZjRlqEx3SJdF2EQOt22WcVIlRp+dZ//h4CegYv0k0zpgoyedLFNrV8KM
 BLpUREB1+PD3Aa4XIiuLBfcSkQ9bpyXejw55LNziKOlVgJtYRPskzsSetxHeJk+EuJQ9
 CqX1mtEVNZzMjrcrvVqLFsxIZMbATBN+h00dzkF5sLk6iLjUHJ9lqL4KXLgP76Maymn3
 HU65cFFrI5VPe89/pIJaX3UiD6pycB60tr6lALtav4v2r9ThOqsgW8dcq9eijLB9DrL+
 y9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YjPP3S6hBhtyBoM4+0Amw1b69phDn7W2bgRiodBzYXQ=;
 b=MVlKujeAzg74Cnf2lFGG4ddesyf14ImEafEGs8FQIxvR1ixxmkKg0HjZ5UoFR7ApA+
 4vVgbxIXRXyEUgy1DKTIgQ/+aPyGcIfrClYiYMDtWHEv+ofC+ijLWLFwgulZnxKgmJvF
 R+wt22xOpDeG35uFWr4d+zxvLyfy6iD3lQ7MuK2ZCMbbrXUUi4ZXyAWq9A9sjdDstVeY
 AV65XKl3X9JYjqe3A8TUJGBNGYETnarrZKyt58Eh5Dy1VWeYSsZz5DKEjdh3ZAeRkaoz
 aed+LQuPCEEmWMUAmhYZTWbWg77IzVpNoWyhgyhGWyQuS+fUTRX8XdWyNw6IX82YfKpC
 l99A==
X-Gm-Message-State: AOAM5321XAFatoICYpcOgS3yt+qLHQ7yyj5ONI3u1EHSNgXH0dR9Z7OA
 9i/uO/9LLbWFFQnovtiCrzWcVkwFB9AwGQ==
X-Google-Smtp-Source: ABdhPJz6NUixSUJUBd914jG4gObIrnSvtaiE9VOwALTdnx5n9o4rWncHd5SIuvWruCzmxIYtzD3P5Q==
X-Received: by 2002:adf:8919:: with SMTP id s25mr30739020wrs.185.1635242841397; 
 Tue, 26 Oct 2021 03:07:21 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id f20sm173575wmq.38.2021.10.26.03.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 03:07:20 -0700 (PDT)
Subject: Re: [PATCH v10 00/17] ASoC: qcom: Add AudioReach support
To: broonie@kernel.org, bjorn.andersson@linaro.org, robh@kernel.org
References: <20211025171649.17730-1-srinivas.kandagatla@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <89d4f8e2-495a-a2be-620d-510db7f6291a@linaro.org>
Date: Tue, 26 Oct 2021 11:07:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025171649.17730-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hi Mark,

On 25/10/2021 18:16, Srinivas Kandagatla wrote:
> Hi Mark,
> 
> This version is a respin of v9 fixing a build error in 12/17 patch.

I seems to have messed up sending this patchset, Am resending this one.
Really sorry for the noise.

-srini
> 
> QCOM SoC relevant non-audio patches in this series has been merged into
> the Qualcomm drivers-for-5.16 tree, as this series depends those patches
> an immutable tag is available at:
> https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/20210927135559.738-6-srinivas.kandagatla@linaro.org
> 
> This patchset adds ASoC driver support to configure signal processing
> framework ("AudioReach") which is integral part of Qualcomm next
> generation audio SDK and will be deployed on upcoming Qualcomm chipsets.
> It makes use of ASoC Topology to load graphs on to the DSP which is then
> managed by APM (Audio Processing Manager) service to prepare/start/stop.
> 
> Here is simplified high-level block diagram of AudioReach:
> 
>   ___________________________________________________________
> |                 CPU (Application Processor)               |
> |  +---------+          +---------+         +----------+    |
> |  |  q6apm  |          |  q6apm  |         |  q6apm   |    |
> |  |   dais  | <------> |         | <-----> |lpass-dais|    |
> |  +---------+          +---------+         +----------+    |
> |                            ^  ^                           |
> |                            |  |           +---------+     |
> |  +---------+               v  +---------->|topology |     |
> |  | q6prm   |          +---------+         |         |     |
> |  |         |<-------->|   GPR   |         +---------+     |
> |  +---------+          +---------+                         |
> |       ^                    ^                              |
> |       |                    |                              |
> |  +----------+              |                              |
> |  |   q6prm  |              |                              |
> |  |lpass-clks|              |                              |
> |  +----------+              |                              |
> |____________________________|______________________________|
>                               |
>                               | RPMSG (IPC over GLINK)
>   ____________________________|______________________________
> |                            |                              |
> |    +-----------------------+                              |
> |    |                       |                              |
> |    v                       v              q6 (Audio DSP)  |
> |+-----+    +----------------------------------+            |
> || PRM |    | APM (Audio Processing Manager)   |            |
> |+-----+    |  . Graph Management              |            |
> |           |  . Command Handing               |            |
> |           |  . Event Management              |            |
> |           |  ...                             |            |
> |           +----------------------------------+            |
> |                            ^                              |
> |____________________________|______________________________|
>                               |
>                               |   LPASS AIF
>   ____________________________|______________________________
> |                            |            Audio I/O         |
> |                            v                              |
> |   +--------------------------------------------------+    |
> |    |                Audio devices                     |   |
> |    | CODEC | HDMI-TX | PCM  | SLIMBUS | I2S |MI2S |...|   |
> |    |                                                  |   |
> |    +--------------------------------------------------+   |
> |___________________________________________________________|
> 
> AudioReach has constructs of sub-graph, container and modules.
> Each sub-graph can have N containers and each Container can have N Modules
> and connections between them can be linear or non-linear.
> An audio function can be realized with one or many connected
> sub-graphs. There are also control/event paths between modules that can
> be wired up while building graph to achieve various control mechanism
> between modules. These concepts of Sub-Graph, Containers and Modules
> are represented in ASoC topology.
> 
> Here is simple I2S graph with a Write Shared Memory and a
> Volume control module within a single Subgraph (1) with one Container (1)
> and 5 modules.
> 
>    ____________________________________________________________
>   |                        Sub-Graph [1]                       |
>   |  _______________________________________________________   |
>   | |                       Container [1]                   |  |
>   | | [WR_SH] -> [PCM DEC] -> [PCM CONV] -> [VOL]-> [I2S-EP]|  |
>   | |_______________________________________________________|  |
>   |____________________________________________________________|
> 
> For now this graph is split into two subgraphs to achieve dpcm like below:
>   ________________________________________________    _________________
> |                Sub-Graph [1]                   |  |  Sub-Graph [2]  |
> |  ____________________________________________  |  |  _____________  |
> | |              Container [1]                 | |  | |Container [2]| |
> | | [WR_SH] -> [PCM DEC] -> [PCM CONV] -> [VOL]| |  | |   [I2S-EP]  | |
> | |____________________________________________| |  | |_____________| |
> |________________________________________________|  |_________________|
> 
>                                                        _________________
>                                                      |  Sub-Graph [3]  |
>                                                      |  _____________  |
>                                                      | |Container [3]| |
>                                                      | |  [DMA-EP]   | |
>                                                      | |_____________| |
>                                                      |_________________|
> 
> 
> This patchset adds very minimal support for AudioReach which includes
> supporting sub-graphs containing CODEC DMA ports and simple PCM
> Decoder/Encoder and Logger Modules. Additional capabilities will
> be built over time to expose features offered by AudioReach.
> 
> This patchset is Tested on SM8250 SoC based Qualcomm Robotics Platform RB5
> and SM9250 MTP with WSA881X Smart Speaker Amplifiers, DMICs connected via
> VA Macro and WCD938x Codec connected via TX and RX Macro and HDMI audio
> via I2S.
> 
> First 10 Patches are mostly reorganization existing Old QDSP Audio
> Framework code and bindings so that we could reuse them on AudioReach.
> 
> ASoC topology graphs for DragonBoard RB5 and SM8250 MTP are available at
> https://git.linaro.org/people/srinivas.kandagatla/audioreach-topology.git/
> and Qualcomm AudioReach DSP headers are available at:
> https://source.codeaurora.org/quic/la/platform/vendor/opensource/arspf-headers
> 
> Note: There is one false positive warning in this patchset:
> audioreach.c:80:45: warning: array of flexible structures
> 
> Thanks,
> srini
> 
> Changes since v9:
> - fix build error during arm64 defconfig build reported by Mark in 12/17 patch
> 
> Srinivas Kandagatla (17):
>    ASoC: dt-bindings: move LPASS dai related bindings out of q6afe
>    ASoC: dt-bindings: move LPASS clocks related bindings out of q6afe
>    ASoC: dt-bindings: rename q6afe.h to q6dsp-lpass-ports.h
>    ASoC: qdsp6: q6afe-dai: move lpass audio ports to common file
>    ASoC: qdsp6: q6afe-clocks: move audio-clocks to common file
>    ASoC: dt-bindings: q6dsp: add q6apm-lpass-dai compatible
>    ASoC: dt-bindings: lpass-clocks: add q6prm clocks compatible
>    ASoC: dt-bindings: add q6apm digital audio stream bindings
>    ASoC: qdsp6: audioreach: add basic pkt alloc support
>    ASoC: qdsp6: audioreach: add q6apm support
>    ASoC: qdsp6: audioreach: add module configuration command helpers
>    ASoC: qdsp6: audioreach: add Kconfig and Makefile
>    ASoC: qdsp6: audioreach: add topology support
>    ASoC: qdsp6: audioreach: add q6apm-dai support
>    ASoC: qdsp6: audioreach: add q6apm lpass dai support
>    ASoC: qdsp6: audioreach: add q6prm support
>    ASoC: qdsp6: audioreach: add support for q6prm-clocks
> 
>   .../devicetree/bindings/sound/qcom,q6afe.txt  |  181 ---
>   .../bindings/sound/qcom,q6apm-dai.yaml        |   53 +
>   .../sound/qcom,q6dsp-lpass-clocks.yaml        |   77 ++
>   .../sound/qcom,q6dsp-lpass-ports.yaml         |  205 +++
>   include/dt-bindings/sound/qcom,q6afe.h        |  203 +--
>   .../sound/qcom,q6dsp-lpass-ports.h            |  208 +++
>   include/uapi/sound/snd_ar_tokens.h            |  208 +++
>   sound/soc/qcom/Kconfig                        |   22 +
>   sound/soc/qcom/qdsp6/Makefile                 |   11 +-
>   sound/soc/qcom/qdsp6/audioreach.c             | 1130 +++++++++++++++++
>   sound/soc/qcom/qdsp6/audioreach.h             |  726 +++++++++++
>   sound/soc/qcom/qdsp6/q6afe-clocks.c           |  187 +--
>   sound/soc/qcom/qdsp6/q6afe-dai.c              |  687 +---------
>   sound/soc/qcom/qdsp6/q6apm-dai.c              |  416 ++++++
>   sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       |  260 ++++
>   sound/soc/qcom/qdsp6/q6apm.c                  |  822 ++++++++++++
>   sound/soc/qcom/qdsp6/q6apm.h                  |  152 +++
>   sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c     |  186 +++
>   sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.h     |   30 +
>   sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      |  627 +++++++++
>   sound/soc/qcom/qdsp6/q6dsp-lpass-ports.h      |   22 +
>   sound/soc/qcom/qdsp6/q6prm-clocks.c           |   85 ++
>   sound/soc/qcom/qdsp6/q6prm.c                  |  202 +++
>   sound/soc/qcom/qdsp6/q6prm.h                  |   78 ++
>   sound/soc/qcom/qdsp6/topology.c               | 1113 ++++++++++++++++
>   25 files changed, 6664 insertions(+), 1227 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
>   create mode 100644 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>   create mode 100644 include/uapi/sound/snd_ar_tokens.h
>   create mode 100644 sound/soc/qcom/qdsp6/audioreach.c
>   create mode 100644 sound/soc/qcom/qdsp6/audioreach.h
>   create mode 100644 sound/soc/qcom/qdsp6/q6apm-dai.c
>   create mode 100644 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
>   create mode 100644 sound/soc/qcom/qdsp6/q6apm.c
>   create mode 100644 sound/soc/qcom/qdsp6/q6apm.h
>   create mode 100644 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
>   create mode 100644 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.h
>   create mode 100644 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
>   create mode 100644 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.h
>   create mode 100644 sound/soc/qcom/qdsp6/q6prm-clocks.c
>   create mode 100644 sound/soc/qcom/qdsp6/q6prm.c
>   create mode 100644 sound/soc/qcom/qdsp6/q6prm.h
>   create mode 100644 sound/soc/qcom/qdsp6/topology.c
> 
