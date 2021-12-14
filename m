Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDF5473BFA
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 05:28:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 369E51F11;
	Tue, 14 Dec 2021 05:27:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 369E51F11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639456118;
	bh=UQ853Oxrkc9KugF7kQkaxjeP+OlZ7/ywLOtOIjFdRuA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tNdgwwO4uWgd1CPkTphiOYySNxhOqpTFAOGbr3Ura9KnDTJzbgvPkblGth/af0WX8
	 hYGRnmWe5M5giOEmHk3HejxOpfIQlaDh3d3QFT/8vxE7DP2mBc5b5CFN7ixLjK2sSH
	 4BLXd8gMYP+MdLC7LhNmyRHx3af8GFmIOAOsl7M8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89D1CF80249;
	Tue, 14 Dec 2021 05:27:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DDBFF80246; Tue, 14 Dec 2021 05:27:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 143FBF8016A
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 05:27:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 143FBF8016A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1639456034319045067-webhooks-bot@alsa-project.org>
References: <1639456034319045067-webhooks-bot@alsa-project.org>
Subject: Does alsa-lib call this kernel api?
Message-Id: <20211214042728.1DDBFF80246@alsa1.perex.cz>
Date: Tue, 14 Dec 2021 05:27:28 +0100 (CET)
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

alsa-project/alsa-lib issue #204 was opened from Nick0412:

Where in the alsa library does it reference the alsa kernel api: https://www.kernel.org/doc/html/latest/sound/kernel-api/alsa-driver-api.html?

Do these two apis interact at all?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/204
Repository URL: https://github.com/alsa-project/alsa-lib
