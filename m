Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9CA59CE23
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 03:56:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1289C1650;
	Tue, 23 Aug 2022 03:56:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1289C1650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661219812;
	bh=9Xr/GO4MP6uIt0pO4znPPlABzaxklumcSOxGaWONvlE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WXcfvpi1PweQUrN0uGU0aSnYjgDfTmfPvee+AGeE4LMHv7bfrNUOsXYE+s1jkBLKf
	 VUOUV/80PU6uEYM+20KjBDq39LrBradhe2AmQo/+US7HM77l4xo4iZooNsZuhrHKYL
	 vYPsMHlOzTKCQAZa+TNRdyOU/vJTqEZyKD+gCoXI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9283AF8027B;
	Tue, 23 Aug 2022 03:55:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68CD8F8020D; Tue, 23 Aug 2022 03:55:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA4A1F800A7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 03:55:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA4A1F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Qg1DpWCq"
Received: by mail-lj1-x234.google.com with SMTP id u24so6656044lji.0
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 18:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=19O0gorXp5J+0lL6JXxlboEo85fJNaFBCpEqkfyC7tc=;
 b=Qg1DpWCqaEzaeo/HW0ekS2Acj0o2kbP0huD/yNFfi0tVwJDdS6MT5B2vcEzWPu5JXt
 B1xEiDT2IMkLha4zqHXnkZAC/rb5+IMD7FxEOyPWr+UBSlKlqe/xM/L8XqGqUNWRFZxf
 KTIoA1fzJY3gASghQlIlvkK2vU6zmbiCg66aiMyA/i7FNTWEWkjrdfdpccUSgkNSC5HU
 ekxMU6SJy1k6BtXHRjz9eQic6idx5wWJV6UvRP2mz/GyEGPsTxFk+GfPSJmuWmfNhouI
 TFfV4UYJOV68AoeRPXx8+M8P2hbjkRLbGTotIX3AnE+SlAmMiXeMptE6KPAX0AXdpclg
 tAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=19O0gorXp5J+0lL6JXxlboEo85fJNaFBCpEqkfyC7tc=;
 b=S2Dn8uAIg4SaN0C9MYW4rMg51IHQW7QjfECV58zDCs30oupdHgWApmmvAvgiFYIl9X
 8C00oeeSHqkvSfpTUI6XAwidzq2dtBbm5yGLjhkRVuh8mWiwc/m5wldXnCdmEY38mKYC
 30SgLBiOr+nSTYDcBvnDOsFkweXuwY+++vRaGSflZ6qoIRGV5XZDB5xrXKujG8hIaJBE
 towUegP3OjPLN2GMw+kqD6PiScith0E3thd6cTTDdT9SRIyLZg7y+02KDHd2uX5yrwpV
 mOpvuR0wIyU7sL66v+3pOoApvjETyo5DmeWqEFjLsRmNx91K67sBqnOgnqqyqvEIyKyy
 9rtA==
X-Gm-Message-State: ACgBeo1esi5turFGLt57rCTjKOH794msD6MUc3v+aTDqllAtK+yb3I8n
 gWoPhQu2Ss/PlAgw1/XAv07pclFFMbvvAI/J7ys=
X-Google-Smtp-Source: AA6agR5xph1tzBIvmf0WnRK50M+0ev6Xrl6l9HvcKqYlcwtbrMGULNr3K/wHYleoNCS8LPjsRwfSQYin9P0eQED4NW4=
X-Received: by 2002:a2e:b809:0:b0:261:be83:a2b0 with SMTP id
 u9-20020a2eb809000000b00261be83a2b0mr5027207ljo.219.1661219741257; Mon, 22
 Aug 2022 18:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220822184239.169757-1-pierre-louis.bossart@linux.intel.com>
 <20220822184239.169757-5-pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220822184239.169757-5-pierre-louis.bossart@linux.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 23 Aug 2022 09:55:29 +0800
Message-ID: <CAA+D8AOZoJesUw=xMGwJ+Pth2-9DoxaQbr82tsCQbBjnJfuotQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] ASoC: fsl: fsl-utils: remove useless assignment
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org,
 "open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Takashi Iwai <tiwai@suse.de>, Fabio Estevam <festevam@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chao Song <chao.song@intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
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

On Tue, Aug 23, 2022 at 2:43 AM Pierre-Louis Bossart <
pierre-louis.bossart@linux.intel.com> wrote:

> cppcheck warning:
>
> sound/soc/fsl/fsl_utils.c:127:10: style: Variable 'ret' is assigned a
> value that is never used. [unreadVariable]
>  int ret = 0;
>          ^
>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Reviewed-by: Chao Song <chao.song@intel.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/fsl_utils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_utils.c b/sound/soc/fsl/fsl_utils.c
> index d0fc430f7033d..a5ab27c2f711c 100644
> --- a/sound/soc/fsl/fsl_utils.c
> +++ b/sound/soc/fsl/fsl_utils.c
> @@ -124,7 +124,7 @@ void fsl_asoc_reparent_pll_clocks(struct device *dev,
> struct clk *clk,
>  {
>         struct clk *p, *pll = NULL, *npll = NULL;
>         bool reparent = false;
> -       int ret = 0;
> +       int ret;
>
>         if (!clk || !pll8k_clk || !pll11k_clk)
>                 return;
> --
> 2.34.1
>
>
