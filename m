Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A2E372D58
	for <lists+alsa-devel@lfdr.de>; Tue,  4 May 2021 17:53:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FC80169F;
	Tue,  4 May 2021 17:52:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FC80169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620143615;
	bh=lEe4mlfFh2j+g7lDpFH6O7keM4WYJ2+thvOhZ/SHmWo=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rRltDa/F3eYiLv0DsLaANYZVg/uAA1RNHEkM6bXFYahLXiz4c95Vr7eDM1oHG8Tm1
	 u2pSsnNGF71vg65EBboZBAVWRtZkbduJicKW4rFm61efKc55oP56EWYuKet58Yrp4f
	 gGEWCwKdIUqRKpphSueJlIC9rn5+WgvtXdirv6i4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBB70F80162;
	Tue,  4 May 2021 17:52:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F215EF8021C; Tue,  4 May 2021 17:52:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58021F80162
 for <alsa-devel@alsa-project.org>; Tue,  4 May 2021 17:51:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58021F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="XsC4c9NE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620143515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NNS/hD0pWjWlNzJZGfesAUvmbZUOFYw7Y4JLlKQ+no0=;
 b=XsC4c9NEN0znJ+MC2TBGQB3rKMwe2bjHz11CEiZi8LwrfHvj2/abSxzV2WtXDRz3j/a3Ty
 5kVARbfUCwB/SOEHLucaQxp0tzmCOI9iteDD0qUhO6AgG/mjAwcKPuW0gjddEXh2HA+T5g
 LTW9wbVNYTpOyAdRlAAb4UYGgBidQok=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-Dly2R5e3N7ScVLI5lk8hUg-1; Tue, 04 May 2021 11:51:49 -0400
X-MC-Unique: Dly2R5e3N7ScVLI5lk8hUg-1
Received: by mail-ej1-f70.google.com with SMTP id
 w23-20020a1709061857b029039ea04b02fdso3308628eje.22
 for <alsa-devel@alsa-project.org>; Tue, 04 May 2021 08:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NNS/hD0pWjWlNzJZGfesAUvmbZUOFYw7Y4JLlKQ+no0=;
 b=JQLRz8EqqUY/4iy5yKxdpI3KdrvIcjjhYRyLTCh1BiYz5HFonTcOpIo7L+fZ1t0iN5
 kunoHLGBo81R+/+RVT1x0slw3vXes6Qr3OvIlE1a/IGB+8l+JGT85Ixh3Sfwy5UpiUQM
 2/q87nae6sG3dpHM0GAhKWdFA9zr/fbpOTGPJvKJcMOmPYh+eJHLhNYhKit7vrF7dliE
 XowGkvoMbLq7q2WEUSrrY4dR8owQO0/DM4FYn0WHfWC5KN8cPBAZfhGACfVh5ryxw3b7
 cQEIMtp75MqWwdjvGzq5y1KVQu8uUUfqj+B5kI3O2SLubiC6qTRxVFKtleRnJRuqFQcL
 Ohqw==
X-Gm-Message-State: AOAM531x8SfW+YQGzpnxIqsGNDMLW96RtpYG1rc3iEJJv+dlXyooEPYa
 0CGQfsXOCTse2gZxk5aA+NGPOfTJcm53Hm1SAObR7IwTYFUt61Ck8NgbIUmeQt3DKtZjfft8D1D
 Qxb1aWIH6bERakafkdBrWMWQdFT5AjIg9Nwlbbd4fi04vNZPKlfP9mRlbk/jp/dnO0m/LuRB+oo
 M=
X-Received: by 2002:a17:906:1986:: with SMTP id
 g6mr22419336ejd.533.1620143507806; 
 Tue, 04 May 2021 08:51:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyv6OQVvuMK/2wLEg8SF1FDAYZQhLEIl9pn0jCKV9s/SeQrhTFNGgKFyawPEE+Ie8kbo2IIkA==
X-Received: by 2002:a17:906:1986:: with SMTP id
 g6mr22419314ejd.533.1620143507505; 
 Tue, 04 May 2021 08:51:47 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id sb20sm1583737ejb.100.2021.05.04.08.51.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 08:51:47 -0700 (PDT)
Subject: Re: [PATCH alsa-lib 0/5] Add generic exception mechanism for
 non-standard control-names
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <20210503205231.167346-1-hdegoede@redhat.com>
 <0f7f1063-4a14-5d99-71b2-e700c74828c2@perex.cz>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <1d19e05f-6555-bc04-5ce7-36ef0dc28820@redhat.com>
Date: Tue, 4 May 2021 17:51:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <0f7f1063-4a14-5d99-71b2-e700c74828c2@perex.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 5/4/21 10:53 AM, Jaroslav Kysela wrote:
> Dne 03. 05. 21 v 22:52 Hans de Goede napsal(a):
>> Hi All,
>>
>> This series seems to have fallen through the cracks,
>> so here is a resend of it.
>>
>> Regards,
> 
> Thank you, Hans. The problem with this implementation is that it's really card
> specific. Also, ASoC codec drivers have usually ID names based on registers so
> the mapping for the user is problematic anyway (the functionality is different
> from the name or not related to the name). I'm actually evaluating another
> solution which is more flexible:
> 
> 1) add control remap plugin to allow the control ID remapping in the
> alsa-lib's control API, so we can mangle those identifiers there (already
> implemented)
> 
> 2) add local and global alsa-lib configurations per UCM card specified in the
> UCM configuration files; the configurations may be for both control and PCM
> devices (restrict or set specific parameters)

p.s.

Note that the first patch in this series also fixes a regression,
quoting from the commit message:

This also fixes the "Capture Volume" and "Capture Switch" exceptions
no longer working after commit 86b9c67774bc ("mixer: simple - Unify
simple_none: base_len() exception handling") because they were moved
to after the suffix checking, so they would be treated as
CTL_GLOBAL_VOLUME resp. CTL_GLOBAL_SWITCH based on their suffix
before the exception check has a chance to check for a match.

In the first patch of this series fixing this regression is a
side-effect of the changes made there.

Since you don't want to take this series, I'll write a new patch
fixing just the regression.

Regards,

Hans

