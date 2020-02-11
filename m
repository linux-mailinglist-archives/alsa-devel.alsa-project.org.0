Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 349BD159A9A
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 21:39:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 925F415E2;
	Tue, 11 Feb 2020 21:38:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 925F415E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581453568;
	bh=/RLY8KJQFbS907z03KWnDzVL+BW4BJfcKqiOSXSbge0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rg3ZbbCYvg62+P1qObb6Yd5osx+x50GB8lRddZ9xHTahxquJLJo9kl0zI4P06avNL
	 dET4PYFKTGKDxYOexKJ2NhjBKHD4RvvVJUICqd77B9ImgeW6MnvBBeVBMXqoPhqqFz
	 J4PCX13YoSgHtP7/f0x262Z1vSgqybK2OkW6ExT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CD69F800F0;
	Tue, 11 Feb 2020 21:37:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C0B9F80145; Tue, 11 Feb 2020 21:37:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20326F800F0
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 21:37:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20326F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="bQeXaWb6"
Received: by mail-io1-xd44.google.com with SMTP id h8so13383291iob.2
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 12:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aNR92WPC/mMAKSQN3mZEwyb9pRseRqDXnlVBAKtffDQ=;
 b=bQeXaWb6h+7mPixZUm1LMrdsWDxgxKISuoatu68+VLeNdt5yA2RGYxLS3tdae7ctDF
 q3m3uLDnc4aHf8HcLEfGdKWdtZu8c57Kg4AADRuE8OdnHbpLnAMxj7kX37MbfF75DIv2
 NYTpbibRiepTTce661qNMbUnhhcEsGeHA4DVFIdkF34Q65CPyW+DkcLlv/zNLxf+KW6c
 osz+slSisOsLKujIAkWjWGov+loVoZ60pUycNvVGN35bGcORk5dbZUQadMrvq3Hj78cO
 AtDpzPsRrj5gLHC0m3l2X5x7rFweXh91OzhGcLe++jewKF8FMHLFSt+zW6yuclVaW6X5
 4f9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aNR92WPC/mMAKSQN3mZEwyb9pRseRqDXnlVBAKtffDQ=;
 b=P+NussfUhIA9pcCfvZNiFSPEEjcSvIEi7WLaBbdgQBrt22E6YvXb0UVkXEsOI0rZCD
 uMKGsdfanod5jVYkvKd5kYpGtobbh36EykZdfzqUxSQIC9tz4U/gy0HWtqMsvobvV9CX
 bzp27fjKxK+CSiICdYVrewyMA4oXzGYLFZ7lN6/1xie3BV2BswNJP8tp7Ha7dambXR2X
 sQrBdwsEOEY6tYbAKK0fCyYplUS6P0KKOMvKpms6gQlpmn9WR1oQ+hkTolTUBJ0ePK66
 aDKy46d6r1pTrf8DEuM/dgD/H83JHdKGicL1JC8GF/IE2eMaOHRydn1y7kTA9qjL2+nz
 2PRA==
X-Gm-Message-State: APjAAAUWwfOJHCPhmc7EQqAfLEaA7W4hDy9GxjKZn8zKj2HZsk1s9QiO
 nKN/Fs/QPxGQNdnv+TPtwE0wEHXDuUfBK912QKWC6A==
X-Google-Smtp-Source: APXvYqxACNJmwHtc3Nbe990Li5ARpLY+AgcUS2qgBc0ZuZIzfhbGcIdDpXRIEowKdWUHb89ProS2j9OBBxOijcocn9w=
X-Received: by 2002:a6b:5503:: with SMTP id j3mr14752612iob.142.1581453459818; 
 Tue, 11 Feb 2020 12:37:39 -0800 (PST)
MIME-Version: 1.0
References: <1581322611-25695-1-git-send-email-brent.lu@intel.com>
 <AM6PR10MB2263F302A86B17C95B16361280190@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
 <SN6PR11MB26702B2E7E5F705425517F4897180@SN6PR11MB2670.namprd11.prod.outlook.com>
 <855c88fb-4438-aefb-ac9b-a9a5a2dc8caa@linux.intel.com>
In-Reply-To: <855c88fb-4438-aefb-ac9b-a9a5a2dc8caa@linux.intel.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Tue, 11 Feb 2020 12:37:28 -0800
Message-ID: <CAFQqKeWHDyyd_YBBaD6P2sCL5OCNEsiUU6B7eUwtiLv8GZU0yg@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Support Opensource <Support.Opensource@diasemi.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Chiang,
 Mac" <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, "Lu,
 Brent" <brent.lu@intel.com>, "cychiang@google.com" <cychiang@google.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: da7219: check SRM lock in trigger
	callback
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

>
>
> > I think the patch is for those systems which enable I2S clocks in
> pcm_start instead
> > of pcm_prepare. It has no effect on systems already be able to turn on
> clocks in
> > supply widgets or set_bias_level() function.
> >
> > If the trigger type in the DAI link is TRIGGER_PRE, then the trigger
> function of FE port
> > (component or CPU DAI) will be called before codec driver's trigger
> function. In this
> > case we will be able to turn on the clock in time. However, if the
> trigger type is
> > TRIGGER_POST, then the patch does not help because just like what you
> said, codec
> > driver's trigger function is called first.
>
> IIRC we recently did a change to deal with underflows. Ranjani, can you
> remind us what the issue was?

Hi Pierre,

Are you talking about the change in this commit acbf27746ecfa96b
"ASoC: pcm: update FE/BE trigger order based on the command"?

We made this change to handle xruns during pause/release particularly on
the Intel HDA platforms.

Thanks,
Ranjani
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
