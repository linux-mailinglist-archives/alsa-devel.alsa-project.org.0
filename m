Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA3A36123B
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 20:37:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C0F7168F;
	Thu, 15 Apr 2021 20:36:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C0F7168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618511846;
	bh=O1+0WiODIpCYZcwGoAl5KYAiusOP8F5ovHKj1xxGNjw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ji5spCLiuUld2hvJ5/bNgypTCWyGrctGktuBRK7oS7lhQWevgHNdjcn1cGnGbOobT
	 5qgRNXmX83d/nPsQjTkl9aUabem5VYxHW+fr/uKxeLDS5HEStoYt+DC11jHqvU2tOL
	 bmfgBi6RAK17Z7KUnLuMNMKkGWtPsKx1s1xmNxPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E328FF80482;
	Thu, 15 Apr 2021 20:34:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9605F80425; Thu, 15 Apr 2021 20:34:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29FDBF8021D
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 20:34:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29FDBF8021D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NUN6sw4N"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D74C86115B;
 Thu, 15 Apr 2021 18:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618511670;
 bh=O1+0WiODIpCYZcwGoAl5KYAiusOP8F5ovHKj1xxGNjw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NUN6sw4NLidlAzkW5p2Xw76EA7M+AIDaBWBH4CWFGGdBW3TwF7+7zFf5azMHlJVR4
 E7zA9BrNP0WhxflYITCB3An6xWqk2nzSHsV1aDJMQ3dTsGw/kgWf0Hc3e7L77wNYC8
 Z5D8KwJDlAS6fjBIMPPMh4jGWLV+uI/+lfj3/ndiw7OGu10LC4mYic2IuW1vOyb4iC
 0vvqHKRyk4s1lMOHRBFbG+CkwRnAQ0zjx3XdsEs13eyRXPvGe+wjb0UgMQttl5Fc19
 DZ1dfMh+TWNX5AXoNnzTNCsaC+ZS10AFqxPKw931s1jCC1tf8uOs2P6pGRFnPL2zSy
 18sW9LB+buBow==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: SOF: use current DAI config during resume
Date: Thu, 15 Apr 2021 19:33:47 +0100
Message-Id: <161851148785.23061.16444638554434646473.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210415162107.130963-1-pierre-louis.bossart@linux.intel.com>
References: <20210415162107.130963-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On Thu, 15 Apr 2021 11:21:07 -0500, Pierre-Louis Bossart wrote:
> Recently, the sof_pcm_dai_link_fixup() function was
> updated to match SSP config with the PCM hw_params
> and set the current_config for the DAI widget.
> 
> But the sof_restore_pipelines() function still chooses the
> default config for the DAI widget upon resuming. Fix this
> to use the last used config when setting up the DAI widget
> during resume.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: use current DAI config during resume
      commit: eea1d18e9b2d959df908746b193f66dba3078473

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
