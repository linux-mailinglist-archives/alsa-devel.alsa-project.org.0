Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6A450E732
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 19:26:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59B4217ED;
	Mon, 25 Apr 2022 19:25:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59B4217ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650907562;
	bh=zDTFfsXP5TQsh6QxZ0lZ30NVKp51Bfdj/1GB7CjYytc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bOeHcGqLBoypvsrs/Dj3UFmbthc4mt9naALP7vaTppJW7ro5M/6SE8TyW1A2vSIwR
	 T8P43tvkBoGdAu+gyU4zGgVZt16i7USsvQcJvA0ov0kj4P7DSqKO9iRxgvgNQtibyE
	 LWYbxewcwwb2kQQThnQd+uKrXEVq5j6saxLcloP0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C50DF80508;
	Mon, 25 Apr 2022 19:24:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C199BF80152; Mon, 25 Apr 2022 19:24:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 121E7F8016A
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 19:24:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 121E7F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PlpUOGdi"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C3F3D61583;
 Mon, 25 Apr 2022 17:24:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 646ECC385A4;
 Mon, 25 Apr 2022 17:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650907452;
 bh=zDTFfsXP5TQsh6QxZ0lZ30NVKp51Bfdj/1GB7CjYytc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PlpUOGdi5gYZ5GIuSwhftkR5FLmJPochry0pyq0b0XhANVZ3fyhEIPnGGuw60F5Cy
 leWUg0kyaDIC58lkBgU3KvclV3lbHm5MHa4nbamHUwkysRAU62NkSmDzPbe1lZzuMi
 PACUoCd/zz+lqjUkPpxPBeUAXOxTN4t0agl1O+NvCcAxV93y6RLhr52t8Bm1lqDMEe
 i3WQ8587OGevsszm2WNYX/UipUHZzz3q/n8/FwVptlAUMknBpdiKNwEI4JqgYpxaRm
 MmCJ0X4K372biIi5ju1jj8b7QvGn9EoyCyhOlYJ3wUsUzcNUrKcD4eUo/3txW94dGI
 98Vwn8XLU3DhA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, cgel.zte@gmail.com
In-Reply-To: <20220420030246.2575629-1-chi.minghao@zte.com.cn>
References: <20220420030246.2575629-1-chi.minghao@zte.com.cn>
Subject: Re: [PATCH] ASoC: img-parallel-out: using pm_runtime_resume_and_get
Message-Id: <165090744992.583823.8247124310315131790.b4-ty@kernel.org>
Date: Mon, 25 Apr 2022 18:24:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, zealci@zte.com.cn, chi.minghao@zte.com.cn,
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

On Wed, 20 Apr 2022 03:02:46 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Using pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
> pm_runtime_put_noidle. This change is just to simplify the code, no
> actual functional changes.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: img-parallel-out: using pm_runtime_resume_and_get
      commit: 9470aa1c46098587270ff34c112d670b58ff5d34

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
