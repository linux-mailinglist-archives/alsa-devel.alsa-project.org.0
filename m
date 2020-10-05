Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AED82838BE
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 17:03:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EF9117B8;
	Mon,  5 Oct 2020 17:02:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EF9117B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601910194;
	bh=E1Lwc+DgZuTer8TTdOmZwOfDNZu0u+5InLvIFDpL+Oo=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B9/m7voLCvRXHYs8KamfN0dGpeVlJjEV+tAi7DiHwUh7+gMhYPYpznRJuzYyQ40BL
	 lrkR39z7asVL2Bdy9lpa1BGKgbW6G9DsucJFn57xS6D02naPkOgduQtii6m23ApeEA
	 nw4wGQYKsyap4MQuANXr1DNCNjNTdbfYz1u4ChYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 332C9F80260;
	Mon,  5 Oct 2020 17:01:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 445F4F80121; Mon,  5 Oct 2020 17:01:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 855C6F800C9
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 17:01:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 855C6F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="p03YsrMV"
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 095Ew0ch006970; Mon, 5 Oct 2020 17:01:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=STMicroelectronics;
 bh=x0RKXgccVBDU8WK6ZIlsuoIcji+8/oyTQXcP6rS5GH0=;
 b=p03YsrMV7Oca9m/DegScNgiJp7Nf1sZO/ja6GgzhXWMaWQYjF4R2zPHJvyTChqhEI9P7
 Y2npR97XFKg4mCJGzX9u1Z0lxkUBqWKsLy8aq41+C/IGxn9rVyuliHEsVWW7zlpdhofA
 d4X3CqondNJvJf0DG+Yz8DDCQz1hb82k1IUeSjMu7a2rcszE+zszfR9W64bmKoMA3gLo
 +aHsFSq8XgfRWS/cuCGEVQopphT9oG7e8NknIbeYBj80iBt8IkRtwcXwplFZtq5TYW6C
 v9ae6OkASUwnKVb0bbt5zLYe9MKm+RhPihx9035G1P264RQsoQG4r08SQqcpsML2LLZm HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3402tjh025-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Oct 2020 17:01:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5CDDD10002A;
 Mon,  5 Oct 2020 17:01:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2F1CE2BA2C0;
 Mon,  5 Oct 2020 17:01:24 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 5 Oct
 2020 17:01:23 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
 SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
 15.00.1473.003; Mon, 5 Oct 2020 17:01:23 +0200
From: Olivier MOYSAN <olivier.moysan@st.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/1] ASoC: cs42l51: add soft dependency declaration
Thread-Topic: [PATCH 1/1] ASoC: cs42l51: add soft dependency declaration
Thread-Index: AQHWmNJxA7hCFfk8OkeP77wyVojxB6mI/ZoA
Date: Mon, 5 Oct 2020 15:01:23 +0000
Message-ID: <4e7fb9c0-84ea-ba01-cea8-8044d6ff60de@st.com>
References: <20201002152904.16448-1-olivier.moysan@st.com>
 <20201002154107.GC5527@sirena.org.uk>
In-Reply-To: <20201002154107.GC5527@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-05_10:2020-10-05,
 2020-10-05 signatures=0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "arnaud.patard@rtp-net.org" <arnaud.patard@rtp-net.org>
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

Hello Mark,





On 10/2/20 5:41 PM, Mark Brown wrote:

On Fri, Oct 02, 2020 at 05:29:04PM +0200, Olivier Moysan wrote:


When configured as module, CS42L51 codec driver uses two modules
snd-soc-cs42l51 and snd-soc-cs42l51-i2c.
Add soft dependency on snd-soc-cs42l51-i2c in snd-soc-cs42l51,
to allow smart module dependency solving.



Doesn't the userspace tooling usually manage to figure this out from
symbol usage?



cs42l51.c does not use symbols from cs42l51-i2c.c, so cs42l51-i2c does not =
appear
as a software dependency of cs42l51, for tools such as depmod.
(cs42l51-i2c.c uses symbols from cs42l51.c,
so there is a dependency in this way, but this does not help here)


When enabling a sound card based on cs42l51, all required modules are loade=
d automatically,
excepted snd-soc-cs42l51-i2c module. This one has to be inserted explicitel=
y.

With the use of softdep, cs42l51-i2c appears as a dependency of cs42l51 for=
 depmod,
which allows the probe of snd-soc-cs42l51-i2c.


If you think there is a better way to manage this dependency please let me =
know.

Regards
Olivier

