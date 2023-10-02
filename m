Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D68F37B562B
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 17:18:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E13DDE5;
	Mon,  2 Oct 2023 17:17:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E13DDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696259917;
	bh=1Ecq9FcNeNQKy/nLbdL4o0gFyABuzHnsbQnTALQyOdY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jgLIGj6N6Nst12xr/t5Fbb4S+XZuGJ9xPPbndCj4ICH94krzucBxoC8YKwhTYp6xd
	 nkDqPltLeb2mwoWs1yZgz1HzvcFcBsNisPMVlwxcEV7G7VoM+kOHmfxEDi2a4tdmmi
	 4eDQtF8+Bx3Ov/H2rYXM9yge2hDFdu7fJNWeSv/g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE37BF80558; Mon,  2 Oct 2023 17:17:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98E1BF80310;
	Mon,  2 Oct 2023 17:17:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48503F8047D; Mon,  2 Oct 2023 17:17:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61C50F802E8
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 17:17:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61C50F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HP6NQePb
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BE3C460EC6;
	Mon,  2 Oct 2023 15:17:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B381FC433C7;
	Mon,  2 Oct 2023 15:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696259851;
	bh=1Ecq9FcNeNQKy/nLbdL4o0gFyABuzHnsbQnTALQyOdY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HP6NQePbbyJKs8Gw3eX5IFwFzOC5N1hZ2bA7jWxpbPynU1HEi16gLM6I2n7wc/IXe
	 osIjda0X7mqfKXi1lKRGAjMR4u+BCEMUWBGTUfM19aAUolt9aUeOTqol2dY9CTOMf4
	 yEDwxGVIMyH37ULcb0yZ9iqLz5MKH2z4bCUlVYtKtS92pWs5///M3f0KudrPAbYdXs
	 0lg+9goOUNjL0bchpffPfqN0b2MoiX8bYzxnU3MEVzsrNxhsvc4w2Hg5M06Vi464l4
	 /6Uwes4HCsmh/xeOmo0qRZM4s9GDZ++sdqEgZPIpfXCLvhJyVC8CM/NnIn8MvJuIt2
	 NPMuf2LJF9e2A==
From: Mark Brown <broonie@kernel.org>
To: Matthias Reichl <hias@horus.com>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
In-Reply-To: <20230929195027.97136-1-hias@horus.com>
References: <20230929195027.97136-1-hias@horus.com>
Subject: Re: [PATCH v2] ASoC: hdmi-codec: Fix broken channel map reporting
Message-Id: <169625985045.65718.7789607105387288563.b4-ty@kernel.org>
Date: Mon, 02 Oct 2023 16:17:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: XI7QY6RYCXC5GN7UG44COAXXATPSJEXT
X-Message-ID-Hash: XI7QY6RYCXC5GN7UG44COAXXATPSJEXT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XI7QY6RYCXC5GN7UG44COAXXATPSJEXT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 29 Sep 2023 21:50:28 +0200, Matthias Reichl wrote:
> Commit 4e0871333661 ("ASoC: hdmi-codec: fix channel info for
> compressed formats") accidentally changed hcp->chmap_idx from
> ca_id, the CEA channel allocation ID, to idx, the index to
> the table of channel mappings ordered by preference.
> 
> This resulted in wrong channel maps being reported to userspace,
> eg for 5.1 "FL,FR,LFE,FC" was reported instead of the expected
> "FL,FR,LFE,FC,RL,RR":
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdmi-codec: Fix broken channel map reporting
      commit: b84b53149476b22cc3b8677b771fb4cf06d1d455

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

