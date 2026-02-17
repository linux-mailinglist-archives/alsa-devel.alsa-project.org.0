Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNvOGZJTlGl3CgIAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Feb 2026 12:40:02 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C3F14B7ED
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Feb 2026 12:40:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 423FC6020F;
	Tue, 17 Feb 2026 12:39:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 423FC6020F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1771328401;
	bh=XZ1cEoh7ErNrbtOPqCCaVg9prMl/jUVXBKDSLHi3voc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Jqi2aLdG3i8vQ7UL6a/x7LoX2I3q6hZs32QVLWoEqFPZqNRiSY1byGykN0hSkDZm0
	 ZvfMJiNsayiDDHoHc9ZJ0p2uWa5g3+lA5ZhpTfYW8eGeJJoY2MJEOWKYEXd3m/p2bZ
	 9K3xrhJKIQ/mO7dAkLIW1wx8nBncOsUPwLWdSUDc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27B3FF805E8; Tue, 17 Feb 2026 12:39:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E041F805E0;
	Tue, 17 Feb 2026 12:39:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28A2DF80548; Tue, 17 Feb 2026 12:35:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98F07F8016E
	for <alsa-devel@alsa-project.org>; Tue, 17 Feb 2026 12:35:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98F07F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=W9Kw5/XZ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 483C24391D;
	Tue, 17 Feb 2026 11:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC353C4CEF7;
	Tue, 17 Feb 2026 11:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771328146;
	bh=XZ1cEoh7ErNrbtOPqCCaVg9prMl/jUVXBKDSLHi3voc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=W9Kw5/XZgeG7ZtHy2GAmxF4VUxw6f3aObmKBFc+TCn8f6qdUpOq4662fvASycSjWB
	 M5f4IBhhXuE2NmirgkmY6KVKUXP4Nux0bV4wVCdUADmq1JG04sLSDH0MqZuM6x9/KQ
	 wh/HVFE33n7nMWe40IHiGjAU1kni2TGCQ3BVjEMII6inusQdc+v3ZHAM+BJAXuksJL
	 QwVP1iglszGKI+0//6CbK7t3kXUIEwVV65/NKC+K8pX7vdmRpYEkJB/bv8bQfIrroV
	 v3yQ19E/LJXiGK57AktQ2AmEo8xA3yyI3Gb0MK/3nmyJ5nQz2FqONge0cDVVyCyerQ
	 InT6aw+sedeBA==
From: Mark Brown <broonie@kernel.org>
To: Gustavo Salvini <guspatagonico@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 mario.limonciello@amd.com, Vijendar.Mukunda@amd.com, tiwai@suse.com,
 stable@vger.kernel.org
In-Reply-To: <20260210155156.29079-1-guspatagonico@gmail.com>
References: <20260210155156.29079-1-guspatagonico@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for ASUS Vivobook Pro 15X
 M6501RR
Message-Id: <177132814457.11429.8947566827430514927.b4-ty@kernel.org>
Date: Tue, 17 Feb 2026 11:35:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
Message-ID-Hash: HETSXTTBUTAC6BUAANNUCERWKFBPTWQN
X-Message-ID-Hash: HETSXTTBUTAC6BUAANNUCERWKFBPTWQN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HETSXTTBUTAC6BUAANNUCERWKFBPTWQN/>
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
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:guspatagonico@gmail.com,m:alsa-devel@alsa-project.org,m:linux-kernel@vger.kernel.org,m:mario.limonciello@amd.com,m:Vijendar.Mukunda@amd.com,m:tiwai@suse.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	FORGED_SENDER(0.00)[broonie@kernel.org,alsa-devel-bounces@alsa-project.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[alsa-project.org:+,kernel.org:+];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,alsa-devel-bounces@alsa-project.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 00C3F14B7ED
X-Rspamd-Action: no action

On Tue, 10 Feb 2026 12:51:56 -0300, Gustavo Salvini wrote:
> The ASUS Vivobook Pro 15X (M6501RR) with AMD Ryzen 9 6900HX has an
> internal DMIC that is not detected without a DMI quirk entry, as the
> BIOS does not set the AcpDmicConnected ACPI _DSD property.
> 
> Adding the DMI entry enables the ACP6x DMIC machine driver to probe
> successfully.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add DMI quirk for ASUS Vivobook Pro 15X M6501RR
      commit: ff9cadd1a2c0b2665b7377ac79540d66f212e7e3

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

