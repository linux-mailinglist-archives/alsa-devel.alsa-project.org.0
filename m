Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD9895A162
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2024 17:29:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25AB383E;
	Wed, 21 Aug 2024 17:28:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25AB383E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724254142;
	bh=KtFrt9WfErChRtcLn7HkhtzBOi0BwJCKu2TQs5yEJko=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZNS/a8uCkUCQJGm5BYcN+ScmGDGkF7eUsLhzua291NY3Pr35ggOXQ1Yawo15C49fE
	 3wazg2YqDhvnkh9fqBmLlrqeTx7RZFLFDcBOPlHpvYDTXQJI4ogvoUEV26JYufwdMu
	 OvpctQ3hfPuWn0v7kkupBSSvn4LD6knxvQziFALY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF27CF805A1; Wed, 21 Aug 2024 17:28:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DF9FF805AD;
	Wed, 21 Aug 2024 17:28:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0B58F80517; Wed, 21 Aug 2024 17:25:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE1B6F8025E
	for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2024 17:24:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE1B6F8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=t8zD01d1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2AAEEA41D67;
	Wed, 21 Aug 2024 15:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCE18C32786;
	Wed, 21 Aug 2024 15:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724253893;
	bh=KtFrt9WfErChRtcLn7HkhtzBOi0BwJCKu2TQs5yEJko=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=t8zD01d1WE1dJSFTPtWnx3Sh5orii5BzZcFXYPPXB5EtmUSilq7J5IxQIygEq/Che
	 FI9mU+4bqHUmrW+mXUxOBYPoLmOGN62Ggtfyg9gQUoADX4c5Ft2lK6mIOZ/NHhsowJ
	 FG6/DEFJGmue9CUI3qBpKsVqXel35YVN2kbq5vPDHJaG+J7qqrZg6rAJ6kDrXtJTrF
	 EXI+yxclGVLxt7enY2/caw1wCCWMH9YPCzaOp6+MV4IAzufZjtZx6puv6BJBYqw3I7
	 qP5r+g6eKE1Zwoy14LE3tpNmhi6sY4yJ2gQTEf5XRQ9eJwb8RxHD7vYcObJCqiqrQW
	 9EJgUvNiL5Ldg==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, cristian.ciocaltea@collabora.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240821064650.2850310-1-Vijendar.Mukunda@amd.com>
References: <20240821064650.2850310-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: SOF: amd: remove unused variable from
 sof_amd_acp_desc structure
Message-Id: <172425389056.1704682.17614913530491434962.b4-ty@kernel.org>
Date: Wed, 21 Aug 2024 16:24:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: 3ZIDDN6XGE3ZD33MW2WQLWCTUHQ34Q3O
X-Message-ID-Hash: 3ZIDDN6XGE3ZD33MW2WQLWCTUHQ34Q3O
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ZIDDN6XGE3ZD33MW2WQLWCTUHQ34Q3O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 21 Aug 2024 12:16:50 +0530, Vijendar Mukunda wrote:
> Remove unused structure member 'rev' from sof_amd_acp_desc structure.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: amd: remove unused variable from sof_amd_acp_desc structure
      commit: 61c80c77b4f35e229347551d13e265752f067151

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

