Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C949E3945A3
	for <lists+alsa-devel@lfdr.de>; Fri, 28 May 2021 18:06:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7468D16DE;
	Fri, 28 May 2021 18:05:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7468D16DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622217973;
	bh=b8j22H6agOcXtMfoEnjLawedaqeB8aZSsaJFzSVtfdk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lrCmZfmRBQy5o63WQq/g/smgqjkghK4LVbhvtXBOeuh5UEWT1oGX/hUy2AFHFTPQv
	 v+TnVCeq4+7Igsg/Rd/n07TtSjDb6nX1Qyc7y1dxNqlNpa06QTYSzVwSjm8d1v0QVf
	 cmnr0rHH8bsuLxasjFU1MSwz9nNNnZQo+CkxQE0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E122F804B2;
	Fri, 28 May 2021 18:04:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C61F7F804AB; Fri, 28 May 2021 18:04:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 682D0F802BE
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 18:04:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 682D0F802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ULtD+uzV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nwute3UrzVQqFBNxqrewf6gg7PyJgURJocWfKosgNeY=; b=ULtD+uzVQ4LcEj/Dzs1t6sBm4l
 uzXv89sxSYartXgjeqZCNnzDeYiXNDe0Gz0yvmHFu0bZ7lAnJDzFDyiqdT/LY0EPe8+FhlNJwTPYM
 l83zqBt9COdU/BFxbr410i5Dds2ImueWiLWssm4RshIGl27r+e+yRDAHl9Nxx1TdvCK0=;
Received: from cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 ([92.233.91.117] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1lmeyD-006czX-TC; Fri, 28 May 2021 16:04:21 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 4F7ECD078F8; Fri, 28 May 2021 17:04:21 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 00/11] ASoC: rsnd: tidyup and fixup rare MIXer issue
Date: Fri, 28 May 2021 17:04:16 +0100
Message-Id: <162221783191.3504698.9640728463223524915.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <878s40nbmc.wl-kuninori.morimoto.gx@renesas.com>
References: <878s40nbmc.wl-kuninori.morimoto.gx@renesas.com>
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

On 27 May 2021 11:39:39 +0900, Kuninori Morimoto wrote:
> These are v2 of tidyup patch, and rare MIXer issue fixup patch for
> Renesas Sound driver.
> 
> 1 - 6 : tidyup for rsnd driver
> 7     : add debugfs support
> 8     : fixup rare MIXer issue
> 9 - 11: tidyup for rsnd driver
> 
> [...]

Applied, thanks!

[01/11] ASoC: rsnd: call unregister for null_hw when removed
        commit: 965386c97616c401b34cba4e9e3bfc9c6b215359
[02/11] ASoC: rsnd: ignore runtime NULL case at rsnd_runtime_channel_original_with_params()
        commit: 6da8f00e7ac277ddfc72e255328dc5ff0378c3ee
[03/11] ASoC: rsnd: attach SSIU when SSI was DMA mode
        commit: ab62e8a8bce1cc3b730462a7a462107db634bd5c
[04/11] ASoC: rsnd: check BUIF error everytime
        commit: 54e81e9446377c36fdcb952ca7db43e59857e0d7
[05/11] ASoC: rsnd: indicate unknown error at rsnd_dai_call()
        commit: 9ff07d19fb28ce8544d3ee4755673020b00487e6
[06/11] ASoC: rsnd: incidate irq error message
        commit: 1788a1520185e69f62e56dd23b33a0992e8187aa
[07/11] ASoC: rsnd: add debugfs support
        commit: 1f9c82b5ab83ff24f5c2b62bf9a912e4aef8905e
[08/11] ASoC: rsnd: protect mod->status
        commit: b43b8ae87c8e0a8b81a26cfc39bd157c5f53ae14
[09/11] ASoC: rsnd: implement BUSIF related code in ssiu.c
        commit: 83b220cf8eb2aa9dbe0007bcf43c5e305fe1986d
[10/11] ASoC: rsnd: tidyup rsnd_ssiu_busif_err_status_clear()
        commit: cfb7b8bf1e2d660583dd91d870cec2f6728cbdbc
[11/11] ASoC: rsnd: tidyup rsnd_ssiu_busif_err_irq_ctrl()
        commit: 0ab000e5e57e6dcb34605fbdee92a1b0947606e0

Best regards,
-- 
Mark Brown,,, <broonie@kernel.org>
