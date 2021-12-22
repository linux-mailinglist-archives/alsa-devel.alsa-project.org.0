Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EEE47CA11
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Dec 2021 01:10:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ED8817D2;
	Wed, 22 Dec 2021 01:09:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ED8817D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640131826;
	bh=+mbTfBt+app/XVDp8opgqDoBTooYeRN0yin+mFWbY3k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OGuPNmYgpjVFfPvltk2oQGQ3D2fBKOdi/pNX+ur8/q8FC4CLQmtq1P6DwsTXX0Lwx
	 Oq0RL74gFiUy5H4/zY52dFar2PKRvD2AFLAU79bdKKI/5w/xdzmKvee8CWNV0PwtC5
	 1zG1PyP/T5uUlXeZ+bC1myoCkg4zzAgB6VF78nR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B4CFF80125;
	Wed, 22 Dec 2021 01:09:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B60CF800E3; Wed, 22 Dec 2021 01:09:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 357D3F800E3
 for <alsa-devel@alsa-project.org>; Wed, 22 Dec 2021 01:09:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 357D3F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca
 header.b="gdeWu7dc"
Received: by mail-qk1-x732.google.com with SMTP id de30so764750qkb.0
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 16:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=p6IPtjYLk9ApU3C7Ntq5pzotDKFMZC8bLzlwMwv2DHo=;
 b=gdeWu7dcldq1KRDtXrK466kfK8ZpHrcRgPVzyQPYoZHEx9qR5NNRQnXdVTPhjY05pS
 VX54P/WP7bBdN0Y2YviUR+IzQczADq36rQPDvSeBSlR5CzNBM9hnUWmpeLwh1zOgIfG4
 T1ItolfMfK71PTBrsf594uOVGuRXfsMiL7rUYjcaQdrzDkXfR72il5m2jMYTcW+/hd/4
 pJXYLsW1GpV4xGgUZjfQk/9GLjuyd3LG4uiIxEhBeAPgio5IpswJHOM1wzN1JoffZwqF
 0w74l8kyv5Y2z+6wvMkdK3wXIuGOEzR/6OvL6lryE3Ism03q74Y3rB7rEvGeBhEU3L/r
 JRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p6IPtjYLk9ApU3C7Ntq5pzotDKFMZC8bLzlwMwv2DHo=;
 b=c4OWY5irmSzFmX4UsVJN8IBIRomcjBH23/0zuxGq3/susT/jAS6l4a2gPP/rTNN+5V
 944a1lXF6MFE9H7BA+epk77vmNYVAKcejT0Bq+R0KygPrmV6keLjsjNRdaxSPq/B9QmH
 g372JmbejehXQeK2ksBEzH/hB3DEzu0udACG0Y8fM0C/NlsqvepyxMP4LrLY+79JxjPR
 wL/0U6N+hwkbw8f/UNiGCtbS+uQ7LzF1XCFdUgivAhr0lygKyIA9HPDwPwzGc5MAUPzA
 7xKlqfGrZvTOYe8Vu7Yi8lYJCElxbCLX6MPfX5f7fcMrW5USN9IID6jfxM9sG32toNyG
 uKJw==
X-Gm-Message-State: AOAM531J/NB+0aUJXLxFtKsN5VlD8cTq9OaRRbP7Bdhsvc4qavYAUum2
 cWyRXWH11e2dsD4Jw7zE5s4Ewg==
X-Google-Smtp-Source: ABdhPJxZLJ+lxeM7m6HgpAAgvnFViXb+v/+egaiwjU9Z/pHPuR+zNWgaBbyZ73XdGEkhpy4k4oD6XA==
X-Received: by 2002:a05:620a:4687:: with SMTP id
 bq7mr553892qkb.231.1640131746529; 
 Tue, 21 Dec 2021 16:09:06 -0800 (PST)
Received: from ziepe.ca ([206.223.160.26])
 by smtp.gmail.com with ESMTPSA id h2sm457177qkn.136.2021.12.21.16.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 16:09:06 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1mzpBp-007GVm-3o; Tue, 21 Dec 2021 20:09:05 -0400
Date: Tue, 21 Dec 2021 20:09:05 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "David E. Box" <david.e.box@linux.intel.com>
Subject: Re: [PATCH 0/4] driver_core: Auxiliary drvdata helper cleanup
Message-ID: <20211222000905.GN6467@ziepe.ca>
References: <20211221235852.323752-1-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221235852.323752-1-david.e.box@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 mustafa.ismail@intel.com, leon@kernel.org, mst@redhat.com,
 linux-rdma@vger.kernel.org, gregkh@linuxfoundation.org, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, vkoul@kernel.org,
 davem@davemloft.net, hdegoede@redhat.com, dledford@redhat.com,
 yung-chuan.liao@linux.intel.com, netdev@vger.kernel.org, kuba@kernel.org,
 andriy.shevchenko@linux.intel.com, shiraz.saleem@intel.com, saeedm@nvidia.com,
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

On Tue, Dec 21, 2021 at 03:58:48PM -0800, David E. Box wrote:
> Depends on "driver core: auxiliary bus: Add driver data helpers" patch [1].
> Applies the helpers to all auxiliary device drivers using
> dev_(get/set)_drvdata. Drivers were found using the following search:
> 
>     grep -lr "struct auxiliary_device" $(grep -lr "drvdata" .)
> 
> Changes were build tested using the following configs:
> 
>     vdpa/mlx5:       CONFIG_MLX5_VDPA_NET
>     net/mlx53:       CONFIG_MLX5_CORE_EN
>     soundwire/intel: CONFIG_SOUNDWIRE_INTEL
>     RDAM/irdma:      CONFIG_INFINIBAND_IRDMA
>                      CONFIG_MLX5_INFINIBAND
> 
> [1] https://www.spinics.net/lists/platform-driver-x86/msg29940.html 

I have to say I don't really find this to be a big readability
improvement.

Also, what use is 'to_auxiliary_dev()' ? I didn't see any users added..

Jason
