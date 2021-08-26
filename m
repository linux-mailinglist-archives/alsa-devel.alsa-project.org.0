Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B5B3F8DF8
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 20:40:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D71916CA;
	Thu, 26 Aug 2021 20:39:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D71916CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630003239;
	bh=rnzApQgbNlApnqZsIYuxr44X+xOyGpF+rRTR2/5/u6w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sx8fHmbH0CPgZXLVZRqzxBGrJiO3gi38eBi4Lvz8ZZaPflwkbPczOy65Q+sC8qV3+
	 pcN8IMLA95qKj+YXqKvp7YIYjCtZjdGiXL/DReqZY0rVBStcwJkCNUFf4dTI89yK7+
	 kHsZNejT+ypmZZa3kcDhgY5SbZhkDu/X9F8Z4jxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A45BF80224;
	Thu, 26 Aug 2021 20:39:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51F0EF80224; Thu, 26 Aug 2021 20:39:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06A13F8013F
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 20:39:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06A13F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="iUEaCRNf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LRgjmQ7rfEXS7JLHe9cxJs/oW5qgVFqI0wtw0GAw3LI=; b=iUEaCRNfoda7Yw8eGsnTInFlSK
 zUDJxTXcWDgyW6oG3wvPxwt197Hzn/IfP7lpz1R5NHWcWJacydjQcopyT7Ng8I6BZXmoZFE/O99c6
 F2dqiKFmyvIEc3QHEcei0NEChGXjdL70FZkyNri7HUmhfRurxH76riiey+SF+QpcuRp0=;
Received: from 188.30.109.46.threembb.co.uk ([188.30.109.46]
 helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1mJKHR-00FYOI-Iu; Thu, 26 Aug 2021 18:39:13 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 25AD0D14301; Thu, 26 Aug 2021 19:30:25 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] ASoC: soc-pcm: protect BE dailink state changes
 in trigger
Date: Thu, 26 Aug 2021 19:30:24 +0100
Message-Id: <163000225499.699341.16303629557242399115.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210817164054.250028-2-pierre-louis.bossart@linux.intel.com>
References: <20210817164054.250028-1-pierre-louis.bossart@linux.intel.com>
 <20210817164054.250028-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Brown@sirena.org.uk, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 tiwai@suse.de, Takashi Iwai <tiwai@suse.com>,
 open list <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 Mark@sirena.org.uk
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

On Tue, 17 Aug 2021 11:40:53 -0500, Pierre-Louis Bossart wrote:
> When more than one FE is connected to a BE, e.g. in a mixing use case,
> the BE can be triggered multiple times when the FE are opened/started
> concurrently. This race condition is problematic in the case of
> SoundWire BE dailinks, and this is not desirable in a general
> case. The code carefully checks when the BE can be stopped or
> hw_free'ed, but the trigger code does not use any mutual exclusion.
> 
> [...]

Applied, thanks!

[1/2] ASoC: soc-pcm: protect BE dailink state changes in trigger
      commit: 0c75fc7193387776c10f7c7b440d93496e3d5e21
[2/2] ASoC: soc-pcm: test refcount before triggering
      commit: 6479f7588651cbc9c91e61c20ff39119cbc8feba

Best regards,
-- 
Mark Brown,,, <broonie@kernel.org>
