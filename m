Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DA654B96C
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 20:49:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D734B1865;
	Tue, 14 Jun 2022 20:48:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D734B1865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655232562;
	bh=eOyqDZuqaiOs6xJm5q38O8F9rb//aReCl5ThOZoPPXI=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hk+lpg32Q5pbvlx7Cf2k2oWQlxzEOF3PCgzDOKCujL2VVV8/8dGq4pY4mU4snXQEQ
	 sdjhPm5Spxr3hS2pIaTXPWcQJUi1LW2FVECje7GN2dmvSgLwkCqSjE3nXjIa4C53MN
	 VXIdTR5hoiK4ReuJoMiDdXjKKGhMkC5Qtr+yM60s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6242BF80165;
	Tue, 14 Jun 2022 20:48:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD416F80139; Tue, 14 Jun 2022 20:48:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C148F800E1
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 20:48:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C148F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="H4QgXJaz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655232499; x=1686768499;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eOyqDZuqaiOs6xJm5q38O8F9rb//aReCl5ThOZoPPXI=;
 b=H4QgXJazCDVdcalN6uoRDa7ZRNbYoNRK2SApnQigRGM1icy5viFbxC+A
 tqV9/XVZmZcgfPk0H01wsasU91MaKlwmj3N7RlGqjSmVagSPAbatpAFDz
 gDgcvN2iBOntTajy7VgfKFhUF2orgqcqHeV97JU2M5tmArZARM4k6bILi
 K4qtRMCZNToFSpLzt3mRsT8FbviITG5LgoDcpFVWpt9BK3xzmdlbAaMpl
 Be/oUloN+BOC/JRK8hzD2ccd1Gm3y0HpnHS+hrb7obsgrLl+iCH/JKMYY
 PUaNyFhumzzc0x0rYb077Ep2tBd9o3WyK0TlJMt7kKuY5JTcS2jBNHdRX Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="279428054"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="279428054"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 11:48:13 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="640525207"
Received: from ticela-or-153.amr.corp.intel.com ([10.254.6.136])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 11:48:10 -0700
Message-ID: <606859dd0edcc2330fc353b0cb15395ed883b5bc.camel@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: Skylake: remove redundant re-assignments
 to pointer array
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Colin Ian King <colin.i.king@gmail.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood
 <liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>,  Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Date: Tue, 14 Jun 2022 11:48:10 -0700
In-Reply-To: <20220614183809.163531-1-colin.i.king@gmail.com>
References: <20220614183809.163531-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, 2022-06-14 at 19:38 +0100, Colin Ian King wrote:
> There are two occurrences where the pointer array is being assigned a
> value
> that is never read, the pointer gets updated in the next iteration of
> a
> loop. These assignments are redundant and can be removed.
> 
> Cleans up clang scan-build warnings:
> sound/soc/intel/skylake/skl-topology.c:2953:3: warning: Value stored
> to
> 'array' is never read [deadcode.DeadStores]
> sound/soc/intel/skylake/skl-topology.c:3602:3: warning: Value stored
> to
> 'array' is never read [deadcode.DeadStores]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

LGTM, thanks!

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

