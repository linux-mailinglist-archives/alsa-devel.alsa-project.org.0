Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 131E07CA6A1
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Oct 2023 13:22:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F2B585D;
	Mon, 16 Oct 2023 13:21:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F2B585D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697455343;
	bh=mBdvDnsY7j7n4KPIqkmfq1CVvQZIAOw4ayChHvb0b1A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vuewFCjPrVOBt6DbVtoXZUct2zDPFFnlr0dO4uTx4tLqpTVgMj4UhPGk19g9KqNzC
	 4rbXCwPruzViXrGixDiLsV38B/svZj2djmWpI0hWFT+o+tjvuWZS3BvdEbT1ReGHpW
	 6R7zM8MvGs96J4D7OCVS3CgU7RNgGGva5sSU79Mg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD1B5F80557; Mon, 16 Oct 2023 13:21:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDF6BF8055B;
	Mon, 16 Oct 2023 13:21:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD1D3F8055C; Mon, 16 Oct 2023 13:21:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A87EF80557
	for <alsa-devel@alsa-project.org>; Mon, 16 Oct 2023 13:20:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A87EF80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=b1nxnVkG
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A093B60C84;
	Mon, 16 Oct 2023 11:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B08B2C433C8;
	Mon, 16 Oct 2023 11:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697455255;
	bh=mBdvDnsY7j7n4KPIqkmfq1CVvQZIAOw4ayChHvb0b1A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=b1nxnVkGRFf3ifXwoAneBYh5azomKc5q1gWJoqmKx9Im4iUcvTH0KE5Igu6uW9zwr
	 DmlE3HJ/2jBodtXlSCjoTgDZwQAqoXv14MazmJ3+kz/pFnnTBMnos9gH78qx1vPsXd
	 rrIPeLTFnLBUU0xQY2NdHtNL6zMohI4c3pywERdsvyI9aTflPCzZDfhGrCQ8hX/5XP
	 az2A/CZJlZdcNN6cayE9hIO4JKOpeD7NkADXyJ06xEfkx3FjicKwh8DeD5I+qMsjYh
	 fVIfHbPid98OdGET8H3ZY8Tc3UH2/QYa9ctR6ArUbNQ6Mcw5cO8iIscKyk/Ulh4y9u
	 C023jLdU1OD2A==
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
In-Reply-To: <20231013010833.114271-1-yung-chuan.liao@linux.intel.com>
References: <20231013010833.114271-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: dmi-quirks: update HP Omen match
Message-Id: <169745525335.217856.5702950620143710805.b4-ty@kernel.org>
Date: Mon, 16 Oct 2023 16:50:53 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Message-ID-Hash: EDO6TL7UBYRRXWM3PIBCQSLY3ML2YHAD
X-Message-ID-Hash: EDO6TL7UBYRRXWM3PIBCQSLY3ML2YHAD
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EDO6TL7UBYRRXWM3PIBCQSLY3ML2YHAD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 13 Oct 2023 09:08:33 +0800, Bard Liao wrote:
> New platforms have a slightly different DMI product name, remove
> trailing characters/digits to handle all cases
> 
> 

Applied, thanks!

[1/1] soundwire: dmi-quirks: update HP Omen match
      commit: 4ea2b6d3128ea4d502c4015df0dc16b7d1070954

Best regards,
-- 
~Vinod


