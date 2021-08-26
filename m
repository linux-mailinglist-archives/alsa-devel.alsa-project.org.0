Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 475013F8DFA
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 20:41:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E04D16D1;
	Thu, 26 Aug 2021 20:40:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E04D16D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630003262;
	bh=r+urrRQA2yLLyahu+bDChogdxQv86Sztg+aBBgOzsFY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZOrnbpTznI2B6NEp1UhJHyKD1E6bqRRsqRi4H6HOyXzyE2mSVD8Rb0XxxZATgXTY8
	 YtDMUHizCfxvxNRmwFvMlNNlMxF44dbLZ/l3OM1OAd9xLUvbvD3T1tnbT4fRMA6nXA
	 5QCWEIvBVuI6giOaLgdbRsBf38AoJMzA2m6ifRd4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16E4EF804B4;
	Thu, 26 Aug 2021 20:39:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77393F801D8; Thu, 26 Aug 2021 20:39:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03A30F80054
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 20:39:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03A30F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="nY0l6Yqt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I4nxBP5jaafm6BB+agXz3TbfW0EQ6exBVO8JfJK1BFI=; b=nY0l6Yqt4WwxEbZbpVORBQZT/R
 n9Y968HlQWW8J8///jTZSdTRjs+Jf5JojtMc/XYvDRaiTij8ADk7TjBdVpYRgAxR6LvKvsU+drnu9
 kJ9Tt59n3OdoQOixOnGMAWfgokxKC0h9VxB1Hbu3yDc8h+vwXc5tyW1Ct/lBWfr2vj3c=;
Received: from 188.30.109.46.threembb.co.uk ([188.30.109.46]
 helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1mJKHR-00FYOJ-J1; Thu, 26 Aug 2021 18:39:13 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 281A3D14302; Thu, 26 Aug 2021 19:30:25 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: bgoswami@codeaurora.org, perex@perex.cz,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 srinivas.kandagatla@linaro.org, tiwai@suse.com, vkoul@kernel.org,
 lgirdwood@gmail.com
Subject: Re: [PATCH 0/3] ASoC: wcd9335: Firx some resources leak in the probe
 and remove function
Date: Thu, 26 Aug 2021 19:30:25 +0100
Message-Id: <163000225499.699341.15649110189101404680.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1629091028.git.christophe.jaillet@wanadoo.fr>
References: <cover.1629091028.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Brown@sirena.org.uk,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 broonie@kernel.org, Mark@sirena.org.uk
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

On Mon, 16 Aug 2021 07:25:01 +0200, Christophe JAILLET wrote:
> The first 2 patches are sraightforward and look logical to me.
> 
> However, the 3rd one in purely speculative. It is based on the fact that a
> comment states that we enable some irqs on some slave ports. That said, it writes
> 0xFF in some registers.
> 
> So, I guess that we should disable these irqs when the driver is removed. That
> said, writing 0x00 at the same place looks logical to me.
> 
> [...]

Applied, thanks!

[1/3] ASoC: wcd9335: Fix a double irq free in the remove function
      commit: 7a6a723e98aa45f393e6add18f7309dfffa1b0e2
[2/3] ASoC: wcd9335: Fix a memory leak in the error handling path of the probe function
      commit: fc6fc81caa63900cef9ebb8b2e365c3ed5a9effb
[3/3] ASoC: wcd9335: Disable irq on slave ports in the remove function
      commit: d3efd26af2e044ff2b48d38bb871630282d77e60

Best regards,
-- 
Mark Brown,,, <broonie@kernel.org>
