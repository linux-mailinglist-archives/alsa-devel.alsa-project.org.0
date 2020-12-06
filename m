Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C53C52D0B34
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Dec 2020 08:39:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 429061749;
	Mon,  7 Dec 2020 08:38:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 429061749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607326768;
	bh=pW83JbL//G30U9mY40HpDjMwbQ7cGP6S0vxQOuBQsmM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PukLrLFN0rkqs7juTSNB4q1LQOAxeFu3AjgVAaWwKvizKfAAleNIIv2S2SPqXYDBZ
	 ZYlCwi6ex38gbpU/SPg4i6vGecMCuRWY7kJ7uBM23P/lOb8DWSmhBfTyXXNwYqFoAL
	 Jma6OY/S1S4SuHBOODrdNtcm0mtQLuG5rdOWVbs4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1C05F80264;
	Mon,  7 Dec 2020 08:37:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFF46F8016D; Sun,  6 Dec 2020 01:24:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44620F800E8
 for <alsa-devel@alsa-project.org>; Sun,  6 Dec 2020 01:24:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44620F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="V2GXwAnR"
Received: by mail-oi1-x244.google.com with SMTP id l200so10988177oig.9
 for <alsa-devel@alsa-project.org>; Sat, 05 Dec 2020 16:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ozoOEGyXNAJPWGG/Kv/VpUBzoqD5amv+PBFTvR4oIGU=;
 b=V2GXwAnRwkd7DQuxKUi6KY52LNEvDSzMrdXyk5ykHgFrDfIug2s0+erW5wVyoRQR5D
 DVM1pFySD1n5zPmS7uNOFC/+Qda0PZKS/bUDg8X/IpUsis/J5qsNqx5BTt2e6OW6f8Wl
 YOOKKv6dnxFc4ZPYnlPTANLPUyXNuHB1merK55jgHF9KLXj43VPvJwgOjEWMwVB8iNvf
 2ez2TkrhxjaDBapAyjiwI3A8Ks0a5VtaphDhecaDttojklrj+REWhDXrz6uBY0aVmnrR
 R+gYuU3fEQqm0nuCkHT/9o8B+8xjJRK95krvWk08VZzGdKFsX/QockNxXl13cPNIt+sk
 fIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ozoOEGyXNAJPWGG/Kv/VpUBzoqD5amv+PBFTvR4oIGU=;
 b=SymmU0nIy44xOP8Js4s8+qLsEbrGmB1M/UO1kStPsixyEE3Pz/vIaS4WQ/Rw3dcuI4
 oZ1VKHd8/xPYUR9LukGWQPaJq0R5DA2gBOmIgxaMMbUNKDjmO8HGHQS/aIz6Jtp16iuw
 6nqlPvRKvfPnjUpo4jxnRRia93msJcaEZHV3ZxLPnT5WNz07FxcewUePZgdmhC3WH4tS
 a3DDtxlWhQZRFHbGhgHP0ywpc2Wx6K7o7C5k0Xp7VDuXWDNB0vysiA1p6r817QMdV+1P
 6zGBxs0WVF/UU7T5hcG2FZ+2Ww6YmY5jqcMn1oTKBAiXve87uXJ85juC3IDFFfZDZ9e/
 3QmQ==
X-Gm-Message-State: AOAM533jlQZRKlICtK1WvqcCrtfFbrydkE5fAzA1yZNvMHbgKszVaM6n
 yGNanXB6wMsHXCqMsYym5QI=
X-Google-Smtp-Source: ABdhPJx/Ecgi7gj61cm8Z6U+yShJ4+mobMZavq+zzJyD0QSQmwY8zY9j35WuYSlTunGP1owbLSoOog==
X-Received: by 2002:aca:4c4f:: with SMTP id z76mr7855249oia.1.1607214251955;
 Sat, 05 Dec 2020 16:24:11 -0800 (PST)
Received: from Davids-MacBook-Pro.local ([8.48.134.51])
 by smtp.googlemail.com with ESMTPSA id q3sm1666069oot.33.2020.12.05.16.24.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Dec 2020 16:24:11 -0800 (PST)
Subject: Re: [resend/standalone PATCH v4] Add auxiliary bus support
To: Dan Williams <dan.j.williams@intel.com>, broonie@kernel.org,
 lgirdwood@gmail.com, davem@davemloft.net, kuba@kernel.org, jgg@nvidia.com
References: <160695681289.505290.8978295443574440604.stgit@dwillia2-desk3.amr.corp.intel.com>
From: David Ahern <dsahern@gmail.com>
Message-ID: <a24b3044-1379-6331-c171-be8d95f21353@gmail.com>
Date: Sat, 5 Dec 2020 17:24:08 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <160695681289.505290.8978295443574440604.stgit@dwillia2-desk3.amr.corp.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:37:43 +0100
Cc: alsa-devel@alsa-project.org, Kiran Patil <kiran.patil@intel.com>,
 gregkh@linuxfoundation.org, linux-rdma@vger.kernel.org,
 Shiraz Saleem <shiraz.saleem@intel.com>,
 Martin Habets <mhabets@solarflare.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, netdev@vger.kernel.org,
 Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 linux-kernel@vger.kernel.org, Parav Pandit <parav@mellanox.com>
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

On 12/2/20 5:54 PM, Dan Williams wrote:
> diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> index 8d7001712062..040be48ce046 100644
> --- a/drivers/base/Kconfig
> +++ b/drivers/base/Kconfig
> @@ -1,6 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0
>  menu "Generic Driver Options"
>  
> +config AUXILIARY_BUS
> +	bool
> +
>  config UEVENT_HELPER
>  	bool "Support for uevent helper"
>  	help

Missing a description and without it does not appear in menuconfig or in
the config file.

Could use a blurb in the help as well.
