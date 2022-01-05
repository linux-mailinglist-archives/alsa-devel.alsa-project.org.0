Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C1C485277
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 13:30:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9458918D0;
	Wed,  5 Jan 2022 13:30:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9458918D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641385855;
	bh=MN7vUCXSMriTsJ8t8ylJSaTen5x8PPPTBUXqiyj5t+4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Njh53Rb4aqoBHcnHkgik745yuCykBjCOWRV80NlPlrGk7L4CnZpeENqGgVC8xi4S6
	 qgD7UhUrwKT/2VctsG08X+mPg+BQ/dhyfpby4ckMIzLqWsLf57B757aTtFvACvvQ73
	 djhGlk0Tdg9/beOLgzZNITTgW7ClxjZpprBzmG/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0135EF8007E;
	Wed,  5 Jan 2022 13:29:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43AD6F801D8; Wed,  5 Jan 2022 13:29:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
 by alsa1.perex.cz (Postfix) with ESMTP id 4F86CF8007E
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 13:29:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F86CF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.b="jvhM0XBk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=QlYCT
 R6UDr5CDBVSQl2bSnVcDalgsUO6BAbkJ+ro+m0=; b=jvhM0XBkZXt0LanB9IZZe
 +DSEZbTprZtHrbDfH5ebRwHZm0P8ajxkrHtirRChooLM10FeniVbYvTMHZUwCe5X
 xZpZClUHgi83acNGQ/yU7SsDzYuRdNXUe6/pkDGfSS+DRSRionVgwUyvOgMrW4PJ
 QvVaNGVe4yo301AWqyGlFQ=
Received: from [192.168.31.101] (unknown [183.194.153.98])
 by smtp10 (Coremail) with SMTP id DsCowADXZQImj9VhELkWGQ--.4490S2;
 Wed, 05 Jan 2022 20:29:27 +0800 (CST)
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Legion Y9000X 2020
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220105034103.12484-1-fbl718@163.com>
 <s5ha6gak2qf.wl-tiwai@suse.de> <YdV5MNWOwgrtH2UC@kroah.com>
 <757a4402-1067-e3c8-8ca3-43ee62047ebe@163.com> <YdWElRjkZ0lybrMJ@kroah.com>
From: Baole Fang <fbl718@163.com>
Message-ID: <6bf35d26-73d4-ba14-f931-8d379c623482@163.com>
Date: Wed, 5 Jan 2022 20:29:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YdWElRjkZ0lybrMJ@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: DsCowADXZQImj9VhELkWGQ--.4490S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw45uFWDCryUuw47Wry7Awb_yoWftwcEyr
 4q9F9rC3WDGFWIyay3JrsI9rWxGFW7ZrZ8ZrW5tr1qqr1UWFWkGFnYkF93Xw4Fqr409FZ8
 Ar1kZFWqywnxZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb-B_UUUUUU==
X-Originating-IP: [183.194.153.98]
X-CM-SenderInfo: 5ieoliqy6rljoofrz/1tbiTRJ-6Vc7U0cIjQABs1
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 Jeremy Szu <jeremy.szu@canonical.com>, Takashi Iwai <tiwai@suse.de>,
 linux-kernel@vger.kernel.org, Elia Devito <eliadevito@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Werner Sembach <wse@tuxedocomputers.com>,
 Hui Wang <hui.wang@canonical.com>, Sami Loone <sami@loone.fi>,
 Cameron Berkenpas <cam@neo-zeon.de>
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

Thank you for your explanation! I shouldn't have written that line and I 
supposed it can be ignored. Is there anything else I could do?

Best Regards,

Baole Fang

On 2022/1/5 下午7:44, Greg Kroah-Hartman wrote:
> On Wed, Jan 05, 2022 at 07:39:33PM +0800, Baole Fang wrote:
>> Sorry, this is my first time to submit patch to Linux, so I'm not quite
>> familiar with the convention. Since I was changing based on v5.15.12 and I
>> saw others mentioning their upstream commit, I included the that commit id.
> Those commits were coming from the stable backports only, they were not
> done by the original author.
>
>> Please forgive me and tell me what is supposed to be done if possible. I
>> still have a lot to learn.
> Please take a look at the "first kernel patch" tutorial on the
> kernelnewbies.org site for a good example of how to do all of this.
>
> Also the Documentation/SubmittingPatches file in the kernel source tree
> should help out.
>
> thanks,
>
> greg k-h

