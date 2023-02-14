Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A7E696C36
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 19:03:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 262FBDF2;
	Tue, 14 Feb 2023 19:02:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 262FBDF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676397806;
	bh=VHUzUlzIpZCXjb2uNwe5jMI+kDtHpcMv7VqX9rFj/a0=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gx3Z+zu3nXnZzdyUANE5ogKzWDP/nNGQrOrhmf8r1LjmbJMwHM/WrMtYKzpIXnMr5
	 CQNO6FE2XNeLiTsT2Zkb8ZfnXk3YGzk9v7aVxXUwzqcCUI9MclofioDlv357uFAbqT
	 xtjpWyuinv61qBBnRN1/3FFJ4sAs5iBaB26ZiJvY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD632F80527;
	Tue, 14 Feb 2023 19:01:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81F22F804B2; Tue, 14 Feb 2023 19:01:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79C39F80496
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 19:01:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79C39F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YaeQ4rgo
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CD478617DF;
	Tue, 14 Feb 2023 18:01:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67734C433EF;
	Tue, 14 Feb 2023 18:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676397698;
	bh=VHUzUlzIpZCXjb2uNwe5jMI+kDtHpcMv7VqX9rFj/a0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YaeQ4rgom6KnSyAdKbm6X+b92+oY4AjQdFC0f/ZUyRwYXCcqDdf/NaSz5GpPJX6s9
	 3PM14YGwXD2lHCInfynfMKzCaQ7lV+QAhUAyyOyKiAUhDNiZmEYqjmpAizwSzRsY2j
	 zJI+Ok9Of7Z7pQZ4+VulZwcZnl0hqizBvqVQDOAHjdXZi1TSkqiNtRyaLHdsgkZI8R
	 ZoJ3wPRH2VNYickXJNpHuBWiCyRDeYipMa9uc8vTrf19royEivarh7rIr0tWwjbA5R
	 IU9ALyyNB7lJmBzQaT6gKM1oXixoA+c/FbTgdhEJdidSV5s2qLjWO5CUZXhH0z+iMb
	 yADqIHTOia0EQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Deepak R Varma <drv@mailo.com>
In-Reply-To: <Y+p2Hn0nrtHiKwPR@ubun2204.myguest.virtualbox.org>
References: <Y+p2Hn0nrtHiKwPR@ubun2204.myguest.virtualbox.org>
Subject: Re: [PATCH] ASoC: codecs: wcd934x: Use min macro for comparison
 and assignment
Message-Id: <167639769504.3067697.10737050637043506910.b4-ty@kernel.org>
Date: Tue, 14 Feb 2023 18:01:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: JMTYBQHNHF5ZU2JEDBMN6LNYX4WB2G4Z
X-Message-ID-Hash: JMTYBQHNHF5ZU2JEDBMN6LNYX4WB2G4Z
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Saurabh Singh Sengar <ssengar@microsoft.com>,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JMTYBQHNHF5ZU2JEDBMN6LNYX4WB2G4Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 13 Feb 2023 23:10:46 +0530, Deepak R Varma wrote:
> Simplify code by using min helper macro for logical evaluation and value
> assignment. The change also facilitates code realignment for improved
> readability.
> Proposed change is identified using minmax.cocci Coccinelle script.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd934x: Use min macro for comparison and assignment
      commit: ec285cb999c145f70631f13a284b4696102d06ef

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

