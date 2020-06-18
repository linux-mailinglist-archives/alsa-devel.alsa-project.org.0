Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F04B1FED4C
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 10:14:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D0F51744;
	Thu, 18 Jun 2020 10:13:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D0F51744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592468055;
	bh=v4uiJBUsIJjUJey1USCJg3QQsrEncQHO1q9wk40uiTc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FWSPulWYgwWBQZhiASqQ4PwX1o8kLBLm+f7YrNDiMnOADFRCCV4R/o2h4L2wvMe6T
	 NA14qLGUeUaTEQyDO6lsqSm9WTui8cVfFiJm72E6jf70LEspU0ZIG+tqgZVnYMmNZE
	 HpY/T4fW1g3j0hSZCfM7Erx1T7J/fBaIJ7y+g3fI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28F2EF800EF;
	Thu, 18 Jun 2020 10:12:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7092F80116; Thu, 18 Jun 2020 10:12:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D292F80101
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 10:12:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D292F80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="e3MwnKPy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=8WLntUDK1QrdTrtcYEKpz3qz/VsDSn22rJQznhsWmU0=; b=e3MwnKPyFxHRL5O429eXq+MBeb
 V99twzBHr2ZXWFY2ynglX6gSFx36uKpjd+0ghXzeWdf0xh2c8LctMz+VtELXUOcNHtz9XzjU8fUCr
 l8CkSq1+PCFiYMhidXjLG1bJ5mmQfdYW5M9R7EtvGSPXG/yJFPaHK2jp8Y4bF0piLT+UoiNL7ynuj
 Z11k3keHfxpXLobhqyoreaHbJEfFh3hYOuFNAzAig5DQnpVAPzPfHBKqxfNtgI0ibbUbbi0aN9NPv
 5T9Rfw7VLV+IYFZNDXTnx6Qr4fb7bP+SBltVUTpaxTYa4LfhzntaknHQWJeRPCmhXI7dDHCxW7V1s
 fhhWC9TQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jlpej-0001PE-74; Thu, 18 Jun 2020 08:12:17 +0000
Date: Thu, 18 Jun 2020 01:12:17 -0700
From: Christoph Hellwig <hch@infradead.org>
To: JaeHun Jung <jh0801.jung@samsung.com>
Subject: Re: [PATCH] ANDROID: sound: usb: Add vendor's hooking interface
Message-ID: <20200618081217.GA25552@infradead.org>
References: <CGME20200617022554epcas2p214a49f03a15e504d8faa28148e06e796@epcas2p2.samsung.com>
 <1592360304-29621-1-git-send-email-jh0801.jung@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592360304-29621-1-git-send-email-jh0801.jung@samsung.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Wed, Jun 17, 2020 at 11:18:24AM +0900, JaeHun Jung wrote:
> In mobile, a co-processor is used when using USB audio
> to improve power consumption.
> hooking is required for sync-up when operating
> the co-processor. So register call-back function.
> The main operation of the call-back function is as follows:
> - Initialize the co-processor by transmitting data
>   when initializing.
> - Change the co-processor setting value through
>   the interface function.
> - Configure sampling rate
> - pcm open/close
> 
> Bug: 156315379

None of that is acceptable without an in-tree user.  Never mind that
the interface just seems horrible.  I'm pretty sure we could do
somehting much better and more specific based on the actual needs of
the user, so please post it.
