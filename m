Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AED84D9C0D
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Mar 2022 14:23:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8549D1816;
	Tue, 15 Mar 2022 14:22:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8549D1816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647350580;
	bh=R6kae4TacDga4tv85BVle/IEKjeiwayJakAldc1t3Gw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d+yf3fsdJGp77ES5TmcoDgrF+TaaZsEjhLFvBnTxsFNcDeN8rZU5YpzsdIZ2ti36M
	 LK3Oyn/Kc7leS8hc2zX9krnwff0Yx8hO+BSI3eSRGx3oiZVYbLJ+Fr+DnZEJbZduXk
	 pEgqAjfe9Xzq4SOn3tkQt2zPSsqDRSc5wCyJTaKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25484F80162;
	Tue, 15 Mar 2022 14:22:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 565C0F80162; Tue, 15 Mar 2022 14:22:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15854F80095
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 14:22:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15854F80095
Received: by verein.lst.de (Postfix, from userid 2407)
 id 796F568AA6; Tue, 15 Mar 2022 14:22:02 +0100 (CET)
Date: Tue, 15 Mar 2022 14:22:02 +0100
From: Christoph Hellwig <hch@lst.de>
To: Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>
Subject: Re: [PATCH] [v2] nvme-pci: disable write zeros support on specific
 SSDs
Message-ID: <20220315132202.GA12452@lst.de>
References: <20220315132059.12747-1-mark_hsieh@wistron.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220315132059.12747-1-mark_hsieh@wistron.corp-partner.google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: alsa-devel@alsa-project.org, Mark_Hsieh@wistron.com, sagi@grimberg.me,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, axboe@fb.com,
 kbusch@kernel.org, hch@lst.de
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

On Tue, Mar 15, 2022 at 09:20:59PM +0800, Mark Hsieh wrote:
> Like commit 5611ec2b9814 ("nvme-pci: prevent SK hynix PC400 from using
> Write Zeroes command"), Micron has the same issue:
> [ 6305.633887] blk_update_request: operation not supported error, dev
> nvme0n1, sector 340812032 op 0x9:(WRITE_ZEROES) flags 0x0 phys_seg 0 prio class 0
> 
> So also disable Write Zeroes command on Micron.

This still ignores all the questions I've asked.
