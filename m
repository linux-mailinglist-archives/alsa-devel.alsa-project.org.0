Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03699212C7D
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 20:45:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D7BD16E2;
	Thu,  2 Jul 2020 20:44:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D7BD16E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593715510;
	bh=rUjO95qK0P2RmCUaMTM7azql51b5+dh0+Zgwirse6/I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GN+w3ZxxfoKHeuoH3QCXb918uSrSbZhXaMI2SOAFU1xd1DfC8aemp+IRjvdYJxGiu
	 kiOB7Nf942adKFIHQzjkEUvVgFfQwZsghP4gMDI1geXsGiBIzmZun9O8TS684YVrTH
	 kgHOCa5m5WcdGJG9M5rlXWg9k4Lfmk1Il8jIetPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D50E9F80253;
	Thu,  2 Jul 2020 20:43:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3AE0F80252; Thu,  2 Jul 2020 20:43:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 995BCF80134
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 20:43:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 995BCF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="r6HE+0mZ"
Received: by mail-pf1-x444.google.com with SMTP id 207so12713288pfu.3
 for <alsa-devel@alsa-project.org>; Thu, 02 Jul 2020 11:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=T8AFzNr8FTwNK1ymuDjuXty3ke3mxQ2LEmj5APqSzAs=;
 b=r6HE+0mZ02w7MurOAipYo+NhP+BXB+/ZheXD3JdoLZTRukq/OOKHZJHm/5DpdUZVYV
 8e/d2StblsM1xLyj0G+WXd+YBpY0tZb8VuZBdzesAbY6aSS+GE/d+e/sbyw/EV8BQo5u
 4iUQr7tSE53nEj3vSDrahVbtJ/01g6PsWhbPO4KueXaZQGbrsL0CLnr0OBKaRa5zHoCs
 By7G26zmROIR5XQMzCloUCTxr10YGwbOBWaHqPGt3a+WLIvc7mUwbeaoqET6HC0il/ML
 cJ9pHCUydheBLoq7TX8aCQQj6/ZKoe2uN0S7WfZ3NP5kx7e8RfVDUQJuWMQlG1JXWTLZ
 xZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=T8AFzNr8FTwNK1ymuDjuXty3ke3mxQ2LEmj5APqSzAs=;
 b=J/SBwZSepBcnvJySZ/G5G6zBfpcAc9SvPQfdCT//bWo/2tq9BIuhxd1GbnyoVZoKMz
 ob5mD8SaUTcbBuFVifdvBysWQ901HMYIDMIP5QVCKiCMxFcZI3kEEpwpvUk5iFhtnJLc
 P80ksKEvXOFkTbo5cD2yjXv1HJp8EnQB6tcYcT8gs0cxpFg7T3v7Wtk3RxgY6IpDw3db
 7s/s/naNLpyoWxSPy90spMd/O2NL3tfQ8v0bqqDpa4OBRaJL1s3lURxgOE7s+TTt/EVz
 5QZi3nisv3ykBb+OKqUc5Jj9DMlfa2SeicCkD7HsjyAlPPwFbiMUTDRb005OINsUfTav
 9FYg==
X-Gm-Message-State: AOAM531QlzwyjGmXSM2rxlXQqVQKaIwbNLW84d5VBjmOfiTaAzZ6rIcV
 CQu4ivtic0YluUYlK7nqDj9fDFMD2EgPsQ==
X-Google-Smtp-Source: ABdhPJyf9rPXrraJ4zNdrCsJxDRxl6SVVSEajMec5OJdQ6AmrIx6KJJeJD6+gb4cN2DXsLXo3syu9Q==
X-Received: by 2002:a62:5e83:: with SMTP id
 s125mr27945470pfb.315.1593715398982; 
 Thu, 02 Jul 2020 11:43:18 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id n2sm9335901pgv.37.2020.07.02.11.43.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 Jul 2020 11:43:18 -0700 (PDT)
Date: Thu, 2 Jul 2020 11:43:14 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/6] ASoC: fsl: fsl_ssi_dbg: remove spurious kernel-doc
 comment start
Message-ID: <20200702184313.GB23935@Asurada-Nvidia>
References: <20200702172227.164474-1-pierre-louis.bossart@linux.intel.com>
 <20200702172227.164474-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702172227.164474-2-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, tiwai@suse.de,
 "open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 broonie@kernel.org, Fabio Estevam <festevam@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
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

On Thu, Jul 02, 2020 at 12:22:22PM -0500, Pierre-Louis Bossart wrote:
> Fix W=1 warnings. There is no kernel-doc here.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
