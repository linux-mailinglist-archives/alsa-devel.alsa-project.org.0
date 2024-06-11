Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 393A89040F3
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2024 18:13:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8080284C;
	Tue, 11 Jun 2024 18:13:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8080284C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718122400;
	bh=lVBMd7pm9KnAnJVO5KwX7pdV0VQZjI/8zsuxqHZxuZI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=frk6lSJdmWJnyb5uIOGWILNcE27jbKFkpC0iXzUcDAZHYSbvM5NxxOas1pdjxWVTS
	 O+zNGnwpNcHKbzVH/Ij9CHe6qQR+m37iKmGidu5cGRH9zZG/T4pSnTRUIKYVxaem3b
	 DDg267yYDp7Ggi3nD7p4UiqlVx2yF+v2zEahfFA0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85A3CF805BB; Tue, 11 Jun 2024 18:13:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01A8EF8057A;
	Tue, 11 Jun 2024 18:12:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C305F80587; Tue, 11 Jun 2024 18:12:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5C03F80579
	for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2024 18:12:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5C03F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=c9GqljWc
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0CD8160ECB;
	Tue, 11 Jun 2024 16:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C61AC2BD10;
	Tue, 11 Jun 2024 16:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718122366;
	bh=lVBMd7pm9KnAnJVO5KwX7pdV0VQZjI/8zsuxqHZxuZI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=c9GqljWcvRQt3/EKlJttpU1QC1HOVjeOWs6uRGNz23eqhtMpvApL3cKvpnh1z4J2A
	 8A7quZLUGinBRsPmjn/XBH8XuBMjWQp/oyhgXFwztx/hn+sK0B/M/7qqrQXchpkm3+
	 PJ/YknSmL6mv1/z2T03VkMNKHWP0ESjYYPBoAGve501O22U0HiJvCTN0VYUKKL3/+G
	 Lzb7V8npJrQMAbmRLv2oIN2UMmVP29QHLS/svL4E88wQyWH9LhqMvr2bNRUH8Prs5i
	 QnVu43UYPJ31ItOgKjRv1SOOv75MHwVE+23vlqpfSHlHOgZ+XpBTvmLFBTOmanZyQ2
	 Qlb5UrbXwKXqQ==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 Jason Montleon <jmontleo@redhat.com>
In-Reply-To: <20240603102818.36165-1-amadeuszx.slawinski@linux.intel.com>
References: <20240603102818.36165-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: topology: Fix route memory corruption
Message-Id: <171812236450.201359.3019210915105428447.b4-ty@kernel.org>
Date: Tue, 11 Jun 2024 17:12:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14-dev-4c370
Message-ID-Hash: XUGSX2ZYOPUFVQPRALVE3LFU25GGUYYN
X-Message-ID-Hash: XUGSX2ZYOPUFVQPRALVE3LFU25GGUYYN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XUGSX2ZYOPUFVQPRALVE3LFU25GGUYYN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 03 Jun 2024 12:28:14 +0200, Amadeusz Sławiński wrote:
> Originally reported here:
> https://github.com/thesofproject/avs-topology-xml/issues/22#issuecomment-2127892605
> There is various level of failure there, first of all when topology
> loads routes, it points directly into FW file, but it may be freed after
> topology load. After fixing the above, when avs driver parses topology
> it should allocate its own memory, as target strings can be shorter than
> needed. Also clean up soc_tplg_dapm_graph_elems_load() a bit.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: topology: Fix references to freed memory
      commit: 97ab304ecd95c0b1703ff8c8c3956dc6e2afe8e1
[2/4] ASoC: Intel: avs: Fix route override
      commit: fd660b1bd015e5aa9a558ee04088f2431010548d
[3/4] ASoC: topology: Do not assign fields that are already set
      commit: daf0b99d4720c9f05bdb81c73b2efdb43fa9def3
[4/4] ASoC: topology: Clean up route loading
      commit: e0e7bc2cbee93778c4ad7d9a792d425ffb5af6f7

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

