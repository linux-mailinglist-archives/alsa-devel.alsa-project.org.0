Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EvJKZv+iGkY0QQAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Sun, 08 Feb 2026 22:22:35 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A1610A319
	for <lists+alsa-devel@lfdr.de>; Sun, 08 Feb 2026 22:22:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3E79601C5;
	Sun,  8 Feb 2026 22:22:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3E79601C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1770585753;
	bh=wG2Czxba3jBUtDYEP03z3BSVfH9BgzaCkKXFXxUgMJk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bPt38A+uIzA3ZCpgOwim4dS/NO6sfMLkbx7br2YkDr0DeStpQmge+qizNulXRFY11
	 aN9n9CyLL2z8fIs4QQoRZXZvKOgJzeaXpmAsoBBbnW+rl1bkJ2eTQ8Pb+LunxOZvrg
	 Z6MLn1nsO2ga+lt6sUYhcvTEeQgJXv8uNeA9N/V8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F0DEF805E9; Sun,  8 Feb 2026 22:21:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E03B1F805E6;
	Sun,  8 Feb 2026 22:21:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CAD7F8047D; Sun,  8 Feb 2026 22:21:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3244CF80093
	for <alsa-devel@alsa-project.org>; Sun,  8 Feb 2026 22:21:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3244CF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=R1CcVF7g
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F15B600BB;
	Sun,  8 Feb 2026 21:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CDDC116C6;
	Sun,  8 Feb 2026 21:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770585695;
	bh=wG2Czxba3jBUtDYEP03z3BSVfH9BgzaCkKXFXxUgMJk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=R1CcVF7glaSQlsj4cJPcbz2Pfi307Gbd5Uop6i5Leauixn7BNQWSmBeffXulMzbqA
	 0hh9xJNPNas6af2dS7acY93EqSpqExY4S4glYAWfNIWHGJmBo0t8vj9/3PdIK5PQAW
	 Qza4KAxB5F6x5XhDm9eCL1qgIw5Bdv+f+jmsh5gh7ju1WaNccOsrLyGZKJts7QJIdj
	 QdUM4IgktDX0xTW/9HFYqjcxEme/D+QZcwiWG/k3NkKwmv/IgJZvrqqEWUy8NNzxaJ
	 aoXVXvYSf0fV+SjBydukAWMKl3Fpb1DAkfk+JbEDebF2goDqPDEmB3UUPVPEl1vV+R
	 CtUnhVRxMED5w==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, mario.limonciello@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260207062433.1465232-1-Vijendar.Mukunda@amd.com>
References: <20260207062433.1465232-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: amd: maintainer information
Message-Id: <177058569295.654564.1440552951713342235.b4-ty@kernel.org>
Date: Sun, 08 Feb 2026 21:21:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
Message-ID-Hash: CLR5FDCKYWU2VQLHPCRH5EIDYY6I3MQ5
X-Message-ID-Hash: CLR5FDCKYWU2VQLHPCRH5EIDYY6I3MQ5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CLR5FDCKYWU2VQLHPCRH5EIDYY6I3MQ5/>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa-project.org:dkim,alsa0.perex.cz:helo,alsa0.perex.cz:rdns];
	FREEMAIL_CC(0.00)[alsa-project.org,gmail.com,perex.cz,suse.com,amd.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Vijendar.Mukunda@amd.com,m:alsa-devel@alsa-project.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:Basavaraj.Hiregoudar@amd.com,m:Sunil-kumar.Dommati@amd.com,m:venkataprasad.potturu@amd.com,m:mario.limonciello@amd.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[broonie@kernel.org,alsa-devel-bounces@alsa-project.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+,kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 30A1610A319
X-Rspamd-Action: no action

On Sat, 07 Feb 2026 11:53:51 +0530, Vijendar Mukunda wrote:
> Update MAINTAINERS file for AMD ASoC drivers.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: maintainer information
      commit: 77d31948a88368f1e8516cb74614ab2e0340e840

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

