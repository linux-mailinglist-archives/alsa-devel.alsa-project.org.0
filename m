Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7AD2EA750
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jan 2021 10:30:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8368167C;
	Tue,  5 Jan 2021 10:29:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8368167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609839011;
	bh=1yJhnmKiVwsjkAYbXkA4DzakN/m6LwFsIe9ZqABEu2g=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=okLP3espIihodfZNGL4+OSK0zISJJKWeL1jtPWH/85JS9Wcl0Ze78WAxTCfGZAM6g
	 7O0TR42u0+obuhdYA7b833X8dMbkJEwGvwDP5HRsnFRdq43pRWttkUPN3w1vnG4SL8
	 vDdx88MTKEuFLnXt+Wnvot/uzf3x/s71WR+blIMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15429F80268;
	Tue,  5 Jan 2021 10:28:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8673F80258; Tue,  5 Jan 2021 10:28:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9AD8F8015B
 for <alsa-devel@alsa-project.org>; Tue,  5 Jan 2021 10:28:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9AD8F8015B
Received: from [114.252.213.174] (helo=[192.168.0.106])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1kwidX-0007IS-1s; Tue, 05 Jan 2021 09:28:19 +0000
Subject: Re: [RFC][PATCH v3 1/4] alsa: jack: implement software jack injection
 via debugfs
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
 tiwai@suse.de, kai.vehmanen@linux.intel.com
References: <20201228080003.19127-1-hui.wang@canonical.com>
 <20201228080003.19127-2-hui.wang@canonical.com>
 <c847a7a4-9d2f-7991-811f-756ab7af248c@perex.cz>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <ec1b03b0-fc8d-5e5a-2516-1e1733be618a@canonical.com>
Date: Tue, 5 Jan 2021 17:28:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <c847a7a4-9d2f-7991-811f-756ab7af248c@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 1/4/21 11:04 PM, Jaroslav Kysela wrote:
> Dne 28. 12. 20 v 9:00 Hui Wang napsal(a):
>> We want to perform remote audio auto test, need the audio jack to
>> change from plugout to plugin or vice versa by software ways.
>>
>> Here the design is creating a sound-core root folder in the debugfs
>> dir, and each sound card will create a folder cardN under sound-core,
>> then the sound jack will create folders by jack_ctrl->ctrl->id.name,
>> and will create 2 file nodes jackin_inject and sw_inject_enable in
>> the folder, this is the layout of folder on a machine with 2 sound
>> cards:
>> $tree $debugfs_mount_dir/sound-core
>> sound-core/
>> ├── card0
>> │   ├── HDMI!DP,pcm=10 Jack
>> │   │   ├── jackin_inject
>> │   │   └── sw_inject_enable
>> +	sound_core_debugfs_root = debugfs_create_dir("sound-core", NULL);
> I would just use "sound" directory name here. Why "core" suffix?

OK, will change it to sound.

thx.

>
> 					Jaroslav
>
