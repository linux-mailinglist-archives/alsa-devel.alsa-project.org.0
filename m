Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8B93CC66A
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Jul 2021 23:01:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9916E1679;
	Sat, 17 Jul 2021 23:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9916E1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626555668;
	bh=IYhVlpmc05EbLd0ZA1kqaZIyn6ruEZDqghXIkPA5+u8=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b1ge3RLOt9xBfVoSl6PRDDQNaxJu672i8h1vOBbuSpyuoOIF+q3IT8eny2hbpJxGx
	 MzymBW8+fEXWMBgTRqgSYXt244rKMz11L31EolUV+qO740NnAEk98B29WZNavaENIL
	 q5O8G8Q2xxAMt/r5+M8gguy1uhcOiM7JRJcww+xc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2DFFF80229;
	Sat, 17 Jul 2021 22:59:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1CABF80217; Sat, 17 Jul 2021 22:59:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D53C5F800C5
 for <alsa-devel@alsa-project.org>; Sat, 17 Jul 2021 22:59:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D53C5F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="SM+KGndo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626555570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IYhVlpmc05EbLd0ZA1kqaZIyn6ruEZDqghXIkPA5+u8=;
 b=SM+KGndoeemizA9n2AT0T9DvE4frVxq+xBK+lDVmaD1DZHZEAUzRZ1yiuiwW93t2zYI54T
 QrpF19dDfiqMRWFjR19AnbyzeK/hnzSWkPXnZYhbmvqh64e6antU2eUm2V5o8/FT2qfzBA
 DfRxrl4A6+rWfbhCuhEGrazjkVWoZWw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-LxoUtBLaNMe0DFdTwcqrXQ-1; Sat, 17 Jul 2021 16:59:28 -0400
X-MC-Unique: LxoUtBLaNMe0DFdTwcqrXQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 n6-20020a05640205c6b02903a65bbc4aebso6756567edx.10
 for <alsa-devel@alsa-project.org>; Sat, 17 Jul 2021 13:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=IYhVlpmc05EbLd0ZA1kqaZIyn6ruEZDqghXIkPA5+u8=;
 b=PlEaDBypRGOnAP0fJ08HJDtiIsSaK0GSh3DsXWOqTS/Krs2nNDXvFqehFHx2rkjz7g
 xdGfZn9RJ+owOEx679b9ixPsMkruwf0pzEHL6+4Daq/xtaXSG3ov6lPMGWTTm01b3tX3
 X3PGc0vNVDqlEvxhTmHtMSb+D73razJYpYAsu4yJ7O3dO5BnypjuoCr/OSqkcf8NPMiZ
 4YL2bzVpWAdOiLHzUGqkf+UEa1a13dDiuQrqGwXLL54t7bLOj3iPPBMoVYJqw/0LqRRB
 hLGLABXk7oE91JbEyn2Bsr2gLd4kmJs1yt9X2T2kWaZfI5peDPp79EpX9fQYM627CMV6
 plng==
X-Gm-Message-State: AOAM530TyOkDT07eiM1UNbwbZUTkdqc/a1TUC0nXm8sQksBMV7tgbyJo
 Rtev8jYmUfgMcaR498fe7s7fjkFvi7ll13p+MOcW6q9hRc8fGP0NRHzIOEmHMi587Oi+U/biVDC
 TyklvGqtSCykL2AM3ZkJBbrOuAOWtJQDXxcg3A6bxZI7UUOcLRzKR7FQahD3SYd/vdZaEbLyjy4
 g=
X-Received: by 2002:a17:906:70c9:: with SMTP id
 g9mr19386053ejk.286.1626555567494; 
 Sat, 17 Jul 2021 13:59:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzP4vskh5IBqK09D9H6jJPVMJsNJNG3ijBHl2N28ygS+nPvTolfpDg7Zp88YIHS2+BJ4TDnFQ==
X-Received: by 2002:a17:906:70c9:: with SMTP id
 g9mr19386039ejk.286.1626555567261; 
 Sat, 17 Jul 2021 13:59:27 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id ot18sm4185319ejb.109.2021.07.17.13.59.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jul 2021 13:59:26 -0700 (PDT)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: Hans de Goede <hdegoede@redhat.com>
Subject: 5.14 regression, Intel SST (BYT) audio no longer works
Message-ID: <6ebbcf0f-3a4b-0b28-1f17-8e1108f040c0@redhat.com>
Date: Sat, 17 Jul 2021 22:59:25 +0200
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

I just noticed and I won't have time to dig any deeper for approx. the
coming 10 days. Still I wanted to report this in case anyone has any
ideas. Or maybe you can reproduce and look for a fix ?

After building + installing 5.14-rc1 on a HP Elitepad 1000 G2
(Bay Trail) with a RT5642 codec, I noticed that sound over the
speakers and over the docks line-out jack no longer works.

Downgrading to 5.13 (without any other changes) fixes this, so this
seems to be a regression with 5.14.

I've no been able to make time to test this on other BYT/CHT hardware,
but I suspect that other models will be affected too.

Regards,

Hans

