Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 986AF41F8B1
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Oct 2021 02:19:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3028316FC;
	Sat,  2 Oct 2021 02:19:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3028316FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633133993;
	bh=IEy8aoAh4I/HW4q0ag1u2eggzk6jXZTIk99KZWIufao=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RIpeVzXVp14Gy2mpkozQpX7NtjXyKiDGKx/vcDUW3zIWGBEF84QD0e6TEz+yq3MC0
	 IL9e5XhR3MG4BfgU0B7JP8CB8Pf83ntPgedjy67PXxoZAKjdONTU2Yr6O/oX2O5EaM
	 U1M1JJam4ia6IHRxozjlFKs8vy3eXX87YTY82S6w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BECDF80507;
	Sat,  2 Oct 2021 02:17:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D77BCF804FE; Sat,  2 Oct 2021 02:17:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 130DBF804CF
 for <alsa-devel@alsa-project.org>; Sat,  2 Oct 2021 02:17:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 130DBF804CF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TVtztCJA"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1604761B1F;
 Sat,  2 Oct 2021 00:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633133826;
 bh=IEy8aoAh4I/HW4q0ag1u2eggzk6jXZTIk99KZWIufao=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TVtztCJATBTBXx+HR3jKoupcDsN4qy4XJKmDWcD92ThR4rcvYcyMtOxyAdG+TuSo6
 cZkv/DCFQnyjh4xOFenZXUkdHu9tvJ7UHC/0dmM13GjHM33MprwbXWU4Xjm94HkLr1
 Ccm57XZMtKnU7dbT2Ht64zKxV4/PiNJGk7dpZVy6wkCZXsRj4nE/EW2LyE90JDj4h2
 wfR2kznxrVbO71K9ys8lkcRZpff1JDUAZieBG9gw1PUGKKAhLmoFR4gpqMXi3EwJAn
 ryjPJFE/0nQ49j5xhQy2rnXYkvewKdZzyVdzN803KD9cddNSIrkLXjSZcgc64ilkMA
 TT3+i0DoEvgGQ==
From: Mark Brown <broonie@kernel.org>
To: Brent Lu <brent.lu@intel.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: Intel: sof_rt5682: Add support for max98360a
 speaker amp
Date: Sat,  2 Oct 2021 01:16:32 +0100
Message-Id: <163313339132.45396.5370991907979359672.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001150316.414141-1-brent.lu@intel.com>
References: <20211001150316.414141-1-brent.lu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Libin Yang <libin.yang@intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, linux-kernel@vger.kernel.org,
 Rander Wang <rander.wang@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>, Yong Zhi <yong.zhi@intel.com>
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

On Fri, 1 Oct 2021 23:03:16 +0800, Brent Lu wrote:
> From: Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>
> 
> Add a board config adl_mx98360a_rt5682 to support alc5682 headset
> codec and max98360a speaker amplifier. Follow Intel BT offload design
> by connecting alc5682 to SSP0 and max98360a to SSP1.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_rt5682: Add support for max98360a speaker amp
      commit: 9c892547624ff277546a9d4fede3d95259e6faea

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
