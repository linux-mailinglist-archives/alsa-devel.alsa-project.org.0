Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7512E83DC
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jan 2021 14:31:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5BE016E4;
	Fri,  1 Jan 2021 14:30:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5BE016E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609507879;
	bh=UjWu8CLZ2HSnqGVdJJQT7IUEHGeOBfn9TqbZekXEy50=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JfPsFv38tNOUvz/m9g0SNTyfZgTXwTliGpDdQYt9l4k/QkdxwDBarON/a0rBptJGK
	 mC6Z5dJVDc2IfSFq36TOXcYSdji9ovDqp+2Fxhl/odsEej1qbBPQHn1a4XD2eeW058
	 deScxJgmFJH9EpIhdd0xM7yPPgRnwpC8e2ba421c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C138F8020B;
	Fri,  1 Jan 2021 14:29:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31352F801F5; Fri,  1 Jan 2021 14:29:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A717F8012B
 for <alsa-devel@alsa-project.org>; Fri,  1 Jan 2021 14:29:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A717F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="Ekvvqifv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=p93aNNvhU3n4M9Mfq+lqHMlddP0IlMPVC2h2Kfg4gW0=; b=Ekvvqifv5Au8Uod8NsAacj0l4w
 8UaKeh2taOmY/NnV4nSyu8rDujovu8XeAk+lpFK9Zmf4JjiFNhKrM5RrtKQtfO2koiHAk/36Z+oRs
 r8DDmKxayAC1Eu9mXwWdl/Qjgz4xZHT5aI0AG0zJhBOCO71IP0q3gn+cGExh4iGcOy54Ybi/MdQ+R
 A6SQpbHBjOvItUkVARHy9TL2h92yedtAUIErN8jI03Uy0muNFzLbv7f1t+uzjlDGL8Z7SN/MrCegZ
 5wT5k/FCYa23Zt8rytd1ffAsCJo0wCz+XbU6wVwyXzJDf2I6GfSG0lbt0+budI39ZKIJSU82yfenb
 96wge6aA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1kvKUn-000EiX-NA; Fri, 01 Jan 2021 14:29:33 +0100
Received: from [2001:a61:2bd0:3301:9e5c:8eff:fe01:8578]
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1kvKUn-00098p-IU; Fri, 01 Jan 2021 14:29:33 +0100
Subject: Re: Haswell audio no longer working with new Catpt driver
To: Christian Labisch <clnetbox@gmail.com>, Takashi Iwai <tiwai@suse.de>
References: <8b005c64fe129fc2a283da90b2949b1fcb42e8c2.camel@gmail.com>
 <1ad341b1b0e0eefb83d157ac24d162eaad53ab32.camel@gmail.com>
 <0111f282-f044-47ed-f93e-5a19de61bdce@metafoo.de>
 <088cd3b6ba6589266e316d6adcb76861edd18775.camel@gmail.com>
 <s5h1rf4c10a.wl-tiwai@suse.de>
 <1f5c37af35419358a8d7f22544490088675b2c3f.camel@gmail.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <3dcc3129-aee5-0eea-0307-4eba7f03c0d6@metafoo.de>
Date: Fri, 1 Jan 2021 14:29:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1f5c37af35419358a8d7f22544490088675b2c3f.camel@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26034/Thu Dec 31 13:42:27 2020)
Cc: gregkh@linuxfoundation.org,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, amadeuszx.slawinski@linux.intel.com
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



On 1/1/21 2:25 PM, Christian Labisch wrote:
> Hi Takashi,
>
> Thanks for your suggestion - unfortunately it does not work.
> Still no sound after adding the boot parameter and a reboot.

Can you run `cat /sys/module/snd_hda_intel/parameters/power_save` and 
check whether it is still 0 when the system is running?

>
> Regards,
> Christian
>
> On Fri, 2021-01-01 at 13:09 +0100, Takashi Iwai wrote:
>> On Fri, 01 Jan 2021 12:10:23 +0100,
>> Christian Labisch wrote:
>>> Hi Lars,
>>>
>>> Thanks for your response, as requested I ran alsa-info while playing audio.
>>> Please check the attached information - to me it looks like it being a bug.
>>> It should affect many users, will it be solved in the next release 5.10.5 ?
>> It's likely some runtime PM-related changes that caused this behavior
>> change.  But, there must be some program that sets the power_save
>> option explicitly on your system.  As dmesg shows, the default
>> power_save to this device has been suppressed, but it's activated by
>> the later action.  On, 5.9.x, this didn't take effect, but on 5.10.x,
>> this became effective, as it seems.
>>
>> You can try to pass power_save=0 option to snd-hda-intel module (or
>> boot with snd_hda_intel.power_save=0 boot option).  It could work
>> around the issue, although it's no solution.
>>
>>
>> thanks,
>>
>> Takashi


