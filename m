Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F50049B136
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jan 2022 11:22:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 160EA17C3;
	Tue, 25 Jan 2022 11:21:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 160EA17C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643106133;
	bh=KCr0hL6o11BQkhCkzi4kW14K7GAZ8bdJwciwDLwogb4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PPeoCDVxsmwFUELiGm+dxv/JIlCuOq5SeTW1sFuK6nLt4fK+o42jQ2mrj6jeZVLpr
	 GIaFXcRuCUiwbkYe3TR1wLsIhIYERSDAbfXhlPfIZigubwtBpYRQUYcoB4SFCXcaE3
	 jKEFLLixI1e87ARRL1OfGKH96zux5oOJUp8yxE08=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76C7CF80518;
	Tue, 25 Jan 2022 11:20:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12749F804D2; Tue, 25 Jan 2022 11:20:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7E3EF804CF
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 11:20:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7E3EF804CF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bvxHPRtB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EB6C3B81626;
 Tue, 25 Jan 2022 10:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB9C5C340E5;
 Tue, 25 Jan 2022 10:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643106011;
 bh=KCr0hL6o11BQkhCkzi4kW14K7GAZ8bdJwciwDLwogb4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bvxHPRtBAFNrfh9M+B/7esFKzaXJND94MVRoXn8pj1jIxugHrXnEHxwfPrJL7MGjF
 RYudPY+/sMx/78Vs/XkivOPSz/mtN1p2Z/tP2I63FXoCqhAyECbIBBMKbwoGh+CBul
 FeSyuO8g+m6hy1cnuwc/l1n6A1sKhKgE0HqhRdET3t8VJ0aX2cr3We86Cr8dFQDWhL
 nnT/icmNIJiswW54AJsD5uTnd7Zpr33m4Y450fS1UVshhaQ7ZDgDgoG9KV0ri35seF
 G3P8Bla+p0QoJv5Qqi5jrCMOASZ2RUqN3D9bOOA52S9tnJQbyTuSoJSkJbcq5wtGIt
 6fC05s9aU9QWQ==
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com
In-Reply-To: <20220110012833.643994-1-chi.minghao@zte.com.cn>
References: <20220110012833.643994-1-chi.minghao@zte.com.cn>
Subject: Re: [PATCH] sound/soc/codecs: remove redundant ret variable
Message-Id: <164310600828.74844.1045403214437339843.b4-ty@kernel.org>
Date: Tue, 25 Jan 2022 10:20:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 patches@opensource.cirrus.com, Zeal Robot <zealci@zte.com.cn>, tiwai@suse.com,
 linux-kernel@vger.kernel.org, chi.minghao@zte.com.cn
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

On Mon, 10 Jan 2022 01:28:33 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Return value from devm_snd_soc_register_component() directly instead
> of taking this in another redundant variable.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] sound/soc/codecs: remove redundant ret variable
      commit: 4ec19deec7ffae843c3445ac7d2cfcc78c56c145

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
