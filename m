Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E21454DAC
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 20:10:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1506C1908;
	Wed, 17 Nov 2021 20:09:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1506C1908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637176210;
	bh=8XLCbuegYEmEkqwKkgE7U6tVGdoAB6PkSIl2oFMXuzI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VAjYfrukg6NbuSTZsICERiB05F1IEjhtFV88Zi0UGqM01RFszBPsCbxQngaDQlpPB
	 M5qyONJTS9X5lgGvS1Led5GyrXA1Me9wA8JlXZXqAy70kt+dQzWcMzJBVHd4S6Msgf
	 eA6O8dtB9eFX7r6jQz+/+KXB1iWZxZvUX4Yww8+s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99672F8020D;
	Wed, 17 Nov 2021 20:08:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 642BEF8027D; Wed, 17 Nov 2021 20:08:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69D7DF80134
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 20:08:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69D7DF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=malainey-com.20210112.gappssmtp.com
 header.i=@malainey-com.20210112.gappssmtp.com header.b="lTpBRs5F"
Received: by mail-qt1-x832.google.com with SMTP id l8so3665167qtk.6
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 11:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=malainey-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MOL7eE0Q3hd+mhUI/Nv+APzSnGBoeLeug1fw2QweSqs=;
 b=lTpBRs5Fko+5HFhoU48vQs6A91Aga9+/RZ3u3JMiswwTpn8u5p7dtepmKp1T/pPgba
 LtKhwXCKA9zbIWkE57tESkzODhvJ1kg/9jMvAiOM98KZrxCSsYWr4cqRzhbAo8xbomyu
 +2waHDLtiUlinGJ1MTGlwXbJIHOoizFaBEm0yrsBOv0Q6UNyEvzkio0D0tqciIHCzwtN
 BXq1B9474U4CWs6eSLVJgbD/G7TuiWw+DRL+f8gqTjNS0kaF7fNgt3PJFUarzDacd3lL
 /RxjnloLGlu+hbuIejZslZo5k2sYbykK082Ng102G0hHJHJMmLmlGOAWsVvAAKSlc69A
 pg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MOL7eE0Q3hd+mhUI/Nv+APzSnGBoeLeug1fw2QweSqs=;
 b=iLo8t5bGVpQJ2YpFggAcLlsmQDk9NrofQrUKckeB9yuMB3JKBvJP+uOi+EG2Y6GnyH
 3Xq7XjbniXQWia4YSboblTIArKYyNQmIb6hiabxkR4N/3lfRGBhIVWOdO9qdznMStA/8
 EKLHW+LZOdxrvPHI7CGlbbWQ1i1IfQKGa+v19Dw+T7m5uoUvDJlWwmDvCP5k8CfTRpII
 Q2qhQ5NVZcR+/cahZu+PWf7RIFNQXt7hHQeZdM5zOIzWIrKH7BdRQEUe5qzw1A4pPgha
 BzeneY0oiYUdp18IsZVOzbiZ7Ejp+w2zkC0DNQ45VrGPKI+co5PpKvDUCVWxrrrbkxOY
 T/yQ==
X-Gm-Message-State: AOAM530w4OxC5pIKz41PgzWRh4NlEChTOA1aFGT4w81XYaGKQecBK4oH
 4jg8C/RKPNmB1XAdEEPtJ1Ka5LGTmH8eBcOUagJtfQ==
X-Google-Smtp-Source: ABdhPJzUTQf2EfT3mISSLE1AKgA4ZDITTxHqjY57ZZ3iS/egKUACEDVR/p3j8oww9pvC2iWcdwpTzIcJ4zDA4qDasKg=
X-Received: by 2002:a05:622a:610:: with SMTP id
 z16mr19642336qta.184.1637176117615; 
 Wed, 17 Nov 2021 11:08:37 -0800 (PST)
MIME-Version: 1.0
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
 <20211117093734.17407-14-daniel.baluta@oss.nxp.com>
In-Reply-To: <20211117093734.17407-14-daniel.baluta@oss.nxp.com>
From: Curtis Malainey <curtis@malainey.com>
Date: Wed, 17 Nov 2021 11:08:26 -0800
Message-ID: <CABkGCGd47cq92tPgDK-m+guTSvc9BsdPaSGCPPoEHB2uczuXcQ@mail.gmail.com>
Subject: Re: [PATCH 13/21] ASoC: SOF: amd: Add support for SOF firmware
 authentication
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Cc: daniel.baluta@gmail.com, AjitKumar.Pandey@amd.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, Julian.Schroeder@amd.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Balakishore.pati@amd.com, yc.hung@mediatek.com,
 vishnuvardhanrao.ravulapati@amd.com, vsreddy@amd.com, daniel.baluta@nxp.com
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

On Wed, Nov 17, 2021 at 1:38 AM Daniel Baluta <daniel.baluta@oss.nxp.com> wrote:
>
> From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
>
> Add callback to notify PSP after loading firmware on DSP. PSP will
> validate the loaded firmware and set qualifier bit to run firmware
> on secured AMD systems.
>
> Signed-off-by: Julian Schroeder <Julian.Schroeder@amd.com>
> Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Curtis Malainey <curtis@malainey.com>

Sorry github must be attached to the wrong email, please use

Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>

> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  sound/soc/sof/amd/acp-dsp-offset.h |  4 ++
>  sound/soc/sof/amd/acp.c            | 66 +++++++++++++++++++++++++++++-
>  sound/soc/sof/amd/acp.h            | 21 ++++++++++
>  sound/soc/sof/amd/pci-rn.c         |  5 +++
>  4 files changed, 95 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/sof/amd/acp-dsp-offset.h b/sound/soc/sof/amd/acp-dsp-offset.h
> index 1d11e9d69dce..63f13c111b24 100644
> --- a/sound/soc/sof/amd/acp-dsp-offset.h
> +++ b/sound/soc/sof/amd/acp-dsp-offset.h
> @@ -54,6 +54,9 @@
>  #define ACP_PGFSM_STATUS                       0x1420
>
>  /* Registers from ACP_INTR block */
> +#define ACP_EXTERNAL_INTR_ENB                  0x1800
> +#define ACP_EXTERNAL_INTR_CNTL                 0x1804
> +#define ACP_EXTERNAL_INTR_STAT                 0x1808
>  #define ACP_DSP_SW_INTR_CNTL                   0x1814
>  #define ACP_DSP_SW_INTR_STAT                    0x1818
>  #define ACP_SW_INTR_TRIG                        0x181C
> @@ -68,6 +71,7 @@
>  #define ACP_SHA_DMA_CMD_STS                    0x1CC0
>  #define ACP_SHA_DMA_ERR_STATUS                 0x1CC4
>  #define ACP_SHA_TRANSFER_BYTE_CNT              0x1CC8
> +#define ACP_SHA_PSP_ACK                         0x1C74
>
>  #define ACP_SCRATCH_REG_0                      0x10000
>
> diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
> index 74ede28aa8d8..4c5550e8d364 100644
> --- a/sound/soc/sof/amd/acp.c
> +++ b/sound/soc/sof/amd/acp.c
> @@ -20,6 +20,22 @@
>  #include "acp.h"
>  #include "acp-dsp-offset.h"
>
> +static int smn_write(struct pci_dev *dev, u32 smn_addr, u32 data)
> +{
> +       pci_write_config_dword(dev, 0x60, smn_addr);
> +       pci_write_config_dword(dev, 0x64, data);
> +
> +       return 0;
> +}
> +
> +static int smn_read(struct pci_dev *dev, u32 smn_addr, u32 *data)
> +{
> +       pci_write_config_dword(dev, 0x60, smn_addr);
> +       pci_read_config_dword(dev, 0x64, data);
> +
> +       return 0;
> +}
> +
>  static void configure_acp_groupregisters(struct acp_dev_data *adata)
>  {
>         struct snd_sof_dev *sdev = adata->dev;
> @@ -135,6 +151,25 @@ int configure_and_run_dma(struct acp_dev_data *adata, unsigned int src_addr,
>         return ret;
>  }
>
> +static int psp_fw_validate(struct acp_dev_data *adata)
> +{
> +       struct snd_sof_dev *sdev = adata->dev;
> +       int timeout;
> +       u32 data;
> +
> +       smn_write(adata->smn_dev, MP0_C2PMSG_26_REG, MBOX_ACP_SHA_DMA_COMMAND);
> +
> +       for (timeout = ACP_PSP_TIMEOUT_COUNTER; timeout > 0; timeout--) {
> +               msleep(20);
> +               smn_read(adata->smn_dev, MP0_C2PMSG_26_REG, &data);
> +               if (data & MBOX_READY_MASK)
> +                       return 0;
> +       }
> +
> +       dev_err(sdev->dev, "FW validation timedout: status %x\n", data & MBOX_STATUS_MASK);
> +       return -ETIMEDOUT;
> +}
> +
>  int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
>                               unsigned int start_addr, unsigned int dest_addr,
>                               unsigned int image_length)
> @@ -174,7 +209,9 @@ int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
>                 return ret;
>         }
>
> -       snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DSP_FW_QUALIFIER, DSP_FW_RUN_ENABLE);
> +       ret = psp_fw_validate(adata);
> +       if (ret)
> +               return ret;
>
>         fw_qualifier = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_SHA_DSP_FW_QUALIFIER);
>         if (!(fw_qualifier & DSP_FW_RUN_ENABLE)) {
> @@ -238,6 +275,13 @@ static irqreturn_t acp_irq_thread(int irq, void *context)
>         struct snd_sof_dev *sdev = context;
>         unsigned int val;
>
> +       val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_EXTERNAL_INTR_STAT);
> +       if (val & ACP_SHA_STAT) {
> +               /* Clear SHA interrupt raised by PSP */
> +               snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_EXTERNAL_INTR_STAT, val);
> +               return IRQ_HANDLED;
> +       }
> +
>         val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_DSP_SW_INTR_STAT);
>         if (val & ACP_DSP_TO_HOST_IRQ) {
>                 sof_ops(sdev)->irq_thread(irq, sdev);
> @@ -326,6 +370,7 @@ int amd_sof_acp_probe(struct snd_sof_dev *sdev)
>  {
>         struct pci_dev *pci = to_pci_dev(sdev->dev);
>         struct acp_dev_data *adata;
> +       const struct sof_amd_acp_desc *chip;
>         unsigned int addr;
>         int ret;
>
> @@ -346,18 +391,32 @@ int amd_sof_acp_probe(struct snd_sof_dev *sdev)
>
>         sdev->pdata->hw_pdata = adata;
>
> +       chip = get_chip_info(sdev->pdata);
> +       if (!chip) {
> +               dev_err(sdev->dev, "no such device supported, chip id:%x\n", pci->device);
> +               return -EIO;
> +       }
> +
> +       adata->smn_dev = pci_get_device(PCI_VENDOR_ID_AMD, chip->host_bridge_id, NULL);
> +       if (!adata->smn_dev) {
> +               dev_err(sdev->dev, "Failed to get host bridge device\n");
> +               return -ENODEV;
> +       }
> +
>         sdev->ipc_irq = pci->irq;
>         ret = request_threaded_irq(sdev->ipc_irq, acp_irq_handler, acp_irq_thread,
>                                    IRQF_SHARED, "AudioDSP", sdev);
>         if (ret < 0) {
>                 dev_err(sdev->dev, "failed to register IRQ %d\n",
>                         sdev->ipc_irq);
> +               pci_dev_put(adata->smn_dev);
>                 return ret;
>         }
>
>         ret = acp_init(sdev);
>         if (ret < 0) {
>                 free_irq(sdev->ipc_irq, sdev);
> +               pci_dev_put(adata->smn_dev);
>                 return ret;
>         }
>
> @@ -371,6 +430,11 @@ EXPORT_SYMBOL_NS(amd_sof_acp_probe, SND_SOC_SOF_AMD_COMMON);
>
>  int amd_sof_acp_remove(struct snd_sof_dev *sdev)
>  {
> +       struct acp_dev_data *adata = sdev->pdata->hw_pdata;
> +
> +       if (adata->smn_dev)
> +               pci_dev_put(adata->smn_dev);
> +
>         if (sdev->ipc_irq)
>                 free_irq(sdev->ipc_irq, sdev);
>
> diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
> index fd923f72a01a..a2f8e4219066 100644
> --- a/sound/soc/sof/amd/acp.h
> +++ b/sound/soc/sof/amd/acp.h
> @@ -52,6 +52,15 @@
>
>  #define ACP_DSP_TO_HOST_IRQ                    0x04
>
> +#define HOST_BRIDGE_CZN                                0x1630
> +#define ACP_SHA_STAT                           0x8000
> +#define ACP_PSP_TIMEOUT_COUNTER                        5
> +#define ACP_EXT_INTR_ERROR_STAT                        0x20000000
> +#define MP0_C2PMSG_26_REG                      0x03810570
> +#define MBOX_ACP_SHA_DMA_COMMAND               0x330000
> +#define MBOX_READY_MASK                                0x80000000
> +#define MBOX_STATUS_MASK                       0xFFFF
> +
>  struct  acp_atu_grp_pte {
>         u32 low;
>         u32 high;
> @@ -140,6 +149,7 @@ struct acp_dev_data {
>         struct dma_descriptor dscr_info[ACP_MAX_DESC];
>         struct acp_dsp_stream stream_buf[ACP_MAX_STREAM];
>         struct acp_dsp_stream *dtrace_stream;
> +       struct pci_dev *smn_dev;
>  };
>
>  void memcpy_to_scratch(struct snd_sof_dev *sdev, u32 offset, unsigned int *src, size_t bytes);
> @@ -202,4 +212,15 @@ int snd_amd_acp_find_config(struct pci_dev *pci);
>  /* Trace */
>  int acp_sof_trace_init(struct snd_sof_dev *sdev, u32 *stream_tag);
>  int acp_sof_trace_release(struct snd_sof_dev *sdev);
> +
> +struct sof_amd_acp_desc {
> +       unsigned int host_bridge_id;
> +};
> +
> +static inline const struct sof_amd_acp_desc *get_chip_info(struct snd_sof_pdata *pdata)
> +{
> +       const struct sof_dev_desc *desc = pdata->desc;
> +
> +       return desc->chip_info;
> +}
>  #endif
> diff --git a/sound/soc/sof/amd/pci-rn.c b/sound/soc/sof/amd/pci-rn.c
> index 3c379a5ef231..392ffbdf6417 100644
> --- a/sound/soc/sof/amd/pci-rn.c
> +++ b/sound/soc/sof/amd/pci-rn.c
> @@ -43,12 +43,17 @@ static const struct resource renoir_res[] = {
>         },
>  };
>
> +static const struct sof_amd_acp_desc renoir_chip_info = {
> +       .host_bridge_id = HOST_BRIDGE_CZN,
> +};
> +
>  static const struct sof_dev_desc renoir_desc = {
>         .machines               = snd_soc_acpi_amd_sof_machines,
>         .resindex_lpe_base      = 0,
>         .resindex_pcicfg_base   = -1,
>         .resindex_imr_base      = -1,
>         .irqindex_host_ipc      = -1,
> +       .chip_info              = &renoir_chip_info,
>         .default_fw_path        = "amd/sof",
>         .default_tplg_path      = "amd/sof-tplg",
>         .default_fw_filename    = "sof-rn.ri",
> --
> 2.27.0
>
