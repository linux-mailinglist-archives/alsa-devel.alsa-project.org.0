Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDRHB+Bki2kMUQAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Feb 2026 18:03:28 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E8E11D80C
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Feb 2026 18:03:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A4E560205;
	Tue, 10 Feb 2026 18:03:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A4E560205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1770743001;
	bh=GKxMsvF8513dldSNQ4piHGgHfcbGjskmI0BUIrYWREA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KT/47EGZm6rVYoDs4tFGbb2QbqE3oOzqiJdnOVdqTBzboM/DmJbrE22hffCMtOni/
	 7TGqV3Q+Y+nEQIf0dsZLfOwzg1d9n+fbmrOA0Z40H3zyEE1Pmg+uE2mYu+/tmX7hoS
	 ssJCBGaOacCod52QNsFVTKVhmxcNY09a26oLwQSU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE7AAF805F1; Tue, 10 Feb 2026 18:02:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B733CF8015B;
	Tue, 10 Feb 2026 18:02:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6327F801F7; Tue, 10 Feb 2026 18:01:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 142C2F800BD
	for <alsa-devel@alsa-project.org>; Tue, 10 Feb 2026 18:01:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 142C2F800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YyiwPKiQ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EB3B443D7;
	Tue, 10 Feb 2026 17:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FFF6C116C6;
	Tue, 10 Feb 2026 17:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770742870;
	bh=GKxMsvF8513dldSNQ4piHGgHfcbGjskmI0BUIrYWREA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YyiwPKiQ0qKyweuyY9xgnBf1hKbeDkIau4SqiZsjSXoLRpuVS3XmIwKutR3JVpPG4
	 6IF1iQOLh+eBf/Iu7zMMTIsUGyrT4ibiBZrCDwn8zXtLSDuu8HDt3qcZZDLffO4I0G
	 7QZ0WFt3dKec1XYKPP9ygWE1ILfnssQsGYXYkBRA4zT5EgHMCSUGL5/qdffD/EuWVK
	 0vMY5nFqjoZMUEmPhJ5Pp4CRdfH0eerZKolqEYM/Lmvti2wQdN4eEtonEFIKZiJ+O4
	 2RBLC9EyKT0S0MUPYT/3135oU+DLr2IQQcUo6MiOAhznePs97+gM3GLD/HMmz7f+U7
	 RfvoB6SWUMEiA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, jack.yu@realtek.com
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, shumingf@realtek.com, derek.fang@realtek.com
In-Reply-To: <20260210074335.2337830-1-jack.yu@realtek.com>
References: <20260210074335.2337830-1-jack.yu@realtek.com>
Subject: Re: [PATCH] ASoC: rt721-sdca: Fix issue of fail to detect OMTP
 jack type
Message-Id: <177074286825.290644.270301711122471622.b4-ty@kernel.org>
Date: Tue, 10 Feb 2026 17:01:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
Message-ID-Hash: 2FR7SAENVONTGUEC3EW4OWSYYWWWMPFF
X-Message-ID-Hash: 2FR7SAENVONTGUEC3EW4OWSYYWWWMPFF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2FR7SAENVONTGUEC3EW4OWSYYWWWMPFF/>
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
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:jack.yu@realtek.com,m:alsa-devel@alsa-project.org,m:lars@metafoo.de,m:flove@realtek.com,m:oder_chiou@realtek.com,m:shumingf@realtek.com,m:derek.fang@realtek.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,realtek.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,alsa-devel-bounces@alsa-project.org];
	MIME_TRACE(0.00)[0:+];
	RSPAMD_URIBL_FAIL(0.00)[alsa-project.org:query timed out];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+,kernel.org:+];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,alsa-devel-bounces@alsa-project.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A2E8E11D80C
X-Rspamd-Action: no action

On Tue, 10 Feb 2026 15:43:35 +0800, jack.yu@realtek.com wrote:
> Add related HP-JD settings to fix issue of fail to detect
> OMTP jack type.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt721-sdca: Fix issue of fail to detect OMTP jack type
      commit: 5578da7d957fbaf91f6c39ba2363c2d2e4273183

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

