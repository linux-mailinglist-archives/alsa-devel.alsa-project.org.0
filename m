Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5751B15EA35
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 18:12:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F08B516B6;
	Fri, 14 Feb 2020 18:11:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F08B516B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581700355;
	bh=v0f2fva2EICsJIZPVbLcDXcawZXauc3avaidsaELH7c=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kHrLF17qXl1AYzo5cOjQGYwczjIyz+TIm8hm0ZpQIKMuQlhoe49Qld3Fw5cp5qUIq
	 cow68CGbWC1SE8Cj+g2LzdV9ggO67N1ed6rkCKcBQE3r5nlRgDMF4vVKEHF9SZytc2
	 SdGQRvBr9dHNdoLhTPpsMdG3KzZnmNuZAMfoGSqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B9DDF80228;
	Fri, 14 Feb 2020 18:10:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DA8DF8019B; Fri, 14 Feb 2020 18:10:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4353FF800F0
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 18:10:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4353FF800F0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2020 09:10:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,441,1574150400"; d="scan'208";a="238414043"
Received: from pjshinde-mobl.amr.corp.intel.com ([10.255.69.176])
 by orsmga006.jf.intel.com with ESMTP; 14 Feb 2020 09:10:41 -0800
Message-ID: <8ec9062d911795c3a913746ed4c6506682691fcc.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Fri, 14 Feb 2020 09:10:40 -0800
In-Reply-To: <87sgjdzyk4.wl-kuninori.morimoto.gx@renesas.com>
References: <87sgjdzyk4.wl-kuninori.morimoto.gx@renesas.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v2 00/10] ASoC: soc-pcm cleanup step3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 2020-02-14 at 11:35 +0900, Kuninori Morimoto wrote:
> Hi Mark
> 
> These are v2 of soc-pcm cleanup step3.
> I removed unneeded Multi-Codec patch.
> 
> And re-ordered / merged my local tree and add [09/10] patch
> to make [10/10] more effective.
> 
> Kuninori Morimoto (10):
>    1) ASoC: soc-pcm: move dai_get_widget()
>    2) ASoC: soc-pcm: use dai_get_widget() at dpcm_get_be()
>    3) ASoC: soc-pcm: use dai_get_widget() at dpcm_end_walk_at_be()
>    4) ASoC: soc-pcm: use dpcm_get_be() at dpcm_end_walk_at_be()
>    5) ASoC: soc-pcm: remove soc_dpcm_be_digital_mute()
>    6) ASoC: soc-pcm: remove snd_soc_dpcm_be_get/set_state()
>    7) ASoC: soc-pcm: add snd_soc_dpcm_can_be() and remove duplicate
> code
>    8) ASoC: soc-pcm: use goto and remove multi return
>    9) ASoC: soc-pcm: merge playback/cature_active into stream_active
>   10) ASoC: soc.h: add for_each_pcm_streams()
> 
LGTM, thanks Morimoto-sanm, for the whole V2 series

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
