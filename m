Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 665917A6953
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 19:00:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69941820;
	Tue, 19 Sep 2023 18:59:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69941820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695142839;
	bh=nA0itQT7NZ8n4SSM5OF0Afqx3C25Asq5jjW0PV3Z/jU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OeWU1fbztNZZxnZVz91kN5nSclErvmEb/e0oI5NhKeucbiVGPDOCmLpBkecrhiFUN
	 7C2wl+SHfT8me7QHqdQmsLigbCNy6gLv3yP5o77XYD3OuCMJnRW8yK8N3M3RSGTnMv
	 FP3dxoWBQKz5BcRs5xAkMzZ1xim+OE87xQ37h1cc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 920CFF80558; Tue, 19 Sep 2023 18:59:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04960F801F5;
	Tue, 19 Sep 2023 18:59:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45176F8025A; Tue, 19 Sep 2023 18:59:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F27C6F80125
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 18:59:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F27C6F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=X3ec3RrV
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3808D616CA;
	Tue, 19 Sep 2023 16:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B50A6C433C7;
	Tue, 19 Sep 2023 16:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695142765;
	bh=nA0itQT7NZ8n4SSM5OF0Afqx3C25Asq5jjW0PV3Z/jU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=X3ec3RrVPnuIWRJFJgs/CnQiNSx3PFwIDqCofTmVAuT59fWGzueP0OtXXvvURWLLn
	 3NPG2JmXXLcyD8K/m1AwLzsO8ikkpWhJdNw8gz626aNaF6J0qAPUf9yPa38ll34O5N
	 zWfF6KwiRiJsvlFgPe6Rn4JS6CUi8YvbGIoJFw75uD59y7DM7TnxYdZuCGohJMrKpD
	 sadZ3j6haR1WFwDsPLTYUitJ953dX60A0LeJ607uwLRUW9Lid9D6uq83bnNBpZ90w1
	 ohRtNyLTCvmNlAbtVADdbodRkJsgY6zxZeDATi/xwCt7OoWCw/EqsWGc9KPP+E0kQ3
	 sP+mFhhf7E0oA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com,
 kai.vehmanen@linux.intel.com
In-Reply-To: <20230919083209.1919921-1-yung-chuan.liao@linux.intel.com>
References: <20230919083209.1919921-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: hdac_hda: add HDA patch loader support
Message-Id: <169514276343.127651.9089490034276481056.b4-ty@kernel.org>
Date: Tue, 19 Sep 2023 17:59:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: TZSE434E77EEB4SO3IKCXS6JPALVFHQH
X-Message-ID-Hash: TZSE434E77EEB4SO3IKCXS6JPALVFHQH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TZSE434E77EEB4SO3IKCXS6JPALVFHQH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 19 Sep 2023 16:32:09 +0800, Bard Liao wrote:
> HDA patch loader is supported by legacy HDA driver. Implement it on
> ASoC HDA driver, too.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdac_hda: add HDA patch loader support
      commit: 842a62a75e709b3efb5020a25a225fa51748c5f9

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

