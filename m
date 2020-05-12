Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 944C71CFCC9
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 20:05:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42D5B16E1;
	Tue, 12 May 2020 20:05:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42D5B16E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589306756;
	bh=yc6CNqoYkvluvBeb9WQbgl44Xk4YuO/iW2Z1m/hzklE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lVAIfMjeTwIgvqh+8U6ulR9NAYMA4ryuizP68fgfE29j6FUTyKZMcQcyB0KEqbxJW
	 N3vALWpYSI5B2Mjhk8nNcqfVHvNQf48idGSAkixnEgJm0ITny6RxkrREBkdl7+Xl99
	 S1liGA03dN28Tk5VPPila6GfjTs/g1X+9V8sfj9o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 729DEF801DB;
	Tue, 12 May 2020 20:04:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DA4BF8015A; Tue, 12 May 2020 20:04:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2ED9F80112
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 20:04:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2ED9F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tNpXKNUE"
Received: from embeddedor (unknown [189.207.59.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9F5F120673;
 Tue, 12 May 2020 18:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589306684;
 bh=yc6CNqoYkvluvBeb9WQbgl44Xk4YuO/iW2Z1m/hzklE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tNpXKNUEIE5dTnGo7j/WYOPw9ts4Hy4qorJF73kuDy5KaME/ONw/6KEAKx6T5GI96
 Tru/3jCFPgUUstfBELSRe1dKKjcpXXZ/QXX/YINyeNntLAevi8kAit6ZbmDmJebN5r
 pPODNn38dzmbRXbjGrUsrPbWiNu5j1U6kenTEueU=
Date: Tue, 12 May 2020 13:09:18 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RESEND] ASoC: Intel: Skylake: Replace zero-length array
 with flexible-array
Message-ID: <20200512180918.GF4897@embeddedor>
References: <20200511174647.GA17318@embeddedor>
 <158930188455.55827.14390851374340231617.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158930188455.55827.14390851374340231617.b4-ty@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
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

On Tue, May 12, 2020 at 05:44:50PM +0100, Mark Brown wrote:
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8
> 

Thanks, Mark.

--
Gustavo
