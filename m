Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5037F4F04F9
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Apr 2022 18:37:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0D4817B7;
	Sat,  2 Apr 2022 18:36:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0D4817B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648917423;
	bh=mkH8uJWXxF9WDJTF9GQSX6lH/7+pN83clSgWCPk/tJo=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h7iTt3fGV3BAk4cINrYLvnQFjnxzezRSMmJLbZDzsbdv1837LjuY1VfAHJiVUL9+6
	 hu4sjMDFr0c7jcWYcWRj1DHB18uW7SRO7n4wNdIfEYQ0qKCtBUehN8mGUmZjZyGtP8
	 9GKv73CQ7FWhSl/jCslSu6Ydw6D0eDWZ2vVf/Y70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6773BF80310;
	Sat,  2 Apr 2022 18:35:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B275F802DB; Sat,  2 Apr 2022 18:35:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7468F80100
 for <alsa-devel@alsa-project.org>; Sat,  2 Apr 2022 18:35:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7468F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="D+vCMtlg"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8F7C260B6C;
 Sat,  2 Apr 2022 16:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75363C340EE;
 Sat,  2 Apr 2022 16:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648917345;
 bh=mkH8uJWXxF9WDJTF9GQSX6lH/7+pN83clSgWCPk/tJo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D+vCMtlg9wDUXQg/1cudIhkrlzFEBvMJLjDtXPGF/NvH4Xf47sqh62KthhKdR+JXa
 LJGA1LnSyvtEtBiRRRWGRHlWjGwVChU+dKFQyWnB9XKz44tXdU8ojeIEPt20lhsUtg
 mEkd/l2Dv/uBr5Pi9MLjTNSQWYRnPpuD3kWCBMui0SB4o1OaAQcJah9ziEcge2NAqL
 6SgZCAg/Lyz6Rt4hqR5sjYWqYq7z/eVM51i+Ht/Lfg8QqCDHaMXZTYt+0+/BZxyj9E
 VbXvm2Chj8ah0B5D05Vl0Ncwohdjc9LuLajNvi9IMkw70d+p3+XeVeYN3RK0jo4Sbb
 vygZfZxO56STA==
Date: Sat, 2 Apr 2022 18:35:39 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.16 54/59] ASoC: Intel: sof_es8336: log all quirks
Message-ID: <20220402183539.738ffb7b@coco.lan>
In-Reply-To: <20220330114831.1670235-54-sashal@kernel.org>
References: <20220330114831.1670235-1-sashal@kernel.org>
 <20220330114831.1670235-54-sashal@kernel.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 =?UTF-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@linux.intel.com>
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

HI Sasha,

Em Wed, 30 Mar 2022 07:48:26 -0400
Sasha Levin <sashal@kernel.org> escreveu:

> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> [ Upstream commit 9c818d849192491a8799b1cb14ca0f7aead4fb09 ]
> 
> We only logged the SSP quirk, make sure the GPIO and DMIC quirks are
> exposed.

Checking the backports for sof_es8336, it would be nice to also
backport this one:

	https://lore.kernel.org/all/20220308192610.392950-20-pierre-louis.bossart@linux.intel.com/

Without that, UCM won't detect a digital microphone and would fallback
to analog mic, which won't work on machines with digital mic.

-

Btw, I'm testing those using upstream UCM plus a couple of fixes
I applied on the top of it:

	https://github.com/mchehab/alsa-ucm-conf/commits/master

there's a pending PR#144 for upstream's alsa-ucm-conf fixing 3
issues at the UCM logic for essx8336.

Tested on a Huawei Matebook D15 notebook.

Thanks,
Mauro
