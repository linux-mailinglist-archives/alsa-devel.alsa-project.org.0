Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B24E2BB850
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 22:31:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE5AB1702;
	Fri, 20 Nov 2020 22:30:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE5AB1702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605907864;
	bh=VmAbKyXgwBwSjgQF2F+AMFetRFMMarrklhr/WS00YU8=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IqpGSuMMFZ2KAkT2z7WwScGbV35OEFnh1yS7f3iGRX4kVWztjwm+GNh8xg/mfOMWc
	 KXdkX+E4EBrUthdbUqUTWmaYAKQToauxKKx6c28DGS5BMtrvCPmL1tUDrnRrCboEfc
	 9EdCA1lu72RPmzDnXZq82Lgrs6MVDkga6cOoJmsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BBC3F8016D;
	Fri, 20 Nov 2020 22:29:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFE91F80166; Fri, 20 Nov 2020 22:29:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 852E7F80166
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 22:29:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 852E7F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gwkVWSs5"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3561B2240B;
 Fri, 20 Nov 2020 21:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605907763;
 bh=VmAbKyXgwBwSjgQF2F+AMFetRFMMarrklhr/WS00YU8=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=gwkVWSs5Df+vLXTqZc54yHQdyd3dtcP8ss6nxMXoSg3gVd7U05pD3K0Gtns+gCOyO
 stS4gmadx73hSgLmfj5Hj5hUBvWq1ZpFDAIQ8okXPr+APEnTFw89doDl+HzYKq9F7q
 Wn0m41G8qet4zVi3fnF8tOHi9RI0lgJPB5edb0wk=
Date: Fri, 20 Nov 2020 21:29:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20201111173105.1927466-1-kai.vehmanen@linux.intel.com>
References: <20201111173105.1927466-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: control: override volume info callback
Message-Id: <160590773741.47461.11811890720048045016.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 daniel.baluta@nxp.com, ranjani.sridharan@linux.intel.com,
 Jaska Uimonen <jaska.uimonen@linux.intel.com>
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

On Wed, 11 Nov 2020 19:31:05 +0200, Kai Vehmanen wrote:
> ASoC dapm controls currently don't support more than 2 channels. This is
> a problem for SOF-based devices where individual volume control cannot
> be provided on the 4 DMIC input path.
> 
> If we want to provide controls for more than 2 channels, this patch
> suggests a simple solution based on an override of the info callback.
> For example, in the case with 4 channel DMIC PGAs, a sof_info callback
> would be used. Mono and stereo cases will keep using the existing dapm
> info callback.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: control: override volume info callback
      commit: fca18e62984a0d797da8379a422a6bb644d68244

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
