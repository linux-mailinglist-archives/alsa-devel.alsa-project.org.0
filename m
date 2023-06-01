Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BDE719F5A
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 16:13:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FD7B206;
	Thu,  1 Jun 2023 16:12:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FD7B206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685628819;
	bh=7JEOY5KQdqPCrKUkJxJKMsT5SEyQBEO158XALTuHM6o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L8DvIZawSqOnVoKIZbgtkgieLegjGqemg1+1Ui6LfsGC2h8+KQSGT1FvvxZg7m4ts
	 C0p6spsg9XXrbMvINw3+MeYRvmVsfq/EmMtCK59my5B8Almhb0OLFlhvjKS1mzbDpM
	 c8uUULFFeMD9e34FQwDtSJYmNWA1In2u8zqoVSIQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2612F804DA; Thu,  1 Jun 2023 16:12:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4455F80132;
	Thu,  1 Jun 2023 16:12:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAB9AF8016B; Thu,  1 Jun 2023 16:12:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A445F800ED
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 16:12:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A445F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MTrqJnI3
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CC33C6459E;
	Thu,  1 Jun 2023 14:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F065C433EF;
	Thu,  1 Jun 2023 14:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685628745;
	bh=7JEOY5KQdqPCrKUkJxJKMsT5SEyQBEO158XALTuHM6o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MTrqJnI3vhI7DcD8S3xAI1nzE2botnX1sofoFfnJ5M6kI/E5atSt67JlRoxUC2+gy
	 EFjmkv8jwlN8eKpO5VpVSVNQwY1KJcvfT1V4bbLHlW0VwpEc0DIGElaWsZMLDd8AUQ
	 3vz8Hw52ztEfBoIbH3DtBYzb4SFTUMccExtZ5DaxVMMe1ncbIXQyvnA9tQe4hQfSpz
	 y3XgBs3rMsWn0m9rNNyUWKvGIivJvjXeDxTezgZQRR0rgJscOEMRmu67dYvVCbbbDd
	 EEuqvAbcaL1tAt/JF7Ktwdein5Xja1c+Gfse8ERcYWyFGLXRg7I+T6oPj1bsK33eea
	 ZNaa66r4e53oQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
In-Reply-To: <20230531170158.2744700-1-rf@opensource.cirrus.com>
References: <20230531170158.2744700-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] firmware: cs_dsp: Log that a bin file was loaded
Message-Id: <168562874389.66708.18316483706903232896.b4-ty@kernel.org>
Date: Thu, 01 Jun 2023 15:12:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: ZBNXIM2SL4DHKJSBWQOYC6IKDZE7ML4A
X-Message-ID-Hash: ZBNXIM2SL4DHKJSBWQOYC6IKDZE7ML4A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZBNXIM2SL4DHKJSBWQOYC6IKDZE7ML4A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 31 May 2023 18:01:58 +0100, Richard Fitzgerald wrote:
> Change the message at the start of bin file loading from
> cs_dsp_dbg() to cs_dsp_info() so that there is confirmation
> in the kernel log that a bin file was loaded, and the name
> of the file.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] firmware: cs_dsp: Log that a bin file was loaded
      commit: 8f4007e87ef9637aa557340762d6c3bbcbbd5669

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

