Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9D510089D
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 16:48:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D4211691;
	Mon, 18 Nov 2019 16:47:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D4211691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574092125;
	bh=PeewzOV4SjlTOc7W6bWy6WFiQ3SJHwmSG5RON3lrTI0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kaE01QCSPeUwEuE3fpgTL5s1uyvoz4Ftakwl9oWCzbU8SKPAmcM9fQcKpwE+iFqBI
	 ImdL5g2o8sHoMK1BskEHCMZdG3UdwW6R7LE2hc2vNb4CtIH7IQvmLWVGLdrsXU+lA+
	 bLlqJQrlbWtTXeUYY3In35XwnyiW40clyX6KjvGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5072DF80148;
	Mon, 18 Nov 2019 16:45:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69898F80141; Mon, 18 Nov 2019 16:45:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A5BCF800FF
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 16:45:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A5BCF800FF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Nov 2019 07:45:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,320,1569308400"; d="scan'208";a="289292832"
Received: from nmdeliwa-mobl1.amr.corp.intel.com (HELO [10.251.155.92])
 ([10.251.155.92])
 by orsmga001.jf.intel.com with ESMTP; 18 Nov 2019 07:45:19 -0800
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87r226x8aq.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <33d0b023-1886-32fe-e04a-d87685068343@linux.intel.com>
Date: Mon, 18 Nov 2019 09:25:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <87r226x8aq.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 0/2] ASoC: fixup topology dai_link remove
 issue
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 11/17/19 7:49 PM, Kuninori Morimoto wrote:
> 
> Hi Mark
> Cc Pierre-Louis, Takashi-san
> 
> Currently, I'm focusing to ASoC cleanup / balance-up.
> But, it found more unbalance issue, and Intel noticed about it.
> These patches fix dai_link remove issue on topology.
> 
> I want to get Acked-by or Reviewed-by from Takashi-san
> for 2) patch if possible.
> 
> These are already tested by Intel CI, and all issues were solved.
> (https://github.com/thesofproject/linux/pull/1504)
> Extra Tested-by / Reviewed-by are very welcome from Intel

if you don't mind I'd like to retest this new series, it's based on a 
different tip and is not exactly the same as before.

e.g. we tested this:

-	/* free the ALSA card at first; this syncs with pending operations */
-	if (card->snd_card) {
-		snd_card_free(card->snd_card);
-		card->snd_card = NULL;
-	}
+	if (card->snd_card)
+		snd_card_disconnect_sync(card->snd_card);

  	/* remove and free each DAI */
  	soc_remove_link_dais(card);
+	soc_remove_link_components(card);


and the new code shows this

-	/* free the ALSA card at first; this syncs with pending operations */
-	if (card->snd_card) {
-		snd_card_free(card->snd_card);
-		card->snd_card = NULL;
-	}
+	if (card->snd_card)
+		snd_card_disconnect_sync(card->snd_card);

  	snd_soc_dapm_shutdown(card); <<< not tested yet.

  	/* remove and free each DAI */
  	soc_remove_link_dais(card);
+	soc_remove_link_components(card);



> 
> Kuninori Morimoto (2):
>    1) ASoC: soc-component: tidyup snd_soc_pcm_component_new/free() parameter
>    2) ASoC: soc-pcm: remove soc_pcm_private_free()
> 
>   include/sound/soc-component.h |  4 ++--
>   sound/soc/soc-component.c     |  8 +++-----
>   sound/soc/soc-core.c          | 19 +++++++++++--------
>   sound/soc/soc-pcm.c           | 12 +-----------
>   4 files changed, 17 insertions(+), 26 deletions(-)
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
