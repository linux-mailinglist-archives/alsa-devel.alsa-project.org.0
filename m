Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 234DF101265
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 05:17:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 664551690;
	Tue, 19 Nov 2019 05:16:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 664551690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574137039;
	bh=qEWEVY4zdOHskvoAaw0Iu0ie1dUvsKxaDodDVZWL48U=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B//ZCt5ve9lnZKJmS+3E1p2XbPHgp3njMx+KxXDIlYjBapqaIMY8tNXrBn4p+HUjr
	 un5SmouOJa0nGGMRNMt9xNRLaA6aMLMAtNJmTNXW53g0uxu/zum+ZoSf5aT3BkqKwx
	 /98nD6ekB43OrqXD182VDAn+ShDFYoSbavHcyyRY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76014F80139;
	Tue, 19 Nov 2019 05:15:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 491C5F80137; Tue, 19 Nov 2019 05:15:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93974F800FF
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 05:15:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93974F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="R69eQpWW"
Received: from localhost (unknown [106.200.237.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 214C82231A;
 Tue, 19 Nov 2019 04:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574136925;
 bh=bDUyDx/f/KUw+cY6r3VOmVRVO8EkUIrxtun7yYSHFR4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R69eQpWWPuzeknOX41NxKcmnDBr9VqW6W3yXZd5PDbDKn/5FHE0JoKW9DwW9GjXUu
 GQJCYl5P2IUSWBL8Xd7axFNwbdJy6VgPL5/t5zwYLgdkbdPMko4BhrSnxKl2taQRCP
 IT7fDfoy1charOQ29skTcD/dialfY7BvCZW113Qk=
Date: Tue, 19 Nov 2019 09:45:21 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191119041521.GB82508@vkoul-mobl>
References: <20191115102705.649976-1-vkoul@kernel.org>
 <19c70dac-aa3e-f0ea-d729-26df4f193eb0@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <19c70dac-aa3e-f0ea-d729-26df4f193eb0@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [RFC PATCH 0/3] ALSA: compress: Add support for
	FLAC
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

On 15-11-19, 08:55, Pierre-Louis Bossart wrote:
> 
> 
> On 11/15/19 4:27 AM, Vinod Koul wrote:
> > The current design of sending codec parameters assumes that decoders
> > will have parsers so they can parse the encoded stream for parameters
> > and configure the decoder.
> 
> that's not quite correct. It's rather than there was no need so far for
> existing implementations to have parameters on decode, this was never a
> limitation of the design, see e.g. the comments below:

You might be correct here as this is implementation based and in this
case looks like decoders also need the additional params

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
