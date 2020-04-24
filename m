Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D921B6B5C
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 04:30:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32FF2169B;
	Fri, 24 Apr 2020 04:29:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32FF2169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587695436;
	bh=JEbqY24V3E5iWemNmUybRk07UbpXQ2TmjaqYhNSoTRw=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PtSEAsM/OfeUfyGRNlRSOy3RJkNxCxUMGwG1cbFo+uffiIVJ+Ak015jS6+NHhOkGk
	 OpWXiAcpNMf2VLW6aGecjGtgS4kq6yD2qaxaq08B6nDXj02IHCZqU/cgZ22Ffv+UJe
	 3sejlhJopbVmc2Vf7DIAL6h8V9w2Kl0u5iB0Nt44=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 581B4F801D9;
	Fri, 24 Apr 2020 04:28:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34740F80142; Fri, 24 Apr 2020 04:28:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E318F800BE
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 04:28:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E318F800BE
IronPort-SDR: DFdIwX95oj3p6hAUSNctv0MewKmQJAJMm8H5nPZWW4YAchS3ggiE1WkDaTjDXyEyyslzxxs+ic
 KpWLqMR5r/MA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 19:28:39 -0700
IronPort-SDR: jRHVk9O86c+4WPdju/0AGbbUvBxhN6Jnd3ep5Y/ASlqxGfL5gbXKvnnsVK4fUKBv7AgLjrSLzK
 ze0TzqcbgO9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,310,1583222400"; d="scan'208";a="457744351"
Received: from monjedli-mobl2.amr.corp.intel.com ([10.254.190.100])
 by fmsmga006.fm.intel.com with ESMTP; 23 Apr 2020 19:28:39 -0700
Message-ID: <539bc208eebe8fc1458f8f8fcabe168e0184b347.camel@linux.intel.com>
Subject: Re: [PATCH v2 00/17] ASoC: soc-dai: add snd_soc_dai_xxx()
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Thu, 23 Apr 2020 19:28:38 -0700
In-Reply-To: <87368tu75n.wl-kuninori.morimoto.gx@renesas.com>
References: <87368tu75n.wl-kuninori.morimoto.gx@renesas.com>
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

On Fri, 2020-04-24 at 08:14 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> We have soc-dai.c today. DAI related functions
> should be implemented in it.
> These patches are v2 of doing it.
> 
> Link: 
> https://lore.kernel.org/r/871rofunaq.wl-kuninori.morimoto.gx@renesas.com
> 
> Kuninori Morimoto (17):
>   ASoC: soc-dai: add soc_dai_err()
>   ASoC: soc-dai: don't overwide dai->driver->ops
>   ASoC: soc-dai: add snd_soc_pcm_dai_new()
>   ASoC: soc-dai: add snd_soc_pcm_dai_prepare()
>   ASoC: soc-dai: add snd_soc_pcm_dai_trigger()
>   ASoC: soc-dai: add snd_soc_pcm_dai_bespoke_trigger()
>   ASoC: soc-dai: add snd_soc_pcm_dai_probe()
>   ASoC: soc-dai: add snd_soc_pcm_dai_remove()
>   ASoC: soc-dai: add snd_soc_dai_compr_start()
>   ASoC: soc-dai: add snd_soc_dai_compr_shutdown()
>   ASoC: soc-dai: add snd_soc_dai_compr_trigger()
>   ASoC: soc-dai: add snd_soc_dai_compr_set_params()
>   ASoC: soc-dai: add snd_soc_dai_compr_get_params()
>   ASoC: soc-dai: add snd_soc_dai_compr_ack()
>   ASoC: soc-dai: add snd_soc_dai_compr_pointer()
>   ASoC: soc-dai: add snd_soc_dai_compr_set_metadata()
>   ASoC: soc-dai: add snd_soc_dai_compr_get_metadata()

LGTM, thanks Morimoto-san, except for the typo in the commit
title/message in the first patch that Pierre pointed out.

Reviewed-By: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

