Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 999936558BA
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Dec 2022 07:49:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5BA8A482;
	Sat, 24 Dec 2022 07:48:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5BA8A482
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671864543;
	bh=cHfFHGYVOkCPbYTiLNY3UlB2WhZQ8+IgSDnIYQQYy/w=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SNKOxr2wNNBvQnIZk4qRQPsKA/+mo7ukBONWHDf1o3gs9iH9HN1szWI9OQVLHR3Ap
	 hTmspqGol0Pl8zaHcK5y4RsFhd6KhQRnMQ6jVV+iO/A2yGXAkmwruq7IIDZ5DLmngz
	 1fqS498DVg+gT7ThgaPbR2rYXCgQbDSy6XJh3WOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1AEFF80249;
	Sat, 24 Dec 2022 07:48:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2308CF80245; Sat, 24 Dec 2022 07:48:10 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 31993F80245
 for <alsa-devel@alsa-project.org>; Sat, 24 Dec 2022 07:48:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31993F80245
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=rkirL3mc
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CD74B60010;
 Sat, 24 Dec 2022 06:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C32BC433D2;
 Sat, 24 Dec 2022 06:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1671864485;
 bh=cHfFHGYVOkCPbYTiLNY3UlB2WhZQ8+IgSDnIYQQYy/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rkirL3mc1MlPIOEQj5li9Hu+bfviYBV8N+V2TdQB1+x57LROXcFYoNisgkItvzfKW
 r23AmF75j2zuCebeKDCtX0MsP+H/JGWtdm9Z7jUC7QzjTY6wRT7sAoFtUugWqjc3NE
 GiADDFS/mL0Tps1dSLfhCyKdzafBQ0/Gmr4WNgPc=
Date: Sat, 24 Dec 2022 07:48:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [RFC PATCH 01/14] ASoC: Add SOC USB APIs for adding an USB backend
Message-ID: <Y6agoe9fFMy3PQz4@kroah.com>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-2-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221223233200.26089-2-quic_wcheng@quicinc.com>
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

On Fri, Dec 23, 2022 at 03:31:47PM -0800, Wesley Cheng wrote:
> diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
> new file mode 100644
> index 000000000000..c6c376960e4d
> --- /dev/null
> +++ b/sound/soc/soc-usb.c
> @@ -0,0 +1,66 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +#include <linux/usb.h>
> +#include <sound/soc.h>
> +#include <sound/soc-usb.h>
> +#include "../usb/card.h"
> +
> +struct snd_soc_usb *ctx;

Note, this will not work.  You can not only have "one" state for a
system like this.  That just broke any system with more than one
controller, of which we have millions.

This has to be dynamic for any number of controllers in the system, like
the sound and USB core can handle.  Any requirement of "there can be
only one!" will obviously never be acceptable as that is not how Linux
works.

thanks,

greg k-h
