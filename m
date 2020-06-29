Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0886E20DCB6
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 22:21:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85AA51658;
	Mon, 29 Jun 2020 22:20:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85AA51658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593462108;
	bh=lSc2CKMBNm8JYRGWn845Ps2M/yoEr9/EgewS4FMTL1o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZmE2TmFxc3hTnB23+Gsl6pmouAWACqlbTJEpCmF5XxE4KfO9jZ65X8Anzobv82dTY
	 eso65z70ntLiaVfZjPjkKXIvFwpsRKmT2SfUdnd+bNPIVEb+e8NydVwsgnbL0aEn+Q
	 pjYxcBfRa4XaElN8SIkhEMaF+mX2goQEKKpqBsR8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 398C5F8020C;
	Mon, 29 Jun 2020 22:20:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C6DDF80217; Mon, 29 Jun 2020 22:20:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06A23F80096
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 22:19:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06A23F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="aiSDRwA+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593461995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cJP1krYGDaHREd47OewoTpqWfi/WS5o83nXdBFdQxNE=;
 b=aiSDRwA+sAF0V3L6AN0jnIWHqo4Q8dwWISaCtmIHnQrH5F2TxOL8bvxzWLE/DbY8HNrQ/O
 3iUD63PXKGYT5vRO6uI74GIF4tinD7MXl5D6h6pU2UU5HbBg7nHYGjUmI81DBhZNPjLrUs
 xHWuxt40/8aBJ6wwmEfnj+aw5Tvi0pY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-Y0A3mx3WMnes-Afiv_ACtQ-1; Mon, 29 Jun 2020 16:19:53 -0400
X-MC-Unique: Y0A3mx3WMnes-Afiv_ACtQ-1
Received: by mail-ed1-f70.google.com with SMTP id w19so15361813edx.0
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 13:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cJP1krYGDaHREd47OewoTpqWfi/WS5o83nXdBFdQxNE=;
 b=CqOcLUOxgE3gT6PbM329BI8jjzvuj/Dc+7a/nNF8wihpeCxnlBocSkZ7eGHPIpWdto
 Uuk1UlKUEWpdjvuc2hHJe9X+5HPQfigoMY1q0jySl5y233xKno8yg4nIg+NktdnAcNIx
 QN1D4Rr8TV0HAVQu1PD2V7ViShMyZJDGlR0OfHyd/mH90A5m4lreF2waAuOCHd8qSA+Z
 xyelDjEEnW60u5OC9o61E36ZaKSeJlx4KRyVKHKYFKAfaDbaeyF8jUS382xtspFmSD6I
 NrfOllXQKv6udw8glqAH/q/4uGjI2e5v4cgqhQoTJ1355dqahKUal3F+IQQ5wrRvgSEI
 bTuw==
X-Gm-Message-State: AOAM532Zk2mozSUK/NxKpm4Ezfqd2I1yiRbeabqMTUP20wVmok0vsWnK
 iFwFVQ/ED/I98+niLCdePBHJ8Inxt32kM6xp095MjZlX7VzTRHtSnHrxJZ7WuJa5fmcKCzO0kDN
 RIPriMbsIqh9tRRREsuGHQWw=
X-Received: by 2002:a17:906:2641:: with SMTP id
 i1mr8111454ejc.380.1593461992284; 
 Mon, 29 Jun 2020 13:19:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx98t5/yeZmn+1hGQUxWbmznbtIWwfQI0gIL1U5ZGZnQ2UXPJozfLHT6GE+QrcnJHKdT4H9lw==
X-Received: by 2002:a17:906:2641:: with SMTP id
 i1mr8111436ejc.380.1593461992147; 
 Mon, 29 Jun 2020 13:19:52 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id w8sm668317eds.41.2020.06.29.13.19.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 13:19:51 -0700 (PDT)
Subject: Re: ASoC: rt5670/cht_bsw_rt5672: Some bugfixes and cleanups
To: Mark Brown <broonie@kernel.org>
References: <20200628155231.71089-1-hdegoede@redhat.com>
 <2dda2d0a-2aa5-d9a5-d214-6ab0259de43c@linux.intel.com>
 <b93be4cd-0d32-4bc0-d3f8-4f8a22996469@redhat.com>
 <20200629200728.GJ5499@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <584e1613-1124-8933-d5bb-6caed045f4a1@redhat.com>
Date: Mon, 29 Jun 2020 22:19:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200629200728.GJ5499@sirena.org.uk>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
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

On 6/29/20 10:07 PM, Mark Brown wrote:
> On Mon, Jun 29, 2020 at 10:02:23PM +0200, Hans de Goede wrote:
>> On 6/29/20 5:14 PM, Pierre-Louis Bossart wrote:
> 
>>> I added a minor comment on patch 1 but is a good set of changes, thanks Hans!
> 
>> Since Mark has already merged this, I believe it is best to keep
>> patch 1 as is, still thank you for the clarification of what is
>> going on.
> 
> I was kind of expecting an incremental patch for that TBH.

As I see, ok I can do that. This byt/cht stuff is mostly a
hobby project for me and I need to do some $dayjob things first.
I will post an incremental patch somewhere around the weekend.

Regards,

Hans

