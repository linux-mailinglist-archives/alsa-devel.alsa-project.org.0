Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B0A2431A9
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 02:09:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29591166D;
	Thu, 13 Aug 2020 02:09:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29591166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597277395;
	bh=pKtuXYVz1xGuYZdygwhBuEOHiHPZxImUOidX/Ua9brY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pU7/OEdSrij8rsSYNeGwZmx9kWuIDkQs5JlFnj00S7OYGJP+pMvq0P4ZArQ8QGV8m
	 XUdICnyM5R8HEK5Ivke0c+VlazSza0cDdFDT4NAgwA3CFjkaG49APBly8pigC7DEAX
	 yypn8PUMMjOSe9ZLrfCRMGzvJI74Adlg6xhlZ/Ag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60CC5F8022D;
	Thu, 13 Aug 2020 02:08:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5CEDF8022B; Thu, 13 Aug 2020 02:08:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SUBJECT_DRUG_GAP_L,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21823F800F4
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 02:08:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21823F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OnLaSYk7"
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D25A320774;
 Thu, 13 Aug 2020 00:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597277282;
 bh=pKtuXYVz1xGuYZdygwhBuEOHiHPZxImUOidX/Ua9brY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OnLaSYk7Dud9284Ox7lqs0BxwKOrAbJwHr7co2UUgO6QFGtEJ7DiRCwpisX8HxR+E
 14wDqLIuQjtjqIqjN5ydOQ7OMdhIpKcxfUtrtKUAYaeizDwFkM4QphtGIYUu6PirO8
 sAwZDOwTm89LPtbYADrE72YvfOs94i8dbWNE2XWI=
Date: Wed, 12 Aug 2020 20:08:00 -0400
From: Sasha Levin <sashal@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: Request to pick up couple NVIDIA Tegra ASoC patches into 5.7
 kernel
Message-ID: <20200813000800.GM2975990@sasha-vm>
References: <2db6e1ef-5cea-d479-8a7a-8f336313cb1d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <2db6e1ef-5cea-d479-8a7a-8f336313cb1d@gmail.com>
Cc: alsa-devel@alsa-project.org, Erik Faye-Lund <kusmabite@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, Stable <stable@vger.kernel.org>,
 Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
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

On Wed, Aug 12, 2020 at 10:14:34PM +0300, Dmitry Osipenko wrote:
>Hello, stable-kernel maintainers!
>
>Could you please cherry-pick these commits into the v5.7.x kernel?
>
>commit 0de6db30ef79b391cedd749801a49c485d2daf4b
>Author: Sowjanya Komatineni <skomatineni@nvidia.com>
>Date:   Mon Jan 13 23:24:17 2020 -0800
>
>    ASoC: tegra: Use device managed resource APIs to get the clock
>
>commit 1e4e0bf136aa4b4aa59c1e6af19844bd6d807794
>Author: Sowjanya Komatineni <skomatineni@nvidia.com>
>Date:   Mon Jan 13 23:24:23 2020 -0800
>
>    ASoC: tegra: Add audio mclk parent configuration
>
>commit ff5d18cb04f4ecccbcf05b7f83ab6df2a0d95c16
>Author: Sowjanya Komatineni <skomatineni@nvidia.com>
>Date:   Mon Jan 13 23:24:24 2020 -0800
>
>    ASoC: tegra: Enable audio mclk during tegra_asoc_utils_init()
>
>It will fix a huge warnings splat during of kernel boot on NVIDIA Tegra
>SoCs. For some reason these patches haven't made into 5.7 when it was
>released and several people complained about the warnings. Thanks in
>advance!

They never made it in because they don't have a stable tag, a fixes tag,
or do they sound like they fix a problem :)

Do you have a reference to the issue at hand here?

Either way, 5.7 is alive for only about 1 or 2 weeks, is anyone still
stuck on 5.7?

-- 
Thanks,
Sasha
