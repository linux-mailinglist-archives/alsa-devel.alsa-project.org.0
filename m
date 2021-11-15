Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0554514E9
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 21:20:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25E8A16A3;
	Mon, 15 Nov 2021 21:19:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25E8A16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637007614;
	bh=VoDZ04M7KgSfA79qwh4lw4QFKQUO2TRi2lCT6RkZrwo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DQg3NCJCXRZy/oe2aPU1KfbJygR4ndKwM9LZmUdZwNnLdL/1pBF8jtHcFxqRIYGuk
	 DXdcaff8L6PUZQGnToHVmBEHtCI19/JShT0oYZFNi2/Ws5WEneCaJC/6eGWfo+Agsj
	 cgaksRCTxhF6Nt9XGlZlApJUg0jEEGlMtt+hAg8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2EB7F804BB;
	Mon, 15 Nov 2021 21:18:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1FA4F8027D; Mon, 15 Nov 2021 21:18:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B18D5F80163
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 21:18:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B18D5F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XfKt/I7J"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 081D161C12;
 Mon, 15 Nov 2021 20:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637007506;
 bh=VoDZ04M7KgSfA79qwh4lw4QFKQUO2TRi2lCT6RkZrwo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XfKt/I7JvVxyiusNUxr6q9qw2xFY/CPes4ibLLmypAcFsC0GioN16jszEV23XXQ90
 R1zgzTFBvLZuCZtosm/W8NpbcXd8oGo8prJJmqAmfsAh+uRoVAUj5lVfgCkSindE/+
 kp/ZMFusITgDXR+FBH6IdK2hpqA+OtkxXzeZSOhlSgN3vUi8s3eGNwW1woJEvdC4KI
 M+qJNOSTg7N4Oy3jd85zfIVRGnxIHo71NPgT9Ip+ZcbpmyMo2HWCzXTh84HFeWYBlt
 w4kMxFeLki2oM2KVqC+uHgyltz/e/0m5V0R15I8It3IdAkOiPk6f0BKAPvCuStQuLo
 uOGJseEzo8BUA==
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.de
In-Reply-To: <20211027021824.24776-1-yung-chuan.liao@linux.intel.com>
References: <20211027021824.24776-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 00/10] ASoC: Intel: sof_sdw: Use fixed DAI link id
Message-Id: <163700750477.2049880.12689563980530529455.b4-ty@kernel.org>
Date: Mon, 15 Nov 2021 20:18:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com
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

On Wed, 27 Oct 2021 10:18:14 +0800, Bard Liao wrote:
> This series provides a way to use constant dailink numbers for different
> devices. So that we don't need to renumber them in topologies.
> Some patches with different purpose are sent together in this series
> since they are dependent.
> 
> Bard Liao (8):
>   ASoC: intel: sof_sdw: return the original error number
>   ASoC: intel: sof_sdw: rename be_index/link_id to link_index
>   ASoC: intel: sof_sdw: Use a fixed DAI link id for AMP
>   ASoC: intel: sof_sdw: move DMIC link id overwrite to
>     create_sdw_dailink
>   ASoC: intel: sof_sdw: remove SOF_RT715_DAI_ID_FIX quirk
>   ASoC: intel: sof_sdw: remove sof_sdw_mic_codec_mockup_init
>   ASoC: intel: sof_sdw: remove get_next_be_id
>   ASoC: intel: sof_sdw: add link adr order check
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: intel: sof_sdw: return the original error number
        commit: dd31ddd81904070d0a9cafd5499d3210a322f8af
[02/10] ASoC: Intel: sof_sdw: fix jack detection on HP Spectre x360 convertible
        commit: 0527b19fa4f390a6054612e1fa1dd4f8efc96739
[03/10] ASoC: Intel: sof_sdw: add SKU for Dell Latitude 9520
        commit: 1071f2415b6b4ee653869acabfb26de1a27da9cd
[04/10] ASoC: intel: sof_sdw: rename be_index/link_id to link_index
        commit: b63137cf5167b73d9d68a2334b835996bfc3b941
[05/10] ASoC: intel: sof_sdw: Use a fixed DAI link id for AMP
        commit: d471c034f83201f84330e9ed46ad5139d32e77ce
[06/10] ASoC: intel: sof_sdw: move DMIC link id overwrite to create_sdw_dailink
        commit: bf605cb042307d162fbcb094738bab5d767f1261
[07/10] ASoC: intel: sof_sdw: remove SOF_RT715_DAI_ID_FIX quirk
        commit: f8f8312263e2d0c38dd0330a4503dcdcc94d0cd5
[08/10] ASoC: intel: sof_sdw: remove sof_sdw_mic_codec_mockup_init
        commit: bd98394a811c7dc39bcd189cf5f33925f0c30ae2
[09/10] ASoC: intel: sof_sdw: remove get_next_be_id
        commit: 4ed65d6ead29a992c4803e1138a6042caa6ec2a3
[10/10] ASoC: intel: sof_sdw: add link adr order check
        commit: 296c789ce1e501be8b46ebb24da4ba53063cc10a

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
