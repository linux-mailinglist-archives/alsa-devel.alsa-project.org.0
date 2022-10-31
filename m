Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9293C613D5A
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 19:29:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A572163D;
	Mon, 31 Oct 2022 19:28:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A572163D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667240976;
	bh=AMzKHEJNA/nArC6GjCMKtuTSt51GoYA3J2NDdr/aBlE=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EoufH+GhST0FxahS2HKYAw16Y7/EjFSb6kDoqdDXZDll1m21Bdt6J8JBdSPOrCbDE
	 GeWy9Mz4387pkpSkzAa0p0KyfNs8ucgsOvTaj1ctMrk0l5aRcIl6iq7htX0Pf61Qf5
	 F55ZcMwvphELFG/eY8kXF3ROO8jhuA7YCtpmk3A8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78650F8021D;
	Mon, 31 Oct 2022 19:28:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F9C8F80163; Mon, 31 Oct 2022 19:28:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B69F2F800F3
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 19:28:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B69F2F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="qqYhfaD5"
Received: by mail-wr1-x42b.google.com with SMTP id g12so17158296wrs.10
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 11:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B4jx6lz71cjbAqj8i3vewQJ41ySG6HKBqr7j1aeY43g=;
 b=qqYhfaD5lyJROnsh6ugh/wyOiNePZSHwojQdDVlTV64ynJrcUIB+ZRqlSuPiF1+6mW
 Kj+vYK1jyqIua3uSQgT/IpPPzx2KNxyuHbPasy9ydcWVdqZhMGXCIBb8+6CefOZzIPFF
 zwrdtXrZAzwnTAJ0DNn7o9ad9Wx8O1wUg0goZFEVva78pNB+E+JIzkVGIKS8Jf8Mk0Xu
 SsBuwRxZ6ZdXJ83bNZpEqukPR08KzUjKPneks9CitgtavGg1gCCwqV1H06qtuqBMdiJd
 bP8anB271DZ9YAzSXOknf87LJZRqaofjMAJz5RSX8sjBO15P6Due+H9jro3kJ8Wunj3X
 PJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B4jx6lz71cjbAqj8i3vewQJ41ySG6HKBqr7j1aeY43g=;
 b=vfAAHb7AUorNgeWSkRzJtJD+rYNZQIZYnofenCW8cBNPZGrZo8dBrKbHhOc4NlE15P
 nbBW7w6BSi1AoQfDd88rbXmX6jzux6JfbnRnzFEV4z4iSiaR/fCF8MjNWbMug3Cu9M7v
 FEWHyC8o5LeAjw+DQ6eW1z5wKBKc7s17m8bY47mf0W2HMRCXjikqzmTlq2/ZHOxoMPWW
 U6jRUs/A10EgmrMU9e+LQs37qpHjFDLBKqtC0TQ/0k0Xd25SPCIqMk05j2Eti+LZbAft
 dZFobfPqzaeJm2DYB+HXKlZvKCusUHrxNW7zIvTF51sdncgmWSlMKWS1+oE2b1Re7IYd
 M7fw==
X-Gm-Message-State: ACrzQf23pIHEBROfQzbbzdwHXl3BkWwilN+GH93AfION2C33NZrexcq/
 IS31KMRRX0ELXdR3fQnV1SaSuA==
X-Google-Smtp-Source: AMsMyM6dDfJB0ajj3vlZXJ+Dxub4JSTQTNoA2GsNgP4Pc7rMBRSHq4BT7+okVv7rRE3iPrWLFRnZAg==
X-Received: by 2002:a5d:4b45:0:b0:236:501f:7a41 with SMTP id
 w5-20020a5d4b45000000b00236501f7a41mr9092145wrs.516.1667240909319; 
 Mon, 31 Oct 2022 11:28:29 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 iv9-20020a05600c548900b003a84375d0d1sm8459882wmb.44.2022.10.31.11.28.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 11:28:28 -0700 (PDT)
Message-ID: <7ba5c01f-7b46-e031-0a82-290de08d1175@linaro.org>
Date: Mon, 31 Oct 2022 18:28:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/5] slimbus: stream: add checks for invalid
 unprepare/disable usage
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20220923155740.422411-1-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220923155740.422411-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 23/09/2022 16:57, Krzysztof Kozlowski wrote:
> slim_disable_stream() and slim_stream_unprepare() are exported, so add
> sanity checks preventing unmatched/invalid calls.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied all.
thanks,
--srini
>   drivers/slimbus/stream.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
> index 75f87b3d8b95..7bb073ca6006 100644
> --- a/drivers/slimbus/stream.c
> +++ b/drivers/slimbus/stream.c
> @@ -407,6 +407,9 @@ int slim_stream_disable(struct slim_stream_runtime *stream)
>   	struct slim_controller *ctrl = stream->dev->ctrl;
>   	int ret, i;
>   
> +	if (!stream->ports || !stream->num_ports)
> +		return -EINVAL;
> +
>   	if (ctrl->disable_stream)
>   		ctrl->disable_stream(stream);
>   
> @@ -438,6 +441,9 @@ int slim_stream_unprepare(struct slim_stream_runtime *stream)
>   {
>   	int i;
>   
> +	if (!stream->ports || !stream->num_ports)
> +		return -EINVAL;
> +
>   	for (i = 0; i < stream->num_ports; i++)
>   		slim_disconnect_port(stream, &stream->ports[i]);
>   
