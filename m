Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2B91D3F9C
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 23:08:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B76701669;
	Thu, 14 May 2020 23:07:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B76701669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589490504;
	bh=95YNAO/GElQpC9lPB+2OWTxLluIGuKrkVElP0YOfVIM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=of4S6z2pFftBvhhyYoMKwotF7y2WE+lJmOGggoG5wLgQAvNVFG5GglLAZRAIyVTD0
	 DNSUMAOs1P4jT/+S2XAYNv2Rpb9uHlubEPwdB+6SpNxaicHzZoT8UqMduDLwfUC3Y5
	 p4860g456Xd9QtySeYjxJI19i4Y32uoRuxD/uVdU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6556F80158;
	Thu, 14 May 2020 23:06:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9F37F80158; Thu, 14 May 2020 23:06:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7056F80101
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 23:06:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7056F80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nBkru1r8"
Received: by mail-wr1-x432.google.com with SMTP id l11so612542wru.0
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 14:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BA7cVkNpKOrpPx7yQhIyrjLAKuR6y1K/Cf/HhdYZT5I=;
 b=nBkru1r8etEn0gHEaSW+Rwdz7g6lokLnooGTN4Lfu5eTLRZPq4bZcuTuEanBaX9x3d
 Qz9aU94WOgE9TNiWAs1O0Wu8TTrIyaFLnbvNmWySW8LVKhBqCiq91K0ONdV+DY3mFjd1
 nU0cgckmPHzTVW1BJ2JXppM/e6hLDUDorKB80sbUAaRjLvrkzYwS5awV/yyzWyJpMS+z
 I/90TyEu74096M9SrU70o1HrX6A/BJ1Di3Lwv3S+62siJuP90fBCEE4n0zjjQuQxzfQU
 6HbIhRctKHJn+wzjF4+K7dwJIaPPOz+7XKWwXXIdlGGEMUVJjz2n2MhaDK0ClZsFfBif
 KncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BA7cVkNpKOrpPx7yQhIyrjLAKuR6y1K/Cf/HhdYZT5I=;
 b=J8yqtDU5QBjKXHkS3Ubp7iXsqak6AuBK33jRCCA6DW9bmFo+De15m6Kdd9mCXCDBZW
 KVAPlPWjKeARhvGVWSHPLeNInB5HtbTrubxmdm4S2aS1WKjdWwku6F6xbqkbA1PzJr8B
 eJhDjKMT3mLhigqFXmqQWecRdFuFHd4+JLN++ZP3qhdvQCMvvl1KeaAqP6XEEn6b7zNM
 8XNpeDB1PLhMxv8/qvzdZC5hj7KBjxdgLOesfIxgGM6oes7zc91AwH+n1zEj5ZGgD3pY
 Ib7LpALnANBUzv1EyNnqAK5evPOZN9PTdVHuim6sOaC2AbUa7JPw3tGU6eEnGDa0mCfV
 3uwQ==
X-Gm-Message-State: AOAM532SLqmfR8kFyvseMUHJ5WDCS+SivSyoFr/NRPFITG1H1IaRzs/H
 7Y+b02zNmOhiqZK5CFGbHJg=
X-Google-Smtp-Source: ABdhPJzPGjaYcvPnqEVwnJp2/XK4kCXE2oqNZX6Lu+VJwKDcgR743N9WTR/4rvigsI5Mi74suPfZUA==
X-Received: by 2002:a5d:6448:: with SMTP id d8mr415137wrw.118.1589490396962;
 Thu, 14 May 2020 14:06:36 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id o2sm416450wmc.21.2020.05.14.14.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 14:06:36 -0700 (PDT)
Date: Thu, 14 May 2020 21:06:07 +0000
From: sylvain.bertrand@gmail.com
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] fix snd_pcm_drain() excluding SETUP state from valid
 states
Message-ID: <20200514210607.GA6081@freedom>
References: <20200502193311.GA19340@freedom>
 <47281cd6-2ae5-309e-f1a9-8906ff50c9cc@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <47281cd6-2ae5-309e-f1a9-8906ff50c9cc@perex.cz>
User-Agent: Mutt/ (2018-04-13)
Cc: alsa-devel@alsa-project.org
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

On Thu, May 14, 2020 at 03:52:25PM +0200, Jaroslav Kysela wrote:
> NAK: You should not call drain when the PCM handle is in the SETUP field.
> It's an obvious caller problem. The streaming should be active somehow.

The pb here is the non-blocking calls of the drain function: in my test case,
the first call to the drain function switches the pcm in draining state, but
the pcm will be switched to the setup state somewhen in between 2 drain function
calls! Naively, I was calling the drain function on a regular time basis to see
if the draining was finished, namely expecting 0 to be returned.

Then if I understood you well, the right way(tm) to use the drain function in
non-block mode, is to call only once the drain function, then inspect the state
of the pcm till it not anymore in the draining state. 

Am I right? Or did I miss something again?

regards,

-- 
Sylvain
