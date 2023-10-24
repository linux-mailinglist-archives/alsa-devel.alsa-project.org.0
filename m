Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B43B7D536D
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 15:58:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72F5D850;
	Tue, 24 Oct 2023 15:57:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72F5D850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698155892;
	bh=6RjFQUx2aS9W96EY+vVbpPyHbDi4OypX4NJKROyEC6s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KIAcqcpHsj244KUokWaglqLWd3K2tuqrpQMer8EQknzpKsVYRw1uBtoi9fu89B6rK
	 UeWuCBzKQ5wPuN5Muy9/gb+5/Q37gGICXtkEO1X6cWTqYlo8vZRvh6WGyrHzwjUddA
	 oDaUWYo6Sw/AUNZ6I+VIaylSZjuq3yTEdRHCwikg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83DF7F805AA; Tue, 24 Oct 2023 15:55:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFB8BF805BE;
	Tue, 24 Oct 2023 15:55:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B8DDF805BA; Tue, 24 Oct 2023 15:55:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D306BF805AA
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 15:55:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D306BF805AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QNK3gLrG
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 86A83625C3;
	Tue, 24 Oct 2023 13:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F9A7C433CB;
	Tue, 24 Oct 2023 13:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698155733;
	bh=6RjFQUx2aS9W96EY+vVbpPyHbDi4OypX4NJKROyEC6s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QNK3gLrGWE5M9wnAF2YOhi3yRCXzv6Ppn57p2FgZvB7mRzzP6HGLzTungGTFKfZRH
	 GuL2fCJ7RUlFgktvrM3H7g8nb7/k5zDIIBu2/gsQ/NauyIZXznlB9jk3c99/oOuBHb
	 2rMa2PjYaw1emweZ0RQLSoGR1Fd0zm65r2Fh3M9jIrOzVvp6Rto9AooHz0b0YnKfK6
	 VcAAUhOUjwLcZu8MHHFuiyQbjlxHyIYseCdC0senVFk18Hj/kg4rLmHZPxrQetwPoA
	 cv7k81Rv+GB8/mkaZ5wKGzb8m0NVMxtwSySy5+oEj0WvbqL/XQecfEp2xUTcugeoyl
	 NaRvSxE6m0NRw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, perex@perex.cz,
 tiwai@suse.com, shumingf@realtek.com, rf@opensource.cirrus.com,
 herve.codina@bootlin.com, ckeepax@opensource.cirrus.com,
 13916275206@139.com, ryans.lee@analog.com, linus.walleij@linaro.org,
 sebastian.reichel@collabora.com, ajye_huang@compal.corp-partner.google.com,
 harshit.m.mogalapalli@oracle.com, arnd@arndb.de, colin.i.king@gmail.com,
 dan.carpenter@linaro.org, trix@redhat.com, liweilei@awinic.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, wangweidong.a@awinic.com
Cc: yijiangtao@awinic.com
In-Reply-To: <20231020083426.302925-1-wangweidong.a@awinic.com>
References: <20231020083426.302925-1-wangweidong.a@awinic.com>
Subject: Re: [PATCH V2 0/4] ASoC: codecs: Add aw88399 amplifier driver
Message-Id: <169815572396.69390.16547597734984966966.b4-ty@kernel.org>
Date: Tue, 24 Oct 2023 14:55:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: ZRYBDGECBGKIIFZ66LPWEG7UF3VPPBHH
X-Message-ID-Hash: ZRYBDGECBGKIIFZ66LPWEG7UF3VPPBHH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZRYBDGECBGKIIFZ66LPWEG7UF3VPPBHH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 20 Oct 2023 16:34:22 +0800, wangweidong.a@awinic.com wrote:
> Add the awinic,aw88399 property to the awinic,aw88395.yaml file.
> 
> Add i2c and amplifier registration for
> aw88399 and their associated operation functions.
> 
> v1 -> v2: Modify the reset mode
>           Delete AW88399_DSP_I2C_WRITES macros
>            and related debugging statements
>           Change the value of max_register in aw88399
>           Change the value of max_register in aw88261
>           Delete the judgment of unnecessary pointers
>           Modify the judgment of the ret return value
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: Add schema for "awinic,aw88399"
      (no commit info)
[2/4] ASoC: codecs: Modify max_register usage error
      commit: f1c406866af5dacdd9601cfa3be4873ebd801b86
[3/4] ASoC: codecs: Add code for bin parsing compatible with aw88399
      (no commit info)
[4/4] ASoC: codecs: Add aw88399 amplifier driver
      (no commit info)

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

