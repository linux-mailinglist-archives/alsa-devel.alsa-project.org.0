Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDF15752FB
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 18:39:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FBE118CB;
	Thu, 14 Jul 2022 18:38:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FBE118CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657816788;
	bh=/etxzpekk2QNgyQ/cjmZnPyu9TymXIBHWqE6IPl+5pA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bhYNqH6y2uKhBxjHKLR6D3KTLV/rvcQa+RRHgubAUTvQ+9jDyI2FhgEpJunhpH8gW
	 kkLVzLjfAO7MTlPfH0ef9RyK6IRJGArr9ubpjogFdlT2SqiwC/zdF33Hspx+9d62WM
	 vNaOYqQILy1LyeT76LkIn0NnqX6B/eMr9paSBN3A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0ED8F805BD;
	Thu, 14 Jul 2022 18:34:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C3B2F80254; Wed, 13 Jul 2022 18:48:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 42EBEF8019B
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 18:48:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42EBEF8019B
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A800615A1;
 Wed, 13 Jul 2022 09:48:01 -0700 (PDT)
Received: from monolith.localdoman (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FEE93F792;
 Wed, 13 Jul 2022 09:48:00 -0700 (PDT)
Date: Wed, 13 Jul 2022 17:48:26 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: rockchip-i2s: Undo BCLK pinctrl changes
Message-ID: <Ys73WtpaZLdpsCdL@monolith.localdoman>
References: <20220713130451.31481-1-broonie@kernel.org>
 <Ys7SS/ueE66CBpZK@monolith.localdoman>
 <Ys7n+/9v+CygvODo@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ys7n+/9v+CygvODo@sirena.org.uk>
X-Mailman-Approved-At: Thu, 14 Jul 2022 18:34:36 +0200
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>
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

On Wed, Jul 13, 2022 at 04:42:51PM +0100, Mark Brown wrote:
> On Wed, Jul 13, 2022 at 03:25:27PM +0100, Alexandru Elisei wrote:
> > On Wed, Jul 13, 2022 at 02:04:51PM +0100, Mark Brown wrote:
> > > The version of the BCLK pinctrl management changes that made it into
> > > v5.19 has caused problems on some systems due to overly strict DT
> > > requirements but attempts to fix it have caused further breakage on
> > > other platforms.  Just drop the changes for this release, we already
> > > have a better version queued for -next.
> 
> > For what it's worth, I am now able to boot my rockpro64-v2 with this patch.
> 
> So Tested-by: then?

Yes, please:

Tested-by: Alexandru Elisei <alexandru.elisei@arm.com>

Thanks,
Alex
