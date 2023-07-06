Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 087B574A058
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 17:04:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFF7A7F1;
	Thu,  6 Jul 2023 17:04:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFF7A7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688655891;
	bh=a3v2wGBajJZF0CvLHigKspo+k63gSagvdfIpaZ/IkOc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eU1e9coH7aa5sGFC9w1WUSxHvOWVFrkaSrKdYopJKte48m6wLYIkaOSGgPn18O/Ec
	 H+92Etgiuq2AcT4x5nbpo757rPFo+5jjBc+sTHOqFQSfoi5EO2E02gVyDVgxuKgFi9
	 hhmKMwIWDQpCjwLNTfk/vjpr7Fb1OqYWsD5WY4pA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F255F80100; Thu,  6 Jul 2023 17:03:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A038FF80100;
	Thu,  6 Jul 2023 17:03:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB5DFF80125; Thu,  6 Jul 2023 17:03:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F4B4F80093
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 17:03:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F4B4F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fQDVSwz0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 39CBD604AD;
	Thu,  6 Jul 2023 15:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A539CC433C8;
	Thu,  6 Jul 2023 15:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688655826;
	bh=a3v2wGBajJZF0CvLHigKspo+k63gSagvdfIpaZ/IkOc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fQDVSwz0rwZEIcbaL/N2Nf4vurD/ORJ0ov2jommSOnKZLwV6S+Ye/oPs5ixonH9Z9
	 bWQrbkjQ7M5n7chGlgHqpULe/OXXszzpWAIECJpitEfFBASzVMypwjuvlZqj+OZEid
	 y0VNCl5Zu6lmbOcPOujV6zT7uz6qYq7YbXNRCIq1hkhb5I43J1gqtnLBOimRCdXa0u
	 3gCqKjlrt7CNhsCrJhjPh/WZ84HfEufniV9b6mSD2ZudjpPGF3aWkM859chBkySE55
	 D4oli166hf2zWGLOA8NwQsywqlSEOQEMps69Ji+gqbiBPznU5Bdz4BjTrqHzVBISFW
	 skop5VwxvNpTw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, Amit Pundir <amit.pundir@linaro.org>
In-Reply-To: <20230705124850.40069-1-srinivas.kandagatla@linaro.org>
References: <20230705124850.40069-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: q6afe-dai: fix Display Port Playback
 stream name
Message-Id: <168865582438.36989.3459774757107985233.b4-ty@kernel.org>
Date: Thu, 06 Jul 2023 16:03:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: 4GANIUUM5ODADSY4AQRRHMOWJPURKWNK
X-Message-ID-Hash: 4GANIUUM5ODADSY4AQRRHMOWJPURKWNK
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4GANIUUM5ODADSY4AQRRHMOWJPURKWNK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 05 Jul 2023 13:48:50 +0100, Srinivas Kandagatla wrote:
> With recent changes to add more display ports did not change the Stream
> name in q6afe-dai. This results in below error
> "ASoC: Failed to add route DISPLAY_PORT_RX -> Display Port Playback(*)"
> and sound card fails to probe.
> 
> Fix this by adding correct stream name.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: q6afe-dai: fix Display Port Playback stream name
      commit: 4f3fcf5f6dc8ab561e152c8747fd7e502b32266c

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

