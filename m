Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A51C229561F
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Oct 2020 03:44:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 320AD1779;
	Thu, 22 Oct 2020 03:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 320AD1779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603331048;
	bh=70TXSSD0Z8ay711JQlrYDccvuQlYOtyQ2HUOnbuEBU0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MABeFny3Vdxg111t1O+h0iHMvJ68Yd29fvwuF4yY2eWoShYCMm0ZzyAZ7R4iXGDVC
	 2RkHzIyNfTTjZhetkalNbSm8MRuHiwhzcNSzPFQh8WPs5PDxqAxCA8yN8xiKiPx1vj
	 DXToSrlePyFNWZD3uiILxoI45AhhKFX504XwYc9c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2147F8049C;
	Thu, 22 Oct 2020 03:42:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC08AF804A9; Thu, 22 Oct 2020 03:42:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD346F8025A
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 03:42:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD346F8025A
Received: from 1.general.hwang4.uk.vpn ([10.172.195.16])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1kVPca-0003nC-91; Thu, 22 Oct 2020 01:42:28 +0000
Subject: Re: [bug report] ALSA: hda - Don't register a cb func if it is
 registered already
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20201021121904.GA1126544@mwanda>
 <da806361-d1a8-ce20-462f-0ec6acff5bfc@canonical.com>
 <9be5bc31-0118-1542-560f-cfe2cecf2403@canonical.com>
 <20201021172728.GY18329@kadam>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <de6d0948-79cc-6746-282d-db00b8083393@canonical.com>
Date: Thu, 22 Oct 2020 09:42:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201021172728.GY18329@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
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


On 10/22/20 1:27 AM, Dan Carpenter wrote:
> On Wed, Oct 21, 2020 at 11:03:11PM +0800, Hui Wang wrote:
>> Looks like this will not bring problem on patch_sigmatel.c, NULL and valid
>> kernel pointer are same for IS_ERR(), they will not make IS_ERR() come true.
>>
> Correct, but that is the problem.  You can dereference a valid pointer
> but you can't dereference a NULL.
>
>> On 10/21/20 10:21 PM, Hui Wang wrote:
>>> On 10/21/20 8:19 PM, Dan Carpenter wrote:
>>>> Hello Hui Wang,
>>>>
>>>> The patch f4794c6064a8: "ALSA: hda - Don't register a cb func if it
>>>> is registered already" from Sep 30, 2020, leads to the following
>>>> static checker warning:
>>>>
>>>>      sound/pci/hda/patch_sigmatel.c:3075 stac92hd71bxx_fixup_hp_m4()
>>>>      warn: 'jack' can also be NULL
>>>>
>>>> sound/pci/hda/patch_sigmatel.c
>>>>     3069          /* Enable VREF power saving on GPIO1 detect */
>>>>     3070          snd_hda_codec_write_cache(codec, codec->core.afg, 0,
>>>>     3071 AC_VERB_SET_GPIO_UNSOLICITED_RSP_MASK, 0x02);
>>>>     3072          jack = snd_hda_jack_detect_enable_callback(codec,
>>>> codec->core.afg,
>>>>     3073 stac_vref_event);
>>>>
>>>> Originally snd_hda_jack_detect_enable_callback() would not return NULL
>>>> here.
>>>>
>>>>     3074          if (!IS_ERR(jack))
>>>>     3075                  jack->private_data = 0x02;
> So if "jack" is NULL then it will say it's not an error pointer so it
> will try to assign jack->private_data = 0x02; and oops.

Right. Will fix it.

Thanks

>
> regards,
> dan carpenter
>
