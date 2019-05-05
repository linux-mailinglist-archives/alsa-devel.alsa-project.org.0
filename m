Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A961A140C2
	for <lists+alsa-devel@lfdr.de>; Sun,  5 May 2019 17:48:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2819018A7;
	Sun,  5 May 2019 17:47:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2819018A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557071316;
	bh=8BXcWGTpPZ/ApXN6xqUZ5msCAKrmsA/yjqm2NQFGU7M=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZQMDLvYFOVr965V6VPglhfyrLp3+VqhdUiKG8xlUeATOMpXRABwUKzkeglrqWEt+A
	 BIlnGLCqiH5wx5MeU5mZZo6R1VwgGVM3nEj7Hx8sK4pd15UecOIgaY7FVweM5TfTIZ
	 f2AVcGVcszEWYsC5K26VALZKgJuwYv1HJDXm0tZY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC76AF89678;
	Sun,  5 May 2019 17:46:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61D4BF89674; Sun,  5 May 2019 17:46:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62615F80C0B
 for <alsa-devel@alsa-project.org>; Sun,  5 May 2019 17:46:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62615F80C0B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iwrMLLRr"
Received: from archlinux (cpc91196-cmbg18-2-0-cust659.5-4.cable.virginm.net
 [81.96.234.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2FE4F206DF;
 Sun,  5 May 2019 15:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557071203;
 bh=K1Yl/knFZHbhEKmc3KgI5F6e3pNiwOCS7nqtUtOobsc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iwrMLLRrB0gAO3INpoVysF+3daEzc/mq+4ngiYoBYpSQulNVUc1Y2JPpDFfpXLk1k
 alHdOsTjP3QNQzOmhMjwW95M80NZTfuOWEo3CjGWwDXMHmSFu2jfBPRRlRKOHKPdwU
 mqHP7v/kkTDfCKiGLr2LfLaHIlWqkgK3jZMwSK0c=
Date: Sun, 5 May 2019 16:46:37 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Gwendal Grignou <gwendal@chromium.org>
Message-ID: <20190505164637.579ffb11@archlinux>
In-Reply-To: <20190503220233.64546-2-gwendal@chromium.org>
References: <20190503220233.64546-1-gwendal@chromium.org>
 <20190503220233.64546-2-gwendal@chromium.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org, bleung@chromium.org,
 tiwai@suse.com, groeck@chromium.org, broonie@kernel.org,
 enric.balletbo@collabora.com, lee.jones@linaro.org, cychiang@chromium.org
Subject: Re: [alsa-devel] [PATCH v2 01/30] mfd: cros_ec: Update license term
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri,  3 May 2019 15:02:04 -0700
Gwendal Grignou <gwendal@chromium.org> wrote:

> Update to SPDX-License-Identifier, GPL-2.0
> 
> Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
Nitpick. There are a few other trivial changes in here, that the description
should probably mention.  I doubt anyone really cares though given
how trivial the other comment changes are.

Jonathan

> ---
>  include/linux/mfd/cros_ec_commands.h | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
> index 43bee4f7d137..6fa508643da3 100644
> --- a/include/linux/mfd/cros_ec_commands.h
> +++ b/include/linux/mfd/cros_ec_commands.h
> @@ -1,25 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * Host communication command constants for ChromeOS EC
>   *
>   * Copyright (C) 2012 Google, Inc
>   *
> - * This software is licensed under the terms of the GNU General Public
> - * License version 2, as published by the Free Software Foundation, and
> - * may be copied, distributed, and modified under those terms.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
> - * The ChromeOS EC multi function device is used to mux all the requests
> - * to the EC device for its multiple features: keyboard controller,
> - * battery charging and regulator control, firmware update.
> - *
> - * NOTE: This file is copied verbatim from the ChromeOS EC Open Source
> - * project in an attempt to make future updates easy to make.
> + * NOTE: This file is auto-generated from ChromeOS EC Open Source code from
> + * https://chromium.googlesource.com/chromiumos/platform/ec/+/master/include/ec_commands.h
>   */
>  
> +/* Host communication command constants for Chrome EC */
> +
>  #ifndef __CROS_EC_COMMANDS_H
>  #define __CROS_EC_COMMANDS_H
>  

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
