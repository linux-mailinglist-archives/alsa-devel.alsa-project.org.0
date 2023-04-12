Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 472CA6DFBB9
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 18:48:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAF2D10A0;
	Wed, 12 Apr 2023 18:47:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAF2D10A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681318085;
	bh=XM3VTF9dFi5YbRjKUa+Y6Ssn+YGK93m5lJAYBzcRxNM=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UUfjSgRdrMFV6Va5EIr5Hi+ak+P8kKnQe9LjXWIxZLLp/XyiTscMFa71G27EE78yo
	 ZXTmYVEf0qrhaZ0jFMgnFVJZhIAP6v1X84EeJISuwKdjPOcoq2BdRPFJe78+6TFg2K
	 8OdBTf8J4cl1vcuCBxge7YBvQjTkb5YVPDWIYzZI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08124F8052E;
	Wed, 12 Apr 2023 18:46:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1998BF8032B; Wed, 12 Apr 2023 18:46:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 303D5F80149
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 18:46:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 303D5F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=quou7uGD
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AEE3963590;
	Wed, 12 Apr 2023 16:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E607BC433EF;
	Wed, 12 Apr 2023 16:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681317970;
	bh=XM3VTF9dFi5YbRjKUa+Y6Ssn+YGK93m5lJAYBzcRxNM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=quou7uGDHN7Eds63IyFgKvwdkM9mv+MaJ3NVapQSQq+FaAYhmbcGbGFhX6eIR65tH
	 k2hxl+BPcSA2OEfaxRJrECNdBgexCd4PR3z2urRQnVGJDXwBARvFvu4HdLA4/omtDX
	 fdE/J1xDeJt/q0kNAlqjENfyIf8Y5ZIOsCKZo04RYiRlg5MZMX0fiTGDOqDXbXWCir
	 UHkzfvZ8ck6kwHyH7XS7K4JY+4GPbI8AGTYuOOGGzrMNuWdkDiZuPobwZ/rXcHdJis
	 aCw2FhzVM79+aA2ilAbINaAG+WTSFT5ZEHKU6ICiD5xIsu5fvDcUNSefgeOrugaqSo
	 lxi7AXCjb4TmQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Ying Liu <lyre@hust.edu.cn>
In-Reply-To: <20230411170912.1939906-1-lyre@hust.edu.cn>
References: <20230411170912.1939906-1-lyre@hust.edu.cn>
Subject: Re: [PATCH] ASoC: tas5720: add missing unwind goto in
 tas5720_codec_probe
Message-Id: <168131796756.93781.9166209265762047431.b4-ty@kernel.org>
Date: Wed, 12 Apr 2023 17:46:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: DPRXNRS37ADJ3LSKV6ERKVKIJGHZEUWC
X-Message-ID-Hash: DPRXNRS37ADJ3LSKV6ERKVKIJGHZEUWC
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: HUST OS Kernel Contribution <hust-os-kernel-patches@googlegroups.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DPRXNRS37ADJ3LSKV6ERKVKIJGHZEUWC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Apr 2023 01:09:12 +0800, Ying Liu wrote:
> Smatch complains that missing unwind goto in tas5720_codec_probe.
> 
> When tas5720 has an invalid devtype, it is expected to invoke
> regulator_bulk_disable to handle the failure. But the default
> option return an error code directly. Fix it by reusing the
> probe_fail label.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas5720: add missing unwind goto in tas5720_codec_probe
      commit: d93ee84e3eb5d1afc081e57ca37f1411a01f2c94

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

