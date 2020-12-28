Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C22392E6694
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Dec 2020 17:14:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 465191725;
	Mon, 28 Dec 2020 17:14:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 465191725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609172092;
	bh=JTzTzFegB9FBfkAuzB+MLl5bRflOQN4EeoFvDLSIToA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ancsv7x57M1blsoK0A70xPMVUzc2mGz6SQVjVC7wdYWUHIPQ3C+YmujW+P0jtwcsZ
	 hhkSZD8Uw89zNK7MIpkFQtz6uXW9g+XljqzoLEyMYQdtUwGpF4yk+y/2vkhbvo9Ig6
	 Jfw8lu15BvNtG9QlaSxQTpi2JPrilkEOy+eazvTQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 559A8F801F9;
	Mon, 28 Dec 2020 17:13:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8813EF801F5; Mon, 28 Dec 2020 17:13:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EF52F8014E
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 17:13:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EF52F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AIfroMw7"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2513B207C9;
 Mon, 28 Dec 2020 16:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609171991;
 bh=JTzTzFegB9FBfkAuzB+MLl5bRflOQN4EeoFvDLSIToA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AIfroMw77Z5TMmdgycyaSufV1ZDY94QesRrjOk5ZiKfXmaXA6lAjdox4g3h/c0URy
 2CQevYM8qvJAWYUJnQah6pgk+zIrm0/u8gxtGrNisj+b9JGJTRzTs//ik5yUEDY0zp
 IzfsQzhN2c/1x8jFdf7cUqmSSS8YopbtyPYClcvGw7PvKFpDvh95I+kRTGIVP2AHWh
 pn/cv88QkNrJfir6gzZPZfQK2/X4c+LlERwEBMuILLTUH31A9TuQ5ZWEor/nNy+G0D
 G5FTBGQptQZ5emdUnISNp49eEFnN6B3TWXCKwBDqPIZYj+zsd0Mc8h+wI+uVPBIAAu
 bKxK8dnktaTpA==
From: Mark Brown <broonie@kernel.org>
To: ALSA development <alsa-devel@alsa-project.org>,
 Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20201227164037.269893-1-perex@perex.cz>
References: <20201227164037.269893-1-perex@perex.cz>
Subject: Re: [PATCH v2] ASoC: AMD Renoir - add DMI entry for Lenovo ThinkPad
 E14 Gen 2
Message-Id: <160917197015.51862.7952652010355079842.b4-ty@kernel.org>
Date: Mon, 28 Dec 2020 16:12:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, stable@kernel.org,
 Eliot Blennerhassett <eliot@blennerhassett.gen.nz>
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

On Sun, 27 Dec 2020 17:40:37 +0100, Jaroslav Kysela wrote:
> The ThinkPad E14 Gen 2 latop does not have the internal digital
> microphone connected to the AMD's ACP bridge, but it's advertised
> via BIOS. The internal microphone is connected to the HDA codec.
> 
> Use DMI to block the microphone PCM device for this platform.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: AMD Renoir - add DMI entry for Lenovo ThinkPad E14 Gen 2
      commit: 275565997ade6fc32be9cd49a910ba996bcb4797

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
