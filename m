Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 375401226CD
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 09:37:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C81601657;
	Tue, 17 Dec 2019 09:36:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C81601657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576571851;
	bh=hMsue/Pxazux5D+eqxjeOKgv7C+p4dGWTG7l4JA88RU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FBmlOF7bpXpO/W1RtDJWMeABIwDUXjd51DRmu6xFhn+JSA51ZxtZ52+lLCxaHxoaq
	 FnPGRAepPfu1YMgG7fCa1VNhrmyYpNjk+Az8jC311fy/YaSSfEJ2/pn+o0Dun2nyWV
	 9NCXW+2DdX6SN4o2HL454swmF8hf3ANMxxzdhK3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EDA3F80218;
	Tue, 17 Dec 2019 09:35:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D64BF80234; Tue, 17 Dec 2019 09:35:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5403F80088
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 09:35:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5403F80088
Received: from [37.163.141.23] (port=40521 helo=[192.168.43.3])
 by hostingweb31.netsons.net with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
 (envelope-from <luca@lucaceresoli.net>)
 id 1ih8KT-0002cv-Fc; Tue, 17 Dec 2019 09:35:41 +0100
To: Daniel Mack <daniel@zonque.org>, Wolfram Sang <wsa@the-dreams.de>
References: <20191209183511.3576038-1-daniel@zonque.org>
 <20191209183511.3576038-9-daniel@zonque.org>
 <64adf5d7-754a-f1da-aa9b-11579c5a2780@lucaceresoli.net>
 <20191212163315.GA3932@kunai>
 <482316ef-775a-cb7b-015e-e00463503e6b@zonque.org>
From: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <4f2e1332-eac3-e54d-5de8-b84a76cb1a34@lucaceresoli.net>
Date: Tue, 17 Dec 2019 09:35:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <482316ef-775a-cb7b-015e-e00463503e6b@zonque.org>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, lars@metafoo.de,
 sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org, broonie@kernel.org,
 linux-i2c@vger.kernel.org, pascal.huerst@gmail.com, lee.jones@linaro.org,
 linux-clk@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 07/10] i2c: Add driver for AD242x bus
	controller
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

Hi Daniel,

On 15/12/19 21:27, Daniel Mack wrote:
> Hi,
> 
> Thanks for the review!
> 
> On 12/12/2019 5:33 pm, Wolfram Sang wrote:
>> Hi Luca,
>>
>> thanks for the review!
>>
>>> good, but I think there's a problem in this function. A "normal"
>>> master_xfer function issues a repeated start between one msg and the
>>> next one, at least in the typical case where all msgs have the same
>>> slave address. Your implementation breaks repeated start. At first sight
>>> we might need more complex code here to coalesce all consecutive msgs
>>> with the same address into a single i2c_transfer() call.
>>
>> Note that it is by far the standard case that all messages in a transfer
>> have the same client address (99,999%?). But technically, this is not a
>> requirement and the repeated start on the bus is totally independent of
>> the addresses used. It is just a master wanting to send without being
>> interrupted by another master.
> 
> I'm not quite sure I understand.
> 
> Let's assume the following setup. An i2c client (some driver code) is
> sending a list of messages to the a2b xfer function, which in turn is
> logically connected to a 'real' i2c bus master that'll put the data on
> the wire.
> 
> The a2b code has to tell the 'master node' the final destination of the
> payload by programming registers on its primary i2c address, and then
> forwards the messages to its secondary i2c address. The layout of the
> messages don't change, and neither do the flags; i2c messages are being
> sent as i2c messages, except their addresses are changed, a bit like NAT
> in networking. That procedure is described on page 3-4 of the TRM,
> "Remote Peripheral I2C Accesses".
> 
> The 'real' i2c master that handles the hardware bus is responsible for
> adding start conditions, and as the messages as such are untouched, I
> believe it should do the right thing. The code in my xfer functions
> merely suppresses reprogramming remote addresses by remembering the last
> one that was used, but that is independent of the start conditions on
> the wire.

My concern is not about the start condition, it's about the *repeated*
start condition.

The first question is whether the A2B chips can do it. What if the host
processor sets a slave chip address and then issues two messages
separated by a repeated start condition? Will the slave transceiver emit
a repeated start condition too?

If the answer is "yes", then the issue moves to the driver code. A
master xfer function receives a set of messages that are normally
emitted with a repeated start between each other. But ad242x_i2c_xfer()
splits the msgs and calls i2c_transfer_buffer_flags() with one msg at a
time. i2c_transfer_buffer_flags() then will emit a stop condition.

This is not necessarily a problem, unless multi-master is used, but if
there are limitations or deviations from the standard they should at
least be well known and documented.

-- 
Luca
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
