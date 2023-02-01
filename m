Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07714686586
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 12:44:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00BA27F8;
	Wed,  1 Feb 2023 12:43:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00BA27F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675251888;
	bh=MmpffVf8hWOZgiIPLTUppyG844PtEs1DvL1GWwkqiDY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RQSjxm+o5tVzB2W9Uv5p1u5HiIAwejtISFJ2RX0AHbqXAWRWWwpuXdulZwJKE0m3B
	 wGhNElctx6B+W9jAKJrWLwL8jQWrqeEoc79NREZwgP8v/HoASEb/pO+qZLm560any+
	 zxiLZMBr+VohHhEhVVCdKhFMGeUTvCka4yj0jKBQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1A62F8032B;
	Wed,  1 Feb 2023 12:43:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 111B2F8045D; Wed,  1 Feb 2023 12:43:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA87BF80246
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 12:43:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA87BF80246
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=k5X21ojP
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E12B2B8201D;
 Wed,  1 Feb 2023 11:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A586C433D2;
 Wed,  1 Feb 2023 11:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675251819;
 bh=MmpffVf8hWOZgiIPLTUppyG844PtEs1DvL1GWwkqiDY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=k5X21ojPzgg64FyE0xLoklKIZ3cC3qnVqQ78IQszlmXX1/dSDT+N1mfUsmFkEC5Km
 mlxz3LFAE9E7Z6JoA28n5m9iUUP4nWyHd+L8Q61fFaTMEja9sGiLReo/8H28rHJMcy
 S2h3siUiaQHgc0KZJn3gx7gS8XYkOVpmNWjI99OekPPUu3uq5aSnxONRrS1Mqd6NXo
 Plvc6pukuchxj/QtAgbYYLHCs9YlHPgSlVy/dCANsZAZ9jKCI5GTsc/Tjyk01AR/gc
 9u0dAPzipbvLYli4GXBHDl0D9ref8rySSsTbySLA3E08ilvACYevxfqWEDYkyujgQ4
 WHVun4uDpW6Sg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yassine Oudjana <yassine.oudjana@gmail.com>
In-Reply-To: <20220622061106.35071-1-y.oudjana@protonmail.com>
References: <20220622061106.35071-1-y.oudjana@protonmail.com>
Subject: Re: [PATCH] ASoC: qcom: apq8096: set driver name correctly
Message-Id: <167525181733.63465.381746473105058457.b4-ty@kernel.org>
Date: Wed, 01 Feb 2023 11:43:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
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
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 Yassine Oudjana <y.oudjana@protonmail.com>, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 22 Jun 2022 10:11:06 +0400, Yassine Oudjana wrote:
> Set driver name to allow matching different UCM2 configurations
> for the multiple devices sharing the same APQ8096 ASoC.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: apq8096: set driver name correctly
      commit: 86b753a86f6dc31ca9bccb489ebde1968d26c89b

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

