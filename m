Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BF31EB8E9
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jun 2020 11:53:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BB7B1655;
	Tue,  2 Jun 2020 11:52:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BB7B1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591091628;
	bh=VmpwKzLho4jynNt6PxxCluH9VpZXAsaIQOcWzmyCjw4=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B+HX0/Qouy7qHMC5cS4Wkv+fzmi5dInwS1Dy+WobZCIdujisRu+4EnT1WX+pwubCh
	 N3vfITPtClWDJsY7RBRtoUKBZs/uQEF39mmKHKsqRzhrA72aAhaC4yx0CSTNe/Fqqc
	 LsB5hyUD2TdV3iPQDmipVxoan1uF7uNH4GgAvOLY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48647F80272;
	Tue,  2 Jun 2020 11:52:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A77B3F800BC; Tue,  2 Jun 2020 11:52:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DBB1F800BC
 for <alsa-devel@alsa-project.org>; Tue,  2 Jun 2020 11:51:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DBB1F800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="hkNFQ0ha"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591091515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VmpwKzLho4jynNt6PxxCluH9VpZXAsaIQOcWzmyCjw4=;
 b=hkNFQ0hadP/JvUl/vo1jBIDhr+yG9ES1F1S7Mngdyqi5QHDQqmz4qOA6mCc1xYZeHTlnA8
 Ma3jMo23cjEbysfvrAb7Mf6/JX/g6kvpeEmVwDQVeTCzm2F9eHE88PwbwyJ6uTEegZIiNI
 q4k2ivnNlr/MePw3XB8ORQywLwZl7so=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-Utk_dd4oOuCfRHLE2WLMkw-1; Tue, 02 Jun 2020 05:51:52 -0400
X-MC-Unique: Utk_dd4oOuCfRHLE2WLMkw-1
Received: by mail-ed1-f71.google.com with SMTP id g10so6339573edt.3
 for <alsa-devel@alsa-project.org>; Tue, 02 Jun 2020 02:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=VmpwKzLho4jynNt6PxxCluH9VpZXAsaIQOcWzmyCjw4=;
 b=F0QhPI3OrrC+jUaw6tZUOZB7h8mqxHjkiwmZ/9+EFd7VhMurEheSSPqclCK4OToD4R
 tG367GgqF/aDi/zb4ceM4+RgFlo+oEIZcnxkWpMn3ZZffMtlhodadMAUIv1RJdRWoUbg
 hX1oDDa64OldYMeUbroYehYyLcnJZ+HQoa9B6tdfSwlj78xqUZk2XhShe05B+5hMNcB8
 CcJvqwUb4qUuZo9fLw6C/KRB23mEngfs/Yl4cFlsLaaRqOT3bJ9AaMI1foU05lPhQbCu
 +1BsQ+tV3C2zEyFO2kV+yKPLUgiCdPLo9NAC27uv/a9veZlp6H7RQCbLlynsQNPlFhJH
 Mk9g==
X-Gm-Message-State: AOAM532TthbJAKNIEP9NaX0sXiP3cew2CjocyW5NVPlH76C7R36yfIeJ
 7cwGpS3JFDQim6oYH87xHsV0Gjxzt+nytHY9gtopm7y3yTt8fvSlGj+Hj9x4OnSzneDE2Vo8zql
 vxr4vwEFIgE35Z5WZ4OdQ2ZE=
X-Received: by 2002:aa7:da4f:: with SMTP id w15mr17546125eds.384.1591091510918; 
 Tue, 02 Jun 2020 02:51:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHwT7wqWXyIaZvrVhuWObV3ybluXXWdHNl2Z1RWRxOO+ekfDD2mcIN/088UTIKmeDDjj5pBg==
X-Received: by 2002:aa7:da4f:: with SMTP id w15mr17546112eds.384.1591091510762; 
 Tue, 02 Jun 2020 02:51:50 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id s18sm1326757edi.45.2020.06.02.02.51.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 02:51:50 -0700 (PDT)
To: Takashi Iwai <tiwai@suse.com>, c <kai.heng.feng@canonical.com>
From: Hans de Goede <hdegoede@redhat.com>
Subject: Fixing sound on Asus UX534F / some UX533 models
Message-ID: <808c7b46-c86f-a3de-b645-c47e658e8abb@redhat.com>
Date: Tue, 2 Jun 2020 11:51:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, nuno.dias@gmail.com
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

Hi Kai-Heng Feng, Takashi,

I see that you are on the notification list for this bug:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1850439

So you may have already seen this. Some owners of affected
laptops (which have non working speakers / headphone output atm),
have done some heroic debugging work and come up with a set of
2 hda-verb commands which fix this.

I'm not all that familiar with writing hda quirks, so I was hoping
that one of you 2 can come up with a patch to fix this at the
kernel level.

This would also resolve these 2 bugs, which I believe are the
same bug really:

https://bugzilla.kernel.org/show_bug.cgi?id=206289
https://bugzilla.redhat.com/show_bug.cgi?id=1834751

Regards,

Hans

