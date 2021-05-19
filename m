Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A01A338935D
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 18:13:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 260061691;
	Wed, 19 May 2021 18:12:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 260061691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621440788;
	bh=5Z2EkaMzIYpeGUT62HgHaddi7bvGhthOk/v+yW7+/10=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yz9wekAG4ZtzeC6tlpvW8va6ud4h/ZsMQAYPEX4Ven0vBZFg5ARipbRfWLBJLQ3CT
	 jK5NEF/w2oxJ2bjYkwAyjrOmiDvG9KP0o6RDqEYLVMj17MDtTKRVn9vLOIGTZ/WsFg
	 WjlQrtGTbxj3ai4PocQmZv6QJDbp9V4e1aNJOI2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEF96F80259;
	Wed, 19 May 2021 18:11:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BE6EF8025D; Wed, 19 May 2021 18:11:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36A19F80127
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 18:11:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36A19F80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YRfTV5p+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 00E0B6135A;
 Wed, 19 May 2021 16:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621440676;
 bh=5Z2EkaMzIYpeGUT62HgHaddi7bvGhthOk/v+yW7+/10=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YRfTV5p+1y7+MAObTjKCrRdDlIj8YnB+EyixBLNMaj16Ts9vXv0oxE8p1RIiZeRbR
 EZ3lHTfTgKeLGv0XVPprXAX3MY0MJrZoChe3TY9xBc5kumfP5bzZOXA/RbGh8eCyxk
 fiUwyer3vv2zCGWoxw4eimVy/VSfkOeXjgCLHWUI3HM1SNrfjALdEk3ZuhdneOlErD
 5y2lsorCZKYbNpwMQB8YVqWSBIKbCb1LKltrLS28ioAF2IW3ZN2Uz+/vWyqG21R7T0
 92rICEXxlJQEbsJSH5juE9Eco+dBfLAnIHX1jjsXAUq9OLFPIMrSh8BRu2fd8iZg3X
 TCZuhMIbY6dbw==
From: Mark Brown <broonie@kernel.org>
To: jbrunet@baylibre.com,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: g12a-toacodec: add support for SM1 TOACODEC
Date: Wed, 19 May 2021 17:10:15 +0100
Message-Id: <162144027316.37060.16685114129646097481.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210429170147.3615883-1-narmstrong@baylibre.com>
References: <20210429170147.3615883-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On Thu, 29 Apr 2021 19:01:47 +0200, Neil Armstrong wrote:
> This adds support for the TOACODEC found in Amlogic SM1 SoCs.
> 
> The bits are shifted for more selection of clock sources, so this only
> maps the same support for G12A to the SM1 bits.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: g12a-toacodec: add support for SM1 TOACODEC
      commit: 7487238c5f530b418745ce134d1b0a7fba3a0d8d

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
