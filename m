Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 826EB2176BC
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 20:30:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2890A1607;
	Tue,  7 Jul 2020 20:29:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2890A1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594146614;
	bh=ngXcwYmLoqqD7u5NyieDHt4iKVngwEu5B9gimN72/OM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r07EAOWQnR8lI3amYghub1rSZSb3RlmDUTFkP5mG7P9715t90XQxUjOKDKpALtsRT
	 MwVSCHNkpRHTDMnzYZO5A08NAs1r6xcIcHi2AXjkrAdk8EuIihLOLyY4uTvlbtJhGm
	 Uv8Yi5AHXuDkw3id0f22Lbe5nVVBfdJMmn2da/bw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FD23F801F9;
	Tue,  7 Jul 2020 20:28:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71B75F80216; Tue,  7 Jul 2020 20:28:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C59CF800D0
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 20:28:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C59CF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="bS2w02uS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=HdjdBEuc09gbzMxr+upySCFBU+l5DWJracRk3eLkb5k=; b=bS2w02uSm9hW3I8+AMkkcpCEbn
 XN8pQCM13CWfkQ5uQ4ppHLpxPdZxCOI0PdbNq4Cc9uqWreqM3RSOwm/765ebRg7mHq0DgcUrBxWXj
 ZkwSeHfiVnrmqwB4gdgmDvdG+A941vlG2CSLf5OYI+2O6BEbvTX8mUCfFKpD+sV0MnoSEtEoLmcUu
 3zBMEV/xD3Lda8CQ427aiFG1pFyXh5q4ucuFJCquMmqi9uQx/yEnDB2A1ujfwyVLlvml+/kiFKkEF
 dkzfYpdcARrhYT1Rw+HRlkT2shnPNGRgf7eKmU+mVe2Xvoq6fGs7Koa+5l0CiOuiCM+7BSBOc2+fC
 ZOcMbgJg==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jssKE-0005ig-5g; Tue, 07 Jul 2020 18:28:15 +0000
Subject: Re: [PATCH] ASoC: amd: fixed kernel warnings
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, alsa-devel@alsa-project.org
References: <1594147044-25582-1-git-send-email-Vijendar.Mukunda@amd.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <9f2cde61-590d-6a68-295b-62f026f729b3@infradead.org>
Date: Tue, 7 Jul 2020 11:28:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1594147044-25582-1-git-send-email-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Alexander.Deucher@amd.com
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

On 7/7/20 11:37 AM, Vijendar Mukunda wrote:
> This patch will fix unused variables kernel warnings when
> CONFIG_ACPI is disabled.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
>  sound/soc/amd/renoir/rn-pci-acp3x.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
> index 165c93f..b943e59 100644
> --- a/sound/soc/amd/renoir/rn-pci-acp3x.c
> +++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
> @@ -168,8 +168,10 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
>  {
>  	struct acp_dev_data *adata;
>  	struct platform_device_info pdevinfo[ACP_DEVS];
> +#if defined(CONFIG_ACPI)
>  	acpi_handle handle;
>  	acpi_integer dmic_status;
> +#endif
>  	unsigned int irqflags;
>  	int ret, index;
>  	u32 addr;
> 


-- 
~Randy
