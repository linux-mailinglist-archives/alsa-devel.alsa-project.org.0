Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F103625C5
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 18:37:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DDA616CA;
	Fri, 16 Apr 2021 18:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DDA616CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618591049;
	bh=FjX1o8frfgWet8o9FFJV7JQ1xc81FAeBxyIRuaoh3L8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SHR9i5s35ubBbGgO4s66rrczVSQATUVOBR5rX0RH5kphqfkVcuairDSa/x9gsFjA+
	 TR7cF2HlkvRYnl8zQYwlnaru0lPm0J+soA1z5iB8mmGOtxxwBL1MrWGOgeRIJ3PsyG
	 W+1kfSDU35dz5aTu9msXWcjcCwsfOp8R8F02juFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA23EF800FF;
	Fri, 16 Apr 2021 18:36:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DE6BF8025B; Fri, 16 Apr 2021 18:35:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FEC3F800FF
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 18:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FEC3F800FF
Received: from [100.112.2.115] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-b.us-east-1.aws.symcld.net id F0/15-44756-8ECB9706;
 Fri, 16 Apr 2021 16:35:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleJIrShJLcpLzFFi42LJePGQR/fZnso
 Eg+VPlC2uXDzEZLHi+yUWi85d/awWv/4/Y7L4cXgSs8XLzW+YHNg8NnxuYvPoff6F1WPeyUCP
 fW+XsXk8fruZ3WPz6eoAtijWzLyk/IoE1ow1H04zFxwTqfj49Q9rA+NXgS5GLg4hgf+MEvsWN
 bFBOC8YJS4tegPkcHIIC0RKHGl5zApiiwgcYZS4f1UBxGYW0JXYOnUCO0TDbEaJdT9fMYMk2A
 S0JbZs+QXWzCtgK9G0ZT8jiM0ioCrxe+UNJhBbVCBcovfKbVaIGkGJkzOfsIDYnALOEie7e4H
 mcAAt0JRYv0sfYpe4xK0n85kgbHmJ5q2zwUokBBQkZuzwBglLCCRI9Px7xDaBUXAWkqGzEAbN
 QjJoFpJBCxhZVjGaJRVlpmeU5CZm5ugaGhjoGhoa6RrqGhqZ6CVW6SbplRbrpiYWl+ga6iWWF
 +sVV+Ym56To5aWWbGIERlJKAWPNDsYFbz7oHWKU5GBSEuVdHFWZIMSXlJ9SmZFYnBFfVJqTWn
 yIUYaDQ0mCt2AXUE6wKDU9tSItMwcY1TBpCQ4eJRHeJxuB0rzFBYm5xZnpEKlTjIpS4rxqu4E
 SAiCJjNI8uDZYIrnEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZiXH5iWhHgy80rgpr8CWswE
 tHj3fLDFJYkIKakGJut84Zz4CJaC9mk3NfRdmu/PiP47w/+u8gaOJYfubnq95VTry6WbJrJOX
 vk0M8KY9X/oD9MPxp67NlyacnYj55UbE5g1X3/q2aqxs+d3oSOLSufvVfJ6C3KPWD9n6N6kVd
 rIE5H9sWbOzwk/6q9dWB0vuMdzUfnzW30ZnBucM5Q9r8oHJMnvPr/72a+7Uycs11xUd16uR/d
 CUYPU2672Hdu/zeN6pq3bH/7zb438rhOS10MqXz86ynqBIfMeR+9cAQaFgJDZL/5cYOxPdinO
 Vj3/t3bS25D3vrbvHxv1KpaaVol/8TvVUbzh6JHoA2vZpgqIx1yt0rV1XWyYylD9xlpr+qbc6
 OetxQv3P9obFavEUpyRaKjFXFScCAAYq8jjnwMAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-19.tower-396.messagelabs.com!1618590950!738394!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27291 invoked from network); 16 Apr 2021 16:35:50 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.12)
 by server-19.tower-396.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Apr 2021 16:35:50 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 5E78B1C1608C7402D869;
 Fri, 16 Apr 2021 12:35:50 -0400 (EDT)
Received: from localhost.localdomain (10.38.63.175) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2106.2; Fri, 16 Apr
 2021 12:35:49 -0400
Subject: Re: [External] Re: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo
 Ideapad S740
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>,
 <alsa-devel@alsa-project.org>, Kailang Yang <kailang@realtek.com>
References: <20210416081211.20059-1-tiwai@suse.de>
 <be178038-8e42-34db-3804-f27240b2d488@perex.cz>
 <a5fee517-c12e-1cb0-755f-453d6bb47795@linux.intel.com>
From: Mark Pearson <markpearson@lenovo.com>
Message-ID: <bde38bb8-599d-9d4b-a515-9c2e12d120ed@lenovo.com>
Date: Fri, 16 Apr 2021 12:35:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <a5fee517-c12e-1cb0-755f-453d6bb47795@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.38.63.175]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Cc: Ryan Prescott <ryan@cousinscomputers.net>
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



On 16/04/2021 12:05, Pierre-Louis Bossart wrote:
> 
> 
> On 4/16/21 3:47 AM, Jaroslav Kysela wrote:
>> Dne 16. 04. 21 v 10:12 Takashi Iwai napsal(a):
>>> Lenovo Ideapad S740 requires quite a few COEF setups to make its
>>> speakers working.  The verb table was provided from Ryan Prescott as
>>> the result of investigation via qemu:
>>>   
>>> https://github.com/ryanprescott/realtek-verb-tools/wiki/How-to-sniff-verbs-from-a-Windows-sound-driver
>>>
>>
>> [Cc: to Kailang / Realtek]
>>
>> I believe that this sequence contains I2C writes to amplifier chips.
>> It would
>> be really helpful, if Realtek can provide more information for the I2C
>> master
>> interface for their codecs (describe basic I2C I/O).
> 
> The biggest problem is to figure what address/value pairs to write with
> I2C into the amplifiers, and here the catch is that those I2C/I2S
> amplifiers may or may not be sourced from Realtek, and it'd be difficult
> for Realtek to provide documentation on their competition, wouldn't it?

Is this something, at least for our platforms, that we (Lenovo) should
be able to give guidance on more easily, perhaps working with the HW vendor?

I know I've had limited joy here previously on our non-Linux certified
platforms, but the more concise and targeted I make the request to the
HW/FW team the more likely I am to get success. Nothing is guaranteed
and if I go in with "audio doesn't work" they'll ignore me, but if I'm
asking for some specific information (which isn't proprietary) I'm more
likely to succeed, especially if it's details that they likely already
have documented. I'm definitely happy to at least try and do that - but
I've had trouble thus far knowing how to frame that request to get the
details needed.

It's been brilliant watching the debug of the S740 and I really want to
take advantage of this work to help out on our systems where we've been
stuck before.

As an aside (and probably this should be a different thread) if anybody
in the audio community would be interested in doing a training session
for the Lenovo Linux team so we can better understand how to make audio
better and contribute let me know. It's such a complicated subsystem and
knowing how everything hooks together, and what needs to be done where,
is something I haven't figured out yet. I believe we'd pay for your time
if that's required - I just need an expert who has the time and interest
to run a session :) The aim would be to get to the stage where we can
contribute and make audio better on our platforms generally - so it
would hopefully be a win-win. If that hit's anybodies interest let me know.

Mark
