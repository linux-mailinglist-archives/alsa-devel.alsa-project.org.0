Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE791F3D13
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 15:49:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BB161674;
	Tue,  9 Jun 2020 15:48:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BB161674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591710553;
	bh=QbpbKVO66vtPLpuAQIR6kPS6UqyKCD2Qez+Hxp8hFZo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ic58RCoPZUtltJzjWzfESnUSQDHa2nLy7XRuBsAgarcWW9L7B9136KWiVbvxzWoIE
	 d3z3G66fVexIEQ8voVdLUKwtqjNu2i7/s3OHo74t4KunjarmrXEpqLFdKeeaY/0Emz
	 WCG5S14IS2mj6XXOx6+iE70lrtqYZaTRUeOFZX00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57F26F80124;
	Tue,  9 Jun 2020 15:47:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34196F8028C; Tue,  9 Jun 2020 15:47:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4B5BF80124
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 15:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4B5BF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="N6OIMzAb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591710443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0MxULPyXA+9cxd+KUNoEfmupmRQPoXyQMZI6LhdMJNs=;
 b=N6OIMzAbyb9/ncSvs6y8NZCUF1rQeyyZt0/WL4CD/BdBENKyAkAKEAxdWvphZDXhv5Y5SU
 MqRC/KBqH4y98Kdwa+kYN13qJKkwDzvSb/4RUnswN09Oc+mrKuUkrEM7CWOHjoP7LdnHZZ
 ZL+V0VdhSTVwCbq3dS45uW9njrB+2Zo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-oLrSGv36OFe0tm_77zZNwA-1; Tue, 09 Jun 2020 09:47:21 -0400
X-MC-Unique: oLrSGv36OFe0tm_77zZNwA-1
Received: by mail-ed1-f70.google.com with SMTP id o3so645639eda.23
 for <alsa-devel@alsa-project.org>; Tue, 09 Jun 2020 06:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0MxULPyXA+9cxd+KUNoEfmupmRQPoXyQMZI6LhdMJNs=;
 b=aBQonu3NEpm9z0k06h3NxEWX1akXarxv0OlNVoH2ZNxW8HXVHZrxEbU52YwpFjjW66
 fbLy0L++d4SrR/wVZvyntEHOmzKp9JXl8TgBZdtIEoRFYAlydNpLI+oyJ2JSWaRbnsXn
 UNeP38uQ/cmqcKT0gCrhLeeBd+5HQlyL8S6YRUCaRtBv/8C/GMYFqgaFv13/4Fq9+Cem
 aKOWUzRtEMi0LKa1zDg60KCjo0z5XQ/qFH3zPNDaeiB6fHMQSG1ukZQrgxqMzU0kl1CJ
 o+ePG3kpZoYEIVpas3EAIH9ja8jDfFB8V/uQHu5rkenkPgYkt+AU4PVE7o6BE4DYnKRB
 57VA==
X-Gm-Message-State: AOAM531y+jcG1RohIkvRXTZilExU/Jk/e+jhv9m2gcs6A4b/vMzbRQcG
 xCZMXKOCEOGZ0R6bXoJCwGTcS6FrUJsnMPMayJl95WHH0tV4uFS3iedEIOmsgccch1etaYB2Uas
 h6LXKNJ0n2C6+LBb7wkPg5Mw=
X-Received: by 2002:a17:906:4a03:: with SMTP id
 w3mr25250172eju.154.1591710439868; 
 Tue, 09 Jun 2020 06:47:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3xzF1IdMiGITLC8s/ZADIcteoZeELJBhwGde5eI0B66aZOkwzJk8wTC548TWEwbjkK/0xbQ==
X-Received: by 2002:a17:906:4a03:: with SMTP id
 w3mr25250154eju.154.1591710439651; 
 Tue, 09 Jun 2020 06:47:19 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id mh14sm13086965ejb.116.2020.06.09.06.47.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 06:47:18 -0700 (PDT)
Subject: Re: [PATCH 2/2] ASoC: rt5645: Add platform-data for Asus T101HA
To: Mark Brown <broonie@kernel.org>
References: <20200608204634.93407-1-hdegoede@redhat.com>
 <20200608204634.93407-2-hdegoede@redhat.com>
 <20200609133829.GH4583@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <dde85f72-7846-f767-9b30-017b53f81c73@redhat.com>
Date: Tue, 9 Jun 2020 15:47:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609133829.GH4583@sirena.org.uk>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
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

On 6/9/20 3:38 PM, Mark Brown wrote:
> On Mon, Jun 08, 2020 at 10:46:34PM +0200, Hans de Goede wrote:
>> The Asus T101HA uses the default jack-detect mode 3, but instead of
>> using an analog microphone it is using a DMIC on dmic-data-pin 1,
>> like the Asus T100HA. Note unlike the T100HA its jack-detect is not
>> inverted.
> 
> Hans, it'd help if you could send cover letters for multi-patch serieses
> - it makes it easier to pick up tags that people send for the whole
> series.

Ok, I will try to remember to add a cover letter for my next
"assorted ASoC X86 quirks" series.

Regards,

Hans

