Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D6F593339
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 18:27:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 731601637;
	Mon, 15 Aug 2022 18:26:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 731601637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660580842;
	bh=NLj3drDFoylAnrTJ8Zq1ndKBRRVsZxwEPD9CppwVHsw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QPRcQjEXjOssoVHF4Z24XC3pDf8o/uq6e06o7Qeheyk36sWKEY5FCm/NhJafGGVVZ
	 JrIQpjjtAFM2vNMHd7VlPBbBD3DP9Zpxmv8w21c56mRU/5AYswngoPgjtfzUw8SL7E
	 kSnHpEgFI0lwzw3Gf9uZWiLQ8CGLkem3kndSb8Vw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63FDCF805BE;
	Mon, 15 Aug 2022 18:23:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21E7BF805B3; Mon, 15 Aug 2022 18:23:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 099ABF8057D
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 18:23:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 099ABF8057D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lXFJrYBy"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B6E81611E7;
 Mon, 15 Aug 2022 16:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E2FC433D6;
 Mon, 15 Aug 2022 16:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660580600;
 bh=NLj3drDFoylAnrTJ8Zq1ndKBRRVsZxwEPD9CppwVHsw=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=lXFJrYByHqVdC+nL6RtYcuxRXRgD5whlJSlSuiuwLWxvVD/EDiFvby1piCh5bT05S
 Vvz3P5G/g4F2wqxKmmrN9sNm9BZeia5xNU1bfyx+BxNCrmEGhSojFGQMqAcnx3Thui
 qpzkFHK5VqkEx1PGf3pwt8Qcb3CLIYQhfZh02108e5bc48Mk1WZ+9El/l4ozKkzAnt
 fXUvQFauCbCVP9p8LsWlbCfdVlRMdS6kwGO+0MLSfcUx9YSXlgQvm7lgIezEx58ucr
 7JiW7APYXT5nAb+5+CZ+KnYxsLeaPlZm7jvU8KxP8PfH7gMLCjbS7vPT2WpvKkExRv
 tDcwglakJlkXw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Matt Flax <flatmax@flatmax.com>
In-Reply-To: <20220810013213.1544645-1-flatmax@flatmax.com>
References: <20220810013213.1544645-1-flatmax@flatmax.com>
Subject: Re: [PATCH v3] ASoC: codecs: add support for the TI SRC4392 codec
Message-Id: <166058059934.769843.13135269788667346106.b4-ty@kernel.org>
Date: Mon, 15 Aug 2022 17:23:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
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

On Wed, 10 Aug 2022 11:32:13 +1000, Matt Flax wrote:
> The src4xxx keyword is used for	future capability to integrate
> other codecs similar to the src4392 to the same	code base.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: add support for the TI SRC4392 codec
      commit: 4e6bedd3c396014ba70de2b4c9995c8e024e82b3

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
