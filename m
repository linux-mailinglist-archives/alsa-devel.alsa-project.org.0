Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E77426CD0
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Oct 2021 16:35:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 496C61664;
	Fri,  8 Oct 2021 16:34:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 496C61664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633703705;
	bh=Wy+/FH+we7NnmRMurV31Q1EfHYzdpATnvpnwTsW2sTs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h3+SMfyl1KX72C/BZN+zh/RRnlAVlXi75S70TxZbt5B2z9O8jk/6V1xEWVd11r+an
	 yqRxu/euVhx2J79gLHqOycE+FaLKIXyihiyB8N1s5cxoVmRkE2wr0RxVnmSAie1cfo
	 xfR+Xw+q22aO+qGK3zR7e/cdkt2msXcjquEOARzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE533F80240;
	Fri,  8 Oct 2021 16:33:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53A7BF80246; Fri,  8 Oct 2021 16:33:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41706F80229
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 16:33:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41706F80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="kZZWfT+P"
Received: by mail-oi1-x22a.google.com with SMTP id y207so10848146oia.11
 for <alsa-devel@alsa-project.org>; Fri, 08 Oct 2021 07:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QgfxwBmF1+monDAdjg0g2KuWwbKnod/mIT9QO6h2iro=;
 b=kZZWfT+PowKkZ01WdnR/B1jT/bbJbNn/nk3qm9dOEkSnkXGMSnwCE5oj5OyGVzAKlD
 8g7BU3Wbwxtygo0NG7m8z1G1h91Zn2H8Uzr6zZItNJ+ctbiNn8SP2V+Uei79rv/VMoD6
 ntkssCThEGK9QfAG36PGku21bWbycBVhaBd+4krVLC28qKTTxXCMLIp6Q6SLREmWI5YP
 poopFO0ZBSFYuieiYcNJh9uxZr4n3JzdYH53+9son7vCgu+hw17EoMk6xX/GYczF28lB
 NvWQ/hyqS4KHgD/S6OdDWD81XkhNT9Q0SJewpDCE1gE/AYAeqc74WsjlHK9Oj/CEj1Sk
 MeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QgfxwBmF1+monDAdjg0g2KuWwbKnod/mIT9QO6h2iro=;
 b=zGeU4WAqczmbhzB2XzEQPEc5Y6V0FW+ZUuntqFVQUzKMbx3OIbOGeNCDCp3yZ5aAF1
 f+3rJMrFG/2uSe4yF1EATUpotXD/0hunBz9ouwArmT/12gN31KXfFnOZEsYd+QfgZVl6
 Ajms0D+C/QsjMxdG1YLOHk5KEMP7ENWVeLWLlv0pEfO4vC2ToakyGOmF9ygQORuZIwCi
 gnhNjetGceA5qtaEkwSiaxnNmW6rlp32UVB3QwzC9NyzFicCmJPl8Qeqngy57IQeOSpE
 l46kB1lCqreYcxxYag7hD5iKfYmvGXIGqviKYuFmXEE0XS99yn0zVBk7wds5E4ppSAOA
 dJIA==
X-Gm-Message-State: AOAM530rteV+Pve1g29Mft6bqH2VpcSHpw3ydURhE/qKp/gOcX1sUvrv
 Qyo1LONpc6RwZhHHyHqVkSUlkQ==
X-Google-Smtp-Source: ABdhPJztPy3B1mNAjhJ8cMLMpGBuT+PpLTVRAsaup4KklmIJNTxLcde2Bhdop0OObqSvkVfXvO+m7Q==
X-Received: by 2002:aca:3656:: with SMTP id d83mr16497564oia.176.1633703614214; 
 Fri, 08 Oct 2021 07:33:34 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id u9sm720809oiu.19.2021.10.08.07.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 07:33:33 -0700 (PDT)
Date: Fri, 8 Oct 2021 07:35:12 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: Re: [PATCH v3] ASoC: qcom: soundwire: Enable soundwire bus clock for
 version 1.6
Message-ID: <YWBXIIjPP7Qunyvf@ripper>
References: <1633671232-30310-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1633671232-30310-1-git-send-email-srivasam@codeaurora.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <potturu@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 rohitkr@codeaurora.org, swboyd@chromium.org, judyhsiao@chromium.org,
 linux-kernel@vger.kernel.org
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

On Thu 07 Oct 22:33 PDT 2021, Srinivasa Rao Mandadapu wrote:

> Add support for soundwire 1.6 version to gate RX/TX bus clock.
> 

Are you really adding soundwire 1.6 support in order to gate RX/TX bus
clock?

Could it be that you're ungating the bus clock so that soundwire 1.6
starts working? The commit message should properly describe why you're
doing your change.

> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>

Venkata is the first who certified the origin of this patch, yet you're
the author. Either this should be From Venkata (i.e. git commit
--author) or perhaps you need a Co-developed-by here to say that you
collaborated on this and both certify its origin.

> ---
> Changes since v2:
>     -- Update error check after ioremap.

What about the other things I noted in v2?

> Changes since v1:
>     -- Add const name to mask value.
> 
>  drivers/soundwire/qcom.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 0ef79d6..bd6fabd 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -109,6 +109,7 @@
>  #define SWR_MAX_CMD_ID	14
>  #define MAX_FIFO_RD_RETRY 3
>  #define SWR_OVERFLOW_RETRY_COUNT 30
> +#define SWRM_HCTL_REG_MASK ~BIT(1)
>  
>  struct qcom_swrm_port_config {
>  	u8 si;
> @@ -127,6 +128,7 @@ struct qcom_swrm_ctrl {
>  	struct device *dev;
>  	struct regmap *regmap;
>  	void __iomem *mmio;
> +	char __iomem *swrm_hctl_reg;
>  	struct completion broadcast;
>  	struct completion enumeration;
>  	struct work_struct slave_work;
> @@ -610,6 +612,12 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>  	val = FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, ctrl->rows_index);
>  	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, ctrl->cols_index);
>  
> +	if (ctrl->swrm_hctl_reg) {
> +		val = ioread32(ctrl->swrm_hctl_reg);
> +		val &= SWRM_HCTL_REG_MASK;

Make a define with a name that clarifies what BIT(1) is and use that
here, hiding a magic number in an empty define isn't making this more
maintainable.

Essentially put the name of the bit in the register description in a
define and use that here.

> +		iowrite32(val, ctrl->swrm_hctl_reg);
> +	}
> +
>  	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
>  
>  	/* Enable Auto enumeration */
> @@ -1200,7 +1208,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  	struct qcom_swrm_ctrl *ctrl;
>  	const struct qcom_swrm_data *data;
>  	int ret;
> -	u32 val;
> +	int val, swrm_hctl_reg = 0;

Don't you get a warning from passing val as an int to a function that
takes a u32 pointer?

Also there's no reason to zero-initialize swrm_hctl_reg.

>  
>  	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
>  	if (!ctrl)
> @@ -1251,6 +1259,11 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  	ctrl->bus.port_ops = &qcom_swrm_port_ops;
>  	ctrl->bus.compute_params = &qcom_swrm_compute_params;
>  
> +	if (!of_property_read_u32(dev->of_node, "qcom,swrm-hctl-reg", &swrm_hctl_reg)) {

As I said in my feedback of v2, this property is not documented in the
DT binding.


But more important, upstream we do not approve of the downstream
methodology of having properties pointing to single registers in some
memory block somewhere.

Describe the hardware block that you reference fully in devicetree and
make a proper reference to it.

Unfortunately your patch lacks details necessary to know where this
register lives, so it's not possible for me to recommend a proper
design.

Regards,
Bjorn

> +		ctrl->swrm_hctl_reg = devm_ioremap(&pdev->dev, swrm_hctl_reg, 0x4);
> +		if (!ctrl->swrm_hctl_reg)
> +			return -ENODEV;
> +	}
>  	ret = qcom_swrm_get_port_config(ctrl);
>  	if (ret)
>  		goto err_clk;
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
