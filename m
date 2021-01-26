Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A30303703
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jan 2021 08:05:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CAE617BC;
	Tue, 26 Jan 2021 08:04:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CAE617BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611644728;
	bh=kWxYIOzn35+JCITLkQxtYfh7LbXPz0o8UGWJweVjZr8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sdv1++3PCRR1Ja+dyXv/PpauBbVaCOTYSIxkdoHOKG1DB3Msqazq892JRMcPfc+gs
	 MP8OK8HFUH209uIszKp+Co7nsyAkE8p1ywWmx0w0vONvqiGqcvCdc66TY/sFz1S7EI
	 vVjNlyZlldTxyozpFrn0cnXWR7cX+cDNYncKisIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77E80F801D8;
	Tue, 26 Jan 2021 08:03:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEF75F8015B; Tue, 26 Jan 2021 08:03:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5158AF80108
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 08:03:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5158AF80108
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=[192.168.1.24]) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1l4IOE-0002EU-I8; Tue, 26 Jan 2021 07:03:51 +0000
Subject: Re: [PATCH v7 1/1] alsa: jack: implement software jack injection via
 debugfs
To: Takashi Iwai <tiwai@suse.de>
References: <20210125032118.13269-1-hui.wang@canonical.com>
 <20210125032118.13269-2-hui.wang@canonical.com>
 <s5ha6sx3x5i.wl-tiwai@suse.de>
 <ecb8450b-c7be-52ff-e6f2-876c2177cb21@canonical.com>
 <s5h8s8g2ni7.wl-tiwai@suse.de>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <c4edce1e-371e-6e07-b5b5-b17ee7cad68a@canonical.com>
Date: Tue, 26 Jan 2021 15:03:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <s5h8s8g2ni7.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com
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


On 1/26/21 2:58 PM, Takashi Iwai wrote:
> On Tue, 26 Jan 2021 07:55:29 +0100,
> Hui Wang wrote:
>>
>> On 1/25/21 10:32 PM, Takashi Iwai wrote:
>>> On Mon, 25 Jan 2021 04:21:18 +0100,
>>> Hui Wang wrote:
>>>> This change adds audio jack injection feature through debugfs, with
>>>> this feature, we could validate alsa userspace changes by injecting
>>>> plugin or plugout events to the non-phantom audio jacks.
>>>>
>>>> With this change, the sound core will build the folders
>>>> $debugfs_mount_dir/sound/cardN if SND_DEBUG and DEBUG_FS are enabled.
>> <snip>
>>>> +		return -ENOMEM;
>>>> +
>>>> +	/* replace the chars which are not suitable for folder's name with _ */
>>>> +	for (i = 0; i < strlen(tname); i++)
>>> No need to use strlen(), just check the NUL character on tname[i].
>> OK, will change it to:     for (i = 0; tname[i] != '\0'; i++)
> Even the "!= '\0" part can be dropped, too :)
>
>    for (i = 0; tname[i]; i++)
>      ....

OK, got it.

thx.

>
>
> Takashi
