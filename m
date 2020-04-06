Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AEC19F737
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Apr 2020 15:51:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5A1582E;
	Mon,  6 Apr 2020 15:51:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5A1582E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586181112;
	bh=icwFCVKZycTZ4Pj8x9eG2QtwcjKz1cGUJNJvf0PQNlU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AAhwec+L+V/E+XIe32ud0emSBbAj4p5kffvIAsN7cpNX9zda0UY05Q5fp7VyjWnrs
	 9bteBkATgSUYC6KAZBJ2nbpADsNOUirxHxJ5azTQ86hQDKOWfc5ji7qRR9/GVRCmS6
	 Z5NJO4o7Sdhnp448oW6wKRwPHr/GvD0dc78ds/WI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDC66F80150;
	Mon,  6 Apr 2020 15:50:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D53CEF80121; Mon,  6 Apr 2020 15:50:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7ABBF80121
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 15:50:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7ABBF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="myHgc5Nt"
Received: by mail-wr1-x441.google.com with SMTP id w15so11307235wrv.10
 for <alsa-devel@alsa-project.org>; Mon, 06 Apr 2020 06:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1ZBXAkSNw7rN3Vg/64u1/mtjj5o3RF5dmotAwUEzNXY=;
 b=myHgc5Nt2kD5Fr+CT43bdkvCmIzudFhzhOwNkoRG25SZi35VCGrxuwmEjjFOjw1B8e
 JGag06K3HBNOor0LX051mDJvYuxWcZSkM4iflE+kY+Tx8v5xRkOvAIGD/PfAUU0+NY1Z
 CV4j/MfGpOAhlw1uJVHy4cRh6eLOCjbAviNs8l4UMfSb1lg9pYyWRRptavAzdtpdh/Wn
 1Npp2C2KNn316rL6xFPDwOfMmgWXnfLusewrF/pB95kaPwacIapFv1JwhDf5efqt2dOd
 y+RSDk5MzgAKR6mWkTPINbOQLuSzM4jEmkjnCBXrAPR9VKj5GbbcSYm1okRB2GekpJUC
 i5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1ZBXAkSNw7rN3Vg/64u1/mtjj5o3RF5dmotAwUEzNXY=;
 b=d1MUYmoT28zOUz6sDbGyUJQ4zx6+pQ0kVCf7y9C/HZZ6rboF7ubqc4Lp8gykZDmpai
 kYyuYh8c3eMS1xKD23djNOrigTSm8aTKizybMiDx9CPtoDx1s7gWdFKaygKMB7QfRlxg
 v3L0SjVPZ6lO39ObgdE+zWPGvGiaT5EXefE3XG2Pmo2Cf8tz7tx0mBV6cza0FCCgSz9E
 mIIXRwz01D7+Qd8zSfFcs4JlTawLQuZ4RGCqDHT6nZHUkWIHvzkpXLKXjQxOIVRjFTCz
 iBkinx3Ae8SQCTBmVZ4XvH1pLds2zi+VnyUqSN3Jb5dnTqPQC+MJwj3kks8SvVAUrTQ6
 frDw==
X-Gm-Message-State: AGi0PubW2M1GuEhVKIqY3OMyi9InFi+n2mt5QrVWuqr/C1hD8Ed+FA3E
 MS45msDOuiM5RxAWLxpkNCI=
X-Google-Smtp-Source: APiQypL14gh+vxsVIEoFPY9HTJvWYM3t7xRLIxgktYWk4KQsLq+jp/DkXlyXE6WGyHIU56+FPr3/Ow==
X-Received: by 2002:adf:ee0c:: with SMTP id y12mr1809348wrn.85.1586181000465; 
 Mon, 06 Apr 2020 06:50:00 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id o145sm25487425wme.42.2020.04.06.06.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 06:50:00 -0700 (PDT)
Date: Mon, 6 Apr 2020 13:49:57 +0000
From: sylvain.bertrand@gmail.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: sw_params for a direct-ed(dmix) hw pcm
Message-ID: <20200406134957.GA643@freedom>
References: <1baab0fd-d802-3707-645f-d5dc4bf6c32c@linux.intel.com>
 <20200328203744.GA2398@freedom>
 <59266c58-96d8-93e9-bc8f-86e9fccf8d60@linux.intel.com>
 <20200328222021.GA4610@freedom> <s5hr1xbd2su.wl-tiwai@suse.de>
 <s5hlfng7oaj.wl-tiwai@suse.de> <20200401152538.GA11377@freedom>
 <s5hwo6z2o3r.wl-tiwai@suse.de> <20200401202126.GA9511@freedom>
 <20200402190326.GA12391@freedom>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200402190326.GA12391@freedom>
User-Agent: Mutt/ (2018-04-13)
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

No pb so far (I tested mostly monotonic_raw and default)

Can anybody test it with the pulseaudio alsa plugin?

Because building pulseaudio is an accute pain on a lean gnu/linux distro like
mine.

regards,

-- 
Sylvain
