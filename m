Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B939F6D44EB
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 14:53:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 138B5200;
	Mon,  3 Apr 2023 14:52:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 138B5200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680526383;
	bh=8aJ44bd4d5edAPiqMTaOF1QxLbXCmKzlPKhW1WxDuCE=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WDSbOSniltlifTuNwDQTVGfDIRAGq/bk6mpQQtU0da8AzXBoN2kVQa44l2VmksZi8
	 8NnOSHoM6fndTUp4TbA/XWvfv2Ly4eyuK8cj4bgMp7PmbX66KqRQrDwwIpG6d9n6sE
	 6wqWgT9PsgmHm3DuM7q4f7qnIgZWWIr+Z6RjIGKI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3252EF80482;
	Mon,  3 Apr 2023 14:51:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 623F7F80495; Mon,  3 Apr 2023 14:51:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5F6EF8015B
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 14:51:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5F6EF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oXKzBdcx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7430561A82;
	Mon,  3 Apr 2023 12:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA71C4339E;
	Mon,  3 Apr 2023 12:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680526271;
	bh=8aJ44bd4d5edAPiqMTaOF1QxLbXCmKzlPKhW1WxDuCE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oXKzBdcxbxgeFTUWlai3aKjiIJShGmjXISgL6d0kQ7DgKNKvFLd74pMIAO1XSVhXt
	 7Hn4Aa/4E3UT/sZbggtP0IH/9w+VIPTqzfVrBwRswAkIAUVzwwJJK9y0Y39IPZa1gl
	 syvAKBGapk3Y5hm1j5ERlySINC5tO5CFq8rxerVc7F85axKXdeUHrqzNDwdYGGOmSS
	 2sk1p81wUNf727vvWmaFC0eKlkqwqmkLvh/J/sRw34xjjhdLW28g8RDk/ammok9o4Y
	 IVjPVW6gj0lpivAiJ/b263L6Z1qrXfv2ZjYEmZWyDS90KvEZI7oCXgj1P0qm74/vqz
	 mENnD8DF4gzsA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230403090909.18233-1-peter.ujfalusi@linux.intel.com>
References: <20230403090909.18233-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH for v6.3-rc] ASoC: SOF: ipc4-topology: Clarify bind
 failure caused by missing fw_module
Message-Id: <168052626818.36561.15470216778715648904.b4-ty@kernel.org>
Date: Mon, 03 Apr 2023 13:51:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: J47LFQGMRZYG4XVKEY4J3MQGYGGKZZT6
X-Message-ID-Hash: J47LFQGMRZYG4XVKEY4J3MQGYGGKZZT6
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 guennadi.liakhovetski@linux.intel.com, stable@vger.kernel.org,
 error27@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J47LFQGMRZYG4XVKEY4J3MQGYGGKZZT6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 03 Apr 2023 12:09:09 +0300, Peter Ujfalusi wrote:
> The original patch uses a feature in lib/vsprintf.c to handle the invalid
> address when tring to print *_fw_module->man4_module_entry.name when the
> *rc_fw_module is NULL.
> This case is handled by check_pointer_msg() internally and turns the
> invalid pointer to '(efault)' for printing but it is hiding useful
> information about the circumstances. Change the print to emmit the name
> of the widget and a note on which side's fw_module is missing.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: Clarify bind failure caused by missing fw_module
      commit: de6aa72b265b72bca2b1897d5000c8f0147d3157

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

