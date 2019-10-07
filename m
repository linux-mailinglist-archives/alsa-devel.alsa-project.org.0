Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAE0CE504
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 16:19:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B5381664;
	Mon,  7 Oct 2019 16:18:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B5381664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570457972;
	bh=Cp8NvVOtBNm30WGiojdAybEoIRc7pvJneoR60p0gCz4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Echc5ucKr79qSI645sl0NFUYD4i3fLx37X9h+wVIVcpcxMYtokZNyUGgf+4K5suYv
	 j51q0RBopm5sG4+5Ik9BoSNJow0njQnlG8MENpYbmCgbwi5Gn3PZLp1xoY2JT6uMbW
	 TSeTGI6L28s8V2fhOuCZqTtcDm4lvDaEYKuZVrSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14E94F805FF;
	Mon,  7 Oct 2019 16:17:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8657FF805FD; Mon,  7 Oct 2019 16:17:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B522F80273
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 16:17:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B522F80273
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Oct 2019 07:17:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,268,1566889200"; d="scan'208";a="196299008"
Received: from apulla-mobl.amr.corp.intel.com (HELO [10.251.4.206])
 ([10.251.4.206])
 by orsmga003.jf.intel.com with ESMTP; 07 Oct 2019 07:17:43 -0700
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20191007084133.7674-1-guennadi.liakhovetski@linux.intel.com>
 <20191007084133.7674-2-guennadi.liakhovetski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <72bd64d9-1a40-0358-2e8b-64cb1ddec0d9@linux.intel.com>
Date: Mon, 7 Oct 2019 09:17:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007084133.7674-2-guennadi.liakhovetski@linux.intel.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: topology: protect against
 accessing beyond loaded topology data
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

[Adding Mark and Takashi in Cc: ]

On 10/7/19 3:41 AM, Guennadi Liakhovetski wrote:
> Add checks for sufficient topology data length before accessing data
> according to its internal structure. Without these checks malformed
> or corrupted topology images can lead to accessing invalid addresses
> in the kernel.
> 
> Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> ---
>   sound/soc/soc-topology.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index 0fd0329..d1d3c6f 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -2501,9 +2501,18 @@ static int soc_tplg_manifest_load(struct soc_tplg *tplg,
>   static int soc_valid_header(struct soc_tplg *tplg,
>   	struct snd_soc_tplg_hdr *hdr)
>   {
> +	size_t remainder = tplg->fw->size - soc_tplg_get_hdr_offset(tplg);
> +
>   	if (soc_tplg_get_hdr_offset(tplg) >= tplg->fw->size)
>   		return 0;
>   
> +	/* Check that we have enough data before accessing the header */
> +	if (remainder < sizeof(*hdr)) {
> +		dev_err(tplg->dev, "ASoC: insufficient %zd bytes.\n",
> +			remainder);
> +		return -EINVAL;
> +	}

do we still need the first test above? This only tests that remainder is 
<= 0, which is covered in the second added case (with the wrap-around).

> +
>   	if (le32_to_cpu(hdr->size) != sizeof(*hdr)) {
>   		dev_err(tplg->dev,
>   			"ASoC: invalid header size for type %d at offset 0x%lx size 0x%zx.\n",
> @@ -2546,6 +2555,14 @@ static int soc_valid_header(struct soc_tplg *tplg,
>   		return -EINVAL;
>   	}
>   
> +	if (le32_to_cpu(hdr->payload_size) + sizeof(*hdr) > remainder) {
> +		dev_err(tplg->dev,
> +			"ASoC: payload size %zu too large at offset 0x%lx.\n",
> +			le32_to_cpu(hdr->payload_size),
> +			soc_tplg_get_hdr_offset(tplg));
> +		return -EINVAL;
> +	}
> +
>   	if (tplg->pass == le32_to_cpu(hdr->type))
>   		dev_dbg(tplg->dev,
>   			"ASoC: Got 0x%x bytes of type %d version %d vendor %d at pass %d\n",
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
