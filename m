Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CB9327FB9
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 14:40:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B00E1697;
	Mon,  1 Mar 2021 14:40:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B00E1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614606053;
	bh=id8PwiQ6wN34ZqUTTC0Pm2dOKx6cXZQ4t7WegkD3lLc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MXGpC4zOMrl0pO+uFqgJ3oZPwgSF6XKIKleWq3EK0oSnSMUWH+rPjyVSw2wgL8wQC
	 LGw0aLAqEZdLezxadXqcbuDafv99Kl1sO2odOu7f9ynsj9guRRuQyP9JyXEi9C23K2
	 6k5u4u+fnF8s+6sAqkITvbbhDrnIN/behpTnj4Z8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 755CAF804DA;
	Mon,  1 Mar 2021 14:40:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D36CF804E5; Mon,  1 Mar 2021 14:39:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC992F804DA
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 14:39:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC992F804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="OH5I7I56"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614605992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ygZ8a+OxNKieLx1GiyLGJRwsfHifF/oGw/KtgHkc658=;
 b=OH5I7I56Lfp16cuyv46GFg9h0K4etI2dEtPBdrKBraNsZKoUpVhw1iDnO/V4JrEI523ee2
 W/TZMYrwoVLjwoIrMZdvBxDnmQqtduam1S3yd0U8yEjqekA26OosT57MmlZ4d5eR3iCpS5
 dUjZlRqXQd8lEu4OVcAMmmo4dxd7ehI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-1NJjoBuOMZSFnUYK1nFrhw-1; Mon, 01 Mar 2021 08:39:48 -0500
X-MC-Unique: 1NJjoBuOMZSFnUYK1nFrhw-1
Received: by mail-ed1-f71.google.com with SMTP id f11so8749956edk.13
 for <alsa-devel@alsa-project.org>; Mon, 01 Mar 2021 05:39:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ygZ8a+OxNKieLx1GiyLGJRwsfHifF/oGw/KtgHkc658=;
 b=TukW5Tn6TfH0QqLcc9K0xtzaYBUgCcfh5GVULuEnXelWykhWkXrnTmTqgVMrOH2jHR
 KBFhi3CkCLKkMfzzslOoUvgB4Idp1yEc6yE1AzpQz8x9TVvztfCE7gRIck3K3zOyIN7k
 zr9XAU7vxDVK/X8lJwU6YWbBTBdgb4ijCX4fTtNeJF+lPuZAtMi0GSDANRu5bfK0ChgF
 BvKaeA94BrjnBgiU+3doCNCqeZf73cp29vdUv/CmmLbp/KqEsNLWAmXgBBcUOarSvY4i
 NUGA6ZUN0c9Fwv1t3lMpCRS09oWFw5JPkQTZYeXewrLVpdSi8uZ1+WqOv9ubJjYlQ0Gv
 HhgQ==
X-Gm-Message-State: AOAM533LzZcl1veOdkI7zn/ANZTeskRIqBvngOiZbkHiMAuHVUndEjQu
 gDwu6at+MyGVhkR2VK2Hti3XB26YTUBF3fGpx9CeEGj+wMPPQI2hUk7r1kbdKPTkREHOQtY1mHR
 SqP3djiFWFnoHfRGpu6EqXoHsV0lrs2ktFHksv6js8dEYYddwWPBkBoZi67EWjDBV9rfVkaWuAv
 8=
X-Received: by 2002:a17:906:9442:: with SMTP id
 z2mr9117373ejx.79.1614605987235; 
 Mon, 01 Mar 2021 05:39:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEZDQNLvF6sbxXhtgO/OEcoKldcnlYEjewqqs/Vv3dUZpKfLvd1qkoHNf3skCeE3D/kVyCkw==
X-Received: by 2002:a17:906:9442:: with SMTP id
 z2mr9117352ejx.79.1614605987037; 
 Mon, 01 Mar 2021 05:39:47 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id cb1sm12119974ejb.69.2021.03.01.05.39.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 05:39:46 -0800 (PST)
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
To: Mark Brown <broonie@kernel.org>
References: <s5h8s7evp8p.wl-tiwai@suse.de>
 <fc28d535-87a7-fbfd-89c7-992a537606bc@perex.cz>
 <20210223172055.GI5116@sirena.org.uk>
 <fe2941de-02ce-9ed0-70ff-d7967aeecc44@redhat.com>
 <20210224125927.GB4504@sirena.org.uk>
 <e47c7fa5-cb1a-f8a3-bfe4-1f6bca6a7d80@redhat.com>
 <20210224193626.GF4504@sirena.org.uk>
 <56ea1110-c129-5f3a-264b-fb389f615dbe@redhat.com>
 <20210225145901.GB5332@sirena.org.uk>
 <c785af21-8170-62ca-6f08-0a9a1a9071bb@redhat.com>
 <20210301132352.GA4628@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <76103f3e-c416-c988-7bc2-d7657e1868bd@redhat.com>
Date: Mon, 1 Mar 2021 14:39:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301132352.GA4628@sirena.org.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <bard.liao@intel.com>
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

On 3/1/21 2:23 PM, Mark Brown wrote:
> On Thu, Feb 25, 2021 at 07:45:15PM +0100, Hans de Goede wrote:
> 
>> To me it seems like a really bad idea to add userspace API for this now,
>> when we don't actually have hardware which needs this. Introducing
>> userspace API for this now introduces a significant risk that we get the
>> API wrong, since we don't actuall have a use-case where we actually need
>> the suggested flexibility. And then if such a use-case does eventually
>> pop-up we might very well have gotten the userspace API for this wrong.
> 
>> I'm not saying that we will never need such flexibility, but we do not
>> need it *now*, so as I said before lets cross that bridge when we reach it. 
> 
> I don't want to get stuck in a cycle of "why can't my system just do
> what this other system does", or worse end up with problems due to
> competing system requirements when patches go in on more flexible
> devices because I didn't notice that the device wasn't a good fit for
> this sort of thing but people have the expectation that the kernel will
> transparently handle things.

So what do you want / how do you want this to work ?

Regards,

Hans

