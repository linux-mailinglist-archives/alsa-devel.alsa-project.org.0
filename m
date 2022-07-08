Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AF356C163
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 22:50:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A4C8825;
	Fri,  8 Jul 2022 22:49:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A4C8825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657313424;
	bh=TNQrS3tTDqR7lZD0smrYAAnJl8bC+8AwfRdQfUueIUg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nWiGSUuXkk9Jwn6wvru83VGZPQ7vVw1akz08D8UpwNcARQZJOSvendiTTUAmu/w6d
	 pzUj2xFNoZPW05octV71/8jk7iqGHSA4E9Yw2BPfaS8c4ueBqvvAY7GRYh+F+9n5g9
	 DNfKbNT7dnkQr1Gjqk0vAUYgtVI62VFDO7Ks+F7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C84BF80571;
	Fri,  8 Jul 2022 22:47:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46404F80570; Fri,  8 Jul 2022 22:47:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8564F80563
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 22:47:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8564F80563
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rHo7a7eK"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7CC78628D5;
 Fri,  8 Jul 2022 20:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD31C341D7;
 Fri,  8 Jul 2022 20:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657313258;
 bh=TNQrS3tTDqR7lZD0smrYAAnJl8bC+8AwfRdQfUueIUg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rHo7a7eKOPAYFDn5NwlXAF+xTLj7RDD75eU0RO7O5LEKqUnvhGYBffZoVeUjJQppw
 IImj6qRIRByh4UXZhZUz1j+iX5zBjGyUdrQu++DfXwBSRMpeqAHH4dUmE2Hma55YmC
 cF5rhU/u682smQGoRu9cy4cpvPrfgYUgnh/3ACcyzox2Gwg35VvrtkGqBPL3hNdUlI
 yJ2BmpolZKJ8izPOQt2P+gKfvobctPlIPkdT+yq9/xre/GTuytahOTs2Q1QcLbFnVV
 bdT8KfZo6FvLdLF3D02IySldGWNw/LAW82BtK2Q4Pre5NmYMlBOzoEoeQMelVuP0sM
 g9JWD8oLX0XPQ==
From: Mark Brown <broonie@kernel.org>
To: brent.lu@intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220708110030.658468-1-brent.lu@intel.com>
References: <20220708110030.658468-1-brent.lu@intel.com>
Subject: Re: [PATCH v8 0/2] ASoC: Intel: sof_cs42l42: adding support for ADL
 configuration and BT offload
Message-Id: <165731325483.2467307.752813461864251608.b4-ty@kernel.org>
Date: Fri, 08 Jul 2022 21:47:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: libin.yang@intel.com, pierre-louis.bossart@linux.intel.com,
 cezary.rojewski@intel.com, ajye_huang@compal.corp-partner.google.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com, gongjun.song@intel.com,
 tiwai@suse.com, ranjani.sridharan@linux.intel.com,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 mac.chiang@intel.com, yung-chuan.liao@linux.intel.com, CTLIN0@nuvoton.com,
 akihiko.odaki@gmail.com, muralidhar.reddy@intel.com,
 peter.ujfalusi@linux.intel.com
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

On Fri, 8 Jul 2022 19:00:28 +0800, Brent Lu wrote:
> 1. Add BT offload fetch to cs42l42 machine driver
> 2. Support cs42l42+max98360a on ADL platform
> 
> V8 Changes:
> - split the V7 patch into two patches; one for BT offload feature, the other for new board config
> - change topology name to sof-adl-max98360a-cs42l42.tplg
> - remove useless variable 'ret' in create_bt_offload_dai_links
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: sof_cs42l42: support BT offload audio
      commit: 1460b85daa0af45c1cd2c5e20133ce413184e3d6
[2/2] ASoC: Intel: sof_cs42l42: add adl_mx98360a_cs4242 board config
      commit: cd486d37493357369ec1d8f130d93806418def84

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
