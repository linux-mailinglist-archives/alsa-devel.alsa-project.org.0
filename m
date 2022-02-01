Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A564A6238
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Feb 2022 18:19:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A66C1843;
	Tue,  1 Feb 2022 18:18:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A66C1843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643735985;
	bh=QCTlWYmS9EOoe3FSAuKyF+iS/GsMDs+Q+vbUb7YCgig=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s/TS6cY9G+WSZ5Iec6hjWQBGxvC0VExAJYpTek+RNhHSaRtv7nYL0vMM46RTTbYLS
	 BjpWnouzNpTygGrE8K5CbIPeiHxlZB+TMAzqjaAvs2rK3EpqIr01/vloFSPvel4jct
	 gaPYhLYuROoU1vKokUbRUz5mUrWQuAKeSv1vaG3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF29FF80139;
	Tue,  1 Feb 2022 18:18:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49E5AF80130; Tue,  1 Feb 2022 18:18:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF82FF800F8
 for <alsa-devel@alsa-project.org>; Tue,  1 Feb 2022 18:18:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF82FF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Fkf5IMU3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 76ED5B82F21;
 Tue,  1 Feb 2022 17:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96DBEC340F1;
 Tue,  1 Feb 2022 17:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643735911;
 bh=QCTlWYmS9EOoe3FSAuKyF+iS/GsMDs+Q+vbUb7YCgig=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Fkf5IMU3dvwqyIUm7rtcGVWFj/F+gC931f/JlE40yXNSsMPv3+LhaL5vY8eidcHL7
 7/XgoH1Romk6+3DUD0mlIH8CFvhOU4RLbuZDAqD/bqR9hMH3RLdY5OqDvn1jj6EkxJ
 DTY96Kse3fsyqNzM04kQAVKa6xXH7pBIoWuQhnunhWN8Kcz8V9OpxvuUAv/WYo/yEZ
 YoRLIvIMmIOaibIUmu2tPYiXBry9J3NAh9vA5XUzjQ9UIyfAmcZ+7A3y2LwPYuxfMi
 EkJvp+DjdbIKPrxkUCF+IwC9mrPBBO6bPV989n9OPLc4iqBGlvg1Q57oWcFzehXRk4
 bDv8OkhC+yI0w==
From: Mark Brown <broonie@kernel.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Mark Gross <markgross@kernel.org>,
 Stefan Binding <sbinding@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220121172431.6876-1-sbinding@opensource.cirrus.com>
References: <20220121172431.6876-1-sbinding@opensource.cirrus.com>
Subject: Re: (subset) [PATCH v6 0/9] Support Spi in i2c-multi-instantiate
 driver
Message-Id: <164373590827.2398858.14272664575079463567.b4-ty@kernel.org>
Date: Tue, 01 Feb 2022 17:18:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-spi@vger.kernel.org
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

On Fri, 21 Jan 2022 17:24:22 +0000, Stefan Binding wrote:
> Add support for SPI bus in the i2c-multi-instantiate driver as
> upcoming laptops will need to multi instantiate SPI devices from
> a single device node, which has multiple SpiSerialBus entries at
> the ACPI table.
> 
> With the new SPI support, i2c-multi-instantiate becomes
> bus-multi-instantiate and is moved to the ACPI folder.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/9] spi: Make spi_alloc_device and spi_add_device public again
      commit: 941bffd7d7f5d6030a54184c5d81b0eb9116ca9a
[2/9] spi: Create helper API to lookup ACPI info for spi device
      commit: 70dd264bc07aee4f89e65138db11e908701388dd
[3/9] spi: Support selection of the index of the ACPI Spi Resource before alloc
      commit: 92640f98a78c6a3ea1ca32143144241eceb129bd
[4/9] spi: Add API to count spi acpi resources
      commit: 113962301d2d9a5c11381d9c25ddea7af71be2ff

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
