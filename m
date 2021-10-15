Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7255F42FC5F
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 21:44:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16966188B;
	Fri, 15 Oct 2021 21:43:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16966188B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634327041;
	bh=KtZDJCulMoANWfoNyCXARBnvd3FGKs4+XFPp+tkbYkw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fhOcoGTk8lxZusSR+Ri3VPC+fLUrj2spXS1cC+05AIzuwe218Ta6R4HqN2jVXPpGB
	 d90C4v67fy+K0TyzpKnDqpyCVq+VuDykWbNGyFQQdo5TZZDCo22ZXOREW4fc8weKtc
	 QHrMIJYrCP+43c6601B2qanfRxk5791lfUh4JUIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5E44F8028D;
	Fri, 15 Oct 2021 21:42:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7F56F8028D; Fri, 15 Oct 2021 21:42:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B65F8F8025B
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 21:42:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B65F8F8025B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aki/E/BS"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14E1D61163;
 Fri, 15 Oct 2021 19:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634326930;
 bh=KtZDJCulMoANWfoNyCXARBnvd3FGKs4+XFPp+tkbYkw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aki/E/BS0SANHHxPw0kmxY3fZCcEWDvN3aWV3TqKd92cttcMsMHBBksuLbA3oC+WL
 ke9PmhehdVpT3TFRNlPi+02w01cLqZLyVEM4qX9RnldN+mjjwTPhQrKUjOoLYTYS7b
 FOgEajCldqb0RtZSVGGHDJ7b5lDoPDwsOQby+/5UhiB9qzTfsJfnk17gNzE7tG37IF
 7o1g0MMLdpGDs87mGP5DhV7VsL4EnEJv7K091TO9NHUXQe/AR/qmu/dfGuuxF0UiOy
 pZdDs20lbB0ZnzR04nXU2oHeKFn6Avb/Gc/UHwjqpnCq1sJzAAwzHBpK91/xg6h0YM
 hU0+2sjYELong==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v4 00/16] ASoC: Add Audio Graph Card2 support
Date: Fri, 15 Oct 2021 20:42:00 +0100
Message-Id: <163432688460.1314975.3588111093485514494.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <87a6jn56x0.wl-kuninori.morimoto.gx@renesas.com>
References: <87a6jn56x0.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

On 06 Oct 2021 09:32:59 +0900, Kuninori Morimoto wrote:
> We already have Audio-Graph-Card which is Of-Graph base general sound
> card driver. Basically it supports basic CPU-Codec connection, and is
> also supporting DPCM connection. Because it was forcibly expanded to
> DPCM, DT parsing is very limited and very difficult to add new features
> on it, for example Multi-CPU/Codec support, Codec2Codec support, etc.
> 
> This patch adds more flexible new Audio-Graph-Card2 driver for it.
> Audio-Graph-Card and Audio-Graph-Card2 are similar, but don't have
> full compatibility.
> The reason why I need Audio-Graph-Card2 instead of updating Audio-Graph-Card
> is that it is very difficult to keep compatibility.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/16] ASoC: test-component: add Test Component YAML bindings
        commit: 5dd7e163e71f4b9a82c35f0bc2af3d7c5b1fb7f5
[02/16] ASoC: test-component: add Test Component for Sound debug/test
        commit: d293abc0c8fbb7b1610b9f7497323028b06cd5f8
[03/16] ASoC: simple-card-utils: add asoc_graph_is_ports0()
        commit: 92939252458fa279d0013e5dc545a98a4ca4064a
[04/16] ASoC: simple-card-utils: add codec2codec support
        commit: 52a18c291470e66a27f415b8c99136f25f55092e
[05/16] ASoC: add Audio Graph Card2 driver
        commit: 6e5f68fe3f2d35046856572fa037a5149d55a070
[06/16] ASoC: audio-graph-card2: add Multi CPU/Codec support
        commit: c8c74939f791ccbbfff988aec5f929374dbef2a6
[07/16] ASoC: audio-graph-card2: add DPCM support
        commit: f03beb55a831bc7575b3c8882bf8fa6c81198eca
[08/16] ASoC: audio-graph-card2: add Codec2Codec support
        commit: c3a15c92a67b701751c2680fa894d832570f7e7b
[09/16] ASoC: add Audio Graph Card2 Yaml Document
        commit: 466ac332bc5762de441d05f1314b8e7ef2c6dccb
[10/16] ASoC: add Audio Graph Card2 Custom Sample
        commit: 95373f36b9b810aa5461e3a864d7a3ad05b30b91
[11/16] ASoC: audio-graph-card2-custom-sample.dtsi: add Sample DT for Normal (Single)
        commit: c601fdf5c845b5bc416a1215cd22a7a786fcf268
[12/16] ASoC: audio-graph-card2-custom-sample.dtsi: add Sample DT for Normal (Nulti)
        commit: 5279bd8a842b88b24724dc6364b9850eacb5f490
[13/16] ASoC: audio-graph-card2-custom-sample.dtsi: add DPCM sample (Single)
        commit: e781759ab87b5b7bc4282faf08352e564c3eaf81
[14/16] ASoC: audio-graph-card2-custom-sample.dtsi: add DPCM sample (Multi)
        commit: cb2d94aa4d51e49f68ea02fe49225948467427bd
[15/16] ASoC: audio-graph-card2-custom-sample.dtsi: add Codec2Codec sample (Single)
        commit: 349b15ef9d535116ded20fd2ac945afce98b227e
[16/16] ASoC: audio-graph-card2-custom-sample.dtsi: add Codec2Codec sample (Multi)
        commit: baa274db99effe4fd85cf7bee70fecc8159be0cb

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
