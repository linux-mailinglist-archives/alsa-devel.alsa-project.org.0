Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3C0523C95
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 20:33:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E68A81A90;
	Wed, 11 May 2022 20:32:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E68A81A90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652293982;
	bh=kCCerywDBBA4IoO0PQrQlUEkZgZN+MEjD0xdMDToPjE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vkmXibHhS7EgKzK3GQQBTpGGGZaIeyw9V2NFiuolwEQ57O/v5EScgVw9OO1pIzQ9n
	 90UZfDfEyGEApIYfn33MXwFFbXGBFPyazkBSgG1C8qEiEVmKh/yoOPJmW/GXQldUcj
	 1VQ+gAdj+SU9hfaKkkjpx333PJVLrIztgJZsf0aI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66429F800BB;
	Wed, 11 May 2022 20:32:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A44B6F8011C; Wed, 11 May 2022 20:32:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27980F8011C
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 20:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27980F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Qcn39IAK"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5567661E10;
 Wed, 11 May 2022 18:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9515DC340EE;
 Wed, 11 May 2022 18:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652293915;
 bh=kCCerywDBBA4IoO0PQrQlUEkZgZN+MEjD0xdMDToPjE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Qcn39IAKfSZ3kVwQqk2Qd7kGZxgL7autk6gImQe2p1Z1BA0+NUzAfqXPQgXEj3iZP
 4hxPiwtWPyhqlq6ntnITR9+UDo0ZMWte7t/bAxiyMPMHgdkkqjhSoJVVGMSq+/l7+n
 3SBYaQvurQbkuz3xETTtxhMBZPAxp5Y+7rb/qTTwFAsHG74d3iGbFCZtQ8FucEDXmd
 77J6QUilwyUZbbkD5Upw4pO8R5YntXB3txq86VCccaUXL6/l2tWMCr/enlFbuGOvjJ
 GFXOe5MVgzocjUnCIeEvjUVGEAKcXxkEuPQED2Du/PD/39a3ZbUulGlNuLu6OmCMTn
 AlOZGeTdq13PA==
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, festevam@gmail.com, perex@perex.cz,
 shengjiu.wang@gmail.com, shengjiu.wang@nxp.com, alsa-devel@alsa-project.org,
 tiwai@suse.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com
In-Reply-To: <1651925654-32060-1-git-send-email-shengjiu.wang@nxp.com>
References: <1651925654-32060-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoc: fsl_micfil: explicitly clear software reset bit
Message-Id: <165229391332.338959.11028062899331313513.b4-ty@kernel.org>
Date: Wed, 11 May 2022 19:31:53 +0100
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

On Sat, 7 May 2022 20:14:13 +0800, Shengjiu Wang wrote:
> SRES is self-cleared bit, but REG_MICFIL_CTRL1 is defined as
> non volatile register, it still remain in regmap cache after set,
> then every update of REG_MICFIL_CTRL1, software reset happens.
> to avoid this, clear it explicitly.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoc: fsl_micfil: explicitly clear software reset bit
      commit: 292709b9cf3ba470af94b62c9bb60284cc581b79
[2/2] ASoc: fsl_micfil: explicitly clear CHnF flags
      commit: b776c4a4618ec1b5219d494c423dc142f23c4e8f

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
