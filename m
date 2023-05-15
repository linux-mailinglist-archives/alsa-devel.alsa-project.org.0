Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A5870319E
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 17:32:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A93D820;
	Mon, 15 May 2023 17:32:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A93D820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684164772;
	bh=bh+rWnlrEX4mfRUalnto+ilQHZ42gUVOd05fKlVuB68=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J8VYWFjA/e0SjYNlDU2u9b9cAxyRz/jB60Se6jU6Z+ZZ9mi5fZKtn+8KYQ410AnHP
	 6EIIjsVtL+PB0Ou1/elsPNut2FYTJBJOYLx415DXP279nJHXIrH05YJA18hufRr6pX
	 lu35bB3oGAZV09HFuvwOgWNoRXTt/foDazju9X20=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 876DDF80557; Mon, 15 May 2023 17:31:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B9BDF80557;
	Mon, 15 May 2023 17:31:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47DAFF80549; Mon, 15 May 2023 17:31:22 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B47F8F8016D
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 17:31:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B47F8F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jPK4CyjL
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 65A75625DF;
	Mon, 15 May 2023 15:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05F76C4339C;
	Mon, 15 May 2023 15:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684164669;
	bh=bh+rWnlrEX4mfRUalnto+ilQHZ42gUVOd05fKlVuB68=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jPK4CyjL9O82Mnr1fcM4oSn02LEtklEZS0k3uUFDNRFDmLmUYbrv8uaJCeGP5EZsU
	 sDv5Q1ESDHMkumWDFbq6I+w+lP4+MVlFC10egJuPbd000ctiTlQnWkmqvm/eK4CEq2
	 5b9wccTPKPBnxAEFz+4xsI5AO3JOaOk8CPhnY7hbEetT0PX697y4BDZeMej1XyaWxn
	 AU7JWI6oGzTXw1KIUFUq8skHVZ3zwj0c2fFYlqZhj6cjiY4maafW6Gt+26vNMCjswr
	 laesTAy54IDOG9BtKy6ISuvUZBdtngDJQxuuyKW9fEnMuKpcJgjJ5bOk6ssFPUbiRP
	 I/ngHlTfkfpZg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com
In-Reply-To: <20230515103336.16132-1-peter.ujfalusi@linux.intel.com>
References: <20230515103336.16132-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/9] ASoC: SOF: ipc4-topology: Improve the audio format
 selection logic
Message-Id: <168416466783.415808.15809561764463856729.b4-ty@kernel.org>
Date: Tue, 16 May 2023 00:31:07 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: 5XLZ6PQHM6ZVQZWUIRWL3K5AJ5VFRD6G
X-Message-ID-Hash: 5XLZ6PQHM6ZVQZWUIRWL3K5AJ5VFRD6G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5XLZ6PQHM6ZVQZWUIRWL3K5AJ5VFRD6G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 15 May 2023 13:33:27 +0300, Peter Ujfalusi wrote:
> Improve the logic to account for the current restrictions in topology while
> making it extensible for future topology modifications.
> 
> The current topology definitions assume that input/output formats come in pairs.
> For example even if there's only 1 output format for a module, we add 3 output
> formats to match that of the input format count with the same parameters.
> This is unnecessary but we have to deal with it until the topologies are
> modified.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: SOF: ipc4-topology: Handle input/output audio format special case
      commit: 4c7873d60958ed1895b6552fb1e15fa2bbf06cad
[2/9] ASoC: SOF: ipc4-topology: Add a helper function for output format selection
      commit: 523042f63febca24cbf9cf83729044c3dbaa9706
[3/9] ASoC: SOF: ipc4-topology: Move the call to init output format
      commit: a2e07c3319f79f7305641b98d32765dc5b607873
[4/9] ASoC: SOF: ipc4-topology: Rename sof_ipc4_init_audio_fmt()
      commit: ae45aebe45600a85c410280badec6b209979cf7c
[5/9] ASoC: SOF: ipc4-topology: Handle output format special case
      commit: f1ceebdbe8d8915edb64045853ab23db8ddade60
[6/9] ASoC: SOF: ipc4-topology: Add a new helper function to get the valid bits
      commit: 35171c1a907cb1226ba190685c38f62ef02bbed8
[7/9] ASoC: SOF: ipc4-topology: Modify the output format selection logic
      commit: 1af13f221ac331e2d493896df5315fb8b211b4aa
[8/9] ASoC: SOF: ipc4-topology: New helper to check if all output formats are the same
      commit: f37b702cb6f76963013af951737e49e61bf35771
[9/9] ASoC: SOF: ipc4-topology: Modify input audio format selection logic
      commit: 5a56c5335d36decbdcb80900c665360fbbd1042a

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

