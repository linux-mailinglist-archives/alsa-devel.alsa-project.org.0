Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ADE222F93
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 02:00:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78DF11676;
	Fri, 17 Jul 2020 01:59:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78DF11676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594944025;
	bh=CVrPhRDZpGtUVljeDD7chkBEVjNDFK2KdbEN/pmKiK8=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J7QHixChPIF7cTmjTFB+VGI68XqH8YSxTHRGAgV7hfHyLyQd/9g2A3r+gradcSU+R
	 mBnwOFsmmtLzyAjUrU/rk4gFQ4OjhqMQ9TP9sKoD/cV1HzOX7RP6pCqj0LbqFGIIcC
	 pdha9yelH0nOM7qMzvbJ/wlb/A/67bckX4SkJKKQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C61D2F802C4;
	Fri, 17 Jul 2020 01:57:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A404DF802C3; Fri, 17 Jul 2020 01:57:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6F03F8014C
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 01:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6F03F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="2OL1Wkb3"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F31620760;
 Thu, 16 Jul 2020 23:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594943832;
 bh=CVrPhRDZpGtUVljeDD7chkBEVjNDFK2KdbEN/pmKiK8=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=2OL1Wkb3gXk0T7R/4/ZlaWPB8xJOnevA+l/UhslrLZkjb3fg3x9LdYt1BjU9h9sWQ
 RH77MLFsmpqakkuH1boRU8Y4Dst6sAy8vQK1HaIbM4tHjkjHwjOPBJdEk1rspy5G2x
 W10BNabT6n128Va1LRUeSfySUVQMqh24RII9KP2c=
Date: Fri, 17 Jul 2020 00:57:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org,
 tiwai@suse.de
In-Reply-To: <20200715174551.3730165-1-kai.vehmanen@linux.intel.com>
References: <20200715174551.3730165-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 0/2] ALSA: hda: export snd_hda_codec_cleanup()
Message-Id: <159494380521.42174.15477213531881904522.b4-ty@kernel.org>
Cc: pierre-louis.bossart@linux.intel.com
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

On Wed, 15 Jul 2020 20:45:49 +0300, Kai Vehmanen wrote:
> this small series is preparation for a set of bugfix ASoC patches
> addressing a memleak at module unload for the HDA codec wrapper.
> Instead of duplicating HDA code in ASoC tree, I chose to export
> more functionality from hda_codec.c so it can be (re)used in ASoC's
> hdac_hda.c.
> 
> Full series:
> https://github.com/thesofproject/linux/pull/2252
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ALSA: hda: export snd_hda_codec_cleanup_for_unbind()
      commit: cc1d0cd817bad5dab50732a6668a87ff3eac3b5c
[2/2] ALSA: hda: fix snd_hda_codec_cleanup() documentation
      commit: 95ce82ac3c476688e3cf81ab04f9c5ac0a31e5ae

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
