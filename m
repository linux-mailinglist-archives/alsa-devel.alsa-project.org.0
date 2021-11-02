Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D08B4435A5
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Nov 2021 19:32:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB5C116B1;
	Tue,  2 Nov 2021 19:31:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB5C116B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635877943;
	bh=FTymGjDXyVKPm+OtFC7DosuuE2bwlhhG9DxncyP56eo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M5Mjm6wZuen5fbyarPBIMF2XWSRS7bwe2v9jQ7pDL/xRIJOIPcQriWFT6ftK43kwH
	 F6B2fIgK3OgN7grFHNe6RRYAlQhyPaU8hVPkX4dxkw9mZcMIAHP1ze50fjRdlzJRdV
	 rK/dMMgfRUmd5QWS7OYz8o23a1zUGGCcV1bDjihc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17A38F802E8;
	Tue,  2 Nov 2021 19:30:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48728F8025F; Tue,  2 Nov 2021 19:30:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3525FF80224
 for <alsa-devel@alsa-project.org>; Tue,  2 Nov 2021 19:30:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3525FF80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aWs2vK6M"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D2EA60F45;
 Tue,  2 Nov 2021 18:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635877831;
 bh=FTymGjDXyVKPm+OtFC7DosuuE2bwlhhG9DxncyP56eo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=aWs2vK6MYvxUt7CpOzIwBErT9EYFtBaMVZcm+oq6QK8DM//JVJa/5lBTxbZieVLni
 eANAzrAI1DZ1TRspMrZk+eAfuoWjtIAAXLDvQCUGeXlPR/igKBTEvnDAyiWm3tCRzm
 MwQPQA6OxLsNIduYdHTQhIYfqa0bXihbQM3b9yUscx+6jhLldW9mK7UkY+1KjQ41kG
 Oe+TIVxM4/ObiO0iPZHxmRxvTo6R5uaIU+OW9YUTh6wNIpKxmEIBUuIhgKAIQSm6nV
 Hwt0QwJMmsqyyWWYGSbrr814rHfQ9VMVE55+jdwKsk360BH2KvYP+XQu8f4kEvNlIz
 qWACSOt9mYIvw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20211019074125.3812513-1-u.kleine-koenig@pengutronix.de>
References: <20211019074125.3812513-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] sound: soc: tlv320aic3x: Make aic3x_remove() return void
Message-Id: <163587782996.970357.5314549831349172649.b4-ty@kernel.org>
Date: Tue, 02 Nov 2021 18:30:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Wolfram Sang <wsa@kernel.org>, alsa-devel@alsa-project.org,
 linux-i2c@vger.kernel.org, kernel@pengutronix.de, linux-spi@vger.kernel.org
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

On Tue, 19 Oct 2021 09:41:25 +0200, Uwe Kleine-König wrote:
> Up to now aic3x_remove() returns zero unconditionally. Make it return
> void instead which makes it easier to see in the callers that there is
> no error to handle.
> 
> Also the return value of i2c and spi remove callbacks is ignored anyway.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] sound: soc: tlv320aic3x: Make aic3x_remove() return void
      commit: 2a7985136cac21c8e94e2f1977f052d415d282b0

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
