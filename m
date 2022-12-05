Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3BE642C89
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 17:09:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D183217E9;
	Mon,  5 Dec 2022 17:08:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D183217E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670256580;
	bh=2zTjxGImNhiKZkQVLYwU+D7sO9c/DELnBsQOLmxj5RM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wa1On8uVPr1J/ydfdVbMWjdw8jU3K9QMo0rgDRviI55XRrZKxvdWR2X9dNMWuwDIH
	 xqVttJuwcwmN4UM2vDOqk37ZffKS47fS69OSBSUgS9zPDLCfww0NtHYWWILK00GMH1
	 ltBzDctghv8QIMg8CXuvXGmpfQ2NMkB4Z1SrOIns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A495BF8049E;
	Mon,  5 Dec 2022 17:08:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 231A4F804C2; Mon,  5 Dec 2022 17:08:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA9A7F800BD
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 17:08:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA9A7F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="t1aBQ5Pw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D3C01611D6;
 Mon,  5 Dec 2022 16:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7ED3C433D6;
 Mon,  5 Dec 2022 16:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1670256516;
 bh=2zTjxGImNhiKZkQVLYwU+D7sO9c/DELnBsQOLmxj5RM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t1aBQ5PwG5R+hRKkkXrH8ZTKVgOxRxmB/P6l1a7WOnp6bg1x+OclpQCfQnhw/5RV9
 VWi7ElCSsHDX/U7BRQ1/TnpM9vFr8hQGRZDE9i4Y2GO9/XQcyWYoAD1bZDv9jDw4w5
 KgmnSDvMOM5qBG6N1xQJdeSmTODNmVm+4pNvzk5Y=
Date: Mon, 5 Dec 2022 17:08:33 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dawei Li <set_pte_at@outlook.com>
Subject: Re: [PATCH 2/6] macio: Make remove callback of macio driver void
 returned
Message-ID: <Y44XgS8nHgcJjQCL@kroah.com>
References: <20221205153644.60909-1-set_pte_at@outlook.com>
 <TYCP286MB2323FCDC7ECD87F8D97CB74BCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCP286MB2323FCDC7ECD87F8D97CB74BCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
Cc: jgross@suse.com, wei.liu@kernel.org, sstabellini@kernel.org,
 linux-hyperv@vger.kernel.org, mpe@ellerman.id.au, haiyangz@microsoft.com,
 linuxppc-dev@lists.ozlabs.org, decui@microsoft.com,
 alsa-devel@alsa-project.org, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 oleksandr_tyshchenko@epam.com, srinivas.kandagatla@linaro.org,
 christophe.leroy@csgroup.eu, bgoswami@quicinc.com,
 xen-devel@lists.xenproject.org, johannes@sipsolutions.net, kys@microsoft.com,
 robert.jarzmik@free.fr, roger.pau@citrix.com
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

On Mon, Dec 05, 2022 at 11:36:40PM +0800, Dawei Li wrote:
> Commit fc7a6209d571 ("bus: Make remove callback return
> void") forces bus_type::remove be void-returned, it doesn't
> make much sense for any bus based driver implementing remove
> callbalk to return non-void to its caller.
> 
> This change is for macio bus based drivers.
> 
> Signed-off-by: Dawei Li <set_pte_at@outlook.com>
> ---
>  arch/powerpc/include/asm/macio.h                | 12 ++++++------
>  drivers/ata/pata_macio.c                        |  4 +---
>  drivers/macintosh/rack-meter.c                  |  4 +---
>  drivers/net/ethernet/apple/bmac.c               |  4 +---
>  drivers/net/ethernet/apple/mace.c               |  4 +---
>  drivers/net/wireless/intersil/orinoco/airport.c |  4 +---
>  drivers/scsi/mac53c94.c                         |  5 +----
>  drivers/scsi/mesh.c                             |  5 +----
>  drivers/tty/serial/pmac_zilog.c                 |  7 ++-----
>  sound/aoa/soundbus/i2sbus/core.c                |  4 +---
>  10 files changed, 16 insertions(+), 37 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/macio.h b/arch/powerpc/include/asm/macio.h
> index ff5fd82d9ff0..f641c730c3b7 100644
> --- a/arch/powerpc/include/asm/macio.h
> +++ b/arch/powerpc/include/asm/macio.h
> @@ -124,15 +124,15 @@ static inline struct pci_dev *macio_get_pci_dev(struct macio_dev *mdev)
>   */
>  struct macio_driver
>  {
> -	int	(*probe)(struct macio_dev* dev, const struct of_device_id *match);
> -	int	(*remove)(struct macio_dev* dev);
> +	int	(*probe)(struct macio_dev *dev, const struct of_device_id *match);
> +	void	(*remove)(struct macio_dev *dev);

Again, you are changing lines you do not need to here.

thanks,

greg k-h
