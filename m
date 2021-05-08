Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AF337702C
	for <lists+alsa-devel@lfdr.de>; Sat,  8 May 2021 08:50:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31DD0168C;
	Sat,  8 May 2021 08:49:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31DD0168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620456620;
	bh=KpRbbj/koutnzHh9czSRYDENrcXiNpEK/2SGlNsU2CM=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JifLlPbD+jvtTZbpjT3aKe+a6VmZgr2aQ+hc/GmGwa6+tVLU9C8SL24HoQrCI4TUe
	 CN21j8uBM6yYy+Hzxe4LdsSirzT/H4RKixZwoBGJcVrIJ1HnbCQ52GleYA3Z57uEZh
	 KFkJHUzVyzGHTAs9NRPEC6YglM56CrUYK5l/RLPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F178F80234;
	Sat,  8 May 2021 08:48:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C03A5F8021C; Sat,  8 May 2021 08:48:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85653F800E8
 for <alsa-devel@alsa-project.org>; Sat,  8 May 2021 08:48:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85653F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uTmexEE2"
Received: by mail-ej1-x62b.google.com with SMTP id n2so16863561ejy.7
 for <alsa-devel@alsa-project.org>; Fri, 07 May 2021 23:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=hSAi/P//smwikAz8XNVD0p9ANFldJy4iHgR/LUqOmmE=;
 b=uTmexEE2BkcWYdhiWto446TZ1GGJ81OFQ9/tKhQdqZ9Kkzlt8psV/TAByepQxflxcD
 owJmALY8MjtsC96wa0jWwZ9mRPtPmsVRnQUo1iJHU/0i1xFwfO8AfzQATO/omsRawidC
 6mT/LaitaaSFSVH3ks07tzAbQJoAfZNajBmS3brvx3cwFD3tqVba3AHKpGsVwBDNdk2B
 hGSxas2XrgHvEVX+49FaiPwMtIPHTtlNh0tVsJ0LdzMNNjcP9QFrHvGuv0MBHXrzRsgm
 CwoYQ1/eg5NV3IuxGvnwZ7vfqWEt/MKG86Nbn9hvPAjoBcrtEolZvlLgtsYnS/KUFvJG
 S8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=hSAi/P//smwikAz8XNVD0p9ANFldJy4iHgR/LUqOmmE=;
 b=SPgu/aVRRYIBQf0ZOSmuyJTBrhFZp7npjOmiNFILc/OH4BOJCwT/UkATrjnxw+At2e
 YyvtSqrGW64JeLbKyW65nuuG1tRCSGWp4IkJnuOikUe9c31hoaeBAevfVG6qhUun4z4T
 MEDSAMFURxS1PK9WWvf4C/c+xD7qjhDzBngsvlHdM9G+9RCwpaAS5JwWdciw740uuqKM
 dER/pfKQL53q7gNReUZx4eogCP/E+byolqABPnI7ZFJfX8iYbFSn71QrYXHrh9luuiIJ
 O5vo69uxAGKSnMqT6lkOBOSrFnpOdCReiOl67vzVj/YgTQzuRD0X/HV0/MBL/lsRQZus
 5lqg==
X-Gm-Message-State: AOAM5307X+Bee+FelNmXehFShBQY/v5+7QkcAV17HJozDV6jm2gnLzIA
 i6ifrLsROhr4YctttWruXNZriYnPPFY+6g==
X-Google-Smtp-Source: ABdhPJyHQfClajhhqAsHkt3Zyx9bipt3K5oO79qONhIHm9VfBM0k5hw7Kr9nUGk2DgcGPQ9vE2DZig==
X-Received: by 2002:a17:906:edaf:: with SMTP id
 sa15mr14526517ejb.68.1620456519928; 
 Fri, 07 May 2021 23:48:39 -0700 (PDT)
Received: from ?IPv6:2a02:908:1984:a6c0::57c4? ([2a02:908:1984:a6c0::57c4])
 by smtp.gmail.com with ESMTPSA id s11sm5694727edt.27.2021.05.07.23.48.39
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 23:48:39 -0700 (PDT)
X-Mozilla-News-Host: news://news.gmane.io:119
To: alsa-devel@alsa-project.org
From: Julian Sikorski <belegdol@gmail.com>
Subject: ASUS UM425IA shows headphones and speakers despite having no
 headphone jack
Message-ID: <14bb6da7-1f95-448a-c5ad-d6a1d8338594@gmail.com>
Date: Sat, 8 May 2021 08:48:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
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

Hello,

on ASUS UM425IA Pipewire reports having both speakers and headphones 
available. This machine has no headphone jack, it comes with a USB-C 
dongle (which I have not tested yet). Switching between the two changes 
the volume a bit - it is louder on speakers - but other than that audio 
plays regardless of what is selected. Headphones were selected by 
default. I have saved alsa-info.sh output here:

http://alsa-project.org/db/?f=c0a5c7eb7dbe5bf6550ba61740c7f1588b8db16e

Thank you for your support in advance.

Best regards,
Julian
