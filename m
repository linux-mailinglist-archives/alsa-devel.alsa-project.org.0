Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BC2451A63
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 00:36:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 379D2169B;
	Tue, 16 Nov 2021 00:35:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 379D2169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637019383;
	bh=Pdcmps+Wn75c6JYbY9VoGfURQ8Z1Y05nyXoNRHD+OTQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K2MsQ8WSwaicK04uaazDo9La2RuF92YEkF5ZTj286XmvzlF+dW38gFzpWS0tWxmxI
	 ijV++tIazIL1EyjUBrwvrkqXxQ3eOrz23SfuvKxJlJTTsDQpvCm07w/7u1JwklNi7t
	 sXAvm/rzJw4a42JGndqtu5QUS2L9+OW9wd0/lRn0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDF25F804BB;
	Tue, 16 Nov 2021 00:35:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 152FAF8027D; Tue, 16 Nov 2021 00:35:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE827F800FA
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 00:34:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE827F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="h9m4ZIUr"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A5E26324A;
 Mon, 15 Nov 2021 23:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637019294;
 bh=Pdcmps+Wn75c6JYbY9VoGfURQ8Z1Y05nyXoNRHD+OTQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=h9m4ZIUrYZJK46lFpAoZLfySpdLpVZ0GK2DIqZpF4Kd0mSTzKJDj1FQ/zbaXv1DKC
 I4ww6c5oL8jCQN9zyRfWz4qeFdHA9E477Ud1xYqSQDJT3YpP0TJtRYpZZb2xnN25LO
 SL5TlCs6J8u6IgIkKayqz51CIECSrK2/LeYuQWJ07RRWTC8gdaJIVAGkKHSuK4lR/D
 3lssK6vcRJDHyoDQB7BNFPz59inGpI3WBdA05DzkArcjxptyVeoYJRzxm4eyUP2Uuv
 8ptP4okq7Fyp/mAa69PaljWPI87N5APdtfYYOeJ+S35ncK2+sf/uuKEAxEaXS0HY4V
 iYDsatuTKTQZA==
From: Mark Brown <broonie@kernel.org>
To: Simon Trimmer <simont@opensource.cirrus.com>
In-Reply-To: <20211115120154.56782-1-simont@opensource.cirrus.com>
References: <20211115120154.56782-1-simont@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: wm_adsp_control_add() error: uninitialized
 symbol 'ret'
Message-Id: <163701929291.675332.10025590314980830752.b4-ty@kernel.org>
Date: Mon, 15 Nov 2021 23:34:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>,
 kernel test robot <lkp@intel.com>
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

On Mon, 15 Nov 2021 12:01:54 +0000, Simon Trimmer wrote:
> This patch fixes the static analysis warning as it is correctly
> indicating a possible code path, it cannot know that for the affected
> firmware versions subname would always be NULL.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: wm_adsp: wm_adsp_control_add() error: uninitialized symbol 'ret'
      commit: a6e849d0007b374fc7fbb18d55941c77aa7c3923

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
