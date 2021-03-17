Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF7433F7E1
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 19:13:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EB1816D3;
	Wed, 17 Mar 2021 19:12:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EB1816D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616004828;
	bh=eqYUQ2r3M1snkS6Tu7e3OIsFIzQ84D5BTX2tKfLb6J4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p1Tf396KVVnBrtwA8vUz2Iy/QWNks3p5CUrDA6Z0hg3m/90SCQabrzWQZACewR3Vt
	 FEJxl2gsGiKN4oNE7svxJ01IwJapi/SCoDUFR4i1RBYeN5qWhc0pwOTQE/T9W18kbZ
	 5kcc5znZFMhgFZkYTmbiiLXRDpJtDc7p1R/WqQ0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 684FDF8023C;
	Wed, 17 Mar 2021 19:12:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA4A9F8013F; Wed, 17 Mar 2021 19:12:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44BB6F8013F
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 19:12:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44BB6F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="vVgz3AQi"
Received: by mail-lf1-x131.google.com with SMTP id n138so324729lfa.3
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 11:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Rm3F1cA66zuHgAWNRDnehpSfjsTieaJWbbEO5oa1uuM=;
 b=vVgz3AQi0vg3TM/jatpKxgQ/QE6HJO9dEZ8vJzAgmdLbuBOYqnMujyiVKvIXyRJRSa
 YGC/22kFevbVibqEWnnSMAyi9C3rZ0htJNht6qXp2OVG8ejP9jpNrpbzJwyieTVJszN4
 TR5/D+X5IyXZ3Xw3FdiF4poNMFIx9a4YY0d8z1SWMq29wqKgAc+aSBbtawJgrEE6rRqa
 RDo53bXS8jQXfhAknx2wvK5nFRfPgltQOoFFrYmyslbqLh/IybV6dZgqfYNVeJy6rbEQ
 pnkywobegW+vx3vCNNF785P/5naKfz5uPwzbmqqH+KjEzBlY7ei+qW4pkRiIl+j3r/jn
 ghhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Rm3F1cA66zuHgAWNRDnehpSfjsTieaJWbbEO5oa1uuM=;
 b=ScLbS5wVngszwYRjTpdqnLjI4P42Jfc9iDYvKHUh7WeeO5UEXDaDx7sW9JGMB3P1EX
 Q4vs+TMg+iiiFI5QWC9ug8y8INgP69HVNHg2P+ikIMM3aBJwgHFKZHEYNOi8D3CbHK44
 ag1I0qerU8yaje3U6IgzIGhgbXZ9ixPd7Tu5/0J34HVwFNwkkSQbWEq/SdPo7G/RkALz
 Mh3A3Nr0i9pSpmQ6UN5sFl7WA5Ss85hjXU8896G63J4mt/CHjb/NZ+ydyOgGZxIk4+i9
 Jw3pkDpocms+kTMLtiyudq4NIt6QwmEYEgaJ/se/xYDBJg4eWaA/H3RsDWYonhv29Stm
 VLrQ==
X-Gm-Message-State: AOAM530H8VAugdnd1799m4pxQEC1+Yr/k99WnX5AWweC2I9IHDHYbbxi
 +CMrAZi77tAQjbysK0fuR/Q=
X-Google-Smtp-Source: ABdhPJy8C3qkLS4DHxFIw+3kI4BF3VFOS96SBfc4NPrMSaw9BPWwByRgdUj6C7Q4vrBF00Nhg7jtCg==
X-Received: by 2002:a19:c0f:: with SMTP id 15mr3068331lfm.580.1616004729249;
 Wed, 17 Mar 2021 11:12:09 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.googlemail.com with ESMTPSA id u2sm3421397lfi.187.2021.03.17.11.12.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 11:12:08 -0700 (PDT)
Subject: Re: [PATCH v5 00/17] Fix reset controls and RPM of NVIDIA Tegra ASoC
 drivers
To: Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20210314154459.15375-1-digetx@gmail.com>
 <be93d088-fefe-77f0-9b8e-9c815cc0d0f0@gmail.com>
 <20210317175434.GD5559@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <81ddddba-a179-9389-2458-de6741428822@gmail.com>
Date: Wed, 17 Mar 2021 21:12:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210317175434.GD5559@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Paul Fertser <fercerpav@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
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

17.03.2021 20:54, Mark Brown пишет:
> On Wed, Mar 17, 2021 at 08:20:10PM +0300, Dmitry Osipenko wrote:
> 
>> Mark / Takashi, I may try to split up this series into two or three
>> smaller patchsets and then the reset/ patch from Philipp Zabel could be
>> merged by Philipp himself. I primarily want to have the audio resets
>> fixed and the reset API extended with reset_control_bulk in 5.13 because
>> this will unblock other patches. Please let me know what you prefer more.
> 
> I've actually already got this queued for application next time I apply
> things, I'm guessing Phillip was intending that the reset patch go via
> ASoC?
> 

I assume that Phillip is okay with applying the reset patch via ASoC
since he didn't say anything specifically about it. Thank you for taking
care of the patches!

Phillip, please let us know if you have objections in regards to
applying the reset_control_bulk via ASoC.
