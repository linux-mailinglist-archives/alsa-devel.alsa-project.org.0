Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C611A82AAB
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 07:01:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4373E1664;
	Tue,  6 Aug 2019 07:01:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4373E1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565067719;
	bh=Cl48rI+/yJztoaQBX+eTFo87RgHpk+RwHa3qHQ1y8tQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Buiu0whgHhqTp/GIRRcsBO5pjbVvbKoIdyWw34/QD6w4z74IDsdIdFrLPmqtcSjHH
	 65K3E59LWDes4LPCaCnoJa8G9dcNxMi/v8y/2/UFlnRMaAwroNgBONN0foAQZByhHn
	 +XqSCQiRgIydJx8UneTl5LE+5sa0ICTaClISpCpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD9A8F80483;
	Tue,  6 Aug 2019 07:00:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA53AF80483; Tue,  6 Aug 2019 07:00:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10883F800F4
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 07:00:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10883F800F4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 22:00:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,352,1559545200"; d="scan'208";a="185533055"
Received: from sbaqai-mobl.amr.corp.intel.com ([10.251.144.137])
 by orsmga002.jf.intel.com with ESMTP; 05 Aug 2019 22:00:06 -0700
Message-ID: <d39ec17119eee48eaedae7282bf4906534155926.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Mon, 05 Aug 2019 22:00:05 -0700
In-Reply-To: <87ef1z2ife.wl-kuninori.morimoto.gx@renesas.com>
References: <871rxz3x7e.wl-kuninori.morimoto.gx@renesas.com>
 <87ef1z2ife.wl-kuninori.morimoto.gx@renesas.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 16/28] ASoC: soc-core: initialize rtd->list
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

On Tue, 2019-08-06 at 10:29 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> No one initialize rtd->list, so far.
> Let's do it.
Morimoto-san,

I dont think this is needed. The rtd->list is not meant to be a list
but rather just as a member of the card->rtd_list. So no need to
initialize.

Thanks,
Ranjani
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 2536ba4..2347b58 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -354,6 +354,7 @@ static struct snd_soc_pcm_runtime
> *soc_new_pcm_runtime(
>  	if (!rtd)
>  		return NULL;
>  
> +	INIT_LIST_HEAD(&rtd->list);
>  	INIT_LIST_HEAD(&rtd->component_list);
>  	rtd->card = card;
>  	rtd->dai_link = dai_link;

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
