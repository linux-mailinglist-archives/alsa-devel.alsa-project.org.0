Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 545BB263D82
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 08:41:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD0921674;
	Thu, 10 Sep 2020 08:40:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD0921674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599720100;
	bh=t2SyhHS+Ohd0sGWn6FEslrgMgIs2UDqjysK6cgXfMYo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dF8rvEXX49+da/0uHlYUoC2jBrdWlNr2D0pne+XVb8x4f8q7pPDo0JpdCfEXnEWno
	 k+dRNMHtqk6v0iKKn9183VzW1tAYJym1t+wdSBPxIq8CYXkKpTbjorKT55Yjsd0Cn+
	 DlcdReUavxGKBbI6L4T2qhcF2zwAcs3R+Ls9+NbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B051F801F2;
	Thu, 10 Sep 2020 08:39:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AD48F80264; Thu, 10 Sep 2020 08:39:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A9CAF800E9
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 08:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A9CAF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aIihw9ny"
Received: from localhost (unknown [122.179.50.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 188872222B;
 Thu, 10 Sep 2020 06:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599719987;
 bh=t2SyhHS+Ohd0sGWn6FEslrgMgIs2UDqjysK6cgXfMYo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aIihw9nyRXIuI9jthRt+2eE6WGIfqmusB3vrU2veny44vxhfhVC2pSM5ZmTsc+Rbs
 5FP0KkQoBVKABmPSh8J/9OwTryW8LSPwQsg88lZzt5xhdfDD0bb395EeT5IZazR03d
 jFJJEm/FfswnnqykbLW4awC/XzA+b/Ie1ksDumKQ=
Date: Thu, 10 Sep 2020 12:09:40 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 2/2] soundwire: qcom: get max rows and cols info from
 compatible
Message-ID: <20200910063940.GR77521@vkoul-mobl>
References: <20200909160912.3656-1-srinivas.kandagatla@linaro.org>
 <20200909160912.3656-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909160912.3656-3-srinivas.kandagatla@linaro.org>
Cc: sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
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

On 09-09-20, 17:09, Srinivas Kandagatla wrote:
> currently the max rows and cols values are hardcoded. In reality
> these values depend on the IP version. So get these based on
> device tree compatible strings.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/soundwire/qcom.c | 46 +++++++++++++++++++++++++++-------------
>  1 file changed, 31 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 1ec0ee931f5b..03c5bc05fc6e 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -69,11 +69,6 @@
>  #define SWRM_REG_VAL_PACK(data, dev, id, reg)	\
>  			((reg) | ((id) << 16) | ((dev) << 20) | ((data) << 24))
>  
> -#define SWRM_MAX_ROW_VAL	0 /* Rows = 48 */
> -#define SWRM_DEFAULT_ROWS	48
> -#define SWRM_MIN_COL_VAL	0 /* Cols = 2 */
> -#define SWRM_DEFAULT_COL	16
> -#define SWRM_MAX_COL_VAL	7
>  #define SWRM_SPECIAL_CMD_ID	0xF
>  #define MAX_FREQ_NUM		1
>  #define TIMEOUT_MS		(2 * HZ)
> @@ -107,6 +102,8 @@ struct qcom_swrm_ctrl {
>  	unsigned int version;
>  	int num_din_ports;
>  	int num_dout_ports;
> +	int cols_index;
> +	int rows_index;
>  	unsigned long dout_port_mask;
>  	unsigned long din_port_mask;
>  	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS];
> @@ -116,6 +113,21 @@ struct qcom_swrm_ctrl {
>  	int (*reg_write)(struct qcom_swrm_ctrl *ctrl, int reg, int val);
>  };
>  
> +struct qcom_swrm_data {
> +	int default_cols;
> +	int default_rows;

unsigned int for these?

> +};
> +
> +static struct qcom_swrm_data swrm_v1_3_data = {
> +	.default_rows = 48,
> +	.default_cols = 16,
> +};
> +
> +static struct qcom_swrm_data swrm_v1_5_data = {
> +	.default_rows = 50,
> +	.default_cols = 16,
> +};
> +
>  #define to_qcom_sdw(b)	container_of(b, struct qcom_swrm_ctrl, bus)
>  
>  static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
> @@ -302,8 +314,8 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>  	u32 val;
>  
>  	/* Clear Rows and Cols */
> -	val = (SWRM_MAX_ROW_VAL << SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT |
> -	       SWRM_MIN_COL_VAL << SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT);
> +	val = ctrl->rows_index << SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT |
> +		ctrl->cols_index << SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT;

use FIELD_{GET|SET} / u32_encode_bits for these

Please rebase on sdw-next, this has already been updated in next

>  
>  	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
>  
> @@ -382,8 +394,8 @@ static int qcom_swrm_pre_bank_switch(struct sdw_bus *bus)
>  	val &= ~SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK;
>  	val &= ~SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK;
>  
> -	val |= (SWRM_MAX_ROW_VAL << SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT |
> -		SWRM_MAX_COL_VAL << SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT);
> +	val |= ctrl->rows_index << SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT |
> +	       ctrl->cols_index << SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT;
>  
>  	return ctrl->reg_write(ctrl, reg, val);
>  }
> @@ -784,6 +796,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  	struct sdw_master_prop *prop;
>  	struct sdw_bus_params *params;
>  	struct qcom_swrm_ctrl *ctrl;
> +	const struct qcom_swrm_data *data;
>  	struct resource *res;
>  	int ret;
>  	u32 val;
> @@ -792,6 +805,9 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  	if (!ctrl)
>  		return -ENOMEM;
>  
> +	data = of_device_get_match_data(dev);

how about checking data is valid?

> +	ctrl->rows_index = sdw_find_row_index(data->default_rows);
> +	ctrl->cols_index = sdw_find_col_index(data->default_cols);
>  #ifdef CONFIG_SLIMBUS
>  	if (dev->parent->bus == &slimbus_bus) {
>  #else
> @@ -844,8 +860,8 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  	params = &ctrl->bus.params;
>  	params->max_dr_freq = DEFAULT_CLK_FREQ;
>  	params->curr_dr_freq = DEFAULT_CLK_FREQ;
> -	params->col = SWRM_DEFAULT_COL;
> -	params->row = SWRM_DEFAULT_ROWS;
> +	params->col = data->default_cols;
> +	params->row = data->default_rows;
>  	ctrl->reg_read(ctrl, SWRM_MCP_STATUS, &val);
>  	params->curr_bank = val & SWRM_MCP_STATUS_BANK_NUM_MASK;
>  	params->next_bank = !params->curr_bank;
> @@ -855,8 +871,8 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  	prop->num_clk_gears = 0;
>  	prop->num_clk_freq = MAX_FREQ_NUM;
>  	prop->clk_freq = &qcom_swrm_freq_tbl[0];
> -	prop->default_col = SWRM_DEFAULT_COL;
> -	prop->default_row = SWRM_DEFAULT_ROWS;
> +	prop->default_col = data->default_cols;
> +	prop->default_row = data->default_rows;
>  
>  	ctrl->reg_read(ctrl, SWRM_COMP_HW_VERSION, &ctrl->version);
>  
> @@ -907,8 +923,8 @@ static int qcom_swrm_remove(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id qcom_swrm_of_match[] = {
> -	{ .compatible = "qcom,soundwire-v1.3.0", },
> -	{ .compatible = "qcom,soundwire-v1.5.1", },
> +	{ .compatible = "qcom,soundwire-v1.3.0", .data = &swrm_v1_3_data },
> +	{ .compatible = "qcom,soundwire-v1.5.1", .data = &swrm_v1_5_data },
>  	{/* sentinel */},
>  };
>  
> -- 
> 2.21.0

-- 
~Vinod
