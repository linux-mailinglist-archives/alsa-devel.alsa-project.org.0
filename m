Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C97E4668EE3
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 08:13:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FE5488A0;
	Fri, 13 Jan 2023 08:12:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FE5488A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673594026;
	bh=QW1PY3rFgL7HIa1lrzMI5uksSAfbml0XYJbvQzFAuWk=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ff7TGYIFB6ANvnSIFxSFX9U2RI8OYUtyRaWiefCRfXQWxiKltXtKcO+QZxXljPnMX
	 C4BnpWCMfUiLoh/aEk7izhorm3g7FsF/3s/h1SaBcpb3IJRzK8UMy6IqmDnyGxvhOq
	 52o/lsYbd4lMe/DR76gMsC3OMnrlk2dMDyJhFp6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1CB2F80425;
	Fri, 13 Jan 2023 08:12:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8823CF8030F; Fri, 13 Jan 2023 08:12:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E0D5F8026D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 08:12:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E0D5F8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=0oMMF0As
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C10EF62238;
 Fri, 13 Jan 2023 07:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE1AC433D2;
 Fri, 13 Jan 2023 07:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1673593968;
 bh=QW1PY3rFgL7HIa1lrzMI5uksSAfbml0XYJbvQzFAuWk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0oMMF0AsnNGVsfn35DXLDvgW2FFDBQctJVJeY8ZKTXb5ezzn7lhGkAftJpZH35IQL
 SnxMV96zvZ93p/8lbSuV6nhLT/2v6ajWOmV2dS1jXf/y0bbQOvb+apnJ6XXiXzoBRc
 F2PSRDe2WkZQdYDnszi1VWAGguwJrTfCgd0RBj8I=
Date: Fri, 13 Jan 2023 08:12:44 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 02/22] usb: remove the dead USB_OHCI_SH option
Message-ID: <Y8EEbCP6PRMzWP5y@kroah.com>
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-3-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113062339.1909087-3-hch@lst.de>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 linux-rtc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-gpio@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Jan 13, 2023 at 07:23:19AM +0100, Christoph Hellwig wrote:
> USB_OHCI_SH is a dummy option that never builds any code, remove it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/usb/host/Kconfig | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index 8d799d23c476e1..ca5f657c092cf4 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -548,17 +548,6 @@ config USB_OHCI_HCD_SSB
>  
>  	  If unsure, say N.
>  
> -config USB_OHCI_SH
> -	bool "OHCI support for SuperH USB controller (DEPRECATED)"
> -	depends on SUPERH || COMPILE_TEST
> -	select USB_OHCI_HCD_PLATFORM
> -	help
> -	  This option is deprecated now and the driver was removed, use
> -	  USB_OHCI_HCD_PLATFORM instead.
> -
> -	  Enables support for the on-chip OHCI controller on the SuperH.
> -	  If you use the PCI OHCI controller, this option is not necessary.
> -
>  config USB_OHCI_EXYNOS
>  	tristate "OHCI support for Samsung S5P/Exynos SoC Series"
>  	depends on ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
> -- 
> 2.39.0
> 

Do you want all of these to go through a single tree, or can they go
through the different driver subsystem trees?

If single:

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

If not, I'll be glad to take this.

thanks,

greg k-h
