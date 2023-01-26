Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8433867D31A
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 18:26:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9C0CDF5;
	Thu, 26 Jan 2023 18:25:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9C0CDF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674754003;
	bh=JD9httDWUUglNMzfg7+AehAvGFbv725T8Se4OJY02UQ=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LAzvSkY5K0TnB9i1PqRfFPsCKC7khot7k34WbUxdSEHMkHmcQ3vz+tPsdPmcppe2x
	 VDHFXnKJlDWt3rmThwuZHX/PfnvzFB0JpLhyuzm54X36FSV7lvJ5/Aucmxwdd5792J
	 BDo8Emo6WqnGJzuTtk/w8+HiNgueGzw6c2mHh4C4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46992F802DF;
	Thu, 26 Jan 2023 18:25:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC274F8027D; Thu, 26 Jan 2023 18:25:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1B35F8016E
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 18:25:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1B35F8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=eR8oVYOm
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30Q6f0P8017579; Thu, 26 Jan 2023 11:25:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=+7e5BFB25/sG52OaE6KhwkTP0Mh+mscqtoxl33gubHQ=;
 b=eR8oVYOmaW6FDjTg8Oy/V8uK9aMkAVDuBM6D8ksSfnT5mUlx4gLwbUiykSKEQ0uYRQc0
 /NsYza/JKMFJuGkgBRAY9bqJs2PchCE8hBSUgauhB0oM1gsi+kbpKPkKoxtpH0rPohIa
 lzJ715owR+d+/SO9BHgHgtuuugcBx9x16LE2YQa2q26O9FTypbcZbrmM4r//BvYLl8hR
 BelkjPYvFn0vtfuwqfVGmCCq+L/BF3dOk9ULYwpK+CUvVYvX0uM86LrE0Za8D1UiL6km
 S4kr1Z1Y3rToqH757FirX8oBLRNmpwSaNaZtviMwSWtnAt4caLyx84uSgyEcT9Qg5jVA yQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3n8dbst2rm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jan 2023 11:25:38 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Thu, 26 Jan
 2023 11:25:36 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.7 via Frontend Transport; Thu, 26 Jan 2023 11:25:36 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7398311CC;
 Thu, 26 Jan 2023 17:25:36 +0000 (UTC)
Date: Thu, 26 Jan 2023 17:25:36 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] [v2] ASoC: cs42l56: fix DT probe
Message-ID: <20230126172536.GB36097@ediswmail.ad.cirrus.com>
References: <20230126162203.2986339-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230126162203.2986339-1-arnd@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: NeF1VDHUKtXiNmzqz1XuC46pMvODmjXU
X-Proofpoint-GUID: NeF1VDHUKtXiNmzqz1XuC46pMvODmjXU
X-Proofpoint-Spam-Reason: safe
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
Cc: alsa-devel@alsa-project.org, Zheyu Ma <zheyuma97@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Lucas Tanure <tanureal@opensource.cirrus.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 James Schulman <james.schulman@cirrus.com>, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Jan 26, 2023 at 05:21:24PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> While looking through legacy platform data users, I noticed that
> the DT probing never uses data from the DT properties, as the
> platform_data structure gets overwritten directly after it
> is initialized.
> 
> There have never been any boards defining the platform_data in
> the mainline kernel either, so this driver so far only worked
> with patched kernels or with the default values.
> 
> For the benefit of possible downstream users, fix the DT probe
> by no longer overwriting the data.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
