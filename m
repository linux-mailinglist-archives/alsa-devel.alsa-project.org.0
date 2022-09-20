Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 858585BEF34
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 23:35:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7358E0F;
	Tue, 20 Sep 2022 23:34:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7358E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663709702;
	bh=LGXHaxnsi7buEIy15UVaOL9V+aU04sDBY/+LXR8I7is=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O7XN8P8knidJFiesXqAnIcDX6F+DtVdhDVfjoQcu3YFWHmEK+wdbXRYlIeKHiGJAi
	 vu+DMmpPvvUd1eL9+EqogsxgUjpm7jalNPf+HQQJef1GjBsA87Vk/0YagYpM6hCNdy
	 Gx2QUR4g+777jnv3INlSLP8f+tjRYV3R3oCqJITE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC708F804E4;
	Tue, 20 Sep 2022 23:33:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CC7FF80171; Tue, 20 Sep 2022 23:33:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04EF6F804D8
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 23:33:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04EF6F804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kFq+6G9G"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DF2B4B81A71;
 Tue, 20 Sep 2022 21:33:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF32C433D6;
 Tue, 20 Sep 2022 21:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663709597;
 bh=LGXHaxnsi7buEIy15UVaOL9V+aU04sDBY/+LXR8I7is=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kFq+6G9G+Cd0vK9R4fRTibMYBaWxBRWwCSip0udMyAhYYvHejOL6rsqZa7yht5itl
 KgZlIRee1A1sMOJoUS+gWolAlfuAz9pikMUNzKvIJpFlNsRLDXfE8v272a/L6mhJAL
 bZ0DS08ZKzt02FSoO9LSIKGbBTicbxPQ4nvan0+Fb+VwDQs30GO90q2ocDJDYcneH/
 QleAjVlmI1KoN7zKVqh+4uAChnO9LIPZKBwuVdYgftR24TK6Dil7npTR9BIzlrdNEK
 LpQHldiXGCoWoUupFth3lxA6iFaxeKs3giJP5QR7+7Jg2EhHEHXNsJ4p/y1G5Ei8eo
 Ro6DvnNo+SMVw==
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>,
 Alexander Martinz <amartinz@shiftphones.com>
In-Reply-To: <20220920115014.952062-1-amartinz@shiftphones.com>
References: <20220920115014.952062-1-amartinz@shiftphones.com>
Subject: Re: [PATCH] ASoC: codecs: tfa989x: fix register access comments
Message-Id: <166370959271.476248.6207909034346606474.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 22:33:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Tue, 20 Sep 2022 13:50:14 +0200, Alexander Martinz wrote:
> Fix comments regarding register access based on review feedback[1].
> 
> [1]: https://lore.kernel.org/all/YppQ7BiqlBDMNsuc@gerhold.net/
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: tfa989x: fix register access comments
      commit: 9b9def51e1a6de6cd336ae08884f580ebab7d2b2

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
