Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A4B4851F2
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 12:40:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3168C18A0;
	Wed,  5 Jan 2022 12:40:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3168C18A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641382850;
	bh=+c3BG38hp4hi51uzqJxhBZIyq/+GcrI0Vvd8BBildxc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vdUo+Yyvc5y9XioPpwxnTAUI5CTDv3XLkRgd5KcHC+KeAwZtpw8F/LIpoLg53BXOX
	 MOpOsH9EbvtyXkRLyNB2XY8QyJssfoCUgEvCXFmp5C5xycRt8YCdb1/X8lDtt+Wgqp
	 nEo9hFxMbIDPKI11/6yjUQpL8TX64v/oy1L9C6/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92BDAF8020C;
	Wed,  5 Jan 2022 12:39:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC821F801D8; Wed,  5 Jan 2022 12:39:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
 by alsa1.perex.cz (Postfix) with ESMTP id 0D7C9F80089
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 12:39:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D7C9F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.b="lQAXCfiD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=50E5P
 fEps/AfLktgJnd6K+0Rx0UsvbbOTVRSINxFENk=; b=lQAXCfiD6c0tSihnwmMfn
 VjIpLyDj+16vaZayPuASxuCLQlZKz52kGWQRis/CmXOwTN3x0naX2FzZ10X6SHt5
 Y7N+MSu0Ead214qIe6EM7KXnVCCDAWvtp9Yy+7xz63xAHZLR+dP2baXXIw3A/gGa
 AmJYtMmB6b4iKYzps6NXLY=
Received: from [192.168.31.101] (unknown [183.194.153.98])
 by smtp10 (Coremail) with SMTP id DsCowABXNsZ1g9Vh4MoPGQ--.2421S2;
 Wed, 05 Jan 2022 19:39:34 +0800 (CST)
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Legion Y9000X 2020
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.de>
References: <20220105034103.12484-1-fbl718@163.com>
 <s5ha6gak2qf.wl-tiwai@suse.de> <YdV5MNWOwgrtH2UC@kroah.com>
From: Baole Fang <fbl718@163.com>
Message-ID: <757a4402-1067-e3c8-8ca3-43ee62047ebe@163.com>
Date: Wed, 5 Jan 2022 19:39:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YdV5MNWOwgrtH2UC@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: DsCowABXNsZ1g9Vh4MoPGQ--.2421S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw4ruFy5XF4ruw15CF1xKrg_yoW8Jw1fpa
 40y3WSkFs8JrWfCw1Iy3ZYvFy5Gan3JFWFqF1rt345AFZ0yr4fWr4fKw4a9F9rW340yay5
 XF1DKFy3tw1DuaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U6E_iUUUUU=
X-Originating-IP: [183.194.153.98]
X-CM-SenderInfo: 5ieoliqy6rljoofrz/1tbipRJ-6VUMihC3AgAAsX
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 Jeremy Szu <jeremy.szu@canonical.com>, linux-kernel@vger.kernel.org,
 Elia Devito <eliadevito@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Werner Sembach <wse@tuxedocomputers.com>, Hui Wang <hui.wang@canonical.com>,
 Sami Loone <sami@loone.fi>, Cameron Berkenpas <cam@neo-zeon.de>
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

Sorry, this is my first time to submit patch to Linux, so I'm not quite 
familiar with the convention. Since I was changing based on v5.15.12 and 
I saw others mentioning their upstream commit, I included the that 
commit id.

Please forgive me and tell me what is supposed to be done if possible. I 
still have a lot to learn.

Best Regards,

Baole Fang

On 2022/1/5 下午6:55, Greg Kroah-Hartman wrote:
> On Wed, Jan 05, 2022 at 09:26:16AM +0100, Takashi Iwai wrote:
>> On Wed, 05 Jan 2022 04:41:01 +0100,
>> Baole Fang wrote:
>>> commit 25960cafa06e6fcd830e6c792e6a7de68c1e25ed upstream.
>> I couldn't find this commit.  Is this a bogus information?
>>
>>> Legion Y9000X 2020 has a speaker, but the speaker doesn't work.
>>> This can be fixed by applying alc285_fixup_ideapad_s740_coef
>>>   to fix the speaker's coefficients.
>>> Besides, to support the transition between the speaker and the headphone,
>>> alc287_fixup_legion_15imhg05_speakers needs to be run.
>>>
>>> Signed-off-by: Baole Fang <fbl718@163.com>
>> The code change itself looks fine, so I'd apply it if the line above
>> can be omitted.
> That commit id comes from 5.15.12, and it is the commit id of the
> release commit:
> 	25960cafa06e ("Linux 5.15.12")
> which makes no sense at all.
>
> Baole, why did you add this line?
>
> confused,
>
> greg k-h

