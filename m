Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F06E9BD5AC
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2024 20:08:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9756FE80;
	Tue,  5 Nov 2024 20:07:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9756FE80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730833683;
	bh=QF2vNEmdwPntZbzjFEQGu4tKLc04rU44LayLYk5Hh0U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K1LvFZL/gv1mObq7bdwnrRlrQa1yiseuJFWWyhoZWe3Eva/KDb/hwqpe8uGs5u2Mn
	 i2unWoGZ5rT3cGcOiGP/1nZKFcyJ8HatpHFh9HriUpYb02u6oRSu2d00gTvRDb5PYx
	 OzF3F7MpzQ58VUyFiXIEt0A9FkiklNzSRLEyVoGI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BD5CF805AF; Tue,  5 Nov 2024 20:07:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 667FBF805AD;
	Tue,  5 Nov 2024 20:07:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1485DF8013D; Tue,  5 Nov 2024 20:07:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42F30F800C8
	for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2024 20:07:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42F30F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UK9kEHfI
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5DE2DA41674;
	Tue,  5 Nov 2024 19:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CEEAC4CECF;
	Tue,  5 Nov 2024 19:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730833644;
	bh=QF2vNEmdwPntZbzjFEQGu4tKLc04rU44LayLYk5Hh0U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UK9kEHfI8fR1r2EiCFiDvVPMKwJPDS0FXyyU58ghuS3i9Vz2ncfOYd/EJSS6wSeIk
	 jtVThxLEiZgX2ow64dOLN441gIUAjpk/iakWfoD+C72q/kZ8zPB5Z5OpNgC+MFaYd4
	 ZZB7tStRQ4bWVOkOaO3GXS7vJOXYNZL40VlmPsYpLwb6IUoXvvoZHiaLg1bYoHaJ0v
	 +0zncU8H/I8yP+ws6jFuk7uJOhzKVoIcf6jv9uXs+gYmi5Tq8RVOj9m6CT237ME5ZN
	 hzdAdv0BnGETatlbC/Rod2dIxhr9ShNVGrWyco5TGyjMSnsMpUO33TaZeAxos6igSv
	 Y8rBzr7L3CAyg==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Mario.Limonciello@amd.com,
 Richard.Gong@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@intel.com>
In-Reply-To: <20241101020802.1103181-1-Vijendar.Mukunda@amd.com>
References: <20241101020802.1103181-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 0/2] Soundwire dai link init logic refactor
Message-Id: <173083364104.105724.13341920313310122179.b4-ty@kernel.org>
Date: Tue, 05 Nov 2024 19:07:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
Message-ID-Hash: XBESIWIHZPQF4PTY4UZIY4BNNNT6M5GK
X-Message-ID-Hash: XBESIWIHZPQF4PTY4UZIY4BNNNT6M5GK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XBESIWIHZPQF4PTY4UZIY4BNNNT6M5GK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 01 Nov 2024 07:38:00 +0530, Vijendar Mukunda wrote:
> This patch series refactors the SoundWire dai link init logic for Intel
> and AMD generic SoundWire machine driver and also updates the stream_name
> in dai_links structure.
> 
> Link: https://github.com/thesofproject/linux/pull/5218
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: sdw_utils/intel/amd: refactor dai link init logic
      commit: 485df22866559e2f821a9754d51a9755ce56e7aa
[2/2] ASoC: sdw_utils: Update stream_name in dai_links structure
      commit: d280cf5fbfe3cdd373c98e858834ff87b6ea64de

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

