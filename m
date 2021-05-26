Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C9D392172
	for <lists+alsa-devel@lfdr.de>; Wed, 26 May 2021 22:24:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E32771714;
	Wed, 26 May 2021 22:23:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E32771714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622060658;
	bh=ERJQjz8II/2NY9vdOq/kr15QXZAEt+nHJGE9UQpFNEQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NsrcJi3+FMuo5qn3a1+FdaZ5nImC5JH4PxAuOUbMKroLXOVa/Joy2uG0salqATbkg
	 gwJSrpCBkQ36wLop+bladWhK56+/GPLl9C+64ExGDlrrnd2uQPdt7Giu0WdQKsQhEx
	 5bZoJjZJt7/pKOPUNDMS8ypsSHx61p+zg3yZBhV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1549CF80212;
	Wed, 26 May 2021 22:22:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38557F802CA; Wed, 26 May 2021 22:21:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 555CEF80260
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 22:21:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 555CEF80260
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="w4J/K5d2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v/NuGg3MB4oiZfDhpuhNhKlAfNFXtF+3rZwIPQvb1C8=; b=w4J/K5d2E1O83vCyW3esSwTLXz
 8Z8lm5rKtxzqN9doPkEIIysL7KWpyrzbfx4FykJy12jc3UvDift2t4YGh7FLzcsa9ZOC35wPsUGLW
 avjC5yUl8XWN9lnjGOZ0c9tPW69wdWofepAv66+uda/ew8Awq1dWipT4/P9IQRUAbAR8=;
Received: from 94.196.90.140.threembb.co.uk ([94.196.90.140]
 helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1lm02H-0067nc-L2; Wed, 26 May 2021 20:21:49 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 4AD6CD0E9E5; Wed, 26 May 2021 21:21:48 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, james.schulman@cirrus.com, perex@perex.cz,
 david.rhodes@cirrus.com, YueHaibing <yuehaibing@huawei.com>, tiwai@suse.com
Subject: Re: [PATCH -next] ASoC: cs42l56: use DEVICE_ATTR_WO macro
Date: Wed, 26 May 2021 21:21:46 +0100
Message-Id: <162206049350.1916760.8418619085166876436.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210524114503.26460-1-yuehaibing@huawei.com>
References: <20210524114503.26460-1-yuehaibing@huawei.com>
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

On Mon, 24 May 2021 19:45:03 +0800, YueHaibing wrote:
> Use DEVICE_ATTR_WO() helper instead of plain DEVICE_ATTR(),
> which makes the code a bit shorter and easier to read.

Applied, thanks!

[1/1] ASoC: cs42l56: use DEVICE_ATTR_WO macro
      commit: 3ef6253cd0805d281eacbbd6a21e822ef4c3fef5

Best regards,
-- 
Mark Brown,,, <broonie@kernel.org>
