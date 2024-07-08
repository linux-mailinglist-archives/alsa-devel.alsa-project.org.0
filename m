Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D85EE92A8E5
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jul 2024 20:20:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE0EA868;
	Mon,  8 Jul 2024 20:20:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE0EA868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720462850;
	bh=QOFBs3lyd5kSuHcIUTuqmRKn5lA/nl/6CEtMFJTqhtc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SIse/Uhm69nVg5NxiQf6gWEyaKGRFvA9hSM0edn/gnT4KsutW80Rs+t1QWWgc4fuM
	 8Gzk9QHdBCtkY4Cie6ttzFnQP5ZZ3v3Yz7VUDTHhUjrV8sCJQppKKl2vAfvMDjiPK/
	 6D1rDRwgDzgU7UrFdkaoncl6Rmbq1ozmTqKjuW7Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F41EFF801F5; Mon,  8 Jul 2024 20:20:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C18BF805AE;
	Mon,  8 Jul 2024 20:20:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3911EF801F5; Mon,  8 Jul 2024 20:20:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC00FF8013D
	for <alsa-devel@alsa-project.org>; Mon,  8 Jul 2024 20:20:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC00FF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nd5HyoRZ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2973FCE0ECE;
	Mon,  8 Jul 2024 18:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7267FC116B1;
	Mon,  8 Jul 2024 18:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720462802;
	bh=QOFBs3lyd5kSuHcIUTuqmRKn5lA/nl/6CEtMFJTqhtc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nd5HyoRZ+1/kD1ldDYLBg+Olhz35hv8qT9ebD+RTFRANdyUkbH9VMmaUzOHWaJWs6
	 n4WD7AksMoznOpTSs5aov6yh2bPVYMFkfabXXNsZ8drFPI1v7n6SO59UpuEM1BN4EL
	 DeSTOcORPfPfSI+BWEcJTClSxyAoyMHQiUFlMqXZdZ/wQ9ouVBKYKQm33zC3hZ48D6
	 gV49G4gP0SBQ2EiVM1E7V+mrJ7avvJ82oDRJT1SRxRHIqcumXg1JGNRE1ByUvkIFGe
	 e7zANNhZ89mL3Jd790X3aF6GC9Z4UCRwZdz+nvoZxWjZlhbZd+JF8PI66ftHN9Oigb
	 Z15bp8bt8DwWw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <20240708144855.385332-1-rf@opensource.cirrus.com>
References: <20240708144855.385332-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] firmware: cs_dsp: Use strnlen() on name fields in V1
 wmfw files
Message-Id: <172046280115.106387.10683882240697864309.b4-ty@kernel.org>
Date: Mon, 08 Jul 2024 19:20:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: GQM5EJQQCZ5OZOCDIQ6NK37LGKOV6OOS
X-Message-ID-Hash: GQM5EJQQCZ5OZOCDIQ6NK37LGKOV6OOS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GQM5EJQQCZ5OZOCDIQ6NK37LGKOV6OOS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 08 Jul 2024 15:48:55 +0100, Richard Fitzgerald wrote:
> Use strnlen() instead of strlen() on the algorithm and coefficient name
> string arrays in V1 wmfw files.
> 
> In V1 wmfw files the name is a NUL-terminated string in a fixed-size
> array. cs_dsp should protect against overrunning the array if the NUL
> terminator is missing.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] firmware: cs_dsp: Use strnlen() on name fields in V1 wmfw files
      commit: 680e126ec0400f6daecf0510c5bb97a55779ff03

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

