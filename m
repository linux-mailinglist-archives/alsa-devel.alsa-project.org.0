Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73728694C53
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 17:20:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E32A86F;
	Mon, 13 Feb 2023 17:19:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E32A86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676305236;
	bh=/OvkeG9wKo9iaI6Zk4528VnQPTqz6+8K6mJg09DPqXE=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aUCPCYuP4q6/DhAWDf7n2+JDtwCYnQXW8vxUxUi1V8C4h1UzdaIezSLYEBfwqUpr4
	 cAaFgaT1gSJTEOiNyBDnrDbIlNfZZabOJL1VOidXLvithWeki1jL97NNB5Oqe5VLbp
	 NjgdcEtk2lnz9UituQinywYiQ82788I/8zNnEqRo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A60C2F80527;
	Mon, 13 Feb 2023 17:18:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 042E4F8051F; Mon, 13 Feb 2023 17:18:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D473F80051
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 17:18:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D473F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=irRiXqCG
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7BB52B81074;
	Mon, 13 Feb 2023 16:18:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1741C433EF;
	Mon, 13 Feb 2023 16:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676305123;
	bh=/OvkeG9wKo9iaI6Zk4528VnQPTqz6+8K6mJg09DPqXE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=irRiXqCG/t7HBS3w36NGh3N5EJ/rBHj76kxAOIkQA08ApUpaJq5/SUHekOg3NO/zz
	 vmQ6Jp9u7YhGkivmt6hjVUWYOCMvBZknL4v9A7zY4SN0T3mWpWQg4CM8btBNh3BmIh
	 DIIELoX+RP1vLbB5dKRIs5/qjf/DKErMsaeeR3/FwE93Ud0TzMnFJgDm0Hny3oRAPG
	 nTRXY2FuRFkfcgzl44+kXAgNG/SYMwdOQ+6J/UVZcmNsnFocJXNjinG86GnX+3BO/d
	 0+ygc8Tvk9liOYXDudy3nqdwQGm5e8i/hHoggz2peaRtVdj1TpWS/Qt2kvA7F9SyCJ
	 RfEp8GQeUoOwg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Alexandru Ardelean <alex@shruggie.ro>
In-Reply-To: <20230213073805.14640-1-alex@shruggie.ro>
References: <20230211191315.24554-1-alex@shruggie.ro>
 <20230213073805.14640-1-alex@shruggie.ro>
Subject: Re: [PATCH v2] sound: soc: codec: tlv320adcx140: fix
 'ti,gpio-config' DT property init
Message-Id: <167630512142.2770751.16715644113922205742.b4-ty@kernel.org>
Date: Mon, 13 Feb 2023 16:18:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: VE5VGZT5N6LSHVTD46Y5EVS45UPSUNYH
X-Message-ID-Hash: VE5VGZT5N6LSHVTD46Y5EVS45UPSUNYH
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, tiwai@suse.com, steffen.aschbacher@stihl.de,
 patrick.frick@stihl.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VE5VGZT5N6LSHVTD46Y5EVS45UPSUNYH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 13 Feb 2023 09:38:05 +0200, Alexandru Ardelean wrote:
> When the 'ti,gpio-config' property is not defined, the
> device_property_count_u32() will return an error, rather than zero.
> 
> The current check, only handles a return value of zero, which assumes that
> the property is defined and has nothing defined.
> 
> This change extends the check to also check for an error case (most likely
> to be hit by the case that the 'ti,gpio-config' is not defined).
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] sound: soc: codec: tlv320adcx140: fix 'ti,gpio-config' DT property init
      commit: 771725efe5e2e5396dd9d1220437e5f9d6b9ca9d

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

