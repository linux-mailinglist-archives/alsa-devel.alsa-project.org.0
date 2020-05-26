Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0481E2596
	for <lists+alsa-devel@lfdr.de>; Tue, 26 May 2020 17:37:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 874A41759;
	Tue, 26 May 2020 17:37:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 874A41759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590507473;
	bh=JbgoX9Vsm0jGxmMvbPKGkAKFtsH3r0KdAIIAhIuy6f8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R+tyFtDqpmcjKc8MZ1ysAcxd3TjmPrul0Cp7cWdBVGECC5/XetKj9Ery1a4X50M9W
	 ApbIoQwJvApoFS4pGjMTdLc+Z7GB5JcWCSVnMME0DPBujOBoYb3QYE8gJNS3YevoOa
	 IHX5Ef4OhRKB+A50ZQ2TZScA6Nr/e3oslei2dG0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83072F80290;
	Tue, 26 May 2020 17:35:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D207F8028F; Tue, 26 May 2020 17:35:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E883F8014A
 for <alsa-devel@alsa-project.org>; Tue, 26 May 2020 17:35:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E883F8014A
IronPort-SDR: Md+Id5Tm5UywUBhqnNgJBP+ZXdo8RtIjuBvOmqWmVKWP9o66/1ALiaIyTCTf9J0gGLPOM4OQSN
 gv/y4XHn1cxA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2020 08:35:00 -0700
IronPort-SDR: pjPHKxd/P5T7xeu4lzneg9Arje37jbdhiP6STCXGEhF9l/OP0m4zX1CDnBX/FnXgXrMrpL0To0
 g2FhOqZ2gcOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,437,1583222400"; d="scan'208";a="291234633"
Received: from unknown (HELO [10.254.102.121]) ([10.254.102.121])
 by fmsmga004.fm.intel.com with ESMTP; 26 May 2020 08:35:00 -0700
Subject: Re: [PATCH 12/19] ASoC: soc-card: add probed bit field to snd_soc_card
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87h7w3339l.wl-kuninori.morimoto.gx@renesas.com>
 <87zh9v1okl.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9d5d8e40-c39e-5533-5ccc-8d79fafc1168@linux.intel.com>
Date: Tue, 26 May 2020 09:08:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <87zh9v1okl.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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



On 5/25/20 8:18 PM, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> We have bit field to control snd_soc_card.
> Let's add probed field on it instead of local variable.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   include/sound/soc.h  |  1 +
>   sound/soc/soc-core.c | 18 ++++++++----------
>   2 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index 060c01c32547..74868436ac79 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -1096,6 +1096,7 @@ struct snd_soc_card {
>   	unsigned int topology_shortname_created:1;
>   	unsigned int fully_routed:1;
>   	unsigned int disable_route_checks:1;
> +	unsigned int probed:1;
>   
>   	void *drvdata;
>   };
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 02147acf6547..7cfb3ee6ff4f 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1723,8 +1723,7 @@ static void __soc_setup_card_name(char *name, int len,
>   	}
>   }
>   
> -static void soc_cleanup_card_resources(struct snd_soc_card *card,
> -				       int card_probed)
> +static void soc_cleanup_card_resources(struct snd_soc_card *card)
>   {
>   	struct snd_soc_pcm_runtime *rtd, *n;
>   
> @@ -1748,8 +1747,9 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card,
>   	soc_cleanup_card_debugfs(card);
>   
>   	/* remove the card */
> -	if (card_probed && card->remove)
> +	if (card->probed && card->remove)
>   		card->remove(card);
> +	card->probed = 0;
>   
>   	if (card->snd_card) {
>   		snd_card_free(card->snd_card);
> @@ -1760,12 +1760,10 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card,
>   static void snd_soc_unbind_card(struct snd_soc_card *card, bool unregister)
>   {
>   	if (card->instantiated) {
> -		int card_probed = 1;
> -

This looks like a change, now soc_cleanup_card_resources() is called 
without setting the card_probed bitfield?

everywhere else I see a 1:1 mapping between variable and bitfield usage, 
not here, is this intentional?

>   		card->instantiated = false;
>   		snd_soc_flush_all_delayed_work(card);
>   
> -		soc_cleanup_card_resources(card, card_probed);
> +		soc_cleanup_card_resources(card);
>   		if (!unregister)
>   			list_add(&card->list, &unbind_card_list);
>   	} else {
> @@ -1779,7 +1777,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
>   	struct snd_soc_pcm_runtime *rtd;
>   	struct snd_soc_component *component;
>   	struct snd_soc_dai_link *dai_link;
> -	int ret, i, card_probed = 0;
> +	int ret, i;
>   
>   	mutex_lock(&client_mutex);
>   	mutex_lock_nested(&card->mutex, SND_SOC_CARD_CLASS_INIT);
> @@ -1831,7 +1829,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
>   		ret = card->probe(card);
>   		if (ret < 0)
>   			goto probe_end;
> -		card_probed = 1;
> +		card->probed = 1;
>   	}
>   
>   	/* probe all components used by DAI links on this card */
> @@ -1923,7 +1921,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
>   			goto probe_end;
>   		}
>   	}
> -	card_probed = 1;
> +	card->probed = 1;
>   
>   	snd_soc_dapm_new_widgets(card);
>   
> @@ -1945,7 +1943,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
>   
>   probe_end:
>   	if (ret < 0)
> -		soc_cleanup_card_resources(card, card_probed);
> +		soc_cleanup_card_resources(card);
>   
>   	mutex_unlock(&card->mutex);
>   	mutex_unlock(&client_mutex);
> 
