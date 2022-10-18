Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 716F8602A2B
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 13:30:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 148CF9BFA;
	Tue, 18 Oct 2022 13:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 148CF9BFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666092656;
	bh=2WaQRiHTmvcUWsaqC+uuKUaRlQvcNK/D5SC7IqqYZkA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OJvjRNh/m9w0zBLrh4PeXJWu2WOuWk+vckOB/u5qczKSiDlOO4q+8fIAn271PiSlc
	 XcSozG8fmFZpL1SXhMktC+t8QOKjaI1MiG4KdFQiErn7q2ESVtSGfZQiPuF3p2B0BQ
	 ZVHcKiouaRZFtdhl+KeHjyb1osjSbbtwgsGfJOsg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1B33F80568;
	Tue, 18 Oct 2022 13:28:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18776F8055B; Tue, 18 Oct 2022 13:28:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E7BDF80549
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 13:28:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E7BDF80549
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GpNaJg7F"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9E306B81EAA;
 Tue, 18 Oct 2022 11:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72814C433D6;
 Tue, 18 Oct 2022 11:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666092506;
 bh=2WaQRiHTmvcUWsaqC+uuKUaRlQvcNK/D5SC7IqqYZkA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GpNaJg7F6qGMlJB+p9vv6sO83YbXa0n7mB4RqXYTXYynFI82BGrHYrvZGoMD7DOrq
 OcAlyol3RKdBMmurGCy9I04bXwcxKZhQCHF3RqAup46L9DPdj6hptg65d9nlOP4XGO
 aObPQoD6L9NIVxaYdSOcrl7+Ij00+mDejhWSbhMQkYI74yFllLO7omQg8l9C5mzP82
 zOR0UK4tQkHhd+sXSTxBRLZIDIKq2u8nbjU1j7F9r7JhQwFEjkIHBkjcrVfMqN1kHh
 k2hqkp7jasoPsNc4iYP1PpQNtg57yToFHOhKpAoDYJi2EtlAs0TDzKQHlry2+gAohp
 +JB9Fss4KMQpA==
From: Mark Brown <broonie@kernel.org>
To: asahi@lists.linux.dev, alsa-devel@alsa-project.org,
 Yang Yingliang <yangyingliang@huawei.com>
In-Reply-To: <20220921153123.1508144-1-yangyingliang@huawei.com>
References: <20220921153123.1508144-1-yangyingliang@huawei.com>
Subject: Re: [PATCH -next] ASoC: cs42l83: change cs42l83_regmap to static
Message-Id: <166609250519.155136.17284249606778071645.b4-ty@kernel.org>
Date: Tue, 18 Oct 2022 12:28:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: povik+lin@cutebit.org
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

On Wed, 21 Sep 2022 23:31:23 +0800, Yang Yingliang wrote:
> cs42l83_regmap is only used in cs42l83-i2c.c now, change it to static.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l83: change cs42l83_regmap to static
      commit: fb07a8493a7b205116c9825b16267a07ffae129c

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
