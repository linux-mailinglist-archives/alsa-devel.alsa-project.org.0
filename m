Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD1F5A6BD5
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 20:11:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE22D168E;
	Tue, 30 Aug 2022 20:10:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE22D168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661883088;
	bh=TG9eRGyQfAqypBfZDj28dH5aY6SKrSmvfeJHkTfmZ1k=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cLtARggWGggizRnblU7JDPv7aISQgCLdEzku17uefB9Z+/AJNtod5VfJM/cnLqsTe
	 b5LAPsvaC8eIxqlsKi5flacDwYci8mE2j5X1urbIuIx6UmDKlsXGVABudmTynD17Mp
	 bRwbBYoPBRtsrZ2E4biAPqPLM8ExbvjiGkmqkDcM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09609F8032B;
	Tue, 30 Aug 2022 20:10:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4578EF8016B; Tue, 30 Aug 2022 20:10:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C38EF800F2
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 20:10:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C38EF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="W88hsrHU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=EpEl/DobhYcf1wL8+3jtYw7OG3wsK8lDs0hnWxAIwFI=; b=W88hsrHUWhMA6NG8LTU8d1pbxs
 +hNb4LUdFnMg9k2YxNI+RTvkRN4NddihmoSbATU6UyeI2TDM6IDP+8c7FhM20V7JBQjmU5ir8dKZb
 iztuhnFizxfFSGM6ONqL//pFt4oSTT0An9GyAFBYHWuymJOjYlEBFK2d6JM7qPuC6NRrkLQGfTyha
 yLAMX8TlAJVPcepZOreZvGaD6a7XZAgNMhdiCZ6I0AlawCse4kbhjwICtgnjkBpN63jXPT07vYap6
 cKMZ9FGN55oxDppqpCD8TU0wumlFgKrdn90TzbcpV2yiVbX+yxIx/PAgAeRVKlIjjRUN0lGS+Y2yL
 kec4tEEg==;
Received: from [2601:1c0:6280:3f0::a6b3]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oT5gj-0017CY-8C; Tue, 30 Aug 2022 18:10:13 +0000
Message-ID: <dd45cdec-ee8c-b699-2e23-064a866caa04@infradead.org>
Date: Tue, 30 Aug 2022 11:10:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] ASoC: amd: fix spelling mistake: "i.e" -> "i.e."
Content-Language: en-US
To: Syed Saba Kareem <Syed.SabaKareem@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220830132259.7759-1-Syed.SabaKareem@amd.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220830132259.7759-1-Syed.SabaKareem@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, Lucas Tanure <tanureal@opensource.cirrus.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Vijendar.Mukunda@amd.com, Julian Braha <julianbraha@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
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



On 8/30/22 06:22, Syed Saba Kareem wrote:
> From: Syed Saba kareem <Syed.SabaKareem@amd.com>
> 
> trivial fix to spelling mistake in Kconfig File.
> 
> Reported by : Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  sound/soc/amd/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
> index 68837d42736d..150786279257 100644
> --- a/sound/soc/amd/Kconfig
> +++ b/sound/soc/amd/Kconfig
> @@ -122,7 +122,7 @@ config SND_SOC_AMD_RPL_ACP6x
>          tristate "AMD Audio Coprocessor-v6.2 RPL support"
>          depends on X86 && PCI
>          help
> -          This option enables Audio Coprocessor i.e ACP v6.2 support on
> +          This option enables Audio Coprocessor i.e. ACP v6.2 support on
>            AMD RPL platform. By enabling this flag build will be
>            triggered for ACP PCI driver.
>            Say m if you have such a device.

-- 
~Randy
