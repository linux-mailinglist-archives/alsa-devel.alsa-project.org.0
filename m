Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D5F6AC163
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 14:35:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67FA41124;
	Mon,  6 Mar 2023 14:35:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67FA41124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678109752;
	bh=C5gzhVF9al1Ieb6s0tZHqRx2Mp9qfAXbdc2k184yTRM=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E9UOZcbpVOMRfAF3vyVGfuQcc2kTGekrX2hK9Z1yABfzbisxNgVrY+FwoH59ytxlx
	 SHDQlo0VpjCOL3guGcGT1I43l4waxzWefuU52UT5tKv3svDMwI3oJJZsrYqbWs1Pa6
	 zo0N92C5AW1IhCrn/lLWBJKNY0E+stO+QLiJ5ZF0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55B12F80571;
	Mon,  6 Mar 2023 14:33:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03287F80544; Mon,  6 Mar 2023 14:32:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7482BF800DF
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 14:32:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7482BF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HqvWr+PJ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CEAC5B80E1A;
	Mon,  6 Mar 2023 13:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07D3CC433A0;
	Mon,  6 Mar 2023 13:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678109533;
	bh=C5gzhVF9al1Ieb6s0tZHqRx2Mp9qfAXbdc2k184yTRM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HqvWr+PJYwmxlnrMtIUVJEuCr8bYL535EiI2gpO87jDCnN+pRkwY6IwlTn6uOGbnu
	 jCXaGuEGK9Rc5Ke3vC7QJ0DXrz0ksTygK3duhgllXuV+yQ1kPDzUMPDdm9Uqe4BMx8
	 S5JaBRVYDmX4sVe7u9c5J7zT+OQqyGoJ1zulNeUTEWM/9m9RPpeWSO/lIlBWURlno9
	 113ChyVWeZTFePNwGUibtPwA3veBqO9IhPGYmAd34JjNEk3WVosLW549sNSEjOk5AR
	 JKhTtyyheF3mFJtGeKhjcrch9EjIgxZwrfOdQIn6ncBdFtAcODgrU+buOS5axTYfdv
	 IMiC5TMj356Rw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ladislav Michl <ladis@linux-mips.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Benjamin Bara <benjamin.bara@skidata.com>,
 richard.leitner@linux.dev
In-Reply-To: <20230302-max9867-v2-0-fd2036d5e825@skidata.com>
References: <20230302-max9867-v2-0-fd2036d5e825@skidata.com>
Subject: Re: [PATCH v2 0/3] Add "mclk" support for maxim,max9867
Message-Id: <167810953075.75807.14829875612499629879.b4-ty@kernel.org>
Date: Mon, 06 Mar 2023 13:32:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: ZRNNX3DVE2BMAUW3UWS3O6224T26HNE6
X-Message-ID-Hash: ZRNNX3DVE2BMAUW3UWS3O6224T26HNE6
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Benjamin Bara <bbara93@gmail.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZRNNX3DVE2BMAUW3UWS3O6224T26HNE6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 03 Mar 2023 11:04:00 +0100, richard.leitner@linux.dev wrote:
> This series adds support for the clocks properties in the
> maxim,max9867 bindings. Furthermore the binding definitions are
> converted from txt to yaml.
> 
> The clock property is needed to define the mclk for one of our
> boards which uses the the i.MX8MP SAI MCLK as clock for the
> maxim,max9867.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: maxim,max9867: convert txt bindings to yaml
      commit: 6668f70abeea30f4674b2fdbc4232d5c3611b272
[2/3] ASoC: dt-bindings: maxim,max9867: add clocks property
      commit: d63e55b3e8ec90da69107f32038f3059d7317cc5
[3/3] ASoC: maxim,max9867: add "mclk" support
      commit: 448b06ba107d925d59d02781acdd2e4ad12dda0b

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

