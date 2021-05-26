Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44780392175
	for <lists+alsa-devel@lfdr.de>; Wed, 26 May 2021 22:24:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9D78171C;
	Wed, 26 May 2021 22:24:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9D78171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622060697;
	bh=Rnub20E7d/Q+YresNLWjUPQud71JTZ9FDk3JoWaB4Ac=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pbk17xmTKbeSRXMVW337XuJ1vmiW547cCqNCUMgpLAV9jG+g6N4fEbEf68qa4QdxU
	 odStkivzzlc+yq+chviTiq5WGo0b3gWDNPd2VHIekb3atLxxLhnfGMBK3YPFxUsJ5B
	 A2O7fAUN92LGWk5/j/a6tgNPDIXgBwYH8ABQEDfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73D6FF804AB;
	Wed, 26 May 2021 22:22:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2779F80212; Wed, 26 May 2021 22:22:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61E2BF80264
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 22:21:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61E2BF80264
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="TM1mcR3j"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FR4Jrc6UzDYcZneMNMkrrs/GKN+Fv8BlCPwuM+IslNs=; b=TM1mcR3jz+pbT0+xUzPbzVI5pz
 vjlW+weomgBYv5VxfPqNWTRiHlAssqwTe64OIZUbIDXjhVKcH0FflrPsUVm0faDv0kcBPgsyatCC2
 bdo9UYvixrXrMkhZs1AVGp8p+jF4om7Lpf0tFhE9+gqKIDjoObLihUppyYCt/wAVTCHQ=;
Received: from 94.196.90.140.threembb.co.uk ([94.196.90.140]
 helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1lm02H-0067nf-Pt; Wed, 26 May 2021 20:21:49 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 444BBD0E9E3; Wed, 26 May 2021 21:21:48 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, james.schulman@cirrus.com, perex@perex.cz,
 david.rhodes@cirrus.com, YueHaibing <yuehaibing@huawei.com>, tiwai@suse.com
Subject: Re: [PATCH -next] ASoC: cs43130: Use DEVICE_ATTR_RO macro
Date: Wed, 26 May 2021 21:21:44 +0100
Message-Id: <162206049349.1916760.15392128119414962686.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210524114017.18672-1-yuehaibing@huawei.com>
References: <20210524114017.18672-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Brown@sirena.org.uk,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
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

On Mon, 24 May 2021 19:40:17 +0800, YueHaibing wrote:
> Use DEVICE_ATTR_RO() helper instead of plain DEVICE_ATTR(),
> which makes the code a bit shorter and easier to read.

Applied, thanks!

[1/1] ASoC: cs43130: Use DEVICE_ATTR_RO macro
      commit: 6405941e6884dac80f836acfc7ec52089ea6aa99

Best regards,
-- 
Mark Brown,,, <broonie@kernel.org>
