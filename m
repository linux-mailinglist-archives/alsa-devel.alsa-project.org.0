Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1325C67DA0E
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 00:56:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46E37E73;
	Fri, 27 Jan 2023 00:55:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46E37E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674777397;
	bh=b4RDpwEILaDiIt/LpUYj6ICO+dPIjXDR8ok9CctcPps=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XJmgPPij8vHRHynGb+qohOd2EkhhAtO64QXQeFBGbRQlZpJXci3m/6kykNsuaGlhG
	 dttBt/3it1ziDcBgNvDeTqgUMBy4tqWv2LMGxEE7YC8/XVBszqIsqhp0+aNkCoAkLq
	 zVRTQ23fUCogxIty1axHYdCI3jD/HJkca7k7zEw8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6B11F80224;
	Fri, 27 Jan 2023 00:55:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 265E7F8027D; Fri, 27 Jan 2023 00:55:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7021F800AE
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 00:55:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7021F800AE
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EjNRBD0x
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B8989B80DF7;
 Thu, 26 Jan 2023 23:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B99C433D2;
 Thu, 26 Jan 2023 23:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674777327;
 bh=b4RDpwEILaDiIt/LpUYj6ICO+dPIjXDR8ok9CctcPps=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EjNRBD0x7DqI5RWqrQB53Z5Y0dhJERyDmr8qkJ5N0IoJEoVb5kEuCBlXqazqg6NTt
 6R1V2ndj99lVu1sCQxKtDdEvjIFacZKGSz+Lhy8uRjmFYWsORmUCS1u6B8hKs7DvvJ
 j1FgWk9FgznH/mM6ARjb4iGeX/fRGcraMjEx28xzEE+9uopEpF5TN4NUx/rv882+aK
 0qPw/IDwT4whMeGcK+EVs7cfVrMEUVyhvhE8ZLvKc3iXMSWP0zWUKUlOon9CyXo0NJ
 FLHAStWX96PnCHsfv4ZDYqqht1TBsrX82BA4jCSphv+pENkmWr6WVrpyCmT4VPx0nr
 kJTXOhmZm70/Q==
Date: Thu, 26 Jan 2023 15:55:26 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] scripts/spelling.txt: add "exsits" pattern and fix typo
 instances
Message-ID: <20230126155526.3247785a@kernel.org>
In-Reply-To: <20230126152205.959277-1-luca.ceresoli@bootlin.com>
References: <20230126152205.959277-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: dev@openvswitch.org, alsa-devel@alsa-project.org,
 Leon Romanovsky <leon@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Pravin B Shelar <pshelar@ovn.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Fabio Estevam <festevam@gmail.com>,
 Colin Ian King <colin.i.king@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 26 Jan 2023 16:22:05 +0100 Luca Ceresoli wrote:
> Fix typos and add the following to the scripts/spelling.txt:
> 
>   exsits||exists
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

You need to split this up per subsystem, I reckon :(
