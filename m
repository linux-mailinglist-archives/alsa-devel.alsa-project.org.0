Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B24BE22995A
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 15:46:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 418E31615;
	Wed, 22 Jul 2020 15:45:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 418E31615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595425596;
	bh=laniH5UgS3DrsXSeVguJDybYLw25gKEKrpalctaeV8A=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=he6yz7qmmrKh/Al7d3X49mogAyGl2Z3vrLMNeQ1JkXT//KGHsA8cgtIpg4SIMah24
	 GcKbEdmPZyG4Ngd8kfhVShRupxdWnFLzxYMTFMR1oZQUTAGIVqo1veltX58tCnXVSS
	 +mHgyA01ATlJz/xaagh3A9PpfXv4ujQrt078lfOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68597F8014C;
	Wed, 22 Jul 2020 15:44:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFA58F8014C; Wed, 22 Jul 2020 15:44:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EC11F80139
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 15:44:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EC11F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JtEvPKKk"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 349E62071A;
 Wed, 22 Jul 2020 13:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595425487;
 bh=laniH5UgS3DrsXSeVguJDybYLw25gKEKrpalctaeV8A=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=JtEvPKKk9ePwlbsUXe8JIGCNQffTKaHbDfykpD21/3zHX3D3gT0MMTXMr7SBk5bpS
 wQdGbvtpZT0xMqxLYHHRwk4cEyamAcnmxybYuGW04ts+28PbaXmStFP1+WQDJF+09F
 EUmnIcSkI84ICarie4DxC6YUhrDV+O44MfHCfpHw=
Date: Wed, 22 Jul 2020 14:44:34 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shifu0704@thundersoft.com,
 nikita.yoush@cogentembedded.com, rikard.falkeborn@gmail.com,
 devicetree@vger.kernel.org, yuehaibing@huawei.com,
 kuninori.morimoto.gx@renesas.com, corbet@lwn.net, cychiang@chromium.org,
 l.stach@pengutronix.de, dinghao.liu@zju.edu.cn, jbrunet@baylibre.com,
 perex@perex.cz, dmurphy@ti.com, linux-doc@vger.kernel.org, afd@ti.com,
 robh+dt@kernel.org, lkp@intel.com, pankaj.laxminarayan.bharadiya@intel.com,
 colin.king@canonical.com, tiwai@suse.com,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>, alsa-devel@alsa-project.org,
 keescook@chromium.org, tzungbi@google.com, linux-kernel@vger.kernel.org
In-Reply-To: <20200719153822.59788-1-grandmaster@al2klimov.de>
References: <20200719153822.59788-1-grandmaster@al2klimov.de>
Subject: Re: [PATCH for v5.9] ASoC: Replace HTTP links with HTTPS ones
Message-Id: <159542547441.19620.12700618394214218697.b4-ty@kernel.org>
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

On Sun, 19 Jul 2020 17:38:22 +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Replace HTTP links with HTTPS ones
      commit: 5856d8bd308f9467cefa65d04e184a56a3977559

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
