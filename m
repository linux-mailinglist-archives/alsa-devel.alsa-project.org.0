Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6268C8AAC6C
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Apr 2024 12:05:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAAD8950;
	Fri, 19 Apr 2024 12:05:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAAD8950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713521110;
	bh=LZ8j7/DAFq2z05bW7r9GYgMXjNxvmbu0CIMhbcQqQiY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SHPUpgfdR9e6na4f7fNKfAtSj6L4DeE+YcDHpBqkcL57QdrxTYbqqKP22TABY7FvE
	 hcMck8EMvOEmFsANOnGvGM63u3hsFji02G9sMC7etQTuU5k2FOrF/KPA+cWrWWG7Y0
	 Kn40Ng3YDF+Dy7V7/MWSbjkc+6SQpr4DZwwR/KGw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80898F805B0; Fri, 19 Apr 2024 12:04:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBCA7F805AB;
	Fri, 19 Apr 2024 12:04:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F222FF80587; Fri, 19 Apr 2024 12:04:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADE37F801C0
	for <alsa-devel@alsa-project.org>; Fri, 19 Apr 2024 12:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADE37F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=g98+0TD+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4151F6194D;
	Fri, 19 Apr 2024 10:03:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4CEBC116B1;
	Fri, 19 Apr 2024 10:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713521028;
	bh=LZ8j7/DAFq2z05bW7r9GYgMXjNxvmbu0CIMhbcQqQiY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=g98+0TD+/HxT7CXg/LLA5YzVNNafZurzBeoXHBYkCtNcBNrvfXotZ82/KHJX6KlM2
	 ap6wQ9VlSK0I1O2XVwmQcDzKfs415b1oTkzNdw5n8WF5ZUywRoLtMg8qrGz2nspnqm
	 C7Eazf1H/ZBFJwsfZbH7kTqtcXxIoMVEvl96zxxx/NzNUiT8JBe9toADTaTuMRs7f5
	 R7s+IgpllAXC3zIwSNLQul/oWhosDOPOUXpKf01eNUt6H4kiT8jUfNNr40xQyLFye6
	 gz7Sphiqs0TZLTUDM6by4pwe1czFcG0LYUqP+29jVjHKl53B5KEsduW3cKxUg+L/jV
	 QV31Fb3TN4xew==
From: Mark Brown <broonie@kernel.org>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240418103315.1487267-1-mstrozek@opensource.cirrus.com>
References: <20240418103315.1487267-1-mstrozek@opensource.cirrus.com>
Subject: Re: [PATCH v2] spi: cs42l43: Correct name of ACPI property
Message-Id: <171352102742.1723864.2404098054563161997.b4-ty@kernel.org>
Date: Fri, 19 Apr 2024 19:03:47 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: RJ5KYCTXT7U5GYI42ZLAVQCRZSRYXFKN
X-Message-ID-Hash: RJ5KYCTXT7U5GYI42ZLAVQCRZSRYXFKN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RJ5KYCTXT7U5GYI42ZLAVQCRZSRYXFKN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 18 Apr 2024 11:33:15 +0100, Maciej Strozek wrote:
> Fixes: 439fbc97502a ("spi: cs42l43: Add bridged cs35l56 amplifiers")
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: cs42l43: Correct name of ACPI property
      commit: e4f23c4c4dd0aa9bb3a70a873d3fc32a41f64007

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

