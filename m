Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E45F0417629
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Sep 2021 15:49:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F37A822;
	Fri, 24 Sep 2021 15:48:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F37A822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632491346;
	bh=boT82Ych7HuDrroJNMr3BeNPsJ0NtQACx+Xc59vx+xY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B3W392BKXvBRkggyaFdxLC4btdLEVydTDq83zFCLUaUEdE0+idtkuZvDGTYFEEVgd
	 c/qNGr1LWLamB8i09XUwZj2gLDyRD+XeC1YadKTxLoCACCghwSpSo62rjnDHbnbEdi
	 gu8KjKMATztVv3bRi3yewWIzOmBYAfn+xF4MBlZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB857F800BC;
	Fri, 24 Sep 2021 15:47:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9C7AF802A0; Fri, 24 Sep 2021 15:47:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A99CFF80246
 for <alsa-devel@alsa-project.org>; Fri, 24 Sep 2021 15:47:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A99CFF80246
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1632491252754193068-webhooks-bot@alsa-project.org>
References: <1632491252754193068-webhooks-bot@alsa-project.org>
Subject: include a sample `alsamixer.rc` file?
Message-Id: <20210924134746.E9C7AF802A0@alsa1.perex.cz>
Date: Fri, 24 Sep 2021 15:47:46 +0200 (CEST)
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

alsa-project/alsa-utils issue #112 was opened from int-e:

I think it would be useful to include an example `alsamixer.rc` file; see https://gist.github.com/int-e/25bd77d4e59531fad7d48bfaf1fc1046 for a candidate.

In particular this example replicates the default color theme, making it easier to adjust (say, replace `default` by `black` to get sane colors back in terminals with bright backgrounds). The default keybindings are also replicated but that's probably less useful.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/112
Repository URL: https://github.com/alsa-project/alsa-utils
