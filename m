Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 597835EC372
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 15:00:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B72A7827;
	Tue, 27 Sep 2022 15:00:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B72A7827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664283654;
	bh=BSMIKJNSh2UY7QcBDbGnHiB8Z9/zuSk77eFA25iPrYA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SQJZTMNMzNUh9dhOGRlKUHsXULygBDJUZFABYkklySGz3Fvx+ANdBok9zrxg5Zqv0
	 mBDk2Kx9rSw+BJ+H1knDLFUz3LoTUHRU7TssEOxLiax1vLWI+zIUbzeN8XUTw9MYvq
	 U6T96GhgiBwWntkBd02cYfm/FDd5BEJzGOtVv63s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F802F80496;
	Tue, 27 Sep 2022 14:59:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3C53F8025E; Tue, 27 Sep 2022 14:59:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5916F8011C
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 14:59:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5916F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TP3jMC8T"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AA367B81BBD;
 Tue, 27 Sep 2022 12:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 329B8C433D7;
 Tue, 27 Sep 2022 12:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664283591;
 bh=BSMIKJNSh2UY7QcBDbGnHiB8Z9/zuSk77eFA25iPrYA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TP3jMC8TxSwQTANEvrCHalkWW8MMNfHVWAlA4oD7xkq4YoPkoLV+71w/28Rtx8Dpx
 Fss7T8HWH0rUxOgCPdhme2NqzMsW88PaXYQJnTsp5oXu+iivTLrgI9AO7bJeL6G9Te
 18zkBdNzghB9nFdj/g+UD7+YJN1Cc//ZtB1i/qSb+8U5tvAl3m6Q3JHBEozEuVCKeM
 NSbikZJVgMPyFLmKFuIJRFQwDbebT3QTTdZBtr28Rj/WSFIgqFp0CHhQ9L68UZ+3zD
 zdUHEJmYmwJ7WZcwsjfJYXbYlnXj6kHspv7/3lbJ783c2sy/uB+qft+Ilku/ynhdV4
 +kSUhioD9fzNw==
From: Mark Brown <broonie@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <YzIcZ11k8RiQtS2T@work>
References: <YzIcZ11k8RiQtS2T@work>
Subject: Re: [PATCH][next] ASoC: SOF: control.h: Replace zero-length array
 with DECLARE_FLEX_ARRAY() helper
Message-Id: <166428358991.365276.17332366204767237765.b4-ty@kernel.org>
Date: Tue, 27 Sep 2022 13:59:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
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

On Mon, 26 Sep 2022 16:40:55 -0500, Gustavo A. R. Silva wrote:
> Zero-length arrays are deprecated and we are moving towards adopting
> C99 flexible-array members, instead. So, replace zero-length arrays
> declarations in anonymous union with the new DECLARE_FLEX_ARRAY()
> helper macro.
> 
> This helper allows for flexible-array members in unions.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: control.h: Replace zero-length array with DECLARE_FLEX_ARRAY() helper
      commit: b264ef796959cb65cdbc811da5ab950e33df4162

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
