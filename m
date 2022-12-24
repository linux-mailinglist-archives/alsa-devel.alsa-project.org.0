Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBC8655980
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Dec 2022 09:55:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62168A97F;
	Sat, 24 Dec 2022 09:55:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62168A97F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671872152;
	bh=m3Ir70l8g/TXMb/IV1C5kk10eAYAEp+V9k7xKdezeGA=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sjeEzDAaosWSRRuIlv5DI6D4li9sryygeXjHtPflyrhKJqF2vaWA20LSr5fnCMykE
	 O3b9ZiVkljEPYpNkSrw+i6cbywdSyjIZzpeygZeV6jjYbEUHBDKvQcII1rh1RL9VGa
	 WY6tnZ4uiknqibLyTb67WwkD+zR4V3Cx/XZoTp7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B1AEF80245;
	Sat, 24 Dec 2022 09:54:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2317F8032B; Sat, 24 Dec 2022 09:54:53 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 73862F80249
 for <alsa-devel@alsa-project.org>; Sat, 24 Dec 2022 09:54:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73862F80249
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=BQWqu7Gb
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 98E0B6020F;
 Sat, 24 Dec 2022 08:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79562C433D2;
 Sat, 24 Dec 2022 08:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1671872088;
 bh=m3Ir70l8g/TXMb/IV1C5kk10eAYAEp+V9k7xKdezeGA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BQWqu7Gb6mhU/wDiU4LytDOURNWAMqtwN8md9fTezBNZ8s3NJfpnVvzG25oC2AQBa
 mUTLJMUQpHRZFrjrutDBg+lmU8PcRq1jqM639Tb1fxPUlr19o73tkMM1VNMjNs8tqA
 MpK8Xi23gbyhrOPX9UHjLfZeZj7KKVFgD3E6cjYg=
Date: Sat, 24 Dec 2022 09:54:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [RFC PATCH 06/14] usb: core: hcd: Introduce USB HCD APIs for
 interrupter management
Message-ID: <Y6a+VJ75lRIUE9yD@kroah.com>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-7-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221223233200.26089-7-quic_wcheng@quicinc.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, bgoswami@quicinc.com, mathias.nyman@intel.com,
 Thinh.Nguyen@synopsys.com, andersson@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, agross@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_plai@quicinc.com, linux-kernel@vger.kernel.org, quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Dec 23, 2022 at 03:31:52PM -0800, Wesley Cheng wrote:
> For USB HCDs that can support multiple USB interrupters, expose functions
> that class drivers can utilize for setting up secondary interrupters.
> Class drivers can pass this information to its respective clients, i.e.
> a dedicated DSP.

Where is the locking here that seems to be required when a hcd is
removed from the system and you have data in flight?  What am I missing
here in the design of this?

And yes, HCDs get removed all the time, and will happen more and more in
the future with the design of more systems moving to Thunderbolt/PCIe
designs due to the simplicity of it.

> +/**
> + * usb_set_interruper - Reserve an interrupter

Where is an "interrupter" defined?  I don't know what this term means
sorry, is this in the USB specification somewhere?


> + * @udev: usb device which requested the interrupter
> + * @intr_num: interrupter number to reserve
> + * @dma: iova address to event ring
> + *
> + * Request for a specific interrupter to be reserved for a USB class driver.
> + * This will return the base address to the event ring that was allocated to
> + * the specific interrupter.
> + **/
> +phys_addr_t usb_set_interruper(struct usb_device *udev, int intr_num,
> +							dma_addr_t *dma)
> +{
> +	struct usb_hcd *hcd;
> +	phys_addr_t pa = 0;
> +
> +	hcd = bus_to_hcd(udev->bus);
> +	if (hcd->driver->update_interrupter)
> +		pa = hcd->driver->update_interrupter(hcd, intr_num, dma);
> +
> +	return pa;

Wait, you return a physical address?  What are you going to do with
that?  And what guarantees that the address is valid after you return it
(again, remember memory and devices can be removed at any point in time.

thanks,

greg k-h
