Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCA4319B07
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Feb 2021 09:12:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 251031705;
	Fri, 12 Feb 2021 09:11:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 251031705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613117568;
	bh=7h2Kb34CnAbsmrfrOd127hCh1zWHUpCE0p3kkhkfDqI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RZrIrit5z8I3KZIXB9AsxAHj3LFAhCDjqtuu90Urf4ejBsiewAJVAvFQAOPze+n4g
	 wRi6BSIx/78aElYrpPSvxw176WeGoHUGnc9FRZ+XC8LQjNKsx3nLSbMk6nNT2bW3IP
	 MfPo/5LtC+KOR5lElRhdM7WUFmlVJOX++/HBUcP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70C76F8022D;
	Fri, 12 Feb 2021 09:11:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BFF5F8022B; Fri, 12 Feb 2021 09:11:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73889F8010D
 for <alsa-devel@alsa-project.org>; Fri, 12 Feb 2021 09:11:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73889F8010D
IronPort-SDR: qYbWk1ynogDHW7J8S6BQGAhUsh6w5F2xnkuQgCjmKCJuufFKGsVnBb3nx4EiQW+2Gl7u3LyjlL
 5HfKARXw1Szg==
X-IronPort-AV: E=McAfee;i="6000,8403,9892"; a="169506984"
X-IronPort-AV: E=Sophos;i="5.81,173,1610438400"; d="scan'208";a="169506984"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2021 00:11:01 -0800
IronPort-SDR: HlFOIuilaJBdanEuG45NHEyLg8cYHrCmNjbyqEauBjJGkoj1UZ/pTWqmYkRBpiE8FNlrdEkxcU
 k8N5QF2t3npw==
X-IronPort-AV: E=Sophos;i="5.81,173,1610438400"; d="scan'208";a="381366002"
Received: from pkallas-mobl1.ger.corp.intel.com (HELO [10.249.155.234])
 ([10.249.155.234])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2021 00:10:59 -0800
Subject: Re: [PATCH] ASoC: SOF: relax ABI checks and avoid unnecessary warnings
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20210211172440.2371447-1-kai.vehmanen@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <4471ebc1-9c51-7345-12bf-74af55a6bbc2@linux.intel.com>
Date: Fri, 12 Feb 2021 09:10:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210211172440.2371447-1-kai.vehmanen@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: daniel.baluta@nxp.com, ranjani.sridharan@linux.intel.com,
 yung-chuan.liao@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com
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

On 2/11/2021 6:24 PM, Kai Vehmanen wrote:
> With recent SOF 1.7 pre-releases, kernel has been emitting following
> warnings at probe:
> 
> [10006.645216] sof-audio-pci 0000:00:1f.3: warn: FW ABI is more recent than kernel
> [10006.652137] sof-audio-pci 0000:00:1f.3: warn: topology ABI is more recent than kernel
> 
> The warnings are emitted due to increase of the patch-level in firmware
> mainline (to 3.17.1). But the patch level should not be considered even
> in the strict ABI check, so modify the kernel side logic that makes the
> check and only consider the major.minor components.
> 
> BugLink: https://github.com/thesofproject/linux/issues/2647
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> ---
>   sound/soc/sof/ipc.c      | 2 +-
>   sound/soc/sof/topology.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
> index 1bc3d6282f16..c2d07b783f60 100644
> --- a/sound/soc/sof/ipc.c
> +++ b/sound/soc/sof/ipc.c
> @@ -798,7 +798,7 @@ int snd_sof_ipc_valid(struct snd_sof_dev *sdev)
>   		return -EINVAL;
>   	}
>   
> -	if (v->abi_version > SOF_ABI_VERSION) {
> +	if (SOF_ABI_VERSION_MINOR(v->abi_version) > SOF_ABI_MINOR) {
>   		if (!IS_ENABLED(CONFIG_SND_SOC_SOF_STRICT_ABI_CHECKS)) {
>   			dev_warn(sdev->dev, "warn: FW ABI is more recent than kernel\n");
>   		} else {
> diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
> index d6e1f33eb1e9..10f99620eb31 100644
> --- a/sound/soc/sof/topology.c
> +++ b/sound/soc/sof/topology.c
> @@ -3658,7 +3658,7 @@ static int sof_manifest(struct snd_soc_component *scomp, int index,
>   		return -EINVAL;
>   	}
>   
> -	if (abi_version > SOF_ABI_VERSION) {
> +	if (SOF_ABI_VERSION_MINOR(abi_version) > SOF_ABI_MINOR) {
>   		if (!IS_ENABLED(CONFIG_SND_SOC_SOF_STRICT_ABI_CHECKS)) {
>   			dev_warn(scomp->dev, "warn: topology ABI is more recent than kernel\n");
>   		} else {
> 
> base-commit: ec9d68508ff65df1dc24cf8100eb40ddd196c2fd
> 

Shouldn't you also look at major version?
Seems to me like with this check for example 2.1.0 compared to 3.0.0 
will compare 1 and 0 and tell you that you have too new version. Even if 
2 is less than 3.

