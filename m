Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6F42B8636
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 22:01:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33BEB1723;
	Wed, 18 Nov 2020 22:00:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33BEB1723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605733277;
	bh=KThHWpdFxR/3phOiz3HNi03U9rqeXo7gprHwDV15yf4=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KNPfx8yLNzOJdFWCaEN0AF05ZdXSYPfSrmai9sO5ujTKceFJynIXxzo8ver5FkcDk
	 L4ygbfq7S+zOt1R1R/O+a6UcubaN1FRxQfO5QcItBy0kkGkQeSmHl1EJIP2EAdajGY
	 YwpRBGiLW//xSlzmJbWXMitIp8l1uvHe0p77B3jQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31BF6F802A9;
	Wed, 18 Nov 2020 21:59:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BE00F80276; Wed, 18 Nov 2020 21:59:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A154F8019D
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 21:59:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A154F8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Jc9Wvlfe"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB2682467A;
 Wed, 18 Nov 2020 20:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605733170;
 bh=KThHWpdFxR/3phOiz3HNi03U9rqeXo7gprHwDV15yf4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Jc9Wvlfe/pcTwjNlV1rq/vKK+uFCbs8GS/iyiQ0T9qt9nGzYRYdk7QFxt32DdaAX/
 1sMDk05Y0PEpS9S8Ahex+SyRkYbpjRLecQT6jvwelUAwE2kJBdP4csZumcOtELKlJD
 1dJS2Tb95G5DmIA1EhMDroATc2nF2SE+5GU/MpB8=
Date: Wed, 18 Nov 2020 20:59:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
In-Reply-To: <20201117013349.2458416-1-robh@kernel.org>
References: <20201117013349.2458416-1-robh@kernel.org>
Subject: Re: [PATCH 0/4] ASoC: graph card schema rework
Message-Id: <160573314458.46437.6554122354226422626.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sameer Pujar <spujar@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Lubomir Rintel <lkundrak@v3.sk>
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

On Mon, 16 Nov 2020 19:33:45 -0600, Rob Herring wrote:
> This series updates Sameer's patch to repartition the graph card binding
> schema and incorporate the OF graph schema. The schema was also mixing
> card node and DAI node properties, so I've split the DAI part (the
> 'port' node) into a separate schema.
> 
> There's another problem that 'frame-master' and 'bitclock-master' have
> inconsistent types of boolean and phandle. Having the properties just
> point to the local or remote endpoint within an endpoint node is kind of
> pointless. We should have gone with just boolean, but looks like we
> already have several users. MMP OLPC is the one platform using boolean,
> but it happens to work because the properties are effectively ignored
> and CPU DAI as the master is the default.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: audio-graph-card: Refactor schema
      commit: e52f3f291152042f1759b2b8838e7ca24556997e
[2/3] ASoC: dt-bindings: marvell, mmp-sspa: Use audio-graph-port schema
      commit: fd97ee45ec63759593b06be010a8ed395b299cce
[3/3] ASoC: dt-bindings: Refine 'frame-master' and 'bitclock-master' type
      commit: 251bf658558f9feff8a92ddcde402ffa220d13b8

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
