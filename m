Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9831EEC0D
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jun 2020 22:31:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37FA3166E;
	Thu,  4 Jun 2020 22:30:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37FA3166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591302697;
	bh=/0SfMbeo/hQcZCr8xhRpWtvyUc0HqJcLLMto7zbmQaw=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sXPdV+SV16WuNp4INqSbZGk+tbUfFTYRtnwjpe0sHonbrrcc9S4C/8dJ1cgyEAMgc
	 t43gzqXwt8klp/uYkWe5TqKS7PVbamegchOhsH+D1yscKAHCVjg40x+ICR8QPR200t
	 S423zgMZh7gEZiOl+Uxts370J1+dNVLUmeyG8WyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52CB7F80254;
	Thu,  4 Jun 2020 22:29:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85B55F80254; Thu,  4 Jun 2020 22:29:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E34EEF8013C
 for <alsa-devel@alsa-project.org>; Thu,  4 Jun 2020 22:29:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E34EEF8013C
IronPort-SDR: ZvMrqypajQ5MVyyJszoDbKg8QObwQ5Z6wVGkwgCTIA77mI9lU0sxy/Eg7XkoTrMe7sFgzAxoc6
 s+2rJpodbO5Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 13:29:27 -0700
IronPort-SDR: +OtEaLeLcpU+2/WgcxAAwyLHDf1xpfoLhwXq6dWQ2MCGdGtLFwacJqyy3cTJj8GjT1ZTi8ZXbA
 zVo88rWLY0jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,472,1583222400"; d="scan'208";a="417036192"
Received: from ysu-mobl1.amr.corp.intel.com ([10.254.186.60])
 by orsmga004.jf.intel.com with ESMTP; 04 Jun 2020 13:29:27 -0700
Message-ID: <c553425b89fb6f2a1b3630a4c39b0b260bf528d1.camel@linux.intel.com>
Subject: Re: [PATCH v2 00/12] ASoC: soc-component: collect component functions
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Thu, 04 Jun 2020 13:29:27 -0700
In-Reply-To: <87v9k7w90s.wl-kuninori.morimoto.gx@renesas.com>
References: <87v9k7w90s.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On Thu, 2020-06-04 at 17:05 +0900, Kuninori Morimoto wrote:
> Hi Mark
> 
> We have soc-component.c now, but still many component related
> functions are implemented many place.
> This patch-set collect these into soc-component.c.
> 
> v1 -> v2
> 	- remove soc-compress.c exchange
> 	  (But I have plan to repost it)
> 	- fixup loop break issue on some functions
> 	- direct return on some functions
> 
> Link: 
> https://lore.kernel.org/r/87a71nzhy2.wl-kuninori.morimoto.gx@renesas.com
> 
> Kuninori Morimoto (12):
>   ASoC: soc-component: add soc_component_pin() and share code
>   ASoC: soc-component: move snd_soc_component_xxx_regmap() to soc-
> component
>   ASoC: soc-component: move snd_soc_component_initialize() to soc-
> component.c
>   ASoC: soc-component: add soc_component_err()
>   ASoC: soc-component: add snd_soc_pcm_component_prepare()
>   ASoC: soc-component: add snd_soc_pcm_component_hw_params()
>   ASoC: soc-component: add snd_soc_pcm_component_hw_free()
>   ASoC: soc-component: add snd_soc_pcm_component_trigger()
>   ASoC: soc-component: add snd_soc_component_init()
>   ASoC: soc-component: merge soc-io.c into soc-component.c
>   ASoC: soc-component: merge soc_pcm_trigger_start/stop()
>   ASoC: soc-component: tidyup Copyright
LGTM, Morimoto-san.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>


