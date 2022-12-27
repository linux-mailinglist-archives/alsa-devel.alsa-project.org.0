Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4125C656A5C
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 13:01:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 121B873B2;
	Tue, 27 Dec 2022 13:00:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 121B873B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672142501;
	bh=P9cGgPldoX0pKJdwimYnFHuijiaMuAVnzGmLIPbyRKQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=esB+YtNSxWCP4i/el6R2+xpsyZuG35l1mWTNagukEDVg5VSTPoC4Us1qMgGhQZnma
	 mw630JvxP/Cwfc9Kxaa/0HbjFL0GA0cLaCK3xa4AW3bRKfcOvHL8uk5V2f2KKBPoGJ
	 cLpt6nE67lE4qRKSv7p4qSRxMeybvm6eLB6o0gdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B642F805B2;
	Tue, 27 Dec 2022 12:57:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB36BF805AD; Tue, 27 Dec 2022 12:57:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A897F805A9
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 12:57:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A897F805A9
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YyQ70LO1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0380F6105C;
 Tue, 27 Dec 2022 11:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2AEC433F0;
 Tue, 27 Dec 2022 11:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672142242;
 bh=P9cGgPldoX0pKJdwimYnFHuijiaMuAVnzGmLIPbyRKQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=YyQ70LO1QSikjgMzZEofO/xeL4is9Z754c2VXq+nY1a7ouq+Upah0Ox7ZPDkwkKaC
 BB9FvDTouHJrNruQc5+FBJVMwfDtNprXTz26BhvQmQr5TEAfE3rJ3SOchY+p44ZtWj
 H9/LAKS+b5WbheMzfQptKUh7MaDJ8StxjPo60/PlkAFHhnr0VlL3S76+J7GKU19aj0
 3XCj/HvpL2wxxRQgt/UdIrjV0LIZNHQ0bvuVRDo8nTmBS74ZBlWTP3BhBITSOOAfz8
 VUUddrT2NoY5GNGfTziox40tN1ZXB07WgQGH9hBnN+zOo7x/yn63b4YHE5R1ZXg1bN
 y2mVLNuAXAr1A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lukasz Majewski <lukma@denx.de>
In-Reply-To: <20221216094624.3849278-1-lukma@denx.de>
References: <20221216094624.3849278-1-lukma@denx.de>
Subject: Re: [PATCH v3 1/3] ASoC: wm8940: Remove warning when no plat data
 present
Message-Id: <167214224036.82924.7087854643611679926.b4-ty@kernel.org>
Date: Tue, 27 Dec 2022 11:57:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-7ab1d
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Stephen Kitt <steve@sk2.org>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 16 Dec 2022 10:46:22 +0100, Lukasz Majewski wrote:
> The lack of platform data in the contemporary Linux
> shall not be the reason to display warnings to the
> kernel logs.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: wm8940: Remove warning when no plat data present
      commit: 5dc5e76b4c41fc8cdd9ed77653b2ce453974fb30
[2/3] ASoC: wm8940: Rewrite code to set proper clocks
      commit: 294833fc9eb4e9d6c69f8d158cd991d641e59908
[3/3] ASoC: wm8940: Read chip ID when wm8940 codec probing
      commit: a5c26ee572d94337baf9c944b7b4881a2db62d37

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
