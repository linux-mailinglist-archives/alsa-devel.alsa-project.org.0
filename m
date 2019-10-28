Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3855E73E3
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 15:43:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FD881F6C;
	Mon, 28 Oct 2019 15:42:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FD881F6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572273785;
	bh=B3d7M9v/BvJz0Z8ocOLkjWsqaKfNu3yF9SpuamgkJAY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P79dCRmEQ3uAQuqa3ononXYI+haENhLY0JsafwBZMyF6IrKdWSFuSM6sVqN+cJDS0
	 56aMGJ9FxYrWKTd3CUiulVcFEVwNfdqYHG+4KsMRBl+tMWC5bpkgNXGT7UdOTKBFMx
	 oyEfYH62aGBC6w8WDsrzekE14QU1zyQWTMCEVz44=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BA12F805FE;
	Mon, 28 Oct 2019 15:40:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17F20F80361; Mon, 28 Oct 2019 15:40:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mout.web.de (mout.web.de [212.227.17.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95551F80145
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 15:40:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95551F80145
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="hbfgBkj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1572273619;
 bh=QHqqOg7p5UzgEReo+nUABxaEFdkS1OmskZNlAFvY00g=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=hbfgBkj14ES3bTP4wJgu2/+HxltU6x7ci+1j5OAlPFd7OpPYKNTFXk8h9zSYiugV5
 MhyCXrgbR/2UXPJo57MyrafJzMqjj28niZDeYUEgkCYkaGAR1EgMWRk6gDNEuuN3f/
 r/nGZklY8zLya19tQlzbet77epN5rFuYsGOEMWwI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.155.234]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MXHXF-1iSY1W2J0v-00WDbn; Mon, 28
 Oct 2019 15:40:19 +0100
To: Takashi Iwai <tiwai@suse.de>, Navid Emamdoost <emamd001@umn.edu>,
 alsa-devel@alsa-project.org, linux-doc@vger.kernel.org
References: <s5hmudlmldk.wl-tiwai@suse.de>
 <ec3647df-0e54-4aaa-7ec7-b3dec0fa1965@web.de> <s5ho8y1au4h.wl-tiwai@suse.de>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <0daa3e27-3d1f-3040-f8e7-92ce91a97687@web.de>
Date: Mon, 28 Oct 2019 15:40:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <s5ho8y1au4h.wl-tiwai@suse.de>
Content-Language: en-US
X-Provags-ID: V03:K1:TL43P9tqVb4G71gLlqBig/UUEguOCr8CxXDNfqZ0eDcapP/uWaJ
 XWlt1pfEYl91vE6AggTfHjM0jed8NPO2IOFqtalGtbxOIUarKrHM7ENV8+sUxRFcnCaRzKg
 IQ04ZEVMV+favQFma0gcWdk7+mTc6H6Ta23MsDS1ATMkyvpp56VtsphOJGQF0LHC8k8srv1
 LVs55KIUbMZvJt25uKghw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:H9T3rOFvefQ=:tvluSqaundhOP/M560f1uw
 3vLwoVdlDDZpU+EBHKPwJqRrYldzTVhfwvwonxt4tLb5U1YDbpnLoWzxwX/u0M5UGoKlJIW7+
 Lcg1jsGUFwSSJPryre8rdm+HBk4Fm2rk2nf69ApyuzyGp5PokydCs4eaYuNgnDyN+EPmac8Hk
 OeKQYRKrun0riUWmKuRQcjdRPBlGmF99wWKxUMBLFOZBtxxchmuWOe4k4IkOlDcB4xfwDuImJ
 ao4z9wcxIwowDDAEmT7gD1heVEsYwk+3YJYtsUXnMOaPHr3zxkoEKRIv3bDlSnj9zFn5b59PG
 bDoMVlsp5i6RbPg0UtfeCznDjpnv5BqlDngG5J3p+KyM/L5MVtKLOmdeobg/8/UJx9NtyTTr1
 DFfiypeJM6Ip1ZbQJl7T9fHTteCXfG2iVDA+b4sWg/btl1ErSzqsZHAyx0lQYDmZMQrXo05Zl
 prjwwT9YWG9mSb8aAxy0Fhmux+9ctqigU/XR6NIQoCojNiJIwjeLJy+tuPfaIHJHp/GEvG3+J
 TAD6Ei2ZjIFqQGKF87BqFUGMqmc9JeuEPk/D0PS9Jx1ENCTdnFq1WGFjVli9sJYo+z8ENdRmb
 20Bp87JYY3w/lupL6ZlPE2xs1GAtGJku9m/3qE+QfaXkLV4brQq8NraSB5Ghkl0uuNcXJUoYs
 1G9CA4Ri0XUx1354OG1VXeIORuBaCqW4BrszLzF1ignZ19etS4h+VC+V6HIXvYB0XamTBrBDv
 YcMECII+oVkslu9TOMG+DXZ3paHBBatd5xIKKKHzrwAY3iBeiGYK2HGkfvIiodvkQJvJg7M4D
 PZYvBlxqme5YO+GiZRJcSxAeBwrjVIPg5sg42J2zuRzj3Q2tJDB45RXjlZLXb7h5H7hKPk6qV
 vs3BuBoPRMEoB+hJMBwgFdGdmU6Ayo7SNa7zsvRZD/OpRRQ3ZO7g4iUG66QSNf7nP2dPTU80l
 gKqX8bq5JCA+Snz7bNdqY9Xawk/mw8e4XbXrAsjNZnMhHZF9+kG61j0qhQrLqhoFYj90Zt64d
 iIPuTzuT+5GGq0DQnlwkXJ9w8HgulVjvyGHapXXUFJ7Qkio1+JI00Xuo+P7m1yPxVM6uVuOTL
 m58KzynHXv0h/b+A7x4KD8sgre1xyfHY+KHJQEEXzrcNbmRPWoHh7rI4PwxndY795/iDeNy0P
 ERb8bObjo0y1Gw2mnAMlu4mnsCvkJ909zZea4PUO7dNoioqUHRTsA5lec7WjdserHt41w42jB
 HfcfLegpbvhRIZcH6p177NC0P6EgRwilq26E4oM35TMvi4slz3qxhIz76Xww=
Cc: kernel-janitors@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kangjie Lu <kjlu@umn.edu>,
 LKML <linux-kernel@vger.kernel.org>, Richard Fontana <rfontana@redhat.com>,
 Stephen McCamant <smccaman@umn.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [alsa-devel] ALSA: korg1212: Checking exception handling in
 snd_korg1212_create()
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

>> Can the properties of this programming interface be documented also together
>> with the function declaration for the safer handling of ALSA components?
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/sound/kernel-api/writing-an-alsa-driver.rst?id=d6d5df1db6e9d7f8f76d2911707f7d5877251b02#n567
>
> I can think of only adding some comment at each point mentioning that
> the resource will be managed by the device destructor.

* Which places will be corresponding update candidates?

* Would you like to choose the wording?


>> Can any more API information help to improve automatic source code analysis
>> around similar functions?
>
> If anything we can add, let me know.

Will any tags become more helpful also for the software documentation?

Regards,
Markus
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
