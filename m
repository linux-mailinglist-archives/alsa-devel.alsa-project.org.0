Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A4A486B34
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 21:31:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 664A01A8F;
	Thu,  6 Jan 2022 21:30:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 664A01A8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641501068;
	bh=WJ2sfcxn6GVvDjVhkMuBqAzdc3GwgvrPGmKcfFu60ec=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=njtohacXn1G6L0a2/iM3X6lWqdYWQTzS1lTrwX8RwUeDu/gwAIGtE0QByyadp82CC
	 jJMwwvW43m3HfKEgtlhTiDZCE7CkPCaEQ2+j0zZ2JIN3942rsVyR7tjD6iJbHxbp0P
	 N47rqjmzWV127F5ePK9tZ4xb+z9CoIJD44RPvZZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A188F8051C;
	Thu,  6 Jan 2022 21:28:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E1FEF80517; Thu,  6 Jan 2022 21:28:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DB76F8050F
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 21:28:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DB76F8050F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="K0B2TiIi"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C30A461E15;
 Thu,  6 Jan 2022 20:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19B8C36AE5;
 Thu,  6 Jan 2022 20:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641500899;
 bh=WJ2sfcxn6GVvDjVhkMuBqAzdc3GwgvrPGmKcfFu60ec=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=K0B2TiIiP/OB5JpWTBCGOLDpev+HYLQW3HR3vjJ/2pGG53/TaYk6exXM6T+eC4waY
 LFxUtOajGRr09bpzsDMVd5Qc96WRBKtIwqEFN3FbmYLs/3PPd+dgOclOkSrrP94uck
 VgDPzDToBHma7GfPRq9f70p+oneyV0plwFq/U6KEeeF4xw3HAVt47VAJ9jM1s/4uLG
 nL5rhGF4jICnLDgHqoJbX+5wvo+bV9uU+Xpp5UHJiqS2r6PU+EJtIXFSpIH5owaJov
 7KRjcn9+EoZFPcLgTT67d3zIQ9KljRzNCveEel6n/l4SnfQrCD2GLRNNhX6FQgAK/l
 51DNYDa/ZVEzg==
From: Mark Brown <broonie@kernel.org>
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, alsa-devel@alsa-project.org
In-Reply-To: <20220106150525.396170-1-AjitKumar.Pandey@amd.com>
References: <20220106150525.396170-1-AjitKumar.Pandey@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp: acp-mach: Change default RT1019 amp dev id
Message-Id: <164150089750.2243486.8547152917333843393.b4-ty@kernel.org>
Date: Thu, 06 Jan 2022 20:28:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Basavaraj.Hiregoudar@amd.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 V sujith kumar Reddy <vsujithkumar.reddy@amd.com>, Vijendar.Mukunda@amd.com,
 Alexander.Deucher@amd.com
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

On Thu, 6 Jan 2022 20:35:21 +0530, Ajit Kumar Pandey wrote:
> RT1019 components was initially registered with i2c1 and i2c2 but
> now changed to i2c0 and i2c1 in most of our AMD platforms. Change
> default rt1019 components to 10EC1019:00 and 10EC1019:01 which is
> aligned with most of AMD machines.
> 
> Any exception to rt1019 device ids in near future board design can
> be handled using dmi based quirk for that machine.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: acp-mach: Change default RT1019 amp dev id
      commit: 7112550890d7e415188a3351ec0a140be60f6deb

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
