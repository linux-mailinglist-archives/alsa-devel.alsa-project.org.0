Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AA33D7A2F
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 17:50:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97A821F1E;
	Tue, 27 Jul 2021 17:49:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97A821F1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627401007;
	bh=qeFjoGXtsM0UG2sIzpn+TpGKqYiJO8llu5W6BinX7Gg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q8EzfU3rOY8V0gKBwOf2IhJAUu8aHWlzukzTQyyY58u5F2lDNJvRO1pdh91s0zHqT
	 A5P4WTeyuRUVrzHAQnNrIQdIib8cn0cFo0RCRvFuuN90oLlFeVNKvUcMfdHmh+tNMS
	 fXS639DItPM+lzPIdogN3tEfmgXpXbln9Vm2IXeU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74CDCF8027C;
	Tue, 27 Jul 2021 17:47:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3142F8027C; Tue, 27 Jul 2021 17:47:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAE0DF804F1
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 17:47:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAE0DF804F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bAgT/OD+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D396261B60;
 Tue, 27 Jul 2021 15:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627400847;
 bh=qeFjoGXtsM0UG2sIzpn+TpGKqYiJO8llu5W6BinX7Gg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bAgT/OD+2nY0sUv3SUrFtqIQVK3FzII8/QXQarIivuJVkzJfOAzNIOLSFDj90zBcQ
 sD6ywpHbLg6/t9pJzXoBArtbZ+3WwZR9EGVGR/BVf3uI33zQ4MN4+LqabJT6cgLzUG
 Bm9dFFx5Aor7qifB/USSgpFPOH/Op7amLMVVjnkGE9WnsIvNQrFs12dmhAU0LuGqh5
 V+p0TB9qz7dumjq0kBUXpKNDnuXmaYjRSPyrGBpkBbeE10MNvZSeGZvWHGrbBNYQsb
 OZ/QYJIcGsaMXihqeoPy5XfPBc0lXkYASAQYl7S/9f4mhh4FvMuZ4P6OUysAyTo9u5
 IuC1PJr0Dr4hw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: enforce exclusion between HDaudio
 and SoundWire
Date: Tue, 27 Jul 2021 16:46:28 +0100
Message-Id: <162739969149.18968.5796411375941420278.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210726182855.179943-1-pierre-louis.bossart@linux.intel.com>
References: <20210726182855.179943-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>
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

On Mon, 26 Jul 2021 13:28:55 -0500, Pierre-Louis Bossart wrote:
> On some platforms with an external HDaudio codec, the DSDT reports the
> presence of SoundWire devices. Pin-mux restrictions and board reworks
> usually prevent coexistence between the two types of links, let's
> prevent unnecessary operations from starting.
> 
> In the case of a single iDISP codec being detected, we still start the
> links even if no SoundWire machine configuration was detected, so that
> we can double-check what the hardware is and add the missing
> configuration if applicable.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda: enforce exclusion between HDaudio and SoundWire
      commit: 61bef9e68dca4316e1fc5fdf5f0c270bdbd65657

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
