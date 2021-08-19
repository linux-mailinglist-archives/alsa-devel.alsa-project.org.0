Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC773F1BD3
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Aug 2021 16:44:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3D741679;
	Thu, 19 Aug 2021 16:43:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3D741679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629384256;
	bh=Vo7RelhV95BXaWo7G6nv7Skdj74L+kaRbMSxEmLlpLU=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FOq0TIRcHX5llFUb+x7WdGRYaYjtuKXeGCoNv/jUBU0rafuR8WJfJIp8OdC4rpTXi
	 fycCCm52rObzeYVmOT8l4qodzWVt66IYrjfb+ck4dBEhXdHvISgJfdpJW7DINuSIz6
	 EYWaVPasg0wmsJRJ4Gh/yiMZFYgI/hbgUiPAXOwM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3128FF800CC;
	Thu, 19 Aug 2021 16:42:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9743F8026D; Thu, 19 Aug 2021 16:42:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BF1BF800F8
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 16:42:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BF1BF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="AltYAgbk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629384172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aWopXUHmBP+r9RqENQPH67hv6QDIHGFg4wNqpmaU0ns=;
 b=AltYAgbk0PkR6yaKQoDJ1/iVfDMTSmp3st2NTKVrMNgd4XVy+w3j1Efj8RmI3HyahEXZNO
 8YSmo+k5dPoXaJS1niz0bMvhiEdjTBfMz3gZpn1uX6FdXzwhMYdEoTa1yuSrqDHBo6LHyF
 PYwhVyIM+YBU5HCCjGnjAckgNX/4x3g=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-YhiAfeDpPoSSbGAvnsw5aw-1; Thu, 19 Aug 2021 10:42:51 -0400
X-MC-Unique: YhiAfeDpPoSSbGAvnsw5aw-1
Received: by mail-ed1-f69.google.com with SMTP id
 x4-20020a50d9c4000000b003bed5199871so2920540edj.14
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 07:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=aWopXUHmBP+r9RqENQPH67hv6QDIHGFg4wNqpmaU0ns=;
 b=Ml/MlR4LABg9wXp5utB0yAPFKWakOIcZCJDYpFTLP/l6NtGX0LREdlkM0Z9YBNztc3
 aPhvYmSgvc0heAPnukJN2ody9yopheUXKS0IrKr3BYVLujQ2PBIkmqPi5PPb8ClyFXlM
 O3I6zU8ikuPRVNzGQclGQotFRa9JJ4FrBhFxAXOKNUx+cUBUTNxeGblCEAGI3/0Y+cpT
 J1RGbP4dAK+61Ek7Unyud928SoYczy1pR3RWfNlblN/zJzAlorZkjsNNYxJk9ZCV3ZEP
 7Yl2OarVxBuAGohr1c15cHFPyuYgbziMO5yBV4DM36y75GcN3rayzSYtZLkGJ5AZ8QGr
 tXeA==
X-Gm-Message-State: AOAM532E5f7+1ax8T0oy2Vjv2T7Csl3ah1vfFmzFetCgyf2G0EX0EPwJ
 pl5vJfVfeJ/ruXWYOEtu6Bt0hCFo/S1aO7KveBk3VE3du5sxVmvEFiKPSauhF+unBuiw0uOgSuq
 ANNtcvOo/J7PfAIe5Pc5HSO16rHOrol5NSxp6+CHPP4f5tpS8am3DT2eGhFrG30VTpJEynAi1dt
 4=
X-Received: by 2002:aa7:c2d4:: with SMTP id m20mr16755883edp.368.1629384170271; 
 Thu, 19 Aug 2021 07:42:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7zxJfgvvZplaN6nEpT1UGeDllnPaDijkrKDIP9Ps5gspLLmWuL13X1FcKvGSVizTEWQ9Kqw==
X-Received: by 2002:aa7:c2d4:: with SMTP id m20mr16755863edp.368.1629384170087; 
 Thu, 19 Aug 2021 07:42:50 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id m15sm1882224eds.92.2021.08.19.07.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 07:42:49 -0700 (PDT)
From: Hans de Goede <hdegoede@redhat.com>
Subject: [5.14 regression] "ASoC: intel: atom: Fix reference to PCM buffer
 address" breaks Intel SST audio
To: Takashi Iwai <tiwai@suse.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Message-ID: <2048c6aa-2187-46bd-6772-36a4fb3c5aeb@redhat.com>
Date: Thu, 19 Aug 2021 16:42:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

Hi All,

After rebasing a set of bytcr_rt5640 patches, on top of asoc/for-next
I noticed that playing back audio would only generate random-noise / buzzing
(I did not try recording any audio). 

After poking at this for a while I've found the culprit:

2e6b836312a4 ("ASoC: intel: atom: Fix reference to PCM buffer address")

If I revert that single commit then audio on Intel Bay Trail and
Cherry Trail devices works fine again with 5.14.

This is with a Fedora 34 userspace using pipewire as audiodaemon

I'm not sure what is going on here, but since the old code
changed by the broken commit has worked fine for ages and
given where we are in the devel-cycle I think it might be best
to just revert 2e6b836312a4 again.

Regards,

Hans

