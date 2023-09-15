Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFB47A1E81
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 14:21:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF34BDEC;
	Fri, 15 Sep 2023 14:20:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF34BDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694780469;
	bh=/KtARGUTNUYC8Ta5XYT5RkLqgJzSTPMc685aQmGQyy8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tbIHLWhkph7PiXuiKO3TPyFS8xKYnW1Tp5gxBjUojNdXUEj1fnVN3rSPNtZvtG6iA
	 JP3SDg64vbR6oTM1T8JdtIeN3YYJ1zihmliPGgMebRiJePpYyWo6SmcjCxYTi5spGW
	 jJ3hkhwe3B6q4JUSFbOGnOlD1oosPvdxZxgOkJ54=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83F0AF805AB; Fri, 15 Sep 2023 14:18:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE75FF805A1;
	Fri, 15 Sep 2023 14:18:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41EC9F80564; Fri, 15 Sep 2023 14:18:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E997F80425
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 14:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E997F80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ksDRS4lH
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DBCE1B82DAD;
	Fri, 15 Sep 2023 12:18:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22177C433C7;
	Fri, 15 Sep 2023 12:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694780325;
	bh=/KtARGUTNUYC8Ta5XYT5RkLqgJzSTPMc685aQmGQyy8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ksDRS4lHnXSTx570FtYG6CkhT/488rFhigHVkAnyxOwJnclr/nWb47WJkwZXapJyT
	 3NxfGQ/yTV6vYVh/66GzUNcLauKm/nax+unW3ndN5x00TqNcT+GYjY8HaCAX+UZ9Ek
	 s3Ux/zSHRrV1c8rfpnxfRLXs46SIVWzyKJW5HnV6nzy8IUKrT/dkOa4p0DYLPUF5Nb
	 z2ldAWD3+XGabuDKhnWNHoUO+biRprqtPDYxIwD7+73iRlCnjw9mDz8AUty6Hozn6G
	 DksFgAO8b9adC4HWHLzUP2yKOk9OzlsXzPpuc++B3fZwCno/SJSBcw8c2JRh3cYVuE
	 10lYzQ2DIkSJQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com
In-Reply-To: <20230914132504.18463-1-peter.ujfalusi@linux.intel.com>
References: <20230914132504.18463-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: SOF: ipc4-topology: fix wrong sizeof argument
Message-Id: <169478032268.22068.13080757296727762399.b4-ty@kernel.org>
Date: Fri, 15 Sep 2023 13:18:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: RKQD7YYMVQ3TATP4XN3E75TA3NR3O44I
X-Message-ID-Hash: RKQD7YYMVQ3TATP4XN3E75TA3NR3O44I
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RKQD7YYMVQ3TATP4XN3E75TA3NR3O44I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 14 Sep 2023 16:25:04 +0300, Peter Ujfalusi wrote:
> available_fmt is a pointer.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: fix wrong sizeof argument
      commit: 6ba59c008f08e84b3c87be10f3391c9735e4f833

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

