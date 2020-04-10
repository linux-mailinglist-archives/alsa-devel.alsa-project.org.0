Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EDD1A655D
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Apr 2020 12:49:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57C5C16BA;
	Mon, 13 Apr 2020 12:48:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57C5C16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586774963;
	bh=o9w576DJMqvEVPGemeGJqvrTsBuNZxdGJEzuxcot9DM=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EXGC12SvZ7kdUqcG+/pUx10u1Tte8SJ2yvt+v5FsaUDMwXKKoh6X596KudbsQvDQm
	 bJoaiAwCmj6W366k6fII/n8DGJSSOFIqGqmx7pwjAA3A7SkZoy9Zhjv8yg2EkcjSuI
	 WFwVovOgFQ3gHS1LlhVVXSqrp5sUo9WllnstY9xw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2364F80264;
	Mon, 13 Apr 2020 12:46:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BE12F80264; Mon, 13 Apr 2020 12:46:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A476F800B9
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 12:46:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A476F800B9
IronPort-SDR: xTIET9U+o0m9uS6DOesoTqwcepwKMlaaNL+PO/D7L4uUr1iNq9lACD/mX5ibNkb2gpCy2ozfPW
 67BmxzumEobA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2020 03:46:43 -0700
IronPort-SDR: hS1Dpwyw+cI4F9GNkPj4D9kAz5TVKSvN0C7TOC8V43fLfo/7ak/DCuW2r+CLwASvAKs3aGh3yF
 AGLAILnI3vUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,378,1580803200"; d="scan'208";a="243507799"
Received: from ftehrig-mobl.amr.corp.intel.com (HELO [10.209.82.92])
 ([10.209.82.92])
 by fmsmga007.fm.intel.com with ESMTP; 13 Apr 2020 03:46:37 -0700
Subject: Re: [PATCH 1/2] ASoC: intel: soc-acpi-intel-icl-match: remove useless
 'rt1308_2_adr'
To: Jason Yan <yanaijie@huawei.com>, cezary.rojewski@intel.com,
 liam.r.girdwood@linux.intel.com, yang.jie@linux.intel.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 rander.wang@intel.com, christophe.jaillet@wanadoo.fr,
 alsa-devel@alsa-project.org
References: <20200410081117.21319-1-yanaijie@huawei.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c12c8084-7a30-2271-85e5-db1b3b8e41cc@linux.intel.com>
Date: Fri, 10 Apr 2020 10:17:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200410081117.21319-1-yanaijie@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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



On 4/10/20 3:11 AM, Jason Yan wrote:
> Fix the following gcc warning:
> 
> sound/soc/intel/common/soc-acpi-intel-icl-match.c:90:45: warning:
> ‘rt1308_2_adr’ defined but not used [-Wunused-const-variable=]
>   static const struct snd_soc_acpi_adr_device rt1308_2_adr[] = {
>                                               ^~~~~~~~~~~~
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Patch 1 and 2:

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/intel/common/soc-acpi-intel-icl-match.c | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/sound/soc/intel/common/soc-acpi-intel-icl-match.c b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
> index ef8500349f2f..16ec9f382b0f 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-icl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
> @@ -87,14 +87,6 @@ static const struct snd_soc_acpi_adr_device rt1308_1_adr[] = {
>   	}
>   };
>   
> -static const struct snd_soc_acpi_adr_device rt1308_2_adr[] = {
> -	{
> -		.adr = 0x000210025D130800,
> -		.num_endpoints = 1,
> -		.endpoints = &single_endpoint,
> -	}
> -};
> -
>   static const struct snd_soc_acpi_adr_device rt1308_1_group1_adr[] = {
>   	{
>   		.adr = 0x000110025D130800,
> 
