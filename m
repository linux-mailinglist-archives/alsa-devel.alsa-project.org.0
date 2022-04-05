Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6899E4F298D
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 11:37:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CDDE17A8;
	Tue,  5 Apr 2022 11:37:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CDDE17A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649151470;
	bh=akJwXD5N3s4UPZe2aQccirJblgU77qRMdXJ8Vx02u74=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ua78M9asB0Fzez/cH4aDbNNhkS3JfPymOMeiR4k9iNuBKNUl5qB47wqYAR0rty65q
	 dhF+917TrEnHvrPiNzdwclzFLXjWVe2971oMvc4gJ+6mZPgHeYcsWPxqYFeRVQMUWK
	 wt0mnLtD+zubWS3ShHcsODOyu5r0uXICCAwRrymY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC7B6F805C2;
	Tue,  5 Apr 2022 11:31:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B64DCF805C0; Tue,  5 Apr 2022 11:31:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DB3AF805B6
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 11:31:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DB3AF805B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QY5Z55ca"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A2F4B616AE;
 Tue,  5 Apr 2022 09:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C1AC385A4;
 Tue,  5 Apr 2022 09:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151110;
 bh=akJwXD5N3s4UPZe2aQccirJblgU77qRMdXJ8Vx02u74=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=QY5Z55casbm5lR6qsgeuDF3G8adn/VXiErF+RjsEtRsfg4GpaCYaLtvuCO7PosAxH
 kkHB4iFMUltTTxoOVUAWWxvmuuENoZDt3kuzHs39r1ZJlxfJo0FdygNGNwcPqzn05n
 alNWru1jDELUfjINuCrFeKn+QHu7c7guZdOzI3Ydp+JBlBhvMWG3hlkDXFuvqSvHwJ
 U7Q/Eb5Lx3JOF0FPj5sUmQgVwgZuTweYoqr0Xm5Xuss8HGf8VTC/aTBs55mnupUSb6
 0Gns2AVqDzFaYzE8FSOdZR42prBZ4S4Y3h/Je4fBzLhPxmb93jke+bOB178wwnQJwf
 mSfQ0BvfzW62w==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Rob Herring <robh+dt@kernel.org>,
 povik+lin@cutebit.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20220331000449.41062-1-povik+lin@cutebit.org>
References: <20220331000449.41062-1-povik+lin@cutebit.org>
Subject: Re: (subset) [RFC PATCH 0/5] Apple Macs machine-level ASoC driver
Message-Id: <164915110754.276574.17127953624002951420.b4-ty@kernel.org>
Date: Tue, 05 Apr 2022 10:31:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, kettenis@openbsd.org,
 alsa-devel@alsa-project.org, sven@svenpeter.dev, marcan@marcan.st,
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

On Thu, 31 Mar 2022 02:04:44 +0200, Martin Povišer wrote:
> I put together a machine-level ASoC driver for recent Apple Macs (the
> ones with ARM64 SoCs) and want to gauge opinions.
> 
> Commit 1 is the binding. It is some subset of simple-audio-card with
> the extra distinction of allowing multiple CPU/CODEC DAIs per a DAI
> link. I want to draw special attention to the issue of describing
> speaker topologies. The way it now works is that the driver expects
> the speakers to be declared in a fixed order in the sound-dai= list.
> This populates a topology the driver expects on a particular machine
> model. Mark (in CC) has made the suggestion of keeping the topology
> descriptions with the codec nodes themselves in some generic manner,
> akin to how sound-name-prefix= already helps identify codecs to the
> user.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[4/5] ASoC: Introduce snd_soc_of_get_dai_link_cpus
      commit: 900dedd7e47cc3f8d93dfa0ae6ac6cf49eda0c97

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
