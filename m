Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C715A6D7DF6
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 15:44:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00A3D1FC;
	Wed,  5 Apr 2023 15:43:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00A3D1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680702275;
	bh=9n1hEIpzbcKxhbvQM0j1MI8RHChB+66O0uFRPDpYl60=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GSmvOPsndoi34kMvA0HSBhpydec52I9l/cr/QGga/gNePBlotMH3cxYwbxDi0Am+2
	 aPFa5dFt+cfkJdHDZE3dCi9w2iAEmPMyZ5/MkdbC4nURmkBRvnYmVioKsW1CwopYwd
	 jJgiyc9aoRQTl8uwBHFfCayDuvqk6zkLyg7E3WL0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AAFCF8024C;
	Wed,  5 Apr 2023 15:43:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 932CBF8026D; Wed,  5 Apr 2023 15:43:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8D03F80054
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 15:43:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8D03F80054
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WC07jQRK
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5AF9A62781;
	Wed,  5 Apr 2023 13:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E79C3C433D2;
	Wed,  5 Apr 2023 13:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680702208;
	bh=9n1hEIpzbcKxhbvQM0j1MI8RHChB+66O0uFRPDpYl60=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WC07jQRKNgcoSIm0NgnOqAFywHCc0Qem4pPUVa1QeHf42I2jf2SNb2yf17XX6A5wg
	 lr5eZ1Jb6l1DmGIda4dCUcBw+8ORBZWA0cTMrHJDnhnTj7m7YzDRCKX/SCcXybDeg0
	 43nnoGkXe6bMDq5TMEd4v/rUuhXwuIqTzPU8OuW0v00FYxlqYhZHEN5l9cZpaIoi5/
	 DceX0uDZdp4QYvhMpyi4nQsmwKYWHKp/1lWvbHfZ7gYhg09TUh07sUOK8dXKQiSyLa
	 BVetF8SG9CIu8w6DU0Y+HnfWlGgzOboD8bOWJOa3GhOcb6FSL5anmphgsv8v7/DFER
	 xRd0a21W4GwgA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, daniel.baluta@nxp.com,
 Saalim Quadri <danascape@gmail.com>
In-Reply-To: <20230403105237.3854-1-danascape@gmail.com>
References: <20230403105237.3854-1-danascape@gmail.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: wm8510: Convert to dtschema
Message-Id: <168070220664.64778.8309966966059306320.b4-ty@kernel.org>
Date: Wed, 05 Apr 2023 14:43:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: DPZHUK3U7SR2GZRNCTULUKH3IVUJNOWE
X-Message-ID-Hash: DPZHUK3U7SR2GZRNCTULUKH3IVUJNOWE
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DPZHUK3U7SR2GZRNCTULUKH3IVUJNOWE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 03 Apr 2023 16:22:37 +0530, Saalim Quadri wrote:
> Convert the WM8510 audio CODEC bindings to DT schema
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: wm8510: Convert to dtschema
      commit: 72456c24c8357793bacf5e67549db1f8c3fafe11

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

