Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFBA772FFB
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 21:56:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54144839;
	Mon,  7 Aug 2023 21:55:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54144839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691438171;
	bh=MA89P5aCFUzquMYuuwGYdoMsvUqOjh0vcaEwwe202SQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YDDWYfdpVooO3SnAjy6WGwPqmdjC653DXK4ZN/eUpl+eqmcA13najGgVfhdeIh1/u
	 CZLf4i/Aq97ZllhLQe3vGZGtvdLWfh6f9gJSNB1YIVbCIVYI2X/6FxrL3+XwGs27cc
	 kKNQUGTLpe+ZEU/JggQ2xBM5lkmFsP7LsYBbXbp0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C0A9F80558; Mon,  7 Aug 2023 21:54:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B95EF8016B;
	Mon,  7 Aug 2023 21:54:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E90BBF80534; Mon,  7 Aug 2023 21:54:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F0C6F80116
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 21:54:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F0C6F80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RWaHLdDz
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 28A5A62188;
	Mon,  7 Aug 2023 19:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2638C433CB;
	Mon,  7 Aug 2023 19:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691438055;
	bh=MA89P5aCFUzquMYuuwGYdoMsvUqOjh0vcaEwwe202SQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RWaHLdDzu8iBZ+FCDqkL4aH/aU+93mc0c4jzBO+LswcdzhmSe88x+vvN9XoK2P5VG
	 hloKGQIR7F0TrvGFw3fs8gfXlQv4eP69i8nL69WRjGlNj/Nw/WYbwKLPdQ6z9CaQ1r
	 AeBgNrfdP2eeGN7lDuZlUsNFO+1WOvFwSF4fSA9MJcsrFOyzDy7STtSC6Zh27x9MSO
	 qlDzFShmDKmy1N+PDO3V1e7EmnF045lukjRnLQNTRgMPh5hu3abIuhoG1VwtlHH9Wf
	 QJnf1E5jdPPgd2z7wyGkytH+4B5RcD+IrX4e3DGfaW9GIm9BadyLnssHoanO2dVxVq
	 n3wLaJ2sKFLDg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de
In-Reply-To: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
References: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/16] ASoC: SoundWire codecs: improve pm_runtime
 handling
Message-Id: <169143805458.302632.441924325682226422.b4-ty@kernel.org>
Date: Mon, 07 Aug 2023 20:54:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: ARY3MJZDGYEEGXKKCN4JM7MXE7NCL2RB
X-Message-ID-Hash: ARY3MJZDGYEEGXKKCN4JM7MXE7NCL2RB
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 02 Aug 2023 10:36:13 -0500, Pierre-Louis Bossart wrote:
> This patchset improves the pm_runtime behavior in rare corner cases
> identified by the Intel CI in the last 6 months.
> 
> a) in stress-tests, it's not uncommon to see the following type of
> warnings when the codec reports as ATTACHED
> 
>     "rt711 sdw:0:025d:0711:00: runtime PM trying to activate child device
>     sdw:0:025d:0711:00 but parent (sdw-master-0) is not active"
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/16] ASoC: SoundWire codecs: return error status in probe
        commit: 3f3d66ba998fb079c1239430e96e3b138bc63166
[02/16] ASoC: SoundWire codecs: make regmap cache-only in probe
        commit: 49ae74abc76b2d9be4777e7ac833674fa4749071
[03/16] ASoC: rt5682-sdw: make regmap cache-only in probe
        commit: 6ab18105029ca3d739dd4c5c18638c7c6d568bbb
[04/16] ASoC: rt711: enable pm_runtime in probe, keep status as 'suspended'
        commit: a8590dd73d9f7fd955ac24a8e210d0721d5c10af
[05/16] ASoC: rt711-sdca: enable pm_runtime in probe, keep status as 'suspended'
        commit: 0c321fb857707ef68ffdb4f9672beb664e6679cc
[06/16] ASoC: rt700: enable pm_runtime in probe, keep status as 'suspended'
        commit: 6b8f8c5e6ffbd431d6cf40584dc8d3027f7e99b3
[07/16] ASoC: rt1712-sdca: enable pm_runtime in probe, keep status as 'suspended'
        commit: f3da2ed110e2884b29151313eee52947b786e1a7
[08/16] ASoC: rt712-sdca-dmic: enable pm_runtime in probe, keep status as 'suspended'
        commit: 8d890ecef1ef6e2e81f1709d54f6843846cfd15f
[09/16] ASoC: rt715: enable pm_runtime in probe, keep status as 'suspended'
        commit: 279be5919560d9f3afea1940bfd261297eecfa0c
[10/16] ASoC: rt715-sdca: enable pm_runtime in probe, keep status as 'suspended'
        commit: e4a3b8cf40713d6511391de3286ccba38998756b
[11/16] ASoC: rt1308-sdw: enable pm_runtime in probe, keep status as 'suspended'
        commit: 1772552eb304f3229309f66e2762e835955e2307
[12/16] ASoC: rt1316-sdw: enable pm_runtime in probe, keep status as 'suspended'
        commit: 64bae6732b2d3364ce4954015c84b4959f7d6e0f
[13/16] ASoC: rt1318-sdw: enable pm_runtime in probe, keep status as 'suspended'
        commit: df93dfa2b4d0f0e2ac2f73f78582a3830659d00e
[14/16] ASoC: rt5682-sdw: enable pm_runtime in probe, keep status as 'suspended'
        commit: 4af11e11defc200439a75a7957b03f3da37e46b2
[15/16] ASoC: max98363: enable pm_runtime in probe, keep status as 'suspended'
        commit: d6ce285641cfb506b6942818e06270fb091b8fe3
[16/16] ASoC: max98373-sdw: enable pm_runtime in probe, keep status as 'suspended'
        commit: b48f324f89ab8ee62c3448ef19445a1b292e02d3

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

