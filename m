Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC4D21C1EB
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Jul 2020 05:35:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6D50165E;
	Sat, 11 Jul 2020 05:35:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6D50165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594438557;
	bh=d5Ank3CEgpRGIco3O2jFrcl5+zEmO1liq7+RYmg3j74=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fPIN3T4WvQK+If+dyJCgmmwaKABLskR+rOMen+/9oQVamaWmq+BQWjYkqVBzjjGZO
	 BTnx3hXfyrnMvyw3X+7lFu97nGoT36a6J0H424ZPWBzEyTjcv/sEOsFyWjmXyPUxCj
	 /zfSu7h5qRGtVVKLXdRtW7YGhzGlsxWv6gY1DQ0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DABFEF80255;
	Sat, 11 Jul 2020 05:34:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75492F80216; Sat, 11 Jul 2020 05:34:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FB2CF80084
 for <alsa-devel@alsa-project.org>; Sat, 11 Jul 2020 05:34:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FB2CF80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="f5K3F87j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594438447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=rkxV9wGrbaQjvlwNa9bpSRvCBx9BwmI9mcVo23t8Au0=;
 b=f5K3F87jVzfkbqieA50DNfqLjCBvyS8dPcu1dnBvTZoi/sqmEyEy0mCcnuvPz85NncFLMF
 ICdooGahlR9PspHA8CvbE7Rx2nVUsf5vswnLAeSQhZTvkcOPDA56+EJu2EHVIzv9Nv7etw
 rsoKQYPR0072kgFdlYtD37PI3Z91ol4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-keMQNT7LN7WgirSVBUnglg-1; Fri, 10 Jul 2020 23:34:05 -0400
X-MC-Unique: keMQNT7LN7WgirSVBUnglg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75AD28015F7;
 Sat, 11 Jul 2020 03:34:03 +0000 (UTC)
Received: from dhcp-128-65.nay.redhat.com (ovpn-12-95.pek2.redhat.com
 [10.72.12.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6699D5C240;
 Sat, 11 Jul 2020 03:34:00 +0000 (UTC)
Date: Sat, 11 Jul 2020 11:33:56 +0800
From: Dave Young <dyoung@redhat.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 alsa-devel@alsa-project.org, linux-omap@vger.kernel.org
Subject: omap-mcbsp 49022000.mcbsp: TX Buffer Overflow!
Message-ID: <20200711033356.GA164619@dhcp-128-65.nay.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

I'm trying to use g_audio on my Nokia N900 with mainline kernel. Seems
it does not work.  No sound when I play from a laptop, and also see a
lot of error like below:
[ 4729.557647] omap-mcbsp 49022000.mcbsp: TX Buffer Overflow!
...


Is this a know issue?

Thanks
Dave

