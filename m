Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFAB2C18BB
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 23:57:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC9F81689;
	Mon, 23 Nov 2020 23:56:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC9F81689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606172260;
	bh=mRUHitJaOyqn1hd4wDmZgomWCwCAIRHpMKchRTpPFnw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lqmDh7O469k41Z61vodjerGbQosiJQip9KY4qW5ybghMGytSizSAkTZP41nKap1x7
	 ISBxUuEX05p4l8w3sEe6y1jn9FsanwXIYnAGkR+p79AS1Hmi6EwMDc2sDwNFbeWVL/
	 hrszIr+IrgTr1QwY53XCrBUgx3h73ycfCq4RbPa8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 273A6F80268;
	Mon, 23 Nov 2020 23:56:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEEF6F80255; Mon, 23 Nov 2020 23:56:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79EB5F80128
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 23:56:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79EB5F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q51XUV+d"
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 32899206D8;
 Mon, 23 Nov 2020 22:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606172158;
 bh=mRUHitJaOyqn1hd4wDmZgomWCwCAIRHpMKchRTpPFnw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q51XUV+dg9wSR9NSWw2KoZZQL6dKg42MZtT+VMZ66i3WiJRBwat6oH7XFG9kFHAw8
 JJ3lBz/BP4XgyK6FmV7Rch5PjWkCKTCtSpNsNNS+afCE+ONTdvlEjSaxdN6c/ks3UT
 BmjTfErre0pc7trImuHF7wYf5ncLPCEzFTpbAhl8=
Date: Mon, 23 Nov 2020 16:56:12 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 066/141] ALSA: hdspm: Fix fall-through warnings for Clang
Message-ID: <20201123225612.GS21644@embeddedor>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <3f70182b366fca7e085a3b57cb2eb193be04eed8.1605896059.git.gustavoars@kernel.org>
 <s5hr1ondsdz.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hr1ondsdz.wl-tiwai@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-hardening@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
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

On Sat, Nov 21, 2020 at 09:30:00AM +0100, Takashi Iwai wrote:
> On Fri, 20 Nov 2020 19:33:52 +0100,
> Gustavo A. R. Silva wrote:
> > 
> > In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> > by explicitly adding a break statement instead of letting the code fall
> > through to the next case.
> > 
> > Link: https://github.com/KSPP/linux/issues/115
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> Thanks, applied.

Thanks for all you've taken, Takashi.
--
Gustavo
