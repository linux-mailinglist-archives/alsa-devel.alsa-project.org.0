Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 158D82A315B
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 18:21:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8D1A1733;
	Mon,  2 Nov 2020 18:20:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8D1A1733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604337659;
	bh=DK5hG7Hl+usrKzyzofkycl7KuXmXYmJFS7OX+Znve1U=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ViwPiAdTJRzP4FQxbZlRMroL/MwyP05tTJx/9yK6DatbFndMEs0I89yF3jAV0FkdG
	 YZ5z50Fxie+P78B6mpF0+71Qzg2LjQu9xcfiSi4AldP2Of0TYFdOZbjkrWTU3UOLA2
	 B2z9s7+uOs1NhKmiyCZvmAosDgA4WjSmQxpOWAVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3CFBF8012B;
	Mon,  2 Nov 2020 18:18:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 026B3F80232; Mon,  2 Nov 2020 18:18:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68B48F8012B
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 18:18:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68B48F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Epznq/QL"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE5E821D91;
 Mon,  2 Nov 2020 17:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604337501;
 bh=DK5hG7Hl+usrKzyzofkycl7KuXmXYmJFS7OX+Znve1U=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Epznq/QLQV+OUXgaAnagCRngDd7sAginMJhmFLejpPgmsHdhDOBZew7NH4j8xiD5n
 wUSjDU4NLAjOlpa3pNUJ5LRN+w6XgX0j1OL+kb8lblgDkYdBrLp6RAeykJH+Z/5dK+
 zOmy1ZpD03Ka5Xc6Br8vzl+M88V0sSzHNV2/2kE4=
Date: Mon, 02 Nov 2020 17:18:13 +0000
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, f.fainelli@gmail.com, sbranden@broadcom.com,
 rjui@broadcom.com, sw0312.kim@samsung.com, ranjani.sridharan@linux.intel.com,
 kuninori.morimoto.gx@renesas.com, perex@perex.cz,
 "trix@redhat.com" <trix@redhat.com>, lgirdwood@gmail.com,
 nsaenzjulienne@suse.de
In-Reply-To: <20201101160037.2295512-1-trix@redhat.com>
References: <20201101160037.2295512-1-trix@redhat.com>
Subject: Re: [PATCH] ASoC: bcm2835-i2s: remove unneeded semicolon
Message-Id: <160433748157.18840.3548192910799118546.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, bcm-kernel-feedback-list@broadcom.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
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

On Sun, 1 Nov 2020 08:00:37 -0800, trix@redhat.com wrote:
> A semicolon is not needed after a switch statement.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: bcm2835-i2s: remove unneeded semicolon
      commit: 46713ed258695e2de00ab2738160f89220c0a976

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
