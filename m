Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A59AACFCFD
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 17:00:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11DEB1612;
	Tue,  8 Oct 2019 16:59:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11DEB1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570546828;
	bh=NV/kkPZPV2GZJrB5Z4+LvYxLU46HvvDT1s0SlE1OyxU=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=unqkN2O+T+byxLU9Kknd9mHGfSj5L66kauV8Gh438ce3zA62FQN4iHXATeNdKHgoA
	 0kWurf46tP3/5h8M1jM1iAW/KfkyRBIL2HqeV8MVy9+LSdVKlvD5WkyBGJo2y4eD55
	 fUFVNgSTZOrqvRDAvZgzuSHAC6+34L4mqHBah/8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A92CF80322;
	Tue,  8 Oct 2019 16:58:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 133A9F8038F; Tue,  8 Oct 2019 16:58:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B15CF80135
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 16:58:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B15CF80135
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Oct 2019 07:58:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,270,1566889200"; d="scan'208";a="183761321"
Received: from kkashin1-mobl.amr.corp.intel.com (HELO [10.252.198.100])
 ([10.252.198.100])
 by orsmga007.jf.intel.com with ESMTP; 08 Oct 2019 07:58:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87k19f4tjp.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <efe1f700-16cc-a766-e30e-b2039085cbe5@linux.intel.com>
Date: Tue, 8 Oct 2019 09:58:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87k19f4tjp.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Benoit Cousson <bcousson@baylibre.com>
Subject: Re: [alsa-devel] Is this bug ? dpcm_prune_paths()
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



On 10/8/19 1:53 AM, Kuninori Morimoto wrote:
> 
> Hi ALSA ML.
> 
> I'm checking soc-pcm.c, and I noticed strange code at
> dpcm_prune_paths().
> 
> 	static int dpcm_prune_paths(...)
> 	{
> 		...
> 		/* Destroy any old FE <--> BE connections */
> (1)		for_each_dpcm_be(fe, stream, dpcm) {
> 			unsigned int i;
> 
>   -			/* is there a valid CPU DAI widget for this BE */
>   |			widget = dai_get_widget(dpcm->be->cpu_dai, stream);
>   |
> (A)			/* prune the BE if it's no longer in our active list */
>   |			if (widget && widget_in_list(list, widget))
>   |(a)				continue;
>   -
>   |			/* is there a valid CODEC DAI widget for this BE */
>   |(2)			for_each_rtd_codec_dai(dpcm->be, i, dai) {
>   |				widget = dai_get_widget(dai, stream);
> (B)
>   |				/* prune the BE if it's no longer in our active list */
>   |				if (widget && widget_in_list(list, widget))
>   |(b)					continue;
>   -			}
> 
>   -			...
>   |			dpcm->state = ...
> (C)			dpcm->be->dpcm[stream].runtime_update = ...
>   |			prune++;
>   -		}
> 		...
> 	}
> 
> In my understanding, (A) part is for CPU, and (B) part is for Codec.
> Guessing from (a), I think it want to skip setup (C) if CPU widget
> exist and matches to list.
> If so, I guess (b) is maybe bug ?
> This continue is for (2) loop, thus, it is totally do nothing now.
> But maybe it want to be continue for (1) loop ?

Nice catch. This looks like a problem added during the transition to 
multi-codec.

The code before 2e5894d73789 ('ASoC: pcm: Add support for DAI 
multicodec') was this:

		/* is there a valid CODEC DAI widget for this BE */
		widget = dai_get_widget(dpcm->be->codec_dai, stream);

		/* prune the BE if it's no longer in our active list */
		if (widget && widget_in_list(list, widget))
			continue;

and the addition of the loop for the codec seems incorrect

		/* is there a valid CODEC DAI widget for this BE */
		for (i = 0; i < dpcm->be->num_codecs; i++) {
			struct snd_soc_dai *dai = dpcm->be->codec_dais[i];
			widget = dai_get_widget(dai, stream);

			/* prune the BE if it's no longer in our active list */
			if (widget && widget_in_list(list, widget))
				continue;
		}

the continue was not meant to continue the for loop on num_codecs, but 
the outer loop for dpcm.



_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
