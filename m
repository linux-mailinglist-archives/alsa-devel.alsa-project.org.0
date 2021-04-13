Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A06935E262
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Apr 2021 17:12:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 015B71680;
	Tue, 13 Apr 2021 17:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 015B71680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618326744;
	bh=+W96IuXgYD2p65bDFfeqaBI9QaBpzQ0dmecX2pIWOzo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RvOsG/3s8IQvKZRaGfmvaXnVBvmq0c7F34jX4xq9QtnDrh0csqerc2+dp3wQjURH6
	 mv2XPvkNPmcEdip/kpSn8ngvA091JdopGtwGtZjC+a0nvTI4cBf3bPQ+ASHKmpb1Un
	 GM0mavANRtLAZZM/CeqogPvWMlOoyXfabhID7sH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E640F8032B;
	Tue, 13 Apr 2021 17:10:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DFAFF8022D; Tue, 13 Apr 2021 17:09:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 888D7F800EB
 for <alsa-devel@alsa-project.org>; Tue, 13 Apr 2021 17:09:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 888D7F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uwZWnBUv"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0D85613B8;
 Tue, 13 Apr 2021 15:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618326567;
 bh=+W96IuXgYD2p65bDFfeqaBI9QaBpzQ0dmecX2pIWOzo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uwZWnBUvOfGce4nQHB2OtXu6CpzMmm6jw0Z79r+7L25sERwcJOSkrvZMZZNPSVMQK
 ca11Ocu4TMOsyGjulR0+FOqecBu81KG20znaVBK5phIMN1ajzZV2De0zcqeC+ttJnK
 83UN8i0EOfCQ7TPi625b5NWP/3IwGYR28bhQH3OWOi3YfWCXnCda9ira4qzjuS8TkL
 o/J3mGwRthtn2W5k+KT2g9Wc3flc2m2ygbJzXUVRnGA+rw8LaxmjJmNoSnr+3f0muj
 lumTJ6MV1s52bYRRNpsUOW1tgA1QU8mqimM2M5eLc7wXDTVg1s/ir1vRg6LK2O7QDQ
 ag8HuLURRgfIw==
From: Mark Brown <broonie@kernel.org>
To: david.rhodes@cirrus.com,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, james.schulman@cirrus.com
Subject: Re: [PATCH] ASoC: cs35l35: Fix an error handling path in
 'cs35l35_i2c_probe()'
Date: Tue, 13 Apr 2021 16:08:55 +0100
Message-Id: <161832446010.49152.17792070153979808894.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <15720439769ba94ffb65c90217392b0758b08f61.1618145369.git.christophe.jaillet@wanadoo.fr>
References: <15720439769ba94ffb65c90217392b0758b08f61.1618145369.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

On Sun, 11 Apr 2021 14:51:06 +0200, Christophe JAILLET wrote:
> If 'devm_regmap_init_i2c()' fails, there is no need to goto err. We should
> return directly as already done by the surrounding error handling paths.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l35: Fix an error handling path in 'cs35l35_i2c_probe()'
      commit: 38c694e98f6a6c8dfa48f2ba6f442363ed836efb

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
