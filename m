Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB35E1ABBA8
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 10:49:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A8B81662;
	Thu, 16 Apr 2020 10:48:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A8B81662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587026942;
	bh=WIsXpk3XPnzowa+SSRiFGuS3z4FCqT9kvH4YaPYP/t0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cjrn45pbPTP/AIhictliSrHmnuoqXO4DAA7LJXVW9IneoJDxHSR8ox+QLJKHYyWJE
	 wg0ipw2K7rwRQvaTgqYmbLrJ6LMxyOhtggjpNb42944gLEBGHCFYelfsB43x4Tgsnk
	 2ZOaPzF8Rf3vvJlpg8H8mH4QxYpZOE3qjPNO6XHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45AAAF8016F;
	Thu, 16 Apr 2020 10:47:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6A67F8014E; Thu, 16 Apr 2020 10:47:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E373F80115
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 10:47:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E373F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="dvlrNHrC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587026823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WIsXpk3XPnzowa+SSRiFGuS3z4FCqT9kvH4YaPYP/t0=;
 b=dvlrNHrCUjVGbgyxR6RKos690JPXXrA6UnGmS6tAeL+HCsFHn16I5XTff/NLsJ+lVbizoH
 kt/LzUCvsev8nQaJnWdHrHkUFzDVNabTW8DngD+nKTf6ePzpFOm++qfEREuFplGhHw/zcg
 2L/F47uBfzamYwIgywrTDs9YFUtaNIA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-futKd9_vPTCw79KiansHPg-1; Thu, 16 Apr 2020 04:47:01 -0400
X-MC-Unique: futKd9_vPTCw79KiansHPg-1
Received: by mail-wr1-f72.google.com with SMTP id f2so1369799wrm.9
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 01:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=56x3l2HyCOzFttcsLgv18xUx346bcxBacQxPmQPagRE=;
 b=MrQqfcfopMSTw6ujPU9LXB7+CwxfpmJZf1lU6IkhIlkqqRrwEUIEEsfk6ZgSv8Mnhj
 2K6HgYF3L/iUKy5asDfeEm9K6YJpBnp2hpmc7LDPBwaF9w6HT+MkmMtj6/BEHtEDJvSa
 Yq3Vo43W/NNvlEjpj8j2U55prxhxon9L/Alrg7sC5E5zjx0ikmUgkRRwrKFPA7haHp5q
 54zHtd84CyNF9YSp+C80MVFUoAuIzwhDd8cYRtPv6nc80El4v4mNS1QrYlFnDTNVxccp
 w+cZtg36UEAKSVIfY84CD7PuxrjZE191b8Xsu93Occ+laJ8mVCAKM6raeNx6Cilk0TqW
 zUPQ==
X-Gm-Message-State: AGi0PuZqBvXgby7FDBili5rfxUhY4OQJs8YZ7sjBJekfDsqkCgq76oMY
 9Y5Y4gqxrUgKZiExwPVy8cCrUaphfnNUjEND4P7wGFYRE+pAZvNiiF+o2qumh4jv7sEUzoMePuh
 oq4euz3guYY6Vi1Qk20JQsqw=
X-Received: by 2002:adf:f844:: with SMTP id d4mr14669570wrq.362.1587026820554; 
 Thu, 16 Apr 2020 01:47:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypL8l2rD6xQ/MtiSpj9VBxr5dw2dS29eVadr/vOZ/Ohn0eERYTezco+j3EFCftbDJc8oq/O67w==
X-Received: by 2002:adf:f844:: with SMTP id d4mr14669549wrq.362.1587026820335; 
 Thu, 16 Apr 2020 01:47:00 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id d13sm2703582wmb.39.2020.04.16.01.46.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2020 01:46:59 -0700 (PDT)
Subject: Re: [RFC TEST] ASoC: soc-dai: revert all changes to DAI
 startup/shutdown sequence
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200415030437.23803-1-pierre-louis.bossart@linux.intel.com>
 <9bbb1e49-6542-b1a3-d9e6-8dd30b79d07f@redhat.com>
 <fd1a219b-28b4-e324-6657-9fb4a65ec640@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <e9d4b66b-6f61-f941-03e6-7114ce11b06d@redhat.com>
Date: Thu, 16 Apr 2020 10:46:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <fd1a219b-28b4-e324-6657-9fb4a65ec640@linux.intel.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: tiwai@suse.de, broonie@kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On 4/15/20 11:56 PM, Pierre-Louis Bossart wrote:
>=20
>=20
> On 4/15/20 4:26 PM, Hans de Goede wrote:
>> Hi,
>>
>> On 4/15/20 5:04 AM, Pierre-Louis Bossart wrote:
>>> On Baytrail/Cherrytrail, the Atom/SST driver fails miserably:
>>>
>>> [=A0=A0=A0 9.741953] intel_sst_acpi 80860F28:00: FW Version 01.0c.00.01
>>> [=A0=A0=A0 9.832992] intel_sst_acpi 80860F28:00: FW sent error response=
 0x40034
>>> [=A0=A0=A0 9.833019] intel_sst_acpi 80860F28:00: FW alloc failed ret -4
>>> [=A0=A0=A0 9.833028] intel_sst_acpi 80860F28:00: sst_get_stream returne=
d err -5
>>> [=A0=A0=A0 9.833033] sst-mfld-platform sst-mfld-platform: ASoC: DAI pre=
pare error: -5
>>> [=A0=A0=A0 9.833037]=A0 Baytrail Audio Port: ASoC: prepare FE Baytrail =
Audio Port failed
>>> [=A0=A0=A0 9.853942] intel_sst_acpi 80860F28:00: FW sent error response=
 0x40034
>>> [=A0=A0=A0 9.853974] intel_sst_acpi 80860F28:00: FW alloc failed ret -4
>>> [=A0=A0=A0 9.853984] intel_sst_acpi 80860F28:00: sst_get_stream returne=
d err -5
>>> [=A0=A0=A0 9.853990] sst-mfld-platform sst-mfld-platform: ASoC: DAI pre=
pare error: -5
>>> [=A0=A0=A0 9.853994]=A0 Baytrail Audio Port: ASoC: prepare FE Baytrail =
Audio Port failed
>>>
>>> Commit b56be800f1292 ("ASoC: soc-pcm: call
>>> snd_soc_dai_startup()/shutdown() once") was the initial problematic
>>> commit.
>>>
>>> Commit 1ba616bd1a6d5e ("ASoC: soc-dai: fix DAI startup/shutdown sequenc=
e")
>>> was an attempt to fix things but it does not work on Baytrail,
>>> reverting all changes seems necessary for now.
>>>
>>> Fixes: 1ba616bd1a6d5e ("ASoC: soc-dai: fix DAI startup/shutdown sequenc=
e")
>>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.c=
om>
>>
>> Thank you for figuring this out!
>>
>> I've tested this on the 2 devices where I have seen the problem
>> (the only 2 devices on which I've tested 5.7-rc1 so far):
>>
>> One Cherry Trail device with a RT5645 codec and another
>> Cherry Trail device with an ES8316 and I can confirm that this
>> fixes the issue on both devices:
>>
>> Tested-by: Hans de Goede <hdegoede@redhat.com>
>=20
> Thanks Hans for checking.
>=20
> I must admit it was one of the more complicated bisects I've ever done, w=
e had 3 different regressions so I end-up merging sound-v5.7-rc1 on top of =
v5.7-rc1, then do a manual rebase to create a linear branch, then squash fi=
xes with the original problematic commits, and then bisecting once I had a =
single issue left.
>=20
> I'll see if we can retask some of the SOF CI Baytrail/Cherrytrail machine=
s to run regressions on the legacy driver on a periodic basis, e.g. during =
week-ends when no one is around.

If you can do that, that would be great. Currently the QA model for
new kernels for BYT/CHT seems to be: if there are any regression's
let Hans hit them when he starts running rc1 on his set of test
devices and also let Hans figure out a fix, which is why I'm
grateful that you fixed this, thanks!

Regards,

Hans

