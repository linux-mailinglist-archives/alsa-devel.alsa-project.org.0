Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7A2422CC1
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 17:40:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A9AA1692;
	Tue,  5 Oct 2021 17:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A9AA1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633448440;
	bh=VXYwP1e7JOYSmaZsPNB4TDCWHvvOTUvOdW3t0O9Bm80=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t2gxgN7kJb+yKTbhwEyY9ReMohlTFCIiukKquo0gCrZ/h9dGEmO6cof/4xbU0mo3r
	 0yTwpPn5wN1LFVAvm5/SehM7dqPiR7vhdCVg1zxqpMwlIiN8EVgb3RgOGZNksze6iR
	 i1K6ThaDDVksr4xb+S6S71IMctSp9rBRcvKPzPMU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 743CFF804F3;
	Tue,  5 Oct 2021 17:38:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 253FFF804CF; Tue,  5 Oct 2021 17:38:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6520BF804BB
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 17:38:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6520BF804BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cDiJrbHy"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8566D61159;
 Tue,  5 Oct 2021 15:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633448284;
 bh=VXYwP1e7JOYSmaZsPNB4TDCWHvvOTUvOdW3t0O9Bm80=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cDiJrbHy3eWC17Of5A5g9jIerTlovLFEPw4EI0o+nkzCtZ6dZk+NpYfQCMKu6zwuM
 a5MpEUR6YhWyeV8q7PIKSZ+082ENYRyeJUYYOV8mGOQm+cqm20GJ5Ex26pn0StJS32
 8RNAvrKdSefKFj5SawDdx7q74aAncJQE3SNg79yruDYFfPOX7HgwACJfTrwsYfHXUa
 ZKNi6d8tm+NlSyUEIzIKzx8ugxPRDuuUJIr0+jOY5HEIKZwHcSUo/cNnehun218Kej
 6WyYl2ATQjHgpgJpe4+5LjvXxZOsk+5eryuiqI9XXcy4Lsv1VRV+PLGifL0YukT22E
 Bd/skGzONYNFw==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/3] ASoC: SOF: topology: minor updates
Date: Tue,  5 Oct 2021 16:37:45 +0100
Message-Id: <163344779742.1075058.3974538277548801121.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004212729.199550-1-pierre-louis.bossart@linux.intel.com>
References: <20211004212729.199550-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Mark Brown <broonie@kernel.org>
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

On Mon, 4 Oct 2021 16:27:26 -0500, Pierre-Louis Bossart wrote:
> Two patches to visualize settings and override dynamic pipelines + one
> correction for errors on connections.
> 
> Pierre-Louis Bossart (2):
>   ASoC: SOF: topology: show clks_control value in dynamic debug
>   ASoC: SOF: topology: allow for dynamic pipelines override for debug
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: topology: show clks_control value in dynamic debug
      commit: cf9f3fffae897ab44aa039efd22a8f9330582c73
[2/3] ASoC: SOF: topology: allow for dynamic pipelines override for debug
      commit: ea6bfbbe3ea83861bab034538e36becb16eef20b
[3/3] ASoC: SOF: topology: return error if sof_connect_dai_widget() fails
      commit: 4a23076987476337085ae04b923bc39deec34643

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
