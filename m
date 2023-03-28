Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C04646CC351
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 16:53:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 011B81EF;
	Tue, 28 Mar 2023 16:52:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 011B81EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680015187;
	bh=6ikCjipHS66rcyXVfshIISCl+dtRIRGR6GQNKCKfQCc=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J/J21OpNtVgUUlpHhN0iQBLPL4QO9zr2qScy6GUDD4AqhHOPeM5EdtuMQ4EGIx5pv
	 SfUClARSNilUVJlEGIqgSqlGkfBUYTnglAdUM+CpvhW5JS+iWiXzkiwRWqgoz3KMAi
	 p+lD3uDYjnlW6gT+n/eA6T/4VdImBG/u5tH8yFXk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 421C6F8024E;
	Tue, 28 Mar 2023 16:52:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA3ACF80272; Tue, 28 Mar 2023 16:52:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4228CF80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 16:52:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4228CF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p1CXnUXG
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E3D5A617F1;
	Tue, 28 Mar 2023 14:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC73C4339B;
	Tue, 28 Mar 2023 14:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680015117;
	bh=6ikCjipHS66rcyXVfshIISCl+dtRIRGR6GQNKCKfQCc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=p1CXnUXGkxLXevRiFij9n1o+nJOBjPkrYkqCzEt1c3DvnvVm4AfbybwSDTh3611VG
	 OY+7wtSMXaq+K1xnjKCD7kyrGHOVhdOJAqKZZ5uY1kDDRlnxbCAcRpeNL3A1yyzufU
	 e/4s8lDoURNur1tDhJWwXzutCuJB1/lh5rvTgUWbVCNGAWXBzLwEGNvhNtQfDU0lLa
	 2rXHULcwJgi2hfVsxBBZpa8rlJZ837OwwhojCqe5wGlOnQymDkUlbTvLG1b3ZLxUkL
	 UzDViPYzX2yTi3M6LFCursRt5tCngv7nXMpSjMsciAykgD5TaCUVvVTQ3tFi/0jpXU
	 eEHGVGUJ0YVig==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878rfyjz4p.wl-kuninori.morimoto.gx@renesas.com>
References: <878rfyjz4p.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/6] ASoC: remove unnecessary dai_link->platform
Message-Id: <168001511655.38339.4296035941377430802.b4-ty@kernel.org>
Date: Tue, 28 Mar 2023 15:51:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: 6SCVNIYVZE6RO76MEWJWARHSHECRBBQN
X-Message-ID-Hash: 6SCVNIYVZE6RO76MEWJWARHSHECRBBQN
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6SCVNIYVZE6RO76MEWJWARHSHECRBBQN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 15 Mar 2023 06:40:39 +0000, Kuninori Morimoto wrote:
> Current ASoC will ignore already connected component when binding Card.
> This will happen mainly "CPU Component" is handled as "Platform Component",
> which was needed before.
> 
> 	static int snd_soc_rtd_add_component(...)
> 	{
> 		...
> 		for_each_rtd_components(rtd, i, comp) {
> 			/* already connected */
> 			if (comp == component)
> 				return 0;
> 		}
> 		...
> 	}
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: fsl: remove unnecessary dai_link->platform
      commit: 33683cbf49b5412061cb1e4c876063fdef86def4
[2/6] ASoC: atmel: remove unnecessary dai_link->platform
      commit: 2f650f87c03cab72e751fc739f42a1e257bdc6b9
[3/6] ASoC: ti: remove unnecessary dai_link->platform
      commit: 3b0db249cf8fe0027e2a4161d27a8566d82fcd80
[4/6] ASoC: soc-topology.c: remove unnecessary dai_link->platform
      commit: e7098ba9b3785d626326040d300f95fec79aa765
[5/6] ASoC: simple-card-utils.c: remove unnecessary dai_link->platform
      (no commit info)
[6/6] ASoC: simple-card.c: add missing of_node_put()
      commit: 92405802a7d6aa1953915af869192296d1792d18

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

