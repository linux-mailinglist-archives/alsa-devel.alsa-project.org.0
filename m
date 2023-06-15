Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8A8731AB4
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 16:00:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6735B84B;
	Thu, 15 Jun 2023 15:59:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6735B84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686837638;
	bh=e3VpKCzPbeixM3x4B0QVKu3+2GIDQ2j5ljGAZGiHfbk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rPhjYi/mHGSqGu4Z7eRGQOHBzf7jYNzCN0oIiwxLY/O6kiTRzFUTbhh+6nsNN96+X
	 adoDXZczZawhj2ErODLCFajvrZun/rrBFPjweOU2k/j1+PKpzHCUzjsDW2N/GO0q+t
	 focHwdn+YBLODgPT0tw4S2b7I3cGbna2bwC22ecA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C275AF80579; Thu, 15 Jun 2023 15:58:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A421F80579;
	Thu, 15 Jun 2023 15:58:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52D99F8057A; Thu, 15 Jun 2023 15:58:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F56AF8055B
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 15:58:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F56AF8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BVPxbAVx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 04455638EE;
	Thu, 15 Jun 2023 13:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C54C433C8;
	Thu, 15 Jun 2023 13:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686837514;
	bh=e3VpKCzPbeixM3x4B0QVKu3+2GIDQ2j5ljGAZGiHfbk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BVPxbAVxrZptCpmaDFfQqJWSOS4K9YsBmnXB5FJCY/QuHm6yYMLSxeloirAIvT5tE
	 LgJTW5I+jVz7JishsNAnVudHcKpVwd1mrmyNtiRdd5bufP/y0p5UYEz43qYulEKvWR
	 CwVC7eCkQQLkpavOfMxJgBDrWLGdOwgPKGNVMhwO3sE/sxStwhbpfRQJ/QU0Tgw8eY
	 gN4XYivS0ZUcXb4CY3dv0aQleoluY0CtfEaHnxBM6kSya77Stu1wNOPzD06ltdxRAf
	 /+M09WcccRkonSLutPnEkLIUsbGDoIGthxr1O9n2KnAdGB6EesHMjH417GZBBfL8Zx
	 AzDw1Dnr1nHlg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, perex@perex.cz,
 tiwai@suse.com, rf@opensource.cirrus.com, shumingf@realtek.com,
 povik+lin@cutebit.org, herve.codina@bootlin.com, ryans.lee@analog.com,
 wangweidong.a@awinic.com, ckeepax@opensource.cirrus.com,
 ajye_huang@compal.corp-partner.google.com, sebastian.reichel@collabora.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?=E2=80=9CRyan?= <ryan.lee.analog@gmail.com>
Cc: venkataprasad.potturu@amd.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230613060945.183128-1-ryan.lee.analog@gmail.com>
References: <20230613060945.183128-1-ryan.lee.analog@gmail.com>
Subject: Re: [PATCH V3 1/2] ASoC: dt-bindings: max98388: add amplifier
 driver
Message-Id: <168683750761.557448.3503529701068446770.b4-ty@kernel.org>
Date: Thu, 15 Jun 2023 14:58:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: BIM7T75TYCGXUS7RR6PWTNXXFAHN7W5H
X-Message-ID-Hash: BIM7T75TYCGXUS7RR6PWTNXXFAHN7W5H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BIM7T75TYCGXUS7RR6PWTNXXFAHN7W5H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 12 Jun 2023 23:09:44 -0700, “Ryan wrote:
> Add dt-bindings information for Analog Devices MAX98388 I2S Amplifier
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: max98388: add amplifier driver
      commit: 4cab2d5faf7eff9896a15be3b301150b6fbfcaba
[2/2] ASoC: max98388: add amplifier driver
      commit: 6a8e1d46f0621c15d2993c5e847f4f264102f93d

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

