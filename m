Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4983BEC61
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jul 2021 18:37:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11E66165D;
	Wed,  7 Jul 2021 18:36:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11E66165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625675842;
	bh=bvnu+Q12r9lsNbmtlr5H79SzvQGVneJdj37+WRbbeDw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B+W6hix1+1i/cW0ueboMq1gMJZWNIu8nmm4pRAuAKB23Pdcz60LfHF2/ytsLp9ci+
	 Jefq2kbqDnrnR4IY/E5JGOaK8+fcGsoH5VOC4SFaUzK80qyy3CdedyZC/yxvZSB3sY
	 pqLyi9Af8OH5/YZazklJRxZKknnjoIoxbcLbtD84=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EFB2F80301;
	Wed,  7 Jul 2021 18:35:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 239FDF8025C; Wed,  7 Jul 2021 18:35:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4957BF8012F
 for <alsa-devel@alsa-project.org>; Wed,  7 Jul 2021 18:35:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4957BF8012F
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="209299015"
X-IronPort-AV: E=Sophos;i="5.84,220,1620716400"; d="scan'208";a="209299015"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 09:35:30 -0700
X-IronPort-AV: E=Sophos;i="5.84,220,1620716400"; d="scan'208";a="645442761"
Received: from cmcarran-mobl.amr.corp.intel.com (HELO [10.213.189.140])
 ([10.213.189.140])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 09:35:29 -0700
Subject: Re: [PATCH 05/12] ASoC: amd: add ACP5x PCM platform driver
To: Vijendar Mukunda <vijendar.mukunda@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20210707055623.27371-1-vijendar.mukunda@amd.com>
 <20210707055623.27371-6-vijendar.mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2cac4b49-62f1-83a8-84c1-08add69535d3@linux.intel.com>
Date: Wed, 7 Jul 2021 11:17:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707055623.27371-6-vijendar.mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Alexander.Deucher@amd.com, Takashi Iwai <tiwai@suse.com>,
 Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
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


> +static int acp5x_audio_remove(struct platform_device *pdev)
> +{
> +	return 0;
> +}

can this be removed here and...
> +
> +static struct platform_driver acp5x_dma_driver = {
> +	.probe = acp5x_audio_probe,
> +	.remove = acp5x_audio_remove,

... here?

> +	.driver = {
> +		.name = "acp5x_i2s_dma",
> +	},
> +};
