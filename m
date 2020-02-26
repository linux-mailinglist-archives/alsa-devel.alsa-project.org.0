Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EC31706A3
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 18:51:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4778168D;
	Wed, 26 Feb 2020 18:50:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4778168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582739506;
	bh=16IH0sQEo2VsQQ2AHajjh4BS+4kehGgBMlTMnFcdIwY=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NQrpUo9SISzr7E5NZw/KDVBCA6kCF5hszg5ObtTV26m7hTpAH0IGvfN3XfRTe/2+z
	 wCXKU68UzL4oHLBm1kKlwCEJL0uqB7JKUT9wtNRAQ7h9KyaSWkiAgjR2ftjFcrI6Uv
	 hezqgyWgqAVV8bgkrudPOt0qKU2NDgWtn0GQYQNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9996F8016F;
	Wed, 26 Feb 2020 18:50:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D809F8014E; Wed, 26 Feb 2020 18:50:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA803F800AD
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 18:49:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA803F800AD
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2020 09:49:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,488,1574150400"; d="scan'208";a="230510128"
Received: from walkernx-mobl.amr.corp.intel.com ([10.254.14.92])
 by fmsmga007.fm.intel.com with ESMTP; 26 Feb 2020 09:49:55 -0800
Message-ID: <5d98cb39bfdc4fe806fa5ec249f02dfc03d994ee.camel@linux.intel.com>
Subject: Re: [PATCH 4/8] ASoC: soc-pcm: add dpcm_fe_dai_clean()
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Wed, 26 Feb 2020 09:49:55 -0800
In-Reply-To: <878skp97in.wl-kuninori.morimoto.gx@renesas.com>
References: <87eeuh97k4.wl-kuninori.morimoto.gx@renesas.com>
 <878skp97in.wl-kuninori.morimoto.gx@renesas.com>
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

On Wed, 2020-02-26 at 15:40 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> dpcm_fe_dai_close() and error case of dpcm_fe_dai_open()
> need to do same cleanup operation.
> To avoid duplicate code, this patch adds dpcm_fe_dai_clean()
> and use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-pcm.c | 30 ++++++++++++++++--------------
>  1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 3686dda097e2..d578dbdfa846 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2978,14 +2978,11 @@ int soc_dpcm_runtime_update(struct
> snd_soc_card *card)
>  	return ret;
>  }
>  
> -static int dpcm_fe_dai_close(struct snd_pcm_substream *fe_substream)
> +static void dpcm_fe_dai_clean(struct snd_pcm_substream
> *fe_substream)
The series looks good to me, Morimoto-san. But a minor suggestion if
you're doing a v2 to address other comments. Could you please change
the name of the function above to dpcm_fe_dai_cleanup() instead?

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Thanks,
Ranjani

