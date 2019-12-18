Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7322F1251BD
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 20:22:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11AE8165E;
	Wed, 18 Dec 2019 20:21:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11AE8165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576696956;
	bh=WdU4w+gumhR2BP53Z7oyd2D2nXI2Z41jPM6kvISUzjo=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CXXDidkCdCsH241ZhlXJY4q9rSJo0SB1WoVJNLYW33dNgWdRtgmueeNvcDHpl3HSV
	 r8zdUheweahZSQhUFCo/Bc6z194tZFAD7SZLaSOjga3i2KIK+eg5CtgUsVgLsTjAe6
	 QUtzuD09xPKvEscp2x9Iu4IBsTy5B1+ycTtCWI8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A8E3F8015A;
	Wed, 18 Dec 2019 20:20:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DA33F8022C; Wed, 18 Dec 2019 20:20:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06382F80096
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 20:20:48 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 823E9A003F;
 Wed, 18 Dec 2019 20:20:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 823E9A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1576696846; bh=p4a2WpyEXK5vi6IhNyAKvlcXbXrXTDdamYiFmkWdbyo=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=wrJbYGyzNYuUkI8LLwdoKDCrZwPl+803zAqCLT91NfMcPWhClWCBhgHIh5FeVkqfJ
 BCJFbM5Gu4Tvw8pAQ2IpcWbYETW2R02ICCVCv8OtbalACDmi7qglyWuCTNdLwEu0p6
 pblas3gD91Qo9YBTtNT853564EpdSC44HjdRffY8=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 18 Dec 2019 20:20:44 +0100 (CET)
To: alsa-devel@alsa-project.org, Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <20191201080449.GA408@workstation>
 <b121b3eb-3bb8-7efc-d5e1-f470049899b7@perex.cz>
 <20191214165242.GA32025@workstation>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <a63e0b6b-b1c6-3044-cbd0-7fad47b78f35@perex.cz>
Date: Wed, 18 Dec 2019 20:20:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191214165242.GA32025@workstation>
Content-Language: en-US
Subject: Re: [alsa-devel] Restart alsa-gi project as alsa-gobject project
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 14. 12. 19 v 17:52 Takashi Sakamoto napsal(a):
> Hi Jaroslav,
> 
> On Fri, Dec 13, 2019 at 12:17:12PM +0100, Jaroslav Kysela wrote:
>> Dne 01. 12. 19 v 9:04 Takashi Sakamoto napsal(a):
>>> Hi Jaroslav,
>>>
>>> Since Audio Mini Conference 2018, I continued to work for alsa-gi[1] in
>>> my local to integrate toward better I/O libraries. However I realized
>>> that its basic design includes some disadvantages to produce useful APIs.
>>>
>>> I rethink the design and realize it better to wrap each of structures
>>> in <sound/asound.h> simply. Then, I restart it as alsa-gobject[2].
>>> At present, master branch includes a library, `libalsactl0` for the
>>> most of I/O features in ALSA control interface, which is compatible with
>>> GObject mechanism and GObject introspection.
>>>
>>> Jaroslav, would you please delete the alsa-gi repository and fork
>>> the master branch from my alsa-gobject repository, then apply enough
>>> configurations to the new repository?
>>
>> Hi Takashi,
>>
>> I am sorry that it took so long but I was really busy with other things.
>> The alsa-gobject repository is set, synced with git.alsa-project.org now
>> like other repos. The settings should be similar to alsa-gi, so you should
>> have write permissions. If you hit any issue, just let me know.
>>
>> The original alsa-gi repository was archived and I will remove it later.
>>
>> There is only one difference - I did not clone this repo from yours via
>> github. It might make sense, if you fork the alsa-project repo to your
>> github repository and push your changes back (alsa-project/alsa-gobject ->
>> takaswie/alsa-gobject), so the fork link system on github will be updated
>> properly.
> 
> Thanks for your arrangement against the busy week ;) According to your
> instruction, I update my remote repository for the link system. My
> remote alsa-gi repository is also private now and will be removed enough
> later.
> 
> Here excuse me for request you another work for documentation of
> alsa-gobject. I utilize glib/gobject architecture developed by GNOME
> project for gtk+. Documentation can be automatically generated by
> gtk-doc. I'd like to publish the documentation in github pages[1]. I'd
> like you to add another repository to maintain the publish the
> documentation.
> 
> You can see an actual example of documentation for libhinawa. The
> documentation is available in URL of github.io, and published documents
> are maintained in my remote repository[3].
> 
> But this is not a kind of urgent work. I'm OK that you make it enough
> later ;)

I created the new docs repo:

https://github.com/alsa-project/alsa-gobject-docs

You should have the admin access for this repository, too.

				Thanks,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
