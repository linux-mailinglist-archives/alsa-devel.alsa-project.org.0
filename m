Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D362319AEB3
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Apr 2020 17:28:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E47A167A;
	Wed,  1 Apr 2020 17:27:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E47A167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585754881;
	bh=bBQ7Q8DM5Ply8RHSoBKvYfWvQ53x8KeJjyTnDHqUjnY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q3n3TW+V9EZWfG5kyi95RMb+VLpFoEST82ySHfdgRp5KxGBHgxSE7UlkDirNy7DKG
	 fxDQw6rTnMglDZbmbRB6r4WRWyJARuaqnaOITW9/vyPpBSm4EFeSYFEaZALzg2MK3C
	 8Ek3z2gQ8mPdh0nwYYgK4FZUlaggpKrSzutoOaBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7447AF8014C;
	Wed,  1 Apr 2020 17:26:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 910ABF8014B; Wed,  1 Apr 2020 17:26:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7BDFF8010D
 for <alsa-devel@alsa-project.org>; Wed,  1 Apr 2020 17:26:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7BDFF8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Zr1F4bW+"
Received: by mail-wm1-x342.google.com with SMTP id a81so128568wmf.5
 for <alsa-devel@alsa-project.org>; Wed, 01 Apr 2020 08:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5bu3mxozmAxaG5bCG+w1MFkv0qDft2hJ6wWcqjfguZg=;
 b=Zr1F4bW+vLqz0GeW+DbxUfwB4XWu19u7nlNLsM4Gvn+fp3g2Vx68ZuF2E/paJyZBhK
 tVeTDuZkmE+lrwYiMXlYf4ipxOI6eWaye1FJbu6BPWWmSMVbOqZl7lxl0lC9RNnX0dgn
 BuA+I1OVS2YBWh58TjN5vsX7QWFwVeDktwf3QHPChf4zTDZL747Xg44Eq76axhedSdnn
 uhucVPEbQhem/2I0uKCeaSLAJx1Z4xd6r+Ng1KQX/AT2SvvINNva2Lp92giYVOLf8Et6
 D5kYFiJgAjchiaHMTT+64qMuj0NegPuNAMHt7CaueTFawwvjejUm0haRvwlM689y9g1M
 kOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5bu3mxozmAxaG5bCG+w1MFkv0qDft2hJ6wWcqjfguZg=;
 b=D4i5r1vsCLczhMWMwABnKBGG7TDKmyEWiarJiZp4XWaAO0MGpyyxx2rOWnujCPnYaj
 lkuuo0jVc/htoHDik3mFoYoSAkTIHoScZKaF06otmCRKB28wlNlFKJzuVjkTetMZMo+k
 YMDSQwaRwWcLsPrUywkXDioEiSif9ERMKXqnt6plsPQpgwwHPwQ1xO1KsCOJARcPgGgi
 B+XVxz0ktNPVtvYfOawfwf7kSe3/Ztzv2aTdJi04w+6GYmNqA9EpplnP+uKCWcyOOfb+
 nPR6mZoUxTJ7SW5rb4m2RVy4S1m8qLp2NnKenQrW7HDVdcMSTbywuuYnnTkyOO5W13sU
 M0lA==
X-Gm-Message-State: AGi0PuaDoBOe41nWHKMIZoNJgh04Sv07j7ftfZx+cfOIm5O/PuYp6z3n
 TmKfpUrxfWFkK+36KpV20Lc=
X-Google-Smtp-Source: APiQypI0ZQwP7QPwDKaj7xVMXvD5CAMwYgghlwB1jmyVHbVD462PFCpJYYIxscsf65A7jKdSHeJ2aA==
X-Received: by 2002:a05:600c:2202:: with SMTP id
 z2mr4595268wml.64.1585754773587; 
 Wed, 01 Apr 2020 08:26:13 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id i21sm3191849wmb.23.2020.04.01.08.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 08:26:13 -0700 (PDT)
Date: Wed, 1 Apr 2020 15:25:38 +0000
From: sylvain.bertrand@gmail.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: sw_params for a direct-ed(dmix) hw pcm
Message-ID: <20200401152538.GA11377@freedom>
References: <20200326200415.GA1321@freedom> <s5hlfnmfcdt.wl-tiwai@suse.de>
 <0b0f5117-3b4b-0c25-cd4b-0ecc72479635@perex.cz>
 <20200328182624.GA775@freedom>
 <1baab0fd-d802-3707-645f-d5dc4bf6c32c@linux.intel.com>
 <20200328203744.GA2398@freedom>
 <59266c58-96d8-93e9-bc8f-86e9fccf8d60@linux.intel.com>
 <20200328222021.GA4610@freedom> <s5hr1xbd2su.wl-tiwai@suse.de>
 <s5hlfng7oaj.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <s5hlfng7oaj.wl-tiwai@suse.de>
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

Hi,

Lol, I was working on it too. I got almost exactly the same code related to the
addition of a configuration variable:
 - in 'struct snd_pcm_direct_open_conf' I used the type 'snd_pcm_tstamp_type_t'
   instead of 'int' for the added tstamp_type field.
 - idem for the 'struct snd_pcm_direct' tstamp_type field.

Then, I was hesistating to make snd_pcm_sw_params_set_tstamp_type recursive or/and
what you did, namely check at the time of sw_params installation.

I'll start to test your patch.

regards,

-- 
Sylvain 
