Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC659419D9D
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 19:54:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A5BD16D2;
	Mon, 27 Sep 2021 19:53:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A5BD16D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632765254;
	bh=uVl5ACrfcIN4ooLozQqnr+TxY/foOGM8sxO3/2FeKmA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V6v+1j6Kyd14OLU5Pa7hlz9Hn0IMeRDT67Ae/vNwKDp4U7zTIP9l8ETpCRZpmCLxX
	 OeGJHu0A7RF3H7FGBBiUymfRshsmgcxvvW+5T/Dex7Am9BUXCGoFyYgvR+el2ziDR+
	 H+0on1Vm7OLNkJll4WKjYFtIBNrcj9ljv9y2sJUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EE2AF80563;
	Mon, 27 Sep 2021 19:48:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 743F5F80544; Mon, 27 Sep 2021 19:47:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEA09F80543
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 19:47:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEA09F80543
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QNQMvYyr"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B27960F4F;
 Mon, 27 Sep 2021 17:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632764869;
 bh=uVl5ACrfcIN4ooLozQqnr+TxY/foOGM8sxO3/2FeKmA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QNQMvYyrlucLrAj/mojcJ6teenH0XIbkgaKGCP5hU+C/SM/xyIahSoUV5YTjZJrby
 fhC5CpftHyxMt63kjp9F90FdWcMgCdlrZQ7bMqqOfATdTTumlnaDqxdAAuPJl6tXEq
 FCQLaljGKLGz70ozWu3avec/jSJqTeY+VXr+MUCkT63wr1bUaTSBNlUQ0S2jHn46Fg
 5KG+hDTfhIKS8ZuBLI/Pgx8mgeA+q+i96ZHJm/ituutWJUQz6Ch9kjDSMEpUp255IP
 ZTOz4gMAY1McPbRH33GNldBwXkW4Mm3ztaoPAU2LpwnMQQfsK4mNecoW8NeiXO81In
 fs8yUL1jH4QTQ==
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] ASoC: dt-bindings: wlf,
 wm8978: Fix I2C address in example
Date: Mon, 27 Sep 2021 18:45:41 +0100
Message-Id: <163276442023.18200.16335825617425254658.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <c99fc865e3fca6ea623661c52de7dc6a3c36c8b4.1632487554.git.geert+renesas@glider.be>
References: <c99fc865e3fca6ea623661c52de7dc6a3c36c8b4.1632487554.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>
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

On Fri, 24 Sep 2021 14:47:32 +0200, Geert Uytterhoeven wrote:
> According to the WM8978 datasheet, the address of the device is fixed as
> 0011010 in 2-wire mode.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: wlf,wm8978: Fix I2C address in example
      commit: 9208d3ca8cb65748e436c224ed63dbba4a60a3d5

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
