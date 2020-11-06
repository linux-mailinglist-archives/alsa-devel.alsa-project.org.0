Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 569C72A95DB
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 12:56:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCFFD168F;
	Fri,  6 Nov 2020 12:55:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCFFD168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604663767;
	bh=t7hIe64oZxwvv8OMpmU6pe1LYNjGNe5T4p+vSi15Hdo=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ala/q4RinumcHCKnOXJo4Hpg4UD1WdMCqzBoK3gIPC6k3rc0+6RRSxkw4SdskS924
	 WIh++53dKAft/uu1O9WtIlRzK96XLkP75iBaLn7pVN0+u8kX09zUP2Np36VjT8YXuv
	 yWM0DB2K7x3CplKesAwQH58vJ05J276ECLmpyG9k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CE2EF80232;
	Fri,  6 Nov 2020 12:54:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93444F80234; Fri,  6 Nov 2020 12:54:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71E76F800BA
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 12:54:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71E76F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ueC6j1ea"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4AB0120719;
 Fri,  6 Nov 2020 11:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604663666;
 bh=t7hIe64oZxwvv8OMpmU6pe1LYNjGNe5T4p+vSi15Hdo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ueC6j1eazn08TXoAslq5E1lfR+oB3YJdYHN4pO33aHhoNpHKjnvQZYa/IIxvgZntC
 lm7RSxvo0J9CLQI85wGQJG0YnLydAE7j6KF9QhOGvoeKaewRT1Ol1XDX+dEg4Ll5Qz
 Fl5IEZTzWnTVM/u/NjQMAnEfjvAGeNC4Io8YvSxs=
Date: Fri, 06 Nov 2020 11:54:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87eel8baxc.wl-kuninori.morimoto.gx@renesas.com>
References: <87eel8baxc.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v6 0/3] ASoC: dt-bindings: audio-graph-card: switch to
 yaml base Documentation
Message-Id: <160466365500.22812.987228346341402469.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>
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

On 05 Nov 2020 15:04:25 +0900, Kuninori Morimoto wrote:
> Cc: Sameer
> 
> These are v6 of switch to yaml base Documentation for
> audio-graph-card and renesas,rsnd which uses audio-graph-card.
> 
> v5 -> v6
> 	- add Acked-by/Reviewed-by on each patch
> 	- remove "audio-graph-card,xxx" property
> 	- remove un-needed if "ok"
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: audio-graph-card: switch to yaml base Documentation
      commit: 97198614f6c3b019299b1189106478ffb58481c9
[2/3] ASoC: renesas, rsnd: switch to yaml base Documentation
      commit: 2d8fc973646c8ae87b668e30730becc8b1a57a06
[3/3] ASoC: renesas,rsnd: Add r8a77961 support
      commit: 8d96ec9ba9e7bd606d5d0fead9f91f0c5a3366a0

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
