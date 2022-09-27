Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5E95EC1F0
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 13:57:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EBF2828;
	Tue, 27 Sep 2022 13:56:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EBF2828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664279851;
	bh=UnzHm/HzWWA9T74mzhY3rJIgrioRLkOXE2OO8HPDwFU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n6zWFuVaYa63fU2wRoVCxYhVA7d4uqRGiINZdA2D1gDiRPwrcuxAgWn9GwClzrEVC
	 RskHMry+JQv2vm/DYAw3vxgYBEKASQwWRlN2vPNX6StjBQfnXtWeGkE5V3Bb1zipab
	 bRYQ6KPyVDeZPc/JkmhSVpf6IW0D4sqtYjs5fN4A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A89FF80166;
	Tue, 27 Sep 2022 13:56:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16B70F8025E; Tue, 27 Sep 2022 13:56:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from hi1smtp01.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20D5BF80166
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 13:56:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20D5BF80166
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hi1smtp01.de.adit-jv.com (Postfix) with ESMTPS id 59A42520214;
 Tue, 27 Sep 2022 13:56:24 +0200 (CEST)
Received: from lxhi-065 (10.72.94.21) by hi2exch02.adit-jv.com (10.72.92.28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.12; Tue, 27 Sep
 2022 13:56:23 +0200
Date: Tue, 27 Sep 2022 13:56:19 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: soc-pcm: fix fe and be race when accessing
 substream->runtime
Message-ID: <20220927115619.GA4547@lxhi-065>
References: <1664210154-11552-1-git-send-email-erosca@de.adit-jv.com>
 <b54daa61-ba1d-81d4-5238-ca7cc2a41b48@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b54daa61-ba1d-81d4-5238-ca7cc2a41b48@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.94.21]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
Cc: Yanmin Zhang <yanmin_zhang@linux.intel.com>, alsa-devel@alsa-project.org,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Jiada Wang <jiada_wang@mentor.com>,
 linux-kernel@vger.kernel.org, Cezary Rojewski <cezary.rojewski@intel.com>,
 Zhang Yanmin <yanmin.zhang@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Ramesh Babu <ramesh.babu@intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Dean Jenkins <Dean_Jenkins@mentor.com>, Mark Brown <broonie@kernel.org>,
 Ramesh Babu B <ramesh.babu.b@intel.com>, Eugeniu Rosca <erosca@de.adit-jv.com>,
 xiao jin <jin.xiao@intel.com>
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

Hello Amadeusz,

On Di, Sep 27, 2022 at 09:34:49 +0200, Amadeusz Sławiński wrote:
> On 9/26/2022 6:35 PM, Eugeniu Rosca wrote:
> >From: xiao jin <jin.xiao@intel.com>
> >
> >After start of fe and be, fe might go to close without triggering
> >STOP, and substream->runtime is freed. However, be is still at
> >START state and its substream->runtime still points to the
> >freed runtime.
> >
> 
> Well if it is being freed, maybe pointer should be set to NULL instead in
> place that happens?
> 

As soon as the agreement is reached that the patch is still
relevant/useful on the latest vanilla, I think this review
finding will receive proper attention.

Thanks,
Eugeniu
