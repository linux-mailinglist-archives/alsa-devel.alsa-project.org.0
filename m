Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA584D08A2
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 21:42:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B35C17E5;
	Mon,  7 Mar 2022 21:41:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B35C17E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646685749;
	bh=BXpes14VYfngOaWXmh7Ky4YKpFjhJAvPaUR5cUr5tYg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u1+jamOIDtHiL1MFMwtGbYOlRQOSlgfWmWHl51EFuDCMFXs0Hqtjsf2Q5B0GUhIez
	 kFJE1oXI0JGp6g7DjMh9loP0jM7jTg59KV0VUErKuKd8x26yroJAYpxBFh3N9ZK2mf
	 /xhksU+MOabeixJ4WGNz615lWY5w2f/GI/4xXnW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22578F8053B;
	Mon,  7 Mar 2022 21:39:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D471DF80538; Mon,  7 Mar 2022 21:39:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 667FAF80529
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 21:39:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 667FAF80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IPULQSXu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2405361518;
 Mon,  7 Mar 2022 20:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFAC3C340EF;
 Mon,  7 Mar 2022 20:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646685555;
 bh=BXpes14VYfngOaWXmh7Ky4YKpFjhJAvPaUR5cUr5tYg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=IPULQSXuBuFE6e3zunx7f6HoQOCc3DaFIrTLbdGtWfU7ttGGA3SvpwTcORZFarNlH
 OX+H9zF5ubtbQ2RosycbHh2NNndoxR82Vn9el7/R3uB1G6xuMFi/OKKnbB/uPwbHDE
 /D79MzooOWXU/YitHfScbEP9RIPTGt/BwWdMQ+HwWSO4nuqpkHllzmXOSADCPVwx+H
 9hCjj+RUDNE5RZtlHx4uK9SMTGKEcu8Ao4FIzHewPXb3/OEQw67AleGGP9MWNDTDDL
 bpdVlHOkf7Lm+XTG9G31MRZl+0kzWd4ufY1BC289hiOlvIfll4KZ+fY7s7NqAerfqU
 nkONoD+BQ7/fQ==
From: Mark Brown <broonie@kernel.org>
To: ckeepax@opensource.cirrus.com, Jiasheng Jiang <jiasheng@iscas.ac.cn>
In-Reply-To: <20220304023821.391936-1-jiasheng@iscas.ac.cn>
References: <20220304023821.391936-1-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH v2] ASoC: wm8350: Handle error for wm8350_register_irq
Message-Id: <164668555349.3137316.17429422601485375594.b4-ty@kernel.org>
Date: Mon, 07 Mar 2022 20:39:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 patches@opensource.cirrus.com, tiwai@suse.com, linux-kernel@vger.kernel.org
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

On Fri, 4 Mar 2022 10:38:21 +0800, Jiasheng Jiang wrote:
> As the potential failure of the wm8350_register_irq(),
> it should be better to check it and return error if fails.
> Also, use 'free_' in order to avoid the same code.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8350: Handle error for wm8350_register_irq
      commit: db0350da8084ad549bca16cc0486c11cc70a1f9b

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
