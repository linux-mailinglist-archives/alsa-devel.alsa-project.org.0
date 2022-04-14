Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9508B501A1B
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Apr 2022 19:38:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BDB61848;
	Thu, 14 Apr 2022 19:38:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BDB61848
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649957939;
	bh=6dOv01az04T/z1BTO+IT24inw8nsBFbY540g2cn/Fkk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RwzSMWzJNJEz1/E5kbW4d7hfmsp35FMk7VT46ZNeKEL9L2T/uhtpMTf2bif3HCgRy
	 05s+FRV3Q7J0T7fY5GiLn4t9eCfOJzmtcRDBX7IbwLqhef6p8y6GeHiRnsQ2ugzKln
	 ePZSxrG0e1LAPG6VebCr+BhU0EMfnLDYMIotGzxg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4F0BF80114;
	Thu, 14 Apr 2022 19:38:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27D48F80162; Thu, 14 Apr 2022 19:37:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA5DDF80114
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 19:37:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA5DDF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LG79QvOu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D54F562153;
 Thu, 14 Apr 2022 17:37:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A2BC385A1;
 Thu, 14 Apr 2022 17:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649957871;
 bh=6dOv01az04T/z1BTO+IT24inw8nsBFbY540g2cn/Fkk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=LG79QvOujphjFiE7awNBuY5vBsXnGOqY8CuaLQGHgNFC8sxXWS4augbLnrwQSiGXN
 sWfBXgNvPE4fK0z14guRsmx5qUgzswleIXrh2bwMK+VH8O03uGVO/2qG0AJlrq2x6I
 DDnlf/cVe1/hlyQSIPoXvQBD5zTzZ3yaE2bDOYue5Vlt56TvOD1ACXIzALl72ZkGm4
 Frwq69xH+JjXB+VhgABOdoa1znAHoIa4ksH6IOxV6yEYBYMbMzo+aeneB0enNmJYvR
 cVpFnW9zwbDMM4OMuoDK/UrpCY+qmI5GkodTRS7pOeoRYhNwbyYkdiIs0sO3+d1IJq
 RZn+UtyJiau7g==
From: Mark Brown <broonie@kernel.org>
To: akihiko.odaki@gmail.com
In-Reply-To: <20220408041114.6024-1-akihiko.odaki@gmail.com>
References: <20220408041114.6024-1-akihiko.odaki@gmail.com>
Subject: Re: [PATCH] ASoC: soc-card: Create jack kcontrol without pins
Message-Id: <164995786974.2810970.8441162989456904692.b4-ty@kernel.org>
Date: Thu, 14 Apr 2022 18:37:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Fri, 8 Apr 2022 13:11:14 +0900, Akihiko Odaki wrote:
> snd_soc_card_jack_new() allowed to create jack kcontrol without pins,
> but did not create kcontrols. The jack would not have kcontrols if pins
> were not going to be added.
> 
> This renames the old snd_soc_card_jack_new() to
> snd_soc_card_jack_new_pins() for use when pins are provided or will be
> added later. The new snd_soc_card_jack_new() appropriately creates a
> jack for use without pins and adds a kcontrol.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-card: Create jack kcontrol without pins
      commit: 19aed2d6cdb72a7c92909832b9480d9cadebeef9

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
