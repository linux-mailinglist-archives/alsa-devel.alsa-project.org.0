Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E64B4B5A97
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 07:01:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36B74166C;
	Wed, 18 Sep 2019 07:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36B74166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568782869;
	bh=qO19qUvP21XU23vHseDlCwOfmQLo62ZdE4kYiaRzcnw=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=unLCP1d7srjmn3mW5dqkPejUpS0j3m1R2met2Z2WErIEHIlw+TjWvFqPU4hc4IESx
	 AnGSNUoLGcwoJXpNO6wTKjzFJAQJUxx5O1HYpg2zzhagEPmI3O1XR2CRj9ltK+f7SU
	 7Ui5pFcNGKR4CRWxs2xoo5QImzKiAgnhQyjTf+9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C18CDF804FF;
	Wed, 18 Sep 2019 06:59:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58BBBF80506; Wed, 18 Sep 2019 06:59:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_1,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 995D7F80146
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 06:59:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 995D7F80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=in.bosch.com header.i=@in.bosch.com
 header.b="qUeXYnk3"
Received: from si0vm1948.rbesz01.com (unknown [139.15.230.188])
 by fe0vms0187.rbdmz01.com (Postfix) with ESMTPS id 46Y7752v1Zz1XLDQv
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 06:59:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
 s=key1-intmail; t=1568782753;
 bh=PjrrM0y1Edm6bhVyf1PzryJBuivI8QTqtEKuwpGgYXY=; l=10;
 h=From:Subject:From:Reply-To:Sender;
 b=qUeXYnk3NVKmVWspUbMxv942LqPr9itbB/joNYSoxq/PAW3PO+vw/U9ejZXWxARXa
 68D6f7F0gPWLli/ep4n8VIa1LftgMWnKVYu2/ZphHKwaJOtVeXO4yppLEmbzKAMs/x
 yUTorNU2C8SRqRA8XqaSiXDv+9gTkOTmwz2Uz+pc=
Received: from si0vm2083.rbesz01.com (unknown [10.58.172.176])
 by si0vm1948.rbesz01.com (Postfix) with ESMTPS id 46Y7752Wvcz1SC
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 06:59:13 +0200 (CEST)
X-AuditID: 0a3aad17-211ff700000041a2-ad-5d81b9a0324a
Received: from si0vm1950.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by si0vm2083.rbesz01.com (SMG Outbound) with SMTP id 76.5D.16802.0A9B18D5;
 Wed, 18 Sep 2019 06:59:12 +0200 (CEST)
Received: from FE-MBX2005.de.bosch.com (fe-mbx2005.de.bosch.com [10.3.231.29])
 by si0vm1950.rbesz01.com (Postfix) with ESMTPS id 46Y7745tFmzC9G
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 06:59:12 +0200 (CEST)
Received: from SGPMBX2025.APAC.bosch.com (10.187.56.84) by
 FE-MBX2005.de.bosch.com (10.3.231.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 18 Sep 2019 06:59:12 +0200
Received: from SGPMBX2003.APAC.bosch.com (10.187.56.76) by
 SGPMBX2025.APAC.bosch.com (10.187.56.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 18 Sep 2019 12:59:09 +0800
Received: from SGPMBX2003.APAC.bosch.com ([fe80::d4a:a83a:3749:3836]) by
 SGPMBX2003.APAC.bosch.com ([fe80::d4a:a83a:3749:3836%3]) with mapi id
 15.01.1713.009; Wed, 18 Sep 2019 12:59:09 +0800
From: "Channaiah Vanitha (RBEI/ECF3)" <Vanitha.Channaiah@in.bosch.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: Alsa-devel Digest, Vol 149, Issue 28
Thread-Index: AQHVMmCVDiQItuPXs0mIojU9DSP4h6cxUHBQ
Date: Wed, 18 Sep 2019 04:59:09 +0000
Message-ID: <0e189cb6f3a1448c80bc2e4863b4591b@in.bosch.com>
References: <mailman.104.1562241746.5742.alsa-devel@alsa-project.org>
In-Reply-To: <mailman.104.1562241746.5742.alsa-devel@alsa-project.org>
Accept-Language: en-US, en-SG
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.187.56.208]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA21TbUxTVxjuuef2cmi4y/Ui8q5Ktl23bEOngJLhXHR/9uU20X1ki7HRIlfa
 CC32FmObLFqUbAKbH8gsjRboiDoYAZd1dIHMrVN0bs7QtEw6WHS6hMIEXVHZomy3vcX2x/6c
 POd93ud5P04OwbyTaInRZBUtJn25wGhozXOdOc+0fu3Q5R20FwUH/NQL6JXuaDWzDm3QPF8q
 lht3iJalqzZrDOPuEabS0YB29jYexbtRwFaL0glwy6G/uouqRRrCc04KvKHP1MplBEH/iXMo
 lsVzNxHcCpoVIoqgxtfKKBc/Ao+jKZ7FcC/BZG2AieG53GqYvNQRT8Lchwi8n9TFiUwuH34J
 XEkkFcCNqda0WXzOPYhjmOaegDtnz8dNWW4ljEXqaKWNF+HGV9NxnC4Xu9h0JY4RlwOeoUNx
 jLlsCF9vppThOGjru4QVnAWRazNqBT8m+3Qk8hdDS+9fjIIXwfHWcazUnQM/NF2nDyBwpdi6
 UiSuFIkrRdKC6HaUJRnzdlQU5BUtW2IpESV7Xv6SLeaKL5DyYtk+dGJwqx9RBPlRIaGELDY0
 z6HjHyoxl9oMesmwyVJVLkqClvXmFOn4zAdhqaqkwihJRrNJXjzBwlx23fu7dDxbqrfZRYtZ
 kfnRfEIL2WwZKd7Ic2V6q7hNFCtFyyy7khAB2D6vXHCORSwTd241lltnaSGHRSqVip+XyqSW
 pUi6Hy0jGXLt3B7ZgpUq9RWSsSwhf1iR87PRpPQCKiYHIsc8mHx31i2fzafaPJinTWaTqM1m
 t8W8uJjKUGV60I12ATuDZSIrhUg6jqEgIkjIZJ+KiTPkb5HsA9iXb26WB0wEk6KCFlnD/fos
 nHYQ+NiphaFDi8D70evgrraA83YDgtDMGQTR+ssI3L7bCPaNdlIQmKrD0HW6A8NvV3swuKb6
 MYQv/4Rhor2ahntBNw2+nj4agpNRGnqG79PQ21Kjhob79WoIT3erIbr/dzX43eNqcE+0M9B1
 50cGTp7anwZfhvrToDc8kQajvj0Ehic/IGPyfil5v6vei+/Xqrf+z34T0eRg2t2ornJv48DF
 82+Egp++GR3/pkm75tY7hdfWBleg7g1PruA+fytjT0Pkj+WDC7fcld5eOvrawPedPz+q+zvj
 uH30WGFjfVtgvf3x6Qu5984cdDr+3I6Lh1B4/ibV8NMu/3B0gapmtaZeu+9d21r27vaZvY/s
 Gvn21cWH/zFdnWpu3vjvEd7miQi0ZNDn52KLpP8PKAz4QqsEAAA=
Cc: "Wischer Timo \(ADITG/ESS\)" <twischer@de.adit-jv.com>, "Duraisamy
 Saravanakumar \(RBEI/ECF3\)" <Saravanakumar.Duraisamy@in.bosch.com>
Subject: Re: [alsa-devel] Alsa-devel Digest, Vol 149, Issue 28
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello Jaroslav-san,

This mail is regarding :
   3. Re: GIT: Regarding the issue we are facing in the commit
      37728639ae05de702825d96bd1d42e24ae772248 (Jaroslav Kysela)

Dne 03. 07. 19 v 14:17 Channaiah Vanitha (RBEI/ECF3) napsal(a):
> Hello Jaroslav-san,
> 
>> I think that it would be probably best to force the parameters for your hardware (--period-size and --buffer-size arguments for aplay or the time counterparts - --period-time and --buffer-time). The refining rules might not select the perfect configuration in some cases.
> 
> I tried to force parameters "period-size" in multiples of 2ms as our hardware supports 2ms period time data and buffer-size=twice period size.
> But still I face the issue.

There is no exact 2ms period size for the rate 11025Hz, because it's float number 21.9780 (period size)... You may try values like 15,35,45,105 (anything which can match 11025 / PERIOD_SIZE without the remainder).

					Jaroslav

We tried executing the playback use-case with below parameters as suggested.
But still we able to see: Unable to install hw params.
Kindly provide your feedback.

The output from below Hardware : 
a. RCAR salvator-xs which supports 2 channel.
b. IMX which supports 8 channel.

root@rcar-gen3:~# aplay -v -Dentertainment_main -r11025 -c6 -fS16_LE --period-size=15 /dev/random  
Playing raw data '/dev/random' : Signed 16 bit Little Endian, Rate 11025 Hz, Channels 6
aplay: set_params:1411: Unable to install hw params:
ACCESS:  RW_INTERLEAVED
FORMAT:  S16_LE
SUBFORMAT:  STD
SAMPLE_BITS: 16
FRAME_BITS: 96
CHANNELS: 6
RATE: NONE
PERIOD_TIME: 2000
PERIOD_SIZE: NONE
PERIOD_BYTES: (264 276)
PERIODS: (15 16)
BUFFER_TIME: (31927 31928)
BUFFER_SIZE: 352
BUFFER_BYTES: 4224
TICK_TIME: 0
root@rcar-gen3:~# aplay -v -Dentertainment_main -r11025 -c6 -fS16_LE --period-size=105 /dev/random  
Playing raw data '/dev/random' : Signed 16 bit Little Endian, Rate 11025 Hz, Channels 6
aplay: set_params:1411: Unable to install hw params:
ACCESS:  RW_INTERLEAVED
FORMAT:  S16_LE
SUBFORMAT:  STD
SAMPLE_BITS: 16
FRAME_BITS: 96
CHANNELS: 6
RATE: NONE
PERIOD_TIME: 10000
PERIOD_SIZE: NONE
PERIOD_BYTES: (1320 1332)
PERIODS: (2 3)
BUFFER_TIME: (29931 29932)
BUFFER_SIZE: 330
BUFFER_BYTES: 3960
TICK_TIME: 0
root@rcar-gen3:~# aplay -v -Dentertainment_main -r11025 -c6 -fS16_LE --period-size=35 /dev/random  
Playing raw data '/dev/random' : Signed 16 bit Little Endian, Rate 11025 Hz, Channels 6
aplay: set_params:1411: Unable to install hw params:
ACCESS:  RW_INTERLEAVED
FORMAT:  S16_LE
SUBFORMAT:  STD
SAMPLE_BITS: 16
FRAME_BITS: 96
CHANNELS: 6
RATE: NONE
PERIOD_TIME: 4000
PERIOD_SIZE: NONE
PERIOD_BYTES: (528 540)
PERIODS: (7 8)
BUFFER_TIME: (31927 31928)
BUFFER_SIZE: 352
BUFFER_BYTES: 4224
TICK_TIME: 0
root@rcar-gen3:~# aplay -v -Dentertainment_main -r11025 -c6 -fS16_LE --period-size=45 /dev/random  
Playing raw data '/dev/random' : Signed 16 bit Little Endian, Rate 11025 Hz, Channels 6
aplay: set_params:1411: Unable to install hw params:
ACCESS:  RW_INTERLEAVED
FORMAT:  S16_LE
SUBFORMAT:  STD
SAMPLE_BITS: 16
FRAME_BITS: 96
CHANNELS: 6
RATE: NONE
PERIOD_TIME: 4000
PERIOD_SIZE: NONE
PERIOD_BYTES: (528 540)
PERIODS: (7 8)
BUFFER_TIME: (31927 31928)
BUFFER_SIZE: 352
BUFFER_BYTES: 4224
TICK_TIME: 0


Best regards,
Vanitha Channaiah
RBEI/ECF3  

Tel. +91 80 6136-4436 


-----Original Message-----
From: Alsa-devel <alsa-devel-bounces@alsa-project.org> On Behalf Of alsa-devel-request@alsa-project.org
Sent: Thursday, July 4, 2019 5:32 PM
To: alsa-devel@alsa-project.org
Subject: Alsa-devel Digest, Vol 149, Issue 28

Send Alsa-devel mailing list submissions to
	alsa-devel@alsa-project.org

To subscribe or unsubscribe via the World Wide Web, visit
	https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
or, via email, send a message with subject or body 'help' to
	alsa-devel-request@alsa-project.org

You can reach the person managing the list at
	alsa-devel-owner@alsa-project.org

When replying, please edit your Subject line so it is more specific than "Re: Contents of Alsa-devel digest..."


Today's Topics:

   1. Re: [PATCH v2 1/2] ASoC: SOF: add flag for position update
      ipc (Kai Vehmanen)
   2. Re: [PATCH v2 2/2] ASoC: SOF: Intel: fix reset of
      host_period_bytes (Kai Vehmanen)
   3. Re: GIT: Regarding the issue we are facing in the commit
      37728639ae05de702825d96bd1d42e24ae772248 (Jaroslav Kysela)
   4. Re: [PATCH v2 1/2] ASoC: SOF: add flag for position update
      ipc (Keyon Jie)
   5. bug in playing 6-channel sound (Julian Bradfield)
   6. Re: [PATCH v2 1/2] ASoC: SOF: add flag for position update
      ipc (Kai Vehmanen)
   7. Re: [PATCH v2 34/35] sound/soc/codecs: Use kmemdup rather
      than duplicating its implementation (Richard Fitzgerald)
   8. audio lost from speaker after reboot from windows on the
      device ALC295 (He, Bo)


----------------------------------------------------------------------

Message: 1
Date: Thu, 4 Jul 2019 13:03:06 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: Keyon Jie <yang.jie@linux.intel.com>
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
	Marcin Rajwa <marcin.rajwa@linux.intel.com>,
	pierre-louis.bossart@linux.intel.com
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: SOF: add flag for
	position update ipc
Message-ID: <alpine.DEB.2.21.1907041254100.4409@eliteleevi>
Content-Type: text/plain; charset=US-ASCII

Hi,

patch looks good, but commit message could be improved.

On Wed, 3 Jul 2019, Keyon Jie wrote:

> In some cases, FW might need use the host_period_bytes even no 
> position update ipc reqiured from driver, here add another flag for 
> position update, and preserve host_period_bytes for FW to use.

Speculation on what FW might do is not really needed. The host_period_bytes field has been overloaded with multiple semantics and this patch clears that, right. How about:

""
Remove the special case semantics of 'host_period_bytes==0'.
Add a new field 'no_period_irq' to signal whether period elapsed IPC should be sent and use 'host_period_bytes' only for period size.
""

> This might require corresponding FW change and ABI alignment.

This is not helpful -- we know this _is_ a minor ABI change and needs to be aligned with FW.

Br, Kai



------------------------------

Message: 2
Date: Thu, 4 Jul 2019 13:05:21 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: Keyon Jie <yang.jie@linux.intel.com>
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
	Marcin Rajwa <marcin.rajwa@linux.intel.com>,
	pierre-louis.bossart@linux.intel.com
Subject: Re: [alsa-devel] [PATCH v2 2/2] ASoC: SOF: Intel: fix reset
	of host_period_bytes
Message-ID: <alpine.DEB.2.21.1907041304101.4409@eliteleevi>
Content-Type: text/plain; charset=US-ASCII

Hi,

On Wed, 3 Jul 2019, Keyon Jie wrote:

> From: Marcin Rajwa <marcin.rajwa@linux.intel.com>
> 
> This patch prevents the reset of host period bytes.
> The parameter has been used to keep information about completion of 
> period copy. Right now we keep this information in period_irq.
> 
> Signed-off-by: Marcin Rajwa <marcin.rajwa@linux.intel.com>
> Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>

looks good, for this patch:

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>


------------------------------

Message: 3
Date: Thu, 4 Jul 2019 12:18:24 +0200
From: Jaroslav Kysela <perex@perex.cz>
To: "Channaiah Vanitha (RBEI/ECF3)" <Vanitha.Channaiah@in.bosch.com>
Cc: "Wischer Timo \(ADITG/ESS\)" <twischer@de.adit-jv.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] GIT: Regarding the issue we are facing in
	the commit 37728639ae05de702825d96bd1d42e24ae772248
Message-ID: <556614e1-acba-635c-beed-6484fb887299@perex.cz>
Content-Type: text/plain; charset=utf-8

Dne 03. 07. 19 v 14:17 Channaiah Vanitha (RBEI/ECF3) napsal(a):
> Hello Jaroslav-san,
> 
>> I think that it would be probably best to force the parameters for your hardware (--period-size and --buffer-size arguments for aplay or the time counterparts - --period-time and --buffer-time). The refining rules might not select the perfect configuration in some cases.
> 
> I tried to force parameters "period-size" in multiples of 2ms as our hardware supports 2ms period time data and buffer-size=twice period size.
> But still I face the issue.

There is no exact 2ms period size for the rate 11025Hz, because it's float number 21.9780 (period size)... You may try values like 15,35,45,105 (anything which can match 11025 / PERIOD_SIZE without the remainder).

					Jaroslav

--
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.


------------------------------

Message: 4
Date: Thu, 4 Jul 2019 18:29:20 +0800
From: Keyon Jie <yang.jie@linux.intel.com>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
	Marcin Rajwa <marcin.rajwa@linux.intel.com>,
	pierre-louis.bossart@linux.intel.com
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: SOF: add flag for
	position update ipc
Message-ID: <3788800e-7050-d68a-bec6-5b443fd0d563@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed



On 2019/7/4 ??6:03, Kai Vehmanen wrote:
> Hi,
> 
> patch looks good, but commit message could be improved.
> 
> On Wed, 3 Jul 2019, Keyon Jie wrote:
> 
>> In some cases, FW might need use the host_period_bytes even no position
>> update ipc reqiured from driver, here add another flag for position update,
>> and preserve host_period_bytes for FW to use.
> 
> Speculation on what FW might do is not really needed. The
> host_period_bytes field has been overloaded with multiple
> semantics and this patch clears that, right. How about:

Well, to me it is flavor choice, Ranjani suggested to illustrate the use 
case where the FW will use this host_period_bytes, and I agreed this 
will help people to understand why we need this change.

> 
> ""
> Remove the special case semantics of 'host_period_bytes==0'.
> Add a new field 'no_period_irq' to signal whether period elapsed
> IPC should be sent and use 'host_period_bytes' only for
> period size.
> ""
> 
>> This might require corresponding FW change and ABI alignment.
> 
> This is not helpful -- we know this _is_ a minor ABI change
> and needs to be aligned with FW.

It is minor change, but the FW change is still required, otherwise, we 
will get extra position update IPCs which may confuse the driver, please 
refer to here:
https://github.com/thesofproject/sof/pull/1592

Thanks,
~Keyon

> 
> Br, Kai
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 


------------------------------

Message: 5
Date: Thu, 4 Jul 2019 11:46:20 +0100
From: Julian Bradfield <jalsa-devel@jcbradfield.org>
To: alsa-devel@alsa-project.org
Subject: [alsa-devel] bug in playing 6-channel sound
Message-ID: <23837.55548.631053.741245@vis.stevens-bradfield.com>
Content-Type: text/plain; charset=us-ascii

Some five years ago, the following post

https://mailman.alsa-project.org/pipermail/alsa-devel/2014-February/072265.html

reported a failure to play six-channel sound, that could be worked
around by setting the prealloc value for the device to various values
*other than* the default 64. 

I have just run into this playing a movie from my laptop (Thinkpad
Yoga X1, Intel HDA PCH sound card outputting through HDMI) running
Xubuntu 18.04, up to date as at the time of posting.

I see exactly the same problem as in that post, and the same
workaround works for me - I tried prealloc values 63,65,32,128, and
any of them is ok.

I'm a bit baffled that such a problem has survived for several years.

If any developer would like me to provide debugging information,
please get in touch - I have some time available at present, but not
enough to learn ALSA and debug it myself!

I will remain subscribed to the list for a few weeks to read any
followups.


------------------------------

Message: 6
Date: Thu, 4 Jul 2019 14:00:31 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: Keyon Jie <yang.jie@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Marcin Rajwa
	<marcin.rajwa@linux.intel.com>, ranjani.sridharan@linux.intel.com, Kai
	Vehmanen <kai.vehmanen@linux.intel.com>,
	pierre-louis.bossart@linux.intel.com
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: SOF: add flag for
	position update ipc
Message-ID: <alpine.DEB.2.21.1907041344240.4409@eliteleevi>
Content-Type: text/plain; charset=US-ASCII

Hi,

On Thu, 4 Jul 2019, Keyon Jie wrote:

> Well, to me it is flavor choice, Ranjani suggested to illustrate the use 
> case where the FW will use this host_period_bytes, and I agreed this 
> will help people to understand why we need this change.

hmm, ok. So maybe add "Allows FW to use 'host_period_bytes' field
for its original purpose" to my proposed wording..?

>> This is not helpful -- we know this _is_ a minor ABI change
>> and needs to be aligned with FW.
> It is minor change, but the FW change is still required, otherwise, we 
> will get extra position update IPCs which may confuse the driver, please 
[...]
> https://github.com/thesofproject/sof/pull/1592

Ack, but we know this already so best to put the accurate 
description in the commit message. The "might require FW change"
is a bit scary statement in a patch touching ABI structs. ;)


------------------------------

Message: 7
Date: Thu, 4 Jul 2019 12:47:29 +0100
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: Fuqian Huang <huangfq.daxian@gmail.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 34/35] sound/soc/codecs: Use
	kmemdup rather than duplicating its implementation
Message-ID:
	<52ee7351-19fc-4fd3-33f8-9392a4ad9526@opensource.cirrus.com>
Content-Type: text/plain; charset="utf-8"; format=flowed

Commit message title prefix should be "ASoC: wm0010:" not "sound/soc
/codecs:". Take a look at other patches to the same files.

> kmemdup is introduced to duplicate a region of memory in a neat way.
> Rather than kmalloc/kzalloc + memcpy, which the programmer needs to
> write the size twice (sometimes lead to mistakes), kmemdup improves
> readability, leads to smaller code and also reduce the chances of mistakes.
> Suggestion to use kmemdup rather than using kmalloc/kzalloc + memcpy.
> 
> Acked-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
> ---
> Changes in v2:
>    - Fix a typo in commit message (memset -> memcpy)
>    - Split into two patches
> 
>   sound/soc/codecs/wm0010.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/sound/soc/codecs/wm0010.c b/sound/soc/codecs/wm0010.c
> index 727d6703c905..807826f30f58 100644
> --- a/sound/soc/codecs/wm0010.c
> +++ b/sound/soc/codecs/wm0010.c
> @@ -515,7 +515,7 @@ static int wm0010_stage2_load(struct snd_soc_component *component)
>   	dev_dbg(component->dev, "Downloading %zu byte stage 2 loader\n", fw->size);
>   
>   	/* Copy to local buffer first as vmalloc causes problems for dma */
> -	img = kzalloc(fw->size, GFP_KERNEL | GFP_DMA);
> +	img = kmemdup(&fw->data[0], fw->size, GFP_KERNEL | GFP_DMA);
>   	if (!img) {
>   		ret = -ENOMEM;
>   		goto abort2;
> @@ -527,8 +527,6 @@ static int wm0010_stage2_load(struct snd_soc_component *component)
>   		goto abort1;
>   	}
>   
> -	memcpy(img, &fw->data[0], fw->size);
> -
>   	spi_message_init(&m);
>   	memset(&t, 0, sizeof(t));
>   	t.rx_buf = out;
> 



------------------------------

Message: 8
Date: Thu, 4 Jul 2019 12:02:17 +0000
From: "He, Bo" <bo.he@intel.com>
To: "kailang@realtek.com" <kailang@realtek.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "chiu@endlessm.com" <chiu@endlessm.com>, "tiwai@suse.com"
	<tiwai@suse.com>, "drake@endlessm.com" <drake@endlessm.com>,
	"hui.wang@canonical.com" <hui.wang@canonical.com>,
	"jian-hong@endlessm.com" <jian-hong@endlessm.com>
Subject: [alsa-devel] audio lost from speaker after reboot from
	windows on the device ALC295
Message-ID:
	<CD6925E8781EFD4D8E11882D20FC406D52AB58B6@SHSMSX104.ccr.corp.intel.com>
	
Content-Type: text/plain; charset="us-ascii"

Hi, patch_realtek.c maintainer:
	I see one issue that reboot from windows and boot to ubuntu, the audio lost from speaker, I suspect there are some bugs in patch_realtek.c drivers,  the device is ALC295 and the device id is 0x10ec0295.

I have done the below experiments:
1. reboot from windows to windows, the audio is persist .
2. reboot from windows to ubuntu, the audio lost from speaker, but can hear if I hotplug one earphone.
3. if the issue reproduce after reboot from windows, reboot the ubuntu can't restore the audio, I suspect it's warm reset.
4. if I write the port 0xcf9 with 0xe to do cold reset, the audio can restore.
5. if I do suspend/resume, the audio can restore, I suspect do cold boot and suspend will trigger the platform reset to reset the ALC295.
6. if I do double function reset (write the verb 0x7ff in alc_init), the audio is still can't restore.
snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_CODEC_RESET, 0); /* Function reset */
snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_CODEC_RESET, 0); /* double Function reset */
7. the issue is first found on kernel 4.19.50, I still see the issue with the latest kernel 5.2-rc2, is it possible windows change some default registers, but ALC295 don't initialize the register?


------------------------------

Subject: Digest Footer

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel


------------------------------

End of Alsa-devel Digest, Vol 149, Issue 28
*******************************************
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
