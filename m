Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E130087527E
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 15:56:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4077C85D;
	Thu,  7 Mar 2024 15:56:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4077C85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709823403;
	bh=oqhDzxC67zeXNLqWajQizZnAUbeIRSZcp2oI/hXjhXI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b4GYXtGWG2re+b7htX14whtjsEt6zD854HZ17PVlL3ZDCz1hQhs3hR6DCTeYOsMpO
	 swswHTmYVHrq2MGBWDX4OOmjGn7Klprl0IcYxl6oFEaa2SWikAFGTGpPGdxyMRQOXX
	 s0vNVW48VcU0IpuybdpgSzjbDo9ERgx4cqP9jp60=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC10BF805AD; Thu,  7 Mar 2024 15:56:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7FEAF8057A;
	Thu,  7 Mar 2024 15:56:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A62A3F802E8; Thu,  7 Mar 2024 15:56:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5587F8014B
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 15:55:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5587F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aWCP23kJ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A8CFC61C17;
	Thu,  7 Mar 2024 14:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D7AC43399;
	Thu,  7 Mar 2024 14:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709823356;
	bh=oqhDzxC67zeXNLqWajQizZnAUbeIRSZcp2oI/hXjhXI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aWCP23kJr1IGD+gS0oeZnwCPUYgOnKzyX55IGTU6LbwMQLWQrVwKHT3xz69JAdjvu
	 75gjrr7K6keatM+f+VyKZPJPixZIszJV+3JAbvtrulU/39sD98dnnekPmMGAI7o/hz
	 N2oHoLGCd55c3Pr9p7uGb6+X0aVzVWgm8ciLjzD86fdlJZsh/mC4vhEK+s0va9WpP5
	 cmTfXAZkmG6mTfL72A1/PZYE0G1Rurn/r16cbggfIHsyggKEzdA6VxYaCn8gXkT4Gg
	 7WfVOQzyhsTqrzrhgskkjdI+2rE9RJq2MYDuVAJPitBSkNiVcRMLcuH4ZAy6uNujsX
	 Pd2YNzIqZwMfQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20240307105516.40250-1-rf@opensource.cirrus.com>
References: <20240307105516.40250-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] firmware: cirrus: cs_dsp: Remove non-existent member
 from kerneldoc
Message-Id: <170982335522.46708.14853262664678961079.b4-ty@kernel.org>
Date: Thu, 07 Mar 2024 14:55:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: ZO3PDHXMLAVAKD7US6Q3S6ACTZWE32WP
X-Message-ID-Hash: ZO3PDHXMLAVAKD7US6Q3S6ACTZWE32WP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZO3PDHXMLAVAKD7US6Q3S6ACTZWE32WP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 07 Mar 2024 10:55:16 +0000, Richard Fitzgerald wrote:
> The kerneldoc for struct cs_dsp refers to a fw_file_name member but
> there's no such member.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] firmware: cirrus: cs_dsp: Remove non-existent member from kerneldoc
      commit: 5d51a794414359dd387c3da7a2ea7602c67f84a6

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

