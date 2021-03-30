Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E874234E36F
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 10:44:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92A721671;
	Tue, 30 Mar 2021 10:43:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92A721671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617093882;
	bh=BzVGzxF47npQxoaPhUx9SUpW2ax62qrGKvP/1FIKvQY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HZR+mQDkWQiGufJopQmkrLnf2u0pUKyok6/KuLDMgPIq0NcwipNrWRz3AXqStQpYY
	 B6XKWm0V/xR4hzqkNPuvPR6AeFvK7ZZmwsH5IxyP7ff6V4+9ZkqWOfsCiY44IC2Pq8
	 n/b7ocNLVP7NKnmKNLI+XzsKYdFQ6Q+KU4U1Vj1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06F84F8026B;
	Tue, 30 Mar 2021 10:43:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 306B0F80240; Tue, 30 Mar 2021 10:43:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A177EF80141
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 10:43:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A177EF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VE57U+us"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 291ED61919;
 Tue, 30 Mar 2021 08:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617093789;
 bh=BzVGzxF47npQxoaPhUx9SUpW2ax62qrGKvP/1FIKvQY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VE57U+us+WY2P7L75NyhztMPzKv47qlr7zFsI5g4VEu/PGQgC7xXcGldZ5myuSx97
 FAFZuCT6YDQC14wM6lTEZ0NZqCkv6qqnY0SiBku0HR2MYI03pj7x2gn5UZDxkiQ9hl
 PRVayX9J4rxOfKc/3mksaBV8qzQVXmVY2nBu42qNs84OlFOYbJQWz5/mdysb95q1xQ
 reLoX0cMiTVDPaoo/N/ZU5uqILVqaAdQSYwpceTNJXvv49SqtXxpnPwMNI9dsAQMkm
 hHymudupflnovj1MSU7neN1lI/RcUocquJ/0RkEvWwuniyvf0n+UX0qnIVwcP+P9Ft
 NF8Fj6wAsEURw==
Date: Tue, 30 Mar 2021 14:13:04 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v5 6/9] soundwire: qcom: add support to new interrupts
Message-ID: <YGLkmM4QCjkpg8/6@vkoul-mobl.Dlink>
References: <20210326063944.31683-1-srinivas.kandagatla@linaro.org>
 <20210326063944.31683-7-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326063944.31683-7-srinivas.kandagatla@linaro.org>
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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

On 26-03-21, 06:39, Srinivas Kandagatla wrote:

> -	ctrl->reg_write(ctrl, SWRM_INTERRUPT_CLEAR, sts);
> +	do {
> +		for (i = 0; i < SWRM_INTERRUPT_MAX; i++) {
> +			value = intr_sts_masked & (1 << i);

BIT(i) istead of shifiting?

> +			if (!value)
> +				continue;
> +
> +			switch (value) {
> +			case SWRM_INTERRUPT_STATUS_SLAVE_PEND_IRQ:
> +				devnum = qcom_swrm_get_alert_slave_dev_num(swrm);
> +				if (devnum < 0) {
> +					dev_err_ratelimited(swrm->dev,
> +					    "no slave alert found.spurious interrupt\n");
> +				} else {
> +					sdw_handle_slave_status(&swrm->bus, swrm->status);
> +				}
>  
> -	if (sts & SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED)
> -		complete(&ctrl->broadcast);
> +				break;
> +			case SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED:
> +			case SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS:
> +				dev_err_ratelimited(swrm->dev, "%s: SWR new slave attached\n",
> +					__func__);

This should be debug
-- 
~Vinod
