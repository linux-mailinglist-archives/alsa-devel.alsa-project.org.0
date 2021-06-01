Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF29397B5E
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 22:46:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E44E316DB;
	Tue,  1 Jun 2021 22:45:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E44E316DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622580406;
	bh=xVtpWEmr8Qmxmrehm9NkHkBJMFT+2FCdYuwhRWXN5hg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AIY7eFpHVBC+qSWkMfZjfzhCus2KbfAneCsNK7vZzaAgIoSMU70+vzvDsk8rGPpb5
	 xrq/ckUk+VePhYu5cZ2MSuhsEmQwMc/3BGatbIeDvlElO+ZQYgtUKmU4RiSkyWK/oH
	 aJ9LRXP3+Q3jMbFJQsqhXrwY+G6XxbsgmiS+DCrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62891F8025B;
	Tue,  1 Jun 2021 22:45:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55399F80254; Tue,  1 Jun 2021 22:45:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_NONE autolearn=disabled
 version=3.4.0
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8722BF801DB
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 22:45:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8722BF801DB
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1loBG5-0003ST-OY; Tue, 01 Jun 2021 22:45:05 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Lee Jones <lee.jones@linaro.org>, Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [GIT PULL] Immutable branch between MFD and ASoC due for the
 v5.14 merge window
Date: Tue, 01 Jun 2021 22:45:04 +0200
Message-ID: <8906844.gsGJI6kyIV@diego>
In-Reply-To: <20210601183351.GA31227@wintermute.localdomain>
References: <20210519203754.27184-1-macroalpha82@gmail.com>
 <20210601173944.GA2173308@dell>
 <20210601183351.GA31227@wintermute.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, broonie@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, jbx6244@gmail.com,
 maccraft123mc@gmail.com
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

Am Dienstag, 1. Juni 2021, 20:33:51 CEST schrieb Chris Morgan:
> On Tue, Jun 01, 2021 at 06:39:44PM +0100, Lee Jones wrote:
> > On Tue, 01 Jun 2021, Chris Morgan wrote:
> > 
> > > On Tue, Jun 01, 2021 at 04:58:32PM +0100, Lee Jones wrote:
> > > > On Tue, 01 Jun 2021, Lee Jones wrote:
> > > > 
> > > > > I've applied the non-Arm patches.
> > > > > 
> > > > > The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> > > > > 
> > > > >   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> > > > > 
> > > > > are available in the Git repository at:
> > > > > 
> > > > >   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tb-mfd-asoc-v5.14
> > > > > 
> > > > > for you to fetch changes up to 437faaa6cebadf8ff4c2c28d7cb26ed4e34aeb14:
> > > > > 
> > > > >   dt-bindings: Add Rockchip rk817 audio CODEC support (2021-06-01 13:40:41 +0100)
> > > > > 
> > > > > ----------------------------------------------------------------
> > > > > Immutable branch between MFD and ASoC due for the v5.14 merge window
> > > > > 
> > > > > ----------------------------------------------------------------
> > > > > Chris Morgan (3):
> > > > >       mfd: Add Rockchip rk817 audio CODEC support
> > > > >       ASoC: Add Rockchip rk817 audio CODEC support
> > > > >       dt-bindings: Add Rockchip rk817 audio CODEC support
> > > > > 
> > > > >  Documentation/devicetree/bindings/mfd/rk808.txt | 188 +++++++++
> > > > >  drivers/mfd/rk808.c                             |  81 ++++
> > > > >  include/linux/mfd/rk808.h                       |  81 ++++
> > > > >  sound/soc/codecs/Kconfig                        |   6 +
> > > > >  sound/soc/codecs/Makefile                       |   2 +
> > > > >  sound/soc/codecs/rk817_codec.c                  | 539 ++++++++++++++++++++++++
> > > > >  6 files changed, 897 insertions(+)
> > > > >  create mode 100644 sound/soc/codecs/rk817_codec.c
> > > > 
> > > > Looks like the builders reported a W=1 warning introduced by the set.
> > > > 
> > > > Would you like me to fix it and submit a patch?
> > > 
> > > I can't seem to reproduce the warning, are there more details as to
> > > what is causing it?
> > 
> > Yes, it's a W=1 warning.  Put that on your command line.
> 
> Got it. Want me to resubmit the patch? Looks like I was requesting a
> return value from a function and not doing anything with it.

from Lee's earlier mail I guess he prefers a followup patch to fix the issue.



