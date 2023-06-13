Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C0F72E836
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 18:19:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23B24E88;
	Tue, 13 Jun 2023 18:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23B24E88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686673187;
	bh=Mma5cFj/i5+8iPwu53HhgwL7Bq26PgrJxBZ3tfa3OPk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eKPZyySkXM4ZJiJjhMPO2OP+ROOkAd8XQfgOq0VN2EwL81Y0vJLOrmT1ZIguxr0zC
	 3vy5BkOpk+wbb/ZXGG8vEmFzoSjFbvGkgG6kvFEz2zEaqlRVrfgeaGwrNPgGxvAUoe
	 r+FEgIlzNDf29uC12pEhc12/8ewu9037/xxmDp1g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85527F80246; Tue, 13 Jun 2023 18:18:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0C67F80132;
	Tue, 13 Jun 2023 18:18:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAA01F80155; Tue, 13 Jun 2023 18:18:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9FB3F800ED
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 18:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9FB3F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Rcwob7jr
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D72AC62D5D;
	Tue, 13 Jun 2023 16:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91B4C433D9;
	Tue, 13 Jun 2023 16:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686673087;
	bh=Mma5cFj/i5+8iPwu53HhgwL7Bq26PgrJxBZ3tfa3OPk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Rcwob7jrGGd1lfAmM0leDN2D/2cTevP09Q/4wlSdr6yoGUGloSV7unRh3/2PWV6E7
	 +qoIHwCLZldWGcQb3kkVio9JrCLwcWjNY5dDF0RiHAguRzz+ND3IpzzCIsbxjZCsEK
	 Esi8w1/CcIQ2xxSpVnuhzewJroILmo4K+iyjEug7Gbiyi9gSSC4x7DrE3Y+rtL4MaB
	 fs77RDpPAvvJH9iBPHONRggzoVGs9ZFygUzfkai+vB4kQwTdVsxOgUG3QLt/0wKxvm
	 eOi6INtZ9+IBFlgZTG7SfrRpNthDkLk1DoGIb+abXgO0ixIG2yXCuODSRIVZq+sx+h
	 dMfgh24bZFevw==
From: Mark Brown <broonie@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 asahi@lists.linux.dev
In-Reply-To: <20230609-asoc-cirrus-maple-v1-0-b806c4cbd1d4@kernel.org>
References: <20230609-asoc-cirrus-maple-v1-0-b806c4cbd1d4@kernel.org>
Subject: Re: [PATCH 00/10] ASoC: Use maple tree for Cirrus Logic devices
Message-Id: <168667308442.106697.13041081726407558146.b4-ty@kernel.org>
Date: Tue, 13 Jun 2023 17:18:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: FFVTEDU4GJEYRNOBOQ5YQYRCSM7ZU5YP
X-Message-ID-Hash: FFVTEDU4GJEYRNOBOQ5YQYRCSM7ZU5YP
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FFVTEDU4GJEYRNOBOQ5YQYRCSM7ZU5YP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 10 Jun 2023 14:56:20 +0100, Mark Brown wrote:
> A lot of the Cirrus Logic devices only support single register
> read/write operations so they get no benefit from using the rbtree cache
> over the more modern maple tree cache, convert them to use maple tree.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: cs35l32: Use maple tree register cache
        commit: 176bb179f190682d496220be469ea20527bb5f43
[02/10] ASoC: cs35l33: Use maple tree register cache
        commit: 7a230512d335793fdc43bb85a7d5cff9dd171c26
[03/10] ASoC: cs35l34: Use maple tree register cache
        commit: e7795f2d29e08e15fbc5ad88b94cf1899915a7c3
[04/10] ASoC: cs35l35: Use maple tree register cache
        commit: 28f851babc484c86bc8e1919ad0bbe11f4fd9210
[05/10] ASoC: cs4234: Use maple tree register cache
        commit: bb1bd25ad79cf21b8fa4c0eae474307b2d24b268
[06/10] ASoC: cs42l42: Use maple tree register cache
        commit: 6b7fed83c9455f64a1509a9e1d512a92edaaf44e
[07/10] ASoC: cs42l73: Use maple tree register cache
        commit: 7e39a71876244639774c71144e4b5dee7799e1cf
[08/10] ASoC: cs42l83: Use maple tree register cache
        commit: 62145b0a537410d7ce237945c339635f9a86a895
[09/10] ASoC: cs43130: Use maple tree register cache
        commit: ce598b2f83608f3818f8a4079662d3844679b16f
[10/10] ASoC: cs35l30: Use maple tree register cache
        commit: 0eff26b13da4eb5a71a59280c3483273ccb5b9cb

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

