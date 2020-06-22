Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C1220364C
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 14:00:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DEB716A0;
	Mon, 22 Jun 2020 13:59:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DEB716A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592827233;
	bh=vs4+pF8zCbPo5SX2paUNobqlBDYLTJ+ieB7qsSqtQK4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S3FZw4DpxsOBLeTmQ4qoauE+dEmV01kZz9uu3stdnABe4XbyI9SVtUPi9ShsJrImT
	 Q6Fe0IDlUKxjWMMkxSyNaLm48R7GNcpbONkNTnb4l9uagBKE3rKImN1lJ4mKDCj7SP
	 YJQP0UQRfHctCYy74nTT7f9oGcz4+BIeFaneMD3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80459F8015A;
	Mon, 22 Jun 2020 13:58:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED375F8015B; Mon, 22 Jun 2020 13:58:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3966F80157
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 13:58:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3966F80157
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="wvIhqatZ"
Received: from localhost (unknown [171.61.66.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A7649206EB;
 Mon, 22 Jun 2020 11:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592827121;
 bh=vs4+pF8zCbPo5SX2paUNobqlBDYLTJ+ieB7qsSqtQK4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wvIhqatZx4FwXxwifIernm1iEymbEe8Qp2gXIL7YcKv2LgXS4AFqw0GR6ksDlw8Do
 wxXtR9Mu6K0SCxpeDGJVoX/zMLaCX9aiiF9JUZ70iJny/AW1aPnDa0cBu46J6NLx5q
 s5Ug8wlWWpPlBfNzqqEOTLAQvP1jjypGb20Nw4zU=
Date: Mon, 22 Jun 2020 17:28:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: Re: [PATCH] soundwire: qcom: Constify static structs
Message-ID: <20200622115837.GL2324254@vkoul-mobl>
References: <20200609230029.69802-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200609230029.69802-1-rikard.falkeborn@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bjorn.andersson@linaro.org,
 agross@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 sanyog.r.kale@intel.com, linux-kernel@vger.kernel.org
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

On 10-06-20, 01:00, Rikard Falkeborn wrote:
> qcom_swrm_port_ops and qcom_swrm_ops are not modified and can be made
> const to allow the compiler to put them in read-only memory.
> 
> Before:
>    text    data     bss     dec     hex filename
>   18266    3056     256   21578    544a drivers/soundwire/qcom.o
> 
> After:
>    text    data     bss     dec     hex filename
>   18426    2896     256   21578    544a drivers/soundwire/qcom.o

Applied, thanks

> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> ---
>  drivers/soundwire/qcom.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index a1c2a44a3b4d..915c2cf0c274 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -406,13 +406,13 @@ static int qcom_swrm_port_enable(struct sdw_bus *bus,
>  	return ctrl->reg_write(ctrl, reg, val);
>  }
>  
> -static struct sdw_master_port_ops qcom_swrm_port_ops = {
> +static const struct sdw_master_port_ops qcom_swrm_port_ops = {
>  	.dpn_set_port_params = qcom_swrm_port_params,
>  	.dpn_set_port_transport_params = qcom_swrm_transport_params,
>  	.dpn_port_enable_ch = qcom_swrm_port_enable,
>  };
>  
> -static struct sdw_master_ops qcom_swrm_ops = {
> +static const struct sdw_master_ops qcom_swrm_ops = {
>  	.xfer_msg = qcom_swrm_xfer_msg,
>  	.pre_bank_switch = qcom_swrm_pre_bank_switch,
>  };
> -- 
> 2.27.0

-- 
~Vinod
