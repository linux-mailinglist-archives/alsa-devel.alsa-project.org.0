Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C88D041E748
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 07:45:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 501DC16DF;
	Fri,  1 Oct 2021 07:44:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 501DC16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633067113;
	bh=cwttn2b1A9G/0oN31TDici+bR8zd1jpZelM8jeh2HU8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zzz+LQJnfUwLTIKBFjhuOCrwoglh9ldh58xc4pXXsZaY1abGBJyM91Jf+jDuZMhre
	 v6P9GoX0ti9/PGhP2+V9JCkPoGwDnmOFGsoOPluy1zzzcu6TPSfCHHGLu/C5QTgR5c
	 ubnMKC441I5ADGodCpslnWhEWRl6AWhaS3t8FtPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BFAEF8026D;
	Fri,  1 Oct 2021 07:43:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D29C5F80245; Fri,  1 Oct 2021 07:43:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=CTE_8BIT_MISMATCH, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47E4EF801F7
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 07:43:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47E4EF801F7
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="212611881"
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="212611881"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 22:43:40 -0700
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="477231845"
Received: from kdrangex-mobl.ger.corp.intel.com (HELO [10.251.220.94])
 ([10.251.220.94])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 22:43:38 -0700
Message-ID: <b0dfcb22-f805-b751-3c04-ffc435df5f4e@linux.intel.com>
Date: Fri, 1 Oct 2021 08:43:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v3 00/16] ASoC: Add Rich Graph Card support
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87tuitusy4.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87tuitusy4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Rob Herring <robh+dt@kernel.org>
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

Hi Morimoto-san, Mark,

On 10/09/2021 04:20, Kuninori Morimoto wrote:
> 
> Hi Mark
> 
> We already have Audio-Graph-Card which is Of-Graph base general sound
> card driver. Basically it supports basic CPU-Codec connection, and is
> also supporting DPCM connection. Because it was forcibly expanded to
> DPCM, DT parsing is very limited and very difficult to add new features
> on it, for example Multi-CPU/Codec support, Codec2Codec support, etc.
> 
> This patch adds more flexible new Rich-Graph-Card driver for it.
> Audio-Graph-Card and Rich-Graph-Card are similar, but don't have
> full compatibility.
> The reason why I need Rich-Graph-Card instead of updating Audio-Graph-Card
> is that it is very difficult to keep compatibility.
> 
> Rich-Graph-Card supports Normal/DPCM/Codec2Codec Connection wich
> Single/Multi DAIs. And it is possible to Customizing.
> 
> This patch-set adds Rich-Graph-Card driver and customized driver
> sample, and DT settings sample which can be used for testing.

I understand is that naming is difficult, but a rich-graph-card sounds a
bit awkward?
Will we see a wealthy-graph-card if the rich is not resourceful enough? ;)

The current generation of graph based generic audio card is
audio-graph-card

This is going to be an (incompatible) evolution, the Next/New
Generation. Would it sound better if it is named
audio-graph-card-ng / ng-audio-graph-card

The 'rich' sound really out of place (if not rich then poor?).

Next Generation, New Generation, Extended, etc
or just drop the graph and
generic-audio-card


> To enable testing/debuging, this patch-set also adds Test-Component
> driver. We already have Dummy Component and/or Dummy DAI on soc-utils,
> but 1) we can't use it from DT, 2) it do nothing.
> Added new Test-Component can be used from DT, and it can indicate called
> function name. We can use it to trace callback order, understanding
> ALSA SoC behavior, etc, etc...
> Sample DT settings of Rich Graph Card is using Test-Component as CPU/Codec DAI.
> 
> You can easily try to use/test it if you added below line to your DT file.
> Your .config needs to have below CONFIGs to use/test it.
> It will probe sample Sound Card which has Normal/DPCM/Multi/Codec2Codec
> connections.
> 
> 	#include "../../../../../sound/soc/generic/rich-graph-card-sample.dtsi"
> 
> 	CONFIG_SND_RICH_GRAPH_CARD
> 	CONFIG_SND_RICH_CUSTOM_CARD_SAMPLE
> 	CONFIG_SND_TEST_COMPONENT
> 
> Because Audio Graph Card2 is still under experimental stage, it will
> indicate such warning when probing, and the DT might be updated/exchanged.
> 
> It can use Codec2Codec, but it will start automatically when probed,
> and can't stop it so far. It should be updated.
> 
> Link: https://lore.kernel.org/r/87k0xszlep.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/871r8u4s6q.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/87a6mhwyqn.wl-kuninori.morimoto.gx@renesas.com
> 
> v1 -> v2
> 	- don't use "port" base for_each loop
> 
> v2 -> v3
> 	- Rename audio-graph-card2 to rich-graph-card
> 	- Rename DSP to DPCM not to confuse
> 	- Normal/DPCM/Codec2Codec can use Single/Multi DAIs.
> 	- use dpcm/multi/codec2codec node instead of using extra compatible
> 	- Sample DTSI patch is separated to Single/Multi.
> 
> Kuninori Morimoto (16):
>   ASoC: test-component: add Test Component YAML bindings
>   ASoC: test-component: add Test Component for Sound debug/test
>   ASoC: simple-card-utils: add asoc_graph_is_ports0()
>   ASoC: simple-card-utils: add codec2codec support
>   ASoC: add Rich Graph Card driver
>   ASoC: rich-graph-card: add Multi CPU/Codec support
>   ASoC: rich-graph-card: add DPCM support
>   ASoC: rich-graph-card: add Codec2Codec support
>   ASoC: add Rich Graph Card Yaml Document
>   ASoC: add Rich Graph Card Custom Sample
>   ASoC: rich-graph-card-sample.dtsi: add Sample DT for Normal (Single)
>   ASoC: rich-graph-card-sample.dtsi: add Sample DT for Normal (Nulti)
>   ASoC: rich-graph-card-sample.dtsi: add DPCM sample (Single)
>   ASoC: rich-graph-card-sample.dtsi: add DPCM sample (Multi)
>   ASoC: rich-graph-card-sample.dtsi: add Codec2Codec sample (Single)
>   ASoC: rich-graph-card-sample.dtsi: add Codec2Codec sample (Multi)
> 
>  .../bindings/sound/rich-graph-card.yaml       |   57 +
>  .../bindings/sound/test-component.yaml        |   33 +
>  include/sound/graph_card.h                    |   21 +
>  include/sound/simple_card_utils.h             |    4 +
>  sound/soc/generic/Kconfig                     |   20 +
>  sound/soc/generic/Makefile                    |    6 +
>  sound/soc/generic/rich-custom-card-sample.c   |  174 +++
>  sound/soc/generic/rich-graph-card-sample.dtsi |  225 +++
>  sound/soc/generic/rich-graph-card.c           | 1277 +++++++++++++++++
>  sound/soc/generic/simple-card-utils.c         |   46 +-
>  sound/soc/generic/test-component.c            |  659 +++++++++
>  11 files changed, 2521 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/rich-graph-card.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/test-component.yaml
>  create mode 100644 sound/soc/generic/rich-custom-card-sample.c
>  create mode 100644 sound/soc/generic/rich-graph-card-sample.dtsi
>  create mode 100644 sound/soc/generic/rich-graph-card.c
>  create mode 100644 sound/soc/generic/test-component.c
> 

-- 
Péter
