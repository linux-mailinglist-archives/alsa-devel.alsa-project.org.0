Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB421BB9C5
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Sep 2019 18:39:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AB3D169C;
	Mon, 23 Sep 2019 18:38:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AB3D169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569256778;
	bh=RrtRo+rmNzkjHX5a9H00YBNorXm9OwwljM5K6CrL3gc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jex76JFwnhlFr+dV0dGK926hZdR0xHmAkFyT2YEAkHPJQ85+FbNT5p7qPn4dfd6Dz
	 6UfkAp6TTaQpqcN+JCpNG6vXr4H/LCeiu6UnzVJfb7BVBlQ/YnS2G7ArG1DznCXjns
	 5h+6yZZohhAkiu1Y/YU7jqAhW0G6dMmuoZEnWQrk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53AEBF8049C;
	Mon, 23 Sep 2019 18:37:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB410F8044C; Mon, 23 Sep 2019 18:37:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3E32F80307
 for <alsa-devel@alsa-project.org>; Mon, 23 Sep 2019 18:37:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3E32F80307
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Sep 2019 09:37:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,541,1559545200"; d="scan'208";a="213380596"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 23 Sep 2019 09:37:44 -0700
Received: from aabousam-mobl1.amr.corp.intel.com
 (aabousam-mobl1.amr.corp.intel.com [10.251.27.167])
 by linux.intel.com (Postfix) with ESMTP id BF8F65803E4;
 Mon, 23 Sep 2019 09:37:43 -0700 (PDT)
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-tegra@vger.kernel.org,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20190923162026.14882-1-ben.dooks@codethink.co.uk>
 <20190923162026.14882-3-ben.dooks@codethink.co.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ef013678-01b7-cae6-72f4-a619be428ad5@linux.intel.com>
Date: Mon, 23 Sep 2019 11:37:43 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190923162026.14882-3-ben.dooks@codethink.co.uk>
Content-Language: en-US
Cc: linux-kernel@lists.codethink.co.uk,
 Edward Cragg <edward.cragg@codethink.co.uk>
Subject: Re: [alsa-devel] [PATCH v2 2/7] ASoC: tegra: Allow 24bit and 32bit
 samples
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


> @@ -283,6 +294,7 @@ static int tegra30_i2s_set_tdm(struct snd_soc_dai *dai,
>   		(1 - 1) << TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_SHIFT);
>   	pm_runtime_put(dai->dev);
>   
> +	pm_runtime_put(dai->dev);
>   	return 0;
>   }

git squash/merge issue here?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
