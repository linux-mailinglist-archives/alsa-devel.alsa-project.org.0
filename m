Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1273A4214C0
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 19:05:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82F201669;
	Mon,  4 Oct 2021 19:04:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82F201669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633367101;
	bh=Gx/CYCFVJu84iQ/txzZ7rjGlD1I/Qy9L32fCT0MwsCQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uSRsgxiWAL+dRgRw+HNQIiveIIIDZK/IIfULaQvxD+kCV5LCsCQqFVmkng4mg8QeS
	 XOmdPUOUVoGX80V57tHoS+Vp+xX+MjbkzFwORxINUg9EBt27eJtlrcCxBjqDOnz0y1
	 3JBzGYmew6cduNAZj0WKSSBIJhq/pzDNLR4wN2QY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97D85F804FB;
	Mon,  4 Oct 2021 19:03:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96B24F804FA; Mon,  4 Oct 2021 19:03:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38C28F804E5
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 19:02:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38C28F804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="haCRp0q6"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 847DC6120A;
 Mon,  4 Oct 2021 17:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633366968;
 bh=Gx/CYCFVJu84iQ/txzZ7rjGlD1I/Qy9L32fCT0MwsCQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=haCRp0q6vEu7267/hmBwEWWjTOY2l11CSxN7JJkNu7wTw9cdaY+SFa2Bxx3C8Rgx7
 bPjpCj+mWk6uzY0LsKok54Fzi0cB+K3NVUf5E9v2NduyguTKRJVYwetLNdu6RbNz+W
 ZX+Kb0RFA+9BsuqvAQO7kauy1vv40I2p3qjUxiMRAf2mC8TxeFdy8yf1x938/p2Xwr
 1n4iZCxDG6j1fNUQ98HtGVdAH89FvDBM9iHDBNPgSTWoxgKEgG6s6om59U8OyW3njb
 kHFz9e11D3KGiiS6dzKl+wz5WwcDpm4iDe3e4DxXD4SSVVuist4PjaZ90LDseUZxaO
 gVd4vjfhSzFsw==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: uniphier: Add description of each port
 number
Date: Mon,  4 Oct 2021 18:02:33 +0100
Message-Id: <163336659968.3340210.15989674520560079639.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1633313546-23258-1-git-send-email-hayashi.kunihiko@socionext.com>
References: <1633313546-23258-1-git-send-email-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
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

On Mon, 4 Oct 2021 11:12:26 +0900, Kunihiko Hayashi wrote:
> To eliminate FIXME, add descriptions of what each port number is
> associated with.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: uniphier: Add description of each port number
      commit: 2a04151ff95a3c430150064b0c8beb1981f81187

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
