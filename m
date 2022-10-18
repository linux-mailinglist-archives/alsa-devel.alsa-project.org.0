Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E1A602B7D
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:16:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 148C29D11;
	Tue, 18 Oct 2022 14:15:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 148C29D11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666095396;
	bh=FB5kirTisbqaD2j4n/GmaPm6mX+02J8TFDx+9tOPa/E=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iNHqQSRZX/YmtAdjEL4JI2PGGKRw28U5mHhraWE2fzNKjK7LGBEgytxOhxDyyYYQ6
	 v+y0gNu1XUOyumVCvMPIirQTENVik0hqZafGLRDKnipprfjRJZvHaetnv2l7YogV6O
	 tuJNrI5cto62vP8XD7oDaOEQpPiav51sYjwgaLg4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0592BF805B2;
	Tue, 18 Oct 2022 14:13:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63C75F80564; Tue, 18 Oct 2022 14:13:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAC52F8057E
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:13:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAC52F8057E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FHiNLNJX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 36207B81EB7;
 Tue, 18 Oct 2022 12:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80746C433B5;
 Tue, 18 Oct 2022 12:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666095221;
 bh=FB5kirTisbqaD2j4n/GmaPm6mX+02J8TFDx+9tOPa/E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FHiNLNJXS1Xj2Sj/3cFmdeY/oQsqrnoI4MEp1+lWi6wYQMjlunlyjaCnJWmplnOJA
 gmrEzD9nXDEjPcwgZX6AS/dOuqEK3NNdXXRjZJvGJJ6RInMO04BiOLSrJRcheph8D5
 rVpbZQ8T1o34cGRoHrGu2kiceFaS2wUf9b0s8QM0q1M222Qalp9gA0cp8oeSAFyqQa
 CTSuqhcxUCd0mUf3LgCoqlD9SAhmx82hkVj2NTFNGdQ+Z/iK8ednzKdvPv63gW10sJ
 9yT1k50tR/6gQy1EQwvK0a3ZqPIzMA6HlbhmxnVr9NvqO+Iz3N/+I8DHsxB2VGHFL3
 /SecK3bkaWzVQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ricard Wanderlof <ricardw@axis.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <3225ba4cfe558d9380155e75385954dd21d4e7eb.1665909132.git.geert@linux-m68k.org>
References: <3225ba4cfe558d9380155e75385954dd21d4e7eb.1665909132.git.geert@linux-m68k.org>
Subject: Re: [PATCH] ASoC: codecs: tlv320adc3xxx: Wrap adc3xxx_i2c_remove() in
 __exit_p()
Message-Id: <166609522025.371929.16598407249350844860.b4-ty@kernel.org>
Date: Tue, 18 Oct 2022 13:13:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Sun, 16 Oct 2022 10:33:50 +0200, Geert Uytterhoeven wrote:
> If CONFIG_SND_SOC_TLV320ADC3XXX=y:
> 
>     `.exit.text' referenced in section `.data' of sound/soc/codecs/tlv320adc3xxx.o: defined in discarded section `.exit.text' of sound/soc/codecs/tlv320adc3xxx.o
> 
> Fix this by wrapping the adc3xxx_i2c_remove() pointer in __exit_p().
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: tlv320adc3xxx: Wrap adc3xxx_i2c_remove() in __exit_p()
      commit: 4e8ff35878685291978b93543d6b9e9290be770a

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
