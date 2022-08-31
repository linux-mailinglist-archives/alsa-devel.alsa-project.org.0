Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 778F75A7E0F
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Aug 2022 14:54:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDE1E16DC;
	Wed, 31 Aug 2022 14:53:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDE1E16DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661950481;
	bh=nL6/hWbD7AHWVj/hITRA5on1b+uHLf3GP4zUn748llo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u0jUH7nM2SupYSvJhG4koiU71sVXjZdJPbA39SnSQ6lUBRS2zMeOxK9/AExmmqYRC
	 7MvayigBLyxlBM5Z/fFRQioN4ECihR7pTEh+ELp/06AOhHM4Fq/z6xPVDsV+yOv6cL
	 wfNAa2m29TguxISp5z4vcXoNj3dnEYgHNVTiFeDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E15B5F80529;
	Wed, 31 Aug 2022 14:53:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EE90F80448; Wed, 31 Aug 2022 14:53:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6486F8047D
 for <alsa-devel@alsa-project.org>; Wed, 31 Aug 2022 14:52:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6486F8047D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TyWKscgP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E8DC61A2A;
 Wed, 31 Aug 2022 12:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89EC1C433C1;
 Wed, 31 Aug 2022 12:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661950376;
 bh=nL6/hWbD7AHWVj/hITRA5on1b+uHLf3GP4zUn748llo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TyWKscgPnlY56InNkb1dcyKrofZMhA/o2Iwhk8r1TvRv7rMHQy2wk3P3zvrhusZ3v
 NEuo2kr2seJMfH/3Y174pekbtiiOZubWa2NnvT1MpF7CXNGcUifc/YqcGg5KxbklgY
 qwiiHFV5kMm+2KnTGZOWDyNtnzW5nGRKNKWHpJ3tFIJtt370CnNO/yKMOiPrpAl0ai
 h+P2zp0/7Qchx200Y6Tm4HryotaAU2pD3SjUXItQ9PCDN4tsh/wa2Wo1XdQ/WCpiGA
 jFh3eiBh1ikaf1noura72HBdkGFNgSXx4Fjw9uZc+wq5tRSX10UyY0xU55Lq9WsAdV
 kRVg/gQFWxyEA==
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <daniel@zonque.org>, ryan.lee.analog@gmail.com
In-Reply-To: <20220826085927.2336224-1-daniel@zonque.org>
References: <20220826085927.2336224-1-daniel@zonque.org>
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: max98396: Document data monitor
 properties
Message-Id: <166195037526.99184.15812768406102730466.b4-ty@kernel.org>
Date: Wed, 31 Aug 2022 13:52:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org
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

On Fri, 26 Aug 2022 10:59:26 +0200, Daniel Mack wrote:
> This device features a data monitor that puts the device in software reset
> upon a configurable set of events.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: max98396: Document data monitor properties
      commit: ec2988da1a4671f31b898351daeee2e65ca508f7
[2/2] ASoC: max98396: Make data monitor features configurable
      commit: 33b7504ae08a20ad22f3bd867623c72bddefdd12

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
