Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D82427384CC
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 15:20:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19A47839;
	Wed, 21 Jun 2023 15:19:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19A47839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687353629;
	bh=n4V5n5vuTRtrt5QQIHMNtiNawzCop85+4xbDg8YWjYM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=O0lotgq3UpoNKa8vEBGEC1hzefsK3ksVIdmq2duT4EqGh1OHvCYurWcDUKKUqmBpj
	 1hMkCc5vGrRqVNlyWPgKO5V5N3Bcuw1/N/imcBfITsWh9wg39tSJ99cwKsfO4gs+zz
	 etHafWY5ptM7FM+Iuocnp9Q/o/2Fwwe3DxBHMws8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08235F80141; Wed, 21 Jun 2023 15:19:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F6B4F801D5;
	Wed, 21 Jun 2023 15:19:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5329FF80544; Wed, 21 Jun 2023 15:19:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 20CD9F80124
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 15:19:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20CD9F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hPfoAJJA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 81C0C6131B;
	Wed, 21 Jun 2023 13:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DC8C433C0;
	Wed, 21 Jun 2023 13:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687353553;
	bh=n4V5n5vuTRtrt5QQIHMNtiNawzCop85+4xbDg8YWjYM=;
	h=From:To:Cc:Subject:Date:From;
	b=hPfoAJJA3Jy7szl9+CDx6JJmLWE8r01Jq7ms10zPMB2pFdpQfZV1UYr29odt57VFZ
	 YAzcZK1nJd9P6ZWXgs3evz65aMzLQEt4JbdrKvIVftweo2dtw9sDDDedZcwDt0zSCM
	 +12fNbL98RsmRK5Jn6ETJ3j3va9qQbZ6J14hd9hPU9V9JE/19l8BE1XE3NqWlRysgt
	 1Vt921v9tzWjGubjUmFcKTv4WffFU+3OZZ8loPT5QuC4fDOWTVKntMiCH7xiLTFgSK
	 aRQFGUNuz9Ka3Uu3ly+sAXE8Li7b8fQkG8q4tjkB4yO2p7dsILVFqh2VCGKFCNTSmG
	 minO032YkRZlQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.4-rc7
Date: Wed, 21 Jun 2023 14:18:43 +0100
Message-Id: <20230621131912.90DC8C433C0@smtp.kernel.org>
Message-ID-Hash: H4TBNWETZETCXPBU75TUFPCCMCAGUZSV
X-Message-ID-Hash: H4TBNWETZETCXPBU75TUFPCCMCAGUZSV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H4TBNWETZETCXPBU75TUFPCCMCAGUZSV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit f9fd804aa0a36f15a35ca070ec4c52650876cc29:

  ASoC: tegra: Fix Master Volume Control (2023-06-13 12:10:56 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.4-rc7

for you to fetch changes up to 1f1ef7e5bbe2de125da413e238915f6047ea4ba2:

  ASoC: intel: sof_sdw: Fixup typo in device link checking (2023-06-19 12:58:22 +0100)

----------------------------------------------------------------
ASoC: Fix for v6.4

A fix for a typoed iterator in the Intel Soundwire driver, fairly simple
on inspection though not reviewed by Intel.

----------------------------------------------------------------
Charles Keepax (1):
      ASoC: intel: sof_sdw: Fixup typo in device link checking

 sound/soc/intel/boards/sof_sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
