Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAC261518D
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Nov 2022 19:29:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50F0A1696;
	Tue,  1 Nov 2022 19:28:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50F0A1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667327349;
	bh=3psEzr0e9wYtwIUmu4oDyKrc2AlqzddERfnC8G8Tess=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ruMP1K2uAlVJXl8E6cGPudwD+eb/m02dQD8CYvgg0zakDcY/NyEJZ6sv4kmRehsrX
	 D26p4q1wjSHh1AKgg4Du2P8Ck6rL1dOriAgXujg/dRUFJkK9vut+GLyCIVutLNLF24
	 6X+32feImVuJxPbN7sMqEgsbe/7xD7TnalnK8vOo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD41AF804AB;
	Tue,  1 Nov 2022 19:28:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48278F804AB; Tue,  1 Nov 2022 19:28:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8646FF800F3
 for <alsa-devel@alsa-project.org>; Tue,  1 Nov 2022 19:28:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8646FF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gj/gZkva"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CB0DCB81ED4;
 Tue,  1 Nov 2022 18:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99E90C433D6;
 Tue,  1 Nov 2022 18:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667327282;
 bh=3psEzr0e9wYtwIUmu4oDyKrc2AlqzddERfnC8G8Tess=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gj/gZkvaj1d+NacnykWMbYwxkk+8GoB2vcod3yo4K686kqfgfhuYBlO++jzkZzgYf
 GlOqdTjCnduzDSBqwPq0xyFb3bH6hhuCc6kNG42w9v1fNxZoCnOPpi5j6jSxecURAB
 C5ABcBFUgjRdh8hIb11KvaRvpS4Qpkfggi96j57RFVQDv4xT94eJmyRwDKwnp0thei
 8huPyFqvMkuomXlz+CgPozMShbdTltOcx0XZfCZxZDTQBuhCixNU/w2iWbpTiZ7YvT
 lqni1Q7z5wzMQ5p/smEfddY5DsQZK0GNiEifymVbk/pp6YdBJz5wcQxl67Wz1bJUl1
 Ytfr+1t/HdpDg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221031195639.250062-1-pierre-louis.bossart@linux.intel.com>
References: <20221031195639.250062-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: hda: intel-dsp-config: add ES83x6 quirk for IceLake
Message-Id: <166732728134.298210.15008002909565814769.b4-ty@kernel.org>
Date: Tue, 01 Nov 2022 18:28:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
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

On Mon, 31 Oct 2022 15:56:39 -0400, Pierre-Louis Bossart wrote:
> Yet another hardware variant we need to handle.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hda: intel-dsp-config: add ES83x6 quirk for IceLake
      commit: 5d73263f9e7c54ccb20814dc50809b9deb9e2bc7

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
