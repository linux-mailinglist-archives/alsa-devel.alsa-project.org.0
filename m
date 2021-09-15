Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB5540CA72
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 18:37:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 491E8183A;
	Wed, 15 Sep 2021 18:37:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 491E8183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631723871;
	bh=M+RdjXeJf0x6moysoK8sITyhXdL2SwBkO0qgliMr2Rg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a6nnfcbErfhdUnmSFC21jE8b7as31AipQ73MHldu2GuuwZFNUyTgK5cj2FuOMmhTX
	 sXD30R65rcOHRM6koJvI34574a8jWYWyIr2blH4Rsv3ilagaQqPHa3z1o/ACmA5pKY
	 DDQHgeRZUOOxssg2+bSJFz0X1cLBbBlTrt8DMeaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83E53F804FE;
	Wed, 15 Sep 2021 18:34:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D5F2F804ED; Wed, 15 Sep 2021 18:34:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9A96F8049E
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 18:34:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9A96F8049E
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="286060928"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="286060928"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 09:34:44 -0700
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="583352215"
Received: from mvetrive-mobl3.amr.corp.intel.com (HELO [10.212.69.198])
 ([10.212.69.198])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 09:34:43 -0700
Subject: Re: [PATCH v6 00/22] ASoC: qcom: Add AudioReach support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210915131333.19047-1-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <dd55eeae-0fd9-1faf-12b5-deaaf1a035b4@linux.intel.com>
Date: Wed, 15 Sep 2021 11:32:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210915131333.19047-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 9/15/21 8:13 AM, Srinivas Kandagatla wrote:
> Many thanks for reviewing v5. This version addresses all the comments
> raised as part of v5 review.

Much improved indeed, but still a couple of issues and nit-picks.

The one thing I didn't see before is the use of an 'audioreach.bin'
topology file, retrieved with request_firmware(). That hard-coded name
seems problematic for a signal processing framework precisely geared to
topology changes (I kept the description below for context), and will
prevent the use of a common setup on different platforms, even when they
only differ by the form-factor and processing graph. That doesn't seem
to scale, does it? Or did I miss something?

In the SOF example, we have an initial set of tables based on which
codec/amps are used and DMI identifiers; the topology name is overridden
at boot time to account for hardware variability and changes in processing.

> This patchset adds ASoC driver support to configure signal processing
> framework ("AudioReach") which is integral part of Qualcomm next
> generation audio SDK and will be deployed on upcoming Qualcomm chipsets.
> It makes use of ASoC Topology to load graphs on to the DSP which is then
> managed by APM (Audio Processing Manager) service to prepare/start/stop.
> 
> Here is simplified high-level block diagram of AudioReach:
> 
>  ___________________________________________________________
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
>                              |  
>                              | RPMSG (IPC over GLINK)              
>  ____________________________|______________________________
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
>                              |  
>                              |   LPASS AIF
>  ____________________________|______________________________
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
>   ____________________________________________________________
>  |                        Sub-Graph [1]                       |
>  |  _______________________________________________________   |
>  | |                       Container [1]                   |  |
>  | | [WR_SH] -> [PCM DEC] -> [PCM CONV] -> [VOL]-> [I2S-EP]|  |
>  | |_______________________________________________________|  |
>  |____________________________________________________________|
> 
> For now this graph is split into two subgraphs to achieve dpcm like below:
>  ________________________________________________    _________________
> |                Sub-Graph [1]                   |  |  Sub-Graph [2]  |
> |  ____________________________________________  |  |  _____________  |
> | |              Container [1]                 | |  | |Container [2]| |
> | | [WR_SH] -> [PCM DEC] -> [PCM CONV] -> [VOL]| |  | |   [I2S-EP]  | |
> | |____________________________________________| |  | |_____________| |
> |________________________________________________|  |_________________|
> 
>                                                       _________________
>                                                     |  Sub-Graph [3]  |
>                                                     |  _____________  |
>                                                     | |Container [3]| |
>                                                     | |  [DMA-EP]   | |
>                                                     | |_____________| |
>                                                     |_________________|
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

