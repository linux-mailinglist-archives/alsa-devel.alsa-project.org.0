Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B161A7BCA
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2019 08:37:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADD9E1676;
	Wed,  4 Sep 2019 08:36:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADD9E1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567579035;
	bh=s52NtuoduChAnssEXJqZDB7fEZYi5VtCYWeaTAywaXg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Guo0ITZYL+0Eept5YPLkEiCqVuE48lllBtcw6RyOkMSImVaYuE5FXIcJx/Na+Wn9n
	 Mg3oaKOhFYBl8GPm3fVMHt2hlo11VkgKn9arc7QXDuirNy7hLC6W/Gp4L+iRNgGKJc
	 /MpZ5VRl7iVi80D43M8AdvowFA7kViGl6D+ylecw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E3B4F803D0;
	Wed,  4 Sep 2019 08:35:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EA14F80228; Wed,  4 Sep 2019 08:35:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E40EDF80228;
 Wed,  4 Sep 2019 08:35:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E40EDF80228
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KRQY8Pf6"
Received: from localhost (unknown [122.182.201.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 84AFF2087E;
 Wed,  4 Sep 2019 06:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567578919;
 bh=fX0AE40pfxtbRZ5P+J2OtsTCuel/OpN/4yspy4TH4pw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KRQY8Pf6YpUV//wJzt3ZA6wEV276BQDhJszhb7paLxspZ8oE4twpu3EPeQOlVy6hp
 AyDlvIg6SYnEseAhudnCHQS/PNH+Qx+hn7N8sFsethMwx5WW8pzlf50MKcAoh/pfy0
 KJKg7UxdRViS7qn5hNcfJ7oyLLrbsMCXHKoScEh0=
Date: Wed, 4 Sep 2019 12:04:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard liao <yung-chuan.liao@linux.intel.com>
Message-ID: <20190904063410.GH2672@vkoul-mobl>
References: <20190829181135.16049-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190829181135.16049-1-yung-chuan.liao@linux.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 Blauciak@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, bard.liao@intel.com
Subject: Re: [alsa-devel] [PATCH] soundwire: bus: set initial value to
	port_status
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

On 30-08-19, 02:11, Bard liao wrote:
> From: Bard Liao <yung-chuan.liao@linux.intel.com>
> 
> port_status[port_num] are assigned for each port_num in some if
> conditions. So some of the port_status may not be initialized.

Applied, thanks

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
