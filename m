Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76215545C62
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 08:38:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC7441E80;
	Fri, 10 Jun 2022 08:37:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC7441E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654843119;
	bh=letTzTlIdmYyCQr3t4i/4sQ++BrVupVi397GE8M9uvI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pMvyFEUdddWbOW441iURo4sW03adhICQP9y7URRpvwaatZNnN8Le95l7poPq5vTVI
	 PVfoLblSWrvGnR0VcVeMYIxfs/o2wMznqw+rKxUmOAhiRjgoQw652Np93fMtzmmiAc
	 wJoi6gPYLHHuMFKorxSWc566LxfeF0xUQs8ZI/oA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B33BF804D8;
	Fri, 10 Jun 2022 08:37:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B445F80536; Tue,  7 Jun 2022 16:11:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC77EF8052D
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 16:11:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC77EF8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZmrXJqh5"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E794A61579;
 Tue,  7 Jun 2022 14:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A53C385A5;
 Tue,  7 Jun 2022 14:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654611104;
 bh=letTzTlIdmYyCQr3t4i/4sQ++BrVupVi397GE8M9uvI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZmrXJqh5VhK6LBrkWuZLcZPb6LB/aKqB7VgbxKHQ5EKdRZGn1B/UtUl37J/VZlncM
 XaKVqUs9/CrLhurHZmfQE4ZHromAzF5QHFhfcePHGAZt6gJN4oXn1Jgu9OhytNBGsZ
 Dpp8c39jiY4Y6vji5iZNzY0BkjvDT9oCjsHIgHSItTWWl1ZaFW8x1MWtKzh54+Jsmx
 MgLY2ScRWCz28NxqLMnfdu2v0uWPvoMrX/y8LVhRzTo8e9BmO+8kP0GacNDIRYfLCx
 +YjXzNg0JjEvKZfsqCZP5oIjyElXDN9wiUZpKQTLYg3m4X5qyHVoxoSHYehWp506BX
 a+HtETwbE/zkg==
From: Mark Brown <broonie@kernel.org>
To: linux-doc@vger.kernel.org, corbet@lwn.net, mchehab@kernel.org
In-Reply-To: <cover.1654529011.git.mchehab@kernel.org>
References: <cover.1654529011.git.mchehab@kernel.org>
Subject: Re: (subset) [PATCH 00/23] Update Documentation/ cross-references
Message-Id: <165461109692.1597191.11390741473240531333.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 15:11:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 10 Jun 2022 08:37:38 +0200
Cc: ulf.hansson@linaro.org, alim.akhtar@samsung.com, kvm@vger.kernel.org,
 rafael@kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
 linus.walleij@linaro.org, dave.hansen@linux.intel.com,
 alsa-devel@alsa-project.org, keyrings@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, hpa@zytor.com,
 linux-phy@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 mchehab+huawei@kernel.org, x86@kernel.org, linux-cachefs@redhat.com,
 geert@linux-m68k.org, federico.vaga@vaga.pv.it,
 bcm-kernel-feedback-list@broadcom.com, linux@roeck-us.net,
 devicetree@vger.kernel.org, jdelvare@suse.com, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 robh+dt@kernel.org, bp@alien8.de, mmayer@broadcom.com, tglx@linutronix.de,
 mingo@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, jarkko@kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 6 Jun 2022 16:25:22 +0100, Mauro Carvalho Chehab wrote:
> There were a number of DT binding conversions and other docs change that
> were not updated. Address them, in order to keep the cross-references on
> a sane state.
> 
> Patch series is against v5.19-rc1 (and applies cleanly on the top of
> today's -next).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[22/23] ASoC: wm8731: update wlf,wm8731.yaml reference
        commit: 69c8027c5ff43d68449fda4510a8cce70e8578b0

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
