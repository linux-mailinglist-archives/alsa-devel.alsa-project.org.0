Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 039DB4F297B
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 11:33:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 093BD17F6;
	Tue,  5 Apr 2022 11:33:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 093BD17F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649151230;
	bh=6hPaKj46Ta/FHnJuIOaaZWGm+AiJawFaYXScRGm6ONg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gm/g4gnFl0GsxLDTR+OViW+1Tc/4YO6oNC4vgBspMDerPuaVhyOnfSm3uwlxhwEn4
	 Lwq9aST0cJvhACYVIkcER4amUihiVvqA/O0lKpM0w2v4CPn9hr5xhnFtMWAnOdZP5R
	 +mvztywzyRiO0sSV4lue9y8H/kEb5jAkJivNYQuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42ABCF80533;
	Tue,  5 Apr 2022 11:31:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9219F80533; Tue,  5 Apr 2022 11:31:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 734F3F80529
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 11:31:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 734F3F80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="r+4PyjzB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 670D7616C1;
 Tue,  5 Apr 2022 09:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5999C385A0;
 Tue,  5 Apr 2022 09:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151077;
 bh=6hPaKj46Ta/FHnJuIOaaZWGm+AiJawFaYXScRGm6ONg=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=r+4PyjzBqaVp+BAyJdhAcMtxpkZy33JnUARGDRzHM9DO0afUFYxBYgiO+m/Xruyd5
 EvwZ3QL3CCQ+Me8tI5R+iVIuMd8oD0ln9dxS79WxwFIZjovFkAaUbeR8Dvq+sXN7lj
 LTzUX+ZpVoHLsWo4lilJJneqlCmq8uT+XwyyzzmVU8kycWSqeQYqpAFAVf7YA+KoEg
 rbxxaqxfBw3P1VmnV8OCuO1y/S9YuGHr8djA8hoCu2j0b5Qm6sckVx1ndoTuNAUkNR
 WbzBJ1wzr09Tfw80lxydn0I1HLqFZivlj37JKxS9fSP79PdHlCM8LqJl8A6P47Mjs8
 Yj4ZjV/GydC/A==
From: Mark Brown <broonie@kernel.org>
To: patches@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 hui.wang@canonical.com
In-Reply-To: <20220328123535.50000-1-hui.wang@canonical.com>
References: <20220328123535.50000-1-hui.wang@canonical.com>
Subject: Re: [PATCH v3 1/2] ASoC: cs35l41: Add one more variable in the debug
 log
Message-Id: <164915107653.276574.10074506787215359634.b4-ty@kernel.org>
Date: Tue, 05 Apr 2022 10:31:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 28 Mar 2022 20:35:34 +0800, Hui Wang wrote:
> otp_map[].size is a key variable to compute the value of otp_val and
> to update the bit_offset, it is helpful to debug if could put it in
> the debug log.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: cs35l41: Add one more variable in the debug log
      commit: c598ccfbeb26cb9452f99e7beb92ef779dcb16b1
[2/2] ASoC: cs35l41: Fix an out-of-bounds access in otp_packed_element_t
      commit: 9f342904216f378e88008bb0ce1ae200a4b99fe8

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
