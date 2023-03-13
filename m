Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 968E46B816D
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 20:08:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06B5D1420;
	Mon, 13 Mar 2023 20:07:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06B5D1420
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678734529;
	bh=ZuSDX5rYmGMOCuLmkY33ZeNcxthLztyqURCdRdw8JL0=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qRJDahsKE9smMyQ9JBsr/XRTZQ48LDPvV99bbFdgxp9xHqpnRvVh9CJ8qHqWfwRFo
	 ZWVUBWAzmiL9wpK5YBo+d3G0/r7b3WJGOgy8zEBuo5SphtNr3UovWmsepPwnYc0eHi
	 bZC0XPMHFZq7u291klzdcau4PK9qifXPL3sykTIQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FAAFF80425;
	Mon, 13 Mar 2023 20:07:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A56BF804B1; Mon, 13 Mar 2023 20:07:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6474CF8016C
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 20:07:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6474CF8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jrEcryFr
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8C1866148C;
	Mon, 13 Mar 2023 19:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92246C4339C;
	Mon, 13 Mar 2023 19:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678734463;
	bh=ZuSDX5rYmGMOCuLmkY33ZeNcxthLztyqURCdRdw8JL0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jrEcryFrfiEjYX1bmlj29MXtjQk2hy12glEHEoFlP1MFwebAY/Ns+JNESdIERY33e
	 GKVNw9iA4EuK7OL10MuQPb20YdS0rYgWWAPMMMKlqkyPvbh9YfT0nKwCsAhtJ7Z7pM
	 vrRvHQc8nV2uZ2UJOPLa2Xs2gM0IxPTSEPmmteihd/tKw3n8pXqHNYgXQbHuDEvCmn
	 t8dLr0LunUlQJNHtp+/5kjIiI84ExfnXkfmFrkcmDK3kqajm5oK/9gczOJYyigTfpz
	 zoA5Ksy4MHDCzfJzpdLSZp4njNson42lyPr8mQHq4TmWgPcIGMgkipUcSLT2pvXMNb
	 dv2J9ICdIiLyQ==
From: Mark Brown <broonie@kernel.org>
To: kiseok.jo@irondevice.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Tom Rix <trix@redhat.com>
In-Reply-To: <20230309140959.2616497-1-trix@redhat.com>
References: <20230309140959.2616497-1-trix@redhat.com>
Subject: Re: [PATCH] ASoC: SMA1303: set sma_i2c_regmap
 storage-class-specifier to static
Message-Id: <167873446131.106067.2236196636490693766.b4-ty@kernel.org>
Date: Mon, 13 Mar 2023 19:07:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: OQ2UCANZ3JISSYILRJYZYC4EYX53HO6L
X-Message-ID-Hash: OQ2UCANZ3JISSYILRJYZYC4EYX53HO6L
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OQ2UCANZ3JISSYILRJYZYC4EYX53HO6L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 09 Mar 2023 09:09:59 -0500, Tom Rix wrote:
> smatch reports
> sound/soc/codecs/sma1303.c:1594:28:
>   warning: symbol 'sma_i2c_regmap' was not declared. Should it be static?
> 
> sma_i2c_regmap is only used in sma1303, so it should be static
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SMA1303: set sma_i2c_regmap storage-class-specifier to static
      commit: d7d103d1779c3d0bc4d55f2802930a6b067450c0

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

