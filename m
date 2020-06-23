Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB65206874
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 01:32:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4E0717E1;
	Wed, 24 Jun 2020 01:31:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4E0717E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592955155;
	bh=HfF+N063wzNbarJH2aiL2Y+y/+vQSkwbYz5qabmOLjg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fTdd7QGUsKYxqye29v7M7S1Aie65FfcHVZGp+A0W9aNB48/fpGzv+3NjoMiL5pDWt
	 A0UDCF0QS3T2fbKt22N55aZHW8JhHTF0/CVTh4g92evXzu2bizXmnUPLvAfc8D+pb4
	 WWibQprWL7vA+RrV9deh+3XVKvlmpnEUlzDLcUC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1219DF8023E;
	Wed, 24 Jun 2020 01:30:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27BCAF80234; Wed, 24 Jun 2020 01:30:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E271F8010E
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 01:30:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E271F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="C6iShYJW"
Received: by mail-pl1-x644.google.com with SMTP id d10so158543pls.5
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 16:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=89qgK7zoxJ0CxIlIbUd135zUy4sjIO0yIPQYW2bQXdo=;
 b=C6iShYJWie7aVa8GVkryo9BBNF5E6UroklqVgSNbUnmSrvA/2+VZNYJpL3shXp5iRK
 YOa71XUddAxmNPhn1KQICzn6sn8ghlmd8u8IPSmWoIj600lgmpjGm/BJzz2+0x6nymui
 xrNQR0cWvVWYaYEihMFcAHbwekRqpAHoivNOD0YJpsLbMqrfhnomGqCk+9sqB/vNzExS
 xcLmA6sRW5m1GbHyQUampD5E8um9yye/cBHTyQ9xOryjd+talV+Xz97xMPw5blS8EJMV
 g43wyqAInEAQSVWC5w90SsQ8Hu3XeyKxUd+rcxLhypmbpHewByKemSeuEd4RuNost1ls
 W9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=89qgK7zoxJ0CxIlIbUd135zUy4sjIO0yIPQYW2bQXdo=;
 b=Rc8gs+DZd4T4xh/oOffd8LmBPQM6elPBwyIRawhoG6mZUG/5ic1/H/x2ZjI3yVMmvf
 58k714Kgu4BrzcwfrEe1mW0EecxCvzpO9NTI7dot1CqHWhqUwsnGhFwa31uLK1LiY5o7
 QGU+tNT9nZuhsBrJ4kh9Bvu32AIsRjx7hWyALwi3q+inlXTrGl205NnUucq9ABV27TVg
 ciuEVlzgwPdczU3+aQ6khpn+9zyODSCeVHw3+8E73DiKVSAAoasvr+W6bXMc8Mn1ziYB
 z592zO7r4oE/aIK0oj8iraUUw7IrBslpHiJ1qOVNKzLSlbWwR2LAeH6N7ASv0cetCcrQ
 STNw==
X-Gm-Message-State: AOAM533SWwSDuQUN5zKHhK5GbvHd7a5GzvXiLWL6p4Fe+w0mSwOT9qzR
 jhehDoKQy86RpwMmEu+zSh0=
X-Google-Smtp-Source: ABdhPJxaKkxXXN2/KWbYMt8R19keUrj+/zo74qexOzyZbqDPwyo6rkVti8N8GMoMRPk/tKDyOyMfaw==
X-Received: by 2002:a17:90a:7608:: with SMTP id
 s8mr27397634pjk.159.1592955039921; 
 Tue, 23 Jun 2020 16:30:39 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id u35sm14655786pgm.48.2020.06.23.16.30.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Jun 2020 16:30:39 -0700 (PDT)
Date: Tue, 23 Jun 2020 16:30:11 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: fsl-asoc-card: Add WM8524 support
Message-ID: <20200623233003.GA28038@Asurada-Nvidia>
References: <1592895167-30483-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592895167-30483-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
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

On Tue, Jun 23, 2020 at 02:52:46PM +0800, Shengjiu Wang wrote:
> WM8524 only supports playback mode, and only works at
> slave mode.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
