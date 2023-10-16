Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F74C7CB316
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Oct 2023 20:57:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 697D082A;
	Mon, 16 Oct 2023 20:56:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 697D082A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697482659;
	bh=QcyXCskRPbOnWPMhi0EFFGjPvt4mFSLqbM7WXj8RRTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kDt6ggNvhREB+oPyjUPhdvTQGfi9Tc2PnQQiQlIvpj6wGXAPXTRmW15ntqwjg16K6
	 mwuqiGPTCOrihcLg+GgJOeyqYN+tnkJ7MnIWLFNGQ6rrjZALeBKSAajnomacPu/dSV
	 zMvBVHRk/LmL/YQoSLoB/QM2V5YtB0WNGU+hysEQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B9A9F80553; Mon, 16 Oct 2023 20:56:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A959F8024E;
	Mon, 16 Oct 2023 20:56:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9545F8025F; Mon, 16 Oct 2023 20:56:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0233CF80236
	for <alsa-devel@alsa-project.org>; Mon, 16 Oct 2023 20:56:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0233CF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uq+dK+u9
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 677A660F0C;
	Mon, 16 Oct 2023 18:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621C1C433C8;
	Mon, 16 Oct 2023 18:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697482565;
	bh=QcyXCskRPbOnWPMhi0EFFGjPvt4mFSLqbM7WXj8RRTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uq+dK+u9sQe6i12LxkLFZefC/LT+F/9isgSSyVWofETmERrXFkhy+LsslGY1SPxQV
	 aNRQG0xZYpZ5jC6v9GY7QL8u18a2CRGqIQeCyx/x5cfK82FJAT/K4vFTT6ykOqVrHj
	 BTmOtqrkGGTIw/ICGxhPbbQEM0fD7lZJ1BBaGjpsN1bCnC5HQq6DbRLUtRo1ZYux0I
	 ZFSJ69pSRxIexDVunyOx81Qn45YSlFJ25gPmSVu2bpvMCU7WOoKBI4Uv1sqWVE0zIL
	 oicyw/lhvaWlRK9akRu/yLwe5GlYv1URMtVBfGARefOiL3KaPRvTHfWfUqsOBfK4bb
	 JKL4Bgp1crJmg==
Date: Mon, 16 Oct 2023 11:59:52 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] soc: qcom: apr: Add __counted_by for struct
 apr_rx_buf and use struct_size()
Message-ID: <arc5clw7z2avnt2tbw5mw6lvrj3kjebmuarju4uqc2hxtuv7ow@htiko7yh3oyf>
References: <ZSRw6RNi3Crhd32H@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSRw6RNi3Crhd32H@work>
Message-ID-Hash: QW7ESWCCVKZWAFQ4GP7PZW36C5Y3B3C7
X-Message-ID-Hash: QW7ESWCCVKZWAFQ4GP7PZW36C5Y3B3C7
X-MailFrom: andersson@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QW7ESWCCVKZWAFQ4GP7PZW36C5Y3B3C7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Oct 09, 2023 at 03:30:17PM -0600, Gustavo A. R. Silva wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> While there, use struct_size() helper, instead of the open-coded
> version, to calculate the size for the allocation of the whole
> flexible structure, including of course, the flexible-array member.
> 
> This code was found with the help of Coccinelle, and audited and
> fixed manually.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied, thanks.

> ---
>  drivers/soc/qcom/apr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
> index 30f81d6d9d9d..1f8b315576a4 100644
> --- a/drivers/soc/qcom/apr.c
> +++ b/drivers/soc/qcom/apr.c
> @@ -41,7 +41,7 @@ struct packet_router {
>  struct apr_rx_buf {
>  	struct list_head node;
>  	int len;
> -	uint8_t buf[];
> +	uint8_t buf[] __counted_by(len);
>  };
>  
>  /**
> @@ -171,7 +171,7 @@ static int apr_callback(struct rpmsg_device *rpdev, void *buf,
>  		return -EINVAL;
>  	}
>  
> -	abuf = kzalloc(sizeof(*abuf) + len, GFP_ATOMIC);
> +	abuf = kzalloc(struct_size(abuf, buf, len), GFP_ATOMIC);
>  	if (!abuf)
>  		return -ENOMEM;
>  
> -- 
> 2.34.1
> 
