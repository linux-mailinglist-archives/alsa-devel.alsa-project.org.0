Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD88B27B4D9
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 20:54:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31E4D183D;
	Mon, 28 Sep 2020 20:54:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31E4D183D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601319290;
	bh=tRBvRQ9B3uw5joCA9ZCRpoEKWd6VUc0RpYzRqXVkJJo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Soou5HfIRgwTeLCLlZy0mdthvjY9jPhOWMcT8eMgR2Cos+To7Q+TDRLoP8b/44Dtj
	 HR96d4otISzod8OyCG0RPZ6TfSIBHyLasK6zcuPzU2SXlSAE0+FZsIMCHH7/wBy35R
	 nLlhBJuTt/eZ10hmy9wp2V++wbm/mF1h6MxozjA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A984F800DF;
	Mon, 28 Sep 2020 20:53:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93612F801F9; Mon, 28 Sep 2020 20:53:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF745F800DF
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 20:52:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF745F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="W1lG081J"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4C0WqV6RpFz3c;
 Mon, 28 Sep 2020 20:52:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1601319175; bh=tRBvRQ9B3uw5joCA9ZCRpoEKWd6VUc0RpYzRqXVkJJo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W1lG081JBniHBcrmTjVWaM8/+Qs0GuKcfhfgYwBa2UaCJMQdAR6lp3/wqwsJm0TTz
 /ODBo+YnWH9XvptmZP4pTov6m5EDiJHI1AS9Kh0ZKnrakB6COivieyopyzFbC/ih20
 RlrRbsUHym/Vu4Pam1XofMQ5vIztHvRmBWD/V0a+rQevLO/Fr7Mgr7a3+Ig8oLDCOl
 hv0JOTTkzDhvSNh/BydKP25kho5t5L7ZdxP6ohu3YC4BhsVyY6mq3sXBBsQoHVDcEw
 w+eLzRq0Z6lahU7boMwzA0GcoYtkKgAOAwNecYKjCa02Elys2ztcOBNxl+sAYHlRpl
 fEDPyDo8zCuUg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date: Mon, 28 Sep 2020 20:52:53 +0200
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] ASoC: tegra20-spdif: remove "default m"
Message-ID: <20200928185253.GB25616@qmqm.qmqm.pl>
References: <ede103cf7f6914054a73cf8f1d9725ee13a7cf5d.1601149261.git.mirq-linux@rere.qmqm.pl>
 <20200928081026.GH2837573@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200928081026.GH2837573@ulmo>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Stephen Warren <swarren@nvidia.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
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

On Mon, Sep 28, 2020 at 10:10:26AM +0200, Thierry Reding wrote:
> On Sat, Sep 26, 2020 at 09:42:40PM +0200, Micha³ Miros³aw wrote:
> > Make tegra20-spdif default to N as all other drivers do.
> > 
> > Signed-off-by: Micha³ Miros³aw <mirq-linux@rere.qmqm.pl>
> > Fixes: 774fec338bfc ("ASoC: Tegra: Implement SPDIF CPU DAI")
> 
> I don't think this is warranted. This doesn't fix a bug or anything.
> It's merely a change in the default configuration. The presence of a
> Fixes: tag is typically used as a hint for people to pick this up into
> stable releases, but I don't think this qualifies.
[...]

Fixes is just for pointing where the bug or issue originated.  I usually
include it to help you -- the reviewer -- and backporters if they ever
want to use this patch. It is not specific to stable-directed patches.

For stable candidates there is 'Cc: stable' tag (no need for this patch).

> So now by default this driver will be disabled, which means that Linux
> is going to regress for people that rely on this driver.

The bug is that this driver (and only this driver in the whole
sound/soc/tegra directory) defaults to m, where all other drivers default
to n (as the policy aboud drivers seems to be [1]). This won't affect
oldconfig, allyesconfig nor allmodconfig, but will not be selected now
for clean builds - meaning less work for those not building for Tegra2.

[1] https://lkml.org/lkml/2017/11/18/257

> You need to at least follow this up with a patch that makes the
> corresponding change in both tegra_defconfig and multi_v7_defconfig to
> ensure that this driver is going to get built by default.

This I can do. Not all such drivers are enabled, though: eg. AHUB driver
is not. Maybe we need bigger refresh of the defconfigs instead?

> Given the above it's probably also a good idea to explain a bit more in
> the commit message about what you're trying to achieve. Yes, "default n"
> is usually the right thing to do and I'm honestly not sure why Stephen
> chose to make this "default m" back in the day. Given that it depends on
> SND_SOC_TEGRA, which itself is "default n", I think this makes some
> sense, even if in retrospect it ended up being a bit inconsistent (you
> could probably argue that all patches after this are the ones that were
> inconsistent instead). This was merged over 9 years ago and a lot of
> common practices have changed over that period of time.

Yes, this is a cleanup. :-)

Best Regards
Micha³ Miros³aw
