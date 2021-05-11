Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1898837A67D
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 14:23:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EB8317C1;
	Tue, 11 May 2021 14:22:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EB8317C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620735807;
	bh=O3QNVnsC5TeoMy1cHhV+c5blmkdN6rA7UB4HtR2t8Hk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gFzHUM6xDMApPMt03CPIBtIkA4WlWR1VB8oCgTEe3rQIUqxoqDNtY/2xgRTApJnRT
	 ATi8ofd3URkI0T2t3YXvKf41XTkPCc/IRgDobEW2pXibd3HZo2/Ev+mhLi66b1ppW1
	 7UUkRWzDK/cuSwCdJ4/vKMNvTntf+QlVO76k/u1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FBCEF801D5;
	Tue, 11 May 2021 14:22:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFDC0F80163; Tue, 11 May 2021 14:22:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E4DAF800E9
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 14:22:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E4DAF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hoCuNSFY"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B5426134F;
 Tue, 11 May 2021 12:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620735745;
 bh=O3QNVnsC5TeoMy1cHhV+c5blmkdN6rA7UB4HtR2t8Hk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hoCuNSFYdcNdSfmbWXNuq51uAjg7g6HiSWYgvVNmiyC1RPGJKLdH0Yy83M/FuSWv5
 UmAUztotp5tBuNwnmufdMnASuYbSTJywEGa85H5CeExBuLINTe3pQM9WdX4bwRwhWf
 qnFKbYmY4xw2uw8OOfB9GCMLY++OA5n8zuFldDkFnsU/61212RILk7T/G73KQLbR/G
 cov+8AadDl1MbrvnHksb9O/O+s8qquxAf4IhBjWdKDbgIPR3D/79zBCXkNUwA5hUFr
 8d/3x/XrBvlg6bXdHqiH/aJYm9K/OZYCiYblT6iVUV0uKuJsbdzLgV12ZIHv4JRChd
 es4u0U5g1pwvg==
Date: Tue, 11 May 2021 17:52:21 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [RESEND PATCH] soundwire: cadence_master: always set CMD_ACCEPT
Message-ID: <YJp2/cnaXbMTkzTq@vkoul-mobl.Dlink>
References: <20210511025247.25339-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511025247.25339-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, sanyog.r.kale@intel.com, rander.wang@linux.intel.com,
 bard.liao@intel.com
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

On 11-05-21, 10:52, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> The Cadence IP can be configured in two different ways to deal with
> CMD_IGNORED replies to broadcast commands. The CMD_ACCEPT bitfield
> controls whether the command is discarded or if the IP proceeds with
> the change (typically a bank switch or clock stop command).
> 
> The existing code seems to be inconsistent:
> a) For some historical reason, we set this CMD_ACCEPT bitfield during
> the initialization, but we don't during a resume from a clock-stoppped
> state.
> b) In addition, the loop used in the clock-stop sequence is quite
> racy, it's possible that a device has lost sync but it's still tagged
> as ATTACHED.
> c) If somehow a Device loses sync and is unable to ack a broadcast
> command, we do not have an error handling mechanism anyways. The IP
> should go ahead and let the Device regain sync at a later time.
> 
> Make sure the CMD_ACCEPT bit is always set.

Applied, thanks

-- 
~Vinod
