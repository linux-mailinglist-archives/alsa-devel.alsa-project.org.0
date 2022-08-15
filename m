Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C58593336
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 18:27:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B48C0164E;
	Mon, 15 Aug 2022 18:26:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B48C0164E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660580826;
	bh=hIIo0z+3KwDSuhaQ0bt33I03p9WztHHhLDAR3Hd8u4o=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vl4P+dRzHDZHmwot3vWT4zq+oZh0PPPmVOa9clsDE2aoxnXqGgbuxFC34vsMJFYBI
	 6mrkQebdJTkA6pl55CATD5NBYyFHlMc2Shcj2miGVQ+QPUq4k8li95emxy8oclfZxX
	 E4bVmvI0/OoVJvEdsUehMBiN1Nbf7LpxJsTCVs1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41458F805BA;
	Mon, 15 Aug 2022 18:23:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 698BBF805AF; Mon, 15 Aug 2022 18:23:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFF70F8057B
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 18:23:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFF70F8057B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BZrOxYcU"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6530CB80FEE;
 Mon, 15 Aug 2022 16:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D38C43470;
 Mon, 15 Aug 2022 16:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660580599;
 bh=hIIo0z+3KwDSuhaQ0bt33I03p9WztHHhLDAR3Hd8u4o=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=BZrOxYcUQ87A3EgjfSeVNzAqxg0gsVbP3Y+BGix42qydLdVvWSV6WPjyVzrhU9mYI
 /MbYmdnH2wnKceZeXPNblSGipV+k+idlINwFuIhE0PBlFUo6lf573+lgF218RcT8ry
 aivBBRUJL7dck1H65+S5Yp/48sr6kJ57x0+u06EGXe5oQLAGud15Ovc1Y7AS/lJ1wK
 6QZRHN9Vk4aMUuCnMkMiCFP1OlEhcFtO0XrdX/W04vajGlbQ8wxt78rthYOzpT6d4l
 XC6xosDZHHiZIIFFDU7NmE5r+NkZlLaDdT/JWNZeh40Oj+gim84v1rbdW+qBLgQvez
 cNfadXxFtN2Wg==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, Matt Flax <flatmax@flatmax.com>
In-Reply-To: <20220810221232.1596488-1-flatmax@flatmax.com>
References: <20220810221232.1596488-1-flatmax@flatmax.com>
Subject: Re: [PATCH v2] ASoC: codecs: dt bind. doc for the new TI SRC4392 codec
Message-Id: <166058059820.769843.6109173047576888362.b4-ty@kernel.org>
Date: Mon, 15 Aug 2022 17:23:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: alsa-devel@alsa-project.org
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

On Thu, 11 Aug 2022 08:12:32 +1000, Matt Flax wrote:
> 


Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: dt bind. doc for the new TI SRC4392 codec
      commit: 020adbfb2edae4dd90d7774d08936261e218c171

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
