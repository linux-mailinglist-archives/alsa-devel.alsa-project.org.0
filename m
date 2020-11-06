Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D062A95DE
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 12:56:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B732C1697;
	Fri,  6 Nov 2020 12:55:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B732C1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604663778;
	bh=uajC+yCxqwMRDpmS8LKphYFTZOXNRJlq1O5B9n/FUwg=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nsbb2l4WuplLHl86pepHKO0WYEKfXO1qRDENIi5p1TiVns9y8stgHeJqPlf4TKZnu
	 se1batL2ri8yYkdgraSfz3VUH5iHPCiKT+qwjtdBgBtbdmCMUc6gv5SAJw9gH0EpPr
	 uYxmfoir6dcA9vTmW96bHqT31prlwaxo2RkJ9R4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34018F80259;
	Fri,  6 Nov 2020 12:54:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 296FFF80259; Fri,  6 Nov 2020 12:54:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CFFAF80247
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 12:54:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CFFAF80247
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Nut+t71K"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EFDC820720;
 Fri,  6 Nov 2020 11:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604663672;
 bh=uajC+yCxqwMRDpmS8LKphYFTZOXNRJlq1O5B9n/FUwg=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Nut+t71K1QLfsGV5Z84ZT/UAF3iYgWxXAonnqb4K1HqIsuRRgK9fCIHrZcYLdYmXL
 QZgvyE+EdWgVTfon/QKg/XWgyDLIs9LK8HDzsWm3WTAgVAaTHjGgaivIeOqwcnKH2G
 2z00OS7Kj65xRr35+ScXVH/0Oi+YDTXQcYS2Zj70=
Date: Fri, 06 Nov 2020 11:54:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, perex@perex.cz, Xiubo.Lee@gmail.com,
 festevam@gmail.com, robh+dt@kernel.org, nicoleotsuka@gmail.com,
 timur@kernel.org, tiwai@suse.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com
In-Reply-To: <1604281947-26874-1-git-send-email-shengjiu.wang@nxp.com>
References: <1604281947-26874-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: fsl_aud2htx: Add binding doc
 for aud2htx module
Message-Id: <160466365499.22812.9217467877032314221.b4-ty@kernel.org>
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

On Mon, 2 Nov 2020 09:52:26 +0800, Shengjiu Wang wrote:
> AUD2HTX (Audio Subsystem TO HDMI TX Subsystem) is a new
> IP module found on i.MX8MP.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: fsl_aud2htx: Add binding doc for aud2htx module
      commit: 40f4c56d08f2a95f4f3b036987f171dde69ddd36
[2/2] ASoC: fsl_aud2htx: Add aud2htx module driver
      commit: 8a24c834c053ef1b0cdefbd9c5bcb487cbc5068f

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
