Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5593A66657F
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 22:20:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BCBB7667;
	Wed, 11 Jan 2023 22:19:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BCBB7667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673472041;
	bh=I6RVi3rMn06g5XGWsQnabnI2T34LE0uMNfo6RlULTGE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NkodFuKICrb503ADjZwVgLrmRkpde65vOe5LEHd8EOHBVhZfGa/4qWb1+8Rukm/7o
	 KW6JfGQ5Q1KapZLVIZz2mNacDN2ti+AuospPk7vfx9XrzQ4I3QXvAxS9E1WwWZVue+
	 AWB7sJYDJBnqsFWkhVAXFTu5eSP5PoWTQ897PWeQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08746F8016E;
	Wed, 11 Jan 2023 22:19:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58345F8030F; Wed, 11 Jan 2023 22:19:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DFEAF8016E
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 22:19:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DFEAF8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UtMvQGeJ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 321E161EC6;
 Wed, 11 Jan 2023 21:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0412C433D2;
 Wed, 11 Jan 2023 21:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673471973;
 bh=I6RVi3rMn06g5XGWsQnabnI2T34LE0uMNfo6RlULTGE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UtMvQGeJw9E3IdruelG3VenLhkQhouBDjy0/NDm0VRGsrFEZaZR10fw9/hAvQOcpz
 67i7BDkOspLZ4ShVUQoBzfuNhpZuwVLkIkGpHm/ImDav3TJaKWBvz4EaMrHnfJq77S
 LW4N+L0/RVgomp0zyVaKqKRQ1KnXxUuGHPlCkwM+mHHs3x4/Dts1IVDm0OQcO2WZz/
 s1134IINUELVjACdqSAO0vIY9vMFBfmshG012sHxX+5iXGM/s0c8nwRkwIfAEPoDFG
 2c7JGPQhGX60eJ+NWiPYWC8Fq7Nx95W+V1GFDQHkBtBIbYWwN+hma7DTYSoL0uTZHm
 77ZCWB1Qs1Tdw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Syed Saba Kareem <Syed.SabaKareem@amd.com>
In-Reply-To: <20230111102130.2276391-1-Syed.SabaKareem@amd.com>
References: <20230111102130.2276391-1-Syed.SabaKareem@amd.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI support for new acer/emdoor
 platforms
Message-Id: <167347197037.2692419.7705644270342223963.b4-ty@kernel.org>
Date: Wed, 11 Jan 2023 21:19:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-8b3d1
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
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, shansheng.wang@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Brent Mendelsohn <mendiebm@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Leohearts <leohearts@leohearts.com>, Vijendar.Mukunda@amd.com,
 linkt <xazrael@hotmail.com>, Takashi Iwai <tiwai@suse.com>,
 Xiaoyan Li <lxy.lixiaoyan@gmail.com>, Artem Lukyanov <dukzcry@ya.ru>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 11 Jan 2023 15:51:23 +0530, Syed Saba Kareem wrote:
> Adding DMI entries to support new acer/emdoor platforms.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add DMI support for new acer/emdoor platforms
      commit: 7fd26a27680aa9032920f798a5a8b38a2c61075f

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
