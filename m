Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B73FD8A0CC9
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Apr 2024 11:49:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC7F21926;
	Thu, 11 Apr 2024 11:49:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC7F21926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712828991;
	bh=VRFMeL1yR00t7d0ztD3oY+Cl355vb7WeMLBqLT3v9VQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OTA2Lbdr9jD8xoBIEho/ujQtdHzjhcsjXv1950Vfr0koTr11qBlPseVYn23H63gCY
	 OZhKAGnR/41FY9ISXQw4waMCawV6wt2h5VRRDHMHcIZCx+HLC2bfDZFDh9mzPAPH3A
	 KcsWeuIUiw/dIdZTzXrwR8DCWjaEeSgmM00po6ZQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55265F8059F; Thu, 11 Apr 2024 11:49:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DAB0AF8059F;
	Thu, 11 Apr 2024 11:49:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD9F4F80238; Thu, 11 Apr 2024 11:49:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8598BF8013D
	for <alsa-devel@alsa-project.org>; Thu, 11 Apr 2024 11:49:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8598BF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YrGS+pUv
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41551639550so52824265e9.2
        for <alsa-devel@alsa-project.org>;
 Thu, 11 Apr 2024 02:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712828946; x=1713433746;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wOKJQ8jt7AxSxSEOBwduE0YRgHhLkC7CChdOI3MJABQ=;
        b=YrGS+pUvFJbPv2O6KDK4MIddxyxl4medJtlHIUOmO8w7+0nn/oiW6vGCKEs68XT/lT
         zPE2p+WhB4rz3VCGVtUEcnxsbK82wSiVZWMCc8mcUOgWanJlAmJj4GbhAH5VaBuZe3N1
         RAWJ8yBWMa/nQiYNaJ+WJ29g2gt1cwwz403xltr/t2iq+9xY9vaI7Vf9LCYeQI7k4Nmj
         rojFJwObKUuPj4ZDwDVR+d9d100w261Wg+qpITV9aYeaf4BtgSZNTpbRP8mPAdBaNYkv
         SnIlUNdw2SqLxo/dWQjQMYHL2qpmVUVLY8aN9AwmjUT1dY87tGbUZ2e5Vioyp/MIXCU0
         WvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712828946; x=1713433746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wOKJQ8jt7AxSxSEOBwduE0YRgHhLkC7CChdOI3MJABQ=;
        b=Hs5PBbkCtbioqEWPbzwvJdefNRCTYJ6tFCuJejeeTPePEUiN8vf64CJ0/U8z+jePYz
         DL8DTcYjN2BUo6LsHRTY6R2/oVACKQURS2VSlqvIoPie8pFYQCLnACvqedC/saoS+l/5
         JKRj1pM4yXQyjO1Xl6rrC3OK24lmXsc1dD3kmPtRuMtfyq2HNmQSKgULC08IBrauMnSr
         AyjIlBAow2g219Y+cdjUe4y9REIn4iHtW5mD1i27THDuD5k3SXnVUeLy/gd/pIsDHzlQ
         2G0TgsuEW3w7ZuunBB0Qb27NQoFCpRY/a0moUHwuCoKfjH3tL/nOzdaOQ5TaKlB/kDgZ
         dSMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUUXwiPiOOcldn4imC6CKFhEDGZKdROx54n2kzP4yCyjw0OScD67nRxviNWOWlshdHjqUM6DWoL/yX/jdRctpjODD9EAFrXzT6ucw=
X-Gm-Message-State: AOJu0YxUJyH9AMIHRjGX2JxnQ8nwU76AiKRIb+jnkSLIVeiziF0BawNr
	BDt30tAxF9alKRxMQLAzfBlD0k7yhjw2gYG8Ykx0Bs02ZzzOPCswdct3KyXlwng=
X-Google-Smtp-Source: 
 AGHT+IGryICHdMrckhWGV5wzftvfmfRDF+oAPtzgI217Ncq8uwac0chRlOVAL098WWQo3OsWuKEmPQ==
X-Received: by 2002:a05:600c:4e94:b0:416:34c0:de9 with SMTP id
 f20-20020a05600c4e9400b0041634c00de9mr5015684wmq.29.1712828945966;
        Thu, 11 Apr 2024 02:49:05 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 f11-20020adfdb4b000000b0033e7a102cfesm1356008wrj.64.2024.04.11.02.49.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 02:49:05 -0700 (PDT)
Message-ID: <d2a4a91d-1b8a-4136-af30-50eb693423df@linaro.org>
Date: Thu, 11 Apr 2024 10:49:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 RESEND] slimbus: stream: Add null pointer check for
 client functions
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
 quic_anupkulk@quicinc.com, quic_cchiluve@quicinc.com
References: <20240327083214.29443-1-quic_vdadhani@quicinc.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240327083214.29443-1-quic_vdadhani@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JAPGX72VZIH6CJOOY57A2OBQLGTVCLJR
X-Message-ID-Hash: JAPGX72VZIH6CJOOY57A2OBQLGTVCLJR
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JAPGX72VZIH6CJOOY57A2OBQLGTVCLJR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thanks Viken for the patch,

On 27/03/2024 08:32, Viken Dadhaniya wrote:
> There is a possible scenario where client driver is calling
> slimbus stream APIs in incorrect sequence and it might lead to
> invalid null access of the stream pointer in slimbus
> enable/disable/prepare/unprepare/free function.
> 
> Fix this by checking validity of the stream before accessing in
> all function API’s exposed to client.
> 
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
>   drivers/slimbus/stream.c | 37 +++++++++++++++++++++++++++++++++----
>   1 file changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
> index 1d6b38657917..c5a436fd0952 100644
> --- a/drivers/slimbus/stream.c
> +++ b/drivers/slimbus/stream.c
> @@ -202,10 +202,16 @@ static int slim_get_prate_code(int rate)
>   int slim_stream_prepare(struct slim_stream_runtime *rt,
>   			struct slim_stream_config *cfg)
>   {
> -	struct slim_controller *ctrl = rt->dev->ctrl;
> +	struct slim_controller *ctrl;
>   	struct slim_port *port;
>   	int num_ports, i, port_id, prrate;
>   
> +	if (!rt || !cfg) {
> +		pr_err("%s: Stream or cfg is NULL, Check from client side\n", __func__);

Please use dev_err where possible


--srini
> +		return -EINVAL;
> +	}
> +
> +	ctrl = rt->dev->ctrl;
>   	if (rt->ports) {
>   		dev_err(&rt->dev->dev, "Stream already Prepared\n");
>   		return -EINVAL;
> @@ -358,9 +364,15 @@ int slim_stream_enable(struct slim_stream_runtime *stream)
>   {
>   	DEFINE_SLIM_BCAST_TXN(txn, SLIM_MSG_MC_BEGIN_RECONFIGURATION,
>   				3, SLIM_LA_MANAGER, NULL);
> -	struct slim_controller *ctrl = stream->dev->ctrl;
> +	struct slim_controller *ctrl;
>   	int ret, i;
>   
> +	if (!stream) {
> +		pr_err("%s: Stream is NULL, Check from client side\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	ctrl = stream->dev->ctrl;
>   	if (ctrl->enable_stream) {
>   		ret = ctrl->enable_stream(stream);
>   		if (ret)
> @@ -411,12 +423,18 @@ int slim_stream_disable(struct slim_stream_runtime *stream)
>   {
>   	DEFINE_SLIM_BCAST_TXN(txn, SLIM_MSG_MC_BEGIN_RECONFIGURATION,
>   				3, SLIM_LA_MANAGER, NULL);
> -	struct slim_controller *ctrl = stream->dev->ctrl;
> +	struct slim_controller *ctrl;
>   	int ret, i;
>   
> +	if (!stream) {
> +		pr_err("%s: Stream is NULL, Check from client side\n", __func__);
> +		return -EINVAL;
> +	}
> +
>   	if (!stream->ports || !stream->num_ports)
>   		return -EINVAL;
>   
> +	ctrl = stream->dev->ctrl;
>   	if (ctrl->disable_stream)
>   		ctrl->disable_stream(stream);
>   
> @@ -448,6 +466,11 @@ int slim_stream_unprepare(struct slim_stream_runtime *stream)
>   {
>   	int i;
>   
> +	if (!stream) {
> +		pr_err("%s: Stream is NULL, Check from client side\n", __func__);
> +		return -EINVAL;
> +	}
> +
>   	if (!stream->ports || !stream->num_ports)
>   		return -EINVAL;
>   
> @@ -476,8 +499,14 @@ EXPORT_SYMBOL_GPL(slim_stream_unprepare);
>    */
>   int slim_stream_free(struct slim_stream_runtime *stream)
>   {
> -	struct slim_device *sdev = stream->dev;
> +	struct slim_device *sdev;
> +
> +	if (!stream) {
> +		pr_err("%s: Stream is NULL, Check from client side\n", __func__);
> +		return -EINVAL;
> +	}
>   
> +	sdev = stream->dev;
>   	spin_lock(&sdev->stream_list_lock);
>   	list_del(&stream->node);
>   	spin_unlock(&sdev->stream_list_lock);
