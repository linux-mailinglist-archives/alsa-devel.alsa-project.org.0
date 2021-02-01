Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FD730A9B6
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 15:28:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3590170A;
	Mon,  1 Feb 2021 15:27:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3590170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612189712;
	bh=pqjEEhqloi8AK1yI8NYNI4OIM4XG9J00Y6z6ao1n11s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EyfGQARVSQZB/fwm32+J2muB5CkeMWPlOeDlD+GISTHzW0DtQvdNBuLQsUzCB6ZG3
	 2m4tvYKHT1clgux/MXLJo3fxfApE5nFiew+rWOPYrVlDfgVlTkjKVnxqXb9VF0g0/Y
	 acD8uoR9opeqja/uC5fa2HE78dImqeu5DCpON1lc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B1F3F80154;
	Mon,  1 Feb 2021 15:27:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B24E5F800E2; Mon,  1 Feb 2021 15:26:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52E80F800E2
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 15:26:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52E80F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HZZvtM42"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E353064DD9;
 Mon,  1 Feb 2021 14:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612189610;
 bh=pqjEEhqloi8AK1yI8NYNI4OIM4XG9J00Y6z6ao1n11s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HZZvtM42t9e/NOIsdNGz2mOtSYMkRcLwyhi5IUZSkc+NKqIP31/5epfHX7YwX+dCp
 e6utYjFhUfbrsIq86Zqs1gzj/STZ/MHxylKK2X5m3cUrvp5wOIoUulfWS4kscdnsYT
 i7mnrgubsVWdUcVzWUpcLLcimTCVo/FBzRxlRUwh139UoTbQcgMhEx/Kr2TlW0BpzT
 DCoRt4NK9rlcQDDuTgjHKjmZKwuKExwiO5yUt/yepc+h9JEGx8V+kp/CSLeqTCyKoc
 1+VXmZVxStz6cmC0BE18FQXKynO2qZN/CU54fSZADMuDI/6VisqjerPlMpGz6U2n4j
 cAMyyxCQ5/rbg==
Date: Mon, 1 Feb 2021 19:56:46 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 5/6] soundwire: qcom: update register read/write routine
Message-ID: <20210201142646.GD2771@vkoul-mobl>
References: <20210129173248.5941-1-srinivas.kandagatla@linaro.org>
 <20210129173248.5941-6-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210129173248.5941-6-srinivas.kandagatla@linaro.org>
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

On 29-01-21, 17:32, Srinivas Kandagatla wrote:
> In the existing code every soundwire register read and register write
> are kinda blocked. Each of these are using a special command id that
> generates interrupt after it successfully finishes. This is really
> overhead, limiting and not really necessary unless we are doing
> something special.
> 
> We can simply read/write the fifo that should also give exactly
> what we need! This will also allow to read/write registers in
> interrupt context, which was not possible with the special

Okay but then why use a mutex ?

> command approach.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/soundwire/qcom.c | 148 +++++++++++++++++++++++++--------------
>  1 file changed, 96 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 83df15d83935..d61b204dc284 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -78,13 +78,15 @@
>  #define SWRM_SPECIAL_CMD_ID	0xF
>  #define MAX_FREQ_NUM		1
>  #define TIMEOUT_MS		(2 * HZ)
> -#define QCOM_SWRM_MAX_RD_LEN	0xf
> +#define QCOM_SWRM_MAX_RD_LEN	0x1
>  #define QCOM_SDW_MAX_PORTS	14
>  #define DEFAULT_CLK_FREQ	9600000
>  #define SWRM_MAX_DAIS		0xF
>  #define SWR_INVALID_PARAM 0xFF
>  #define SWR_HSTOP_MAX_VAL 0xF
>  #define SWR_HSTART_MIN_VAL 0x0
> +#define SWR_BROADCAST_CMD_ID    0x0F
> +#define MAX_FIFO_RD_FAIL_RETRY 3
>  
>  struct qcom_swrm_port_config {
>  	u8 si;
> @@ -104,11 +106,13 @@ struct qcom_swrm_ctrl {
>  	struct regmap *regmap;
>  	void __iomem *mmio;
>  	struct completion *comp;
> +	struct completion broadcast;
>  	struct work_struct slave_work;
>  	/* read/write lock */
>  	spinlock_t comp_lock;
>  	/* Port alloc/free lock */
>  	struct mutex port_lock;
> +	struct mutex io_lock;
>  	struct clk *hclk;
>  	u8 wr_cmd_id;
>  	u8 rd_cmd_id;
> @@ -122,6 +126,8 @@ struct qcom_swrm_ctrl {
>  	int rows_index;
>  	unsigned long dout_port_mask;
>  	unsigned long din_port_mask;
> +	u8 rcmd_id;
> +	u8 wcmd_id;
>  	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS];
>  	struct sdw_stream_runtime *sruntime[SWRM_MAX_DAIS];
>  	enum sdw_slave_status status[SDW_MAX_DEVICES];
> @@ -200,75 +206,111 @@ static int qcom_swrm_cpu_reg_write(struct qcom_swrm_ctrl *ctrl, int reg,
>  	return SDW_CMD_OK;
>  }
>  
> -static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *ctrl, u8 cmd_data,
> -				     u8 dev_addr, u16 reg_addr)
> +static u32 swrm_get_packed_reg_val(u8 *cmd_id, u8 cmd_data,
> +				 u8 dev_addr, u16 reg_addr)
>  {
> -	DECLARE_COMPLETION_ONSTACK(comp);
> -	unsigned long flags;
>  	u32 val;
> -	int ret;
> -
> -	spin_lock_irqsave(&ctrl->comp_lock, flags);
> -	ctrl->comp = &comp;
> -	spin_unlock_irqrestore(&ctrl->comp_lock, flags);
> -	val = SWRM_REG_VAL_PACK(cmd_data, dev_addr,
> -				SWRM_SPECIAL_CMD_ID, reg_addr);
> -	ret = ctrl->reg_write(ctrl, SWRM_CMD_FIFO_WR_CMD, val);
> -	if (ret)
> -		goto err;
> -
> -	ret = wait_for_completion_timeout(ctrl->comp,
> -					  msecs_to_jiffies(TIMEOUT_MS));
> +	u8 id = *cmd_id;
>  
> -	if (!ret)
> -		ret = SDW_CMD_IGNORED;
> -	else
> -		ret = SDW_CMD_OK;
> -err:
> -	spin_lock_irqsave(&ctrl->comp_lock, flags);
> -	ctrl->comp = NULL;
> -	spin_unlock_irqrestore(&ctrl->comp_lock, flags);
> +	if (id != SWR_BROADCAST_CMD_ID) {
> +		if (id < 14)
> +			id += 1;
> +		else
> +			id = 0;
> +		*cmd_id = id;
> +	}
> +	val = SWRM_REG_VAL_PACK(cmd_data, dev_addr, id, reg_addr);
>  
> -	return ret;
> +	return val;
>  }
>  
> -static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *ctrl,
> -				     u8 dev_addr, u16 reg_addr,
> -				     u32 len, u8 *rval)
> +
> +static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *swrm, u8 cmd_data,
> +				     u8 dev_addr, u16 reg_addr)
>  {
> -	int i, ret;
> +
>  	u32 val;
> -	DECLARE_COMPLETION_ONSTACK(comp);
> -	unsigned long flags;
> +	int ret = 0;
> +	u8 cmd_id = 0x0;
> +
> +	mutex_lock(&swrm->io_lock);
> +	if (dev_addr == SDW_BROADCAST_DEV_NUM) {
> +		cmd_id = SWR_BROADCAST_CMD_ID;
> +		val = swrm_get_packed_reg_val(&cmd_id, cmd_data,
> +					      dev_addr, reg_addr);
> +	} else {
> +		val = swrm_get_packed_reg_val(&swrm->wcmd_id, cmd_data,
> +					      dev_addr, reg_addr);
> +	}
>  
> -	spin_lock_irqsave(&ctrl->comp_lock, flags);
> -	ctrl->comp = &comp;
> -	spin_unlock_irqrestore(&ctrl->comp_lock, flags);
> +	swrm->reg_write(swrm, SWRM_CMD_FIFO_WR_CMD, val);
>  
> -	val = SWRM_REG_VAL_PACK(len, dev_addr, SWRM_SPECIAL_CMD_ID, reg_addr);
> -	ret = ctrl->reg_write(ctrl, SWRM_CMD_FIFO_RD_CMD, val);
> -	if (ret)
> -		goto err;
> +	/* version 1.3 or less */
> +	if (swrm->version_major == 1 && swrm->version_minor <= 3)
> +		usleep_range(150, 155);
>  
> -	ret = wait_for_completion_timeout(ctrl->comp,
> -					  msecs_to_jiffies(TIMEOUT_MS));
> +	if (cmd_id == SWR_BROADCAST_CMD_ID) {
> +		/*
> +		 * sleep for 10ms for MSM soundwire variant to allow broadcast
> +		 * command to complete.
> +		 */
> +		ret = wait_for_completion_timeout(&swrm->broadcast, (2 * HZ/10));
> +		if (!ret)
> +			ret = SDW_CMD_IGNORED;
> +		else
> +			ret = SDW_CMD_OK;
>  
> -	if (!ret) {
> -		ret = SDW_CMD_IGNORED;
> -		goto err;
>  	} else {
>  		ret = SDW_CMD_OK;
>  	}
> +	mutex_unlock(&swrm->io_lock);
> +	return ret;
> +}
>  
> -	for (i = 0; i < len; i++) {
> -		ctrl->reg_read(ctrl, SWRM_CMD_FIFO_RD_FIFO_ADDR, &val);
> -		rval[i] = val & 0xFF;
> +static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *swrm,
> +				     u8 dev_addr, u16 reg_addr,
> +				     u32 len, u8 *rval)
> +{
> +	u32 val;
> +	u32 retry_attempt = 0;
> +	u32 cmd_data;
> +	int ret = SDW_CMD_OK;
> +
> +	mutex_lock(&swrm->io_lock);
> +	val = swrm_get_packed_reg_val(&swrm->rcmd_id, len, dev_addr, reg_addr);
> +
> +	/* wait for FIFO RD to complete to avoid overflow */
> +	usleep_range(100, 105);
> +	swrm->reg_write(swrm, SWRM_CMD_FIFO_RD_CMD, val);
> +	/* wait for FIFO RD CMD complete to avoid overflow */
> +	usleep_range(250, 255);
> +
> +retry_read:

do while{} ?

> +
> +	swrm->reg_read(swrm, SWRM_CMD_FIFO_RD_FIFO_ADDR, &cmd_data);
> +	rval[0] = cmd_data & 0xFF;
> +
> +	if ((((cmd_data) & 0xF00) >> 8) != swrm->rcmd_id) {
> +		if (retry_attempt < MAX_FIFO_RD_FAIL_RETRY) {
> +			/* wait 500 us before retry on fifo read failure */
> +			usleep_range(500, 505);
> +			if (retry_attempt == (MAX_FIFO_RD_FAIL_RETRY - 1)) {

why not do this at the end if retry fails, that will make code look
neater

> +				swrm->reg_write(swrm, SWRM_CMD_FIFO_CMD, 0x1);
> +				swrm->reg_write(swrm, SWRM_CMD_FIFO_RD_CMD, val);
> +			}
> +			retry_attempt++;
> +			goto retry_read;
> +		} else {
> +			dev_err(swrm->dev,
> +					"failed to read fifo: reg: 0x%x, \
> +					rcmd_id: 0x%x, dev_num: 0x%x, cmd_data: 0x%x\n",
> +					reg_addr, swrm->rcmd_id,
> +					dev_addr, cmd_data);

Do you want to log retry as err..?

> +			ret = SDW_CMD_IGNORED;
> +		}
>  	}
>  
> -err:
> -	spin_lock_irqsave(&ctrl->comp_lock, flags);
> -	ctrl->comp = NULL;
> -	spin_unlock_irqrestore(&ctrl->comp_lock, flags);
> +	mutex_unlock(&swrm->io_lock);
>  
>  	return ret;
>  }
> @@ -949,6 +991,8 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  	dev_set_drvdata(&pdev->dev, ctrl);
>  	spin_lock_init(&ctrl->comp_lock);
>  	mutex_init(&ctrl->port_lock);
> +	mutex_init(&ctrl->io_lock);
> +	init_completion(&ctrl->broadcast);
>  	INIT_WORK(&ctrl->slave_work, qcom_swrm_slave_wq);
>  
>  	ctrl->bus.ops = &qcom_swrm_ops;
> -- 
> 2.21.0

-- 
~Vinod
