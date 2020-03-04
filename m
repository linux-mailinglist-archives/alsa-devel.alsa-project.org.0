Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C325F1791A2
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Mar 2020 14:44:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 470B51673;
	Wed,  4 Mar 2020 14:43:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 470B51673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583329475;
	bh=bd9ndjT7AYvi56VQfiR+K6l5n2gZ21sXBUyPecBW1VQ=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=A8Z+REvIDtdsPGF3Z0yj4x2oaPgOM8HEMQXPtoMhpOSr8etEsH0DwNHR1OyKou2Lx
	 QlrBrBu824oHb9J0ac3O5jE4JxSxn8JrfektJETjPSMj8tZTkF7PjD/8o069mlPN/m
	 7sSlTM+RfW35lh8yAYNBQFztX5/yCWKac92i7nVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89CABF801ED;
	Wed,  4 Mar 2020 14:43:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E28D0F801F9; Wed,  4 Mar 2020 14:43:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,FAKE_REPLY_C,SPF_HELO_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C488F8011C
 for <alsa-devel@alsa-project.org>; Wed,  4 Mar 2020 14:43:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C488F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uj1k1Vth"
Received: from localhost (173-25-83-245.client.mchsi.com [173.25.83.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A86572146E;
 Wed,  4 Mar 2020 13:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583329400;
 bh=bd9ndjT7AYvi56VQfiR+K6l5n2gZ21sXBUyPecBW1VQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=uj1k1VthJWKcRmIO155xpN0EN9vdJ1x4kXfvIwF2NnU+2z49sHJ0NHovHboRXE53j
 Oft81aIkx9Zhwc0Bz0mfFd2x2bSqV2Irb1et1lBEiTP0dWqZRfJ79tNnst7hcMU+JM
 c44A/813tEeOxuxwgFTTJJrdzpw+pDCv/1JXGK04=
Date: Wed, 4 Mar 2020 07:43:18 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v4 05/10] PCI: Add pci_status_get_and_clear_errors
Message-ID: <20200304134318.GA193797@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0251b07-d08f-df4d-7e80-9eba3d3e43af@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: alsa-devel@alsa-project.org,
 Realtek linux nic maintainers <nic_swsd@realtek.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 David Miller <davem@davemloft.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mirko Lindner <mlindner@marvell.com>
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

On Sat, Feb 29, 2020 at 11:24:23PM +0100, Heiner Kallweit wrote:
> Several drivers use the following code sequence:
> 1. Read PCI_STATUS
> 2. Mask out non-error bits
> 3. Action based on error bits set
> 4. Write back set error bits to clear them
> 
> As this is a repeated pattern, add a helper to the PCI core.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

Nit: if you have any reason to revise this, I would prefer
"pci_status_get_and_clear_errors()" (with parens) in the subject.

> ---
> v4:
> - improve commit description
> ---
>  drivers/pci/pci.c   | 23 +++++++++++++++++++++++
>  include/linux/pci.h |  1 +
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index d828ca835..c16b0ba2a 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -173,6 +173,29 @@ unsigned char pci_bus_max_busnr(struct pci_bus *bus)
>  }
>  EXPORT_SYMBOL_GPL(pci_bus_max_busnr);
>  
> +/**
> + * pci_status_get_and_clear_errors - return and clear error bits in PCI_STATUS
> + * @pdev: the PCI device
> + *
> + * Returns error bits set in PCI_STATUS and clears them.
> + */
> +int pci_status_get_and_clear_errors(struct pci_dev *pdev)
> +{
> +	u16 status;
> +	int ret;
> +
> +	ret = pci_read_config_word(pdev, PCI_STATUS, &status);
> +	if (ret != PCIBIOS_SUCCESSFUL)
> +		return -EIO;
> +
> +	status &= PCI_STATUS_ERROR_BITS;
> +	if (status)
> +		pci_write_config_word(pdev, PCI_STATUS, status);
> +
> +	return status;
> +}
> +EXPORT_SYMBOL_GPL(pci_status_get_and_clear_errors);
> +
>  #ifdef CONFIG_HAS_IOMEM
>  void __iomem *pci_ioremap_bar(struct pci_dev *pdev, int bar)
>  {
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 101d71e0a..7beaf51e9 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1210,6 +1210,7 @@ int pci_select_bars(struct pci_dev *dev, unsigned long flags);
>  bool pci_device_is_present(struct pci_dev *pdev);
>  void pci_ignore_hotplug(struct pci_dev *dev);
>  struct pci_dev *pci_real_dma_dev(struct pci_dev *dev);
> +int pci_status_get_and_clear_errors(struct pci_dev *pdev);
>  
>  int __printf(6, 7) pci_request_irq(struct pci_dev *dev, unsigned int nr,
>  		irq_handler_t handler, irq_handler_t thread_fn, void *dev_id,
> -- 
> 2.25.1
> 
> 
