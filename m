Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0CD67F9D3
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Jan 2023 18:20:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96EDFE99;
	Sat, 28 Jan 2023 18:19:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96EDFE99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674926445;
	bh=CYsbxqBiwNN6kV+T+y7Z3+5fCWxPTpOVKOI2BKhO11Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DZVmu7ymCaIe2stV7HdqRmq8T2MRN0ckwXnO951DVK3T09PFPQdsxdVwVfLQTBslN
	 BO4znZGyiBYo0DXdn2xYRtpfsqmf5AttqdGcHKGHBAd+/51UeDJNEG70nB8ScLLaaD
	 fQoNmwJnUlKxpwn0eqWg0yOQYRVUrPZG9pxOuEFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57894F80543;
	Sat, 28 Jan 2023 18:19:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28CD0F8053A; Sat, 28 Jan 2023 18:19:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07043F8007C
 for <alsa-devel@alsa-project.org>; Sat, 28 Jan 2023 18:18:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07043F8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FXV1A4SX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 393B260B4D;
 Sat, 28 Jan 2023 17:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB57AC433D2;
 Sat, 28 Jan 2023 17:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674926337;
 bh=CYsbxqBiwNN6kV+T+y7Z3+5fCWxPTpOVKOI2BKhO11Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FXV1A4SX7LVrcTUtDefUEUD6yFkkGFm1wzQqafXkUI3iCy6ZiwP9olWe0cHhp9J32
 1sY0dBCyejuvU/uhr2Fp1EPhi0rTQ5eL6htsa3EtJiUIx8FA46FP/3BXppJslIPE15
 XqvRFQXWUE0O4XhtgGzxcjFt4oMb5MFgNx2w1FEVJVzaC3eE/JHAgb6iYqHAGYojke
 /jMtZ62eyQD4NIGZnZGg0LcUt54h1cpDF78G4bZx9yvPO5oU4J5ptew3Vk4yWwEi15
 PsOwNihqUMjnasRVvw+7J/HzxQAjUTrtNplV5M81OGxoQCzJ9SO4nfgAXK6HtYhWVt
 AgrHtx98OHA2Q==
From: Mark Brown <broonie@kernel.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>
In-Reply-To: <20230126020156.3252-3-kiseok.jo@irondevice.com>
References: <20230126020156.3252-3-kiseok.jo@irondevice.com>
Subject: Re: [PATCH v4 1/2] The Iron Device SMA1303 is a boosted Class-D
 audio amplifier.
Message-Id: <167492633558.2479102.3539691390712703265.b4-ty@kernel.org>
Date: Sat, 28 Jan 2023 17:18:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
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
Cc: alsa-devel@alsa-project.org, application@irondevice.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 26 Jan 2023 02:01:55 +0000, Kiseok Jo wrote:
> 


Applied to

   broonie/sound.git for-next

Thanks!

[1/2] The Iron Device SMA1303 is a boosted Class-D audio amplifier.
      commit: 68cd394efd0fdce25d0def8d6cb1b8898b2c13d9
[2/2] Modified the schema binding and added the vendor prefixes.
      commit: dcf6d2ef0e823346a3c1eae3f96e733e92ca656c

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

