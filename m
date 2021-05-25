Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFB239043E
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 16:45:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B43C11737;
	Tue, 25 May 2021 16:45:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B43C11737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621953954;
	bh=NJdUar8af0rdZYBLwdPudA7NpymLsCZxH70tBGhysbc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=POUjhBSwYNQoiNM8N6eemjLhX3ppGbLgHk/gGQAaYY94J2C7lBXnTdhiSxAJ9tB38
	 uWEqDfovD6oB/u2WHIsM/YZJyjFDorsQaHfjz5GcBb4jfPm/BImZKnrO9zATp6NGv+
	 KkbMMLj9MMfqL3V/7jAAIt8+c0dQKau4KjIP/BbQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A8CEF800FB;
	Tue, 25 May 2021 16:44:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EF1BF800FA; Tue, 25 May 2021 16:44:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66E26F800F7
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 16:44:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66E26F800F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="2kKHVtuP"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E1C9C61284;
 Tue, 25 May 2021 14:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621953859;
 bh=NJdUar8af0rdZYBLwdPudA7NpymLsCZxH70tBGhysbc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2kKHVtuPcKdBu8+eEcJTppd47tQR4i/DIUwvrkzHptaah21baBrjuoVqKn5IzbP4h
 PXM3ew0KIW4KO1L38va50OfU9kxMI0n/mdwy7ygCB9p+Ewblsa6QycIYJffOiQzGp+
 trfPiuPrrOiadUanaAWsWpgeUUcx8cZfygolx2c0=
Date: Tue, 25 May 2021 16:44:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.12 30/63] ASoC: rt5645: add error checking to
 rt5645_probe function
Message-ID: <YK0NQXRPpFl2Q1ut@kroah.com>
References: <20210524144620.2497249-1-sashal@kernel.org>
 <20210524144620.2497249-30-sashal@kernel.org>
 <YK0DRL1hXkWnIjOA@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YK0DRL1hXkWnIjOA@sirena.org.uk>
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Phillip Potter <phil@philpotter.co.uk>
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

On Tue, May 25, 2021 at 03:01:40PM +0100, Mark Brown wrote:
> On Mon, May 24, 2021 at 10:45:47AM -0400, Sasha Levin wrote:
> > From: Phillip Potter <phil@philpotter.co.uk>
> > 
> > [ Upstream commit 5e70b8e22b64eed13d5bbebcb5911dae65bf8c6b ]
> > 
> > Check for return value from various snd_soc_dapm_* calls, as many of
> > them can return errors and this should be handled. Also, reintroduce
> > the allocation failure check for rt5645->eq_param as well. Make all
> 
> I also don't have this commit and can't see any sign of it
> having been submitted upstream.

I cc:ed you on it, as it was part of the larger "revert the umn.edu"
mess.  It's now in 5.13-rc3.

thanks,

greg k-h
