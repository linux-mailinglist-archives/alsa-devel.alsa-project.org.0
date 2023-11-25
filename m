Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 060A67F8A45
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Nov 2023 12:42:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C8CCE93;
	Sat, 25 Nov 2023 12:41:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C8CCE93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700912529;
	bh=TvuNzbl35e3MpCZIoEfJstVJW2MqliElrJtb5bQ8+gU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l6veL83Jzx82+rNgAduDw77QfmyaGL2j+TToBwrHwFqWbyxWvQwQUA3P7xVp3dQt8
	 XUIDJrhOjaoXDFjo/+7NRYN47Mai8VaozzaxuuXC3j78Jwgeg4Jrq5YDzk3zSg7Oyi
	 AensEhpkksGjwOiqjSnTpMYzUd2oTdDwSkt+MZ8w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1284F80549; Sat, 25 Nov 2023 12:41:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFB43F8057A;
	Sat, 25 Nov 2023 12:41:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEE18F80310; Sat, 25 Nov 2023 12:37:20 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 22ACEF80249
	for <alsa-devel@alsa-project.org>; Sat, 25 Nov 2023 12:37:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22ACEF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LkNh+1u7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 61887603E0;
	Sat, 25 Nov 2023 11:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A971C433C7;
	Sat, 25 Nov 2023 11:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700912233;
	bh=TvuNzbl35e3MpCZIoEfJstVJW2MqliElrJtb5bQ8+gU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LkNh+1u72KZk43ZzWQa2D6JaXR2js2tPJ03b9hRxmVM5NMtZMB6SMMWMtqzR4g2wP
	 j9G8txWuNDNLJSQ7LCOktTSsK82oJrQRbGZSdaLOVLYaDpmynNyHACr6oq50h8UV52
	 GEPjWdxs6ckT2T+Rn+3afGOpYNVbiBAPI6GzeSWXuihr+i01l2wJMwOrRbClgm6LVE
	 r4UgpA21n3IKkuKf8MdsKB2VQFfTt8wfgPWiXedwkAIWmUQ7BM+tBymnJ1W2GXycqY
	 67Z2nElL9TkuKs8VDr4asN2+ksSCaSaMBe/eInmuCJdRFuNDj9RxYSoHRdo+ZAcL2l
	 0nTsOgK9ALpBw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
In-Reply-To: <20231124135743.24674-1-peter.ujfalusi@linux.intel.com>
References: <20231124135743.24674-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: Extend the enabled DSP core handling
Message-Id: <170091223102.2632109.354496751608471459.b4-ty@kernel.org>
Date: Sat, 25 Nov 2023 11:37:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 2DBAU3JF5TOIIHP4JSIGNNJGXKBZAPZ5
X-Message-ID-Hash: 2DBAU3JF5TOIIHP4JSIGNNJGXKBZAPZ5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2DBAU3JF5TOIIHP4JSIGNNJGXKBZAPZ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 24 Nov 2023 15:57:41 +0200, Peter Ujfalusi wrote:
> In the current code, we enable a widget core when it is set up and
> disable it when it is freed. This is problematic with IPC4 because
> widget free is essentially a NOP and all widgets are freed in the
> firmware when the pipeline is deleted. This results in a crash during
> pipeline deletion when one of it's widgets is scheduled to run on a
> secondary core and is powered off when widget is freed. So, change the
> logic to enable all cores needed by all the modules in a pipeline when
> the pipeline widget is set up and disable them after the pipeline
> widget is freed.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: ipc4-topology: Add core_mask in struct snd_sof_pipeline
      commit: 0376b995bb7a65fb0c056f3adc5e9695ad0c1805
[2/2] ASoC: SOF: sof-audio: Modify logic for enabling/disabling topology cores
      commit: 31ed8da1c8e5e504710bb36863700e3389f8fc81

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

