Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E7A54AE40
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 12:26:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2AA817F0;
	Tue, 14 Jun 2022 12:25:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2AA817F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655202373;
	bh=qA9xWVn3AUOfZxfhOprMPBGdr1XvmWBCUKQPSallH0Y=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IcANemfhspFGJLblO6ZoAU44oXhn3X6NzOB0+ERM7xjNyGRiez6DAfmFDHVYa0Br4
	 jTVY42br7lv0o2TRtwZp6lZNMwFRRnErBHxfe+LWiVnBtuBReP6arSsdbEcAhX09l7
	 Y9I8JuECo4AFhPQRAzedEhdKeSOF3QnmVYYJ6y+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55D8FF80165;
	Tue, 14 Jun 2022 12:25:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BBCCF80139; Tue, 14 Jun 2022 12:25:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0397F800E1
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 12:25:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0397F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DGbRvEEx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DE201B8184D;
 Tue, 14 Jun 2022 10:25:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D11C3411B;
 Tue, 14 Jun 2022 10:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655202307;
 bh=qA9xWVn3AUOfZxfhOprMPBGdr1XvmWBCUKQPSallH0Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=DGbRvEExBH84aRP3LsVoe88rb3sKrQrDJjoxsjJUxG+m6/s4Zp1yT0QXwou0ZZVuK
 57N8LOHwEwXf6uz0O6ZrgPYZ4CPv1Sld/mUjt4GiUELMyBk7E/CTgnfpByvHA2w5UD
 TUgtNdMlbDKO0UxlVPSD1oqwSHrKk8JP/n5xsaTzJRowVJB6RmK4fZYVIILpyYhGcZ
 +hJ7KFui/7hcXr6XyVRtoGWsLlyJFNNN1/AVXvVH+koYyKq6TyrXaIkaw5q6Oyd68o
 KbrIQja2neTtQpk1folFoQbvO3D/ZX0abdGoU57kNE6UE4lxmo9QjNiQ8FhXsQaypE
 IWVx6FLZPRDRw==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, shengjiu.wang@nxp.com, tiwai@suse.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 shengjiu.wang@gmail.com, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 perex@perex.cz, festevam@gmail.com, krzk+dt@kernel.org, lgirdwood@gmail.com
In-Reply-To: <1654840042-7069-1-git-send-email-shengjiu.wang@nxp.com>
References: <1654840042-7069-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl,
 mqs: Add compatible string for i.MX93 platform
Message-Id: <165520230461.3607327.1182225062255156973.b4-ty@kernel.org>
Date: Tue, 14 Jun 2022 11:25:04 +0100
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

On Fri, 10 Jun 2022 13:47:21 +0800, Shengjiu Wang wrote:
> Add compatible string "fsl,imx93-mqs" for i.MX93 platform
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: fsl,mqs: Add compatible string for i.MX93 platform
      commit: 81ae0635df7de58496def18b0b9333992630b9af
[2/2] ASoC: fsl_mqs: Add support for i.MX93 platform
      commit: 047c69a3a9b19f29e021c77a7e9ce79230a342ed

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
