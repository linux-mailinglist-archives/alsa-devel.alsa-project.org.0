Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E781CEA09
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 03:14:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9147F86E;
	Tue, 12 May 2020 03:13:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9147F86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589246066;
	bh=7S74kQrW0fgaf6ncuB+MYZXcnrG5ENcxxLH6o5skB9w=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OIE9pG5+xsOlr/fqewGs0gG1ikz2OwzqZItJnzLft6DLOhxQqffCWuL+axLcvl/jC
	 7RcTuT+HjquUrBhNtsI2yCeTybtdj0+qSTXja4LFvZvxyeG9OMDln/FFEbVE5SWLAS
	 eESn7zIEkdnCNMJ5g0dXxDJWvrurpt1RFNFAYsAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 476CAF802E0;
	Tue, 12 May 2020 00:44:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFC95F802E0; Tue, 12 May 2020 00:44:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42092F802DD
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 00:44:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42092F802DD
IronPort-SDR: WTlvpheDKVmC+5YMYmUBIbDZhItAyvGOsR0lsaqUQAXjN+LSn1YiJIT6b085uK0wyqY9PvQven
 G/B091C46ZRQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2020 15:44:22 -0700
IronPort-SDR: FvPCmlZznDgHVCqjRMovF9nHBXdwUn6XiHI+5MPMnj8uuEJGtcuDCe66AbWvH+cazoxn7EkRV/
 lnY0frF/xjEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,381,1583222400"; d="scan'208";a="252718496"
Received: from ajgalle-mobl.amr.corp.intel.com ([10.254.179.28])
 by fmsmga008.fm.intel.com with ESMTP; 11 May 2020 15:44:22 -0700
Message-ID: <d0850429f144f345864776afb59410693abfd33b.camel@linux.intel.com>
Subject: Re: [PATCH 02/17] ASoC: use snd_soc_dai/component_activity()
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Mon, 11 May 2020 15:44:22 -0700
In-Reply-To: <8736879fqa.wl-kuninori.morimoto.gx@renesas.com>
References: <875zd39frp.wl-kuninori.morimoto.gx@renesas.com>
 <8736879fqa.wl-kuninori.morimoto.gx@renesas.com>
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

On Mon, 2020-05-11 at 14:56 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-compress.c |  4 ++--
>  sound/soc/soc-core.c     |  4 ++--
>  sound/soc/soc-dapm.c     |  8 ++++----
>  sound/soc/soc-pcm.c      | 14 +++++++-------
>  4 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
> index def3ae78b4a7..92d70e75a5a4 100644
> --- a/sound/soc/soc-compress.c
> +++ b/sound/soc/soc-compress.c
> @@ -231,10 +231,10 @@ static int soc_compr_free(struct
> snd_compr_stream *cstream)
>  
>  	snd_soc_dai_digital_mute(codec_dai, 1, cstream->direction);
>  
> -	if (!cpu_dai->active)
> +	if (!snd_soc_dai_activity(cpu_dai))
I have a feeling this is probably incorrect. snd_soc_dai_activity()
checks for stream_active count which is different from snd_soc_dai's
active member, isnt it?

Thanks,
Ranjani

