Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C77803DA93F
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 18:41:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B79817A8;
	Thu, 29 Jul 2021 18:40:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B79817A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627576898;
	bh=066N9zoYxC70xPKHHC7PsWtEF/DGHX1hf91lY6M/Xmc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iC4V+BVk7yVZ56JpmNEoKOVfodZtsAbPlZYo1fDcFwJ1Yn+xTFbga+gptMsEuPEYy
	 4Qiq442y0+luuFIj5FKVZjNuByPOc0QycIRcPkAcrjNdau5gYmxkYrs0O8UFRxIkP2
	 zwT0Mk2ER5E0761ozVZcowXVfM64ET0WZ7mhZzn4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F439F80258;
	Thu, 29 Jul 2021 18:40:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D63FF800EB; Thu, 29 Jul 2021 18:40:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46700F800E9
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 18:40:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46700F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="o4pUFYpw"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3D2060F43;
 Thu, 29 Jul 2021 16:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627576800;
 bh=066N9zoYxC70xPKHHC7PsWtEF/DGHX1hf91lY6M/Xmc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o4pUFYpwxAs+5qG0HE67O7LqFccjeU1VEpQPOxzYrABXt53ai2QP/cIkBpbSVtMy/
 0NWXPYDe3iQQm7Bl7giUpOJKRFCNQI9uoMaPA59+ADqxz6Voij4LipxwhDmjzWWjMt
 qC1l9b2ZUGjWgwj7QD3Zg0zJPboENP0G5OBDl10szs8rgt/i+zam3As4PjBxsrBpvI
 J8C7zKzGUn8kD9ZTevXOVxP9M5i41PNbkJVB9aV9CqnUn1I4c4jclF+vYcEjVYvVne
 nNm3vrGk0ObcYOLi1wNYWAsz0xhK+fntlRGbN7uXK/StPUPOqzwanuX1Kitg37qSFy
 cyMbst5ShhUeA==
From: Mark Brown <broonie@kernel.org>
To: gregkh@linuxfoundation.org,
	Jiri Slaby <jslaby@suse.cz>
Subject: Re: [PATCH 1/2] cx20442: tty_ldisc_ops::write_wakeup is optional
Date: Thu, 29 Jul 2021 17:39:45 +0100
Message-Id: <162757633788.53168.6787766542680028320.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210722115141.516-1-jslaby@suse.cz>
References: <20210722115141.516-1-jslaby@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-serial@vger.kernel.org
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

On Thu, 22 Jul 2021 13:51:40 +0200, Jiri Slaby wrote:
> TTY layer does nothing if tty_ldisc_ops::write_wakeup is NULL, so there
> is no need to implement an empty one in cx20442. Drop it.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] cx20442: tty_ldisc_ops::write_wakeup is optional
      commit: d7a3a6801913a4b57a7e525c4906d348213acfb0
[2/2] v253_init: eliminate pointer to string
      commit: dfe1114638d1888916fd9ceb50314e19f632dfad

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
