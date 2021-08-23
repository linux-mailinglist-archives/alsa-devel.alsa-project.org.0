Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 129C73F4FB6
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 19:41:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80B65166F;
	Mon, 23 Aug 2021 19:40:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80B65166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629740474;
	bh=/EBUUWEDni1MyQopat5em0GN1R1LMCsO+1c/XNA3TjM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gdc3wOkFSYVrYChGEr5sLcJtAhxjGxrWCcc8eDKUq2GdXyXcgYQYfjFZIGcVjQmXx
	 cVgaDhtxN8e3nVRb3ecbVSPjrogM8iEYCzOHVfgZrFbpIagfiV5Yu6GIu+B4JRtibu
	 vEs63HxHzbl3oLowkVGAr7pbIIOmaWGnYcLAFyn8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A54CFF804E6;
	Mon, 23 Aug 2021 19:38:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C0A2F80431; Mon, 23 Aug 2021 19:38:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AF68F804D0
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 19:38:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AF68F804D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Zdt5llRQ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D2CF61378;
 Mon, 23 Aug 2021 17:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629740315;
 bh=/EBUUWEDni1MyQopat5em0GN1R1LMCsO+1c/XNA3TjM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zdt5llRQc2dcj8DuNexw5Yx32BfI0PH5l9IJkAjDmu1vA0hw+M8hkSCJd76gjo1f+
 h05QtzgIzceLgzDBx5HOY0LoBzjY52PQMTjiiiLwgnKv1sO6KWO7aAur+hj8E6P3MU
 KynJZMkKjyU/ybwM8UjMy255t5vEMlR/1D5fkgwlIFqVqS1CYzBJH9GRp7cKFNq0Gj
 zRnhixl0BOrXpQtAP51iUfgj41Xkdr3jFRfR/DSqSRmyWRxwEEwEWQoUtVGr5/c7Rg
 Zi3hg3bAbw7GTTX8/6RypyoSLzrNxnHdiudYcONEE08YXIDBKKimPLZQZ6Aix6ephf
 rXf+qB+eOrwTA==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Tzung-Bi Shih <tzungbi@google.com>,
 Rob Herring <robh+dt@kernel.org>, Dillon Min <dillon.minfei@gmail.com>,
 alsa-devel@alsa-project.org, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: panel: ili9341: correct
 indentation
Date: Mon, 23 Aug 2021 18:37:55 +0100
Message-Id: <162973996481.3102.17751483171907199985.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210819101020.26368-1-krzysztof.kozlowski@canonical.com>
References: <20210819101020.26368-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Thu, 19 Aug 2021 12:10:19 +0200, Krzysztof Kozlowski wrote:
> Correct indentation warning:
>   ilitek,ili9341.yaml:25:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] dt-bindings: sound: rt1015p: correct indentation
      commit: 0aeb17d1728257f29131a290f0cc8e281cc7274c

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
