Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D344A212C7E
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 20:45:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E5D716D2;
	Thu,  2 Jul 2020 20:44:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E5D716D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593715527;
	bh=l/2a2v3fmhrywZBfFqtCfR3hFga9ZUih6OT7HaND9KE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kZgVS7h+UQc9fIDfO3Mu9OzivB9XlCJ59GdnK91z4jO4dAJ612Sg6elP06DMvEsHL
	 8iWCEiege+MI+VhgxP8Dx1dfAOedluep0nx4pWUgoV7qHMKopoquGigbOFluslkYfK
	 atTaHLUEtOnj9cEUpSaTXGM7BNB6Egj4PPyQjzs4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE949F80134;
	Thu,  2 Jul 2020 20:44:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEE31F8022D; Thu,  2 Jul 2020 20:44:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E4BAF80134
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 20:44:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E4BAF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Y/eW4I1U"
Received: by mail-pf1-x444.google.com with SMTP id m9so2642094pfh.0
 for <alsa-devel@alsa-project.org>; Thu, 02 Jul 2020 11:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FP9n0qRIXc4AGMB2Cuj6evDveqJfblRxHMETVqaiIRE=;
 b=Y/eW4I1UJ6ndSlD7IHhSytnpBWDxb+Jw8Q0hLbNMEnuoySdgmvAUxHuc3C+ftqBOpN
 Lb+W15tgmK6Ryygl4oh6VGa4phdiNK184gn15nEqRVOreI5OGZ3qhIhyRkh/C/GGOmOV
 nMKdP039o6wfud5iisiozwbW58Xg/HOEiR7ymbC+2xUG7zJVX1hYcOYFZNfwiNLge27b
 ZvOUMD8IPQkfZCkG4bN/uoD7aQGFpxE0FIPb+6Colv7RsU8COSWGAWccY3kG/JKDHV2t
 6zmz9inr5prww1u+YJZ9sKz81TMTceg1Cddydsz2YUPQEO3LBVSlVhK3qbYcsy8A2ZqW
 Pshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FP9n0qRIXc4AGMB2Cuj6evDveqJfblRxHMETVqaiIRE=;
 b=mxBI36S9CL0bw8Q6vxWhgO+ih/xR+B0P0IBSBwb+rKda0V5jGSeJJBR59qZAN9V1KK
 9+duS6F37UKVTX80+y4EUBp/qMBbFW6RPLF3oBHTX1LeUAs1cBMjXc2tAC55EJsaRs6o
 pG2wDV/TZyblqIFhPOIc3lzhGqY8PBiw9CdjFRoXWZmPuxjlK4wgowXlRZm/e/giAjQp
 vzhKFxOK2Jf4BOoEc9KAnOkMqV2G+XXt0zq1pEDAi9xwtYWSWxX2gNNqfYxQIwdGJJV+
 I44oxOYHC5c6nE2FBYbzQ3i6YXjlWFdc1FHS7xElde1JAa4D5OPxnCAR3HuLa9Sht3uN
 8zMQ==
X-Gm-Message-State: AOAM532FZWxpocpUg2kBJkpTt+STLisX1U36jrLecxz+1EE1upA4OTkP
 PO6ASUbTKxmdrvdo4kF4Vo8=
X-Google-Smtp-Source: ABdhPJwoL6GaAMdB9x4/AlPN6Z249mGTQ4ZjldoorgeCh7p+TR+j2RyiDDnQdqYC3t17qCULfe8YMg==
X-Received: by 2002:aa7:9630:: with SMTP id r16mr24760416pfg.144.1593715459899; 
 Thu, 02 Jul 2020 11:44:19 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id n12sm9474759pgr.88.2020.07.02.11.44.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 Jul 2020 11:44:19 -0700 (PDT)
Date: Thu, 2 Jul 2020 11:44:15 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/6] ASoC: fsl: fsl_ssi: fix kernel-doc
Message-ID: <20200702184414.GC23935@Asurada-Nvidia>
References: <20200702172227.164474-1-pierre-louis.bossart@linux.intel.com>
 <20200702172227.164474-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702172227.164474-3-pierre-louis.bossart@linux.intel.com>
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

On Thu, Jul 02, 2020 at 12:22:23PM -0500, Pierre-Louis Bossart wrote:
> Fix W=1 warnings. The kernel-doc support is partial, add more
> descriptions and follow proper syntax
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
