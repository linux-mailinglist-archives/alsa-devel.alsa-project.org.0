Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A25DD6C7FC3
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 15:21:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB1C2E93;
	Fri, 24 Mar 2023 15:20:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB1C2E93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679667674;
	bh=dJfy8OilMODSedOI7pACYjRnM5TgCX4zPYcoJUl6/oE=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZH4+N9lBFztJpg6c2ZrI3MmpTv1w6izU3q+QWASmInGO7h3nydOPQUD7eUMO7evAu
	 vbPBWfqeaGc3DmVTucDMhIhMCMo0akSgx8Ys1oBza2/CrmMxViPFr9It4QTp3LYY2T
	 cTetkxUutpnNBRSdM3roFsRCzUV0RzO4JJRrNE/Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09B5EF804FE;
	Fri, 24 Mar 2023 15:19:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA719F802E8; Fri, 24 Mar 2023 15:19:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A68FDF8027B
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 15:19:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A68FDF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=N9JCIJ4i
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DC0E662AD6;
	Fri, 24 Mar 2023 14:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C651DC433D2;
	Fri, 24 Mar 2023 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679667561;
	bh=dJfy8OilMODSedOI7pACYjRnM5TgCX4zPYcoJUl6/oE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=N9JCIJ4iCqITSnbXftVrNfo9VS0OqlzqKVX8dX8tct7NgpHQTLR1JEvfoYX8Ijf3c
	 C0ohXZAufysBv9a7DnZs68xjZaPkLMvhZEnGl6xJ59TbEqxyzWJlKVBXR3aGiprmNR
	 l/FCv7B+Fxtu/7oix31N/mFGclmhKRi6y/HJ/U3pNzfs+h1Dev8Wx7WMLiq0JMTONT
	 vLlfIDahD3kVKQ8nDazqWcar/I/nV1Pa+1fPl5udWQTrciPr3b/ueuSAReXekUHUGQ
	 Tx88E3fTFl0XeTs1K0254BKTA5/QoZyDtoTebCHVvwc050kqTyISuTGooHLJnBZ4kO
	 A3dSKTTvnzcWA==
From: Mark Brown <broonie@kernel.org>
To: james.schulman@cirrus.com,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230324022303.121485-1-jiapeng.chong@linux.alibaba.com>
References: <20230324022303.121485-1-jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] ASoC: cs35l56: Fix an unsigned comparison which can
 never be negative
Message-Id: <167966755845.2601012.3004981341441229674.b4-ty@kernel.org>
Date: Fri, 24 Mar 2023 14:19:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: MEYNQPZRKBWGSSLMHO5NA22PXPDB555T
X-Message-ID-Hash: MEYNQPZRKBWGSSLMHO5NA22PXPDB555T
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: david.rhodes@cirrus.com, tanureal@opensource.cirrus.com,
 rf@opensource.cirrus.com, lgirdwood@gmail.com, tiwai@suse.com,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MEYNQPZRKBWGSSLMHO5NA22PXPDB555T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 24 Mar 2023 10:23:03 +0800, Jiapeng Chong wrote:
> The variable 'rv' is defined as unsigned type, so the following if
> statement is invalid, we can modify the type of rv to int.
> if (rv < 0) {
> 	dev_err(cs35l56->dev, "irq: failed to get pm_runtime:
> 		%d\n", rv);
> 	goto err_unlock;
> }
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Fix an unsigned comparison which can never be negative
      commit: ab76c891a687ae871f7e76dbf9bc3a0e32b53423

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

