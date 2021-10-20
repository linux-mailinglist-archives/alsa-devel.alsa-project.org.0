Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB45E434F92
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 18:02:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F3FE1689;
	Wed, 20 Oct 2021 18:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F3FE1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634745730;
	bh=yZQGqcixn3akt3DO+10qEkc/glUASyUfxkV9M8n6qCc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uJvG1OMaOmxlfepHcZHxAs7Ao95rWb3HR2td98dW2i951iOLTEuDxX3Qi+hhpKZam
	 X+S3szTIARaQtrxm+05kFnBhxjhCC/RSMWweHmLuJS6S6AqD2Z/DKTMDIgCx8xcufi
	 McH3zYMhBlxvKJjNwno7iPaKO6Dt1PR5XUAVfAlo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDC6DF80253;
	Wed, 20 Oct 2021 18:00:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E14AF80229; Wed, 20 Oct 2021 18:00:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A66FBF800ED
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 18:00:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A66FBF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Rjt9JHUW"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82FF8611F2;
 Wed, 20 Oct 2021 16:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634745638;
 bh=yZQGqcixn3akt3DO+10qEkc/glUASyUfxkV9M8n6qCc=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rjt9JHUW7MQXkOkcU+8UEdlOyGBRl7yVL+E94b+xSJ5dQHIrlLkVTRtf29Wd/VLB2
 A7/QP51NKa47c1EymIrdVwvzHHMu6d7lDcxXEJNAGJmOc6mbLCCk5k0YnjP9L2hfQe
 UzBRl8dXLtF6i6mbyT8dltAzy0mTIaD3d8a/bhEHltOds57SjD1ElmX0KCtWA36KLX
 h3mgWwwuOJjzrDL/4ffEb6woupTaTuceG+8MvBQ5T9YRuJjGeVSJA7cVRiVX+2hZoT
 SBAotHk0MO2QxQaGcu3F+JlKDk6DdBODZ8+UPno5XJrAtMWWbjswQeoo/oMfZizaLF
 ChYR4Px6Hb4Fg==
From: Arnd Bergmann <arnd@kernel.org>
To: soc@kernel.org,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: Re: [PATCH v3 0/2] arm: ep93xx: CCF conversion
Date: Wed, 20 Oct 2021 18:00:30 +0200
Message-Id: <163474562303.2274953.3990592094326359852.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211018103105.146380-1-alexander.sverdlin@gmail.com>
References: <20211018103105.146380-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Nikita Shubin <nikita.shubin@maquefel.me>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org
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

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 18 Oct 2021 12:31:03 +0200, Alexander Sverdlin wrote:
> This series series of patches converts ep93xx to Common Clock Framework.
> 
> It consists of preparation patches to use clk_prepare_enable where it is
> needed, instead of clk_enable used in ep93xx drivers prior to CCF and
> a patch converting mach-ep93xx/clock.c to CCF.
> 
> Link: https://lore.kernel.org/patchwork/cover/1445563/
> Link: https://lore.kernel.org/patchwork/patch/1435884/
> 
> [...]

Applied to arm/drivers, thanks!

[1/2] ASoC: cirrus: i2s: Prepare clock before using it
      commit: f4ff6b56bc8ab2fcad6885813cd28ccc81224981
[2/2] ep93xx: clock: convert in-place to COMMON_CLK
      commit: 9645ccc7bd7a16cd73c3be9dee70cd702b03be37

       Arnd
