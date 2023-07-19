Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA05759792
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 15:58:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D9B81F4;
	Wed, 19 Jul 2023 15:58:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D9B81F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689775131;
	bh=8npZXLd2IRgCTmZxfiXFlG2B2pE9tuqQvGjSRbcdj60=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CKmGN9kn/lmOK8MiLFWMkWlxfB0L8oQbrohPcNYjfhn1J25TsrzMk816BdKZzffF5
	 kI5Yv0e+EUtaZqIQqVxltA+7Hvl5/CInIj8cGaJd3qqeMzKTfmcqeeVTWTa2ZcYbnY
	 eCMkzcL4rZSv1BYYt4h760RFET0AVuDfPuLXNoTk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C21DF80520; Wed, 19 Jul 2023 15:58:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC909F8032D;
	Wed, 19 Jul 2023 15:58:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C443DF80494; Wed, 19 Jul 2023 15:57:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97E54F800D2
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 15:57:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97E54F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TSixOYvp
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7D2436171E;
	Wed, 19 Jul 2023 13:57:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406D5C433D9;
	Wed, 19 Jul 2023 13:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689775068;
	bh=8npZXLd2IRgCTmZxfiXFlG2B2pE9tuqQvGjSRbcdj60=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TSixOYvpqdudxfNNWYntqJIv9QWoDxI+GvREThZlZLQ2tsif3QqmKEt4ZfUHKd2iL
	 U11UBGYJOsgcylv0boux2dvektMmH0ohvEv75MKPXJZl7DkJNneM+Li3t8ZP8oPTQt
	 5Mc1WbrpG6zWjsG4mHdCdkFmXMeozukSkfImLyeIZ5wXuIitkOHndxjl8d918zo6O/
	 +fnlhmO4WBugSW6n3ZyKS7s9e66rVRbLVEOarUbq03pU86Qiw9GOhSVct0XWhUFkza
	 eY3aysc5X6UKYlNcP3JPtpJVSVYlv2l75iu1PPmFPDl1dp6ND3fhCNhlFZJQNMfSs7
	 xIC0ndR0GOMlA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
In-Reply-To: 
 <20230712-asoc-topology-kunit-enable-v1-0-b9f2da9dca23@kernel.org>
References: <20230712-asoc-topology-kunit-enable-v1-0-b9f2da9dca23@kernel.org>
Subject: Re: [PATCH 0/2] ASoC: Improve coverage in default KUnit runs
Message-Id: <168977506472.48720.7264353211816565204.b4-ty@kernel.org>
Date: Wed, 19 Jul 2023 14:57:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: KMJO244IGQ44GWLNRAGQ5J3N7ZZ3PPJH
X-Message-ID-Hash: KMJO244IGQ44GWLNRAGQ5J3N7ZZ3PPJH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KMJO244IGQ44GWLNRAGQ5J3N7ZZ3PPJH/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Jul 2023 16:40:33 +0100, Mark Brown wrote:
> We have some KUnit tests for ASoC but they're not being run as much as
> they should be since ASoC isn't enabled in the configs used by default
> with KUnit and in the case of the topolofy tests there is no way to
> enable them without enabling drivers that use them.  Let's improve that.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] kunit: Enable ASoC in all_tests.config
      commit: 5aaa4024e14f8b878a348338a74b4c97bc2478b1
[2/2] ASoC: topology: Add explicit build option
      commit: b7dc237ef8b0897f5750a738d2c57469909a6a15

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

