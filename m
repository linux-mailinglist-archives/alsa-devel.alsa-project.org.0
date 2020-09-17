Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5597C271DA8
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 10:13:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFA7A16A4;
	Mon, 21 Sep 2020 10:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFA7A16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600675980;
	bh=hk9nCyF/JI11/AhY4FIhKKTnq4cuJbUe4goriWcv4DM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j9yO5gmEEmmrhKQrApZFROr28q4uXweJAUOHhItZHqFkExDYyqUbhNDRBNIU8rjqJ
	 eIIfTvLoOu2ejDK/xS1b0Pnvv15sdYeKIYPT3XIipD8Svi2SUhh8i3w6cz0P9mpUgq
	 WXupY7tbAfT7UyS3wAQBjyLPlJr+YArBE3PRdmLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF151F802C4;
	Mon, 21 Sep 2020 10:10:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99994F80212; Thu, 17 Sep 2020 10:03:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAFA8F800E8
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 10:03:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAFA8F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=netronome-com.20150623.gappssmtp.com
 header.i=@netronome-com.20150623.gappssmtp.com header.b="Xm9muXpL"
Received: by mail-wm1-x342.google.com with SMTP id k18so1037645wmj.5
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 01:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TUShtxADeMIRUv08jDyFnIdO2h4AVdi1g89uLOtrWXw=;
 b=Xm9muXpLMfdw+3JTaQ5+6nxJDSneO0K8th2wgQ0VLh2VI2BmK+XWoQ9cDtIn8+KaRJ
 B45Xbntr5JjNU8mF7nIZd8VP+CTHviEtF1Um5VazOhr6GEQCgh9bbRNIM6C+XWioNjmk
 ImuOo8Gi8eD0FtSQ7hHZ1yPAo82BLFHJwGGg0UxKCYs0oMSSpMWIe45dJUN+DzUELaKQ
 JzvvcS8KVPQMZJTfgm/lLBewbBl9UGKGHM3XV6hYGQwunOqgCSfJKO8sQaLl1M6X9BRD
 K+XM2hJttDJQqNZl5Xftk9yd2fnhmTZR2ol6vfSH0itoQkT2+o/FcX7saxpuLl0f47l5
 EzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TUShtxADeMIRUv08jDyFnIdO2h4AVdi1g89uLOtrWXw=;
 b=S58g3qNtzwkiu56oPJkhXFABYGiU1MGipxwVhOnc/HWi3e7TOWrYqLUpomZE0WL/ru
 Az8gdxmqJ4DYfm9ZJzEBkv5UffBfZscXqiiv/p5gsZXX59NwWeHcCFPpeyEc2sfQEImK
 ToD853SwXC11UyD5Hyctd21kF0pfJn9LpjCX1pw0MRpqSzxAZzMWQ6cXHi8gfWJWfcOk
 2HY1v/yRuNxrrCWxjgqzQLeozqbDaBsRtc95PrQGoiHyhdSt140BrBKcz8PG0QooEcVR
 7KOVO1jMc1mqifdUYtBW6NWRwui8KV4XMsKMSsZUgPT+Y9pWzYkAGk7rjworrgvY9vRz
 qowQ==
X-Gm-Message-State: AOAM533ZPjEjAjKbK3qA/vFxMYwzdyJCISEjLJEMkGPOQzHiwpx1Zdcl
 Bks/oo/OykaeHmsCELIPhYIFLg==
X-Google-Smtp-Source: ABdhPJzTwzfeJOnCQh65prZummqH9JR09Yxja+zvv2OTSAZpPcom4k7xuvXSyH3Yv50qn/8+2aIWyQ==
X-Received: by 2002:a1c:e256:: with SMTP id z83mr8793930wmg.33.1600329817598; 
 Thu, 17 Sep 2020 01:03:37 -0700 (PDT)
Received: from netronome.com ([2001:982:756:703:d63d:7eff:fe99:ac9d])
 by smtp.gmail.com with ESMTPSA id a13sm9836030wme.26.2020.09.17.01.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 01:03:36 -0700 (PDT)
Date: Thu, 17 Sep 2020 10:03:35 +0200
From: Simon Horman <simon.horman@netronome.com>
To: Joe Perches <joe@perches.com>
Subject: Re: [oss-drivers] [trivial PATCH] treewide: Convert switch/case
 fallthrough; to break;
Message-ID: <20200917080334.GB5769@netronome.com>
References: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 21 Sep 2020 10:10:23 +0200
Cc: linux-wireless@vger.kernel.org, linux-fbdev@vger.kernel.org,
 oss-drivers@netronome.com, nouveau@lists.freedesktop.org,
 alsa-devel <alsa-devel@alsa-project.org>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-ide@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 sparclinux@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
 linux-rtc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, dccp@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-atm-general@lists.sourceforge.net, linux-afs@lists.infradead.org,
 coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-mmc@vger.kernel.org, Kees Cook <kees.cook@canonical.com>,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-sctp@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-nvme@lists.infradead.org,
 storagedev@microchip.com, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 Jiri Kosina <trivial@kernel.org>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
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

On Wed, Sep 09, 2020 at 01:06:39PM -0700, Joe Perches wrote:
> fallthrough to a separate case/default label break; isn't very readable.
> 
> Convert pseudo-keyword fallthrough; statements to a simple break; when
> the next label is case or default and the only statement in the next
> label block is break;
> 
> Found using:
> 
> $ grep-2.5.4 -rP --include=*.[ch] -n "fallthrough;(\s*(case\s+\w+|default)\s*:\s*){1,7}break;" *
> 
> Miscellanea:
> 
> o Move or coalesce a couple label blocks above a default: block.
> 
> Signed-off-by: Joe Perches <joe@perches.com>

...

> diff --git a/drivers/net/ethernet/netronome/nfp/nfpcore/nfp6000_pcie.c b/drivers/net/ethernet/netronome/nfp/nfpcore/nfp6000_pcie.c
> index 252fe06f58aa..1d5b87079104 100644
> --- a/drivers/net/ethernet/netronome/nfp/nfpcore/nfp6000_pcie.c
> +++ b/drivers/net/ethernet/netronome/nfp/nfpcore/nfp6000_pcie.c
> @@ -345,7 +345,7 @@ static int matching_bar(struct nfp_bar *bar, u32 tgt, u32 act, u32 tok,
>  		baract = NFP_CPP_ACTION_RW;
>  		if (act == 0)
>  			act = NFP_CPP_ACTION_RW;
> -		fallthrough;
> +		break;
>  	case NFP_PCIE_BAR_PCIE2CPP_MapType_FIXED:
>  		break;
>  	default:

This is a cascading fall-through handling all map types.
I don't think this change improves readability.

...
