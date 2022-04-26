Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F03A15101C2
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 17:21:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 707CD1866;
	Tue, 26 Apr 2022 17:20:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 707CD1866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650986485;
	bh=vmoJSaUJRZdsSIUhqg8W6CJXq1/wRlWBeL5HX4oxyI8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fuHjaIApmwfw7L/SeGcLlGYEFhEWs27Fut6llpkv/3FwhvZYl68ElLCWJvRzAntgf
	 A7SPzy9vaAk2gWQxEtB8IIavXJEC5oN3fMEDNkWKG4iIRr1N4wIEW3TXtmOm7Cq7qw
	 e5/z9N/xPhF1D/xZQ1cgMNo1Vhcl/RvgTCo8PpvE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E75A3F800FA;
	Tue, 26 Apr 2022 17:20:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D5B8F800FA; Tue, 26 Apr 2022 17:20:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92EF7F800FA
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 17:20:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92EF7F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eAmJ3vou"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E0BC461973;
 Tue, 26 Apr 2022 15:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E52C385AA;
 Tue, 26 Apr 2022 15:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650986414;
 bh=vmoJSaUJRZdsSIUhqg8W6CJXq1/wRlWBeL5HX4oxyI8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=eAmJ3vou1rVFzZMAg8AB6n2pxOq9WzJr42sOBcLdXWqBzyGgTRhCQVyJPZUWgCfNU
 tUMRh02PwJUVuB+J8WZgUY5hCMNd7+rlNhvlrBhwPHz74vRxl0YWs0al/1m8ig7ANV
 a/pV7xwGdHbusly6uQ1DdDtxRRNgOYQTJka+nMvZt9jySH6jWA7Tzd3RlkeJ4ooEOX
 X5XOzQsreQR+AlfTNPZ+VaCxYqXk0BPCQ2F6akf0idTCp9w3tq+doS6CU7lbz7PVV7
 pa4SU1vy+wKfTb2GKvFBedTNk6SGlp9s9SXtWyhlo/TXAWfmhIAvxbBXEstCA8YyTP
 eU9WPVfKhEt5Q==
From: Mark Brown <broonie@kernel.org>
To: broonie@kernel.org, lgirdwood@gmail.com
In-Reply-To: <20220423131239.3375261-1-broonie@kernel.org>
References: <20220423131239.3375261-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: ops: Validate input values in
 snd_soc_put_volsw_range()
Message-Id: <165098641328.1230967.7597927501953767931.b4-ty@kernel.org>
Date: Tue, 26 Apr 2022 16:20:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Sat, 23 Apr 2022 14:12:39 +0100, Mark Brown wrote:
> Check that values written via snd_soc_put_volsw_range() are
> within the range advertised by the control, ensuring that we
> don't write out of spec values to the hardware.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ops: Validate input values in snd_soc_put_volsw_range()
      commit: aa22125c57f9e577f0a667e4fa07fc3fa8ca1e60

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
