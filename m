Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D7D53FC6E
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:54:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1707D1A4C;
	Tue,  7 Jun 2022 12:53:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1707D1A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599248;
	bh=9+pUEn/bG4fcSHXKfmjMEcgyn72cKoDXq1ZmWQ/qRH8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B0Z7mN1eqwTYSxi4MfTUyhmRVPHZTZVD6frWSmERHeL7TekqfGdr8j+3dxu2D/BkN
	 RFmF0jo6cjPOQ/3gbuykuV40cV13LqaXLWDpTYcovvoJDLiv2ZgSaW5drvd1xN7++b
	 hShp7unGR7U4aUzTwWLopDLCKkj8MgQ+YMka4sHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07BECF805FF;
	Tue,  7 Jun 2022 12:46:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AB74F805FE; Tue,  7 Jun 2022 12:46:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8252F805FF
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:46:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8252F805FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kex5OYML"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 89015B81EF1;
 Tue,  7 Jun 2022 10:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4F9C385A5;
 Tue,  7 Jun 2022 10:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598783;
 bh=9+pUEn/bG4fcSHXKfmjMEcgyn72cKoDXq1ZmWQ/qRH8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kex5OYMLDyO2+xhikta2ZmdqKF7VR7MASVYbYxiEvAYLOZlqAI+moQ+gH8k9rRbvx
 Ww9rDiQYQaZDjkruroSeg/paozDYytCbLOirvesWH75amyelz0s5aFJkwKowQUkwOZ
 eGRivwx9tttRSZR8/yIYXcryZOrq6lfqySn9kZLdXX3Y/J3QGAJgKAInECVSgVjuxS
 19mN2BzJtAjLbB127+lhVoJgdZ1MlVIl9Sd03olb5NoImS5O1Pvce/zADKIes0KYFV
 Jj2JHbFoXInLzS5sVVogUl2TyO1pCUOx+ML6dMjF8nYeWBKforx488UCE7zNA6Io7l
 fojxb6C/ICyag==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 tglx@linutronix.de, christophe.jaillet@wanadoo.fr,
 Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <28c0833d4a11f8f75f385e5aad93c23721b06c7e.1653724847.git.christophe.jaillet@wanadoo.fr>
References: <28c0833d4a11f8f75f385e5aad93c23721b06c7e.1653724847.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: ab8500: Remove some leftover from the "Replace
 GPLv2 boilerplate/reference with SPDX" rules
Message-Id: <165459878149.301808.7387374939170024578.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:46:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
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

On Sat, 28 May 2022 10:00:53 +0200, Christophe JAILLET wrote:
> The "Replace GPLv2 boilerplate/reference with SPDX" has left some empty
> "License terms" paragraphs.
> Remove them as well.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ab8500: Remove some leftover from the "Replace GPLv2 boilerplate/reference with SPDX" rules
      commit: b521e85eefa384a5c31984b1a7e0d71b762c9663

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
