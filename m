Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3FF7260C5
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 15:11:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFD666C1;
	Wed,  7 Jun 2023 15:10:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFD666C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686143495;
	bh=U6UMlyzDkgPx8am93KGtfw1FlG1r4wUGZioBIzE02VU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YSRwYShEBAyBokJh6v60DVpcLuT+a8/EF4Pk/Tl0XE2z3yBPCgJZ91BnmyvZoTc0O
	 BX0uJXkyfFCs9YY3Br0fRiLObDNDR3ZLUtvttRtexRupej9Bx1AbQafg5O2ti0ut/R
	 PSF39eJ5aiY9IsUwpEZHNAcqifVPAKhjVZgeCSbY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5763AF8016C; Wed,  7 Jun 2023 15:10:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B009BF8016C;
	Wed,  7 Jun 2023 15:10:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F12EF80199; Wed,  7 Jun 2023 15:10:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B6A3F80155
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 15:10:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B6A3F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=I3GG4+rK
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4AB5663F28;
	Wed,  7 Jun 2023 13:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1CE6C433D2;
	Wed,  7 Jun 2023 13:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686143424;
	bh=U6UMlyzDkgPx8am93KGtfw1FlG1r4wUGZioBIzE02VU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I3GG4+rKWWRdBfGfigs+YiHT2xXEuFwt0VgsL+2Z+ZnR36gPtccfQK1EZNzIuxC4x
	 Pox53+xizN4tytd4XIx2L60j9tBG27xGu77jKFzJTaPmRytthIJy3eOIFmPCIh3Np3
	 q5ft4GzD+8icYvAiZQm+N1TvQV5GRU9exmTDk0+/7AHmvunT+EspnZBBF8vtNHJOgY
	 H0eTgXMJwUuxfEwPPJCZaZxvUq0Km8LA2bK/2OTxIcTrMAS9PG9un4DXuNSMZ97mmd
	 q7qd4KhUPl7Q/ylKPffqow2XHheC6ieZWQK0uhvHwNrLbXmamD/dXjRCyJp0Sbbln9
	 7SEyhTBD+sB5Q==
Date: Wed, 7 Jun 2023 18:40:20 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] soundwire: qcom: fix storing port config out-of-bounds
Message-ID: <ZICBvP33XyOswWFM@matsya>
References: <20230601102525.609627-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601102525.609627-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: C56BWOY3DRELWOJ2MSKSQ7XLWVJS574B
X-Message-ID-Hash: C56BWOY3DRELWOJ2MSKSQ7XLWVJS574B
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C56BWOY3DRELWOJ2MSKSQ7XLWVJS574B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 01-06-23, 12:25, Krzysztof Kozlowski wrote:
> The 'qcom_swrm_ctrl->pconfig' has size of QCOM_SDW_MAX_PORTS (14),
> however we index it starting from 1, not 0, to match real port numbers.
> This can lead to writing port config past 'pconfig' bounds and
> overwriting next member of 'qcom_swrm_ctrl' struct.  Reported also by
> smatch:
> 
>   drivers/soundwire/qcom.c:1269 qcom_swrm_get_port_config() error: buffer overflow 'ctrl->pconfig' 14 <= 14
> 
> Fixes: 9916c02ccd74 ("soundwire: qcom: cleanup internal port config indexing")
> Cc: <stable@vger.kernel.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://lore.kernel.org/r/202305201301.sCJ8UDKV-lkp@intel.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/soundwire/qcom.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 7cb1b7eba814..88a772075907 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -202,7 +202,8 @@ struct qcom_swrm_ctrl {
>  	u32 intr_mask;
>  	u8 rcmd_id;
>  	u8 wcmd_id;
> -	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS];
> +	/* Port numbers are 1 - 14 */
> +	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS + 1];

Better use SDW_MAX_PORTS ?

>  	struct sdw_stream_runtime *sruntime[SWRM_MAX_DAIS];
>  	enum sdw_slave_status status[SDW_MAX_DEVICES + 1];
>  	int (*reg_read)(struct qcom_swrm_ctrl *ctrl, int reg, u32 *val);
> -- 
> 2.34.1

-- 
~Vinod
