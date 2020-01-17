Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F01C1408EA
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 12:31:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB041170A;
	Fri, 17 Jan 2020 12:30:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB041170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579260682;
	bh=FK7T8kVNl56bKCz8bnJ/DGRhfgY9y6MIDXSwJYUZLSM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G8VE4nxCI2QJAMScDjMmgLvWhYppWrukpDqb3nrLG/xGKjnNdV0W8kWwakz1Cn5BQ
	 y0GeFp7O/pE981iOpDAzP1ea0+r3FxyZJXwUgTyAmbHzasLKWB3y/B3r6A1aOhOdjH
	 XSmtM6ojNcpiCL2/51xTU1gcAnZRdckSnAob3vCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FAE1F8026F;
	Fri, 17 Jan 2020 12:28:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A060F801F8; Fri, 17 Jan 2020 12:28:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 665BEF801EB
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 12:28:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 665BEF801EB
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2020 03:28:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,330,1574150400"; d="scan'208";a="257769913"
Received: from kaiwenhs-mobl.amr.corp.intel.com (HELO [10.251.11.205])
 ([10.251.11.205])
 by fmsmga002.fm.intel.com with ESMTP; 17 Jan 2020 03:28:35 -0800
To: Bard liao <yung-chuan.liao@linux.intel.com>, broonie@kernel.org,
 tiwai@suse.de
References: <20200116202620.7401-1-yung-chuan.liao@linux.intel.com>
 <20200116202620.7401-5-yung-chuan.liao@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <502d9968-e8a8-de96-82a4-f235bf5a0f14@linux.intel.com>
Date: Fri, 17 Jan 2020 05:24:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200116202620.7401-5-yung-chuan.liao@linux.intel.com>
Content-Language: en-US
Cc: liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 bard.liao@intel.com, kuninori.morimoto.gx@renesas.com
Subject: Re: [alsa-devel] [PATCH RFC v3 4/4] ASoC: return error if the
 function is not support multi cpu yet.
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


> @@ -810,9 +810,10 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
>   	int playback = 0, capture = 0;
>   	int i;
>   
> -	if (rtd->num_codecs > 1) {
> +	if (rtd->num_cpus > 1 ||
> +	    rtd->num_codecs) {

this should be num_codecs > 1?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
