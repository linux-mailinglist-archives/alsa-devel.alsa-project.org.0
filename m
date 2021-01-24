Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFED301DAB
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Jan 2021 17:55:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A7BC1853;
	Sun, 24 Jan 2021 17:54:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A7BC1853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611507330;
	bh=aNK7w7YTuBqCU/2ad6yue32tepARbV7WxjzumhWyEmk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oMjvjl6jPuOK/G/n9WCjsq+HwfLYMewzwr4T6p+sc5LLm4ZU4NqUcFsbN8nTCe03W
	 Gf2S13WpjJMg0kXb0S9Wgr3IYc51peG7KBS1lzbQr6SBCWMUalmp0zQW1s3ariPDpP
	 zH0enw13Ex353JcOgqaIQPbe8YgR1GGy01LGCoEw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4D75F80148;
	Sun, 24 Jan 2021 17:53:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECC4BF801D8; Sun, 24 Jan 2021 17:53:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D6D2F80148
 for <alsa-devel@alsa-project.org>; Sun, 24 Jan 2021 17:53:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D6D2F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="hKAZ2uYI"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id BB5BBA146E;
 Sun, 24 Jan 2021 17:53:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=zVAxrdkhit9I
 bjy8t7Lnq5mScOnP9BWAqNpKmerQ0tc=; b=hKAZ2uYI256rzdDpkFJZo7mJjxhX
 ZmzR209I64z8o3hDC4mBegCGHc0ljSJ7IUgMh+VxOke+A7UndD6xP3nYrF2gcM2q
 a6/Gk+Ey1AxjfYN3/6w+rO06OHpeRVo2wfAGHLsgkaNkcgfKFijsc+EAzZI/TVVG
 nck3iaEr3ym2ploUHcorPkKTESW7D703tqGrlpfDMgyfpS4EO9+f4TENUo3LGzkY
 l+ilYGEYJoGSoo4mJbU+mARKnAIOiHvYTqsH22Q54oYIwh6F5kKJ0nLl9lTprSY3
 4EZcCEvQWrXIOCoyaBOSFhYdQ8A8IJ1Nb5oMWkmbU/KtGGLcQFIBCB0A2w==
Subject: Re: [PATCH 0/7] ALSA: add virtio sound driver
To: "Girdwood, Liam R" <liam.r.girdwood@intel.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20210120003638.3339987-1-anton.yakovlev@opensynergy.com>
 <3ac230040630c3b6695f8a091e000f5b4f90b3ce.camel@intel.com>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Message-ID: <52efab17-d6e2-c3f4-c3de-73338b811534@opensynergy.com>
Date: Sun, 24 Jan 2021 17:53:52 +0100
MIME-Version: 1.0
In-Reply-To: <3ac230040630c3b6695f8a091e000f5b4f90b3ce.camel@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SR-MAIL-02.open-synergy.com (10.26.10.22) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
Cc: "jasowang@redhat.com" <jasowang@redhat.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mst@redhat.com" <mst@redhat.com>
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

Hi, Liam!


On 20.01.2021 11:10, Girdwood, Liam R wrote:
> CAUTION: This email originated from outside of the organization.
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> Hi Anton,
> 
> On Wed, 2021-01-20 at 01:36 +0100, Anton Yakovlev wrote:
>> This series implements a driver part of the virtio sound device
>> specification v8 [1].
>>
>> The driver supports PCM playback and capture substreams, jack and
>> channel map controls. A message-based transport is used to write/read
>> PCM frames to/from a device.
>>
>> The series is based (and was actually tested) on Linus's master
>> branch [2], on top of
>>
>> commit 1e2a199f6ccd ("Merge tag 'spi-fix-v5.11-rc4' of ...")
>>
>> As a device part was used OpenSynergy proprietary implementation.
>>
>> Any comments are very welcome.
>>
> 
> This just looks like the guest front end here, do you have a follow up
> series for the host backend ?

As I mentioned in the cover message, as a device part was used our own
proprietary implementation. And there are no plans to upstream that
part.


> Thanks
> 
> Liam
> ---------------------------------------------------------------------
> Intel Corporation (UK) Limited
> Registered No. 1134945 (England)
> Registered Office: Pipers Way, Swindon SN3 1RJ
> VAT No: 860 2173 47
> 
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
> 

-- 
Anton Yakovlev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

Phone: +49 30 60 98 54 0
E-Mail: anton.yakovlev@opensynergy.com

www.opensynergy.com

Handelsregister/Commercial Registry: Amtsgericht Charlottenburg, HRB 108616B
Geschäftsführer/Managing Director: Regis Adjamah

