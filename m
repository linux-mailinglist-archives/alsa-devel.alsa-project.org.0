Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A38FC230B3E
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 15:15:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34B2916C5;
	Tue, 28 Jul 2020 15:14:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34B2916C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595942133;
	bh=gNdQ4bWJ60wAWopur645TlxBuTaEsWtz9jB3CBtcLIo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RoDoN/oTIJBMrg6Mcd1QmMeiMVsjtN6srZnwTIB8wHh+i8PGmAFVC9JcJtafWEcRG
	 ttbF+cAQ7qRlWKca+75lhmpiQCpkyIUe80rkH/UEmC7+sBiaL7dZa/SqW5hwphbVho
	 g5MMFodTiRvWGWnRd/xGjLRXNoECQ9ElWJNz0UHQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1A39F8021E;
	Tue, 28 Jul 2020 15:14:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 032B4F80240; Tue, 28 Jul 2020 15:14:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94F0EF800DE
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 15:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94F0EF800DE
IronPort-SDR: Etn7HDKbXVrDORbADbp8O4ZjajN2mPwt5MCQOv3M+ZI7jxFC+Tt+kHUorwf1la83MUtKwhcvwv
 oUMnzlK3u4PA==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="130764396"
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; d="scan'208";a="130764396"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2020 06:14:23 -0700
IronPort-SDR: 7rKUIBvxkvxzt9ptvT90xPs2BDwh2dy2ASOZW+8wXk8H4VzVbe6IHmX25Lw9WCT76ziIBlpESy
 Qxl3iUgI5DlQ==
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; d="scan'208";a="312614314"
Received: from caradool-mobl.amr.corp.intel.com (HELO [10.251.24.77])
 ([10.251.24.77])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2020 06:14:22 -0700
Subject: Re: [PATCH 1/7] ASoC: soc-dai: add mark for
 snd_soc_dai_startup/shutdown()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87wo2oku0m.wl-kuninori.morimoto.gx@renesas.com>
 <87v9i8ku04.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5d7e4b05-4900-f276-b7d2-ac7c01ad730b@linux.intel.com>
Date: Tue, 28 Jul 2020 08:14:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87v9i8ku04.wl-kuninori.morimoto.gx@renesas.com>
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

Hi Morimoto-san,

> +#define soc_dai_mark_push(dai, substream, tgt)	((dai)->mark_##tgt = substream)

we may want a check that detects if the pointer is NULL before assigning 
it, otherwise we won't be able to detect bad configuration where a 
pointer is overwritten by 2 mark_push() calls on the same object?

> +#define soc_dai_mark_pop(dai, substream, tgt)	((dai)->mark_##tgt = NULL)
> +#define soc_dai_mark_match(dai, substream, tgt)	((dai)->mark_##tgt == substream)
> +
>   /**
>    * snd_soc_dai_set_sysclk - configure DAI system or master clock.
>    * @dai: DAI
> @@ -348,15 +356,26 @@ int snd_soc_dai_startup(struct snd_soc_dai *dai,
>   	    dai->driver->ops->startup)
>   		ret = dai->driver->ops->startup(substream, dai);
>   
> +	/* mark substream if succeeded */
> +	if (ret == 0)
> +		soc_dai_mark_push(dai, substream, startup);
> +

I am a bit concerned here about the case of a bi-directional DAI, it's 
my understanding that the .startup() callback could be called for each 
direction?

soc-dapm.c:		ret = snd_soc_dai_startup(source, substream);
soc-dapm.c:		ret = snd_soc_dai_startup(sink, substream);

To convince myself of this, I added a dummy startup routine and I do see 
it called when I do playback and capture at the same time:

[  179.057494] plb: ssp2 startup stream 0
[  183.976963] plb: ssp2 startup stream 1

That makes me nervous about having a single pointer and unbalanced calls 
between startup and shutdown.

We had such issues in the past so I may be on the paranoid side here...

Thanks
-Pierre
