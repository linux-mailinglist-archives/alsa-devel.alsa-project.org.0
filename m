Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A2D348574
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 00:42:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DD181672;
	Thu, 25 Mar 2021 00:41:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DD181672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616629358;
	bh=Nl01SowQJwZ86qcGJ3uYdr0vyyXeyCErJGFWOz8KNR4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=athHMCSZvyxDcCYVkso/6fbGwjVoDl+FV5UbwqiLV+4m7wnwONbRc4FvVwrPacYWR
	 vBe9Wtag4Anjzl8WzYYbxwYmUG3rp5sJZT5CAVr0ZTQcr0e8l9XtjSVsLtJZzTGS5x
	 PxvcBGsvmi/HJdRNBoiceg+LEW0S4iLTZ4YncSlg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62B28F8032D;
	Thu, 25 Mar 2021 00:40:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 526ECF801EC; Thu, 25 Mar 2021 00:40:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CBFCF801EC
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 00:40:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CBFCF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="r57I8UJw"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E19DE61974;
 Wed, 24 Mar 2021 23:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616629204;
 bh=Nl01SowQJwZ86qcGJ3uYdr0vyyXeyCErJGFWOz8KNR4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r57I8UJwzmA9Oft1VHqsob3vk/5rGVDMZ7U2fQK81RS5wINVAiNJzUpRDOFLugkRx
 Pkjg6KGkuzuGB0uuNcm6H8n9/kjnnbknM8nwoX2HksPF99t9dgSJv7BNSjuuUSV4Cn
 sTE1QSKpwPWWJNeivm4sZzC4XupytzwqIfi8UmBRu7BBMPLMxKpPbLoRlXFDF+XpQ1
 sML2TqlnYuuRju/q3s0ybr+j7OtakfgP93Laeh4PoQ4aCvsVQcnDn3G6ho01FuAqGT
 uKVWoWrIN4ccPYOo58jyBVHB3fTWShY8CZdVb3cDSRdN/AbcUw24yYF9c5jNqlhE38
 3sUzQv+pvgG7g==
From: Mark Brown <broonie@kernel.org>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
 Hans de Goede <hdegoede@redhat.com>, Lee Jones <lee.jones@linaro.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: (subset) [PATCH v4 resend 00/13] MFD/extcon/ASoC: Rework arizona
 codec jack-detect support
Date: Wed, 24 Mar 2021 23:39:39 +0000
Message-Id: <161662872374.51441.14272118872485811868.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210307151807.35201-1-hdegoede@redhat.com>
References: <20210307151807.35201-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>
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

On Sun, 7 Mar 2021 16:17:54 +0100, Hans de Goede wrote:
> Here is v4 of my series to rework the arizona codec jack-detect support
> to use the snd_soc_jack helpers instead of direct extcon reporting.
> 
> As discussed before here is a resend rebased on 5.12-rc2, making sure that
> all patches this depends on are in place.
> 
> Lee, can you pick-up patches 1-6 through the MFD tree and then send a
> pull-req to Mark so that Mark can merge the Asoc parts throught the ASoC
> tree ?
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[07/13] ASoC: arizona-jack: Move jack-detect variables to struct arizona_priv
        commit: bcda8cc4b868782c1a39d722d24f7d2598978389
[08/13] ASoC: arizona-jack: Use arizona->dev for runtime-pm
        commit: 688c8461a425623ca6f679e6ba8965719a98def5
[09/13] ASoC: arizona-jack: convert into a helper library for codec drivers
        commit: ffcc84b9e814c8654e15e08816d0078d521a2724
[10/13] ASoC: arizona-jack: Use snd_soc_jack to report jack events
        commit: 236b7285e95af5cb5a8b63283e573f433fb9b305
[11/13] ASoC: arizona-jack: Cleanup logging
        commit: 69c58eb61e9b649096a0ab8cbc3c6f8521efd303
[12/13] ASoC: arizona: Make the wm5102, wm5110, wm8997 and wm8998 drivers use the new jack library
        commit: 37dbabf14ff65510fa5aeecc1707ca390e608e00
[13/13] ASoC: Intel: bytcr_wm5102: Add jack detect support
        commit: ecd77d494ec995fb07102b408954c94f38374084

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
