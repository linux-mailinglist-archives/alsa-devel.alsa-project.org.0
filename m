Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B88775C51C
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 12:56:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 935B2844;
	Fri, 21 Jul 2023 12:55:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 935B2844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689936995;
	bh=UfcFzCnVYie6vKPWZ/3LUMZroWuNQRGTQy9ESlj0NHU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kZKymDAFYyWoKKL03QsMv8KRsL7JRUBGb5F17aQOQMTSuBP90IUGF9EsIHzb0Qzoc
	 AlS3OwOCDN8pPdTf8nNdBD5oZ49XQkbHLWq/skIEJ8SBfUddeW7rp17jHu7TcLG9Mm
	 J4hqI+9hfPtuhVmwfahwRNewPQ+j4u0fLMySU8zM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B6D5F80558; Fri, 21 Jul 2023 12:54:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62301F80520;
	Fri, 21 Jul 2023 12:54:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99436F80494; Fri, 21 Jul 2023 12:54:52 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 17C35F8027B
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 12:54:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17C35F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IR/vYx+K
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4AA58619BA;
	Fri, 21 Jul 2023 10:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 859E1C433CB;
	Fri, 21 Jul 2023 10:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689936884;
	bh=UfcFzCnVYie6vKPWZ/3LUMZroWuNQRGTQy9ESlj0NHU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IR/vYx+KcC+hY+nU/jBsHbvgzog6GaJSP477Jv0KUAo2tunuo3bs4qjxToAeSC3H/
	 z9A8Br+SJFAQbLpL6TbphmOS8ZYQ0t9VLNMMV+0gxN9m08VMnmBLv/B2UjFQNpsloX
	 wQHhrAkKv2USg2YU/kVi58sRBGUKv4qf9OQJXG2MVbwzTbZpBD1kMzwyCtJQArX+0I
	 bAPQGOBCUePagTvQOSAMqFDXFdRxbVQ6UclSvyLeR8GIxlMQjTvhpHPXvHa2wHQ79O
	 cMPdiinCAifFKS96Q3B2qB4+xxgnUX6oJI0BXw0eqnMc3m36A85ivjIWOgB9wd3tyw
	 Dnx3RCI9IgydA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Francesco Dolcini <francesco@dolcini.it>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com
In-Reply-To: <20230719121918.247397-1-francesco@dolcini.it>
References: <20230719121918.247397-1-francesco@dolcini.it>
Subject: Re: [PATCH v1] ASoC: dt-bindings: wm8904: Convert to dtschema
Message-Id: <168993688226.20527.6554353152363123006.b4-ty@kernel.org>
Date: Fri, 21 Jul 2023 11:54:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: JY6LGV7MSNTZ5AV2BNTBRHRAVJHOMEZT
X-Message-ID-Hash: JY6LGV7MSNTZ5AV2BNTBRHRAVJHOMEZT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JY6LGV7MSNTZ5AV2BNTBRHRAVJHOMEZT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 19 Jul 2023 14:19:18 +0200, Francesco Dolcini wrote:
> Convert the WM8904 audio CODEC bindings to DT schema.
> 
> Compared to the original binding #sound-dai-cells and the missing power
> supplies are added. The latter are all required as described in the
> datasheet.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: wm8904: Convert to dtschema
      commit: 83759352fd0b941c3ab3d365bf5f754b9e2f1af9

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

