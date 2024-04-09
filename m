Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED17489D9CF
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Apr 2024 15:08:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC9822BBB;
	Tue,  9 Apr 2024 15:08:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC9822BBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712668121;
	bh=efQW4n4+VTeV6F+TzLQ/Ws25y4//427fEzcwv/kchgY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I0cHzrNNP56hAaHuO1I2359yfCXqFkjVfhjK5YI7eJD5P7TjqvM/isY4cqcFh4yuT
	 wOolhVpMlEv8qOMC9dtwvyBSnXJk2qXQEv7jsoEggbA+LtReIwVmcPnIh/Uh6NUlMh
	 Ds2OXxT9dkiwE/fIiNKQxu8OwZR1S4kT5emzbFUw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F482F805AB; Tue,  9 Apr 2024 15:08:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B35D8F8058C;
	Tue,  9 Apr 2024 15:08:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1674BF80423; Tue,  9 Apr 2024 15:08:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1AE29F80236
	for <alsa-devel@alsa-project.org>; Tue,  9 Apr 2024 15:07:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AE29F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XYRyRNhd
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 05276CE1E8E;
	Tue,  9 Apr 2024 13:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9FE6C433C7;
	Tue,  9 Apr 2024 13:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712668075;
	bh=efQW4n4+VTeV6F+TzLQ/Ws25y4//427fEzcwv/kchgY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XYRyRNhdEF2x1ljcqMNm4wvZ6bUaA88jFdFP5nsaWcvpxa8vQrUW+W3TYFqFJQH4s
	 gif8mbrpvlGPzjfBzJ+fkSmXmZL9i8vCybiVHNAFACpT5kS6Tkp3jJbVl0rFnW6Pr0
	 5/rFbWCpmuoa2F1INpDbg8pKri/nYXGEZlt/8xYtDcIieIWaVc5tuyy/Y0V/A4rdPs
	 SlVWgU0xI/LtwPNuZXAmU+fyQ0WUoce1pXSw9SEGqHl81cJ1parm7D+s/zIIfIgXFS
	 72cbsGpR5Y4zPo67bkqZY9p0v6RYCzXD+VHgNrNKds6bPvh4pZEhLRIdK+cI/U3ecz
	 TIIQuEcs6bqBA==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com,
 hdegoede@redhat.com, kernel test robot <lkp@intel.com>
In-Reply-To: <20240408081840.1319431-1-cezary.rojewski@intel.com>
References: <20240408081840.1319431-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Fix debug window description
Message-Id: <171266807341.28088.11267755974349863620.b4-ty@kernel.org>
Date: Tue, 09 Apr 2024 14:07:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: STXPJMD5DBQE64X3MXBBNFXLJLDAGSFO
X-Message-ID-Hash: STXPJMD5DBQE64X3MXBBNFXLJLDAGSFO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/STXPJMD5DBQE64X3MXBBNFXLJLDAGSFO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 08 Apr 2024 10:18:40 +0200, Cezary Rojewski wrote:
> Recent changes addressed PAGE_SIZE ambiguity in 2/3 locations for struct
> avs_icl_memwnd2. The unaddressed one causes build errors when
> PAGE_SIZE != SZ_4K.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Fix debug window description
      commit: 7a1625c1711b526a77cb9c3acc15dbba71896a40

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

