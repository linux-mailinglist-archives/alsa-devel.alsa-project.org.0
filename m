Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D9B1A6841
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Apr 2020 16:41:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A050B16A0;
	Mon, 13 Apr 2020 16:40:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A050B16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586788861;
	bh=iXPkCtkDelb0lK/v7fxEba2tpBtn+QXwjozh9sZcr1A=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cC/pG7TbPdL86w9efXdiosdoTj9RiO+Zt0Fet8S8H61b072zV2KFLHJAhtT6Eo8Ye
	 kh1R27iYqeY9MekJ/dfb1s/dnJQ9sWR4M4shFrb0sEN3tmSQMX5hdcovxcFs3OilAL
	 JIXM3DWNrxf61sVdR019DwQrc4fhRyCnj3XFgHRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2799F80229;
	Mon, 13 Apr 2020 16:39:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4053BF80245; Mon, 13 Apr 2020 16:39:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F179BF8010E
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 16:39:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F179BF8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="QrppUifG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586788752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iXPkCtkDelb0lK/v7fxEba2tpBtn+QXwjozh9sZcr1A=;
 b=QrppUifGRqfOQgxtAKYnS+0CALn3RXDmAILL8WCHQoFyTEJZq9TJp6ymuXkYtrrDeD3WeY
 cSb/TwnuLXjhUch4hLbvo0LT8jAY11CqLf89sk1DuK3wOUZBqForFp0HoUm2ckNnCpcYdP
 qCiL7LvjKbbMA+Foa/1SMjKLmMK6rZQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-gsPZg8ojPZCtk-MoeWAtnA-1; Mon, 13 Apr 2020 10:39:08 -0400
X-MC-Unique: gsPZg8ojPZCtk-MoeWAtnA-1
Received: by mail-wr1-f71.google.com with SMTP id w12so6762680wrl.23
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 07:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iXPkCtkDelb0lK/v7fxEba2tpBtn+QXwjozh9sZcr1A=;
 b=UgsZ4cmnmvMREoMnOXez4SedzC8WYfn5yIFun87N55Hk09YK2aC0jEYOJT7M34RlWW
 ohLaD5Xp5eH44pdv+G4e7PhleDwFQCvjWN3ISgJgCK5NSU6uiyEiZWtHbny/3xwn3rKI
 eHiLYLPLyaAvPilLdeTEgwsW6Gm3ik0trWTenRP5UYq0VSlVyejjQyEroH7puGu1U7/A
 Prv2gf4JS6dqW8IjIEta9AGj9kbBgZzlNlbBj4fZE+LOpzaKhu23dmu5RXY+5wmMxx8e
 xVXb3nA6BAtAdzX0r/ZS93ZKWcIIo+a0+bfDpZTd4CyMt6JBVFHXkSDLk0SZNYLW/sPo
 j0Vg==
X-Gm-Message-State: AGi0PubljGZf9wO9qo/+xmvX9ZmL2CQsbCWZ3EsgMWsIrDytwrrnYI8w
 cGjrgE7onVeITs0DoWJ/KbUxhXv6VqFlY/0lGSuS+ZkvB1DSZCGoiNFtRqfAWrKb95w5oZz38NO
 6hL03v4fxsAt9lv2nAl1IhQA=
X-Received: by 2002:a5d:51c7:: with SMTP id n7mr18656908wrv.11.1586788747028; 
 Mon, 13 Apr 2020 07:39:07 -0700 (PDT)
X-Google-Smtp-Source: APiQypJlW4A4Doshd0jx71XKXsOnQokQN9NYk+gFyFwWHMIUgfsEE7taxrETXS1mN1zDvUU4bkNQrg==
X-Received: by 2002:a5d:51c7:: with SMTP id n7mr18656891wrv.11.1586788746864; 
 Mon, 13 Apr 2020 07:39:06 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id 132sm15344612wmc.47.2020.04.13.07.39.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2020 07:39:06 -0700 (PDT)
From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [4/5] chtrt5645: Remove bogus JackHWMute settings
To: youling257 <youling257@gmail.com>
References: <20200405183454.34515-4-hdegoede@redhat.com>
 <20200413131949.12341-1-youling257@gmail.com>
Message-ID: <a0c7ef47-83f3-c82a-17ed-f015c516d370@redhat.com>
Date: Mon, 13 Apr 2020 16:39:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200413131949.12341-1-youling257@gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

On 4/13/20 3:19 PM, youling257 wrote:
> please also remove es8316 HeadPhones.conf JackHWMute "Speaker"

Erm, no that is not right. The ES8316 actually needs this.

The es8316 actually only has 1 amplified output (and no un-amplified
outputs IIRC). In the reference designs (appnote) for the es8316
the output is actually switched in hardware based on jack-detect.

In practice this is implemented by connecting the L/R speaker
output signals *directly* to the jack and through a analog switch
which is controlled through a GPIO to the speakers.

So when headphones are plugged in we can (and must) disable the
analog-switch so that the speakers are disconnected from the outputs
and the outputs only drive the headphones.

If we remove the JackHWMute "Speaker" and then switch the sound
to the speakers, the sound will be send to both the speakers
and the headphones at the same time; there is no way to turn off
the headphones.

So we need the JackHWMute "Speaker" here.

Regards,

Hans

