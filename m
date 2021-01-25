Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A513023B6
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jan 2021 11:32:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8EAD17A2;
	Mon, 25 Jan 2021 11:31:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8EAD17A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611570738;
	bh=G5+ja1bepIh/AytgsfYHAVeWLb9M0/+mQqcWNTYRYz4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dsx3aJaivGiUktWUmopETfdoyvybL7q7JWh4CQWlMDg270rqFw9ywP7jbzJhY4auE
	 uxCF/yyU9uIokYZSQO/KiPoIZ+7IyvYI3Q3fKhkMRHHD+ORwbEFt4rHYXmGevizwBG
	 cDQ2uvYX9QCJxwVlqc6Uv+XF4q+kaw7vUFZmI0Mk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0EE6F8012D;
	Mon, 25 Jan 2021 11:30:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A19A6F80259; Mon, 25 Jan 2021 11:30:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A762FF8014D
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 11:30:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A762FF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="HzLV5DTB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1611570630;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:From:
 Subject:Sender;
 bh=A3/et8+XCqT3dn72qVbKlwaXj2qTvpiKLtiB6zWQ3rw=;
 b=HzLV5DTB1XDcvpJWvExkQZHUvsrYV1Vdn2I+9t/cFZFhal4j6kVnvlUXeYTPrx4bEE
 S2HTlRLbmnjVGqZT1m1qsOcfrvUDZsPdw39FzVc107AhZn2XfnU8UWUb2HDcq1dQLn4i
 0CoWUxsFIIQq2ayM/H2juuAnIamKsxAL1eRQFDVTlrpxTSRIcOmwu7It+tilEBwEimGI
 WPIW69fffc3XF4Ru1slxsovLm7lVNQqVCfvLxvI3JDv4azexRtXy95ptDO0jKpX3X20D
 ASDFPaFTDu4Cl5SHtOxJaZjwA8gAKisHg2f2uoT1+KzvzHxe85Q2keO0TPg1xzZI07rB
 0fxQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9IczEaYo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
 with ESMTPSA id R0a218x0PAUTl5l
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 25 Jan 2021 11:30:29 +0100 (CET)
Date: Mon, 25 Jan 2021 11:30:19 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Jun Nie <jun.nie@linaro.org>
Subject: Re: [PATCH v2] ASoC: qcom: lpass: Fix i2s ctl register bit map
Message-ID: <YA6dsJTmVcv1TKBZ@gerhold.net>
References: <20210120024955.3911891-1-jun.nie@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120024955.3911891-1-jun.nie@linaro.org>
Cc: plai@codeaurora.org, bgoswami@codeaurora.org,
 srinivas.kandagatla@linaro.org, alsa-devel@alsa-project.org
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

On Wed, Jan 20, 2021 at 10:49:55AM +0800, Jun Nie wrote:
> Fix bitwidth mapping in i2s ctl register per APQ8016 document.
> Fixes: b5022a36d28f ("ASoC: qcom: lpass: Use regmap_field for i2sctl and
> dmactl registers")
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>

Thanks for spotting this, I guess this did not cause me problems yet
because I use SNDRV_PCM_FMTBIT_S16 everywhere.

Anyway, this looks correct according to the datasheet:
Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

> ---
>  sound/soc/qcom/lpass-apq8016.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
> index 8507ef8f6679..3efa133d1c64 100644
> --- a/sound/soc/qcom/lpass-apq8016.c
> +++ b/sound/soc/qcom/lpass-apq8016.c
> @@ -250,7 +250,7 @@ static struct lpass_variant apq8016_data = {
>  	.micmode		= REG_FIELD_ID(0x1000, 4, 7, 4, 0x1000),
>  	.micmono		= REG_FIELD_ID(0x1000, 3, 3, 4, 0x1000),
>  	.wssrc			= REG_FIELD_ID(0x1000, 2, 2, 4, 0x1000),
> -	.bitwidth		= REG_FIELD_ID(0x1000, 0, 0, 4, 0x1000),
> +	.bitwidth		= REG_FIELD_ID(0x1000, 0, 1, 4, 0x1000),
>  
>  	.rdma_dyncclk		= REG_FIELD_ID(0x8400, 12, 12, 2, 0x1000),
>  	.rdma_bursten		= REG_FIELD_ID(0x8400, 11, 11, 2, 0x1000),
> -- 
> 2.25.1
> 
