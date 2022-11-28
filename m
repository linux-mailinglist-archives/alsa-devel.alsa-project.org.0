Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CACB63AE01
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 17:41:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84E9E1712;
	Mon, 28 Nov 2022 17:40:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84E9E1712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669653682;
	bh=WmYYjhxlsQcGW3uwtWuilUGz7l2MIsTn1DgqBZXF4Vg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cf90Ce6mAyiRwlHkwtfGgIqrlwr+SO7aZ0KyhVveMAU0k6G+xjDCPEiFYQ80x7fap
	 vr+a2+HhPo5qvqafRuiRhhvG086wdSo9jYc7Au9avIiYH8fhpez0AIhI6iWqi0fPpO
	 mIObYlZMBSMBnKEoTV5w5QKbfaEr0KfsnjHfQhFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA308F80571;
	Mon, 28 Nov 2022 17:39:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F247AF804D8; Mon, 28 Nov 2022 17:39:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80724F804D8
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 17:39:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80724F804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pODu1ESi"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7609761262;
 Mon, 28 Nov 2022 16:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D24A6C43141;
 Mon, 28 Nov 2022 16:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669653552;
 bh=WmYYjhxlsQcGW3uwtWuilUGz7l2MIsTn1DgqBZXF4Vg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=pODu1ESizPBlTfxJdILfqwvVD/Wr8fKfHCWezGpznlsFaTJIvSdBFY7N+G5s6DRr3
 ksOGuV8myWAYeH7PGV7iFmZxsHnmXEEbSv4LuIWO7GjId/V2xmqt4iL0OQFUTan73w
 mhhvYfFzCWtcrYLDtpg2y7vCmCNrkTaVzQTty3S4uFE5G0+dZTievDr2OC7u2Hz6wr
 d311CN/pPA5hqMF/Lyr9qNqL5iqsHwNnN+t02/ur+aLOZ+Ntj2IBqxgfG+ok/Ye5Ol
 29iJVCgYNaXYXF9i5dsBRIBWrlrQaxvecK+xfn1ARELg/RflRzXTZPraJMy5JXG2UP
 uJH37b/wajMzg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20221123165432.594972-1-ckeepax@opensource.cirrus.com>
References: <20221123165432.594972-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v3 1/9] sound: sdw: Add hw_params to SoundWire config
 helper function
Message-Id: <166965355053.629583.1054316530369550178.b4-ty@kernel.org>
Date: Mon, 28 Nov 2022 16:39:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: oder_chiou@realtek.com, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com
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

On Wed, 23 Nov 2022 16:54:24 +0000, Charles Keepax wrote:
> The vast majority of the current users of the SoundWire framework
> have almost identical code for converting from hw_params to SoundWire
> configuration. Whilst complex devices might require more, it is very
> likely that most new devices will follow the same pattern. Save a
> little code by factoring this out into a helper function.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] sound: sdw: Add hw_params to SoundWire config helper function
      commit: e45875168d19051ebf0fc4b091da6256f3ea3669
[2/9] ASoC: max98373-sdw: Switch to new snd_sdw_params_to_config helper
      commit: d12f106177288a65b58b236304b6ceea4370f65d
[3/9] ASoC: rt1308-sdw: Switch to new snd_sdw_params_to_config helper
      commit: 896c59edcdafc4e213761184294cbccf47126a23
[4/9] ASoC: rt1316-sdw: Switch to new snd_sdw_params_to_config helper
      commit: 0725dd0461fc682e9c1bcf9f436e60160dba65a5
[5/9] ASoC: rt5682-sdw: Switch to new snd_sdw_params_to_config helper
      commit: 5b75bc7fc28af62622c57d80f607536b19796d8f
[6/9] ASoC: rt700: Switch to new snd_sdw_params_to_config helper
      commit: ae7ad90e7cf29f3337ac1fe4e60162c51782c2b5
[7/9] ASoC: rt711: Switch to new snd_sdw_params_to_config helper
      commit: 754bef6752259ce5633814a0333f96fa06f6e3e8
[8/9] ASoC: rt715: Switch to new snd_sdw_params_to_config helper
      commit: 99ae8cf0a06b7911ec1d9c6d9190dcb3384255c9
[9/9] ASoC: sdw-mockup: Switch to new snd_sdw_params_to_config helper
      commit: c5f81301d06898080c9a59eda91f6b8605f98a2a

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
