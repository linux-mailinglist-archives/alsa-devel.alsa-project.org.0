Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC23C3CFB98
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jul 2021 16:10:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A1CE168B;
	Tue, 20 Jul 2021 16:09:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A1CE168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626790233;
	bh=2c1Pj0czlKE6ViLVFPURuf1ZX6FHlGkHzpqrQ8+yB3A=;
	h=Date:To:From:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=gys/94CqqnrWbV9/ThTIyryBqgBz44T5rQPgyYN/DcUOPAFk85qVcn3G+xgE9NhSB
	 Jt3JDkXjhxMz+mMoGpOH0KqWHNufJyOtoX6DxKvDz3xPCCL+/XV1VUcrYefJVeNsBF
	 BAfXijraOru/uhzOVcA/SWhKWeEvq7wXO4VmUcB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C73EEF80423;
	Tue, 20 Jul 2021 16:09:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CCFCF80218; Tue, 20 Jul 2021 06:30:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-40141.protonmail.ch (mail-40141.protonmail.ch
 [185.70.40.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A58DF80169
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 06:30:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A58DF80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="vfN1dOZD"
Date: Tue, 20 Jul 2021 04:30:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1626755431;
 bh=ZUcIfo45asjZv5XyfoNGJMJ8oHbOCC5IDX4Ylngh/zQ=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=vfN1dOZDJQO1O6969k/EACsWqCl85qCJDIdQ5QAix1yBh1G8lg7Wf/XuRBPd3X9Uk
 LVR6nw+IxKh0JIw/WaO/4n92TfL2s+Cx5X1wiVZV3ejR7JBW9I7/oTWIWlf4xKJ/Qd
 sKSGsKTmpjCw2+iFrJrZG5jtbeC3zIH+wta0pAIo=
To: "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "srini@kernel.org" <srini@kernel.org>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH 1/2] slimbus: qcom-ngd-ctrl: add Sub System Restart support
Message-ID: <N9boBnhunKdwi9JH0tILWKbP7Wn3ieM12UwvKu0iEMWiAntu607V-X8ScXBq02HhuHaIfHJgbREbprNrNTKb1Y6Gy1dktJn4pNv-rfWo6kU=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 20 Jul 2021 16:09:20 +0200
Cc: "sidgup@codeaurora.org" <sidgup@codeaurora.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
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
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In-Reply-To: <20201118170246.16588-2-srinivas.kandagatla@linaro.org>

On Wed, 18 Nov 2020 17:02:45 +0000, Srinivas Kandagatla wrote:
> This patch adds SSR(SubSystem Restart) support which includes, synchronis=
ation
> between SSR and QMI server notifications. Also with this patch now NGD is=
 taken
> down by SSR instead of QMI server down notification.
>
> NGD up path now relies on both SSR and QMI notifications and particularly
> sequence of SSR up followed by QMI server up notification.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/slimbus/Kconfig         |  1 +
>  drivers/slimbus/qcom-ngd-ctrl.c | 97 +++++++++++++++++++++++++++++++--
>  2 files changed, 94 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/slimbus/Kconfig b/drivers/slimbus/Kconfig
> index 8cd595148d17..7c950948a9ec 100644
> --- a/drivers/slimbus/Kconfig
> +++ b/drivers/slimbus/Kconfig
> @@ -25,6 +25,7 @@ config SLIM_QCOM_NGD_CTRL
>  =09depends on HAS_IOMEM && DMA_ENGINE && NET
>  =09depends on ARCH_QCOM || COMPILE_TEST
>  =09select QCOM_QMI_HELPERS
> +=09select QCOM_RPROC_COMMON
>  =09help
>  =09  Select driver if Qualcomm's SLIMbus Satellite Non-Generic Device
>  =09  Component is programmed using Linux kernel.
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-c=
trl.c
> index 218aefc3531c..f62693653d2b 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -13,6 +13,9 @@
>  #include <linux/slimbus.h>
>  #include <linux/delay.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/mutex.h>
> +#include <linux/notifier.h>
> +#include <linux/remoteproc/qcom_rproc.h>
>  #include <linux/of.h>
>  #include <linux/io.h>
>  #include <linux/soc/qcom/qmi.h>
> @@ -155,8 +158,14 @@ struct qcom_slim_ngd_ctrl {
>  =09struct qcom_slim_ngd_dma_desc txdesc[QCOM_SLIM_NGD_DESC_NUM];
>  =09struct completion reconf;
>  =09struct work_struct m_work;
> +=09struct work_struct ngd_up_work;
>  =09struct workqueue_struct *mwq;
> +=09struct completion qmi_up;
>  =09spinlock_t tx_buf_lock;
> +=09struct mutex tx_lock;
> +=09struct mutex ssr_lock;
> +=09struct notifier_block nb;
> +=09void *notifier;
>  =09enum qcom_slim_ngd_state state;
>  =09dma_addr_t rx_phys_base;
>  =09dma_addr_t tx_phys_base;
> @@ -868,14 +877,18 @@ static int qcom_slim_ngd_xfer_msg(struct slim_contr=
oller *sctrl,
>  =09if (txn->msg && txn->msg->wbuf)
>  =09=09memcpy(puc, txn->msg->wbuf, txn->msg->num_bytes);
>
> +=09mutex_lock(&ctrl->tx_lock);
>  =09ret =3D qcom_slim_ngd_tx_msg_post(ctrl, pbuf, txn->rl);
> -=09if (ret)
> +=09if (ret) {
> +=09=09mutex_unlock(&ctrl->tx_lock);
>  =09=09return ret;
> +=09}
>
>  =09timeout =3D wait_for_completion_timeout(&tx_sent, HZ);
>  =09if (!timeout) {
>  =09=09dev_err(sctrl->dev, "TX timed out:MC:0x%x,mt:0x%x", txn->mc,
>  =09=09=09=09=09txn->mt);
> +=09=09mutex_unlock(&ctrl->tx_lock);
>  =09=09return -ETIMEDOUT;
>  =09}
>
> @@ -884,10 +897,12 @@ static int qcom_slim_ngd_xfer_msg(struct slim_contr=
oller *sctrl,
>  =09=09if (!timeout) {
>  =09=09=09dev_err(sctrl->dev, "TX timed out:MC:0x%x,mt:0x%x",
>  =09=09=09=09txn->mc, txn->mt);
> +=09=09=09mutex_unlock(&ctrl->tx_lock);
>  =09=09=09return -ETIMEDOUT;
>  =09=09}
>  =09}
>
> +=09mutex_unlock(&ctrl->tx_lock);
>  =09return 0;
>  }
>
> @@ -1200,6 +1215,13 @@ static void qcom_slim_ngd_master_worker(struct wor=
k_struct *work)
>  =09}
>  }
>
> +static int qcom_slim_ngd_update_device_status(struct device *dev, void *=
null)
> +{
> +=09slim_report_absent(to_slim_device(dev));
> +
> +=09return 0;
> +}
> +
>  static int qcom_slim_ngd_runtime_resume(struct device *dev)
>  {
>  =09struct qcom_slim_ngd_ctrl *ctrl =3D dev_get_drvdata(dev);
> @@ -1267,7 +1289,7 @@ static int qcom_slim_ngd_qmi_new_server(struct qmi_=
handle *hdl,
>  =09qmi->svc_info.sq_node =3D service->node;
>  =09qmi->svc_info.sq_port =3D service->port;
>
> -=09qcom_slim_ngd_enable(ctrl, true);
> +=09complete(&ctrl->qmi_up);
>
>  =09return 0;
>  }
> @@ -1280,10 +1302,9 @@ static void qcom_slim_ngd_qmi_del_server(struct qm=
i_handle *hdl,
>  =09struct qcom_slim_ngd_ctrl *ctrl =3D
>  =09=09container_of(qmi, struct qcom_slim_ngd_ctrl, qmi);
>
> +=09reinit_completion(&ctrl->qmi_up);
>  =09qmi->svc_info.sq_node =3D 0;
>  =09qmi->svc_info.sq_port =3D 0;
> -
> -=09qcom_slim_ngd_enable(ctrl, false);
>  }
>
>  static struct qmi_ops qcom_slim_ngd_qmi_svc_event_ops =3D {
> @@ -1333,6 +1354,64 @@ static const struct of_device_id qcom_slim_ngd_dt_=
match[] =3D {
>
>  MODULE_DEVICE_TABLE(of, qcom_slim_ngd_dt_match);
>
> +static void qcom_slim_ngd_down(struct qcom_slim_ngd_ctrl *ctrl)
> +{
> +=09mutex_lock(&ctrl->ssr_lock);
> +=09device_for_each_child(ctrl->ctrl.dev, NULL,
> +=09=09=09      qcom_slim_ngd_update_device_status);
> +=09qcom_slim_ngd_enable(ctrl, false);
> +=09mutex_unlock(&ctrl->ssr_lock);
> +}
> +
> +static void qcom_slim_ngd_up_worker(struct work_struct *work)
> +{
> +=09struct qcom_slim_ngd_ctrl *ctrl;
> +
> +=09ctrl =3D container_of(work, struct qcom_slim_ngd_ctrl, ngd_up_work);
> +
> +=09/* Make sure qmi service is up before continuing */
> +=09wait_for_completion_interruptible(&ctrl->qmi_up);
> +
> +=09mutex_lock(&ctrl->ssr_lock);
> +=09qcom_slim_ngd_enable(ctrl, true);
> +=09mutex_unlock(&ctrl->ssr_lock);
> +}
> +
> +static int qcom_slim_ngd_ssr_pdr_notify(struct qcom_slim_ngd_ctrl *ctrl,
> +=09=09=09=09=09unsigned long action)
> +{
> +=09switch (action) {
> +        case QCOM_SSR_BEFORE_SHUTDOWN:
> +=09=09/* Make sure the last dma xfer is finished */
> +=09=09mutex_lock(&ctrl->tx_lock);
> +=09=09if (ctrl->state !=3D QCOM_SLIM_NGD_CTRL_DOWN) {
> +=09=09=09pm_runtime_get_noresume(ctrl->dev);
> +=09=09=09ctrl->state =3D QCOM_SLIM_NGD_CTRL_DOWN;
> +=09=09=09qcom_slim_ngd_down(ctrl);
> +=09=09=09qcom_slim_ngd_exit_dma(ctrl);
> +=09=09}
> +=09=09mutex_unlock(&ctrl->tx_lock);
> +                break;
> +        case QCOM_SSR_AFTER_POWERUP:
> +=09=09schedule_work(&ctrl->ngd_up_work);
> +=09=09break;
> +        default:
> +                break;
> +        }
> +
> +        return NOTIFY_OK;
> +}
> +
> +static int qcom_slim_ngd_ssr_notify(struct notifier_block *nb,
> +=09=09=09=09    unsigned long action,
> +=09=09=09=09    void *data)
> +{
> +=09struct qcom_slim_ngd_ctrl *ctrl =3D container_of(nb,
> +=09=09=09=09=09       struct qcom_slim_ngd_ctrl, nb);
> +
> +=09return qcom_slim_ngd_ssr_pdr_notify(ctrl, action);
> +}
> +
>  static int of_qcom_slim_ngd_register(struct device *parent,
>  =09=09=09=09     struct qcom_slim_ngd_ctrl *ctrl)
>  {
> @@ -1397,6 +1476,7 @@ static int qcom_slim_ngd_probe(struct platform_devi=
ce *pdev)
>  =09}
>
>  =09INIT_WORK(&ctrl->m_work, qcom_slim_ngd_master_worker);
> +=09INIT_WORK(&ctrl->ngd_up_work, qcom_slim_ngd_up_worker);
>  =09ctrl->mwq =3D create_singlethread_workqueue("ngd_master");
>  =09if (!ctrl->mwq) {
>  =09=09dev_err(&pdev->dev, "Failed to start master worker\n");
> @@ -1444,6 +1524,11 @@ static int qcom_slim_ngd_ctrl_probe(struct platfor=
m_device *pdev)
>  =09=09return ret;
>  =09}
>
> +=09ctrl->nb.notifier_call =3D qcom_slim_ngd_ssr_notify;
> +=09ctrl->notifier =3D qcom_register_ssr_notifier("lpass", &ctrl->nb);
> +=09if (IS_ERR(ctrl->notifier))
> +=09=09return PTR_ERR(ctrl->notifier);
> +
>  =09ctrl->dev =3D dev;
>  =09ctrl->framer.rootfreq =3D SLIM_ROOT_FREQ >> 3;
>  =09ctrl->framer.superfreq =3D
> @@ -1457,9 +1542,12 @@ static int qcom_slim_ngd_ctrl_probe(struct platfor=
m_device *pdev)
>  =09ctrl->ctrl.wakeup =3D NULL;
>  =09ctrl->state =3D QCOM_SLIM_NGD_CTRL_DOWN;
>
> +=09mutex_init(&ctrl->tx_lock);
> +=09mutex_init(&ctrl->ssr_lock);
>  =09spin_lock_init(&ctrl->tx_buf_lock);
>  =09init_completion(&ctrl->reconf);
>  =09init_completion(&ctrl->qmi.qmi_comp);
> +=09init_completion(&ctrl->qmi_up);
>
>  =09platform_driver_register(&qcom_slim_ngd_driver);
>  =09return of_qcom_slim_ngd_register(dev, ctrl);
> @@ -1477,6 +1565,7 @@ static int qcom_slim_ngd_remove(struct platform_dev=
ice *pdev)
>  =09struct qcom_slim_ngd_ctrl *ctrl =3D platform_get_drvdata(pdev);
>
>  =09pm_runtime_disable(&pdev->dev);
> +=09qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
>  =09qcom_slim_ngd_enable(ctrl, false);
>  =09qcom_slim_ngd_exit_dma(ctrl);
>  =09qcom_slim_ngd_qmi_svc_event_deinit(&ctrl->qmi);
> --
> 2.21.0

This makes NGD never come up if probed after ADSP is powered on since it re=
gisters its SSR notifier
after ADSP sent its after powerup notification.
