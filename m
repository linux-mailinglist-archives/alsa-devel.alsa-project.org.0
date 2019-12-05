Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C619D11476F
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Dec 2019 20:05:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 490BF166E;
	Thu,  5 Dec 2019 20:04:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 490BF166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575572710;
	bh=ee2wyZAv1N0q7o4ZuZSKNHBz5OqfyY2v39EWrUwl8bM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ynh/hVW8RV288rqssrb5VdIinpL6vtvMqVSDaErFoVec4L6AFyDsKGaD/UYgM9mgj
	 dP2POSPy+0G8Aegge1nAiRaovCY0mMIX34gCSeWUAd9JYnGySnHmeRqmLjR8y7n74w
	 yM6pXpzl+JBjIV7cX0WjQrujjpcj5gOZqvS4xYow=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABF81F80228;
	Thu,  5 Dec 2019 20:03:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9F76F801F8; Thu,  5 Dec 2019 20:03:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5BD3F8010F
 for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2019 20:03:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5BD3F8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="FY4mts/2"
Received: by mail-qk1-x742.google.com with SMTP id d124so4280148qke.6
 for <alsa-devel@alsa-project.org>; Thu, 05 Dec 2019 11:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dtFfdPZ0BRtd9N57NhCCOKFgIQuDsoHNi9e94He/aJ8=;
 b=FY4mts/2UCdcvEPdaKP914hnchAyDpJhxuSjmaPuQ++rdh5tLxeqzRWTiAII8jKwYH
 tvRvUyIiEhXPy+aSbjGRu0nq4z9f53w5UqTwLNy8n/+VlbnNUj11UHe7FDv70InWkGc8
 keTPJbBLjA8DBUOoF6ElUU7ssknlVhyKdslbm9zrMepLBqbt3OxoRXZId2msupYgWkwr
 7RLyEv/kBL8qI4Ix2e8U3xIBuylwppMpnNfR8+CW3E7mlPcI4OfCmeXfGU8stctrtUbF
 T3LRbLWZnwfD+KocQrZ7N+KYrai0UOYiN9bIonzdPdNaNRG7yyyble5PXz2p32hNrmLo
 5V5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dtFfdPZ0BRtd9N57NhCCOKFgIQuDsoHNi9e94He/aJ8=;
 b=nE9VqKAdjeDvO72XfnQbmV1ix+Px76W7Nvz5trt+o1BPLKRRCDCVrpkuryLTuz2sjH
 Wek2j0NjTb+sgnxiknIgpmawYgA0Jfa+8tJ0TSCf2xIKKSSYkb+sG9sE4/cL3VaIqHe3
 DwoilXE/AYj5vtIAZMYWkesihaRWlz+F0o/wjjjsLOHhZHb7d+2kFcq/APTULuAiLbsg
 e1hTkos2KAuwaMPrgORFGu+HO11QKHE5MA3KNaLxlNNWMa5MDYOmIHw6yJNVX8WWEVcv
 y5UztCy92fJWcgZe9AXL57e+xwPyGsnR4LURNaXBE8YeOg7Xw7z68It5M5faD3oUuluH
 yqiA==
X-Gm-Message-State: APjAAAU4BOGERrKT21AxEtISASOJEa7dlGzJ43B3ci2dVSJdyvIiQNG3
 +snZKIqk4HZATqiDu5asgDd+I65sGYF6nebNKdhluw==
X-Google-Smtp-Source: APXvYqy6YNsLnq/geSWiKaf9XZNSavBibtqe8nPuNTgt4iDt/DmWnjb6ZwOn6/U/OUQgl2WvCt7sN6mVOVTZuaakysA=
X-Received: by 2002:a37:a914:: with SMTP id s20mr9811157qke.92.1575572593184; 
 Thu, 05 Dec 2019 11:03:13 -0800 (PST)
MIME-Version: 1.0
References: <20191205001605.229405-1-cujomalainey@chromium.org>
 <7205cec0f9d6082b0f3c1b9922f28b23696246f6.camel@linux.intel.com>
In-Reply-To: <7205cec0f9d6082b0f3c1b9922f28b23696246f6.camel@linux.intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Thu, 5 Dec 2019 11:03:02 -0800
Message-ID: <CAOReqxh8y=o+y5Z=KJ1qm4uehwTpdR37OJxNsLON2LiTfiq9qQ@mail.gmail.com>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Bard Liao <bardliao@realtek.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Hui Wang <hui.wang@canonical.com>,
 Jon Flatley <jflat@chromium.org>, Ben Zhang <benzh@chromium.org>,
 Mark Brown <broonie@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Naveen Manohar <naveen.m@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: intel: Add Broadwell rt5650
	machine driver
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

> > +
> > +static struct platform_driver bdw_rt5650_audio = {
> > +     .probe = bdw_rt5650_probe,
> > +     .driver = {
> > +             .name = "bdw-rt5650",
> > +             .owner = THIS_MODULE,
> Hi Curtis,
>
> Do you need to set the pm_ops?
>
> Thanks,
> Ranjani
Hi Ranjani,

Not that I am aware of. Are you aware of any additional callbacks that
need to be installed for this platform?
> > +     },
> > +};
> > +
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
