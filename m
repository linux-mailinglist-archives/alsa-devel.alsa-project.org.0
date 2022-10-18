Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C3E602A25
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 13:29:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ECEB8E1A;
	Tue, 18 Oct 2022 13:28:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ECEB8E1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666092556;
	bh=lA4c61bWI/+sO8LDTMmKrestbI06OjaSkU8aIZelk10=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KhK9Kkn0XsUsMFQe7lhIQYevIkG9xf5dC1mi9A2QT3p7KmViGZCDi7ExPz69EkOFY
	 3YOZDnCvAsnbp+tNP/9EZ2t5k/VX+nZI9UCiIzrP+t2D4ulD2CQijLfECJpI/bUtI4
	 Nbxn72m+jnpEgPl1ntgM3XohG89K2Zx1SH/5QOZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DC04F804BD;
	Tue, 18 Oct 2022 13:28:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CAF0F804BD; Tue, 18 Oct 2022 13:28:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91B1DF800E5
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 13:28:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91B1DF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="A/C4bUwq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 15D6C61522;
 Tue, 18 Oct 2022 11:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E31C433D7;
 Tue, 18 Oct 2022 11:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666092493;
 bh=lA4c61bWI/+sO8LDTMmKrestbI06OjaSkU8aIZelk10=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=A/C4bUwqwUrs5ibD9+YRYbEW0JFNnvz/3TvhFmCEj+J2qiAKF0WC7aBb97lyMiJHT
 +DNsE5ASL72vszqMOkrfZm9iORcI6WWN0LkWIPsbi/WbLgkPnCDj/GklNjqIoD5doT
 HCOrJHm0FtbKAJAJNHnh78e7C6fpvUzr0pF0S1V661/ths1VVxHonlHVlSeLyE0AIt
 o76uvNpURDJYL5A0iryldXvBsu/WZTVkIcq8OZfGiLTFPGaZA+IogNzvxqgXB2pONR
 /BhmWO4N1UajbU4Vpyz3Ni41VT9hUD48Np0mbFcmFqvFMGirWLHkpp2kHMN1twlhoN
 k95mtM8sJMTtQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
In-Reply-To: <20221010093941.2354783-1-Vijendar.Mukunda@amd.com>
References: <20221010093941.2354783-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: amd: Update Pink Sardine platform ACP register
 header
Message-Id: <166609249165.155136.11484948754047304400.b4-ty@kernel.org>
Date: Tue, 18 Oct 2022 12:28:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: Sunil-kumar.Dommati@amd.com, Basavaraj.Hiregoudar@amd.com,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Alexander.Deucher@amd.com
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

On Mon, 10 Oct 2022 15:09:40 +0530, Vijendar Mukunda wrote:
> Update Pink Sardine platform ACP register header with Soundwire
> Controller specific registers and other ACP registers.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: Update Pink Sardine platform ACP register header
      commit: 9f879fb1a7b6c964dcde96c4cca8eb4444318560

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
