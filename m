Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3041440486
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Oct 2021 22:57:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56D051714;
	Fri, 29 Oct 2021 22:56:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56D051714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635541027;
	bh=LpGNZwT4aagpghW7i3+R2HDAVuJ+NS7X/D1QITONxME=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u7Bybi//yhRRuEasoshhMyFZd7lT+lKSoueZNtYOcfvItPS1AZb4rxeTe+N2W6nyl
	 KmvEJn6eOzNGAKCKj3od3CSuIun2uUgKlST1Jg7HPnFaAV96wm39E6N61QF34jGX6e
	 nfPRWvPVmMYaYzdX+xmkCNimLQfEsjFK4Dqg3mVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2E0EF804E3;
	Fri, 29 Oct 2021 22:55:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B06BDF8025A; Fri, 29 Oct 2021 22:55:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BB61F801EC
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 22:55:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BB61F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rB9CwIZu"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E67BD6108F;
 Fri, 29 Oct 2021 20:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635540896;
 bh=LpGNZwT4aagpghW7i3+R2HDAVuJ+NS7X/D1QITONxME=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rB9CwIZu/hh7B7SMq8+QCo1sf3hqr2uMUTxKWUXjeIXTeKFWRlWMThSmVpfnHsT0b
 p7ay+G6CmdVFywCAuBr/pxzKxEUEIlwkrAP3ntfxUinhbjCMTG3S35ivjryXqEe3mD
 y0aH1YL23XwPqnfCbDEA/L9JP4Vqmd4mScDut9TiDtIuNSmBhXyEnq+Ly/TTY9ivhW
 ZdFC8apao6eirPQztTWW679Juz8COmSLLruzPpQDuQuPIgxOw2aNmOr+hNEKzRIYEQ
 alEcrr434iln6zYgxfjvJEtIxuxz2ZaFBuySiMafWKBSEpo8WWqJoTbRhIcMR941qu
 +RqhQPSmx1S6Q==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20211015161257.27052-1-cezary.rojewski@intel.com>
References: <20211015161257.27052-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/6] ASoC: Sanity checks and soc-topology updates
Message-Id: <163554089570.1997146.12535245005312499427.b4-ty@kernel.org>
Date: Fri, 29 Oct 2021 21:54:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: hdegoede@redhat.com, pierre-louis.bossart@linux.intel.com, tiwai@suse.com
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

On Fri, 15 Oct 2021 18:12:51 +0200, Cezary Rojewski wrote:
> Couple of soc-topology related changes and a use-after-free fix. Said fix
> and two sanity checks for soc-topology lead the way. While the
> use-after-free is quite obvious, the sanity checks are here to cover for
> cases where user malformed the topology file -or- access to filesystem
> somehow got interrupted during copy operation. We shouldn't be reading
> outside the file boundary.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: core: Remove invalid snd_soc_component_set_jack call
      commit: 7db53c21b1c3c25676d1125049bc92c756421cd6
[2/6] ASoC: topology: Add header payload_size verification
      commit: 86e2d14b6d1a68941b6c0ef39502ec1433b680cb
[3/6] ASoC: topology: Check for dapm widget completeness
      commit: 2e288333e9e0a14f9895321a848992b25a0e5563
[4/6] ASoC: topology: Use correct device for prints
      commit: 2a710bb35a5abfbca48ed7c229205ace472692d3
[5/6] ASoC: topology: Change topology device to card device
      commit: f714fbc1e89a3533b2578e0c90ce4f5c05a57f96
[6/6] ASoC: Stop dummy from overriding hwparams
      commit: 6c504663ba2ee2abeaf5622e27082819326c1bd4

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
