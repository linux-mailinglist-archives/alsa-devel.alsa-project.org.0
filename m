Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3422F770D
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 11:54:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67B5017D1;
	Fri, 15 Jan 2021 11:53:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67B5017D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610708083;
	bh=xXurPrhZ8FsFBlxDmIfpTe9Nis9Xbp7gcVQKkuWtZA0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P2VIClIllev94fQUo7vTcLBfk3l+k6Vv7pSjKdkF3ygufY0GiGHi9jhbpytRoWN8E
	 fFJiluvGTQG+f5XrauEemE3AVBXgW21IWJo43CKLKCYxI8ML/884+aMSIX6Cgb1wu0
	 +FszL9qrl8Jco2P9eccIHu+fnLnrOFVVLq0fNTeY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30089F80132;
	Fri, 15 Jan 2021 11:53:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD5FAF801ED; Fri, 15 Jan 2021 11:53:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=NICE_REPLY_A,PRX_BODY_78,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap3.hz.codethink.co.uk (imap3.hz.codethink.co.uk [176.9.8.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BB58F80132
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 11:52:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BB58F80132
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net
 ([86.16.139.33] helo=[192.168.0.18])
 by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1l0Mip-0006Wd-Ec; Fri, 15 Jan 2021 10:52:51 +0000
Subject: Re: [PATCH v1 0/5] Clock and reset improvements for Tegra ALSA drivers
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
References: <20210112125834.21545-1-digetx@gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <d09b6953-fc74-9fbc-e66d-556df4674746@codethink.co.uk>
Date: Fri, 15 Jan 2021 10:52:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112125834.21545-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On 12/01/2021 12:58, Dmitry Osipenko wrote:
> This series improves the handling of clock and reset controls of
> NVIDA Tegra ALSA drivers. Tegra HDA and AHUB drivers aren't handling
> resets properly, which needs to be fixed in order to unblock other patches
> related to fixes on the reset controller driver since HDA/AHUB are bound
> to fail once reset controller driver will be corrected. In particular ALSA
> drivers are relying on implicit de-assertion of resets which is done by the
> tegra-clk driver. It's not the business of the clk driver to touch resets
> and we need to fix this because it breaks reset/clk programming sequences
> of other Tegra drivers.
> 
> Dmitry Osipenko (5):
>    ALSA: hda/tegra: Use clk_bulk helpers
>    ALSA: hda/tegra: Reset hardware
>    ASoC: tegra: ahub: Use of_reset_control_array_get_exclusive()
>    ASoC: tegra: ahub: Use clk_bulk helpers
>    ASoC: tegra: ahub: Reset hardware properly
> 
>   sound/pci/hda/hda_tegra.c      |  86 +++++++++------------------
>   sound/soc/tegra/tegra30_ahub.c | 103 ++++++---------------------------
>   sound/soc/tegra/tegra30_ahub.h |   6 +-
>   3 files changed, 49 insertions(+), 146 deletions(-)

I wonder if this will help with the issues we saw when the tegra is
the i2s clock slave.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
