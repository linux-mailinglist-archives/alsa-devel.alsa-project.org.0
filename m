Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F393330A9CE
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 15:33:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C4901768;
	Mon,  1 Feb 2021 15:32:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C4901768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612189983;
	bh=bCCyXIJyYjfQMd4EVZhPIo9+AaMpMaQCa5ve/mIIouM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HJrz+Czvq6j3CVbt29IvDzCrQflkbd5T37oNnXoxwS/wfEL+mxFkPlL2Lh7vU4EZT
	 qZXygdH88JCcCpV6QHLfU3QLcnrjbOwcwghl735Rgzvl9AR+4cC0viOeiFVRcAHN4S
	 55j5QGooiRqw6DSHxOXLalRBVd/wJl8sPll9XdVg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB41DF80154;
	Mon,  1 Feb 2021 15:31:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BFBCF80153; Mon,  1 Feb 2021 15:31:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3ED9F800E2
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 15:31:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3ED9F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VXwycjkV"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F2CF60C41;
 Mon,  1 Feb 2021 14:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612189881;
 bh=bCCyXIJyYjfQMd4EVZhPIo9+AaMpMaQCa5ve/mIIouM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VXwycjkVhuvvrLIQXC0QBYGpVy3zzLuevYiKNuUFXsvFBiamx5N2nl/b7qB8SaF/P
 MwnB/7NnRm1dZPN0cB7tw/MdjuJwfKwNIFo7B5ftONmvjYDvq+gBuXXD5vx6nh2VEg
 kuofRZa1PTu4oxzAo0u1MO//wh6FQb8lmIT9urbPn4Ns++rvs00/mqcM4YDbQpimu9
 sByq4yGjIZfdb2rLZSAHCpzbHt+rjq3bUU/ADva2OJ3iJFrEVuvsSvYPIA68XUaG0f
 EDvoCokyidFoJ1IHx2sarz5b8QX4cUDB2wyRduPe7JjylX78AfelukwXnja4QqsIvb
 BX5J1eMTTfb6g==
Date: Mon, 1 Feb 2021 20:01:16 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 6/6] soundwire: qcom: add support to new interrupts
Message-ID: <20210201143116.GE2771@vkoul-mobl>
References: <20210129173248.5941-1-srinivas.kandagatla@linaro.org>
 <20210129173248.5941-7-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210129173248.5941-7-srinivas.kandagatla@linaro.org>
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
> Add support to new interrupts and update irq routine in a way
> to deal with multiple pending interrupts with in a single interrupt!
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/soundwire/qcom.c | 191 ++++++++++++++++++++++++++++++---------
>  1 file changed, 146 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index d61b204dc284..c699bd51d29a 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -28,10 +28,21 @@
>  #define SWRM_COMP_PARAMS_DIN_PORTS_MASK				GENMASK(9, 5)
>  #define SWRM_INTERRUPT_STATUS					0x200
>  #define SWRM_INTERRUPT_STATUS_RMSK				GENMASK(16, 0)
> +#define SWRM_INTERRUPT_STATUS_SLAVE_PEND_IRQ			BIT(0)
>  #define SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED		BIT(1)
>  #define SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS		BIT(2)
> +#define SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET			BIT(3)
> +#define SWRM_INTERRUPT_STATUS_RD_FIFO_OVERFLOW			BIT(4)
> +#define SWRM_INTERRUPT_STATUS_RD_FIFO_UNDERFLOW			BIT(5)
> +#define SWRM_INTERRUPT_STATUS_WR_CMD_FIFO_OVERFLOW		BIT(6)
>  #define SWRM_INTERRUPT_STATUS_CMD_ERROR				BIT(7)
> +#define SWRM_INTERRUPT_STATUS_DOUT_PORT_COLLISION		BIT(8)
> +#define SWRM_INTERRUPT_STATUS_READ_EN_RD_VALID_MISMATCH		BIT(9)
>  #define SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED		BIT(10)
> +#define SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED_V2             BIT(13)
> +#define SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED_V2              BIT(14)
> +#define SWRM_INTERRUPT_STATUS_EXT_CLK_STOP_WAKEUP               BIT(16)
> +#define SWRM_INTERRUPT_MAX					17
>  #define SWRM_INTERRUPT_MASK_ADDR				0x204
>  #define SWRM_INTERRUPT_CLEAR					0x208
>  #define SWRM_INTERRUPT_CPU_EN					0x210
> @@ -105,11 +116,8 @@ struct qcom_swrm_ctrl {
>  	struct device *dev;
>  	struct regmap *regmap;
>  	void __iomem *mmio;
> -	struct completion *comp;
>  	struct completion broadcast;
>  	struct work_struct slave_work;
> -	/* read/write lock */
> -	spinlock_t comp_lock;
>  	/* Port alloc/free lock */
>  	struct mutex port_lock;
>  	struct mutex io_lock;
> @@ -126,6 +134,7 @@ struct qcom_swrm_ctrl {
>  	int rows_index;
>  	unsigned long dout_port_mask;
>  	unsigned long din_port_mask;
> +	u32 intr_mask;
>  	u8 rcmd_id;
>  	u8 wcmd_id;
>  	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS];
> @@ -315,6 +324,27 @@ static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *swrm,
>  	return ret;
>  }
>  
> +static int qcom_swrm_get_alert_slave(struct qcom_swrm_ctrl *ctrl)
> +{
> +	u32 val;
> +	int i;
> +
> +	ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
> +
> +	for (i = 0; i < SDW_MAX_DEVICES; i++) {
> +		u32 s;

define at top of the function pls, also maybe better name status?

> +
> +		s = (val >> (i * 2));

why * 2 ? Maybe add a comment for this logic

> +
> +		if ((s & SWRM_MCP_SLV_STATUS_MASK) == SDW_SLAVE_ALERT) {
> +			ctrl->status[i] = s;
> +			return i;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  static void qcom_swrm_get_device_status(struct qcom_swrm_ctrl *ctrl)
>  {
>  	u32 val;
> @@ -333,40 +363,122 @@ static void qcom_swrm_get_device_status(struct qcom_swrm_ctrl *ctrl)
>  
>  static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>  {
> -	struct qcom_swrm_ctrl *ctrl = dev_id;
> -	u32 sts, value;
> -	unsigned long flags;
> -
> -	ctrl->reg_read(ctrl, SWRM_INTERRUPT_STATUS, &sts);
> -
> -	if (sts & SWRM_INTERRUPT_STATUS_CMD_ERROR) {
> -		ctrl->reg_read(ctrl, SWRM_CMD_FIFO_STATUS, &value);
> -		dev_err_ratelimited(ctrl->dev,
> -				    "CMD error, fifo status 0x%x\n",
> -				     value);
> -		ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CMD, 0x1);
> -	}
> +	struct qcom_swrm_ctrl *swrm = dev_id;
> +	u32 value, intr_sts, intr_sts_masked;
> +	u32 i;
> +	u8 devnum = 0;
> +	int ret = IRQ_HANDLED;
> +
> +
> +	swrm->reg_read(swrm, SWRM_INTERRUPT_STATUS, &intr_sts);
> +	intr_sts_masked = intr_sts & swrm->intr_mask;
> +
> +handle_irq:

maybe move this into a fn and avoid a goto for non err path?

> +	for (i = 0; i < SWRM_INTERRUPT_MAX; i++) {
> +		value = intr_sts_masked & (1 << i);
> +		if (!value)
> +			continue;
> +
> +		switch (value) {
> +		case SWRM_INTERRUPT_STATUS_SLAVE_PEND_IRQ:
> +			devnum = qcom_swrm_get_alert_slave(swrm);
> +			if (devnum < 0) {
> +				dev_err_ratelimited(swrm->dev,
> +				    "no slave alert found.spurious interrupt\n");
> +			} else {
> +				sdw_handle_slave_status(&swrm->bus, swrm->status);
> +			}
>  
> -	if ((sts & SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED) ||
> -	    sts & SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS)
> -		schedule_work(&ctrl->slave_work);
> -
> -	/**
> -	 * clear the interrupt before complete() is called, as complete can
> -	 * schedule new read/writes which require interrupts, clearing the
> -	 * interrupt would avoid missing interrupts in such cases.
> -	 */
> -	ctrl->reg_write(ctrl, SWRM_INTERRUPT_CLEAR, sts);
> -
> -	if (sts & SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED) {
> -		spin_lock_irqsave(&ctrl->comp_lock, flags);
> -		if (ctrl->comp)
> -			complete(ctrl->comp);
> -		spin_unlock_irqrestore(&ctrl->comp_lock, flags);
> +			break;
> +		case SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED:
> +		case SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS:
> +			dev_err_ratelimited(swrm->dev, "%s: SWR new slave attached\n",
> +				__func__);
> +			qcom_swrm_get_device_status(swrm);
> +			sdw_handle_slave_status(&swrm->bus, swrm->status);
> +			break;
> +		case SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET:
> +			dev_err_ratelimited(swrm->dev,
> +					"%s: SWR bus clsh detected\n",
> +					__func__);
> +			swrm->intr_mask &=
> +				~SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
> +			swrm->reg_write(swrm,
> +				SWRM_INTERRUPT_CPU_EN,
> +				swrm->intr_mask);
> +			break;
> +		case SWRM_INTERRUPT_STATUS_RD_FIFO_OVERFLOW:
> +			swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
> +			dev_err_ratelimited(swrm->dev,
> +				"%s: SWR read FIFO overflow fifo status 0x%x\n",
> +				__func__, value);
> +			break;
> +		case SWRM_INTERRUPT_STATUS_RD_FIFO_UNDERFLOW:
> +			swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
> +			dev_err_ratelimited(swrm->dev,
> +				"%s: SWR read FIFO underflow fifo status 0x%x\n",
> +				__func__, value);
> +			break;
> +		case SWRM_INTERRUPT_STATUS_WR_CMD_FIFO_OVERFLOW:
> +			swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
> +			dev_err(swrm->dev,
> +				"%s: SWR write FIFO overflow fifo status %x\n",
> +				__func__, value);
> +			swrm->reg_write(swrm, SWRM_CMD_FIFO_CMD, 0x1);
> +			break;
> +		case SWRM_INTERRUPT_STATUS_CMD_ERROR:
> +			swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
> +			dev_err_ratelimited(swrm->dev,
> +			"%s: SWR CMD error, fifo status 0x%x, flushing fifo\n",
> +					__func__, value);
> +			swrm->reg_write(swrm, SWRM_CMD_FIFO_CMD, 0x1);
> +			break;
> +		case SWRM_INTERRUPT_STATUS_DOUT_PORT_COLLISION:
> +			dev_err_ratelimited(swrm->dev,
> +					"%s: SWR Port collision detected\n",
> +					__func__);
> +			swrm->intr_mask &= ~SWRM_INTERRUPT_STATUS_DOUT_PORT_COLLISION;
> +			swrm->reg_write(swrm,
> +				SWRM_INTERRUPT_CPU_EN, swrm->intr_mask);
> +			break;
> +		case SWRM_INTERRUPT_STATUS_READ_EN_RD_VALID_MISMATCH:
> +			dev_err_ratelimited(swrm->dev,
> +				"%s: SWR read enable valid mismatch\n",
> +				__func__);
> +			swrm->intr_mask &=
> +				~SWRM_INTERRUPT_STATUS_READ_EN_RD_VALID_MISMATCH;
> +			swrm->reg_write(swrm,
> +				SWRM_INTERRUPT_CPU_EN, swrm->intr_mask);
> +			break;
> +		case SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED:
> +			complete(&swrm->broadcast);
> +			break;
> +		case SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED_V2:
> +			break;
> +		case SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED_V2:
> +			break;
> +		case SWRM_INTERRUPT_STATUS_EXT_CLK_STOP_WAKEUP:
> +			break;
> +		default:
> +			dev_err_ratelimited(swrm->dev,
> +					"%s: SWR unknown interrupt value: %d\n",
> +					__func__, value);
> +			ret = IRQ_NONE;
> +			break;
> +		}
>  	}
> +	swrm->reg_write(swrm, SWRM_INTERRUPT_CLEAR, intr_sts);
> +	swrm->reg_write(swrm, SWRM_INTERRUPT_CLEAR, 0x0);
> +
> +	swrm->reg_read(swrm, SWRM_INTERRUPT_STATUS, &intr_sts);
> +	intr_sts_masked = intr_sts & swrm->intr_mask;
> +
> +	if (intr_sts_masked)
> +		goto handle_irq;
>  
> -	return IRQ_HANDLED;
> +	return ret;
>  }
> +
>  static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>  {
>  	u32 val;
> @@ -380,6 +492,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>  	/* Disable Auto enumeration */
>  	ctrl->reg_write(ctrl, SWRM_ENUMERATOR_CFG_ADDR, 0);
>  
> +	ctrl->intr_mask = SWRM_INTERRUPT_STATUS_RMSK;
>  	/* Mask soundwire interrupts */
>  	ctrl->reg_write(ctrl, SWRM_INTERRUPT_MASK_ADDR,
>  			SWRM_INTERRUPT_STATUS_RMSK);
> @@ -615,16 +728,6 @@ static u32 qcom_swrm_freq_tbl[MAX_FREQ_NUM] = {
>  	DEFAULT_CLK_FREQ,
>  };
>  
> -static void qcom_swrm_slave_wq(struct work_struct *work)
> -{
> -	struct qcom_swrm_ctrl *ctrl =
> -			container_of(work, struct qcom_swrm_ctrl, slave_work);
> -
> -	qcom_swrm_get_device_status(ctrl);
> -	sdw_handle_slave_status(&ctrl->bus, ctrl->status);
> -}
> -
> -
>  static void qcom_swrm_stream_free_ports(struct qcom_swrm_ctrl *ctrl,
>  					struct sdw_stream_runtime *stream)
>  {
> @@ -989,11 +1092,9 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  
>  	ctrl->dev = dev;
>  	dev_set_drvdata(&pdev->dev, ctrl);
> -	spin_lock_init(&ctrl->comp_lock);
>  	mutex_init(&ctrl->port_lock);
>  	mutex_init(&ctrl->io_lock);
>  	init_completion(&ctrl->broadcast);
> -	INIT_WORK(&ctrl->slave_work, qcom_swrm_slave_wq);
>  
>  	ctrl->bus.ops = &qcom_swrm_ops;
>  	ctrl->bus.port_ops = &qcom_swrm_port_ops;
> -- 
> 2.21.0

-- 
~Vinod
