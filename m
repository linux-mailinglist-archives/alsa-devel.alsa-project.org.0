Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1313B213872
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 12:12:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6AB316D5;
	Fri,  3 Jul 2020 12:11:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6AB316D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593771119;
	bh=FQei4XLZBvpVs0N0ERkF0cS7PyjuOBdksim1di/lJBg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e+e1Hl3s7mV7DImMlAmT48PmT9oT5hSL2VRWLGmMiLZ8o79yIk8pUT29lRihs6pic
	 mS3krD2QCOqgEITl1+fTuy5bNHreuEN55pxFVR1jJs3NvBMTtbmmeCqKdXFpDJWa/k
	 aLoWDTi3zkFpkBpjNrgTfdeys1k26GTwfLn0Bx9Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 923BCF8025F;
	Fri,  3 Jul 2020 12:10:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1299F8021D; Fri,  3 Jul 2020 12:10:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C777FF8020C
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 12:10:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C777FF8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="GEONvX+G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593771044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YsUdmKIAIuE6rKh8K8ZFKX4lZ/UeIMT2j3jmwMOwD+A=;
 b=GEONvX+GhvPV2rNm8w5DeVIoAIu9b6rwt7burYJX/nlPrfFk3hu/iqPL6rnHkERqqbp+bR
 JlipjTrQod8fAM6uqgeJDj+5EbZ4z6ZjtnNT3pJTEasZOUnuHlMi9LK4SjXCYe+oeLBAyp
 xSVOVp2MyM8esYWDSSBQkQpEXmaZYmY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-nqeibAStNQKUzND6llP7Rw-1; Fri, 03 Jul 2020 06:10:42 -0400
X-MC-Unique: nqeibAStNQKUzND6llP7Rw-1
Received: by mail-wr1-f72.google.com with SMTP id o12so31063437wrj.23
 for <alsa-devel@alsa-project.org>; Fri, 03 Jul 2020 03:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YsUdmKIAIuE6rKh8K8ZFKX4lZ/UeIMT2j3jmwMOwD+A=;
 b=JetA4ZPxeVqakD+wuvFjq1naomr+aexRuq0/qOARYJvmheh7QM8LRer+cHHjSAR1V2
 8qElYBVlPzrmrkWMgK/GGFzueZbZrSXA88EYgZU8c6RVJHWG3AudhFRt0ZJb9pjZJj/T
 XWfCgWXhTNZqL1hAcR72xZ9IzZPQtRU3EzdM+kbDNIq+/igJgNtvHjU1K/WVGdhOd5AS
 3T7xgRDDCNUloLhODPiUlOU4Ng6ZbOT39ZLdgyYtCUsbAcJsyD0X6RSCMMfbHBa3jgYe
 6FzjquLxqxjk0YMqFsS+Tu1TOGvFyxDm4yrwmEVf0Fd0tqoWxlZXq89GnLOsqce+IpFn
 Vj9A==
X-Gm-Message-State: AOAM531O4hgHZe4pn20dMwVZuRbxxWpEuma1/1eTFTzJQA7XYUZ1kNwk
 JseYjLcdnjfQ5m5+Xryad9VWtPxv4GOW+xGpdGMTiPQaz1ebsbPAZ5KFvuMFhqtBlWjiFHeVMfn
 D+JA6gHzFlznTTwn0BdtJ7q4=
X-Received: by 2002:a7b:c099:: with SMTP id r25mr38073911wmh.159.1593771041495; 
 Fri, 03 Jul 2020 03:10:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9am+xgHpk4a/bShyxLMWnkRM6baB16ndLKlb82LUpjz7e/d4V9R8szIIsa72WquW0eNVJ6g==
X-Received: by 2002:a7b:c099:: with SMTP id r25mr38073897wmh.159.1593771041336; 
 Fri, 03 Jul 2020 03:10:41 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id x7sm13753747wrr.72.2020.07.03.03.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2020 03:10:40 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] ASoC: rt5670: 2 small cleanups
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20200703100823.258033-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <52ae5ebc-feb8-181c-c980-23e98d6025eb@redhat.com>
Date: Fri, 3 Jul 2020 12:10:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200703100823.258033-1-hdegoede@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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

On 7/3/20 12:08 PM, Hans de Goede wrote:
> Hi All,
> 
> Here is in essence a resend of my 2 cleanup patches for the rt5670 ASoC
> codec code, rebased on top of broonie/sound/for-5.9 with
> broonie/sound/for-5.8 merged in.
> 
> Regards,
> 
> Hans

I just realized I forgot to add the Reviewed-by from Pierre-Louis
from v1, since these are unchanged (only rebased) that still stands,
so this series is:

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Regards,

Hans

