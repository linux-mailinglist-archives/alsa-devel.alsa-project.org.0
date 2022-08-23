Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B60259E832
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 19:03:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD6E916A2;
	Tue, 23 Aug 2022 19:02:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD6E916A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661274221;
	bh=Ibs+xRoiWZvLOCWaBxHFQWXGaJte9vq3bvRSu1GDUiM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u/SEGejyV6EW0s4PTvCIaQljJlIRF9gmLgM4UcxtKZBGpF57oDEtXD765pB0Fo8aZ
	 4p+3ZTESXfHNfcL4R6V5Bn+/7URme5zEaAyUedyCF94a58uy45WhEW1QaqcAe5EV+l
	 fZ3XRb5GT+XxugS1h+FkjBEY2+jLf7GYv2ImacqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60FAEF800C9;
	Tue, 23 Aug 2022 19:02:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E74D8F8020D; Tue, 23 Aug 2022 19:02:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C0C6F800C9
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 19:02:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C0C6F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="F0YMd2tZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E810E61479;
 Tue, 23 Aug 2022 17:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B513AC433D6;
 Tue, 23 Aug 2022 17:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661274155;
 bh=Ibs+xRoiWZvLOCWaBxHFQWXGaJte9vq3bvRSu1GDUiM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F0YMd2tZxtNH50fa66VGMeNTwf7iBCdhboNsBN+ki8oajLcDN2j5BybfnwsTZAUno
 U/A00OxbKXCPJtxhKpuLFZUCpBwxgZxyfnNExNkYvb8pN6TZttmqnv3MzHwiB2rqnN
 J+MYri8PCvS5f96QUtVEqNiFNRbI1vsqEY7xQBoimQ3sRytNtEaMuqujAorPA5RdzE
 GKzIUnYnv5nQmWAlt3QjzfbIs1tKW1hpLd8WdhmEbWRx+SZ6VkeAcNq4qDJk3779qC
 RsPe3gq9/DtjLd6qiETysJYSp++UToRo9zuufO1W0Z59e2lZeOwc5rsPXXTryhHQB6
 F1rjDAC+75FmA==
Date: Tue, 23 Aug 2022 22:32:31 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] soundwire: remove use of __func__ in dev_dbg
Message-ID: <YwUIJ4fuPIB4vJLZ@matsya>
References: <20220823050158.2671245-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823050158.2671245-1-yung-chuan.liao@linux.intel.com>
Cc: gregkh@linuxfoundation.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, bard.liao@intel.com,
 pierre-louis.bossart@linux.intel.com
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

On 23-08-22, 13:01, Bard Liao wrote:
> The module and function information can be added with
> 'modprobe foo dyndbg=+pmf'

Applied, thanks

-- 
~Vinod
