Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69386603D73
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 11:02:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C9A0A3E2;
	Wed, 19 Oct 2022 11:01:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C9A0A3E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666170150;
	bh=SHZxbZ/3OqB6br/JXYLHlkwQRyziJIcVpgMP6FtVb3o=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MeOwG8qhGNdaPAGSQM07Jd23og6jaYdxqSUp/xhMYoIPw682rbCZ6D33fUZkGRela
	 PqE13Im1sLgYwsX5emXSvOaBbBsRW7JxkdPRNTn+MiwSJQAei1pz6+z5UlUQi0WOlT
	 yYNtKmcpMWx3Iv58GSAA4QiH8atM8ivEm1ND9i64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7177FF804E0;
	Wed, 19 Oct 2022 11:01:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E67F0F80087; Wed, 19 Oct 2022 11:01:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3F48F80087
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 11:01:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3F48F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="f/OAn+YQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666170091; x=1697706091;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SHZxbZ/3OqB6br/JXYLHlkwQRyziJIcVpgMP6FtVb3o=;
 b=f/OAn+YQ2AvpzAR2ARYAdgkyurC3Digg3FAzJwVBXWnUy67/FFBwDu3+
 NwVE1faOpDQE1M57DdugZpneIBe8aTWfuOhlDwmdmcb/cKjCQR+R9fflE
 Hsq69Rn0A6QjGyYnwD87nbIFVfs0IZyA8UFFu+MKCwTVDq6lqJW7DPINn
 u4hQryRCbwfotKAcaauXG2qRf1KZrFgCpQB0QZ6DuFDxu9EwEeMNFgzdM
 mG2vbjqq6/bNy02vpgMu5KmuQ2bBo+drsKVrjx+JfeCNQ81AVBrtmB1ji
 83RY1jKvtHxLCNum7H+6XBVFeAHA4Mo8QS8u9Nu8zGcD9l/g41Ig8wiK9 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="293747317"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; d="scan'208";a="293747317"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 02:01:27 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="874332709"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; d="scan'208";a="874332709"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.196])
 ([10.99.249.196])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 02:01:26 -0700
Message-ID: <e9b7084f-e0cc-3fa2-e85b-17ae4606efc9@linux.intel.com>
Date: Wed, 19 Oct 2022 11:01:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2 00/11] ASoC: soc-dapm.c random cleanups
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87bkq8tzu1.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87bkq8tzu1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 10/19/2022 2:35 AM, Kuninori Morimoto wrote:
> 
> Hi Mark
> 
> These are v2 of random cleanup for soc-dpam.c/h.
> Basically, these are just cleanup, nothing changed.
> 
> v1
> 	https://lore.kernel.org/r/8735bmqazf.wl-kuninori.morimoto.gx@renesas.com
> 
> v1 -> v2
> 
> 	- add "break;" on default
> 
> Kuninori Morimoto (11):
>    ASoC: soc-dapm.c: replace snd_soc_dapm_wcache to snd_soc_dapm_widget
>    ASoC: soc-dapm.c: tidyup error handling on snd_soc_dapm_add_route()
>    ASoC: soc-dapm.c: remove no meaning variable from snd_soc_dapm_add_path()
>    ASoC: soc-dapm.c: ignore parameter NULL at snd_soc_dapm_free_widget()
>    ASoC: soc-dapm.c: cleanup dapm_widget_set_power()
>    ASoC: soc-dapm.c: merge dapm_power_one_widget() and dapm_widget_set_power()
>    ASoC: soc-dapm.c: cleanup snd_soc_dapm_new_dai()
>    ASoC: soc-dapm.c: numerical order for dapm_up_seq
>    ASoC: soc-dapm.h: cleanup white space
>    ASoC: soc-dapm.h: fixup comment for snd_soc_dapm_widget_for_each_path()
>    ASoC: soc-dpcm.h: remove snd_soc_dpcm::hw_param
> 
>   include/sound/soc-dapm.h  | 188 +++++++++++++++----------------------
>   include/sound/soc-dpcm.h  |   2 -
>   sound/soc/codecs/hda.c    |   6 +-
>   sound/soc/intel/avs/pcm.c |   6 +-
>   sound/soc/sh/rcar/core.c  |   3 +-
>   sound/soc/soc-dapm.c      | 190 ++++++++++++++++----------------------
>   sound/soc/soc-pcm.c       |  12 ++-
>   7 files changed, 171 insertions(+), 236 deletions(-)
> 

Looks ok to me, I've also run it through our validation and everything 
seems to work.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
