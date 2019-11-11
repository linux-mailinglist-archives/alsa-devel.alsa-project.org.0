Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B069F804B
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 20:39:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AB431677;
	Mon, 11 Nov 2019 20:38:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AB431677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573501178;
	bh=Jqj3R39H2GbjqWqQhwK4e5n2rWNR8Gj3CVLN44uvqgs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L5Tf4WYnOu+kOocluXzZ+IADH8haORYHaFztczMY+2sN0nVdgerAZU0/APJBwB1+J
	 qJ1wOz6xfI/a5H2Nhy+n4R4Mta7t/6maocbVFTamG5hwzPXL7HfJu6ecGmmwk2IW4a
	 Z8ATjRirDRJXNbE6bRrMuEaGkn6BNEfK9lAaTR0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5557F8045D;
	Mon, 11 Nov 2019 20:37:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15309F804FF; Mon, 11 Nov 2019 20:37:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,FSL_HELO_FAKE,SPF_HELO_NONE,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28CC7F80275
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 20:37:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28CC7F80275
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="V+nzXDHw"
Received: by mail-io1-xd44.google.com with SMTP id p6so15865591iod.7
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 11:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Tjpx5W7e7hh3YundOT3Y5omRle8TPAfSWZ5zGMH9jMc=;
 b=V+nzXDHw0skWoqJdyWz9Rdx7fNPDeHhrAd8kmRI2OMSc0u7Jg9liQSmQF3eteMdg64
 N7K1Mt6HYT8g0Mi/ZFZ7Su1w6rOVUR+QiqTw8RKfH10TpFVKkQFBQaPtaGt6wkKKbb/8
 O53R/ZMO2RQCQ+8SlSir2Cg4uM43UWTBjK+sESIAyXMvNg2s19L4iOeXfpWG4j9qCFri
 nXb1+BKV+F/5vh5QaJdbCWbbJAFdRj564A+3/ZweIGORbKn3dqiaN+TGayhHbsHc1QxY
 lxCyq3yA13b8+j5ervk2YqJZjjKvXv1PkWXEEPVvWeTaHeY7SVbRyqU3PHodlCkXUEt/
 LpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Tjpx5W7e7hh3YundOT3Y5omRle8TPAfSWZ5zGMH9jMc=;
 b=IXhMGOT+mwfhsUbb4WvB3HbX8HpxfP8Jr6buooo7TqWszoo8gz8Th//6vHrZMkovDX
 wGzEC93I518OExPAo4chfxHotwDxAJsURYdmATQa6ZTBX7s/GJk6B6uAgnO5v+qTM2gU
 FkXztpkmoZ4SgQPYIosCK1PWTr3WehcJec+YHCEB/hSSGFkzeiLI4tIUYTtBJKZSFfnc
 EOrpQ4XSha3lJFJh44IoIiMVbb3RlpTz2kfEHCTzaW100BS7D/d3xmIZFPS5vCnJloKZ
 InEe1RtayF42P4jdfRi1FMRhrTUQMeOW/R23+pTFIJHqFx6TFMJs9DCBRPewOzuTrR1x
 jx9A==
X-Gm-Message-State: APjAAAUVfRxyMALgZ0Q1PNI58Gmqznh3tUZIrRKGvs25M/FuQ6V+hJMD
 Xzv09USYf/+6XcuXRbQE8D4Wjw==
X-Google-Smtp-Source: APXvYqwgn6zN2XKEdcnAdpxA3h/aPY56cMiq5P/zNmFabJ/SWU/jO7LQBfMsKg2bkrcRgPyoTfN2Gw==
X-Received: by 2002:a02:a402:: with SMTP id c2mr13107642jal.5.1573501066412;
 Mon, 11 Nov 2019 11:37:46 -0800 (PST)
Received: from google.com ([2620:15c:183:200:855f:8919:84a7:4794])
 by smtp.gmail.com with ESMTPSA id x5sm2287716ila.34.2019.11.11.11.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 11:37:45 -0800 (PST)
Date: Mon, 11 Nov 2019 12:37:43 -0700
From: Ross Zwisler <zwisler@google.com>
To: Jacob Rasmussen <jacobraz@chromium.org>
Message-ID: <20191111193743.GA201426@google.com>
References: <20191111185957.217244-1-jacobraz@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191111185957.217244-1-jacobraz@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Jacob Rasmussen <jacobraz@google.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt5645: Fixed buddy jack support.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Nov 11, 2019 at 11:59:57AM -0700, Jacob Rasmussen wrote:
> The headphone jack on buddy was broken with the following commit:
> commit 6b5da66322c5 ("ASoC: rt5645: read jd1_1 status for jd
> detection").
> This changes the jd_mode for buddy to 4 so buddy can read from the same
> register that was used in the working version of this driver without
> affecting any other devices that might use this, since no other device uses
> jd_mode = 4. To test this I plugged and uplugged the headphone jack, verifying
> audio works.
> 
> Signed-off-by: Jacob Rasmussen <jacobraz@google.com>

Reviewed-by: Ross Zwisler <zwisler@google.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
