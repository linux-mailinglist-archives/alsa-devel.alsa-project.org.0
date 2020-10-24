Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE70297A02
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Oct 2020 02:31:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C076C17EF;
	Sat, 24 Oct 2020 02:30:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C076C17EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603499476;
	bh=Zgdma++f2RWFh6ISBni+X7NW+YEY/7BtoIpGuw7+MLY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VNfI+QmbADqyCWTwCAa0H86YC64A+TU7/cGQd+yKDMYpR8WmzzrngtxjN9IYxktC6
	 xffs1JmJ1XqCOMeauGvslzzqfeccCHdrEBoe7SGkeXOjkYptQNeBntEjVGhYCmhFbn
	 dmK+JCo4FD8uPEt0AZr0bd3EzoIRte98p+7FYcMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E709F800BD;
	Sat, 24 Oct 2020 02:29:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AAF9F804B3; Sat, 24 Oct 2020 02:28:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92DB2F80253
 for <alsa-devel@alsa-project.org>; Sat, 24 Oct 2020 02:28:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92DB2F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1uy7e3nC"
Received: from localhost (cpc102338-sgyl38-2-0-cust404.18-2.cable.virginm.net
 [77.102.33.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E1C222274;
 Sat, 24 Oct 2020 00:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603499330;
 bh=Zgdma++f2RWFh6ISBni+X7NW+YEY/7BtoIpGuw7+MLY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=1uy7e3nCRexgvwSFYCjTZC2MQpsQhdKfPyLCNrDjRDHfHuG5quS6IKr9BLlDt5/fh
 /XwlGCaMmfGJjyPW/NYwoxgSvZLav1sryhOASFnUJ6PcEgJj4W2/dFVccPzXdL9Dkx
 dRRPk1894fyBv4Fb9XYJQV/gGW5WwnJ4F6TGI664=
Date: Sat, 24 Oct 2020 01:28:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20201021182419.1160391-1-kai.vehmanen@linux.intel.com>
References: <20201021182419.1160391-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: loader: handle all SOF_IPC_EXT types
Message-Id: <160349931942.28438.961402420046224651.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 daniel.baluta@nxp.com, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, ranjani.sridharan@linux.intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On Wed, 21 Oct 2020 21:24:19 +0300, Kai Vehmanen wrote:
> Do not emit a warning for extended firmware header fields that are
> not used by kernel. This creates unnecessary noise to kernel logs like:
> 
> sof-audio-pci 0000:00:1f.3: warning: unknown ext header type 3 size 0x1c
> sof-audio-pci 0000:00:1f.3: warning: unknown ext header type 4 size 0x10

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: loader: handle all SOF_IPC_EXT types
      commit: 6e5329c6e6032cd997400b43b8299f607a61883e

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
