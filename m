Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAB43CBCFB
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 21:53:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB07B16BF;
	Fri, 16 Jul 2021 21:53:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB07B16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626465237;
	bh=DElIr8bReBcg1ZGS7mMkEQO3IMO6ykRw7u23OtMP+Sg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ioW7MZyz3aGMESpdUhadJ0ZJMmx6gK8KYvWl2yCYBsCk5LJwAy/9+koFXju4McdTv
	 uvYOOFQYLA4MWZVRa8RlGgMkHb17kZwZ+IUUL5mS/d+C2rQPLS3qIWF/fn6VF0AELC
	 g8q2Rj5Wh6icuuyvXTT17PQh7vepvW5ABq7IuiCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ADC4F800FB;
	Fri, 16 Jul 2021 21:52:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C391F80254; Fri, 16 Jul 2021 21:52:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42F4EF800FE
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 21:52:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42F4EF800FE
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="190461688"
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="190461688"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:52:22 -0700
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="497138177"
Received: from mohalshu-mobl2.amr.corp.intel.com (HELO [10.212.40.103])
 ([10.212.40.103])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:52:22 -0700
Subject: Re: [PATCH RESEND V2 00/12] Add Vangogh ACP ASoC driver
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20210717040059.310410-1-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5673f620-fec1-d2a3-0b78-a1cfdda04acd@linux.intel.com>
Date: Fri, 16 Jul 2021 14:52:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717040059.310410-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Alexander.Deucher@amd.com, Sunil-kumar.Dommati@amd.com,
 krisman@collabora.com
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



On 7/16/21 11:00 PM, Vijendar Mukunda wrote:
> This adds an ASoC driver for the ACP (Audio CoProcessor)
> block on AMD Vangogh APU.
> 
> Vijendar Mukunda (12):
>   ASoC: amd: add Vangogh ACP5x IP register header
>   ASoC: amd: add Vangogh ACP PCI driver
>   ASoc: amd: add acp5x init/de-init functions
>   ASoC: amd: create acp5x platform devices
>   ASoC: amd: add ACP5x PCM platform driver
>   ASoC: amd: irq handler changes for ACP5x PCM dma driver
>   ASoC: amd: add ACP5x pcm dma driver ops
>   ASoC: amd: add vangogh i2s controller driver
>   ASoC: amd: add vangogh i2s dai driver ops
>   ASoC: amd: add vangogh pci driver pm ops
>   ASoC: amd: add vangogh i2s dma driver pm ops
>   ASoC: amd: enable vangogh acp5x driver build
> ---
> v1 -> v2: fixed review comments

usually the version number is at the patchset level, here you included v1, v2 and v3 patches and all but the last one use the RESEND prefix?

is this intentional?

> ---
>  sound/soc/amd/Kconfig                       |   9 +
>  sound/soc/amd/Makefile                      |   1 +
>  sound/soc/amd/vangogh/Makefile              |   9 +
>  sound/soc/amd/vangogh/acp5x-i2s.c           | 429 ++++++++++++++++
>  sound/soc/amd/vangogh/acp5x-pcm-dma.c       | 525 ++++++++++++++++++++
>  sound/soc/amd/vangogh/acp5x.h               | 192 +++++++
>  sound/soc/amd/vangogh/pci-acp5x.c           | 327 ++++++++++++
>  sound/soc/amd/vangogh/vg_chip_offset_byte.h | 337 +++++++++++++
>  8 files changed, 1829 insertions(+)
>  create mode 100644 sound/soc/amd/vangogh/Makefile
>  create mode 100644 sound/soc/amd/vangogh/acp5x-i2s.c
>  create mode 100644 sound/soc/amd/vangogh/acp5x-pcm-dma.c
>  create mode 100644 sound/soc/amd/vangogh/acp5x.h
>  create mode 100644 sound/soc/amd/vangogh/pci-acp5x.c
>  create mode 100644 sound/soc/amd/vangogh/vg_chip_offset_byte.h
> 
