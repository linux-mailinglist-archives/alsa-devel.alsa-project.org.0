Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E8E2ADB37
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 17:05:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3735C1731;
	Tue, 10 Nov 2020 17:04:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3735C1731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605024305;
	bh=85hj4zBO2bIJ/OyK1W2l+nVRYcEIAImU3Qz9r8YsK/s=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W/orQ2vtB3sRQrRZD78UenN7iHxf1SyzlcreUkDSPFJKd3jGowZs0f7ENgEJlJAOp
	 IHYME7/ouvBo22U4qYAmv3eLc7hj1ZmCsWfLWfC2OS+usgRjsMyA3pr6vpeyJLaqIL
	 pYkxKzUCNx1kApiDjaZjyAD4RN/JR8CfDNZVaDhc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D57EF800AE;
	Tue, 10 Nov 2020 17:02:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3035F804CA; Tue, 10 Nov 2020 17:02:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D530F800AE
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 17:02:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D530F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vOC0ewTe"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3BABC206E3;
 Tue, 10 Nov 2020 16:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605024165;
 bh=85hj4zBO2bIJ/OyK1W2l+nVRYcEIAImU3Qz9r8YsK/s=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=vOC0ewTet/e6Qj0KzFwfERrL++JcF6PHDYRzX15as4VKzUK071fa0r8ezU0nqksXH
 gnYwH/7YX2UrIsXUA0V8UXBSGpoism975vW/Kc0pRfz0T2Fym+emtCzSkWEC7/sBsx
 X+JXNQN4RV4fOlsSYzX259HTl4AfM2ZiiiUui7Hg=
Date: Tue, 10 Nov 2020 16:02:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875z6smszj.wl-kuninori.morimoto.gx@renesas.com>
References: <875z6smszj.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 0/2] ASoC: soc-compress: tidyup STREAM vs COMPRESS
Message-Id: <160502414079.45830.14608177221548194393.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On 30 Oct 2020 10:00:43 +0900, Kuninori Morimoto wrote:
> These are v2 of tidyup patch-set for SNDRV_PCM_STREAM_xxx and SND_COMPRESS_xxx.
> soc-compress is using both SNDRV_PCM_STREAM_xxx and SND_COMPRESS_xxx, but mixed use.
> This is confusable, but no problem. Because these are defined as UAPI and
> are using same value.
> This patch-set make sure these are same value.
> 
> v1 -> v2
> 	- checks COMPRESS vs PCM_STREAM by using BUILD_BUG_ON()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: soc-compress: tidyup STREAM vs COMPRESS
      commit: eb84959ab8c0ca2897e69575110bdaaf2d532eb7
[2/2] ASoC: soc-compress: assume SNDRV_PCM_STREAM_xxx and SND_COMPRESS_xxx are same
      commit: 7428d8c8bd7936840b4615df674cee5fce1eb385

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
