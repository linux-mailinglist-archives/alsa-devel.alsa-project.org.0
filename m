Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBAE60E6FF
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 20:09:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48FFD3A89;
	Wed, 26 Oct 2022 20:08:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48FFD3A89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666807765;
	bh=bSo26Llx1fbl5wLv1UFcjm3Lvzzw5v5SWbVf/ZjrYPY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h5YHVHFA7WmHWan8QZ2Bfg0EQ8j8yBQSmR+aSuS4+a3rNqsDtpkoGEVg/QjQmJsRB
	 73T0EKS22kK2v2T61uQjzcCECpDoHzbxnK/BS5AwG80rVMBAOZmWjKPny9tSw/lrDJ
	 axgobI01gmP0EUf8wDIfuNBSnELzS6fALic+jg/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9237F80559;
	Wed, 26 Oct 2022 20:07:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBBC6F80552; Wed, 26 Oct 2022 20:07:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 317C7F800BB
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 20:07:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 317C7F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VzHAi8rH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 612E0B82404;
 Wed, 26 Oct 2022 18:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3405BC433D6;
 Wed, 26 Oct 2022 18:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666807653;
 bh=bSo26Llx1fbl5wLv1UFcjm3Lvzzw5v5SWbVf/ZjrYPY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=VzHAi8rHieHqARk4Hqy9TRV7By1GPHUHLKwn+aidb71ANfYEG7rTOChBrBmtr4mZn
 sFrxMj4HFwz38wyFJ1u/4kBzOHVFAqtY//mdjb8c5ggsY9iU8XM49wQt2I/7cTSH6x
 qU8JUdFRugw3SYFHRTL3oULQRkYgSUR4fb/A9id3x+b6SXFLtCDkIxRRdFIZyhUq03
 I8/u5DgXooF/xAaAEKGoI7FOkxVgjc4sI/hwpnKglpCkEQxKR96WJUAiLil5lEXaFh
 7IzsDCh+HGeGO9jiH9ROMmPGwNrurRgaW/jhStw6+8Tzk04Rhhe1ew4pSrdRF+BD+A
 eWR/f1ePGiRQA==
From: Mark Brown <broonie@kernel.org>
To: Brent Mendelsohn <mendiebm@gmail.com>, alsa-devel@alsa-project.org
In-Reply-To: <20221024174227.4160-1-mendiebm@gmail.com>
References: <20221024174227.4160-1-mendiebm@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add Alienware m17 R5 AMD into DMI table
Message-Id: <166680765193.867857.14376010081173805529.b4-ty@kernel.org>
Date: Wed, 26 Oct 2022 19:07:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: mario.limonciello@amd.com, Syed.SabaKareem@amd.com
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

On Mon, 24 Oct 2022 18:42:27 +0100, Brent Mendelsohn wrote:
> This model requires an additional detection quirk to enable the
> internal microphone - BIOS doesn't seem to support AcpDmicConnected
> (nothing in acpidump output).
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add Alienware m17 R5 AMD into DMI table
      commit: d40b6529c6269cd5afddb1116a383cab9f126694

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
