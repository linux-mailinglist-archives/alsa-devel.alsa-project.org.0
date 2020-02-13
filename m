Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5471715C91E
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 18:07:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AD3016DB;
	Thu, 13 Feb 2020 18:06:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AD3016DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581613638;
	bh=8kNVrrbCA0ScB+EYTLEFiMlpNout7IB/hbDL0ZW41hQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cpd5OOdPObmQgdTWu7bNlb4FbweTRCAhYOCgjZr0EjPEDT71a239QEOrl3KKtyo79
	 T3Vw1Yloxp4Ort/zcaOqpg9zzYp9jPbqy1pHKgiQjC4dkibMesqfb83f1vf2Cx4Qvx
	 xOdyIZD4znjljo1NrNRh2n0Aa/yfZ5gS8LR+sjsE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E640AF80147;
	Thu, 13 Feb 2020 18:04:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4AEBF8021E; Thu, 13 Feb 2020 18:04:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EDD8F80138
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 18:04:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EDD8F80138
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Feb 2020 09:04:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,437,1574150400"; d="scan'208";a="222709220"
Received: from rebrandt-mobl.amr.corp.intel.com (HELO [10.251.9.115])
 ([10.251.9.115])
 by orsmga007.jf.intel.com with ESMTP; 13 Feb 2020 09:04:44 -0800
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87blq3ru4w.wl-kuninori.morimoto.gx@renesas.com>
 <871rqzru2y.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3ea74049-c07a-bfed-204b-96f6bd9d9032@linux.intel.com>
Date: Thu, 13 Feb 2020 09:56:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <871rqzru2y.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 07/10] ASoC: soc-pcm: add
 snd_soc_dpcm_can_be() and remove duplicate code
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



> +int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
> +		struct snd_soc_pcm_runtime *be, int stream)
> +{
> +	enum snd_soc_dpcm_state state[] = {
> +		SND_SOC_DPCM_STATE_START,
> +		SND_SOC_DPCM_STATE_PAUSED,
> +		SND_SOC_DPCM_STATE_SUSPEND,
> +	};

should this be const?


> +	enum snd_soc_dpcm_state state[] = {
> +		SND_SOC_DPCM_STATE_START,
> +		SND_SOC_DPCM_STATE_PAUSED,
> +		SND_SOC_DPCM_STATE_SUSPEND,
> +		SND_SOC_DPCM_STATE_PREPARE,
> +	};

const as well?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
