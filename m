Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC953D258B
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 16:18:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5534716EB;
	Thu, 22 Jul 2021 16:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5534716EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626963538;
	bh=b1644+lt/CLt2y1BrUgtSKpye3yq+XLJ88kLrk3Z5sQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nMyhL74asDwJGo/B1tTACW+CQPHHWd5TL6HzDLa4QOKnGAkXtjxlwPIPKBGLFDcQr
	 JkIndyzLDakCqQe5A/Xd7LxtjQSEevPcrL69QHpX5u3Wb9AN8iORTOLdpjfJs59JeY
	 /hAC4OjV8G2r5HhVPgaBXdPeiBcxjhX9zCegKvKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4626CF80114;
	Thu, 22 Jul 2021 16:17:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 994ACF8032B; Thu, 22 Jul 2021 16:17:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B353F80114
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 16:17:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B353F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m0TehVqA"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C12886128D;
 Thu, 22 Jul 2021 14:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626963466;
 bh=b1644+lt/CLt2y1BrUgtSKpye3yq+XLJ88kLrk3Z5sQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m0TehVqAPaV+xHqi7bCZDUIYUvLDFrpkWOYonPSMmu9m6pDE125bXXA3wPwsBY7xS
 tMTkQbN3qxPx6jI7S9/CmG105hZpF25mPYd1YBuHIxXAt2ioPKce8KgOXNhvMdZl5K
 Cn8tNIGaKvhq5/C7gxog5df2V630JaYUM2UOctlYCGyda7IPlVZ/pODJhy3l7/ia5A
 9rWgHoL2QHULqXWV7aO2Xu6Q37zFXNL80QKbZTv/+5I9WZ/X6Hj46DZibOILU2KQYZ
 x3u6S/3olVAANAa8fsQXQoqqKAS4dP7sr0XBmWoOkhsLNp5AqqhPKyubEkh6wYO6nN
 I6iargh1gwXOg==
Date: Thu, 22 Jul 2021 19:47:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: cadence: Remove ret variable from
 sdw_cdns_irq()
Message-ID: <YPl+BrBL85aX1/uT@matsya>
References: <20210714015555.17685-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714015555.17685-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

On 14-07-21, 09:55, Bard Liao wrote:
> From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> 
> The ret is not used in the interrupt handler, it is just returned without
> any condition or change.
> We can return the IRQ_HANDLED directly.

Applied, thanks

-- 
~Vinod
