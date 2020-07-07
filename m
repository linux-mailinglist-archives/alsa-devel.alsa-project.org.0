Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C04D217321
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 17:59:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C10AD9F6;
	Tue,  7 Jul 2020 17:58:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C10AD9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594137570;
	bh=ZLZjYf2tL4orzyciYaLYd7xI8IxvPrASekyJM3u3zGs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TsCp8TYDgPaWNyn7xGF2QDBQ4zWcxbhXV6XpP1IbsoaD/6r3zDTyXiimUBzaB8+BP
	 pDCZ/pI+yDar2pO2o3+QKJ+NUp/l6JuGXk2Ox+IMQIokndOyiaxFMGxr+8chwFQ2pi
	 uOhkMzlX+0qquBXDcqCKc+3jeDNaMe+9qzOCBW1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D11E0F801F9;
	Tue,  7 Jul 2020 17:57:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDDC4F80216; Tue,  7 Jul 2020 17:57:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CC36F800D0
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 17:57:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CC36F800D0
IronPort-SDR: 9tm//OsSLHy/fuPL1YStbd6v0rVMGn3GkW86esxV8Giz4SjDd0dNS2VJLtdFLXrc8/ZjQO+X+q
 kFSKcTBzLByA==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="232492298"
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="232492298"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 08:57:30 -0700
IronPort-SDR: AN4VTltRKWpYBZW6WJEJtVdfCoh7jWvuNHIMSoWdab9LD8btdH6T3wsxVfiaG23CrCBxIdb6W0
 LEQUEZGgbdkQ==
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="305709636"
Received: from stortizs-mobl1.amr.corp.intel.com (HELO [10.254.109.228])
 ([10.254.109.228])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 08:57:29 -0700
Subject: Re: [PATCH v2] ASoC: Intel: bxt-da7219-max98357a: support MAX98390
 speaker amp
To: Dan Carpenter <dan.carpenter@oracle.com>, kbuild@lists.01.org,
 Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <20200707132246.GS2549@kadam>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d165ebab-52cc-f431-056d-7bb270689f05@linux.intel.com>
Date: Tue, 7 Jul 2020 10:57:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200707132246.GS2549@kadam>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, kbuild-all@lists.01.org,
 lkp@intel.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Colin Ian King <colin.king@canonical.com>
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




> 27dccaf17142fa Brent Lu              2020-07-01  678  	default:
> 27dccaf17142fa Brent Lu              2020-07-01  679  		dev_err(card->dev, "Invalid speaker amplifier %d\n", ctx->spkamp);
> 27dccaf17142fa Brent Lu              2020-07-01  680  		break;
> 
> return -EINVAL; ?

yes, this was fixed by Colin King on July 2

[PATCH][next] ASoC: Intel: bxt-da7219-max98357a: return -EINVAL on 
unrecognized speaker amplifier
