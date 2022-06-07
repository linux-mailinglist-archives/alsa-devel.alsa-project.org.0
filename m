Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 838A153FC13
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:49:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FE8D1A48;
	Tue,  7 Jun 2022 12:48:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FE8D1A48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654598976;
	bh=jrw0fzEva8sabg3UFL74weovmEdX09d/VJrE+o2sNvk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IM/rA3sHYfUNUaJHjdoKOmvrqW/x0tcUJnSxyYLETFD65NjhNvVu/UZbJ/qi/8oNX
	 N/dGqmXAk/gYUVauUBEzoT5/ew53bm/Y5vUV5kHGVbLcWCauqaGto83859rt+rbcJ+
	 0mkwGWtM3MVnFvtwjqYD9DrnvEBbRilpsbPNUa4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 126D9F80579;
	Tue,  7 Jun 2022 12:45:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A4A4F80571; Tue,  7 Jun 2022 12:45:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1DF9F8055B
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:45:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1DF9F8055B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m8QAkHya"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1E6CEB81F05;
 Tue,  7 Jun 2022 10:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA43C34115;
 Tue,  7 Jun 2022 10:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598744;
 bh=jrw0fzEva8sabg3UFL74weovmEdX09d/VJrE+o2sNvk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=m8QAkHyabT+LcT4zDqRNkmKCNs57zhjBU7YI+82RzcK7sJlZzueBPzxrf20dhZJS/
 jivnOUEE3nemXHREfQtWGbf/r7KcM7Qqvt5h+Ct8YOSh/A0nKIglpHKoyzYoWSg82D
 SP9VFimzizDz/+FtKiSm0UkU5UH+tK1BLsZNiidSDjl2sv0NVb9gcxUXH8sMNzn2N2
 Pya1aF0liXVJNFS69V4s66JdXH4on3Bg30TVgVNceMwIQcvPeD9LJXs6RADknuC3MO
 SVZPY8Xf5AygXoW4s+cfkkzSCzaErqz3ALogB5vNU7wTPTxnt1tfG4zUY9e9CEwKor
 XV1YIODq2TJag==
From: Mark Brown <broonie@kernel.org>
To: kchsu0@nuvoton.com, ctlin0.linux@gmail.com, wtli@nuvoton.com,
 broonie@kernel.org, hui.wang@canonical.com, ctlin0@nuvoton.com
In-Reply-To: <20220603103530.3844527-1-broonie@kernel.org>
References: <20220603103530.3844527-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: nau8822: Don't reconfigure PLL to the same values
Message-Id: <165459874309.301808.4525934599551055149.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:45:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Fri, 3 Jun 2022 12:35:30 +0200, Mark Brown wrote:
> When we configure the PLL record the input and output frequency, then if we
> get asked to configure the same values again just skip reprogramming the
> hardware. This makes things a bit easier to use for machine drivers since
> it means they don't need to keep track of if they've programmed the PLL
> so much.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: nau8822: Don't reconfigure PLL to the same values
      commit: 3ae190edc5f6f64f296f8dd15f4b511f529ab402

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
