Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A80B721F8BE
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 20:05:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36C47166E;
	Tue, 14 Jul 2020 20:04:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36C47166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594749933;
	bh=IjCHqOr2evNezqa6HBSVm+1hqq1LJxpLJpvSc6zQj7w=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BjwwPSyIC2FMeOIaAI3RXdcSi5O4+Xv/yvT3yNVyEvzHqmSa9/tq7/AoqksAX9O1x
	 hWQnSbZ3za2N4YU/DCYDNjm91BLN9na8c8IlUjYPeIrAEjW5WIvlkyQscL/tz8GMfW
	 eWVXUjq7HBPdLaw12V9rbHQnBcLBuoBu77Y7jrEo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48C4FF8016F;
	Tue, 14 Jul 2020 20:03:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71553F8019B; Tue, 14 Jul 2020 20:03:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 PRX_APP_ATTACH,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bitmer.com (50-87-157-213.static.tentacle.fi [213.157.87.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 698A7F800E5
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 20:03:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 698A7F800E5
Received: from 88-114-184-4.elisa-laajakaista.fi ([88.114.184.4]
 helo=[192.168.1.42])
 by bitmer.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <jarkko.nikula@bitmer.com>)
 id 1jvPHE-00032d-U7; Tue, 14 Jul 2020 21:03:36 +0300
Subject: Re: omap-mcbsp 49022000.mcbsp: TX Buffer Overflow!
To: Dave Young <dyoung@redhat.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 alsa-devel@alsa-project.org, linux-omap@vger.kernel.org
References: <20200711033356.GA164619@dhcp-128-65.nay.redhat.com>
From: Jarkko Nikula <jarkko.nikula@bitmer.com>
Message-ID: <e4fc5a03-0343-d9c7-757f-b9652f0cd0ed@bitmer.com>
Date: Tue, 14 Jul 2020 21:03:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200711033356.GA164619@dhcp-128-65.nay.redhat.com>
Content-Type: multipart/mixed; boundary="------------4DBB47A0D994866EAB499D59"
Content-Language: en-US
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

This is a multi-part message in MIME format.
--------------4DBB47A0D994866EAB499D59
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi

On 7/11/20 6:33 AM, Dave Young wrote:
> Hi,
> 
> I'm trying to use g_audio on my Nokia N900 with mainline kernel. Seems
> it does not work.  No sound when I play from a laptop, and also see a
> lot of error like below:
> [ 4729.557647] omap-mcbsp 49022000.mcbsp: TX Buffer Overflow!
> ...
> 
Head 0dc589da873b ("Merge tag 'iommu-fixes-v5.8-rc5' of
git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu") records and
plays fine here (arecord -f dat |aplay), although I see some of those
errors but don't hear any glitches etc.

Peter, does above indicate a serious issue or is it perhaps a false
alarm on OMAP3 (no audible glitches)?

I believe you don't have some mixer knob on, N900 audio path is somewhat
complex and needs bunch of mixer switches and volumes to be set. I
attached my N900 mixer scripts for you to try.

Set first everything off:
./aic34_scripts/shutdown.sh

Then enable internal digital microphone and speakers:
./aic34_scripts/dmic.sh
./aic34_scripts/speakers.sh

Hopefully these help you get going :-)

-- 
Jarkko

--------------4DBB47A0D994866EAB499D59
Content-Type: application/octet-stream;
 name="aic34_scripts.tar.bz2"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="aic34_scripts.tar.bz2"

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
MA==
--------------4DBB47A0D994866EAB499D59--
