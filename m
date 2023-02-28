Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A186A5E87
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Feb 2023 19:01:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 642B6826;
	Tue, 28 Feb 2023 19:00:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 642B6826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677607298;
	bh=g/zRMqEHWvrUdMovSA/zwPxEgtx1YbVsjFwL8peZugg=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NKDZ8ZUlqGKUkY86SPm8zCNN2wloD9+Lb5CIHtmehd6WXlDogCMnXql06/+GkEBiM
	 rGYKqBdOB7zpjjOF8sPS7/GXJ6qJdkU7W5r4sK/tHqI9ev4RHUhUJ/rw4dpLhK72nK
	 vlYPgBRx9K7AYIrlieW5fur0vB/QcEydG9aItffU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55C3AF800FA;
	Tue, 28 Feb 2023 19:00:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21BF3F8051B; Tue, 28 Feb 2023 19:00:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 787E6F800BA
	for <alsa-devel@alsa-project.org>; Tue, 28 Feb 2023 19:00:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 787E6F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HZobxikk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4A8C261179;
	Tue, 28 Feb 2023 18:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BD8C433D2;
	Tue, 28 Feb 2023 18:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677607230;
	bh=g/zRMqEHWvrUdMovSA/zwPxEgtx1YbVsjFwL8peZugg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HZobxikkQG2ou9HWf9cwO80G/+gCBkcX18aLab76EEwpTtYw+lxF8IHqxBAC6+GXJ
	 BlkOzb9P9w01cIPARw6UG+mydWBCXarm5pTkQ/RmNVbBI10GrzvoGeExZLBRKCSgeF
	 I8s7vbJ7tshwQ8R5n9o9pz/Dbtic7IqxKrxQB+tV7jjiB4Idr3n6T8fDtTwoueM4Jj
	 lM9v8Ed7TbLgf5FNexWIfvjADWwcPYMGqwCU4vpk7fc5QyS+VP2xqGw6Gy7od/kMY/
	 Klpv/cAv4vLHt+IuQnw04T/aUYaxaMCCeIxFV4sFZvVOsWNjst+9TL9BqyEQMVNs7K
	 TK4UF3I2GouTA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mark Brown <broonie@kernel.org>
In-Reply-To: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
Subject: Re: [PATCH 0/4] ASoC: mt8192: Fixes from initial glance at
 kselftest run
Message-Id: <167760722797.68866.15387830398391668204.b4-ty@kernel.org>
Date: Tue, 28 Feb 2023 18:00:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-ada30
Message-ID-Hash: IHGIUW5ETXIWVGDSCZPKUPFD2VUYY32M
X-Message-ID-Hash: IHGIUW5ETXIWVGDSCZPKUPFD2VUYY32M
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IHGIUW5ETXIWVGDSCZPKUPFD2VUYY32M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 24 Feb 2023 14:03:54 +0000, Mark Brown wrote:
> This is a collection of fixes I came up after glancing through an
> initial test run with the Spherion Chromebook on KernelCI.  There are
> more issues flagged, this is just what I fixed thus far - the volume
> controls on the MT6359 have issues for example, and a lot of controls
> aren't marked as Switches like they should be.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: mt8192: Remove spammy log messages
      commit: 5df1a5d28449f2b98ff84f69dea74b06f9b8e362
[2/4] ASoC: mt8192: Fix event generation for controls
      commit: b373076f609993d333dbbc3283b65320c7a41834
[3/4] ASoC: mt8192: Report an error if when an invalid sidetone gain is written
      commit: 05437a91173b8780692ac35313f98cac68be7c42
[4/4] ASoC: mt8192: Fix range for sidetone positive gain
      commit: ce40d93b062c0bdcd29218c12ab1dba544382dd8

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

