Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEF270317A
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 17:24:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED568868;
	Mon, 15 May 2023 17:23:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED568868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684164258;
	bh=hwFt3XcSlpGFPKSKb/srdnZvirLpBso83ne8bsaFcOY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qI9u743RXrSEmGNnOI620QPFv/6RZgk/pDV9mFy1BIbRfweUSMWlKn813JJxzp2Qf
	 sMYOFf9kSnFXtJEI84F2VjM9UK8wzxXu9ga4wEfIAwN08iGTWaBQytxgJ40lPjpILp
	 v2YqtBQHF1OxLMfMvTLjCQgulAUXsLdILarVWRv0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A7BDF80564; Mon, 15 May 2023 17:22:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73915F8059F;
	Mon, 15 May 2023 17:22:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD672F80557; Mon, 15 May 2023 17:22:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C22AFF8016D
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 17:22:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C22AFF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kqif5a3B
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 558AB6264F;
	Mon, 15 May 2023 15:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4EAC4339C;
	Mon, 15 May 2023 15:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684164124;
	bh=hwFt3XcSlpGFPKSKb/srdnZvirLpBso83ne8bsaFcOY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kqif5a3BaTSUfhbgUdfjUF8phWtFkIgJ6f7F+w7R3uI7GKqacOryjPG39xmHamFw8
	 TetWoNwWBTO7SrPstSzMPcZITgvomyC1FgeddGFbIF9DnVBnJFcJZ/pagSSd3/kmlK
	 zW3DoNSxMkGO8mhhildIoEKkWmX/kU+CxQUtHeMcaFZGqxZautLLK2hPvUjknHooRY
	 Xp3A2nhIaOKrAA1wmA41mFJd1CdOe8PqCugLnUoahakUJaEJYpEVi6RLxTLnfmj+pX
	 c6RuIgey9127bZu5z460bp1llmcVyRkZwIh8z+RV/DVuubpRu+N/qVyXZUDzm+Lzsm
	 MRa9kgaTB5heg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com
In-Reply-To: <20230512105642.23437-1-peter.ujfalusi@linux.intel.com>
References: <20230512105642.23437-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Use set_get_data() to send
 LARGE_CONFIG message
Message-Id: <168416412293.413889.4195155242076508656.b4-ty@kernel.org>
Date: Tue, 16 May 2023 00:22:02 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: YMTSZ6FVU73QTUPOLJLNW3ZSVMUP2SVW
X-Message-ID-Hash: YMTSZ6FVU73QTUPOLJLNW3ZSVMUP2SVW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YMTSZ6FVU73QTUPOLJLNW3ZSVMUP2SVW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 12 May 2023 13:56:42 +0300, Peter Ujfalusi wrote:
> Instead of open coding the sending of sink format of the copier with
> LARGE_CONFIG_SET message, use the proper function to do so.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: Use set_get_data() to send LARGE_CONFIG message
      commit: 7a975e9b3c94f4024944bc72234f7a24a3816590

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

