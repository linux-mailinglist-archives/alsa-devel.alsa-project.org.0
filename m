Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E8047D361
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Dec 2021 15:06:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A67D31704;
	Wed, 22 Dec 2021 15:05:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A67D31704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640181960;
	bh=GNoSR9vATcN9dhd1CYRFeQx4pH59qmWj2wK1IQ1OdLU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nZblsqsB+E56GDic3wZ3JGdwpqWEEzH0UlHp8ky7PQONm846QZVgE933xtFF7I1EY
	 /mGnFHkkFGsnVAoaKSSzagt5DZ36sk7WuLmwv6ui13fzg1md3x/gMBgKHyu9s1rRbX
	 PNFLuPQ5WlRSrn7JZ7lrHXKNfTsynimxW0pu2r9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01386F80111;
	Wed, 22 Dec 2021 15:04:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29EC8F80109; Wed, 22 Dec 2021 15:04:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8531AF80105
 for <alsa-devel@alsa-project.org>; Wed, 22 Dec 2021 15:04:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8531AF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RPLXrACy"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4B6A161A38;
 Wed, 22 Dec 2021 14:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7702AC36AEA;
 Wed, 22 Dec 2021 14:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640181883;
 bh=GNoSR9vATcN9dhd1CYRFeQx4pH59qmWj2wK1IQ1OdLU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=RPLXrACyo+zki3TL6/5jE5+DFghyQj9p9XLlNuRVUhjR7NBNVXU4r1L8Ymim1S6+c
 qGmD7qYWE17yzP+RKpFR+innBJHu6WDYe5qvFTPzgeSe2IiyXwLrOykfNIqbd5MOJt
 RUIp9OvmDRiqWK2pdinnJFrP9a/aW4GyB6uypgWVlZkN943cPlyIAyPa9Hahbcg/mQ
 YkAFt/q54b9l0bB+BF8hNkJcC6B8M+MZqGo8tImKj/rIUnjozr7IgaO64hvaWqiO/9
 Sd741ngElI5Cfd7WZgplUMQXFPEw44f2clSsNeIwTMBA7cidiffUpwLU1CYYTaASez
 ex/qIOjLKo2ZQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Alexander Stein <alexander.stein@mailbox.org>
In-Reply-To: <20211218143423.18768-1-alexander.stein@mailbox.org>
References: <20211218143423.18768-1-alexander.stein@mailbox.org>
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: Use name-prefix schema
Message-Id: <164018188218.2905927.3191011789641589358.b4-ty@kernel.org>
Date: Wed, 22 Dec 2021 14:04:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org
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

On Sat, 18 Dec 2021 15:34:21 +0100, Alexander Stein wrote:
> name-prefix.txt does not exist anymore, just reference the schema instead.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: Use name-prefix schema
      commit: 0d422a466ef7fdbbe402194ac06144d1bbcdc227
[2/3] ASoC: meson: t9015: add missing sound-name-prefix property
      commit: 847cbea6459d5beb3f0f960fde4337f28b663eae
[3/3] ASoC: meson: g12a: add missing sound-name-prefix property
      commit: 1f6532073e3e9caee1dbc3f9b4be28359a181ea4

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
