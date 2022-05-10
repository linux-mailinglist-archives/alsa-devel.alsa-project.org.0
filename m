Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 803EA521D00
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 16:51:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21C1118FD;
	Tue, 10 May 2022 16:50:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21C1118FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652194276;
	bh=Te2sD/cDnoun0AwDA9vgLsTlUYlmrjjvVc6ECCVxxpU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ENuJZhYBlDk91nkKW3BlY5bJKYlhDvEKvl/zbcp0j/jJgKZGXML+BsriSsGpXPC8o
	 kYdfwAawefZpJ8uhN/33ZgK+v6zbtUOaghuqee03hVLLMvmle58WbHjZWEAL6HEknY
	 5/E5/EY2i39FKOq5nknh2fTNXfC+k9yGVtK+Aa30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D37B1F804BB;
	Tue, 10 May 2022 16:49:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47571F804FF; Tue, 10 May 2022 16:49:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 900EAF80153
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 16:49:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 900EAF80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hIU0MLSy"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 2A920CE1F2B;
 Tue, 10 May 2022 14:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01BFFC385C9;
 Tue, 10 May 2022 14:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652194177;
 bh=Te2sD/cDnoun0AwDA9vgLsTlUYlmrjjvVc6ECCVxxpU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hIU0MLSy0U+hyR4yUULyOPI3PieQ6tkGZURG/I4Dz+y3wN7FQMcaIjyArGXSlH501
 i4OI+tJXfFqeHf+KdssFjQadGcCfVK4Hz8qRXku6q2hrQARzijqwkZOX1HxcDXriCS
 MK17vqz9geYAtwDWTZJJnhMh+lq0G2kBjoVzZJz9yt7UodOZEAjDxPl9cwSvW6JASA
 OUymGcyaf3i8CuAShTtf+yD2elx0XdAHUX6K+29C+SHNqhk7TOYyv8GdARoHhVgGNT
 Gn1WPVdEzE34Ma+a8+yt/nXgSziTHn1SMqjrDIcq3csEopB/qWro43E3uw3G7ZkI9E
 pbekd+u8gNhsA==
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, alsa-devel@alsa-project.org, perex@perex.cz,
 krzk+dt@kernel.org, shengjiu.wang@nxp.com, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, festevam@gmail.com, devicetree@vger.kernel.org,
 shengjiu.wang@gmail.com, robh+dt@kernel.org, tiwai@suse.com
In-Reply-To: <1652087663-1908-1-git-send-email-shengjiu.wang@nxp.com>
References: <1652087663-1908-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: fsl_micfil: Add support for i.MX8MPlus
Message-Id: <165219417472.388769.13970240077661005048.b4-ty@kernel.org>
Date: Tue, 10 May 2022 15:49:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Mon, 9 May 2022 17:14:22 +0800, Shengjiu Wang wrote:
> On i.MX8Plus there are two updates for micfil module.
> 
> One is that the output format is S32_LE, only the 24 more
> significative bits have information, the other bits are always
> zero. Add 'formats' variable in soc data to distinguish the
> format on different platform.
> Another is that the fifo depth is 32 entries.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_micfil: Add support for i.MX8MPlus
      commit: cb05dac1bc34ad701972503ca1a75b51ae4478ff
[2/2] ASoC: dt-bindings: fsl,micfil: Add compatible string for imx8mp
      commit: 7b46eb1bf9534a75ff072a01e774b79e6a17cfdd

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
