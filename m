Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1844212C87
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 20:49:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 510FA16DB;
	Thu,  2 Jul 2020 20:48:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 510FA16DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593715766;
	bh=5FcXxpGyxY7XesPiCKtU7CQ4ufqJ4DRsdNsPbMiGPQM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tgJ4J4awzDzDuObGnjXy0bSY5CXhrG1WVmJDSdxg3iCxeJEmOncGCrOYiRmMxZAUs
	 dFnc4aaXHEIUWDLbakzpwp8FKc2tVMqPAk7yfbx1QHkLcOpo9JFg9cqW2VVS/2uEHS
	 SOu/N0Np/aesls9DATsNukX6QIeXHXm7PZ76HA4A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6971CF8022B;
	Thu,  2 Jul 2020 20:47:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED951F8022D; Thu,  2 Jul 2020 20:47:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90BC0F80134
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 20:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90BC0F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nEWt3ATI"
Received: by mail-pl1-x641.google.com with SMTP id x11so11642789plo.7
 for <alsa-devel@alsa-project.org>; Thu, 02 Jul 2020 11:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zL1njao5U3QawtZRIy9WHRW3s8av22W5Zvsb2TW9baU=;
 b=nEWt3ATIQVLQyXkuQdvn1aiYxeRtcTjZA48sxFRfIWaLltWScvk8SuHv2VmRvSpuVT
 FSHcUHlaudUvwG06wYP6l35iSlpxk3fp/GUwCX8D1hgFuszx4mGzbibW/ggdVu5oj2rH
 LiqDGS5rNTYKOgdGa/r1Z+p3uYiYkUdQ+Y4QfiGpr9NMW5Kt09S9HID+2JZTlAkFSycb
 ZpXh6DyCVPkz36RuK0FW8QbJoQlBz3ZY1fsTlfs1OejByxVdOlW5eF4F4MBNLIYV6FdA
 Vr8NWzwEytfBRihxLiBrDQYSW/TNC31MVGV53CWTdGbLxLUE5mdw2EQREOpFwTe72m/n
 9Hog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zL1njao5U3QawtZRIy9WHRW3s8av22W5Zvsb2TW9baU=;
 b=JKMzGHEoiJNNc598k7XH7T88G/Z6AjF/RWLTRiU41zFmMq2BGaZB3oeh2hMAOfb9wx
 Nd7gsRBmH0q5PitiSRWy+o5wPZuFbBZWSl2R19HB1UaKuSs3jtQ9BdSE1EM5t7Eaz0Ho
 glRJjolPdU34fUE2rns6Cj3nsjWWwekXFVdUbmOVQdPtaQ5NIhzey8hzie+hqf8tPGSE
 nFlZz4HzlGfbjYQXMzrz2bYsGOcQ3LVv4WqV6xmhfQPjmu2gnfNFIVWl2457oh3Q8cPP
 H+cA9rYHONrPRi+0QLNBXK9AHrahYXzMFNMG5sQzso756J8NY5Ipg82AWg4GfXElBeFm
 Qimg==
X-Gm-Message-State: AOAM530Oj+WyYGsFAkUXn8FpG2/D/NpNFqvozxF5QRddW9YpEAVQvTlh
 +ynDLyjOCjwSRXOxUPHB+b0=
X-Google-Smtp-Source: ABdhPJzqWFlPtZQNtr1q8muNtABj2+NjawquW0DDONjn5yLdHttAns0cWnp1iJmb2C1ByT8ZNU3J5w==
X-Received: by 2002:a17:90a:2a09:: with SMTP id
 i9mr19383865pjd.50.1593715652929; 
 Thu, 02 Jul 2020 11:47:32 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id d65sm1575040pfc.97.2020.07.02.11.47.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 Jul 2020 11:47:32 -0700 (PDT)
Date: Thu, 2 Jul 2020 11:47:28 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 3/6] ASoC: fsl: fsl-asoc-card: fix kernel-doc
Message-ID: <20200702184727.GD23935@Asurada-Nvidia>
References: <20200702172227.164474-1-pierre-louis.bossart@linux.intel.com>
 <20200702172227.164474-4-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702172227.164474-4-pierre-louis.bossart@linux.intel.com>
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

On Thu, Jul 02, 2020 at 12:22:24PM -0500, Pierre-Louis Bossart wrote:
> Fix W=1 warnings. Kernel-doc syntax was not properly used.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  sound/soc/fsl/fsl-asoc-card.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c

>  /**
> - * Freescale Generic ASOC card private data
> + * struct fsl_asoc_card_priv - struct Freescale Generic ASOC card private data

Just a nit, can you drop the "struct" before "Freescale"?
Other parts of your changes don't really add this word.

Otherwise,
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
