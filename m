Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB45B3DBF59
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jul 2021 22:05:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 277C520F0;
	Fri, 30 Jul 2021 22:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 277C520F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627675541;
	bh=6kkLN9CqIZFSfOmKhXUhmWji7HEQHS5rOzv+2zAhado=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LbxQQrNKb6hKD2bQxq7eF6RCTKI6y5/y9bWvKOGOUZ6xOSW8t3BLqc3iSfJbImLa/
	 DEgTAKbGNmA/pfH2XrxdKrX2IY5NzE7d3BKqsKnd+maD/U0NqNgrjn1lYXmDcrCgTy
	 5x4CLNJOx2zwD8Xlo6TWz7/2PRdJlksadYVBbw1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79012F8025A;
	Fri, 30 Jul 2021 22:04:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B4F8F80253; Fri, 30 Jul 2021 22:04:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63A09F800ED
 for <alsa-devel@alsa-project.org>; Fri, 30 Jul 2021 22:04:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63A09F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="cU8cxOC4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627675444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6kkLN9CqIZFSfOmKhXUhmWji7HEQHS5rOzv+2zAhado=;
 b=cU8cxOC4BfrwMhWHwfyw72Dv3ATISp3UtXu1F/WLYOHitlr8TCN6KNdTo9jqdEsfGwp6M1
 XS9KGYxgXFXwXQr9ARB3HkMcHESxUeyhGtDF8h9ricYKCksMs5HiNd39jezSWrSxsb88kU
 u6mmcH7X13Ew3ccR+zwmtPF0h5TfbOg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-gxCSBR74Mp618qpIfocL9w-1; Fri, 30 Jul 2021 16:04:03 -0400
X-MC-Unique: gxCSBR74Mp618qpIfocL9w-1
Received: by mail-ej1-f69.google.com with SMTP id
 kq12-20020a170906abccb0290591922761bdso2236858ejb.7
 for <alsa-devel@alsa-project.org>; Fri, 30 Jul 2021 13:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=6kkLN9CqIZFSfOmKhXUhmWji7HEQHS5rOzv+2zAhado=;
 b=QVwH+XauQo/xbQMhTrx54Phi/rspCoper/6HcSXdQBqxA3I3J9ci6F7+8ueU4Tu5a4
 +YFQezakDigh1J7394Qhx9kxktPKInTIKVXnhSB8jfonmM+FKkKZI8toT6WvsHyg4CJz
 4ejrabLdKDGEYilPJvUFBCOosHJdLwDK+Vfty4FJ1prtH7Qyu3f0p+fd4/TouzTlQAHv
 penmbaRXy5AJqUHNDz4uOejoGG9ERGTpSZ0izw6Kzy5KKzImgZ9cb65koarW9NRkG5vj
 bWh0i6utv9dCZfxQFqy0R3pGsYxq4m3G3AJk6zU4UOaKodLLbBir4yVdS5fru63sSWEu
 0Xig==
X-Gm-Message-State: AOAM531U/VFlz9zVo322F3hZDhWLeok0KaE25HQsapkBZBUsD3lK7TGY
 xSJ3fH4wO+oXZCPMUMiuVTGniiVUephlFWA3H76hUux5FkZkHLvueZzoGr+/g1ws4+m9LOpV/B6
 iCLNJ/5RnM0oSxkArr+hLY1lxuiiHFWqi+ZU9KzJnBHhpR49ou6uuBHtLUfm513gin3t24vX3kD
 U=
X-Received: by 2002:a17:906:1f8b:: with SMTP id
 t11mr4403852ejr.131.1627675441935; 
 Fri, 30 Jul 2021 13:04:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeOER6ZdncWQEDbjTFWuoCKHFTfof3HbWXdyXIZiiHPKt4LaPypbzs6YZPZXvAw18dulObRQ==
X-Received: by 2002:a17:906:1f8b:: with SMTP id
 t11mr4403827ejr.131.1627675441715; 
 Fri, 30 Jul 2021 13:04:01 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
 by smtp.gmail.com with ESMTPSA id v13sm905059ejh.62.2021.07.30.13.04.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 13:04:01 -0700 (PDT)
To: Takashi Iwai <tiwai@suse.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
From: Hans de Goede <hdegoede@redhat.com>
Subject: [5.14 regression] "ALSA: core: Add continuous and vmalloc mmap ops"
 breaks Intel SST audio
Message-ID: <8d6674da-7d7b-803e-acc9-7de6cb1223fa@redhat.com>
Date: Fri, 30 Jul 2021 22:04:00 +0200
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

Hi All;,

As discussed in the "5.14 regression, Intel SST (BYT) audio no longer works" thread,
audio on X86 devices using the Intel SST driver no longer works with 5.14.

After poking at this for a while I've found the culprit:
30b7ba6972d5 ("ALSA: core: Add continuous and vmalloc mmap ops")

If I revert that single commit then everything works fine again with 5.14.

This is with a Fedora 34 userspace using pipewire as audiodaemon

Regards,

Hans

