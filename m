Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 320WDTJNlmmbdgIAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Feb 2026 00:37:22 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE52415AF52
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Feb 2026 00:37:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAA6A601A4;
	Thu, 19 Feb 2026 00:37:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAA6A601A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1771457840;
	bh=tZ80juMdw/uefTvy0uIX6JFC/KOlaT93tA+XqCxCHs4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AvGdhbI4voO8DZ2FO4bRn4dk7bZNRcCdyN09A5hpMM1ov1Oa9cvdXNpUGYLpNmXiE
	 2W6PeT0ADzgKOz6xibtNZKUE9ob63CG7X2CYjoj0mpKLoBYui1sPdeqvb6EE8rHvzn
	 aQyFpXtyUvRmNLv9qQfYRFhv3FOlZovkk7vr9v7o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 096B6F805E6; Thu, 19 Feb 2026 00:36:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D097F805E5;
	Thu, 19 Feb 2026 00:36:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29A87F804F2; Thu, 19 Feb 2026 00:34:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0EF4AF80153
	for <alsa-devel@alsa-project.org>; Thu, 19 Feb 2026 00:34:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EF4AF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SIg/lp5a
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CFDD66132F;
	Wed, 18 Feb 2026 23:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C5AC116D0;
	Wed, 18 Feb 2026 23:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771457687;
	bh=tZ80juMdw/uefTvy0uIX6JFC/KOlaT93tA+XqCxCHs4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SIg/lp5aQ4Dvg2IbkEJXh29eoTYow4mH7XVbX9PQTmPcCaQfbzNNCKKmZDSjrUDbw
	 ybOl5MGTumOtd6XJM2E7qicRJSL0Sgrh/ql8z1ueSQMGtHeuwkvAjp24nXM+mNP+ai
	 s+giWf3hRQ4XAq9Z9ywUVeW4EBkQTGH2SZ9t6x73yhIJ8+bGuVO3CsT83itA7yXszv
	 4S8LwLAAegm7G+geeAjrZ4SQ3i4brZroTFJ/+tgm52GkGLxfige0QzBu2OjZk+avUi
	 0St9CE6BfGjBq/MhSjZnw3xYo30I9dUorPjBw5KDsRX7Hub5sNDwao9KwXdPQ+MhFt
	 /j13fI48Xwmgw==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 mario.limonciello@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260218104734.3641481-1-Vijendar.Mukunda@amd.com>
References: <20260218104734.3641481-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 0/2] ASoC: amd: add ACPI mach entries and quirk
Message-Id: <177145768554.2257280.17103760824582405342.b4-ty@kernel.org>
Date: Wed, 18 Feb 2026 23:34:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
Message-ID-Hash: G7B5A5B22Q4K6YE3P5A5BJGEOH2RJQDQ
X-Message-ID-Hash: G7B5A5B22Q4K6YE3P5A5BJGEOH2RJQDQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G7B5A5B22Q4K6YE3P5A5BJGEOH2RJQDQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[alsa-project.org,gmail.com,perex.cz,suse.com,amd.com,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:Vijendar.Mukunda@amd.com,m:alsa-devel@alsa-project.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:Sunil-kumar.Dommati@amd.com,m:venkataprasad.potturu@amd.com,m:mario.limonciello@amd.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	FORGED_SENDER(0.00)[broonie@kernel.org,alsa-devel-bounces@alsa-project.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[alsa-project.org:+,kernel.org:+];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,alsa-devel-bounces@alsa-project.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AE52415AF52
X-Rspamd-Action: no action

On Wed, 18 Feb 2026 16:15:32 +0530, Vijendar Mukunda wrote:
> Add ACPI mach entries for ACP7.0 platform for RT1320 + RT722 combination
> and include machine driver quirk for Lenovo laptops.
> 
> Vijendar Mukunda (2):
>   ASoC: amd: acp: Add ACP7.0 match entries for Realtek parts
>   ASoC: amd: amd_sdw: add machine driver quirk for Lenovo models
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: amd: acp: Add ACP7.0 match entries for Realtek parts
      commit: 7869f1c1123cfc0fb22a9de96cc6eb75072a3971
[2/2] ASoC: amd: amd_sdw: add machine driver quirk for Lenovo models
      commit: 3acf517e1ae05ef66561b7a2782690387ce46e21

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

