Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 677D71165DC
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 05:39:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3DDF1616;
	Mon,  9 Dec 2019 05:38:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3DDF1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575866342;
	bh=sfGrF89s2FtM/rqE4BbjIXVHF6tbEXqgxrv2K61NcX0=;
	h=To:From:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J/laIeB3HSPiqICY/qYEznRT/msrP9RCk9kW3AaQV6aJ+fwzi3LUtPhtWELaq9VhX
	 sNOsRioE/YHC0jyQj1PZ4o3zdoWySsNTosOv+5knhAOlyotOJJSn5aptXlvHIK1iun
	 naPl+6mbgE5OLG3Fv/p27MxgUz2WHDp9BZtiszao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37E15F80234;
	Mon,  9 Dec 2019 05:37:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD57EF80234; Mon,  9 Dec 2019 05:37:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAFEDF800C4
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 05:37:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAFEDF800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="mqwyNEVD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MZaXJJ+0Us/9ZJLhvcDNPUmeTEawsBgwErdJM5IFJdQ=; b=mqwyNEVDcfc/b5Eu5EbdvPmT1
 jaHjUVrqF2WMzTKglBkL3wjXjZwmvuXqmzGEWzEbm6Tg/IT3suAMSuqFrrRRrbZ++0j/oae6QDGC4
 nNm423bVlGvnXMIOODXFY5q+FgT4Vn1xnX+vN53r63p0tf5phN8gzn+0Pp4DdBYtCq3Fd7BBznDx8
 4akKnXjqeg6se08sC8UjjaVmVoQuP0ZN++AVT+1/7qKfIKUaWVddsz8rbkbvdgNf3mZ2GKVBJlEKD
 1c/isI0zqomUQigh6Fyds/F8okQNwdcNt+8sIXpHNlrVu0qXFFoZdnMl8/dDpyAXixGUDQZd10ENM
 2nbkC6uTw==;
Received: from [2601:1c0:6280:3f0::3deb]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieAnA-0003up-KT; Mon, 09 Dec 2019 04:37:04 +0000
To: LKML <linux-kernel@vger.kernel.org>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2215ee04-e870-5eea-a00c-9a5caf06faae@infradead.org>
Date: Sun, 8 Dec 2019 20:37:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Language: en-US
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] [PATCH] ASoC: fix soc-core.c kernel-doc warning
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Randy Dunlap <rdunlap@infradead.org>

Fix a kernel-doc warning in soc-core.c by adding notation for
@legacy_dai_naming.

../sound/soc/soc-core.c:2509: warning: Function parameter or member 'legacy_dai_naming' not described in 'snd_soc_register_dai'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
---
 sound/soc/soc-core.c |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20191209.orig/sound/soc/soc-core.c
+++ linux-next-20191209/sound/soc/soc-core.c
@@ -2508,6 +2508,8 @@ EXPORT_SYMBOL_GPL(snd_soc_unregister_dai
  *
  * @component: The component the DAIs are registered for
  * @dai_drv: DAI driver to use for the DAI
+ * @legacy_dai_naming: if %true, use legacy single-name format;
+ * 	if %false, use multiple-name format;
  *
  * Topology can use this API to register DAIs when probing a component.
  * These DAIs's widgets will be freed in the card cleanup and the DAIs

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
