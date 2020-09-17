Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75966271DE2
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 10:26:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11D1C17E3;
	Mon, 21 Sep 2020 10:25:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11D1C17E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600676762;
	bh=7S5p0xl33uND6/+H4HJHBIJCu+skobVYUmJwIAI89hs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l0JzA1rP40kR5uWwVdgCWun0fHTrG6JdzbyhrBkXyaBPcuU/AVjbeHmW/r0euB0Lr
	 Jb23J9aS2YE14mziDRKxtyIqH/4YgQI0+3TdtLISYGEQ9Gpuse5Ur4e5yaL5PriWvq
	 DRbwbKoIKtu3Ri7BxASsdqMyRuNkINTaaKaX/ppA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC793F803A6;
	Mon, 21 Sep 2020 10:11:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3913EF80212; Thu, 17 Sep 2020 21:40:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B2D7F8013A
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 21:40:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B2D7F8013A
IronPort-SDR: //VlIYBhxW6CVfY15iTpfNMj9Vgr/T1CG3oXdTmHbHXEX97zV6PtgHLYiAV6WZSv10v3F/V4yp
 yYLo+aZYXuaQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="177874698"
X-IronPort-AV: E=Sophos;i="5.77,271,1596524400"; d="scan'208";a="177874698"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 12:40:16 -0700
IronPort-SDR: OJtaUmUU2VRk9KtKnU2JOdZ0Wx6lNOu+0+CFBjlBeB4odozE5Gxp9wTpGmmaUJi2k6Nfsj2iiR
 1ryN5FpIrCvQ==
X-IronPort-AV: E=Sophos;i="5.77,271,1596524400"; d="scan'208";a="483882946"
Received: from jekeller-mobl1.amr.corp.intel.com (HELO [10.212.151.155])
 ([10.212.151.155])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 12:40:13 -0700
Subject: Re: [trivial PATCH] treewide: Convert switch/case fallthrough; to
 break;
To: Keith Busch <kbusch@kernel.org>, Joe Perches <joe@perches.com>
References: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
 <20200909205558.GA3384631@dhcp-10-100-145-180.wdl.wdc.com>
From: Jacob Keller <jacob.e.keller@intel.com>
Organization: Intel Corporation
Message-ID: <321069c8-a4c1-56ff-49fb-4c2bce1e6352@intel.com>
Date: Thu, 17 Sep 2020 12:40:13 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200909205558.GA3384631@dhcp-10-100-145-180.wdl.wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 21 Sep 2020 10:10:22 +0200
Cc: linux-wireless@vger.kernel.org, linux-fbdev@vger.kernel.org,
 oss-drivers@netronome.com, nouveau@lists.freedesktop.org,
 alsa-devel <alsa-devel@alsa-project.org>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-ide@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 sparclinux@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
 linux-rtc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, dccp@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-atm-general@lists.sourceforge.net, linux-afs@lists.infradead.org,
 coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-mmc@vger.kernel.org, Kees Cook <kees.cook@canonical.com>,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-sctp@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-nvme@lists.infradead.org,
 storagedev@microchip.com, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 Jiri Kosina <trivial@kernel.org>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
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



On 9/9/2020 1:55 PM, Keith Busch wrote:
> On Wed, Sep 09, 2020 at 01:06:39PM -0700, Joe Perches wrote:
>> diff --git a/crypto/tcrypt.c b/crypto/tcrypt.c
>> index eea0f453cfb6..8aac5bc60f4c 100644
>> --- a/crypto/tcrypt.c
>> +++ b/crypto/tcrypt.c
>> @@ -2464,7 +2464,7 @@ static int do_test(const char *alg, u32 type, u32 mask, int m, u32 num_mb)
>>  		test_hash_speed("streebog512", sec,
>>  				generic_hash_speed_template);
>>  		if (mode > 300 && mode < 400) break;
>> -		fallthrough;
>> +		break;
>>  	case 399:
>>  		break;
> 
> Just imho, this change makes the preceding 'if' look even more
> pointless. Maybe the fallthrough was a deliberate choice? Not that my
> opinion matters here as I don't know this module, but it looked a bit
> odd to me.
> 

Yea this does look very odd..
