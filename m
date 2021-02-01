Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E440830ACF7
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 17:49:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 568D01776;
	Mon,  1 Feb 2021 17:48:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 568D01776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612198153;
	bh=j9hC3Db3nfPN7oz+V2moYoDKkQqj5CZszG4PUDCe7yo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hnBL9v+OmWI9xPx6/mkGrFWwunE1KL/4XxVx9TXTnfChkQtH5Fk4S+rYcgImEBJpr
	 ar8LhM3s2zAdmrjEOrweE7XMAX/qckF0fBgYIxQJzZOoiZAgY0TYI2M8lIe6snjCUy
	 alkkR7pypqasdpstLJNFZjOLotEjVEV7yBJUback=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51ED7F80246;
	Mon,  1 Feb 2021 17:46:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7C40F8023C; Mon,  1 Feb 2021 17:46:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A33FBF80224
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 17:46:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A33FBF80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DRWI2OfY"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3133A60234;
 Mon,  1 Feb 2021 16:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612198001;
 bh=j9hC3Db3nfPN7oz+V2moYoDKkQqj5CZszG4PUDCe7yo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=DRWI2OfYdkae8cwpgnSYLd4REIg5apAq3rLMTUqyT5BV7E4KDr+nKps2rqnwZalcU
 Fe6fV3C8MJzMb0UIM59KCUMvi5O903LBTPVPW1CcWd4Z2Zqf32xmivtIrnLJecSDkY
 qGCdPSFuAX3eOa2MHIEQnst4s1s7xoTXQFAdq3zdxx5EnDTNdhsnwq8+uVLaEAi8pl
 Rkt7ISSUEfQ2oUQGfAnKaBgqjUmDAUeuGyqHOOi24LX1uDXO+fv2WuRrKODAEbPYXs
 jcH/tDBDtoRLsPWr9OzpztKU9ZngXLqul2+u2Zm6zaPANYqVwzBNUUOY9PZaI1oZsj
 keiykiLA9ELsQ==
From: Mark Brown <broonie@kernel.org>
To: Tony Lindgren <tony@atomide.com>, Pavel Machek <pavel@ucw.cz>,
 Sebastian Reichel <sre@kernel.org>, Merlijn Wajer <merlijn@wizzup.org>,
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20210123172945.3958622-1-sre@kernel.org>
References: <YAqOSg2z24NpjKDh@mwanda> <20210123172945.3958622-1-sre@kernel.org>
Subject: Re: [PATCHv1] ASoC: cpcap: fix microphone timeslot mask
Message-Id: <161219793995.46194.11902730498139607577.b4-ty@kernel.org>
Date: Mon, 01 Feb 2021 16:45:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>
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

On Sat, 23 Jan 2021 18:29:45 +0100, Sebastian Reichel wrote:
> The correct mask is 0x1f8 (Bit 3-8), but due to missing BIT() 0xf (Bit
> 0-3) was set instead. This means setting of CPCAP_BIT_MIC1_RX_TIMESLOT0
> (Bit 3) still worked (part of both masks). On the other hand the code
> does not properly clear the other MIC timeslot bits. I think this
> is not a problem, since they are probably initialized to 0 and not
> touched by the driver anywhere else. But the mask also contains some
> wrong bits, that will be cleared. Bit 0 (CPCAP_BIT_SMB_CDC) should be
> safe, since the driver enforces it to be 0 anyways.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cpcap: fix microphone timeslot mask
      commit: de5bfae2fd962a9da99f56382305ec7966a604b9

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
