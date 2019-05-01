Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C30107AB
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 13:58:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC02F16D5;
	Wed,  1 May 2019 13:57:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC02F16D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556711895;
	bh=P8/RTMTvKYnjRWsV2XNRdJF/272h8dTkcdFYY1sEyIc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c9uhMlsEkqMet6Ie34s4TV1cAcJvu8liGKgL4p+xH9yczhMO4MVt/Dw3nFctyuwxn
	 WZVQvZU61/qKIrfNLXMf6N80GP3erf+HMMc9I7HUzq6zdDmBH9Ja6p4efZ5+8hRkd0
	 IdGamQte2wAiu0apeosnPkaltPuDCTZa4qv6tyII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DF8EF89693;
	Wed,  1 May 2019 13:56:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BEDBF896B7; Wed,  1 May 2019 13:56:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6041F89693
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 13:56:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6041F89693
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="A0TexfoK"; 
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="A0TexfoK"
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id E1C346086B; Wed,  1 May 2019 11:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1556711782;
 bh=SH+iBymOwJgn65YiYpdig2ngBAsVv4AI1dnrt+DJDCo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=A0TexfoKmLho9EFuES3KMEY8MDxzVJRSDdZQcVQVKhJRicy9sWWCUOpwLT1NeVEEH
 6oHIqRAQjRGfHNBHNnGTcb/TFietcMafa3egAMSoeuQUezMRhTe5l75uX7YrmWZm/r
 4AIMWtQxQnfY3z/4JEa5fRYZqFlMGbA/qUM3fKcg=
Received: from [10.204.79.15]
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: mojha@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 621FE60240;
 Wed,  1 May 2019 11:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1556711782;
 bh=SH+iBymOwJgn65YiYpdig2ngBAsVv4AI1dnrt+DJDCo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=A0TexfoKmLho9EFuES3KMEY8MDxzVJRSDdZQcVQVKhJRicy9sWWCUOpwLT1NeVEEH
 6oHIqRAQjRGfHNBHNnGTcb/TFietcMafa3egAMSoeuQUezMRhTe5l75uX7YrmWZm/r
 4AIMWtQxQnfY3z/4JEa5fRYZqFlMGbA/qUM3fKcg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 621FE60240
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=mojha@codeaurora.org
To: Colin King <colin.king@canonical.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Keyon Jie <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org
References: <20190501102308.30390-1-colin.king@canonical.com>
From: Mukesh Ojha <mojha@codeaurora.org>
Message-ID: <21cd03b5-c5be-dc93-cabb-980def737f87@codeaurora.org>
Date: Wed, 1 May 2019 17:26:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501102308.30390-1-colin.king@canonical.com>
Content-Language: en-US
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH][next] ASoC: SOF: Intel: fix spelling
 mistake "incompatble" -> "incompatible"
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


On 5/1/2019 3:53 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a hda_dsp_rom_msg message, fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh
> ---
>   sound/soc/sof/intel/hda.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
> index b8fc19790f3b..84baf275b467 100644
> --- a/sound/soc/sof/intel/hda.c
> +++ b/sound/soc/sof/intel/hda.c
> @@ -54,7 +54,7 @@ static const struct hda_dsp_msg_code hda_dsp_rom_msg[] = {
>   	{HDA_DSP_ROM_L2_CACHE_ERROR, "error: L2 cache error"},
>   	{HDA_DSP_ROM_LOAD_OFFSET_TO_SMALL, "error: load offset too small"},
>   	{HDA_DSP_ROM_API_PTR_INVALID, "error: API ptr invalid"},
> -	{HDA_DSP_ROM_BASEFW_INCOMPAT, "error: base fw incompatble"},
> +	{HDA_DSP_ROM_BASEFW_INCOMPAT, "error: base fw incompatible"},
>   	{HDA_DSP_ROM_UNHANDLED_INTERRUPT, "error: unhandled interrupt"},
>   	{HDA_DSP_ROM_MEMORY_HOLE_ECC, "error: ECC memory hole"},
>   	{HDA_DSP_ROM_KERNEL_EXCEPTION, "error: kernel exception"},
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
