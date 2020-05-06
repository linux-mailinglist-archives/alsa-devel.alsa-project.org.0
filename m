Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9FB1C7B75
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 22:45:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3850817C5;
	Wed,  6 May 2020 22:44:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3850817C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588797938;
	bh=O/QuyIiE2ZEyCekfzhDvL8k7HszENfXXkq5NQpaTa5M=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ps8ByYjb+Y3FLC0a/kv2BSE0EzG4YX510z4CKxO4aKKDSufl7KRwzHLyAQqhh15eh
	 W/zyDHIz8dAPDi/VBJOaLb6GGAyv21Z0YIUKjXsJnGvlXVCRQqA/GmB6oJk74BffP+
	 nl5rU5Owg4pJ5SBbw8Zxivxaq/XP6B1HEN1BrrAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36D1EF8025E;
	Wed,  6 May 2020 22:44:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C5E0F80259; Wed,  6 May 2020 22:43:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2619F800AD
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 22:43:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2619F800AD
IronPort-SDR: G/l1ZYHC1mUx+4uEKzPZHxHrYaYzqBdOz4yBCcxL5Pj6pE5agfKbivGBzrx8LqNkLrYf8BZU+H
 JcViIMdCeJwg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 13:43:26 -0700
IronPort-SDR: EQ1EZBecaug5C9JPycioFJvKA/WQJ6q7QlgVP4YjcA9jY64P4bUyrmYi0nqFPRh4Q5wo5O4aEH
 K5RVPXTaPQ/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,360,1583222400"; d="scan'208";a="249871687"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.249.134.203])
 ([10.249.134.203])
 by fmsmga007.fm.intel.com with ESMTP; 06 May 2020 13:43:25 -0700
Subject: Re: [PATCH] ALSA: hda: Allow SST driver on SKL and KBL platforms with
 DMIC
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200506201656.18299-1-cezary.rojewski@intel.com>
 <697b0a05-1827-c62d-bf41-0bf02f93a405@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <3a141806-cb2e-f83d-1728-0eae5eef58c6@intel.com>
Date: Wed, 6 May 2020 22:43:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <697b0a05-1827-c62d-bf41-0bf02f93a405@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, tiwai@suse.com
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

On 2020-05-06 22:26, Pierre-Louis Bossart wrote:
> On 5/6/20 3:16 PM, Cezary Rojewski wrote:
>> Update intel-dspcfg with FLAG_SST_ONLY_IF_DMIC option and use it for
>> Skylake and Kabylake platforms when DMIC is present.
> 
> Sounds good Cezary but your changes will not apply on Takashi's for-5.8 
> tree, they will have a minor conflict with my SoundWire changes 
> submitted in early April.
> 
> ++<<<<<<< HEAD
>   +#define FLAG_SST                      BIT(0)
>   +#define FLAG_SOF                      BIT(1)
>   +#define FLAG_SOF_ONLY_IF_DMIC         BIT(16)
>   +#define FLAG_SOF_ONLY_IF_SOUNDWIRE    BIT(17)
>   +
>   +#define FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE (FLAG_SOF_ONLY_IF_DMIC | \
>   +                                          FLAG_SOF_ONLY_IF_SOUNDWIRE)
> ++=======
> + #define FLAG_SST              BIT(0)
> + #define FLAG_SOF              BIT(1)
> + #define FLAG_SST_ONLY_IF_DMIC BIT(15)
> + #define FLAG_SOF_ONLY_IF_DMIC BIT(16)
> ++>>>>>>> ALSA: hda: Allow SST driver on SKL and KBL platforms with DMIC
> 
> 

Indeed, thanks for heads up, Pierre! Fixed in v2.
