Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFE8217152
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 17:37:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB3D315E0;
	Tue,  7 Jul 2020 17:36:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB3D315E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594136228;
	bh=a0T6ft6shyocwqSr39cTZCmpgAAfdPrbzkMPJK3i0R8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AIYaBV2C4YMgzJ7IAu8HT/sydAe7Niof6KIdIFP1FtvzqkDC8DDczttoQv2XP8jbT
	 ZIZ8EGVSs9idNsVnPyfwNcz7Egoef1tJfvygiSyAKsRIgMYVprXB2pu4lRlKCjX2RY
	 Jltcd12EZABTUo58hdwePoA0VfLudV5+j7d0psx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4E3CF80257;
	Tue,  7 Jul 2020 17:35:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 518DCF80216; Tue,  7 Jul 2020 17:35:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41B96F800DF
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 17:35:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41B96F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sYm6HN6v"
Received: from localhost (unknown [122.182.251.219])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1D26B20663;
 Tue,  7 Jul 2020 15:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594136111;
 bh=a0T6ft6shyocwqSr39cTZCmpgAAfdPrbzkMPJK3i0R8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sYm6HN6vQNCSP8UaYveiQFdSOWg03VElJwFBZ/y4+Ppeu0Ytl2U6XDlE0EvmYrjRW
 91cf5/ldZcLbuLKxK/v8kKOfFVB+NPOlkmTGh3lyZMKpoSkKlH6ujFs9VNee/3OIEK
 K51bI2K/WdkIBxpv2+2ZefGbYV0c41OmxPKCKqjQ=
Date: Tue, 7 Jul 2020 21:05:05 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 13/28] ASoC: qcom: qdsp6: q6asm: Provide documentation
 for WMA 'codec_profile'
Message-ID: <20200707153505.GA5155@vkoul-mobl>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
 <20200707101642.1747944-14-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200707101642.1747944-14-lee.jones@linaro.org>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 lgirdwood@gmail.com, Patrick Lai <plai@codeaurora.org>,
 linux-kernel@vger.kernel.org, tiwai@suse.com, broonie@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-kernel@lists.infradead.org
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

On 07-07-20, 11:16, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  sound/soc/qcom/qdsp6/q6asm.c:924: warning: Function parameter or member 'codec_profile' not described in 'q6asm_open_write'
> 
> Cc: Patrick Lai <plai@codeaurora.org>
> Cc: Banajit Goswami <bgoswami@codeaurora.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  sound/soc/qcom/qdsp6/q6asm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
> index ae4b2cabdf2d6..58720b18fc8c8 100644
> --- a/sound/soc/qcom/qdsp6/q6asm.c
> +++ b/sound/soc/qcom/qdsp6/q6asm.c
> @@ -915,6 +915,7 @@ static int q6asm_ac_send_cmd_sync(struct audio_client *ac, struct apr_pkt *pkt)
>   *
>   * @ac: audio client pointer
>   * @format: audio sample format
> + * @codec_profile: profile to use when WMA

Yes it is used with WMA only for now, but we should describe in
generically as "Audio codec profile"

>   * @bits_per_sample: bits per sample
>   *
>   * Return: Will be an negative value on error or zero on success
> -- 
> 2.25.1

-- 
~Vinod
