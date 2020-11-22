Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C27E2C2DAB
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 18:03:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F91A1706;
	Tue, 24 Nov 2020 18:03:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F91A1706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606237433;
	bh=6UpslqLW+CUPSDIytuDaZRBsNKUTPG4TuUNabguoI+U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C1I1L3UiTLSQwCbk9bNMID2Xr9Dz0ZPRgPM+8P/mQmT5t7qhYFWJumUa51GAyX+Iw
	 hDjIdsheIlY7RG2cgyXK0hVTJmuLLLl7ircSa5dO1pMWpDw1bybjRUZ9TGjj84qk57
	 eX+DNrjmSxhHrkY12Y5HdU/c9zrbLOA0/GKHYFH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6151F80510;
	Tue, 24 Nov 2020 17:58:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1120F80113; Sun, 22 Nov 2020 15:47:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF804F80113
 for <alsa-devel@alsa-project.org>; Sun, 22 Nov 2020 15:46:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF804F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="XA3Bdia/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606056416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=apju6gP6XSpkYwp4WdL57a/nFAvNI/QCKhQkuBxc3S8=;
 b=XA3Bdia/xK9rtALsHLhdMXNkl5EWPz83+inaq5KZnxbZp/pqE7ot4cuq9wfEbTWVu1jCkd
 fkI/qAlh4sU3l8dOrlq7C5hNdTdH0le7t+rDrYZ5+jjUTJP5ekv3G25710udgF6Q97joi/
 ih3DR460gM+B9YwlFm0ND3pgcFfhizQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-SRu8Ss0LM7qxn3YZwFXwEg-1; Sun, 22 Nov 2020 09:46:53 -0500
X-MC-Unique: SRu8Ss0LM7qxn3YZwFXwEg-1
Received: by mail-qt1-f198.google.com with SMTP id g17so3645874qtr.8
 for <alsa-devel@alsa-project.org>; Sun, 22 Nov 2020 06:46:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=apju6gP6XSpkYwp4WdL57a/nFAvNI/QCKhQkuBxc3S8=;
 b=NQqdi77zvxzejmbwa6BI2vUnNrtn5Ce7LPs8QVo2G6ZKY93i+1IcECezXHtwUufj6n
 AWq+yWTYszReE0WreNSfgoXsHuSzgQQoUOR1kRFRHT91/Dat5Cw0zObZFDtTbwf/WD++
 Bj0inrrNK6Rw5hBEd/+T7oqHyrJS7VZ1nB5F7103I68qyXVLxT6RS9jDCnYP1yDq88AG
 texAa5qmxwlThN17V1np4t/PNdrNIQKXGmoSseq1iJoz0zUoMEb0qUVhTm3pHlopCHY0
 XRZmlPgL5IO9yOQ0lLj2dvQIh1z0G0/IKzyhk356zbx+RFfxo/z1VuvHpHgwicEaVEQU
 WbPg==
X-Gm-Message-State: AOAM532xDHQLInMelcllRped42v2oqTw/0awua5sieswHGrlXr+myagj
 TATy+8C706BNqNPgcOVcLlXl330khtndG/O+kYuugchjzkUP4pl/eJ6sKUNAk+cC4QvHUjvXFrZ
 FBKuxeNYvSGdQtY0RW29P5Ow=
X-Received: by 2002:ad4:476b:: with SMTP id d11mr26026206qvx.57.1606056412625; 
 Sun, 22 Nov 2020 06:46:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPQ8vJIBgyJxmgPlUVzOaStXFRaD0Z+d8VDmnR7kdLyNkvwByAGPov006wc7+pJBCcgj+/zw==
X-Received: by 2002:ad4:476b:: with SMTP id d11mr26026152qvx.57.1606056412222; 
 Sun, 22 Nov 2020 06:46:52 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id x72sm6888242qkb.90.2020.11.22.06.46.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Nov 2020 06:46:51 -0800 (PST)
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
To: Matthew Wilcox <willy@infradead.org>
References: <20201121165058.1644182-1-trix@redhat.com>
 <20201122032304.GE4327@casper.infradead.org>
From: Tom Rix <trix@redhat.com>
Message-ID: <ddb08a27-3ca1-fb2e-d51f-4b471f1a56a3@redhat.com>
Date: Sun, 22 Nov 2020 06:46:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201122032304.GE4327@casper.infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Tue, 24 Nov 2020 17:58:06 +0100
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-scsi@vger.kernel.org, clang-built-linux@googlegroups.com,
 amd-gfx@lists.freedesktop.org, cluster-devel@redhat.com,
 linux-acpi@vger.kernel.org, tboot-devel@lists.sourceforge.net,
 coreteam@netfilter.org, xen-devel@lists.xenproject.org,
 MPT-FusionLinux.pdl@broadcom.com, linux-media@vger.kernel.org,
 alsa-devel@alsa-project.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-omap@vger.kernel.org, devel@acpica.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-crypto@vger.kernel.org, patches@opensource.cirrus.com, joe@perches.com,
 bpf@vger.kernel.org
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


On 11/21/20 7:23 PM, Matthew Wilcox wrote:
> On Sat, Nov 21, 2020 at 08:50:58AM -0800, trix@redhat.com wrote:
>> The fixer review is
>> https://reviews.llvm.org/D91789
>>
>> A run over allyesconfig for x86_64 finds 62 issues, 5 are false positives.
>> The false positives are caused by macros passed to other macros and by
>> some macro expansions that did not have an extra semicolon.
>>
>> This cleans up about 1,000 of the current 10,000 -Wextra-semi-stmt
>> warnings in linux-next.
> Are any of them not false-positives?  It's all very well to enable
> stricter warnings, but if they don't fix any bugs, they're just churn.
>
While enabling additional warnings may be a side effect of this effort

the primary goal is to set up a cleaning robot. After that a refactoring robot.

Tom

