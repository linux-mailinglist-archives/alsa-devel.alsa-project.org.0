Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B155F3EDC03
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Aug 2021 19:06:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42FB216B4;
	Mon, 16 Aug 2021 19:05:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42FB216B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629133603;
	bh=+z3+YzSUEPziONpahSudSFlJvPXb7i6H++q1llwpzAA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NyhqE8JF2T/4d2mv8MS6DFguuyQZ3MJRN9ujYeYPuhJoJqdG5mQyDCRg7Z7Aw2ncX
	 2Q5ebOHYRILxzzswl9RlDlWy/cCPJwFM0AqdYCkk0snBVWvzNiTICGF6iw4v2RCqtG
	 tvjNQlaQTZ99tmuuK+t5Q/ZxnVQB/7NJfSgbBPRs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB749F8028D;
	Mon, 16 Aug 2021 19:05:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4621BF80249; Mon, 16 Aug 2021 19:05:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF5B7F80134
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 19:05:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF5B7F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PHSvv0gy"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8055F60F39;
 Mon, 16 Aug 2021 17:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629133506;
 bh=+z3+YzSUEPziONpahSudSFlJvPXb7i6H++q1llwpzAA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PHSvv0gy4WlvdLM6ttP4dohXm/C38wZ0kmv4SURd9IG6cK8zMfQ5KAmlub/AG0cC9
 RJkAMrV6OxsfKtzwD54DXXuyBlmyXgOTFjLdi3ukwxGKLotq/m56sTVmxrPnQCnKDc
 UHR6N/ry7IzOmE0pqnWuplPwh6b6rCMcmBl1gw1p13n+rvn+YT43YGf+UPxukLtZ55
 7OMrOzMHkaQnIr+HZER+savLsGyf+m5b68prk8TwUWVlyoHU4KZ0TiD8klrRS7POFl
 dCcIwk4py2SeMYJ69rSkXT5F1RG17sHZceHME3kerXZMaQXSaTY0VjoazjweehfQLv
 izI24H4/FDiqw==
From: Mark Brown <broonie@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] ASoC: sh: rz-ssi: Fix dereference of noderef expression
 warning
Date: Mon, 16 Aug 2021 18:04:39 +0100
Message-Id: <162913223313.13582.16813599087905835194.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210816132049.28128-1-biju.das.jz@bp.renesas.com>
References: <20210816132049.28128-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
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

On Mon, 16 Aug 2021 14:20:49 +0100, Biju Das wrote:
> Fix following sparse warning:
> sound/soc/sh/rz-ssi.c:156:15: sparse: warning: dereference of
> noderef expression
> 
> 
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sh: rz-ssi: Fix dereference of noderef expression warning
      commit: d40dfb860ad72a32b9c2aeae739a2725f8ce011a

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
