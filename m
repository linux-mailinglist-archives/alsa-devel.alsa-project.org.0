Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE65C3945A7
	for <lists+alsa-devel@lfdr.de>; Fri, 28 May 2021 18:06:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90D7D16E1;
	Fri, 28 May 2021 18:05:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90D7D16E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622218009;
	bh=xL6FsmUc/ZTDkPTX1ZxwfgUTgp3De0yfSM7zwGRGWXQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QnkUUNt2cEFeA63LYPoTd6qwdKtL4tVgiMGVRxQjMQF9gvyTW5l7Q7xg62xMBHyr2
	 I3kKLUsIhrgEofUgIqwGq34H+FIXey71+wE5/8ENbGNaa/VWtY9RYuws+oKryWgnNf
	 /D5wu/qdAODB6hYesYWuRgaFlyDEsc4uc8HNoOYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 161F3F804B4;
	Fri, 28 May 2021 18:04:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52DFFF804AD; Fri, 28 May 2021 18:04:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D8ADF804A9
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 18:04:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D8ADF804A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="sKJWWAwd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rXRxF7I/R2n0n4NGf6nx8TBg8ilBfU0M0zOrk+C4oCI=; b=sKJWWAwdfkymwpgG6ujNd58kDV
 idWQQcW8nu7riDyITLZSmkgAB4dWfHWGSHsF/UmlOIU/WYFOeP9ye0kws53UWaviCp33qsTP3zoqJ
 4zZ5S73ygEKpR/YRBg9A35JSXmUrBBFGnBA/oWSnhBbyYX3exT0PMiIrWzELct6qdq6A=;
Received: from cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 ([92.233.91.117] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1lmeyD-006cza-U1; Fri, 28 May 2021 16:04:21 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 54F78D078FF; Fri, 28 May 2021 17:04:21 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 00/10] ASoC: rsnd: tidyup and fixup rare MIXer issue
Date: Fri, 28 May 2021 17:04:18 +0100
Message-Id: <162221783191.3504698.15134854994470041055.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <87mtsjof3w.wl-kuninori.morimoto.gx@renesas.com>
References: <87mtsjof3w.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: broonie@kernel.org, Mark@sirena.org.uk, Brown@sirena.org.uk,
 Linux-ALSA <alsa-devel@alsa-project.org>
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

From: Mark Brown,,, <broonie@kernel.org>

On 25 May 2021 09:02:11 +0900, Kuninori Morimoto wrote:
> These are tidyup patch, and rare MIXer issue fixup patch for
> Renesas Sound driver.
> 
> 1 - 5 : tidyup for rsnd driver
> 6     : add debugfs support
> 7     : fixup rare MIXer issue
> 8 - 10: tidyup for rsnd driver
> 
> [...]

Applied, thanks!

[01/10] ASoC: rsnd: ignore runtime NULL case at rsnd_runtime_channel_original_with_params()
        commit: 6da8f00e7ac277ddfc72e255328dc5ff0378c3ee
[02/10] ASoC: rsnd: attach SSIU when SSI was DMA mode
        commit: ab62e8a8bce1cc3b730462a7a462107db634bd5c
[03/10] ASoC: rsnd: check BUIF error everytime
        commit: 54e81e9446377c36fdcb952ca7db43e59857e0d7
[04/10] ASoC: rsnd: indicate unknown error at rsnd_dai_call()
        commit: 9ff07d19fb28ce8544d3ee4755673020b00487e6
[05/10] ASoC: rsnd: incidate irq error message
        commit: 1788a1520185e69f62e56dd23b33a0992e8187aa
[06/10] ASoC: rsnd: add debugfs support
        commit: 1f9c82b5ab83ff24f5c2b62bf9a912e4aef8905e
[07/10] ASoC: rsnd: protect mod->status
        commit: b43b8ae87c8e0a8b81a26cfc39bd157c5f53ae14
[08/10] ASoC: rsnd: implement BUSIF related code in ssiu.c
        commit: 83b220cf8eb2aa9dbe0007bcf43c5e305fe1986d
[09/10] ASoC: rsnd: tidyup rsnd_ssiu_busif_err_status_clear()
        commit: cfb7b8bf1e2d660583dd91d870cec2f6728cbdbc
[10/10] ASoC: rsnd: tidyup rsnd_ssiu_busif_err_irq_ctrl()
        commit: 0ab000e5e57e6dcb34605fbdee92a1b0947606e0

Best regards,
-- 
Mark Brown,,, <broonie@kernel.org>
