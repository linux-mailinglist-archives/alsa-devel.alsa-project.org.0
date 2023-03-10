Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 622656B488C
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 16:03:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 832C618CB;
	Fri, 10 Mar 2023 16:02:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 832C618CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678460623;
	bh=Vdvs+yw3NOP4d/F28x2YUI9Mi00oG7OrQIUrmGGZgsw=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kTCXKkbJOLMrOMZX8mwVpi0JWNvrZfhzDhvaRJUkZ4GeSNyJEEprArlKzNWbQaJvS
	 BcpJUCzRVQKn8MqMBQnNIV/9nraCOSyXxv40lgkWH4xUMW4vEXQ3SqTefiuxs2iA7p
	 Jz5EF7k4jeHL66/dnOT8JiSG574YTEG9UmcmdQTI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CAA1F80236;
	Fri, 10 Mar 2023 16:02:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8232F80482; Fri, 10 Mar 2023 16:02:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B444F8007E
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 16:02:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B444F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rD/CuzaJ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 89AA161A66;
	Fri, 10 Mar 2023 15:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2E6C433D2;
	Fri, 10 Mar 2023 15:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678460555;
	bh=Vdvs+yw3NOP4d/F28x2YUI9Mi00oG7OrQIUrmGGZgsw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rD/CuzaJcPNMWhhXnguLLReJzC6vy3BMl64hLPP2bB5nUPMLtaBroHTpSOgfFFBGl
	 UJG0xpFl3urRlwhbVWMqcET8GKjwGDSNYxXn1pHaHOWzOoURI70qf+Tqe4G9I8PFMY
	 tPTvvw8h0a3L5FnHERxfFTEV/JQ2JZhnsnYHtm34J4BnD5VV8sx/MxExoXnoj+zrQt
	 nXENrllsz/26xrTUMMvU18tle3jYPzYXBG77IFcDz11PCiwffevevxNr5XkaBaB+1H
	 zmVvfYr98Wp+Bfm+yFnGD9yg6FxYa+cBFWuA+Iy1u9EZHVH+UKodZzSoTvQeoe4Puy
	 7QNQUt4fnugZA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230117120830.23851-1-peter.ujfalusi@linux.intel.com>
References: <20230117120830.23851-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda-loader: use SOF helper for
 consistency
Message-Id: <167846055304.924369.12515577947591832121.b4-ty@kernel.org>
Date: Fri, 10 Mar 2023 15:02:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: K2FNAUB7ZGESEZCOR3OVVYUILGAAMHIF
X-Message-ID-Hash: K2FNAUB7ZGESEZCOR3OVVYUILGAAMHIF
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K2FNAUB7ZGESEZCOR3OVVYUILGAAMHIF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 17 Jan 2023 14:08:30 +0200, Peter Ujfalusi wrote:
> Update code to remove mix between legacy and SOF definitions. No
> functionality change.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda-loader: use SOF helper for consistency
      commit: 1d045d77756d07495ce379343455b1f829fe737d

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

