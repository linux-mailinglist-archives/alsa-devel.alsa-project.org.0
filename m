Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A75B212C8E
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 20:53:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5F8516D9;
	Thu,  2 Jul 2020 20:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5F8516D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593716018;
	bh=c9kRZR0MGwqge+F3EvcVdERzZpwtT8r8EtyAcF+9Q2U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AoQW0/9jBmhyT4wt2a3/1TTPmvAYB5aQkQf3TlJYypliO45mVDjjpAP+KoCG4dcF5
	 M7frchl3t2xhbigY8hsKi5Nhodf8B1XhcDDpBlPmBpZBjGY6EpO8L9Lkx6OuSk8pfJ
	 cmiXii1l/Y8tNTYp7jYhMl0zYJiqsL43tHTnCkio=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C588DF80134;
	Thu,  2 Jul 2020 20:51:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46FA0F8022D; Thu,  2 Jul 2020 20:51:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21C1FF80134
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 20:51:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21C1FF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="skU5G1aD"
Received: by mail-pl1-x643.google.com with SMTP id f2so11648712plr.8
 for <alsa-devel@alsa-project.org>; Thu, 02 Jul 2020 11:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SzSS54e5bq1IFnXIIvO4DspIsZygQN1CJ03qjOV/T6I=;
 b=skU5G1aDBzVI2snI8XGozUM7qQgxSd7izAiIeccwo4I7Feqpn4pyqzAVSPUer3Hh9K
 ffAmWdo8GyUfJFsyP7cmkrrW7M1e2X+hUKPGrnAkFg8CAwC3gT9CSfTzHwSq1GKySJ0O
 vFMwTAdHDlGmu9ueRb4d+g+TqMhxaReiZkJXYFYUvAL8Wdi0Yo/sBMtddDC+7T/rWfA2
 v6wFmnA0WemapDZdoTwgnXs7cjFEKDjTyh8NYs6ojyToUh8XP0qfpYb4CGnspQG4EMLC
 qQje0LZHREcJ+w1lmTu1ZmCByBBdJDSai4Ig8RmibzE7Yi9BlTY+AZAZR5uijxh5Kaj8
 0fmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SzSS54e5bq1IFnXIIvO4DspIsZygQN1CJ03qjOV/T6I=;
 b=sId1w8QwhNoMltQ95wLbz+hkeMqQd/8HoT5Q+imCRbPOixSQlYCmSnzH3p4kWYVBXF
 XOjWMeH7H5/mXIilDDIpB4Zagcf8K3P54t9pLekd1RX6Cw5MsEBfsc0GRZbytU1OxITV
 sKzFdS5afXkRcOHI/ev5g6Jd1WJt+RvVluUiEMSNSQv1VEtVo20dwpYTfbXEqvz8XxOC
 LUlonm6MV2Pb1+WjnOQLt5V3kowb3ZoUkerJRx3EcZFjHvZ5jnGi28UPmcUG6LqzBlos
 hkc3u1nvHefZy8mpdPlOZVagixWrzx40s49OFJ6z2UTFb4HNCLzeastDWb+b9eVUL0TW
 E42A==
X-Gm-Message-State: AOAM531K1OYJGMcmfW5YryJpUWeZc56+DKYmRWhNKXAFJYCyv2u3fqUU
 O0SvA7myXP5rQQdfzu8aODs=
X-Google-Smtp-Source: ABdhPJwafFGUWpt7uEzkYfqLdRUfoFvIEPIx2vTSqVn++JfBTlcWmD7vrAtYfcS3N6QfDZ/QQ/XpWg==
X-Received: by 2002:a17:90a:dc09:: with SMTP id
 i9mr34272574pjv.122.1593715905957; 
 Thu, 02 Jul 2020 11:51:45 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id s10sm8949429pjl.41.2020.07.02.11.51.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 Jul 2020 11:51:45 -0700 (PDT)
Date: Thu, 2 Jul 2020 11:51:41 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 5/6] ASoC: fsl: fsl_asrc: fix kernel-doc
Message-ID: <20200702185141.GF23935@Asurada-Nvidia>
References: <20200702172227.164474-1-pierre-louis.bossart@linux.intel.com>
 <20200702172227.164474-6-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702172227.164474-6-pierre-louis.bossart@linux.intel.com>
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

On Thu, Jul 02, 2020 at 12:22:26PM -0500, Pierre-Louis Bossart wrote:
> Fix W=1 warnings. fix kernel doc and describe arguments.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
