Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9861B39043D
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 16:45:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26E3D1731;
	Tue, 25 May 2021 16:44:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26E3D1731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621953940;
	bh=PKuRkkYVUsjsx8prZ4f2odHDCB8TksLtWQ8YdxSBZWE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z2SqG9u9Jh1uVgT2o4HgdDUVYjqrLyqjYPyHkqqzB50smwUodidMLenxgZvDGF/52
	 6DKn1eovM4QxLqtQyRvkOjmO2v5uJijJlZAQQrCymeGaEU94QzQXVPRF9jb36QaguC
	 ambP8+CjCEvTAyrrSs8bPUKgBVrzjCgJxZx4xbgQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 866D8F800B6;
	Tue, 25 May 2021 16:44:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18479F800CB; Tue, 25 May 2021 16:44:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BCF2F800AC
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 16:43:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BCF2F800AC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="mfYYI3h3"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B87A6141C;
 Tue, 25 May 2021 14:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621953835;
 bh=PKuRkkYVUsjsx8prZ4f2odHDCB8TksLtWQ8YdxSBZWE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mfYYI3h3CqOHnRs7Q1WE//kdP0frslMGuyujkauCTBsCHJ1JTGRuJuJNS9w0KlrYA
 h11P5RUM73YBiwrrfLgTOvLH3WT29nNgl36DT9oje2EOvl+XZbOb4fHQArIazABedT
 tBCVrmfljZpJ48SarpdR8J0TE8gl+pzPr1Q/8Xjs=
Date: Tue, 25 May 2021 16:43:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.12 32/63] ASoC: cs43130: handle errors in
 cs43130_probe() properly
Message-ID: <YK0NKG0l3a5vjO8K@kroah.com>
References: <20210524144620.2497249-1-sashal@kernel.org>
 <20210524144620.2497249-32-sashal@kernel.org>
 <YK0C/HLiQtt/vyqV@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YK0C/HLiQtt/vyqV@sirena.org.uk>
Cc: Sasha Levin <sashal@kernel.org>, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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

On Tue, May 25, 2021 at 03:00:28PM +0100, Mark Brown wrote:
> On Mon, May 24, 2021 at 10:45:49AM -0400, Sasha Levin wrote:
> > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > 
> > [ Upstream commit 2da441a6491d93eff8ffff523837fd621dc80389 ]
> > 
> > cs43130_probe() does not do any valid error checking of things it
> > initializes, OR what it does, it does not unwind properly if there are
> > errors.
> 
> I don't have this commit and can't see any sign of it having been
> submitted upstream.  Where is it being backported from?  The last
> commit I can see in -next to this driver is
> d2912cb15bdda8ba4a5dd73396ad62641af2f520 (treewide: Replace GPLv2
> boilerplate/reference with SPDX - rule 500) from 2019.

This is now in 5.13-rc3.

You should have been cc:ed on it a few times already.

thanks,

greg k-h
