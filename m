Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED149340D21
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 19:36:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8294B169C;
	Thu, 18 Mar 2021 19:35:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8294B169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616092583;
	bh=0BLyiFtYZXDnwv6zlccJa0QTH+6wWPdP2dCQc6DRELI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GXnw4IydJlAg9Gtczec2yq+MMUG8IzINc6SUaZ4jKEQQ8JMTYvAmXZtGRpwbMWGWU
	 peod4B/IaoOR5IjkbXn2yHJccLMcnyTgQMyugtv9sUgu1y88PsCt3Xghwtrt9z07DY
	 oekUsUBJsDf2KL4iFh2phAfdyC6DxbSuENLw4yJk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1D09F8023B;
	Thu, 18 Mar 2021 19:34:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29DE3F802E3; Thu, 18 Mar 2021 19:33:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2ABACF80224
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 19:33:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2ABACF80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IP56QmKu"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A083064F1B;
 Thu, 18 Mar 2021 18:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616092429;
 bh=0BLyiFtYZXDnwv6zlccJa0QTH+6wWPdP2dCQc6DRELI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IP56QmKuK8yTv/S4oDzVnC7juSyOxcxSC/fIcyXlVbtj/y/F1/lRo4SftjKPL4hlT
 DPI8A+1flttC2gOeZFtC8igjjQgydfE8dmgmolm2eycVo3VMIaUwIrD0MhNvFsKKi2
 BEwBIUGVyJBWstohWMH4JcugtpTYl7w3wqp2JJcXb2zVzNScj9nyYhHxul7eyJq8PH
 z1FrSUPz98KeaPxdxZQfiHMJGXh/2pgEbxFeIas6WKKGRjO0OwcYiP0A99bCCpWYiO
 2IU/fy0/DuTyMb8msiKIGB6aHqqC4RtoHv1lWhLbOzc3FvIzGsZkO+qKf5tcXTItjk
 MjooUXH/xTs6A==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/23] ASoC: codecs: remove cppcheck warnings
Date: Thu, 18 Mar 2021 18:33:31 +0000
Message-Id: <161609213719.41838.10565452101461060474.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
References: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Mark Brown <broonie@kernel.org>,
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

On Fri, 12 Mar 2021 12:22:23 -0600, Pierre-Louis Bossart wrote:
> Lots of small fixes in various codec drivers that should have no
> functional impact.
> 
> Pierre-Louis Bossart (23):
>   ASoC: ab8500-codec: remove useless structure
>   ASoC: ad1836: remove useless return
>   ASoC: adau1977: remove useless return
>   ASoC: cros_ec_codec: remove null pointer dereference warning
>   ASoC: cx2070x: remove useless assignment
>   ASoC: cx2070x: remove duplicate else branch
>   ASoC: da7219-aad: remove useless initialization
>   ASoC: hdac_hdmi: remove useless initializations
>   ASoC: hdac_hdmi: align function arguments
>   ASoC: hdmi-codec: remove useless initialization
>   ASoC: hdmi-codec: remove unused spk_mask member
>   ASoC: max98090: remove useless assignment
>   ASoC: mt6358: remove useless initializations
>   ASoC: mt6359: remove useless assignment
>   ASoC: nau8825: remove useless assignment
>   ASoC: pcm1681: remove useless assignment
>   ASoC: sigmadsp: align function prototype
>   ASoC: sti-sas: remove unused struct members
>   ASoC: tas2562: remove useless assignment
>   ASoC: tas2562: remove warning on return value
>   ASoC: tas2770: remove useless initialization
>   ASoC: tlv320dac33: clarify expression
>   ASoC: tscs454: remove useless test on PLL disable
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/23] ASoC: ab8500-codec: remove useless structure
        commit: 73b4fe4a03db519977a22cdf34303bd0ac21c69d
[02/23] ASoC: ad1836: remove useless return
        commit: ca6b3a6ca047d23b9b2a54af9f7f4d6f41200719
[03/23] ASoC: adau1977: remove useless return
        commit: 5b349c8f355ae4bd1de462f1f1b6164d14796b0e
[04/23] ASoC: cros_ec_codec: remove null pointer dereference warning
        commit: 157c4df677569daad6f204c63cfaf226c941bf03
[05/23] ASoC: cx2070x: remove useless assignment
        commit: 4d753b6642ee7304fc56f9fc463bb69ec641a037
[06/23] ASoC: cx2070x: remove duplicate else branch
        commit: 8d41c1ab248fa6e6bfd4728a31eec6d3b9e0f924
[07/23] ASoC: da7219-aad: remove useless initialization
        commit: f8a684a4c2c9a6f922453f0e5dc6d20b1bdb082b
[08/23] ASoC: hdac_hdmi: remove useless initializations
        commit: 426b3bbcee199e1e96ec62b1c1d9cb7019a84efb
[09/23] ASoC: hdac_hdmi: align function arguments
        commit: 997994d7e6fab713d1c03843c9698919e64cc135
[10/23] ASoC: hdmi-codec: remove useless initialization
        commit: 3c011ef344cddd15be0a9b2256f7886f6b5eeec5
[11/23] ASoC: hdmi-codec: remove unused spk_mask member
        commit: 9ad869fee5c598d914fa5cf8fb26f5e106e90956
[12/23] ASoC: max98090: remove useless assignment
        commit: 226a783f3dcf7f565c173627d565135424ee0be9
[13/23] ASoC: mt6358: remove useless initializations
        commit: 2b5e8cd53ffad8c586d8a9d47087fdb058a21287
[14/23] ASoC: mt6359: remove useless assignment
        commit: d068ab4eab0de3224b32ac37234d4d33452d5b01
[15/23] ASoC: nau8825: remove useless assignment
        commit: a3966b254c481ee1890f75d809a52e5aa358c4b1
[16/23] ASoC: pcm1681: remove useless assignment
        commit: f10280d5c59b8d83ae9e9e2307075cc7ad32a6b8
[17/23] ASoC: sigmadsp: align function prototype
        commit: 17d74e68e9765d9549acf1c36caa8b7559dc99ce
[18/23] ASoC: sti-sas: remove unused struct members
        commit: 02a70d7f26e7a3d87c9a5af39ca399b52a451a1a
[19/23] ASoC: tas2562: remove useless assignment
        commit: e83c47861c266f704d2344f51031ee67a93309ab
[20/23] ASoC: tas2562: remove warning on return value
        commit: 2e40b21cd4f697a761f1c5e4f08aac1a5c6c6018
[21/23] ASoC: tas2770: remove useless initialization
        commit: ffab1215bdbea7358051f8dd87b1240e4c6d56e6
[22/23] ASoC: tlv320dac33: clarify expression
        commit: 39e69cef0aa9f6897161a11ed84362f5805c43fd
[23/23] ASoC: tscs454: remove useless test on PLL disable
        commit: a2cc1568dc50020a807c94bd14a053dd54e9c35e

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
